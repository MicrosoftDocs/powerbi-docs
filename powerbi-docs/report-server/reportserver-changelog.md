---
title: Changelog for Power BI Report Server
description: This change log is for Power BI Report Server and lists new items along with bug fixes for each released build.
services: powerbi
documentationcenter: ''
author: jtarquino
manager: jonhp
backup: asaxton
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 09/19/2017
ms.author: jaimeta

---
# Changelog for Power BI Report Server
This change log is for Power BI Report Server and lists new items along with bug fixes for each released build.

For detailed information about new features, see [What's new in Power BI Report Server](reportserver-whats-new.md).

## October 2017
* **Power BI Report Server**
  * *Version 1.1.6514.9163 (Build 14.0.600.434), Released: November 1, 2017*
    * Bug Fixes
      * Fix for upload reliability problems for PBIX reports over 500MB
      * Fix for data loading issue for PBIX reports over 1GB
  * *Version 1.1.6513.3500 (Build 14.0.600.433), Released: October 31, 2017*
    * Features
      * Embedded Data Model Support
      * Excel Workbook Viewing (with Office Online Server integration enabled)
      * Scheduled Data Refresh (PBIX)
      * Direct Query Support
      * Large File Support (up to 2 GB)
      * Public REST API
        * Shared Dataset support in Power BI Desktop (via oData)
      * URL Parameter Support for PBIX files
      * Accessibility improvements
* **Power BI Desktop (optimized for Power BI Report Server)**
  * *Version: 2.51.4885.1041 (October 2017), Released: October 31, 2017*
    * Contains changes required for connection with Power BI Report Server (October 2017)

## June 2017
* **Power BI Report Server**
  
  * *Build 14.0.600.305, Released: September 19, 2017*  
    
    * Bug Fixes
      * Update to the latest [Bing Maps Web Control](https://msdn.microsoft.com/library/mt712542.aspx)
  * *Build 14.0.600.301, Released: July 11, 2017*
    
    * Bug Fixes
      * The {{UserId}} tag resolves to the stored credentials instead of the user executing the report in Power BI Reports
      * Some images fail to render in Power BI Report Server reports
      * Unable to change the name of a Power BI Report in the Power BI Report Server
      * Unable to load Custom Visuals in the Power BI mobile application (it requires reinstall of the mobile app to clear up the local cache)
  * *Build 14.0.600.271,Released: June 12, 2017*
    
    * Power BI Report Server initial release

## Next steps
[User handbook](reportserver-user-handbook-overview.md)  
[Administrator handbook](admin-handbook-overview.md)  
[Quickstart: Install Power BI Report Server](reportserver-quickstart-install-report-server.md)  
[Install Report Builder](https://docs.microsoft.com/sql/reporting-services/install-windows/install-report-builder)  
[Download SQL Server Data Tools (SSDT)](http://go.microsoft.com/fwlink/?LinkID=616714)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

