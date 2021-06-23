---
title: Enhanced metadata scanning
description: Learn about how to scan to get detailed, low-level metadata about your organization's Power BI data assets.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-eim
ms.topic: concept
ms.date: 06/23/2021
LocalizationGroup: Administration
---

# Enhanced metadata scanning

Scanner APIs are a set of Admin REST APIs used for extracting high-level metadata about the artifacts in your organization. This high-level metadata includes such things as artifact name, sensitivity, endorsement status, etc. Enhanced metadata scanning is a feature that enables you to get more detailed, granular, lower-level information, such as the names of dataset tables and columns, measures, DAX expressions, and mashup queries.

Here are some examples of what enhanced metadata scanning makes possible:
* High granularity search: For instance, you can find a dataset by searching for a measure.
* Viewing the DAX expressions for any measure or calculated column.
* Detailed lineage: For instance, being able to retrieve the mashup query associated with each dataset table, you can see which columns in which datasets a column in a SQL table is connected to.

Enhanced metadata scanning facilitates governance over your organization's data in Power BI. It makes it possible to quickly catalog and report on all the metadata from your organization’s datasets.

Enhanced metadata scanning uses a caching mechanism in order to lessen its impact on capacity resources. See [Impact on capacity resources](#impact-on-capacity-resources) for detail.

To be available for use, enhanced metadata scanning must be enabled for the organization by a Power BI admin. See [Enabling enhanced metadata scanning](#enabling-enhanced-metadata-scanning)

## Using enhanced metadata scanning

The following short walkthrough shows how to 

* [GetModifiedWorkspaces](/rest/api/power-bi/admin/workspaceinfo_getmodifiedworkspaces.md)
* [WorkspaceGetInfo](/rest/api/power-bi/admin/workspaceinfo_postworkspaceinfo.md)
* [WorkspaceScanStatus](/rest/api/power-bi/admin/workspaceinfo_getscanstatus.md)
* [WorkspaceScanResult](/rest/api/power-bi/admin/workspaceinfo_getscanresult.md)

### Step 1: Determine authentication method

Before you start, decide which authentication method you’re going to use with the APIs. You can use either the Power BI service Admin delegated token, or the [Service Principal support for read-only Admin APIs](read-only-apis-service-principal-authentication.md).

### Step 2: Perform a full scan.

Call **workspaces/modified** without **modifiedSince** to get the complete list of workspace IDs in the tenant. This retrieves all the workspaces in the tenant, including classic workspaces, personal workspaces, and new workspaces.

Divide the list into chunks of 100 workspaces at most.

For each chunk of 100 workspaces:

Call **workspaces/getInfo** to trigger a scan call for these 100 workspaces. You will receive the scanId in the response to use in the next steps. In the location header you’ll also receive the URI to call for the next step. The URI supports the following additional parameters, which can be added in the query string (the default for the four parameters is false):

|Parameter  |Description  |
|---------|---------|
|lineage=true               |Receive the lineage info for all artifacts returned.|
|datasourceDetails=true     |Receive data source details for datasets and dataflows.|
|datasetSchema=true         |Receive the dataset’s tables, columns and measures.|
|datasetExpressions=true    |Receive the measures, calculated column expressions, and mashup query associated with each table. You can get dataset expressions only if both datasetSchema and datasetExpressions are set to true.|

Use the URI from the location header you received in step 1 and poll on **workspaces/scanStatus/{scan_id}** until the status returned is “Succeeded”. This means the scan result is ready. It is recommended to use a polling interval of 30-60 seconds. In the location header you’ll also receive the URI to call in the next step. Use it only once the status is “Succeeded”.

Use the URI from the location header your received in Step 2, and read the data using **workspaces/scanResult/{scan_id}**. The data contains the list of workspaces, artifact info, and additional metadata based on the parameters passed in Step 1.

### Perform an incremental scan.

Now that you have all the workspaces and the metadata and lineage of their assets, it’s recommended that you perform only incremental scans that reference the previous scan that you did.

Call **workspaces/modified** with **modifiedSince** set to the start time of the last scan in order to get the workspaces that have changed and which therefore require another scan. The modifiedSince parameter should be set for a date within the last 30 days.

Divide this list into chunks of up to 100 workspaces, and get the data for these changed workspaces using the three API calls as described in Step 2.

## Enabling enhanced metadata scanning

To provide some control over security, two Admin API tenant settings enable and control what kind of detailed low-level metadata will be included scanner API responses.
* **Enhance admin APIs responses with detailed metadata**: This setting turns on the caching flow and enhances API responses with low-level metadata (e.g. name, description) for tables, columns, and measures.
* **Enhance admin APIs responses with DAX and mashup expressions**: This setting allows the API response to include DAX expressions and Mashup queries. This setting can only be enabled if the first setting is also enabled.

To enable these settings, go to **Admin portal > Tenant settings > Admin API settings**. 

![Screen shot of enhanced metadata scanning tenant settings.](media/service-admin-enhanced-metadata-scanning/enhanced-metadata-scanning-enable.png)

## Impact on capacity resources

Enhanced metadata scanning uses a caching mechanism to ensure that **capacity resources are not impacted**.
 
Getting low-level metadata requires that the model be available in memory. To make sure Power BI shared or Premium capacity resources are not adversely impacted by having to load the model for every API call, the enhanced metadata scanning feature leverages successful dataset refreshes and republishing by creating a cache of the model that is loaded into memory on those occasions. Then, when enhanced metadata scanning takes place, API calls are made against the cached model. This limits the load on your capacity resources.

Caching happens every successful dataset refresh and re-publish only if the following conditions are met:
* The **Enhance Admin APIs responses with detailed metadata** admin tenant setting is enabled (see [Enabling enhanced metadata scanning](#enabling-enhanced-metadata-scanning)).
* There has been a call to the scanner APIs within the last 90 days.

If the detailed low-level metadata requested is not in the cache, it is simply not returned. High-level metadata, such as dataset name, is always returned, even if the low-level detail is not available.

## ConsiderationsSpecial notes and unsupported models

* Datasets that have not been refreshed or re-published will be returned in API responses but without their detailed low-level information and expressions. For example, you will see dataset name and lineage in the response, but not the dataset’s table and column names.
* The caching flow is based on refresh and re-publish events. Because of this, datasets that are not being re-published and that have only DirectQuery-based tables that don’t use the regular refresh flow in the Power BI service, will not trigger a caching flow, and the enhanced metadata about these datasets will not be returned.
* Real time datasets, datasets with Object Level Security, datasets with a live connection to AS-Azure and AS on-prem, and Excel full fidelity datasets are not supported for detailed metadata. For unsupported datasets, the response returns the reason for not getting the detailed metadata about the dataset. It is found in a field named *schemaRetrievalError*, for example, *schemaRetrievalError: Unsupported request for RealTime model*.

## Licensing
Enhanced metadata scanning requires no special license. It works for all of your tenant metadata including that of artifacts located in non-Premium workspaces.

## Next steps

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
