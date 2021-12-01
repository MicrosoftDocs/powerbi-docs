---
title: Connect to Power BI datasets from Excel  
description: From a new Excel workbook, you can connect to Power BI datasets that have been shared with you, either in Excel for the web or the Excel desktop app.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ikedeagu
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 11/30/2021
LocalizationGroup: Share your work
---
# Connect to Power BI datasets from Excel 

From a new Excel workbook, you can connect to Power BI datasets that have been shared with you, either in Excel for the web or the Excel desktop app.

## Prerequisites

There's no limitation for connecting to datasets in Excel for the web if you have the right Power BI license.

However, you can only connect to Power BI datasets from the Excel desktop app with specific Office SKUs. If your SKU doesn’t support this feature, you don’t see the Get Data menu option in the Excel desktop app. Check the Office release notes to learn if your Office SKU supports connecting to Power BI datasets.  

## Connect to a Power BI dataset 

1. In Excel, on the **Insert** ribbon, select **PivotTable** > **From Power BI**.  

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-create-pivottable-power-bi.png" alt-text="Select PivotTable from Power BI.":::

    You can also connect to Power BI datasets from the **Data** ribbon. Select **Get Data** > **From Power BI**. 

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-get-data-power-bi.png" alt-text="Select Get data from Power BI.":::

1. The datasets you have access to show up in the task pane on the right side of the screen. You see details such as the dataset name, workspace, owner of the dataset/report, and the sensitivity label applied to the dataset.

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-available-power-bi-datasets.png" alt-text="Select a dataset from the list.":::

1. Select the dataset you want and start creating reports and visualizations in the Excel grid. 

## Enable connected experiences 

To see the **From Power BI** option under **Get Data** in the Excel **Data** ribbon, you must enable connected experiences in Excel.  

1. In Excel, select **File** > **Options** > **Trust Center** > **Trust Center Settings**.  

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-trust-center-settings.png" alt-text="Select Trust Center Settings.":::

1. Select **Privacy Options** > **Privacy Settings**.

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-privacy-settings.png" alt-text="Select Privacy settings.":::

1. Select **Turn on optional connected experiences**.

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-optional-connected-experiences.png" alt-text="Select Turn on optional connected experiences.":::

1. Select **OK** > **OK** > **OK**.

## Next steps

- [Access Power BI featured tables in Excel](service-excel-featured-tables.md)
- Read about [using Excel data types from Power BI](https://support.office.com/article/use-excel-data-types-from-power-bi-preview-cd8938ce-f963-444d-b82a-7140848241e9) in the Excel documentation.
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
