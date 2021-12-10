---
title: Build refreshable Excel reports with Power BI data
description: After you've connected to your dataset, Excel presents you with an empty PivotTable and Fields list from the Power BI dataset, and you're ready analyze your data
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ikedeagu
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 12/10/2021
LocalizationGroup: Share your work
---
# Build refreshable Excel reports with Power BI data

You've connected to a Power BI dataset in Excel by starting in [Power BI with Analyze in Excel](service-analyze-in-excel.md) or in [Excel with Get Data](service-connect-excel-power-bi-datasets.md). Now that you're connected, Excel presents you with an empty *PivotTable* and *Fields* list from the Power BI dataset, and you're ready analyze your data.

![Excel with data connected](media/service-analyze-in-excel/analyze-in-excel-connected.png)

The Excel file has an MSOLAP connection string that connects to your dataset in Power BI. When you analyze or work with the data, Excel queries that dataset in Power BI and returns the results to Excel. If that dataset connects to a live data source using DirectQuery, Power BI queries the data source and returns the result to Excel.

With that connection to the data in Power BI now established, you can create PivotTables, charts, and analyze that dataset just as you would work with a local dataset in Excel.

:::image type="content" source="media/service-analyze-power-bi-datasets-excel/analyze-powerbi-datasets-excel-pivottable.png" alt-text="Blank PivotTable for Analyze in Excel.":::

## Refresh the data

You can refresh the Power BI dataset connection to update your reports in Excel in one of two ways.

- Right-click anywhere in the PivotTable and select **Refresh**.

    :::image type="content" source="media/service-analyze-power-bi-datasets-excel/analyze-powerbi-datasets-excel-refresh.png" alt-text="Right-click anywhere in the PivotTable and select Refresh.":::

- Select **Data** in the Excel ribbon and select **Refresh**.

    :::image type="content" source="media/service-analyze-power-bi-datasets-excel/analyze-powerbi-datasets-excel-data-refresh.png" alt-text="Select Data in the Excel ribbon and select Refresh.":::

    > [!IMPORTANT]
    > **Refresh** updates the Power BI connection string for the report you see on the sheet. **Refresh All** updates all the connection strings in the Excel workbook, including non-Power BI data sources.

## Considerations and limitations

- Excel PivotTables don't support drag-and-drop aggregation of numeric fields. Your dataset in Power BI *must have pre-defined measures*. Read about [creating measures](../transform-model/desktop-measures.md).
- You may see an error message if the data is larger than 2 GB. In that case, either reduce the amount of data, for example by applying filters, or use the XMLA endpoint. Learn more about the [XMLA endpoint](../admin/service-premium-connect-tools.md).

For general [considerations and limitations](service-connect-power-bi-datasets-excel.md#considerations-and-limitations) about connecting to Power BI data in Excel, see the article "Connect Excel to Power BI datasets."

## Next steps

- [Access Power BI featured tables in Excel](service-excel-featured-tables.md)
- Read about [using Excel data types from Power BI](https://support.office.com/article/use-excel-data-types-from-power-bi-preview-cd8938ce-f963-444d-b82a-7140848241e9) in the Excel documentation.
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
