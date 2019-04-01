---
title: Changelog for Power BI Report Server
description: This change log is for Power BI Report Server and lists new items along with bug fixes for each released build.
ms.author: jtarquino
author: jtarquino
manager: kfile
ms.reviewer: maggies
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 03/31/2018
---

# Changelog for Power BI Report Server

This change log is for Power BI Report Server and lists new items along with bug fixes for each released build.

For detailed information about new features, see [What's new in Power BI Report Server](whats-new.md). 

## January 2019

- **Power BI Report Server**          
    - *Version 1.4.7024.12330 (Build 15.0.1102.299), Released: March 28, 2019*
        - Bug Fixes
            - Power BI Reports
                - Fix for issue with basic credentials when using direct query for SAP Hana and SAP BW
                - Fix for OData feed data refresh fails with "Could not load file or assembly 'Microsoft.OData.Core.NetFX35.V7"

- **Power BI Report Server**            
    - *Version 1.4.6969.7395 (Build 15.0.1102.235), Released: January 30, 2019*
        - Bug Fixes
            - Power BI Reports
                - Fix for issue with basic credentials when using direct query
                - Fix for bidirectional relationships with row-level security filters applied
                - Fix for stale data after a model refresh in a scale-out environment
                - Fix for double scrollbar for table/ matrix on Firefox 63+
                - Fix for +/- icon size in Internet Explorer
            - Paginated Reports
                - Fix for issue with updating usage of a shared datasource for a report

    - *Version 1.4.6960.38798 (Build 15.0.1102.222), Released: January 22, 2019*
        - Features
            - Power BI Reports 
                - Support for Row-level security
                - Expand and collapse on matrix row headers
                - Copy and paste between .pbix files
                - Smart alignment guides
                - Support for SAP BW 2.0 Connector
            - Administrators
                - Ability to restrict extensions of resources that can be uploaded to the report server
                - Ability to restrict supported hyperlink schemes
            - Programmability
                - New Web API: /PowerBIReports({Id})/DataModelRoles (GET)
                - New Web API: /PowerBIReports({Id})/DataModelRoleAssignments (GET & PUT)
                - See [Power BI Report Server REST API](https://app.swaggerhub.com/apis/microsoft-rs/PBIRS/2.0) for more details
        - Bug Fixes
            - HTML Injection Vulnerability
            - Export to PDF is not showing Euro symbol
            - Saving a password with multiple data sources in Power BI reports invalidates non changed passwords
            - Visuals display issues in Power BI Mobile App after being idle

- **Power BI Desktop (optimized for Power BI Report Server)**
    - *Version: 2.65.5313.1562 (January 2019), Released: January 30, 2019*
        - Shortcut and pinned icons remain after uninstalling Power BI Report Server
        - Fix for pinning Power BI Report Server to start menu giving black text on a black icon

    - *Version: 2.65.5313.1421 (January 2019), Released: January 22, 2019*
        - Contains changes required for connection with Power BI Report Server (January 2019)  

## August 2018

- **Power BI Report Server**
    - *Version 1.3.6816.37243 (Build 15.0.2.557), Released: August 30, 2018*
        - Bug fixes
            - Fixed an issue when server was upgraded from earlier versions of PBI Report Server where a binding redirect was not updated, customers saw this :      
            *`
            Failed to load expression host assembly. Details: Could not load file or assembly 'Microsoft.ReportingServices.ProcessingObjectModel, Version=2018.7.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91' or one of its dependencies. The located assembly's manifest definition does not match the assembly reference. (Exception from HRESULT: 0x80131040) (rsErrorLoadingExprHostAssembly)
             `*
             
            - Bug for Data Label Transparency is now fixed.
            
    - *Version 1.3.6801.38816 (Build 15.0.2.540), Released: August 15, 2018*
        - Features
            - SAP HANA SSO Direct Query support with Kerberos now available for Power BI Reports
            - Custom Visual API shipped with release  - version 1.13.0
            - Custom visuals will fall back to a previous version compatible with the current version of the server API (if available)

- **Power BI Desktop (optimized for Power BI Report Server)**
    - *Version: 2.61.5192.641 (August 2018), Released: August 15, 2018*
        - Contains changes required for connection with Power BI Report Server (August 2018)         
        
## March 2018

- **Power BI Report Server**
    - *Version 1.2.6690.34729 (Build 15.0.2.402), Released: April 27, 2018*
        - Bug fixes
            - Enable migration of SQL Server Reporting Services 2017 catalogs
            - For Power BI Reports (PBIX)
                - Reports can be refresh when a server is configured to use custom authentication
                - Modifying the properties of a report does not reset data source credentials
            - For Paginated Reports (RDL)
                - Usage of `Lookup()` or derivative functions such as `LookupSet()` and `MultiLookup()` in RDL Expressions no longer result in `#Error`
                - Linked reports respect the page size of the target report when printing
                - Subscriptions can be created for linked reports that use cascading parameters
                - Multi-value parameter defaults can be modified when using IE11
                - Data-driven subscription delivery options are editable
                - Subscriptions can be viewed and edited while the subscription is executing
                - Setting data source credentials does not remove expression-based connection strings
            - For KPIs
                - Trend lines are refreshed when data is updated
            - General stability improvements

    - *Version 1.2.6660.39920 (Build 15.0.2.389), Released: March 28, 2018*
        - Bug fixes
            - For Power BI Reports (PBIX), fix for Export Data not working from Power BI Visuals
            - For Power BI Reports (PBIX), fix for URL filters not working
            - For Paginated Reports (RDL), fix for images not being displayed correctly in IE11 after upgrading to Power BI Report Server March release

    - *Version 1.2.6648.38132 (Build 15.0.2.378), Released: March 19, 2018*
        - Security Updates
        - Accessibility Improvements
        - Bug fixes
            - For Paginated Reports (RDL), fix for parameters visibility in a linked report that is reverted after editing its properties
            - Fix for web portal with custom forms authentication that is ignoring the sliding expiration cookie
            - Fix for export to Word that creates unequal row height if row content is empty
            - For Paginated Reports (RDL), fix for expression based connection string that is deleted when we change credential for data source
            - Fix for ability to use KPI with text values
            - For Paginated Reports (RDL), fix for ability to assign a new dataset to an existing Paginated Report (RDL)
            - Other stability and usability fixes

- **Power BI Desktop (optimized for Power BI Report Server)**
    - Version: 2.56.5023.1043 (March 2018), Released: March 19, 2018
        - Contains changes required for connection with Power BI Report Server (March 2018)

## October 2017

- **Power BI Report Server**
    - *Version 1.1.6582.41691 (Build 14.0.600.442), Released: January 10, 2018*
        - Security Updates
        - Bug Fixes
            - Fix for Model.GetParameters returning 400
            - Fix for setting shared data set to existing Paginated Reports (RDL)
            - Fix for ExecutionNotFoundException when exporting report with different parameter values to PDF

    - *Version 1.1.6551.5155 (Build 14.0.600.438), Released: December 11, 2017*
        - Bug Fixes
            - Failure to save data after refreshing for certain Power BI Desktop reports.

    - *Version 1.1.6530.30789 (Build 14.0.600.437), Released: November 17, 2017*
        - Bug Fixes
            - Fix for Basic Authentication Scenarios 
            - Fix for weekdays were not selectable on schedule page for Subscriptions, Cache Refresh Plans and History Snapshots on Portal
            - For Paginated Reports (RDL), fix for having expressions in Textbox with CanGrow property set to false is resulting in values not showing colors and fonts not being proper
            - For Power BI Reports (PBIX), fix for adding Legends to line chart renders an empty visual

    - *Version 1.1.6514.9163 (Build 14.0.600.434), Released: November 1, 2017*
        - Bug Fixes
            - Fix for upload reliability problems for PBIX reports over 500MB
            - Fix for data loading issue for PBIX reports over 1GB

    - *Version 1.1.6513.3500 (Build 14.0.600.433), Released: October 31, 2017*
        - Features
            - Embedded Data Model Support
            - Excel Workbook Viewing (with Office Online Server integration enabled)
            - Scheduled Data Refresh (PBIX)
            - Direct Query Support
            - Large File Support (up to 2 GB)
            - Public REST API
            - Shared Dataset support in Power BI Desktop (via oData)
            - URL Parameter Support for PBIX files
            - Accessibility improvements

- **Power BI Desktop (optimized for Power BI Report Server)**
    - *Version: 2.51.4885.3981 (October 2017), Released: April 10, 2018*
        - Security Updates

    - *Version: 2.51.4885.2501 (October 2017), Released: January 10, 2018*
        - Security Updates

    - *Version: 2.51.4885.1423 (October 2017), Released: November 17, 2017*
        - Bug Fixes
            - Fix for 32-bit Power BI Desktop failing to run on x86 OS
            - For Power BI Reports (PBIX), fix to show x-axis gridlines
            - Other minor bug fixes

    - *Version: 2.51.4885.1041 (October 2017), Released: October 31, 2017*
        - Features
            - Contains changes required for connection with Power BI Report Server (October 2017)

## June 2017

- **Power BI Report Server**
    - *Build 14.0.600.309, Released: January 10, 2018*
        - Security Updates

    - *Build 14.0.600.305, Released: September 19, 2017*  
        - Bug Fixes
            - Update to the latest [Bing Maps Web Control](https://msdn.microsoft.com/library/mt712542.aspx)

    - *Build 14.0.600.301, Released: July 11, 2017*
        - Bug Fixes
            - The `{{UserId}}` tag resolves to the stored credentials instead of the user executing the report in Power BI Reports
            - Some images fail to render in Power BI Report Server reports
            - Unable to change the name of a Power BI Report in the Power BI Report Server
            - Unable to load Custom Visuals in the Power BI mobile application (it requires reinstall of the mobile app to clear up the local cache)

    - *Build 14.0.600.271,Released: June 12, 2017*
        - Power BI Report Server initial release

- **Power BI Desktop (optimized for Power BI Report Server)**
    - *Version: 2.47.4766.4901 (June 2017), Released: January 10, 2018*
        - Security Updates

## Next steps

[What is Power BI Report Server?](get-started.md)
[Administrator overview](admin-handbook-overview.md)  
[Install Power BI Report Server](install-report-server.md)  
[Download Report Builder](https://www.microsoft.com/download/details.aspx?id=53613)  
[Download SQL Server Data Tools (SSDT)](http://go.microsoft.com/fwlink/?LinkID=616714)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
