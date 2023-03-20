---
title: Create Excel workbooks with refreshable Power BI data
description: Learn how to build refreshable reports in Excel with Power BI datasets so you can analyze the data like you would with a dataset that is local to Excel.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ikedeagu
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 02/27/2023
LocalizationGroup: Share your work
---
# Create Excel workbooks with refreshable Power BI data

When you view reports in the Power BI service (`https://app.powerbi.com`), you might want to further enrich the report data with additional assumptions, perform what-if analysis, or validate the numbers in a specific Power BI visual or an entire Power BI report.

In this article, you learn how to create Excel workbooks containing connected Power BI data that you can refresh directly inside the workbook. That way, you can focus on your analysis in Excel and be confident that you are working with up-to-date data.

## Prerequisites

- Your organization’s tenant administrator must enable the **Users can work with Power BI datasets in Excel using a live connection** tenant setting. Learn more about the [Excel live connection](../admin/service-admin-portal-export-sharing.md#users-can-work-with-power-bi-datasets-in-excel-using-a-live-connection) tenant setting in the admin portal documentation.
- For on-premises datasets, your organization’s tenant administrator also must enable the **Allow XMLA endpoints and Analyze in Excel with on-premises datasets** tenant setting. Learn more about the [Allow XMLA endpoints](../admin/service-admin-portal-integration.md#allow-xmla-endpoints-and-analyze-in-excel-with-on-premises-datasets) tenant setting in the admin portal documentation.
- You must have **Build** permission to the Power BI dataset or have at least a **Contributor** role in the Power BI workspace containing your dataset.
- You must have a Power BI license: Free, Pro or Premium Per User (PPU). Power BI Free license users can only work with datasets in My workspace or a Power BI Premium capacity. Learn more about [Power BI licenses](../fundamentals/service-features-license-type.md).
- You can use Excel workbooks containing refreshable Power BI data in both Excel Desktop and Excel for the web.

## Choose Power BI data to evaluate in Excel

Power BI provides you with options to ensure that you can extract the right granularity of data depending on how you want to analyze that data in Excel, either with Excel PivotTables or Excel tables. In the Power BI service, use the following two features to create an Excel workbook:

- [Analyze in Excel](#analyze-in-excel)
- [Export to Excel with live connection ](#export-to-excel-with-live-connection)

### Analyze in Excel

With Analyze in Excel, you can create an Excel workbook containing the entire dataset for a specific Power BI report and analyze that dataset in Excel using PivotTables, Pivot Charts, and other Excel features.

In the Power BI service, you can use any of the following Analyze in Excel entry points to create an Excel workbook:

- Open a Power BI report. Select **Export** > **Analyze in Excel** from the top ribbon.

     :::image type="content" source="media/service-analyze-in-excel/analyze-excel-ribbon.png" alt-text="Screenshot showing selecting Export, then Analyze in Excel on the ribbon." lightbox="media/service-analyze-in-excel/analyze-excel-ribbon.png":::

- Go to the workspace containing your Power BI dataset or report, select **More options** (**...**) next to the dataset or report name and select **Analyze in Excel**.

    :::image type="content" source="media/service-analyze-in-excel/analyze-excel-datahub.png" alt-text="Screenshot showing selecting More options, then Analyze in Excel." lightbox="media/service-analyze-in-excel/analyze-excel-datahub.png":::

- Select a dataset in a Power BI workspace. In the **Dataset details** page, select **Analyze in Excel** on the menu bar.

    :::image type="content" source="media/service-analyze-in-excel/analyze-excel-datahub-details.png" alt-text="Screenshot showing Analyze on Excel in the Dataset details page." lightbox="media/service-analyze-in-excel/analyze-excel-datahub-details.png":::

After you select Analyze in Excel, Power BI generates an Excel workbook and saves it to your OneDrive SharePoint account. It has the same name as the Power BI report, so you can open the workbook directly in Excel for the web.

:::image type="content" source="media/service-analyze-in-excel/open-excel-web.png" alt-text="Screenshot showing the Excel file saved to SharePoint." lightbox="media/service-analyze-in-excel//open-excel-web.png":::

> [!NOTE]
> If you don't have a OneDrive SharePoint account, Power BI downloads the Excel workbook to your local computer.

When you choose **Open in Excel for the web**, your Excel workbook opens in a separate browser tab. To enable the Power BI query in Excel, select **Yes** on the **Query and Refresh Data** dialog.

:::image type="content" source="media/service-analyze-in-excel/excel-web-unsafe-dialog.png" alt-text="Screenshot showing the Query and Refresh Data dialog."::: 

After you select **Yes** in the dialog, you can see the tables and measures from your Power BI dataset in the PivotTable Fields. You can start building your PivotTable reports in Excel.

:::image type="content" source="media/service-analyze-in-excel/analyze-excel-web-workbook.png" alt-text="Screenshot showing PivotTable Fields in Excel." lightbox="media/service-analyze-in-excel/analyze-excel-web-workbook.png"::: 

If you want to work with your data in the Excel Desktop app, select the **Editing** button in the ribbon and select **Open in Desktop app**. 

:::image type="content" source="media/service-analyze-in-excel/open-workbook-excel-desktop.png" alt-text="Screenshot showing Open the Desktop app." lightbox="media/service-analyze-in-excel/open-workbook-excel-desktop.png":::

## Export to Excel with live connection

While viewing a Power BI visual, you may want to further explore the visual data in Excel and keep the data connected. You can export a table of refreshable data from a Power BI visual to Excel:

1. Choose a visual in a Power BI report, select **More options** (**…**).
 
    :::image type="content" source="media/service-analyze-in-excel/more-options-power-bi-visual.png" alt-text="Screenshot showing More options." lightbox="media/service-analyze-in-excel/more-options-power-bi-visual.png":::

1. On the **Options** menu, select **Export data**. You have different options to select what type of data you want to export to Excel.

    :::image type="content" source="media/service-analyze-in-excel/export-data-menu.png" alt-text="Screenshot showing Export options." lightbox="media/service-analyze-in-excel/export-data-menu.png"::: 

1. Select the **Summarized data** card, and choose the **.xslx (Excel) with live connection (500,000 row max)** option under **File format**.

    :::image type="content" source="media/service-analyze-in-excel/export-excel-dialog.png" alt-text="Screenshot showing the Which data do you want to export dialog." lightbox="media/service-analyze-in-excel/export-excel-dialog.png"::: 

1. After you select **Export**, Power BI downloads an Excel workbook containing the live Power BI data to your computer.

    The first time you open the Excel workbook, it might open in read-only mode until you select **Enable Editing**, depending on your Protected View settings in Office.

    :::image type="content" source="media/service-analyze-in-excel/protected-view-excel.png" alt-text="Screenshot showing Enable editing.":::

1. Depending on your [Trusted document](https://support.microsoft.com/office/trusted-documents-cf872bd8-47ec-4c02-baa5-1fdba1a11b53) settings, you might also need to select **Enable Content** to load the Power BI data to the Excel grid.

    :::image type="content" source="media/service-analyze-in-excel/security-warning-excel.png" alt-text="Screenshot showing the security warning.":::

    The data from the Power BI visual is now visible as an Excel table that can be refreshed against Power BI.

    :::image type="content" source="media/service-analyze-in-excel/connected-excel-table.png" alt-text="Screenshot showing connected data in Excel." lightbox="media/service-analyze-in-excel/connected-excel-table.png":::

    > [!NOTE]
    > The **ExportHeaders** worksheet in the Excel workbook contains details about the filters applied to the Power BI visual that the data was exported from.

## Considerations and limitations

- Row-level security (RLS) and object-level security (OLS) are supported for Analyze in Excel and Export with Live Connection. RLS is enforced at the data-model level while OLS is enforced at the table or column level and both security layers apply to all users who access data in a specific Power BI report. Read more about [row-level security](../enterprise/service-admin-rls.md) and [object-level security](../enterprise/service-admin-ols.md).
- For Analyze in Excel, only Power BI datasets that use Import mode preserve hierarchies in the PivotTable Fields in the Excel workbook. Power BI datasets that are built on DirectQuery or composite models don't retain their hierarchies when you use Analyze in Excel.
- Analyze in Excel doesn't support specifying a locale by modifying the connection string after the workbook has been generated.
- You might see an error message if the data is larger than 2 GB. In that case, either reduce the amount of data, for example by applying filters, or use the XMLA endpoint. For more information, see [XMLA endpoint](../enterprise/service-premium-connect-tools.md).
- Users external to the tenant hosting the Power BI dataset can't analyze Power BI data in Excel.
- Analyze in Excel and Export with live connection aren't supported in Power BI Report Server or Power BI PaaS Embedded.
- Analyze in Excel might not work as expected if field parameters are used in the underlying Power BI dataset.
- Analyze in Excel and Export with live connection aren't available for Power BI datasets with a live connection to Azure Analysis Services (AAS) or SQL Server Analysis Services (SSAS).
- Say you have a Power BI report that's built on a live connection to a data source, and you add other measures to the report in Power BI. If you use the Export with live connection option to export data from a visual in that report, the measures that you added won't be available in the data you export to Excel. Only measures from the data source will be available in the exported data.
- Mac users can only use Excel for the web to explore Excel workbooks containing Power BI datasets.
- The column name and order in a Power BI visual may not be preserved when data is exported to Excel from that visual.

## Next steps

- Now that you've created the Excel workbook with refreshable Power BI data, it's time to [design a report in Excel with that Power BI data](service-analyze-power-bi-datasets-excel.md)
- [Connect Excel to Power BI datasets](service-connect-power-bi-datasets-excel.md)
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
