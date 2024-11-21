---
title: Design refreshable reports in Excel with Power BI data
description: Learn how you can start analyzing your data and building reports in the workbook using familiar spreadsheet functionality.
author: ajburnle
ms.author: ajburnle
ms.reviewer: ikedeagu
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 02/13/2023
LocalizationGroup: Share your work
---
# Design refreshable reports in Excel with Power BI data

Now that you've [created an Excel workbook with refreshable Power BI data](service-analyze-in-excel.md), you can start analyzing your data and designing reports in the workbook using familiar spreadsheet functionality.

You've connected to the Power BI semantic model in one of two ways:

- If you connected using [Analyze in Excel](service-analyze-in-excel.md#analyze-in-excel) or the Power BI semantic model experience in Excel, your Excel workbook contains an empty PivotTable and Fields list from the Power BI semantic model. 
- If you connected via [export with live connection](service-analyze-in-excel.md#export-to-excel-with-live-connection), your Excel workbook contains an Excel table.  

## Prerequisites

- Your organization’s tenant administrator must enable the **Users can work with Power BI semantic models in Excel using a live connection** tenant setting. Learn more about the [Excel live connection](/fabric/admin/service-admin-portal-export-sharing#users-can-work-with-power-bi-semantic-models-in-excel-using-a-live-connection) tenant setting in the admin portal documentation.
- For on-premises datasets, your organization’s tenant administrator also must enable the **Allow XMLA endpoints and Analyze in Excel with on-premises datasets** tenant setting. Learn more about the [Allow XMLA endpoints](/fabric/admin/service-admin-portal-integration#allow-xmla-endpoints-and-analyze-in-excel-with-on-premises-datasets) tenant setting in the admin portal documentation.
- You must have **Build** permission to the Power BI semantic model or have at least a **Contributor** role in the Power BI workspace containing your semantic model.
- You must have a Power BI license: Fabric (free), Pro or Premium Per User (PPU). Fabric (free) license users can only work with datasets in My workspace or a Premium capacity or Fabric F64 or greater capacity. Learn more about [Power BI licenses](../fundamentals/service-features-license-type.md).
- You can use Excel workbooks containing refreshable Power BI data in both Excel Desktop and Excel for the web.

## Analyze your Power BI data with PivotTables 

With Analyze in Excel or the Power BI semantic model experience in Excel, you've connected to a Power BI semantic model that you want to explore in Excel. The Excel workbook contains a Power BI connection string that links your Excel workbook to the Power BI semantic model. 

:::image type="content" source="media/service-analyze-power-bi-datasets-excel/contoso-report-analyze-pivottable.png" alt-text="Screenshot showing a report in the Power BI service." lightbox="media/service-analyze-power-bi-datasets-excel/contoso-report-analyze-pivottable.png":::

Start adding fields from the PivotTable Fields into the Excel grid to create your own PivotTable report or perform validation analysis on your data. 

:::image type="content" source="media/service-analyze-power-bi-datasets-excel/analyze-pivottable.png" alt-text="Screenshot showing PivotTable and PivotChart." lightbox="media/service-analyze-power-bi-datasets-excel/analyze-pivottable.png":::

## Analyze your Power BI data with Excel tables 

With the export with live connection, you can create an Excel workbook containing an Excel table connected to Power BI. This Excel workbook also contains a Power BI connection string that links your Excel workbook to the Power BI data. 

:::image type="content" source="media/service-analyze-power-bi-datasets-excel/connected-excel-table.png" alt-text="Screenshot showing a connected table in Excel." lightbox="media/service-analyze-power-bi-datasets-excel/connected-excel-table.png":::

You can customize the table by adding unique formatting to the Excel table. That formatting is preserved when you refresh the data in Excel.  

:::image type="content" source="media/service-analyze-power-bi-datasets-excel/formatted-excel-table.png" alt-text="Screenshot showing formatted table in Excel." lightbox="media/service-analyze-power-bi-datasets-excel/formatted-excel-table.png":::

## Refresh the data 

Whether you have an Excel PivotTable or table connected to a Power BI semantic model, you can update data in your Excel workbook by either refreshing a specific object (PivotTable, Pivot Chart, or table), or by refreshing all objects connected to a specific Power BI semantic model.

### Refresh a single object

To refresh a specific object in Excel, right-click the object and select **Refresh** in the menu.

:::image type="content" source="media/service-analyze-power-bi-datasets-excel/refresh-single-object.png" alt-text="Screenshot showing refreshing a single object in Excel." lightbox="media/service-analyze-power-bi-datasets-excel/refresh-single-object.png":::

### Refresh all objects

To refresh all objects connected to a Power BI semantic model, use either of these options: 

- Select the **Data** tab in Excel, select **Refresh All** > **Refresh**.

    :::image type="content" source="media/service-analyze-power-bi-datasets-excel/refresh-multiple-objects-data-tab.png" alt-text="Screenshot showing refreshing all from the Data tab." lightbox="media/service-analyze-power-bi-datasets-excel/refresh-multiple-objects-data-tab.png":::

    > [!NOTE]
    > If you have other connections in your Excel workbook, Refresh All will update all the data in your workbook, including Power BI data.

- In the Excel Desktop ribbon, select **Data** > **Queries & Connections**. In the **Queries & Connections** pane,  select **Refresh**.

    :::image type="content" source="media/service-analyze-power-bi-datasets-excel/refresh-multiple-objects-pane.png" alt-text="Screenshot showing the Queries and Connections pane." lightbox="media/service-analyze-power-bi-datasets-excel/refresh-multiple-objects-pane.png":::

## Related content

- [Create Excel workbooks with refreshable Power BI data](service-analyze-in-excel.md)
- [Connect Excel to Power BI semantic models](service-connect-power-bi-datasets-excel.md)
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
