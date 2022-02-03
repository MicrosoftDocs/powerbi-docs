---
title: Metadata scanning
description: Learn about how to scan your organizations workspaces to get metadata about your organization's Power BI data assets.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.date: 10/03/2021
LocalizationGroup: Administration
---

# Metadata scanning

Metadata scanning facilitates governance over your organization's Power BI data by making it possible to quickly catalog and report on all the metadata of your organization's Power BI artifacts. It accomplishes this using a set of Admin REST APIs that are collectively known as the scanner APIs. With the scanner APIs, you can extract both general information such as artifact name, owner, sensitivity label, endorsement status, and last refresh, as well as more detailed metadata such as dataset table and column names, measures, DAX expressions, mashup queries, etc.

The following are the scanner APIs. They support both public and sovereign clouds.

* [GetModifiedWorkspaces](/rest/api/power-bi/admin/workspace-info-get-modified-workspaces)
* [WorkspaceGetInfo](/rest/api/power-bi/admin/workspace-info-post-workspace-info)
* [WorkspaceScanStatus](/rest/api/power-bi/admin/workspace-info-get-scan-status)
* [WorkspaceScanResult](/rest/api/power-bi/admin/workspace-info-get-scan-result)

Before metadata scanning can be run, a Power BI admin needs to set it up. See [Setting up metadata scanning in an organization](service-admin-metadata-scanning-setup.md).

## Run metadata scanning

The following short walkthrough shows how to use the scanner APIs to retrieve metadata from your organizations artifacts. It assumes that a Power BI admin has set up metadata scanning in your organization.

### Step 1: Perform a full scan

Call [workspaces/modified](/rest/api/power-bi/admin/workspace-info-get-modified-workspaces) without the **modifiedSince** parameter to get the complete list of workspace IDs in the tenant. This retrieves all the workspaces in the tenant, including classic workspaces, personal workspaces, and new workspaces. If you wish to exclude personal workspaces from the scan, use the workspaces/modified **excludePersonalWorkspaces** parameter.

Divide the list into chunks of 100 workspaces at most.

For each chunk of 100 workspaces:

Call [workspaces/getInfo](/rest/api/power-bi/admin/workspace-info-post-workspace-info) to trigger a scan call for these 100 workspaces. You will receive the scanId in the response to use in the next steps. In the location header, you’ll also receive the URI to call for the next step.

>[!NOTE]
> Not more than 16 calls can be made simultaneously. The caller should wait for a scan succeed/failed response from the scanStatus API before invoking another call.
>
> If some metadata you expected to receive is not returned, check with your Power BI admin to make sure they have [enabled all relevant admin switches](service-admin-metadata-scanning-setup.md).

Use the URI from the location header you received from calling workspaces/getInfo and poll on [workspaces/scanStatus/{scan_id}](/rest/api/power-bi/admin/workspace-info-get-scan-status) until the status returned is "Succeeded". This means the scan result is ready. It is recommended to use a polling interval of 30-60 seconds. In the location header, you’ll also receive the URI to call in the next step. Use it only once the status is "Succeeded".

Use the URI from the location header you received from calling workspaces/scanStatus/{scan-id} and read the data using [workspaces/scanResult/{scan_id}](/rest/api/power-bi/admin/workspace-info-get-scan-result). The data contains the list of workspaces, artifact info, and other metadata based on the parameters passed in the workspaces/getInfo call.

### Step 2: Perform an incremental scan

Now that you have all the workspaces and the metadata and lineage of their assets, it's recommended that you perform only incremental scans that reference the previous scan that you did.

Call [workspaces/modified](/rest/api/power-bi/admin/workspace-info-get-modified-workspaces) with the **modifiedSince** parameter set to the start time of the last scan in order to get the workspaces that have changed and which therefore require another scan. The modifiedSince parameter should be set for a date within the last 30 days.

Divide this list into chunks of up to 100 workspaces, and get the data for these changed workspaces using the three API calls, [workspaces/getInfo](/rest/api/power-bi/admin/workspace-info-post-workspace-info), [workspaces/scanStatus/{scan_id}](/rest/api/power-bi/admin/workspace-info-get-scan-status), and [workspaces/scanResult/{scan_id}](/rest/api/power-bi/admin/workspace-info-get-scan-result), as described in Step 1 above.

## Considerations and limitations

* Datasets that have not been refreshed or republished will be returned in API responses but without their detailed low-level information and expressions. For example, you will see dataset name and lineage in the response, but not the dataset's table and column names.
* Datasets containing only DirectQuery tables will return low-level details only if they have been republished since enhanced metadata scanning has been enabled. This is because DirectQuery datasets don't use the regular Power BI dataset refresh flow that triggers caching. If, however, a dataset also contains tables that use import mode, caching takes place upon dataset refresh as described above, and it is not necessary for the dataset to be republished in order to for low-level details to be returned.
* [Real time datasets](../connect-data/service-real-time-streaming.md), datasets with [Object Level Security](https://powerbi.microsoft.com/blog/object-level-security-ols-is-now-generally-available-in-power-bi-premium-and-pro/), datasets with a live connection to AS-Azure and AS on-prem, and Excel full fidelity datasets are not supported for detailed metadata. For unsupported datasets, the response returns the reason for not getting the detailed metadata about the dataset. It is found in a field named *schemaRetrievalError*, for example, *schemaRetrievalError: Unsupported request for RealTime model*.
* The API doesn't return sub-artifact metadata for datasets that are larger than 1GB in shared workspaces. For Premium workspaces there is no size limitation.

## Licensing

Metadata scanning requires no special license. It works for all of your tenant metadata, including that of artifacts that are located in non-Premium workspaces.

## Next steps

* [Power BI REST Admin APIs](/rest/api/power-bi/admin)
* [Set up metadata scanning](service-admin-metadata-scanning-setup.md)
* [Enable service principal authentication for read-only admin APIs](read-only-apis-service-principal-authentication.md)
* More questions? Try asking the [Power BI Community](https://community.powerbi.com)