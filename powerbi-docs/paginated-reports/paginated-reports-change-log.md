---
title: Power BI Report Builder change log
description: In this article, you learn about new features and functionality in Power BI paginated reports for the Power BI service.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 10/07/2021
---

# Power BI Report Builder change log

[!INCLUDE [applies-yes-paginated-yes-service-no-desktop](../includes/applies-yes-paginated-yes-service-no-desktop.md)] 

Learn about new items, bug fixes, and known issues for each release of Power BI Report Builder. We update this article with each new release. For news about the rest of Power BI, see [What's New in Power BI](../fundamentals/desktop-latest-update.md).

Ready to get started? [Install Power BI Report Builder](https://go.microsoft.com/fwlink/?linkid=2086513) from the Microsoft Download Center.

## October 2021 

Version 15.7.01740.0001, released October 7, 2021 

### Features

- ODBC is no longer in preview. Strings have been updated to reflect this.


## September 2021 

Version 15.7.01704.0001, released September 1, 2021 

### Bug fixes 

- Fixed connectivity issue to Power BI service for some users.
- Fixed issue when maximizing Report Builder on different resolution screens.
- Fixed issue previewing reports in some cases.
 
## August 2021 

Version 15.7.01678.0001, released August 6, 2021 

### Bug fixes 

- Various accessibility fixes related to keyboard shortcuts and screen reading tools.

### Features

- Moved to 64 bit architecture for enhanced memory limits and other performance gains. Note: Previously installed third-party data providers may need to be updated to their x64 bit versions.
- Enhanced support for DAX DateTime parameters.

## June 2021 

Version 15.6.01628.0002, released June 17, 2021 

### Bug fixes 

- Various accessibility fixes related to keyboard shortcuts and screen reading tools.

### Features

- Added new data tab which enables users to easily connect to all the most popular data sources when creating your paginated reports. 
- Streamlined DAX copy/paste allowing these actions in the dataset without connecting to the model.
- Added support for SSO for both SQL Server and Oracle data sources through the Power BI Enterprise Gateway.

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

- Enabled new authentication type support for Azure SQL DB and Azure Synapse. It uses Azure Active Directory (Azure AD) Multi-Factor Authentication (MFA) to align with the Power BI service.
- Enabled connectivity to Dataverse through the SQL data connection. This connectivity supports the use of the native relational query designer for SQL. 
- Enabled auto expansion of parameter drop-down to support even the largest item in the list. 
- Enabled better support for multi-value parameter for DAX. 

### Other 

See the September 2020 Power BI Report Builder blog post for the complete list of new and updated features.

## Next steps 

- [What are paginated reports in Power BI Premium?](paginated-reports-report-builder-power-bi.md)  
- [Tutorial: Create a paginated report and upload it to the Power BI service](paginated-reports-quickstart-aw.md)
- [Publish a paginated report to the Power BI service](paginated-reports-save-to-power-bi-service.md)
