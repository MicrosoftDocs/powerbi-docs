---
title: Set up metadata scanning in an organization
description: Learn about how to set up and enable metadata scanning in your organization.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.date: 08/18/2021
LocalizationGroup: Administration
---

# Set up metadata scanning in your organization

Before metadata scanning can be run over an organization's Power BI workspaces, it must be set up by a Power BI administrator. Setting up metadata scanning involves two steps.

* Enabling service principal authentication for read-only admin APIs.
* Enabling tenant settings for detailed dataset metadata scanning.
 
## Enable service principal authentication for read-only admin APIs

Service principal is an authentication method that can be used to let an Azure AD application access Power BI APIs. With this authentication method, you don’t have to maintain a service account with an admin role. Rather, to allow your app to use the Admin APIs, you just have to give your approval once as part of the tenant settings configuration.

To see how to enable service principal access to read-only Admin APIs, see [Enable service principal authentication for read-only admin APIs](read-only-apis-service-principal-authentication.md).

If you don't want to enable service principal authentication, metadata scanning can be performed with standard delegated admin access token authentication.

## Enable tenant settings for metadata scanning 

Two tenant settings control metadata scanning:

* **Enhance admin APIs responses with detailed metadata**: This setting turns on [Model caching](#model-caching) and enhances API responses with low-level dataset metadata (for example, name and description) for tables, columns, and measures.
* **Enhance admin APIs responses with DAX and mashup expressions**: This setting allows the API response to include DAX expressions and Mashup queries. This setting can only be enabled if the first setting is also enabled.

To enable these settings, go to **Admin portal > Tenant settings > Admin API settings**.

![Screen shot of tenant settings for enhanced metadata scanning.](media/service-admin-metadata-scanning-setup/enhanced-metadata-scanning-enable.png)
 
### Model caching

Enhanced metadata scanning uses a caching mechanism to ensure that **capacity resources are not impacted**.
Getting low-level metadata requires that the model be available in memory. To make sure Power BI shared or Premium capacity resources are not impacted by having to load the model for every API call, the enhanced metadata scanning feature leverages successful dataset refreshes and republishing by creating a cache of the model that is loaded into memory on those occasions. Then, when enhanced metadata scanning takes place, API calls are made against the cached model. No load is placed on your capacity resources due to enhanced metadata scanning.

Caching happens every successful dataset refresh and republish only if the following conditions are met:
* The **Enhance Admin APIs responses with detailed metadata** admin tenant setting is enabled (see [Enable tenant settings for metadata scanning](#enable-tenant-settings-for-metadata-scanning)).
* There has been a call to the scanner APIs within the last 90 days.

If the detailed low-level metadata requested is not in the cache, it is simply not returned. High-level metadata, such as dataset name, is always returned, even if the low-level detail is not available.

## Next steps

* [Enable service principal authentication for read-only admin APIs](read-only-apis-service-principal-authentication.md)
* [Metadata scanning](service-admin-metadata-scanning.md)
* [Power BI REST Admin APIs](/rest/api/power-bi/admin)
* More questions? Try asking the [Power BI Community](https://community.powerbi.com)