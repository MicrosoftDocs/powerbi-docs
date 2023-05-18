---
title: "Find, view, & manage reports (Power BI Report Builder ) | Microsoft Docs"
description: In Power BI Report Builder, you can browse to find Power BI paginated reports, shared data sources, models, and other related report items.
ms.date: 05/15/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Finding, viewing, and managing reports (Power BI Report Builder)
  In Power BI Report Builder, you can browse folders online or SharePoint site to find paginated reports, shared data sources, models, and other related report items. To make it easier to find reports, Power BI Report Builder maintains a list of recently used servers and sites and provides direct access to the Desktop and My Computer folders in the file system of your computer.
  
  Reports can be previewed in Power BI Report Builder when you create or update reports and viewed and managed online by using the web portal or on a SharePoint site that is integrated with Power BI Services by using the built-in SharePoint tools and features after you publish the reports. For more information, see [Previewing Reports in Power BI Report Builder](/sql/reporting-services/report-builder/previewing-reports-in-report-builder).
  
 When you preview reports in Power BI Report Builder, or view reports in the web portal or a SharePoint site, the data is refreshed and the reports display the current data from the data source that the report uses. If you want to view a report without refreshing its data, you can use report history and cached data with published reports. You cannot use these features when previewing reports in Power BI Report Builder.  
  
  
##  <a name="FindingAndViewingReportsRB30"></a> Finding and viewing reports in Power BI Report Builder  
 
 To find a report that you want to work with or to select a shared data source, image, or subreport to use in a report, browse your computer, folders online, or SharePoint site integrated with Power BI Services.

 To find reports online, you must specify a URL for the report and have the appropriate permissions on the folders that enable you to read and save report items. Ask the system administrator for the report for the appropriate URL and permissions.  
  
 After you find and open the report in Power BI Report Builder, you can preview it and make changes. When you preview it, you see the current data. For more information, see [Previewing Reports in Power BI Report Builder](/sql/reporting-services/report-builder/previewing-reports-in-report-builder).  
  
 Report Builder can help you with the following tasks:  
  
-   **Finding reports** When you browse for a report, you can use the familiar Microsoft Office-style **Open File** dialog box that is customized for Power BI Report Builder. You can browse the folders online or on a file system, including My Reports, Sites and Servers, Desktop, My Documents, My Computer. Sites and Servers provides a recently used server list.  
  
-   **Finding shared data sources** When you browse for a shared data source, you can pick from a recently used list, or browse to another folder online.  
  
-   **Viewing reports** You preview a report in Power BI Report Builder when creating or updating reports. Power BI Report Builder loads and processes the report online; otherwise, the reports are processed locally. The report viewer in Power BI Report Builder displays the rendered report.  
  
 
##  <a name="ViewingAndManagingReportServer"></a> Viewing and managing reports online  
 You use the web portal to view and manage reports online. Browse the folders online to locate reports, run reports, to view them in a browser, and perform management tasks.  
  
 The web portal can help you with the following management tasks:  
  
-   View and update the properties of reports, shared data sources, and other report items.  
  
-   Upload reports and create new shared data sources for reports.  
  
-   Create schedules to run reports at specified times and intervals.  
  
-   Create, change, or delete subscriptions to reports.  
  
-   Create report history and specify the number of report snapshots to keep in the report history.  
  
-   Create new folders on the server to organize your reports the way you want.  
  
 Some of these tasks might be done for you by the administrator online.   
  
 The web portal typically contains reports, data sources, as well as the My workspace. In My workspace you can use to store and work with reports that you own. Other workspaces typically require users to have advanced permissions to add to or modify contents.   

 The web portal displays reports in the Power BI Services HTML Viewer. The HTML Viewer provides a framework for viewing reports in HTML and includes a report toolbar, a parameter section, a credentials section, and a document map. The report toolbar provides page navigation, zoom, refresh, search, export, print, and data feed functionality. The report toolbar also appears in a browser window at the top of a report when you access reports through a URL. Print functionality is optional and must be turned on by your administrator. When it is available, a Printer icon appears on the report toolbar. 
  
 After you run a report, you can export it to another format, such as Microsoft Excel or PDF. You can also export the report using a data rendering extension such as the Comma-Separated Value (CSV) rendering extension and then use the CSV data file as input to another application. For more information about exporting reports, see [Export reports &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-builder/export-reports-report-builder-and-ssrs).
  
 The easiest way to select and run a report is to open the web portal and then search for or browse to the report in a workspace that you want to view.  
  
 After you run a report, you can refresh it to see new data.  
  
### Refreshing reports  
 Report data frequently changes and you might want to refresh the report to view the newest data. You can refresh a report in three different ways.  
  
|Option|Result|  
|------------|------------|  
|**Refresh** button on the browser window|Displays the report stored in the session cache. A session cache is created when a user opens a report. Power BI Services uses browser sessions to maintain a consistent viewing experience while a report is open.|  
|![Screenshot showing browser refresh button on report toolbar](../report-builder/media/browser-refresh-button-report-toolbar.png)|When you click the **Refresh** button on the report toolbar, the Power BI Services re-runs the query and updates report data if the report runs on-demand.|  
|CTRL+F5 keyboard combination|Produces the same result as clicking the **Refresh** button on the report toolbar.|  
  
  
##  <a name="AboutUserSessions"></a> About user sessions  
 Power BI Services uses browser sessions to maintain consistency while viewing reports. Sessions are based on browser connections. A new session is created every time that a user opens a report in a new browser window. Once a browser session is established, you continue to work with the version of the report that was opened when the session began, even if the report is modified on the Power BI Services. For example, if you open a report at 11:00 P.M., and a report author republishes the same report at 11:01 P.M., your session will contain the version that you opened for the duration of the session.  
  
 If you refresh a report within the same session using the browser's **Refresh** button, the original session version of the report is displayed. If you refresh an on-demand report using the **Refresh** button on the report toolbar, the report is re-run and new data, if any, is displayed.  
  
 
##  <a name="InThisSection"></a> In this section  
 The following articles provide additional information about viewing and managing reports.  
  
 [Find, view, and manage reports](/sql/reporting-services/report-builder/finding-viewing-and-managing-reports-report-builder-and-ssrs)
  
 [Finding and viewing Reports with a browser &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-builder/finding-and-viewing-reports-with-a-browser-report-builder-and-ssrs)  
 Describes how to use a URL to find and view a report.  
  
 [Previewing Reports in Power BI Report Builder](/sql/reporting-services/report-builder/previewing-reports-in-report-builder)  
 Describes how to preview reports while you create or update them.  
  
## Next steps  
 [Saving Reports &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-builder/saving-reports-report-builder)   
