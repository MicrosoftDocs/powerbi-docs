---
title: Power BI semantic model experience in Excel 
description: In Excel Desktop or Excel for the web, you can discover all the Power BI semantic models that you have access to. You can explore that data in Excel spreadsheets using PivotTables and other Excel capabilities.
author: ajburnle
ms.author: ajburnle
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 01/11/2024
LocalizationGroup: Share your work
---
# Power BI semantic model experience in Excel

In Excel Desktop or Excel for the web, you can discover all the Power BI semantic models that you have access to. You can explore that data in Excel spreadsheets using PivotTables and other Excel capabilities. With the Power BI semantic model experience in Excel, you can:  

- Easily search for your Power BI data in Excel and analyze that data using PivotTables and connected tables.
- Navigate to the Data hub in the Power BI service (`https://app.powerbi.com`), where you can discover other data artifacts (including Power BI datamarts) and trusted data in your organization.
- Get additional insights on the semantic model you are exploring in Excel by viewing related Power BI reports.

## Requirements

- Your organization’s tenant administrator must enable the **Users can work with Power BI semantic models in Excel using a live connection** tenant setting. Learn more about the [Excel live connection](/fabric/admin/service-admin-portal-export-sharing#users-can-work-with-power-bi-semantic-models-in-excel-using-a-live-connection) tenant setting in the admin portal documentation.
- For on-premises datasets, your organization’s tenant administrator also must enable the **Allow XMLA endpoints and Analyze in Excel with on-premises datasets** tenant setting. Learn more about the [Allow XMLA endpoints](/fabric/admin/service-admin-portal-integration#allow-xmla-endpoints-and-analyze-in-excel-with-on-premises-datasets) tenant setting in the admin portal documentation.
- Your version of Excel Desktop must be an updated version of Excel for the web. To see if you have the right build for Excel Desktop, open **File** > **Account** > **About Excel** and confirm that the first five digits of the Build number are greater than or equal to 15128.

    :::image type="content" source="media/service-analyze-in-excel/build-excel-number.png" alt-text="Screenshot showing About Excel with Build number.":::

- You must have **Build** permission to the Power BI semantic model or have at least a **Contributor** role in the Power BI workspace containing your semantic model.
- You must have a Fabric license: Fabric (free), Pro or Premium Per User (PPU). Fabric (free) license users can only work with datasets in My workspace or a Power BI Premium capacity or Fabric F64 or greater capacity. Learn more about [Power BI licenses](../fundamentals/service-features-license-type.md).
- You can use Excel workbooks containing refreshable Power BI data in both Excel Desktop and Excel for the web.

## Discover Power BI semantic models in Excel

To connect to live Power BI semantic models from inside Excel, use one of these two options: 

- On the **Insert** tab in Excel, select **PivotTable** > **From Power BI**. 

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/insert-pivottable-from-power-bi.png" alt-text="Screenshot of the Insert PivotTable from Power BI option.":::

- On the **Data** tab in Excel Desktop, select **Get Data** > **Power Platform** > **From Power BI**.

    :::image type="content" source="media/service-connect-excel-power-bi-datasets/get-data-from-power-bi.png" alt-text="Screenshot showing getting to Power BI data from the Data tab.":::

After you've selected **From Power BI** using either of these options, a pane opens on the right of the screen that shows Power BI semantic models you have access to.

:::image type="content" source="media/service-connect-power-bi-datasets-excel/excel-datasets-pane.png" alt-text="Screenshot showing list of Power BI semantic model in Excel.":::

Each semantic model card shows the following information:

- Name and owner of the Power BI semantic model 
- Power BI workspace hosting the semantic model. 
- Timestamp for the last time the semantic model was refreshed. 
- Names of the tables in the semantic model 
- Redirect web link to Power BI report(s) using the semantic model in the Power BI service.  
- Redirect web link to the details page of the semantic model in the Power BI service (`https://app.powerbi.com`) 

Near the search bar in the pane, there's also a redirect web link to the Power BI Data hub (`https://app.powerbi.com/datahub`). There, you can view all Power BI semantic models and other data artifacts you have access to. When you select the web link, the Power BI service opens in a new tab in your web browser.

:::image type="content" source="media/service-connect-excel-power-bi-datasets/power-bi-data-hub.png" alt-text="SCreenshot of the Power BI Data hub." lightbox="media/service-connect-excel-power-bi-datasets/power-bi-data-hub.png"::::

## Connect to your Power BI data in Excel 

To start exploring your Power BI data in Excel, select one of the pre-loaded semantic models in the pane or find additional semantic models by typing your search parameters in the search bar and pressing Enter on your keyboard.

When you find the semantic model you want, select **Insert PivotTable** or **Insert Table** in the card. The **Insert Table** option is available in Excel Desktop.

:::image type="content" source="media/service-connect-power-bi-datasets-excel/insert-pivot-table-insert-table-button.png" alt-text="Screenshot showing a semantic model card and Insert PivotTable and Insert Table buttons.":::

When you select **Insert PivotTable**, a blank PivotTable is added to a new worksheet in your Excel workbook. In **PivotTable Fields**, you can see all the tables and measures from your Power BI semantic model. You can start building your report in Excel.

:::image type="content" source="media/service-connect-excel-power-bi-datasets/pivottable-fields-excel.png" alt-text="Screenshot showing the PivotTable Fields list in Excel." lightbox="media/service-connect-excel-power-bi-datasets/pivottable-fields-excel.png":::

When you select **Insert Table**, the **Create Table** dialog opens, where you can use the Data, Build, and Filters panes to design the table you'd like. Use the **Insert Table** button to add the table to the Excel sheet.  

:::image type="content" source="media/service-connect-power-bi-datasets-excel/create-table-insert-table.png" alt-text="Screenshot showing the Create Table dialog." lightbox="media/service-connect-power-bi-datasets-excel/create-table-insert-table.png":::


## Considerations and limitations 

- After you select **From Power BI** in the Excel ribbon, the artifacts loaded in the pane are not all the semantic models you have access to. They're a selection of your most used semantic models. Use the search bar in the pane to get additional semantic models.
- The **Insert Table** option is only available in Excel Desktop. 

- The order of Power BI semantic models in the pane may be different from their order in the Data hub in the Power BI service.

- For newly created semantic models, recently refreshed semantic models, or semantic models that you just got access to, it may take up to 24 hours for these semantic models to show up in the Power BI Semantic models pane. If you don't see the semantic model you want, navigate to the Power BI OneLake data hub (`https://app.powerbi.com/datahub`) from the Power BI Semantic models pane in Excel and use **Analyze in Excel** to create an Excel workbook for that semantic model.

- Excel and Power BI visuals use different query languages and data load behaviors, so data load performance can be different between Excel and Power BI.

- The Power BI Datasets in Excel Add-In is currently unavailable in Excel for the web in all Sovereign clouds.

## Related content

For more information about getting data into Excel, see [Create a PivotTable from Power BI semantic models](https://support.office.com/article/31444a04-9c38-4dd7-9a45-22848c666884) in the Excel documentation.

You can also access **featured tables** in Excel, in the **Data Types** gallery. To learn more about featured tables and how to access them, see [Access Power BI featured tables in Excel organization data types](service-excel-featured-tables.md). You can also read about [using Excel data types from Power BI](https://support.office.com/article/use-excel-data-types-from-power-bi-preview-cd8938ce-f963-444d-b82a-7140848241e9) in the Excel documentation.

- [Create Excel workbooks with refreshable Power BI data](service-analyze-in-excel.md)
- [Design refreshable reports in Excel with Power BI data](service-analyze-power-bi-datasets-excel.md)
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
