---
title: Start in Excel to connect to Power BI datasets 
description: From a new Excel workbook, you can connect to Power BI datasets that have been shared with you, either in Excel for the web or the Excel desktop app.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ikedeagu
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 12/07/2021
LocalizationGroup: Share your work
---
# Start in Excel to connect to Power BI datasets

From a new Excel workbook, you can connect to Power BI datasets that have been shared with you, in either Excel for the web or the Excel desktop app.

## Prerequisites

In general, you can connect to Power BI datasets from Excel if the following conditions are met:

- **Power BI license**: If the dataset is in a Premium workspace or in My workspace, you only need a free Power BI license. However, if the dataset is in a shared workspace or a Pro workspace, you need a Power BI Pro license. For datasets in a Premium Per User (PPU) workspaces, you need a PPU license.

- **Build permissions**: To build reports on Power BI datasets from Excel, you need build permissions to the dataset. Read about [Build permission for shared datasets](../connect-data/service-datasets-build-permissions.md).
 
- **Office SKU or Web Plan**: You can only connect to Power BI datasets from Excel desktop or Excel for the web depending on your Office SKUs or Office for the web plans.

    **Excel desktop app**: You can only connect to Power BI datasets from the Excel desktop app with specific Office SKUs. If your SKU doesn’t support this feature, you don’t see the Get Data menu option in the Excel desktop app. Check the Office release notes to learn if your SKU supports connecting to Power BI datasets depending on your primary update channel: 

    - [Current Channel](/officeupdates/current-channel)
    - [Monthly Enterprise Channel](/officeupdates/monthly-enterprise-channel) or 
    - [Semi-Annual Enterprise Channel](/officeupdates/semi-annual-enterprise-channel)

    **Excel for the web**: You can connect to datasets in [Excel for the web] (/office365/servicedescriptions/office-online-service-description/excel-online) depending on your organization's [Office for the web plan] (/office365/servicedescriptions/office-online-service-description/office-online-service-description#feature-availability-across-office-for-the-web-plans).
        
## Enable connected experiences 

To see the **From Power BI** option under **Get Data** in the Excel **Data** ribbon, you must enable connected experiences in Excel.  

1. In Excel, select **File** > **Options** > **Trust Center** > **Trust Center Settings**.  

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-trust-center-settings.png" alt-text="Select Trust Center Settings.":::

1. Select **Privacy Options** > **Privacy Settings**.

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-privacy-settings.png" alt-text="Select Privacy settings.":::

1. Select **Turn on optional connected experiences**.

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-optional-connected-experiences.png" alt-text="Select Turn on optional connected experiences.":::

1. Select **OK** > **OK** > **OK**.

## Connect to a Power BI dataset 

1. In Excel, on the **Insert** ribbon, select **PivotTable** > **From Power BI**.  

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-create-pivottable-power-bi.png" alt-text="Select PivotTable from Power BI.":::

    You can also connect to Power BI datasets from the **Data** ribbon. Select **Get Data** > **From Power BI**. 

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-get-data-power-bi.png" alt-text="Select Get data from Power BI.":::

1. The datasets you have access to show up in the task pane on the right side of the screen. You see details such as the dataset name, workspace, owner of the dataset/report, and the sensitivity label applied to the dataset.

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-available-power-bi-datasets.png" alt-text="Select a dataset from the list.":::

1. Select the dataset you want and start creating reports and visualizations in the Excel grid. 

## Next steps

- [Start in Excel to connect to Power BI data](service-connect-excel-power-bi-datasets.md)
- [Start in Power BI to analyze in Excel](service-analyze-in-excel.md)
- [Analyze Power BI datasets in Excel](service-analyze-power-bi-datasets-excel.md)
- Read about [using Excel data types from Power BI](https://support.office.com/article/use-excel-data-types-from-power-bi-preview-cd8938ce-f963-444d-b82a-7140848241e9) in the Excel documentation.
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
