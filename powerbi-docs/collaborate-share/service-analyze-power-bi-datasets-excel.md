---
title: Design Refreshable Reports in Excel with Power BI Data
description: Learn how to design refreshable reports in Excel with Power BI data. Analyze your data using PivotTables, Excel tables, and refresh data with live connections.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ikedeagu
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: concept-article
ms.date: 01/21/2026
ai-usage: ai-assisted
LocalizationGroup: Share your work
#customer intent: As a Power BI user I want to learn how to design refreshable reports in Excel with Power BI data
---
# Design refreshable reports in Excel with Power BI data

After you [create an Excel workbook with refreshable Power BI data](service-analyze-in-excel.md), you can start analyzing your data and designing reports in the workbook by using familiar spreadsheet functionality.

You connected to the Power BI semantic model in one of two ways:

- If you connected by using [Analyze in Excel](service-analyze-in-excel.md#analyze-in-excel) or the Power BI semantic model experience in Excel, your Excel workbook contains an empty PivotTable and Fields list from the Power BI semantic model.
- If you connected by using [export with live connection](service-analyze-in-excel.md#export-to-excel-with-live-connection), your Excel workbook contains an Excel table.  

## Prerequisites

Before you proceed, make sure you meet the following prerequisites:

- Your organization's tenant administrator must enable the **Users can work with Power BI semantic models in Excel using a live connection** tenant setting. For more information, see the [Excel live connection](/fabric/admin/service-admin-portal-export-sharing#users-can-work-with-power-bi-semantic-models-in-excel-using-a-live-connection) tenant setting in the admin portal documentation.
- For on-premises datasets, your organization's tenant administrator must also enable the **Allow XMLA endpoints and Analyze in Excel with on-premises datasets** tenant setting. For more information, see the [Allow XMLA endpoints](/fabric/admin/service-admin-portal-integration#allow-xmla-endpoints-and-analyze-in-excel-with-on-premises-datasets) tenant setting in the admin portal documentation.
- You must have **Build** permission to the Power BI semantic model or have at least a **Contributor** role in the Power BI workspace containing your semantic model.
- You must have a Power BI license: Fabric (free), Pro, or Premium Per User (PPU). Fabric (free) license users can only work with datasets in **My workspace** or a Premium capacity or Fabric F64 or greater capacity. For more information, see [Power BI licenses](../fundamentals/service-features-license-type.md).
- You can use Excel workbooks containing refreshable Power BI data in both Excel Desktop and Excel for the web.

## Analyze Power BI data with PivotTables

By using Analyze in Excel or the Power BI semantic model experience in Excel, you connected to a Power BI semantic model that you want to explore in Excel. The Excel workbook contains a Power BI connection string that links your Excel workbook to the Power BI semantic model.

:::image type="content" source="media/service-analyze-power-bi-datasets-excel/contoso-report-analyze-pivottable.png" alt-text="Screenshot of a report in the Power BI service." lightbox="media/service-analyze-power-bi-datasets-excel/contoso-report-analyze-pivottable.png":::

To create your own PivotTable report or perform validation analysis on your data, start adding fields from the PivotTable Fields into the Excel grid.

:::image type="content" source="media/service-analyze-power-bi-datasets-excel/analyze-pivottable.png" alt-text="Screenshot of PivotTable and PivotChart." lightbox="media/service-analyze-power-bi-datasets-excel/analyze-pivottable.png":::

## Analyze Power BI data with Excel tables

By using the export with live connection, you can create an Excel workbook containing an Excel table connected to Power BI. This Excel workbook also contains a Power BI connection string that links your Excel workbook to the Power BI data.

:::image type="content" source="media/service-analyze-power-bi-datasets-excel/connected-excel-table.png" alt-text="Screenshot of a connected table in Excel." lightbox="media/service-analyze-power-bi-datasets-excel/connected-excel-table.png":::

You can customize the table by adding unique formatting to the Excel table. Excel preserves that formatting when you refresh the data.  

:::image type="content" source="media/service-analyze-power-bi-datasets-excel/formatted-excel-table.png" alt-text="Screenshot of formatted table in Excel." lightbox="media/service-analyze-power-bi-datasets-excel/formatted-excel-table.png":::

## Refresh the data

Whether you have an Excel PivotTable or table connected to a Power BI semantic model, you can update data in your Excel workbook by either refreshing a specific object (PivotTable, Pivot Chart, or table) or by refreshing all objects connected to a specific Power BI semantic model.

### Refresh a single PivotTable or table

To refresh a specific object in Excel, right-click the object and select **Refresh** in the menu.

:::image type="content" source="media/service-analyze-power-bi-datasets-excel/refresh-single-object.png" alt-text="Screenshot of refreshing a single object in Excel." lightbox="media/service-analyze-power-bi-datasets-excel/refresh-single-object.png":::

### Refresh all connected objects

To refresh all objects connected to a Power BI semantic model, use either of these options:

- Select the **Data** tab in Excel, select **Refresh All** > **Refresh**.

    :::image type="content" source="media/service-analyze-power-bi-datasets-excel/refresh-multiple-objects-data-tab.png" alt-text="Screenshot of refreshing all from the Data tab." lightbox="media/service-analyze-power-bi-datasets-excel/refresh-multiple-objects-data-tab.png":::

    > [!NOTE]
    > If your Excel workbook contains other connections, Refresh All updates all the data in your workbook, including Power BI data.

- In the Excel Desktop ribbon, select **Data** > **Queries & Connections**. In the **Queries & Connections** pane,  select **Refresh**.

    :::image type="content" source="media/service-analyze-power-bi-datasets-excel/refresh-multiple-objects-pane.png" alt-text="Screenshot of the Queries and Connections pane." lightbox="media/service-analyze-power-bi-datasets-excel/refresh-multiple-objects-pane.png":::

## Related content

- [Create Excel workbooks with refreshable Power BI data](service-analyze-in-excel.md)
- [Connect Excel to Power BI semantic models](service-connect-power-bi-datasets-excel.md)
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
