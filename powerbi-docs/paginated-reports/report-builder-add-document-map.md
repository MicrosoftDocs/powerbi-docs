---
title: "Create a document map or table of contents in paginated reports"
description: Learn how to use a document map to provide a table of contents or a set of navigational links to report items in a rendered paginated report in Power BI Report Builder.
author: JulCsc
ms.author: nisrinivasan
ms.date: 09/18/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---

# Create a document map or table of contents in paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)] 

Create a document map to provide a set of links, like a table of contents, in your paginated report. When you view a paginated report that includes a document map, a separate side pane appears next to the report. You can select links in the document map to jump to the report page that displays that item. Report sections and groups are arranged in a hierarchy of links. Selecting items in the document map refreshes the report and displays the area of the report that corresponds to the item in the document map.  
  
 To add links to the document map, you set the **DocumentMapLabel** property of the report item to text that you create or to an expression that evaluates to the text that you want display in the document map. You can also add the unique values for a table or matrix group to the document map. For example, for a group based on color, each unique color is a link to the report page that displays the group instance for that color.  
  
 You can also create a URL to a report that overrides the display of the document map, so that you can run the report without displaying the document map, and then select the **Show/Hide Document Map** button on the report viewer toolbar to toggle the display.  

> [!NOTE]  
> Document maps don't render when you view a paginated report in the Power BI service. They do render when you export the report.
  
##  <a name="DocMapRenderExtensions"></a> Document maps and rendering extensions

 The document map is intended for use in the HTML rendering extension-for example, in Preview and the Report Viewer. Other rendering extensions have different ways of articulating a document map:  
  
- PDF renders a document map as the Bookmarks pane. See [Export to a PDF File (Power BI Report Builder)](report-builder/export-pdf-file-report-builder.md) for more information.
  
- Microsoft Excel renders a document map as a named worksheet that includes a hierarchy of links. Report sections are rendered in separate worksheets that are included with the document map in the same workbook. See [Export to Microsoft Excel (Power BI Report Builder)](report-builder/export-microsoft-excel-report-builder.md) for more information.
  
- Microsoft Word includes a document map as the table of contents. See [Export to Microsoft Word (Power BI Report Builder)](report-builder/export-microsoft-word-report-builder.md) for more information.
  
- Atom, TIFF, XML, and CSV ignore document maps.  
  
 For more information, see [Interactive Functionality for Different Report Rendering Extensions (Report Builder and SSRS)](/sql/reporting-services/report-builder/interactive-functionality-different-report-rendering-extensions).  
  
##  <a name="AddRptItemToMap"></a> Add a report item to a document map  
  
1. In Report Builder Design view, select the report item such as a table, matrix, or gauge that you want to add to the document map. The report item properties appear in the Properties pane.  
  
    > [!NOTE]  
    >  To select a tablix data region, select any cell to display the row and column handles, and then select the corner handle.  
  
1. In the Properties pane, type the text that you want to appear in the document map in the **DocumentMapLabel** property, or enter an expression that evaluates to a label. For example, type **Sales Chart**.  
  
    > [!NOTE]  
    >  If you do not see the Properties pane, on the **View** tab, in the **Show/Hide** group, select **Properties**.  
  
1. Repeat steps 1 and 2 for every report item that you want to appear in the document map.  
  
1. Select **Run**. The report runs and the document map displays the labels you created. Select any link to jump to the report page with that item.  

  
##  <a name="AddUniqueValuesToMap"></a> Add unique group values to a document map  
  
1. In Report Builder Design view, select the table, matrix, or list that contains the group that you want to display in the document map. The Grouping pane displays the row and column groups.  
  
1. In the Row Groups pane, right-click the group, and then select **Edit Group**. The **General** page of the **Tablix Group Properties** dialog box opens.  
  
1. Select **Advanced**.  
  
1. In the **Document map** list box, type or select an expression that matches the group expression.  
  
1. Select **OK**.
  
1. Repeat steps 1-4 for every group that you want to appear in the document map.  
  
1. Select **Run**. The report runs and the document map displays the group values. Select any link to jump to the report page with that item.  
  
##  <a name="HideMapWhenViewRpt"></a> Hide the document map when you view a report  
  
1. In the web portal, browse to the report that has the document map.  
  
     For example, for the AdventureWorks sample reports, the following URL specifies the report named Product Catalog.  
  
    ```
    https://localhost/Reports/Pages/Report.aspx?ItemPath=%2fAdventureWorks2022+Sample+Reports%2fProduct+Catalog  
    ```  
  
1. Copy the report path on the server. In the example, the report path is `%2fAdventureWorks2022+Sample+Reports%2fProduct+Catalog`.  
  
1. Create a new URL with the following three components:  
  
    - The report viewer on the report server: `https://localhost/ReportServer/Pages/ReportViewer.aspx?`  
  
    - The name of the report you copied in step 1, for example: `%2fAdventureWorks2022+Sample+Reports%2fProduct+Catalog`  
  
    - The device information parameters that specify hiding the document map: `&rs%3aCommand=Render&rc%3aFormat=HTML4.0&rc%3aDocMap=False`  
  
     The following URL consists of these three components appended in the order they are listed.  
  
    ```
    https://localhost/ReportServer/Pages/ReportViewer.aspx?  
    %2fAdventureWorks2022+Sample+Reports%2fProduct+Catalog  
    &rs%3aCommand=Render&rc%3aFormat=HTML4.0&rc%3aDocMap=False  
    ```  
  
     To use this URL, copy it and remove all line breaks.  
  
1. Paste the URL in the web portal, and then press ENTER. The report runs, and the document map is hidden.  
  
> [!NOTE]  
> For more information about downloading sample reports, see [Report Builder and Report Designer sample reports](https://social.technet.microsoft.com/wiki/contents/articles/1093.reporting-services-samples-on-codeplex-sql-server-reporting-services-ssrs.aspx).

## Related content

- [SQL Server Reporting Services URL Access](/sql/reporting-services/url-access-ssrs)

More questions? [Try asking the Reporting Services forum](/answers/search.html?c=&f=&includeChildren=&q=ssrs+OR+reporting+services&redirect=search%2fsearch&sort=relevance&type=question+OR+idea+OR+kbentry+OR+answer+OR+topic+OR+user)
