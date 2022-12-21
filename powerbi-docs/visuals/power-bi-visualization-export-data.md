---
title: Export data from a Power BI visualization
description: Export data from a report visualization and dashboard visualization and view it in Excel.
author: mihart
ms.author: mihart
manager: kfollis
ms.reviewer:
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/19/2022
ms.custom: video-KjheMTGjDXw, video-jtlLGRKBvXY, sample-Procurement-Analysis
LocalizationGroup: Visualizations
---

# Export the data that was used to create a visualization

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

To see the data that's used to create a visual, [you can display that data in Power BI](/power-bi/consumer/end-user-show-data.md), or export it to Excel. This article shows you how to **export to Excel**. Data can be exported to Excel from a Power BI dashboard tile and from a report visual.

:::image type="content" source="media/power-bi-visualization-export-data/power-bi-introduction.png" alt-text="Power BI service showing dropdown for More actions (...).":::

> [!IMPORTANT]
> Not all data can be viewed or exported by all users. There are safeguards that report designers and administrators use when building dashboards and reports. Some data is restricted, hidden, or confidential, and cannot be seen or exported without special permissions. If you're a designer or admin, select the tab below for [Admin and designer controls for exporting](#admin-and-designer-controls-for-exporting).

## Who can export data

If you do have permissions to the data, you can see, and export the data that Power BI uses to create a visualization.

