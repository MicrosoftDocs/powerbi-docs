---
title: Start in Microsoft Excel to connect to Power BI datasets 
description: From a new Excel workbook, you can connect to Power BI datasets that other users share with you, either in Excel for the web or the Excel desktop app.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ikedeagu
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 12/01/2022
LocalizationGroup: Share your work
---
# Start in Microsoft Excel to connect to Power BI datasets

From a new Excel workbook in either Excel for the web or the Excel desktop app, you can connect to Power BI datasets that other users share with you. See the **Prerequisites** section of [Connect Excel to Power BI datasets](service-connect-power-bi-datasets-excel.md#prerequisites) before you get started.

## Enable connected experiences

To see the **From Power BI** option under **Get Data** in the Excel **Data** ribbon, you must enable connected experiences in Excel.  

1. In Excel, select **File** > **Options** > **Trust Center** > **Trust Center Settings**.  

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-trust-center-settings.png" alt-text="Screenshot that highlights the Trust Center Settings button.":::

1. Select **Privacy Options** > **Privacy Settings**.

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-privacy-settings.png" alt-text="Screenshot that highlights the Privacy settings button.":::

1. Select **Turn on optional connected experiences**.

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-optional-connected-experiences.png" alt-text="Screenshot that highlights the Turn on optional connected experiences option.":::

1. Select **OK** > **OK** > **OK**.

## Connect to a Power BI dataset 

1. In Excel, on the **Insert** ribbon, select **PivotTable** > **From Power BI**.  

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-create-pivottable-power-bi.png" alt-text="Screenshot that shows how to select a PivotTable from Power BI.":::

    You can also connect to Power BI datasets from the **Data** ribbon. Select **Get Data** > **From Power BI**. 

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-get-data-power-bi.png" alt-text="Screenshot that shows how to connect to Power BI from the Data ribbon.":::

    The datasets you have access to show up in the task pane on the right side of the screen. In the task pane, you see details such as the dataset name, workspace, owner of the dataset/report, and the sensitivity label applied to the dataset.

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-available-power-bi-datasets.png" alt-text="Screenshot that shows the dataset details in the task pane.":::

1. Select the dataset you want and start creating reports and visualizations in the Excel grid. 

## Considerations and limitations

In general, you can connect to Power BI datasets from Excel if you meet the following conditions:

- **Power BI license**: If the dataset is in a Premium workspace or in My workspace, you only need a free Power BI license. However, if the dataset is in any other workspace, then you need a Power BI Pro or Premium Per User (PPU) license. For more information, see [Power BI license types and capabilities](../enterprise/service-admin-licensing-organization.md#license-types-and-capabilities).

- **Build permissions**: To build reports on Power BI datasets from Excel, you need build permissions to the dataset. For more information, see [Build permission for shared datasets](../connect-data/service-datasets-build-permissions.md).
 
- **Office SKU or Web Plan**: You can only connect to Power BI datasets from Excel desktop or Excel for the web depending on your Office SKUs or Office for the web plans.

    **Excel desktop app**: You can only connect to Power BI datasets from the Excel desktop app with specific Office SKUs. If your SKU doesn’t support this feature, you can't see the Get Data menu option in the Excel desktop app. Check the Office release notes to learn if your SKU supports connecting to Power BI datasets depending on your primary update channel: 

    - [Current Channel](/officeupdates/current-channel)
    - [Monthly Enterprise Channel](/officeupdates/monthly-enterprise-channel) or 
    - [Semi-Annual Enterprise Channel](/officeupdates/semi-annual-enterprise-channel)

    **Excel for the web**: You can connect to datasets in [Excel for the web](/office365/servicedescriptions/office-online-service-description/excel-online) depending on your organization's [Office for the web plan](/office365/servicedescriptions/office-online-service-description/office-online-service-description#feature-availability-across-office-for-the-web-plans).
    
     **Analysis Services**: If a Power BI dataset has a live connection to Azure Analysis Services or SQL Server Analysis Services, you can't connect to that dataset or refresh an existing Excel workbook with that connection in Excel for the web.

See the **Prerequisites** section of [Connect Excel to Power BI datasets](service-connect-power-bi-datasets-excel.md#prerequisites) for other requirements when connecting to Power BI data in Excel.

## Next steps

For more information about getting data into Excel, see [Create a PivotTable from Power BI datasets](https://support.office.com/article/31444a04-9c38-4dd7-9a45-22848c666884) in the Excel documentation.

You can also access **featured tables** in Excel, in the **Data Types** gallery. To learn more about featured tables and how to access them, see [Access Power BI featured tables in Excel organization data types](service-excel-featured-tables.md). You can also read about [using Excel data types from Power BI](https://support.office.com/article/use-excel-data-types-from-power-bi-preview-cd8938ce-f963-444d-b82a-7140848241e9) in the Excel documentation.

### Other related articles

- [Use Power BI to analyze data in Excel](service-analyze-in-excel.md)
- [Analyze Power BI datasets in Excel](service-analyze-power-bi-datasets-excel.md)
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
