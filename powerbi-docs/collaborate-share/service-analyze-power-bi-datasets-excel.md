---
title: Build refreshable Excel reports with Power BI data
description: Learn how to build refreshable reports in Excel with Power BI datasets so you can analyze the data like you would with a dataset that is local to Excel.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ikedeagu
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 12/01/2022
LocalizationGroup: Share your work
---
# Build refreshable Excel reports with Power BI data

You've connected to a Power BI dataset in Excel either by [using the Analyze in Excel option in Power BI](service-analyze-in-excel.md) or by [using the Get Data option in Excel](service-connect-excel-power-bi-datasets.md). Now that you're connected, Excel gives you an empty *PivotTable* and *Fields* list from the Power BI dataset, and you're ready to analyze your data.

:::image type="content" source="media/service-analyze-in-excel/analyze-in-excel-connected.png" alt-text="Screenshot that shows Excel with a connected dataset.":::

The Excel file uses an MSOLAP connection string to connect to your dataset in Power BI. When you analyze or work with the data, Excel queries that dataset in Power BI and returns the results to Excel. If that dataset connects to a live data source using DirectQuery, Power BI queries the data source and returns the result to Excel.

With that connection to the data in Power BI now established, you can create PivotTables and charts. Then, you can analyze that dataset just as you would with a local dataset in Excel.

:::image type="content" source="media/service-analyze-power-bi-datasets-excel/analyze-powerbi-datasets-excel-pivottable.png" alt-text="Screenshot that shows a blank PivotTable for analysis in Excel.":::

## Refresh the data

You can refresh the Power BI dataset connection to update your reports in Excel in one of two ways.

- The first way is to right-click anywhere in the PivotTable and select **Refresh**.

    :::image type="content" source="media/service-analyze-power-bi-datasets-excel/analyze-powerbi-datasets-excel-refresh.png" alt-text="Screenshot that shows how to right-click anywhere in the PivotTable and select Refresh.":::

- The second way is to select **Data** in the Excel ribbon and then choose **Refresh**.

    :::image type="content" source="media/service-analyze-power-bi-datasets-excel/analyze-powerbi-datasets-excel-data-refresh.png" alt-text="Screenshot that shows where to select Data in the Excel ribbon and choose Refresh." lightbox="media/service-analyze-power-bi-datasets-excel/analyze-powerbi-datasets-excel-data-refresh.png":::

    > [!IMPORTANT]
    > The **Refresh** option updates the Power BI connection string for the report you see on the sheet. The **Refresh All** option updates all the connection strings in the Excel workbook, including non-Power BI data sources.

## Considerations and limitations

- Excel PivotTables don't support drag-and-drop aggregation of numeric fields. Your dataset in Power BI must have pre-defined measures. For more information, see [Measures in Power BI Desktop](../transform-model/desktop-measures.md).
- You may see an error message if the data is larger than 2 GB. In that case, reduce the amount of data. For example, you can reduce the amount of data by applying filters.

See the **Prerequisites** section of [Connect Excel to Power BI datasets](service-connect-power-bi-datasets-excel.md#prerequisites) for other requirements when connecting to Power BI data in Excel.

## Next steps

- [Access Power BI featured tables in Excel](service-excel-featured-tables.md)
- Read how you can [use Excel data types from Power BI](https://support.office.com/article/use-excel-data-types-from-power-bi-preview-cd8938ce-f963-444d-b82a-7140848241e9) in the Excel documentation.
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
