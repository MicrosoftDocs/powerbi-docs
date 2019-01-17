---
title: What's new in Power BI Report Server
description: Learn about what's new in Power BI Report Server. This covers the major feature areas and is updated as new items are released.
author: maggiesMSFT
ms.author: maggies
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 08/16/2018
---

# What's new in Power BI Report Server

Learn about what's new in Power BI Report Server. This article covers the major feature areas and is updated as new items are released.

To download Power BI Report Server, and Power BI Desktop optimized for Power BI Report Server, go to [On-premises reporting with Power BI Report Server](https://powerbi.microsoft.com/report-server/).

Also check these sources to keep up-to-date on new features in Power BI Report Server.

* [Microsoft Power BI Blog](https://powerbi.microsoft.com/blog/)
* [SQL Server Reporting Services Team Blog](https://blogs.msdn.microsoft.com/sqlrsteamblog/)
* The [Guy in a Cube YouTube channel](https://aka.ms/guyinacube)

For related Power BI "What's New" information, see:

* [What's new in the Power BI service](../service-whats-new.md)
* [What's new in Power BI Desktop](../desktop-latest-update.md)
* [What's new in the mobile apps for Power BI](../consumer/mobile/mobile-whats-new-in-the-mobile-apps.md)

## August 2018

August 2018 sees many new features added to the version of Power BI Desktop optimized for Power BI Report Server. Here they are, broken out by area:

- [Reporting](#reporting)
- [Analytics](#analytics)
- [Modeling](#modeling)

### Highlights of the August 2018 release

Out of the whole long list of new features, these features stand out as especially interesting. For more information, see our [blog post](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/).

#### Report theming

Report theming has been added to the August 2018 release of Power BI Report Server, which allows you to quickly color your entire report to match a theme or corporate branding. When you import a theme, all your charts automatically update to use the theme colors, and you can have access to the theme colors from the color palette. You can upload a theme file using the **Import Theme** option under the **Switch Theme** button.

A theme file is a JSON file that includes all the colors you want us to use in your report along with any default formatting you want to apply to visuals.
Here is a simple sample JSON theme that just updates the default colors of the report:

```json
{
"name": "waveform",
"dataColors": [ "#31B6FD", "#4584D3", "#5BD078", "#A5D028", "#F5C040", "#05E0DB", "#3153FD", "#4C45D3", "#5BD0B0", "#54D028", "#D0F540", "#057BE0" ],
"background":"#FFFFFF",
"foreground": "#F2F2F2",
"tableAccent":"#5BD078"
}
```

#### Conditional formatting by a different field

The ability to format a column by a different field in your model is one of the significant improvements to conditional formatting.

#### Conditional formatting by values

Another new conditional formatting type is the **Format by field** value. The Format by field value lets you use a measure or column that specifies a color, either through a hex code or name, and applies that color to the background or font color.

#### Report page tooltips

The report page tooltips feature is included in the August 2018 update of Power BI Report Server. This feature lets you design a report page to be used as a custom tooltip for other visuals in your report.

#### Log axis improvements

We’ve greatly improved log axis in your cartesian charts. You should now be able to select log scale for the numeric axis of any cartesian chart, including combo chart, when you have data that is completely positive or completely negative.

#### SAP HANA SSO Direct Query

SAP HANA SSO Direct Query support with Kerberos is now available for Power BI Reports.

>[!Note]
>This scenario is supported only when SAP HANA is treated as a relational data source with reports you’ve created in Power BI desktop.  To enable this in Power BI Desktop, in the DirectQuery menu under Options, check the “Treat SAP HANA as a relational source” and click OK.

#### Custom Visuals

- The API version shipped with this release is 1.13.0.

- Now custom visuals can fall back to a previous version compatible with the current version of the server API (if available).

### Reporting 

- [Report Theming](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#theming)
- [Buttons to trigger actions](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#buttons)
- [Combo chart line styles](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#comboLines)
- [Improved default sort for visuals](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#sort)
- [Numeric slicer](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#numericSlicer)
- [Advanced slicer syncing](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#slicerSync)
- [Log axis improvements](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#logAxis)
- [Data label options for funnel chart](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#funnelChart)
- [Set line stroke width to zero](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#lineStroke)
- [High contrast support for reports](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#highContrast)
- [Donut radius control](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#donutRadius)
- [Pie and donut detail labels position control](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#detailLabels)
- [Format data labels separately for each measure in a combo chart](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#comboLabels)
- [New visual header with more flexibility and formatting](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#visualHeader)
- [Wallpaper formatting](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#wallpaper)
- [Tooltips for table & matrix](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#tableTooltips)
- [Turn tooltips off for visuals](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#tooltips)
- [Slicer accessibility](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#slicerAccessibility)
- [Formatting pane improvements](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#formattingPane)
- [Stepped line support for line and combo charts](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#steppedLine)
- [Sorting experience improvement](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#sorting)
- [Print reports through Export to PDF (in Power BI Desktop)](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#print)
- [Create bookmark groups](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#bookmarks)
- [Slicer restatement](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#slicer)
- [Report page tooltips](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#reportPageTooltips)

### Analytics

- [New DAX function: COMBINEVALUES()](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#combineValues)
- [Measure drillthrough](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#measureDrillthrough)
- [Conditional formatting by a different field](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#conditionalFormattingField)
- [Conditional formatting by values](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#conditionalFormattingValue)

### Modeling

- [Filtering and sorting in data view](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#filterAndSort)
- [Improved locale formatting](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#locale)
- [Data categories for measures](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#dataCategory)
- [Statistical DAX functions](https://powerbi.microsoft.com/blog/power-bi-report-server-update-august-2018/#dax)

## May 2018

### Configure Power BI iOS mobile apps for report servers remotely

As an IT admin, you can now use your organization's MDM tool to remotely configure Power BI iOS mobile app access to a report server. See [Configure Power BI iOS mobile app access to a report server remotely](configure-powerbi-mobile-apps-remote.md) for details.

## March 2018

March 2018 sees many, many new features added to the version of Power BI Desktop optimized for Power BI Report Server. Here they are, broken out by area:

- [Visuals](#visuals-updates)
- [Reporting](#reporting)
- [Analytics](#analytics)
- [Performance](#performance)
- [Report server](#report-server)
- [Others](#other-improvements)

### Highlights of the March 2018 release

Out of the whole long list of new features, these features stand out as especially interesting.

#### [Rule-based conditional formatting for table and matrix](https://powerbi.microsoft.com/blog/power-bi-desktop-november-2017-feature-summary/#conditionalFormatting)

Create rules to conditionally color the background or font color of a column based on specific business logic in your table or matrix.

#### [Show and hide pages](https://powerbi.microsoft.com/blog/power-bi-desktop-january-2018-feature-summary/#hidePages)

You want readers to have access to your report, but some of the pages aren't quite finished. Now you can hide them until they're ready. Or you can hide pages from normal navigation, and readers can get to the page by bookmarks or drillthrough.

#### [Bookmarking](https://powerbi.microsoft.com/blog/power-bi-desktop-march-2018-feature-summary/#bookmarking)

Speaking of bookmarking, create bookmarks to tell a story with the data in your report.

- [Cross-highlighting for bookmarks](https://powerbi.microsoft.com/blog/power-bi-desktop-december-feature-summary/#bookmarkCrossHighlighting): Bookmarks maintain and display the cross-highlighted state of the report page at the time you created the bookmark.
- [More bookmark flexibility](https://powerbi.microsoft.com/blog/power-bi-desktop-december-feature-summary/#bookmarkFlexibility): Bookmarks reflect the properties you set in your report, and affect only the visuals you choose.

#### [Multi-select data points across multiple charts](https://powerbi.microsoft.com/blog/power-bi-desktop-february-2018-feature-summary/#crosshighlight)

Select multiple data points in multiple charts and have the cross-filtering apply to the entire page.

#### [Sync slicers across multiple pages of your report](https://powerbi.microsoft.com/blog/power-bi-desktop-february-2018-feature-summary/#syncSlicers)

A slicer can apply to one, two, or more pages in a report.

#### [Quick measures](https://powerbi.microsoft.com/blog/power-bi-desktop-february-2018-feature-summary/#quickMeasures) 

Create new measures based on existing measures and numerical columns in a table.

#### [Drilling down filters other visuals](https://powerbi.microsoft.com/blog/power-bi-desktop-december-feature-summary/#drillFiltersOtherVisuals)

When you drill down in a given category in one visual, you can have it filter all the visuals on the page by that same category.

### Visuals updates

- [Cell alignment for table and matrix](https://powerbi.microsoft.com/blog/power-bi-desktop-november-2017-feature-summary/#alignment)
- [Display units and precision control for table & matrix columns](https://powerbi.microsoft.com/blog/power-bi-desktop-march-2018-feature-summary/#displayUnits)
- [Overflow data labels for bar and column charts](https://powerbi.microsoft.com/blog/power-bi-desktop-february-2018-feature-summary/#overflow)
- [Control data label background color for Cartesian and maps visuals](https://powerbi.microsoft.com/blog/power-bi-desktop-january-2018-feature-summary/#dataLabelBackground)
- [Bar/column padding control](https://powerbi.microsoft.com/blog/power-bi-desktop-january-2018-feature-summary/#padding)
- [Increase area used for axis labels in charts](https://powerbi.microsoft.com/blog/power-bi-desktop-january-2018-feature-summary/#axisSize)
- [Scatter visual from x- & y-axis groupings](https://powerbi.microsoft.com/blog/power-bi-desktop-december-feature-summary/#scatterChart)
- [High density sampling for maps based on latitude and longitude](https://powerbi.microsoft.com/blog/power-bi-desktop-december-feature-summary/#highDensityMaps)
- [Responsive slicers](https://powerbi.microsoft.com/blog/power-bi-desktop-december-feature-summary/#responsive)
- [Add an anchor date for relative date slicer](https://powerbi.microsoft.com/blog/power-bi-desktop-january-2018-feature-summary/#anchorDate)

### Reporting

- [Turn off the visual header in reading mode for a report](https://powerbi.microsoft.com/blog/power-bi-desktop-march-2018-feature-summary/#visualHeader)
- [Report options for slow data sources](https://powerbi.microsoft.com/blog/power-bi-desktop-november-2017-feature-summary/#slowDataSource)
- [Improved default visual placement](https://powerbi.microsoft.com/blog/power-bi-desktop-march-2018-feature-summary/#visualPlacement)
- [Control visual ordering through the selection pane](https://powerbi.microsoft.com/blog/power-bi-desktop-november-2017-feature-summary/#selectionPane)
- [Lock objects on your report](https://powerbi.microsoft.com/blog/power-bi-desktop-november-2017-feature-summary/#lock)
- [Search the formatting and analytics pane](https://powerbi.microsoft.com/blog/power-bi-desktop-february-2018-feature-summary/#search)
- [Field properties pane and field descriptions](https://powerbi.microsoft.com/blog/power-bi-desktop-december-feature-summary/#fieldPropertiesPane)

### Analytics

- [UTCNOW() and UTCTODAY()](https://powerbi.microsoft.com/blog/power-bi-desktop-february-2018-feature-summary/#utcDAX)
- [Mark custom date table](https://powerbi.microsoft.com/blog/power-bi-desktop-february-2018-feature-summary/#customDateTable)
- [Drill filters other visuals](https://powerbi.microsoft.com/blog/power-bi-desktop-december-feature-summary/#drillFiltersOtherVisuals)
- [Cell-level formatting for multidimensional AS models for multi-row card](https://powerbi.microsoft.com/blog/power-bi-desktop-november-2017-feature-summary/#cellLevelFormatting)

### Performance

- [Filtering performance improvements](https://powerbi.microsoft.com/blog/power-bi-desktop-november-2017-feature-summary/#filtering)
- [DirectQuery performance improvements](https://powerbi.microsoft.com/blog/power-bi-desktop-february-2018-feature-summary/#dqPerf)
- [Open and save performance improvements](https://powerbi.microsoft.com/blog/power-bi-desktop-february-2018-feature-summary/#savePerf)
- [“Show items with no data” improvements](https://powerbi.microsoft.com/blog/power-bi-desktop-february-2018-feature-summary/#showItemsWithNoData)

### Report server

#### Export to accessible PDF

When you export a paginated (RDL) report to PDF, you can now get an accessible/tagged PDF file. It's larger in size but easier for screen readers and other assistive technologies to read and navigate. You enable accessible PDF by setting the **AccessiblePDF** device information setting to **True**. See [PDF Device Information Settings](https://docs.microsoft.com/sql/reporting-services/pdf-device-information-settings) and [Changing Device Information Settings](https://docs.microsoft.com/sql/reporting-services/customize-rendering-extension-parameters-in-rsreportserver-config#changing-device-information-settings).

### Other improvements

- [Add Column From Examples improvements](https://powerbi.microsoft.com/blog/power-bi-desktop-november-2017-feature-summary/#addColumnFromExamples)
- [Consulting Services quick link](https://powerbi.microsoft.com/blog/power-bi-desktop-february-2018-feature-summary/#consultingServices)
- [Improved error reporting](https://powerbi.microsoft.com/blog/power-bi-desktop-march-2018-feature-summary/#errors)
- [View previous errors you’ve encountered](https://powerbi.microsoft.com/blog/power-bi-desktop-march-2018-feature-summary/#viewErrors)

## October 2017

### Power BI report data sources

Power BI reports in Power BI Report Server can connect to a variety of data sources. You can import data and schedule data refresh, or query it directly using DirectQuery or a live connection to SQL Server Analysis Services. See the list of data sources that support scheduled refresh and those that support DirectQuery in "Power BI report data sources in Power BI Report Server".

### Scheduled data refresh for imported data

In Power BI Report Server, you can set up scheduled data refresh to keep data up-to-date in Power BI reports with an embedded model rather than a live connection or DirectQuery. With an embedded model you import the data, so it's disconnected from the original data source. It needs to be updated to keep the data fresh, and scheduled refresh is the way to do that. Read more about "scheduled refresh for Power BI reports in Power BI Report Server".

### Editing Power BI reports from the server

You can open and edit Power BI report (.pbix) files from the server, but you get back the original file you uploaded.  This means **if the data has been refreshed by the server, the data won’t be refreshed when you first open the file**. You need to manually refresh it locally to see the change.

### Large file upload/download

You can upload files up to 2 GB in size, though by default this limit is set to 1 GB in the Report Server settings in SQL Server Management Studio (SSMS).  These files are stored in the database just as they are for SharePoint, and no special configuration for the SQL Server catalog is required.  

### Accessing shared datasets as OData feeds

You can access shared datasets from Power BI Desktop with an OData feed. For more information, see [Accessing shared datasets as OData feeds in Power BI Report Server](access-dataset-odata.md).

### Scale-out

This release supports scale-out. Use a load-balancer and set server affinity for the best experience. Note that the scenario is not yet optimized for scale-out, so you'll see models potentially replicated across multiple nodes. The scenario will work without the Network Load Balancer and sticky sessions. However, you'll not only see an over-use of memory across nodes as the model is loaded N times, but performance will slow in between connections as the model is streamed as it hits a new node in between requests.  

### Administrator settings

Administrators can set the following properties in SSMS Advanced Properties for the server farm:

* EnableCustomVisuals: True/False
* EnablePowerBIReportEmbeddedModels: True/False
* EnablePowerBIReportExportData: True/False
* MaxFileSizeMb: Default is now 1000
* ModelCleanupCycleMinutes: How often it checks to evict models from memory
* ModelExpirationMinutes: How long until model expires and is evicted, based on last time used
* ScheduleRefreshTimeoutMinutes: How long data refresh can take for a model. By default, this is two hours.  There is no hard upper limit.

**Config file rsreportserver.config**

```
<Configuration>
  <Service>
    <PollingInterval>10</PollingInterval>
    <IsDataModelRefreshService>false</IsDataModelRefreshService>
    <MaxQueueThreads>0</MaxQueueThreads>
  </Service>
</Configuration>
```

### Developer API

The developer API (REST API) introduced for SSRS 2017 has been extended for Power BI Report Server to work with both Excel files and .pbix files. One potential use case is to programmatically download files from the server, refresh them, and then republish them. This is the only way to refresh Excel workbooks with PowerPivot models, for example.

Note that there is a new separate API for large files, which will be updated in the Power BI Report Server version of Swagger. 

### SQL Server Analysis Services (SSAS) and the Power BI Report Server memory footprint

Power BI Report Server now hosts SQL Server Analysis Services (SSAS) internally. This isn't specific to scheduled refresh. Hosting SSAS can greatly expand the report server memory footprint. The AS.ini configuration file is available on the server nodes, so if you're familiar with SSAS, you may want to update the settings, including maximum memory limit and disk caching etc. See [Server properties in Analysis Services](https://docs.microsoft.com/sql/analysis-services/server-properties/server-properties-in-analysis-services) for details.

### Viewing and interacting with Excel workbooks

Excel and Power BI contain a portfolio of tools that is unique in the industry. Together, they enable business analysts to more easily gather, shape, analyze, and visually explore their data. In addition to viewing Power BI reports in the web portal, business users can now do the same with Excel workbooks in Power BI Report Server, giving them a single location to publish and view their self-service Microsoft BI content.

We’ve published a [walkthrough of how to add Office Online Server (OOS) to your Power BI Report Server preview environment](excel-oos.md). Customers with a Volume Licensing account can download OOS from the Volume License Servicing Center at no cost and will have view-only functionality. Once configured, users can view and interact with Excel workbooks that:

* Have no external data source dependencies
* Have a live connection to an external SQL Server Analysis Services data source
* Have a PowerPivot data model

### Support for new table and matrix visuals

Power BI Report Server now supports the new Power BI table and matrix visuals. To create reports with these visuals, you will need an updated Power BI Desktop release for the October 2017 release. It can't be installed side by side with the Power BI Desktop (June 2017) release. For the latest version of Power BI Desktop, on the [Power BI Report Server download page](https://powerbi.microsoft.com/report-server/), select **Advanced download options**.

## June 2017

* Power BI Report Server made generally available (GA).

## May 2017

* Power BI Report Server Preview made available
* Ability to publish Power BI reports on-premises
  * support for custom visuals
  * Support for **Analysis Services live connections** only with more data sources to come.
  * Power BI Mobile app updated to display Power BI reports hosted in Power BI Report Server
* Enhanced collaboration in reports with comments

## Next steps

[What is Power BI Report Server?](get-started.md) 
[Administrator handbook](admin-handbook-overview.md)  
[Install Power BI Report Server](install-report-server.md)  
[Download Report Builder](https://www.microsoft.com/download/details.aspx?id=53613)  
[Download SQL Server Data Tools (SSDT)](http://go.microsoft.com/fwlink/?LinkID=616714)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)