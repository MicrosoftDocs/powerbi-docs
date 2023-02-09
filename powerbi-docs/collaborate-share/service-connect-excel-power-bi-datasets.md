---
title: Power BI dataset experience in Excel 
description: In Excel Desktop or Excel for the web, you can discover all the Power BI datasets that you have access to. You can explore that data in Excel spreadsheets using PivotTables and other Excel capabilities.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ikedeagu
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 02/06/2023
LocalizationGroup: Share your work
---
# Power BI dataset experience in Excel

In Excel Desktop or Excel for the web, you can discover all the Power BI datasets that you have access to. You can explore that data in Excel spreadsheets using PivotTables and other Excel capabilities. With the Power BI dataset experience in Excel, you can:  

- Easily search for your Power BI data in Excel and analyze that data using PivotTables.
- Navigate to the Data hub in the Power BI service (`https://app.powerbi.com`), where you can discover other data artifacts (including Power BI datamarts) and trusted data in your organization.
- Derive additional insights on the dataset you are exploring in Excel by viewing related Power BI reports.

## Requirements 

- Your organization’s tenant administrator must enable the **Users can work with Power BI datasets in Excel using a live connection** tenant setting. Learn more about the [Excel live connection](../admin/service-admin-portal-export-sharing.md#users-can-work-with-power-bi-datasets-in-excel-using-a-live-connection) tenant setting in the admin portal documentation.
- For on-premises datasets, your organization’s tenant administrator also must enable the **Allow XMLA endpoints and Analyze in Excel with on-premises datasets** tenant setting. Learn more about the [Allow XMLA endpoints](../admin/service-admin-portal-integration.md#allow-xmla-endpoints-and-analyze-in-excel-with-on-premises-datasets) tenant setting in the admin portal documentation.
- You must have Excel Desktop (Builds greater than or equal to **16.0.15128**) and Excel for the web. To see if you have the right build for Excel Desktop, open **File** > **Account** > **About Excel** and confirm that the first five digits of the Build number is greater than or equal to 15128. 

    :::image type="content" source="media/service-analyze-in-excel/build-excel-number.png" alt-text="Screenshot showing About Excel with Build number.":::

- You must have **Build** permission to the Power BI dataset or have at least a **Contributor** role in the Power BI workspace containing your dataset.
- You must have a Power BI license: Free, Pro or Premium Per User (PPU). Power BI Free license users can only work with datasets in My workspace or a Power BI Premium capacity. Learn more about [Power BI licenses](../fundamentals/service-features-license-type.md).
- You can use Excel workbooks containing refreshable Power BI data in both Excel Desktop and Excel for the web.

## Discover Power BI datasets in Excel

To connect to live Power BI datasets from inside Excel, use one of these two options: 

- On the **Insert** tab in Excel, select **PivotTable** > **From Power BI**. 

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/insert-pivottable-from-power-bi.png" alt-text="Screenshot of the Insert PivotTable from Power BI option.":::

- On the **Data** tab in Excel Desktop, select **Get Data** > **Power Platform** > **From Power BI**.

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/get-data-from-power-bi.png" alt-text="Screenshot showing getting to Power BI data from the Data tab.":::

After you've selected **From Power BI** using either of these options, a pane opens on the right of the screen that shows Power BI datasets you have access to.

:::image type="content" source="media/service-connect-excel-power-bi-datasets/excel-power-bi-dataset-list.png" alt-text="Screenshot showing list of Power BI dataset in Excel.":::

Each dataset card shows the following information:

- Name and owner of the Power BI dataset 
- Power BI workspace hosting the dataset. 
- Timestamp for the last time the dataset was refreshed. 
- Names of the tables in the dataset 
- Redirect web link to Power BI report(s) using the dataset in the Power BI service.  
- Redirect web link to the details page of the dataset in the Power BI service (`https://app.powerbi.com`) 

Near the search bar in the pane, there's also a redirect web link to the Power BI Data hub (`https://app.powerbi.com/datahub`). There, you can view all Power BI datasets and other data artifacts you have access to. When you select the web link, the Power BI service opens in a new tab in your web browser.

:::image type="content" source="media/service-connect-excel-power-bi-datasets/power-bi-data-hub.png" alt-text="SCreenshot of the Power BI Data hub." lightbox="media/service-connect-excel-power-bi-datasets/power-bi-data-hub.png"::::

## Connect to your Power BI data in Excel 

To start exploring your Power BI data in Excel, select one of the pre-loaded datasets in the pane or find additional datasets by typing your search parameters in the search bar and pressing Enter on your keyboard.

When you find the dataset you want, select **Insert PivotTable** in the card. A blank PivotTable is added to a new worksheet in your Excel workbook.

:::image type="content" source="media/service-connect-excel-power-bi-datasets/insert-pivottable-button.png" alt-text="Screenshot showing a dataset card and Insert PivotTable.":::

In **PivotTable Fields**, you can see all the tables and measures from your Power BI dataset. You can start building your report in Excel.

:::image type="content" source="media/service-connect-excel-power-bi-datasets/pivottable-fields-excel.png" alt-text="Screenshot showing the PivotTable Fields list in Excel." lightbox="media/service-connect-excel-power-bi-datasets/pivottable-fields-excel.png":::

## Considerations and limitations 

- After you select **From Power BI** in the Excel ribbon, the artifacts loaded in the pane are not all the datasets you have access to. They're a selection of your most used datasets. Use the search bar in the pane to get additional datasets.

- The order of Power BI datasets in the pane may be different from their order in the Data hub in the Power BI service.

- For newly created datasets, recently refreshed datasets, or datasets that you just got access to, it may take up to 24 hours for these datasets to show up in the Power BI Datasets pane. If you don't see the dataset you want, navigate to the Power BI Data hub (`https://app.powerbi.com/datahub`) from the Power BI Datasets pane in Excel and use **Analyze in Excel** to create an Excel workbook for that dataset.

## Next steps

For more information about getting data into Excel, see [Create a PivotTable from Power BI datasets](https://support.office.com/article/31444a04-9c38-4dd7-9a45-22848c666884) in the Excel documentation.

You can also access **featured tables** in Excel, in the **Data Types** gallery. To learn more about featured tables and how to access them, see [Access Power BI featured tables in Excel organization data types](service-excel-featured-tables.md). You can also read about [using Excel data types from Power BI](https://support.office.com/article/use-excel-data-types-from-power-bi-preview-cd8938ce-f963-444d-b82a-7140848241e9) in the Excel documentation.

### Other related articles

- [Create Excel workbooks with refreshable Power BI data](service-analyze-in-excel.md)
- [Design refreshable reports in Excel with Power BI data](service-analyze-power-bi-datasets-excel.md)
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
