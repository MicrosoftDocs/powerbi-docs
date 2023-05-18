---
title: "Saving reports (Power BI Report Builder) | Microsoft Docs"
description: In Power BI Report Builder, you can save the definition of a report, which includes the layout but not the data. The data is refreshed every time you run the report.
ms.date: 05/15/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Saving reports (Power BI Report Builder)
  In Power BI Report Builder you can save a paginated report to Power BI Services, SharePoint library, file share where you have write permission, or your computer. 
  
When you save a report, what you are really saving is the report definition, which describes the report layout. You are not saving the data. Every time you run the report, the report data is refreshed and is likely to be different than the previous time you ran the report.  
  
 If you want to save the report to a different format or save the report definition with the data, use one of the following Power BI Services features:  
  
-   Export a rendered report to a different file format such as comma separated files (CSV) or Excel workbooks and save the report in that format. You can also generate data feeds from reports and save the report data.  
  
-   Create report subscriptions to deliver and save reports to a file share.  
  
-   Use report history to save versions of rendered reports as historical copies.  
  
 To learn more about viewing and managing reports directly on the report server, see [Finding, Viewing, and Managing Reports &#40;Power BI Report Builder &#41;](/sql/reporting-services/report-builder/finding-viewing-and-managing-reports-report-builder-and-ssrs). 
  
##  <a name="SavingReportDefinitions"></a> Saving Reports to Power BI Services  
  Saving a report to Power BI Services is also known as publishing a report. Although you can save reports to your computer, saving reports to a report server offers many advantages:  
  
-   Reports become available to others who have permission to access the folder in which you saved the report.  
  
-   Reports can be managed and viewed on the Power BI Services web portal.  
  
-   Report resources such as data sources, images, and subreports are stored in one place for easier access.  
  
-   Reports can be delivered to others by subscriptions.  
  
-   Reports are securely stored in the report server database.  
  
-   Report runs can be logged and provide performance and auditing information.  
  
##  <a name="ExportingAndSavingReports"></a> Exporting and saving reports  
 If you have a small number of reports to archive, consider exporting a report and saving it as a file. After you export a report to an application (such as PDF or Excel), you can save it as a file and place it in a protected shared directory on the network. Alternatively, you can upload a saved PDF or Excel file as a resource item if you want to keep all copies of a report, regardless of the format, in the report server database. For more information about exporting a report, see [Export reports &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-builder/export-reports-report-builder-and-ssrs) and [Upload a File or Report](/sql/reporting-services/reports/upload-a-file-or-report-report-manager).  
  
##  <a name="UsingFileShareDelivery"></a> Using file share delivery  
 If you have a large number of reports to archive, create a subscription that delivers the report directly to the file system. For this approach, you must create a subscription for each report, choose a shared folder to store the reports, and define a schedule that determines when the file is created. Once you define a subscription, the report server can run the report unattended and add report files to the archive using the schedule that you provide. You can also create single-use schedules if you want to archive reports on an occasional basis. For more information about subscriptions and file share delivery, see [File share delivery in reporting services](/sql/reporting-services/subscriptions/file-share-delivery-in-reporting-services).  
  
##  <a name="HowTo"></a> How-To topics  
  
-   [Save Reports to a Report Server &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-builder/save-reports-to-a-report-server-report-builder)  
  
-   [Save a Report to a SharePoint Library &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-builder/save-a-report-to-a-sharepoint-library-report-builder)  
   
## Next steps  
 [Reports, Report Parts, and Report Definitions &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/reports-report-parts-and-report-definitions-report-builder-and-ssrs)     
 [Finding, Viewing, and Managing Reports &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-builder/finding-viewing-and-managing-reports-report-builder-and-ssrs)   
 [Export Reports &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-builder/export-reports-report-builder-and-ssrs)   
 [Print Reports &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-builder/print-reports-report-builder-and-ssrs)  
  
  
