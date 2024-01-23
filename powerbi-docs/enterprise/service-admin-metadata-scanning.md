---
title: Metadata scanning
description: Learn how to scan your organization's workspaces to get metadata about your organization's Power BI data assets.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.date: 03/14/2023
LocalizationGroup: Administration
---

# Metadata scanning

Metadata scanning facilitates governance over your organization's Power BI data by making it possible to quickly catalog and report on all the metadata of your organization's Power BI artifacts. It accomplishes this using a set of Admin REST APIs that are collectively known as the *scanner APIs*.

With the scanner APIs, you can extract information such as artifact name, owner, sensitivity label, endorsement status, and last refresh. For semantic models, you can also extract the metadata of some of the objects they contain, such as table and column names, measures, DAX expressions, mashup queries, and so forth. The metadata of these semantic model internal objects is referred to as subartifact metadata.

For a more extensive list of the artifact and subartifact metadata that metadata scanning returns, see the [documentation for the Admin - WorkspaceInfo GetScanResult API](/rest/api/power-bi/admin/workspace-info-get-scan-result).

The following are the scanner APIs. They support both public and sovereign clouds.

* [GetModifiedWorkspaces](/rest/api/power-bi/admin/workspace-info-get-modified-workspaces)
* [WorkspaceGetInfo](/rest/api/power-bi/admin/workspace-info-post-workspace-info)
* [WorkspaceScanStatus](/rest/api/power-bi/admin/workspace-info-get-scan-status)
* [WorkspaceScanResult](/rest/api/power-bi/admin/workspace-info-get-scan-result)

Before metadata scanning can be run, a Power BI admin needs to set it up. To learn how to set up metadata scanning, see [Setting up metadata scanning in an organization](../admin/service-admin-metadata-scanning-setup.md).

> [!IMPORTANT]
> The app you develop for scanning can authenticate by using either a standard delegated admin access token or a service principal. The two authentication paths are mutually exclusive. **When running under a service principal, there must be no Power BI admin-consent-required permissions set on your app**. For more information, see [Enable service principal authentication for read-only admin APIs](./read-only-apis-service-principal-authentication.md).

## Run metadata scanning

The following short walkthrough shows how to use the scanner APIs to retrieve metadata from your organizations artifacts. It assumes that a Power BI admin has set up metadata scanning in your organization.

### Step 1: Perform a full scan

Call [workspaces/modified](/rest/api/power-bi/admin/workspace-info-get-modified-workspaces) without the **modifiedSince** parameter to get the complete list of workspace IDs in the tenant. This scan retrieves all the workspaces in the tenant, including personal workspaces and shared workspaces. If you wish to exclude personal workspaces from the scan, use the *workspaces/modified* **excludePersonalWorkspaces** parameter.

Divide the list into chunks of 100 workspaces at most.

For each chunk of 100 workspaces:

Call [workspaces/getInfo](/rest/api/power-bi/admin/workspace-info-post-workspace-info) to trigger a scan call for these 100 workspaces. You'll receive the scanId in the response to use in the next steps. In the location header, you'll also receive the Uniform Resource Identifier (URI) to call for the next step.

>[!NOTE]
> Not more than 16 calls can be made simultaneously. The caller should wait for a scan succeed/failed response from the *scanStatus* API before invoking another call.
>
> If some metadata you expected to receive is not returned, check with your Power BI admin to make sure they have [enabled all relevant admin switches](../admin/service-admin-metadata-scanning-setup.md).

Use the URI from the location header you received from calling *workspaces/getInfo* and poll on [workspaces/scanStatus/{scan_id}](/rest/api/power-bi/admin/workspace-info-get-scan-status) until the status returned is "Succeeded". This status means the scan result is ready. It's recommended to use a polling interval of 30-60 seconds. In the location header, you also receive the URI to call in the next step. Use it only after the status is "Succeeded".

Use the URI from the location header you received from calling *workspaces/scanStatus/{scan-id}* and read the data using [workspaces/scanResult/{scan_id}](/rest/api/power-bi/admin/workspace-info-get-scan-result). The data contains the list of workspaces, artifact info, and other metadata based on the parameters passed in the *workspaces/getInfo* call.

### Step 2: Perform an incremental scan

Now that you have all the workspaces and the metadata and lineage of their assets, it's recommended that you perform only incremental scans that reference the previous scan that you did.

Call [workspaces/modified](/rest/api/power-bi/admin/workspace-info-get-modified-workspaces) with the **modifiedSince** parameter set to the start time of the last scan in order to get the workspaces that have changed, and which therefore require another scan. The **modifiedSince** parameter should be set for a date within the last 30 days.

Divide this list into chunks of up to 100 workspaces, and get the data for these changed workspaces by using the three API calls, [workspaces/getInfo](/rest/api/power-bi/admin/workspace-info-post-workspace-info), [workspaces/scanStatus/{scan_id}](/rest/api/power-bi/admin/workspace-info-get-scan-status), and [workspaces/scanResult/{scan_id}](/rest/api/power-bi/admin/workspace-info-get-scan-result), as described in Step 1.

## Considerations and limitations

* Semantic models that haven't been refreshed or republished will be returned in API responses but without their subartifact information and expressions. For example, semantic model name and lineage are included in the response, but not the semantic model's table and column names.
* Semantic models containing only **DirectQuery** tables will return subartifact metadata only if some sort of action has been taken on the semantic model, such as someone building a report on top of it, someone viewing a report based on it, etc.
* [Real-time datasets](../connect-data/service-real-time-streaming.md), semantic models with [object-level security](https://powerbi.microsoft.com/blog/object-level-security-ols-is-now-generally-available-in-power-bi-premium-and-pro/), semantic models with a live connection to *AS-Azure* and *AS on-premises*, and Excel full fidelity datasets aren't supported for subartifact metadata. For unsupported datasets, the response returns the reason for not getting the subartifact metadata from the dataset. It's found in a field named **schemaRetrievalError**, for example, **schemaRetrievalError: Unsupported request. RealTime dataset are not supported**.
* The API doesn't return subartifact metadata for semantic models that are larger than 1 GB in shared workspaces. In Premium workspaces, there's no size limitation on semantic models.

## Licensing

Metadata scanning requires no special license. It works for all of your tenant metadata, including that of artifacts located in non-Premium workspaces.

## Related content

* Learn about [Power BI REST Admin APIs](/rest/api/power-bi/admin).
* [Set up metadata scanning](../admin/service-admin-metadata-scanning-setup.md).
* [Enable service principal authentication for read-only admin APIs](read-only-apis-service-principal-authentication.md).
* More questions? Ask the [Power BI Community](https://community.powerbi.com).