If you don't have permissions to the data, you won't be able to export or open in Excel. Often, data is confidential or limited to specific users. For details, see the [Considerations and limitations](#considerations-and-limitations) section at the end of this document. If you're working in the Power BI service, you can contact your Power BI administrator, or you can look up the contact information for the dashboard owner to request export permissions. To find the owner, select the dropdown next to the report title.

:::image type="content" source="media/power-bi-visualization-export-data/power-bi-contact.png" alt-text="Dashboard displaying contact information.":::

## Video: View and export data

Watch Will export the data from one of the visualizations in a report, save it as an *.xlsx* file, and open it in Excel. Then follow the step-by-step instructions below the video to try it out yourself.

> [!NOTE]
> This video might use earlier versions of Power BI Desktop or the Power BI service.
<iframe width="560" height="315" src="https://www.youtube.com/embed/KjheMTGjDXw" allowfullscreen></iframe>

## Data is protected when it's exported out of Power BI

Report owners can classify and label reports using [sensitivity labels](/power-bi/enterprise/service-security-data-protection-overview.md) from Microsoft Purview Information Protection. If the sensitivity label has protection settings, Power BI will apply these protection settings when exporting report data to Excel, PowerPoint, or PDF files. Only authorized users will be able to open protected files.

Security and Power BI administrators can use [Microsoft Defender for Cloud Apps](/power-bi/enterprise/service-security-data-protection-overview.md) to monitor user access and activity, perform real-time risk analysis, and set label-specific controls. For example, organizations can use Microsoft Defender for Cloud Apps to configure a policy that prevents users from downloading sensitive data from Power BI to unmanaged devices.

## Export data from a Power BI dashboard

1. Open a [dashboard](/power-bi/create-reports/service-dashboards.md) in the Power BI service and select a tile with a visual.

1. From the upper right corner of the tile, open the **More options (...)** dropdown and select **Export to .csv**.

   :::image type="content" source="media/power-bi-visualization-export-data/power-bi-more-actions.png" alt-text="Screenshot of a visualization with the ellipsis button called out.":::

1. If the tile was pinned from a report with a sensitivity label, you'll see this warning. Consider the sensitivity of your content before deciding whether to export or not.

   :::image type="content" source="media/power-bi-visualization-export-data/power-bi-sensitivity.png" alt-text="Screenshot of sensitivity warning.":::

1. Power BI exports the data to a *.csv* file. If you've filtered the visualization, then the .csv export will be filtered as well. Your browser will prompt you to save or open the file.  By default, your export is saved to your local Downloads folder.

1. Open the *.csv* file in Excel.

   :::image type="content" source="media/power-bi-visualization-export-data/power-bi-export-tile.png" alt-text="Screenshot of the .csv file with a portion of the exported data displayed.":::

## Export data from a report

# [Power BI Desktop](#tab/powerbi-desktop)

Exporting data from a report visual in Power BI Desktop is straightforward. When you export the data, Power BI creates a .csv file with the data.

1. Select the visual, select **More options (...)** > **Export data**.
2. In the **Save As** dialog box, select a location for the .csv file, and edit the file name, if you want.
3. Select **Save**.

# [Power BI service](#tab/powerbi-service)

You have many more options when exporting data from a report visual in the Power BI service. To illustrate the different options, we've created a stacked column chart that includes:

- A [hierarchy](/power-bi/consumer/end-user-drill.md) made up of **Country/Region** and **City**. With that hierarchy, we can drill down from **Country/Region** to **City**, and back up again.
- A filter for **City**.
- An aggregate for **Discount percent** (count was changed to average).

:::image type="content" source="media/power-bi-visualization-export-data/power-bi-numbered.png" alt-text="Chart with numbered labels.":::

Now we're ready to try out two different options for exporting data. Select **More options (...)** in the upper-right corner of the visual, then choose **Export data**.

:::image type="content" source="media/power-bi-visualization-export-data/power-bi-export-visual.png" alt-text="Visual dropdown showing option for selecting Export data.":::

Power BI gives you the option to export the summarized data or underlying data. Since your visualization has an aggregate (you changed **count** to *average*),  you'll have two options:

- **Summarized data**
- **Underlying data**

:::image type="content" source="media/power-bi-visualization-export-data/power-bi-export-options.png" alt-text="Window showing options for Summarized data and Underlying data.":::

### Export ***summarized*** data

Select the option for **Summarized data** if you want to export data for what you see in that visual.  This type of export shows you only the data (columns and measures) that is being used to create the visual.  Since this visual has a hierarchy, you'll export aggregated data for the full hierarchy. So, even though your current view of the chart shows two columns (two Country/Regions), your summarized data will display four rows -- one for each **City** in the hierarchy.

If the visual has filters applied, then the data you export will also be filtered. If your visual has aggregates (sum, average, and so on), the export will also be aggregated.

For help understanding aggregates, see [Aggregates in Power BI](/power-bi/create-reports/service-aggregates.md).

> [!NOTE]
> In Power BI Desktop, you'll only have the option to export summarized data as a .csv file.
When you select  **Export**, your browser prompts you to save the file. Once saved, open the file in Excel. If you're using the Power BI app in Microsoft Teams, you may not receive the same prompts. Your exported file is saved in your local Downloads folder or in a folder that you specify.

:::image type="content" source="media/power-bi-visualization-export-data/power-bi-export-data9.png" alt-text="Screenshot of the Excel output.":::

In this example, our Excel export shows one total for each city. Since we filtered out Atlanta, it isn't included in the results. The first row of our spreadsheet shows the filters that Power BI used when extracting the data.

- All the data used by the hierarchy is exported, not simply the data used for the current drill level for the visual. For example, we hadn't yet drilled down to the city level, but our export includes city data as well as country/region data.

- Our exported data is aggregated. We get a total percentage, one row, for each city.

- Since we applied filters to the visualization, the exported data will export as filtered. Notice that the first row displays **Applied filters: City is not Atlanta, GA**.

### Export ***underlying*** data

Select this option if you want to see the data in the visual ***and*** additional data from the dataset (see chart below for details). If your visualization has an aggregate, selecting **Underlying data** removes the aggregate. In this example, the Excel export shows one row for every single **City** row in our dataset and the discount percent for that single entry. Power BI flattens the data, it doesn't aggregate it.

For some data, **underlying** will be disabled. Build permissions may be required to see more data than is currently displayed in the visual (underlying data). These permissions protect the data from being inappropriately viewed, re-used, or shared with anyone other than the intended audience.

When you select  **Export**, your browser prompts you to save the file. Once saved, open the file in Excel.  If you're using the Power BI app in Microsoft Teams, you may not receive the same prompts. Your exported file is saved in your local Downloads folder or in a folder that you specify.

:::image type="content" source="media/power-bi-visualization-export-data/power-bi-excel.png" alt-text="Screenshot of the .xlsx file with the exported data displayed.>":::

- This screenshot shows you only a small portion of the Excel file; it has more than 100,000 rows.

- All the data used by the hierarchy is exported, not simply the data used for the current drill level for the visual. For example, we hadn't yet drilled down to the city level, but our export includes both city and country/region data.

- Since we applied filters to the visual, the exported data will export as filtered. Notice that the first row displays **Applied filters: City is not Atlanta, GA**. Notice that in some specific cases the first row might display a filter that is not being applied in the data that follows. See the next section for details.

### Export underlying data details

What you see when you select **Underlying data** can vary. Understanding these details may require the help of your admin or IT department. In Power BI Desktop or the Power BI service, in the reporting view, a *measure* shows in the **Fields** list with a calculator icon :::image type="icon" source="/power-bi/transform-model/media/desktop-field-list/field-list-09b.png":::. Measures can be created in Power BI Desktop.

| Visual contains | What you'll see in export  |
|---------------- | ---------------------------|
| Aggregates | the *first* aggregate and non-hidden data from the entire table for that aggregate |
| Aggregates | related data - if the visual uses data from other data tables that are  *related* to the data table that contains the aggregate (as long as that relationship is \*:1 or 1:1) |
| Measures | all measures in the visual *and* all measures from any data table containing a measure used in the visual |
| Measures | all non-hidden data from tables that contain that measure (as long as that relationship is \*:1 or 1:1) |
| Measures only | all non-hidden columns from all related tables (to expand the measure) |
| Measures only | summarized data for any duplicate rows for model measures |


> [!IMPORTANT]
> Export underlying data will not include datetime / variations columns or include numeric columns if there is an aggregation.

---

## Admin and designer controls for exporting

Power BI report designers control the types of data export options that are available for their consumers. The choices are:

- Allow end users to export summarized data from the Power BI service or Power BI Report Server

- Allow end users to export both summarized and underlying data from the service or Report Server

- Don't allow end users to export any data from the service or Report Server

  > [!IMPORTANT]
  > We recommend that report designers revisit old reports and manually reset the export option as needed.

To set these options:

1. Start in Power BI Desktop.

1. From the upper left corner, select **File** > **Options and Settings** > **Options**.

1. Under **CURRENT FILE**, select **Report settings**.

   :::image type="content" source="media/power-bi-visualization-export-data/desktop-report-settings.png" alt-text="Screenshot showing the desktop report settings.":::

1. Make your selection from the **Export data** section.

You can also update this setting in the Power BI service.

It's important to note that if the Power BI admin portal settings conflict with the report settings for export data, the admin settings will override the export data settings.

## Considerations and limitations

These considerations and limitations apply to Power BI Desktop and the Power BI service, including Power BI Pro and Premium.

There are many considerations related to exporting to Excel. This is one of those features that report designers and Power BI administrators may disable for individuals or even for an entire organization. They do this to ensure that private data isn't exposed to the wrong audience.

If you find that you can't use this feature, reach out to the report owner and your administrator to understand why you can't export data from a particular visual or from all visuals. It may be that this feature has been purposely disabled and perhaps they can  enable it for you.  Other times, there may be particular reasons an export does not work.  It could be related to permissions, data contents, data type, visual type, how the designer named the fields, and more. When contacting the report owner or administrator, refer them to these articles:
[Admin tenant settings](/power-bi/admin/service-admin-portal-about-tenant-settings), [Row level security](/power-bi/enterprise/service-admin-rls.md), and [Data protection](/power-bi/enterprise/service-security-data-protection-overview.md).

- When you're exporting data to Excel, the speed of download of the generated workbook can vary depending on network bandwidth.

- The maximum number of rows that **Power BI Desktop** and **Power BI service** can export to a *.csv* file is 30,000.

- The maximum number of rows that the applications can export to an *.xlsx* file is 150,000. The actual number may be lower than 150,000 depending on query limits and visual types.

    For export from matrix visuals using *Data with current layout*, the export limit is 150,000 *data intersections*. For a table visual, each row has 1 *data intersection*. For a matrix visual, each row can have **1 or more** *data intersections*, so the exported rows count can be less than 150,000. (For example, if a matrix visual has 3 *data intersections* per row, the maximum row count will be 150,000 / 3 = 50,000 rows.) The message "_Exported data exceeded the allowed volume. Some data may have been omitted._" will be added at the footer of the Excel file when the limit is hit. Consider limiting the dimensions or filter the data to avoid this scenario.

- Export using *Underlying data* won't work if:

  - the version is older than 2016.

  - the tables in the model don't have a unique key.

  - an administrator or report designer has disabled this feature.

  - you enable the *Show items with no data* option for the visualization Power BI is exporting.

- For export from matrix visuals using *Data with current layout*, consider the following:

  - Matrices with columns and/or values but no rows will be exported as having rows and/or values but no columns

  - Matrices with only one row and/or values but no columns will be exported as table (no right border separator)

  - If the **Switch values to rows** formatting option is set to 'On' in Power BI for a table or matrix visual, the visual format would not be preserved when data is exported to Excel

  - If the **Row subtotals** toggle is set to 'Off' in Power BI Desktop for a matrix visual, but the matrix visual has expanded and collapsed sections, exported data will contain subtotals for rows. To work around this issue, use the **Expand | All** command from the visual's context menu.

- When you're using DirectQuery, the maximum amount of data that Power BI can export is 16-MB uncompressed data. An unintended result may be that you export less than the maximum number of rows of 150,000. This is likely if:

  - There are too many columns. Try reducing the number of columns and exporting again.

  - There's data that is difficult to compress.

  - Other factors are at play that increase file size and decrease the number of rows Power BI can export.

- If the visualization uses data from more than one data table, and no active relationship exists for those tables in the data model, Power BI only exports data for the first table.

- The granularity of data exported to Excel using the **Data with current layout** and **Summarized data** options are identical and the only difference between the options is the shape of the data in Excel. For example, in a matrix visual, the **Data with current layout** preserves the shape of the visual as shown in Power BI when data is exported to Excel while the **Summarized data** option exports the same data but as a flat table of rows and columns.

- When you export datetime data from Power BI, the format of the datetime will change to match the datetime format of your local machine. For example, let's say that the report designer formatted the datetime as DDMMYYYY, which is the default regional format for their locale. When you open that report on your machine and export the data to Excel, the datetime shows as MMDDYY, which is your default regional datetime format. 

- Power BI custom visuals and R visuals aren't currently supported.

- In Power BI, you can rename a field (column) by double-clicking the field and typing a new name. Power BI refers to the new name as an *alias*. It's possible that a Power BI report can end up with duplicate field names, but Excel doesn't allow duplicates. So when Power BI exports the data to Excel, the field aliases revert to their original field (column) names.

- If there are Unicode characters in the *.csv* file, the text in Excel may not display properly. Examples of Unicode characters are currency symbols and foreign words. You can open the file in Notepad and the Unicode will display correctly. If you want to open the file in Excel, the workaround is to import the *.csv*. To import the file into Excel:

  1. Open Excel.

  1. Go to the **Data** tab.

  1. Select **Get external data** > **From text**.

  1. Go to the local folder where the file is stored and select the *.csv*.

- When you're exporting to *.csv*, certain characters will be escaped with a leading **'** to prevent script execution when opened in Excel. This happens when:

  - The column is defined as type "text" in the data model, _**and**_
  - The first character of the text is one of the following: **=, @, +, -**

- Power BI admins can disable the export of data.

- If a dynamic format string is applied to a measure, the exported data won't preserve this formatting in Excel. Also, visual-specific formatting such as percent of grand total for a measure isn't preserved in Excel.


More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
