---
title: Changelog for Power BI Report Server
description: This change log is for Power BI Report Server and lists new items along with bug fixes for each released build.
services: powerbi
documentationcenter: ''
author: jtarquino
manager: jonhp
backup: maggies
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 12/11/2017
ms.author: tankas
---
# Changelog for Power BI Report Server

This change log is for Power BI Report Server and lists new items along with bug fixes for each released build.

## March 2018
- **Power BI Report Server**
    - *Version ?1.2.6645.42113 (Build 15.0.2.373)?, Released: March ?31?, 2018*
        - Features
            - Please see [What's new in Power BI Report Server](whats-new.md)
        - Security Updates
        - Accessibility Improvements
        - Bug fixes
            - For Paginated Reports (RDL), fix for parameters visibility in a linked report that is reverted after editing its properties
            - Fix for web portal with custom forms authentication that is ignoring the sliding expiration cookie
            - Fix for export to Word that creates unequal row height if row content is empty
            - For Paginated Reports (RDL), fix for expression based connection string that is deleted when we change credential for data source
            - Fix for ability to use KPI with text values
            - For Paginated Report (RDL), fix for ability to assign a new dataset to an existing Paginated Report (RDL)
            - Other stability and usability fixes

- **Power BI Desktop (optimized for Power BI Report Server)**
    - Version: ?2.56.5023.1001? (March 2018), Released: March ?31?, 2018
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
            - The {{UserId}} tag resolves to the stored credentials instead of the user executing the report in Power BI Reports
            - Some images fail to render in Power BI Report Server reports
            - Unable to change the name of a Power BI Report in the Power BI Report Server
            - Unable to load Custom Visuals in the Power BI mobile application (it requires reinstall of the mobile app to clear up the local cache)

    - *Build 14.0.600.271,Released: June 12, 2017*
        - Power BI Report Server initial release

- **Power BI Desktop (optimized for Power BI Report Server)**
    - *Version: 2.47.4766.4901 (June 2017), Released: January 10, 2018*
        - Security Updates

## Next steps

[User handbook](user-handbook-overview.md)  
[Administrator handbook](admin-handbook-overview.md)  
[Quickstart: Install Power BI Report Server](quickstart-install-report-server.md)  
[Install Report Builder](https://docs.microsoft.com/sql/reporting-services/install-windows/install-report-builder)  
[Download SQL Server Data Tools (SSDT)](http://go.microsoft.com/fwlink/?LinkID=616714)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)