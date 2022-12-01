---
title: Power BI Report Builder change log
description: In this article, you learn about new features and functionality in Power BI paginated reports for the Power BI service.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 11/22/2022
---

# Power BI Report Builder change log

[!INCLUDE [applies-yes-paginated-yes-service-no-desktop](../includes/applies-yes-paginated-yes-service-no-desktop.md)] 

Learn about new items, bug fixes, and known issues for each release of Power BI Report Builder. We update this article with each new release. For news about the rest of Power BI, see [What's New in Power BI](../fundamentals/desktop-latest-update.md).

Ready to get started? [Install Power BI Report Builder](https://go.microsoft.com/fwlink/?linkid=2086513) from the Microsoft Download Center.

## November 2022

Version 15.7.1801.18, released November 22, 2022

### Features

- Added tool version metadata to generated RDL file.
	
Version 15.7.1800.11, released November 2, 2022

### Bug fixes

- Fixed issue where Report Builder becomes unresponsive if left open for longer periods of time.
- Fixed accessibility issues.

## August 2022
	
Version 15.7.1799.16, released August 18, 2022

### Features

- Added new telemetry endpoints.
- Updated versions of some utilized open-source software projects.

### Bug fixes 
	
- Fixed several accessibility issues across the application.
- Fixed issue where parameters could get duplicated.

## July 2022
	
Version 15.7.1798.91, released July 18, 2022
	
### Bug fixes 
	
- Fixed several localization issues with strings only displaying in English.
- Fixed issue related to 407 proxy authentication.
- Fixed issue related to parameter formulas when validating query.
- Fixed issue where Report Builder would close saving a report.
- Fixed issue where there is an extra border around Report Builder in some versions of Windows.

## April 2022

Version 15.7.1797.84, released April 13, 2022

### Features

- All supported languages are now included in the installer. Language is selected based on current Windows locale setting.
 
### Bug fixes 

- Accessibility fixes mostly focused on better Microsoft Narrator support.
- Minor telemetry changes.

## December 2021 

Version 15.7.01796.0001, released December 13, 2021 

### Features

- Updated authentication library used to communicate with Power BI service.

### Bug fixes 

- Fixed accessibility issues in various parts of Power BI Report Builder.

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

- Moved to 64-bit architecture for enhanced memory limits and other performance gains. Note: Previously installed third-party data providers may need to be updated to their x64 bit versions.
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

- [What are paginated reports in Power BI?](paginated-reports-report-builder-power-bi.md)  
- [Tutorial: Create a paginated report and upload it to the Power BI service](paginated-reports-quickstart-aw.md)
- [Publish a paginated report to the Power BI service](paginated-reports-save-to-power-bi-service.md)
