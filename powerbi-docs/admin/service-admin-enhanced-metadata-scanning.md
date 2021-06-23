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
•	High granularity search - for instance, you can find a dataset by searching for a measure.
•	Viewing the DAX expressions for any measure or calculated column.
•	Detailed lineage - for instance, being able to retrieve the mashup query associated with each dataset table, you can see which columns in which datasets a column in a SQL table is connected to.

Enhanced metadata scanning facilitates governance over your organization's data in Power BI by making it possible to quickly catalog and report on all the metadata from your organization’s datasets.

Enhanced metadata scanning uses a caching mechanism in order to lessen its impact on capacity resources. See [Impact on capacity resources](#impact-on-capacity-resources) for detail.

To be available for use, enhanced metadata scanning must be enabled for the organization by a Power BI admin. See [Enabling enhanced metadata scanning](#enabling-enhanced-metadata-scanning)

## Using enhanced metadata scanning

## Enabling enhanced metadata scanning

To provide some control over security, two Admin API tenant settings enable and control what kind of detailed low-level metadata will be included scanner API responses.
* **Enhance admin APIs responses with detailed metadata**: This setting turns on the caching flow and enhances API responses with low-level metadata (e.g. name, description) for tables, columns, and measures.
* **Enhance admin APIs responses with DAX and mashup expressions**: This setting allows the API response to include DAX expressions and Mashup queries. This setting can only be enabled if the first setting is also enabled.

To enable these settings, go to **Admin portal > Tenant settings > Admin API settings**. 

[Screen shot of enhanced metadata scanning tenant settings.](media/service-admin-enhanced-metadata-scanning/enhanced-metadata-scanning-enable.png)

## Impact on capacity resources

## Next steps

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
