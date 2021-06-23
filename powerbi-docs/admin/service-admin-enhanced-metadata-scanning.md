---
title: Enhanced metadata scanning
description: Learn about how to scan to get detailed, low-level metadata about your organization's Power BI data assets.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
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

Enhanced metadata scanning uses a caching mechanism to ensure that capacity resources are not impacted. See [Model caching](#model-caching) for detail.

To be available for use, enhanced metadata scanning must be enabled for the organization by a Power BI admin. See [Enabling enhanced metadata scanning](#enabling-enhanced-metadata-scanning)

## Using enhanced metadata scanning

The following short walkthrough shows how to 

* [GetModifiedWorkspaces](/rest/api/power-bi/admin/workspace-info-get-modified-workspaces.md)
* [WorkspaceGetInfo](/rest/api/power-bi/admin/workspace-info-post-workspace-info.md)
* [WorkspaceScanStatus](/rest/api/power-bi/admin/workspace-info-get-scan-status.md)
* [WorkspaceScanResult](/rest/api/power-bi/admin/workspace-info-get-scan-result.md)

### Step 1: Determine authentication method

Before you start, decide which authentication method you’re going to use with the APIs. You can use either the Power BI service Admin delegated token, or the [Service Principal support for read-only Admin APIs](read-only-apis-service-principal-authentication.md).

### Step 2: Perform a full scan

Call **workspaces/modified** without **modifiedSince** to get the complete list of workspace IDs in the tenant. This retrieves all the workspaces in the tenant, including classic workspaces, personal workspaces, and new workspaces.

Divide the list into chunks of 100 workspaces at most.

For each chunk of 100 workspaces:

Call **workspaces/getInfo** to trigger a scan call for these 100 workspaces. You will receive the scanId in the response to use in the next steps. In the location header, you’ll also receive the URI to call for the next step. The URI supports the following additional parameters, which can be added in the query string (the default for all four parameters is false). The parameters **datasetSchema** and **datasetExpressions** are the parameters that return the detailed, low-level dataset metadata.

|Parameter  |Description  |
|---------|---------|
|lineage=true               |Receive the lineage info for all artifacts returned.|
|datasourceDetails=true     |Receive data source details for datasets and dataflows.|
|datasetSchema=true         |Receive the dataset’s tables, columns, and measures.|
|datasetExpressions=true    |Receive the measures, calculated column expressions, and mashup query associated with each table. You can get dataset expressions only if both datasetSchema and datasetExpressions are set to true.|

Use the URI from the location header you received from calling workspaces/getInfo and poll on **workspaces/scanStatus/{scan_id}** until the status returned is “Succeeded”. This means the scan result is ready. It is recommended to use a polling interval of 30-60 seconds. In the location header, you’ll also receive the URI to call in the next step. Use it only once the status is “Succeeded”.

Use the URI from the location header your received from calling workspaces/scanStatus/{scan-id} and read the data using **workspaces/scanResult/{scan_id}**. The data contains the list of workspaces, artifact info, and other metadata based on the parameters passed in the workspaces/getInfo call.

### Perform an incremental scan

Now that you have all the workspaces and the metadata and lineage of their assets, it’s recommended that you perform only incremental scans that reference the previous scan that you did.

Call **workspaces/modified** with **modifiedSince** set to the start time of the last scan in order to get the workspaces that have changed and which therefore require another scan. The modifiedSince parameter should be set for a date within the last 30 days.

Divide this list into chunks of up to 100 workspaces, and get the data for these changed workspaces using the three API calls, **workspaces/getInfo**, **workspaces/scanStatus/{scan_id}**, and **workspaces/scanResult/{scan_id}**, as described in Step 2 above.

## Enabling enhanced metadata scanning

To provide some control over privacy, two Admin API tenant settings enable and control what kind of detailed low-level metadata will be included scanner API responses.
* **Enhance admin APIs responses with detailed metadata**: This setting turns on the caching flow and enhances API responses with low-level metadata (for example, name and description) for tables, columns, and measures.
* **Enhance admin APIs responses with DAX and mashup expressions**: This setting allows the API response to include DAX expressions and Mashup queries. This setting can only be enabled if the first setting is also enabled.

To enable these settings, go to **Admin portal > Tenant settings > Admin API settings**. 

![Screen shot of enhanced metadata scanning tenant settings.](media/service-admin-enhanced-metadata-scanning/enhanced-metadata-scanning-enable.png)

## Model caching

Enhanced metadata scanning uses a caching mechanism to ensure that **capacity resources are not impacted**.
 
Getting low-level metadata requires that the model be available in memory. To make sure Power BI shared or Premium capacity resources are not impacted by having to load the model for every API call, the enhanced metadata scanning feature leverages successful dataset refreshes and republishing by creating a cache of the model that is loaded into memory on those occasions. Then, when enhanced metadata scanning takes place, API calls are made against the cached model. No load is placed on your capacity resources due to enhanced metadata scanning.

Caching happens every successful dataset refresh and republish only if the following conditions are met:
* The **Enhance Admin APIs responses with detailed metadata** admin tenant setting is enabled (see [Enabling enhanced metadata scanning](#enabling-enhanced-metadata-scanning)).
* There has been a call to the scanner APIs within the last 90 days.

If the detailed low-level metadata requested is not in the cache, it is simply not returned. High-level metadata, such as dataset name, is always returned, even if the low-level detail is not available.

## Considerations and limitations

* Datasets that have not been refreshed or republished will be returned in API responses but without their detailed low-level information and expressions. For example, you will see dataset name and lineage in the response, but not the dataset’s table and column names.
* •	Datasets containing only DirectQuery tables will return low-level details only if they have been republished since enhanced metadata scanning has been enabled. This is because DirectQuery datasets don't use the regular Power BI dataset refresh flow that triggers caching. If, however, a dataset also contains tables that use import mode, caching takes place upon dataset refresh as described above, and it is not necessary for the dataset to be republished in order to for low-level details to be returned.
* [Real time datasets](/connect-data/service-real-time-streaming.md), datasets with [Object Level Security](https://powerbi.microsoft.com/en-us/blog/object-level-security-ols-is-now-generally-available-in-power-bi-premium-and-pro/), [datasets with a live connection to AS-Azure and AS on-prem](/connect-data/desktop-analysis-services-tabular-data.md), and [Excel full fidelity datasets](/connect-data/service-excel-workbook-files#import-excel-data-into-power-bi.md) are not supported for detailed metadata. For unsupported datasets, the response returns the reason for not getting the detailed metadata about the dataset. It is found in a field named *schemaRetrievalError*, for example, *schemaRetrievalError: Unsupported request for RealTime model*.

## Licensing
Enhanced metadata scanning requires no special license. It works for all of your tenant metadata including that of artifacts located in non-Premium workspaces.

## Next steps

* [Power BI REST Admin APIs](/rest/api/power-bi/admin.md)
* [Enable service principal authentication for read-only admin APIs (preview)](read-only-apis-service-principal-authentication.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
