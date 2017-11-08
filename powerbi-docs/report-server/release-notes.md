---
title: Power BI Report Server release notes
description: This topic describes limitations and issues with Power BI Report Server.
services: powerbi
documentationcenter: ''
author: guyinacube
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 11/01/2017
ms.author: asaxton

---
# Power BI Report Server release notes
This topic describes limitations and issues with Power BI Report Server.

To download Power BI Report Server, and Power BI Desktop optimized for Power BI Report Server, go to [On-premises reporting with Power BI Report Server](https://powerbi.microsoft.com/report-server/).

## October 2017
* Support for imported data in Power BI reports
* Ability to view excel workbooks within the web portal. This is done by configuring Office Online Server.
* Support for the new Power BI table and matrix visuals.
* REST API support

## June 2017
* No new items for June 2017.

## May 2017
* Power BI reports must be created with Power BI Desktop optimized for Power BI Report Server in order to work with Power BI Report Server. You can download Power BI Desktop from the download link at the top of this page.
* Power BI Reports only support live connections to Analysis Services (tabular or multidimensional).
* No support for R visuals.

**Issue and customer impact:** If you have both SQL Server Reporting Services and Power BI Report Server on the same machine and uninstall one of them, you will no longer be able to connect to the remaining report server with Report Server Configuration Manager.

**Workaround** To work around this issue, you must perform the following operations after uninstalling one of the servers.

1. Launch a command prompt in Administrator mode.
2. Go to the directory where the remaining report server is installed.
   
    *Default location for Power BI Report Server: C:\Program Files\Microsoft Power BI Report Server*
   
    *Default location for SQL Server Reporting Services: C:\Program Files\Microsoft SQL Server Reporting Services*
3. Then go to the next folder. This will either be *SSRS* or *PBIRS* depending on what is remaining.
4. Go to the WMI folder.
5. Run the following command:
   
    ```
    regsvr32 /i ReportingServicesWMIProvider.dll
    ```
   
    You can ignore the following error, if you see it.
   
    ```
    The module "ReportingServicesWMIProvider.dll" was loaded but the entry-point DLLInstall was not found. Make sure that "ReportingServicesWMIProvider.dll" is a valid DLL or OCX file and then try again.
    ```

## Next steps
[What's new in Power BI Report Server](whats-new.md)  
[User handbook](reportserver-user-handbook-overview.md)  
[Administrator handbook](admin-handbook-overview.md)  
[Quickstart: Install Power BI Report Server](quickstart-install-report-server.md)  
[Install Report Builder](https://docs.microsoft.com/sql/reporting-services/install-windows/install-report-builder)  
[Download SQL Server Data Tools (SSDT)](http://go.microsoft.com/fwlink/?LinkID=616714)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

