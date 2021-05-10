---
title: Power BI Report Builder change log
description: In this article, you learn about new features and functionality in Power BI paginated reports for the Power BI service.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 01/27/2021
---

# Power BI Report Builder change log

[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-service](../includes/yes-service.md)] [!INCLUDE [yes-paginated](../includes/yes-paginated.md)] [!INCLUDE [yes-premium](../includes/yes-premium.md)] [!INCLUDE [no-desktop](../includes/no-desktop.md)] 

Learn about new items, bug fixes, and known issues for each release of Power BI Report Builder. We update this article with each new release. For news about the rest of Power BI, see [What's New in Power BI](../fundamentals/desktop-latest-update.md).

Ready to get started? [Install Power BI Report Builder](https://go.microsoft.com/fwlink/?linkid=2086513) from the Microsoft Download Center.

## January 2021 

Version 15.6.01487.0002, released January 26, 2021 

### Bug fixes 

- Changed the name Common Data Service to Dataverse. 

### Features

- Enabled an improved experience to publish to the service to align with the Power BI service. 
- Added new Power BI Report Builder and Premium per user icons to create brand consistency and bring a modern, full color experience.

### Known issues

- Error when connecting to the workspace through XMLA endpoint when workspace name contains plus sign (+).  

### Other 
See the January 2021 Power BI Report Builder blog post for the complete list of new and updated features.

## September 2020 

Version 15.6.01340.0002, released September 3, 2020 

### Bug fixes

- Fixed tracing to better understand issues related to PBI service integration, as well as client side. 
- Fixed the connection string to not have an affinity to a cluster. 

### Features

- Enabled new authentication type support for Azure SQL DB and Azure Synapse. It uses Azure AD Multi-Factor Authentication to align with the Power BI service.
- Enabled connectivity to Dataverse through the SQL data connection. This connectivity supports the use of the native relational query designer for SQL. 
- Enabled auto expansion of parameter drop-down to support even the largest item in the list. 
- Enabled better support for multi-value parameter for DAX. 

### Other 

See the September 2020 Power BI Report Builder blog post for the complete list of new and updated features.

## Next steps 

- [What are paginated reports in Power BI Premium?](paginated-reports-report-builder-power-bi.md)  
- [Tutorial: Create a paginated report and upload it to the Power BI service](paginated-reports-quickstart-aw.md)
- [Publish a paginated report to the Power BI service](paginated-reports-save-to-power-bi-service.md)
