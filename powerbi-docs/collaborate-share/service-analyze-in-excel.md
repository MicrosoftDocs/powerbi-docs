---
title: Start in Power BI with Analyze in Excel
description: Learn how to bring Power BI datasets into Excel, view, and interact with them using Analyze in Excel.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ikedeagu
ms.custom: contperf-fy20q4
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 10/18/2022
LocalizationGroup: Reports
---
# Start in Power BI with Analyze in Excel

With **Analyze in Excel**, you can bring Power BI datasets into Excel, view, and interact with them using PivotTables, charts, slicers, and other Excel features. For more information, See the **Prerequisites** section of [Connect Excel to Power BI datasets](service-connect-power-bi-datasets-excel.md#prerequisites) before you get started.

## Connect to Power BI data with Analyze in Excel

In the Power BI service, go to the workspace that contains the dataset or report you want to analyze in Excel and use any of the following options:

- Select **More options (...)** next to the dataset or report name and select **Analyze in Excel**.

    :::image type="content" source="media/service-analyze-in-excel/start-powerbi-analyze-in-excel-more-options.png" alt-text="Screenshot of My workspace showing Analyze in Excel action from more options dropdown menu selected.":::  
    
- Open the report and select **Export** > **Analyze in Excel** from the top ribbon.

    :::image type="content" source="media/service-analyze-in-excel/start-powerbi-export-analyze-excel.png" alt-text="Start from a report, select Export, then Analyze in Excel.":::

- Select a dataset. In the **Dataset details** pane, select **Analyze in Excel** on the menu bar.

    :::image type="content" source="media/service-analyze-in-excel/start-powerbi-dataset-analyze-excel.png" alt-text="Start from a dataset, then select Analyze in Excel."  lightbox="media/service-analyze-in-excel/start-powerbi-dataset-analyze-excel-expanded.png":::

    >[!NOTE]
    >If you select **Analyze in Excel** for a report, it's the report's underlying dataset that's brought into Excel.

The Power BI service generates an Excel workbook that contains an OLAP connection to the Power BI dataset, and automatically saves this Excel workbook to your OneDrive for work or school. You can open the Excel workbook by selecting **Open in Excel for the web**. The workbook opens in a new browser tab.

:::image type="content" source="media/service-analyze-in-excel/open-workbook-excel-web-app.png" alt-text="Screenshot of Analyze in Excel dialog.":::
    
>[!NOTE]
>If you don't have OneDrive for work or school in your environment, select **Analyze in Excel** to download the Excel workbook to your computer's local Downloads folder.
    
The workbook file name matches the dataset (or report, or other data source) from which it was derived. So if the report was called *Sales Analysis*, the file name would be **Sales Analysis.xlsx**.
    
When you open the workbook in Excel for the web, you may have to enable the Power BI query by selecting **Yes** so you can start building your PivotTable reports.
    
:::image type="content" source="media/service-analyze-in-excel/excel-web-query-warning-dialog.png" alt-text="Screenshot of Excel for the web warning dialog.":::
    
You can also open the workbook file in Excel Desktop by selecting **Open in Desktop App** in the Excel for the web ribbon.

:::image type="content" source="media/service-analyze-in-excel/open-workbook-excel-desktop-app.png" alt-text="Screenshot of Open Excel Desktop App button in Excel for the web.":::
    
The first time you open the file in Excel Desktop, you might need to select **Enable Editing**, depending on your [Protected view](https://support.microsoft.com/en-gb/office/what-is-protected-view-d6f09ac7-e6b9-4495-8e43-2bbcdbcb6653?ui=en-us&rs=en-gb&ad=gb).
![Screenshot of Protected view enable editing banner](media/service-analyze-in-excel/protected-view-enable-editing-banner.png)

You might also have to select **Enable Content**, depending on your [Trusted document](https://support.microsoft.com/en-us/office/trusted-documents-cf872bd8-47ec-4c02-baa5-1fdba1a11b53) settings.

![Screenshot of Trusted document enable content banner](media/service-analyze-in-excel/trusted-document-enable-content-banner.png)

When you use Analyze in Excel, any sensitivity label that's applied to a Power BI dataset is automatically applied to the Excel file. If the sensitivity label on the dataset later changes to be more restrictive, when you refresh the data in Excel, the label applied to the Excel file gets updated automatically. If the dataset changes to become less restrictive, no label inheritance or update occurs.

If you manually set sensitivity labels in Excel, they aren’t automatically overwritten by the dataset's sensitivity label. Instead, a policy tip appears with a recommendation to upgrade the label.

For more information, see [How to apply sensitivity labels in Power BI](../enterprise/service-security-apply-data-sensitivity-labels.md).


## Save and share your new workbook

You can save the Excel workbook you create with the Power BI dataset, just like any other workbook. However, you can't publish or import the workbook back into Power BI. You can only publish or import workbooks into Power BI that have data in tables, or a data model. Because the new workbook has a connection to the dataset in Power BI, publishing or importing it into Power BI would be going in circles.

After you save your workbook, you can share it with other Power BI users in your organization. 

When a user opens your workbook, the data might not be the latest version. They see your PivotTables, and data as they were when you last saved the workbook.To get the latest data, users must use the **Refresh** button on the **Data** ribbon. And because the workbook connects to a dataset in Power BI, the first time users try to refresh the workbook, they must sign in to Power BI and install the Excel updates.

Refreshing for external connections isn't supported in Excel Online. Because users need to refresh the dataset, we recommend that they open the workbook in the desktop version of Excel.

> [!NOTE]
> Administrators for Power BI tenants can use the *Power BI admin portal* to disable the use of **Analyze in Excel** with on-premises datasets that are housed in Analysis Services (AS) databases. When that option is disabled, **Analyze in Excel** is disabled for AS databases, but continues to be available for other datasets.

## Considerations and limitations

- Some organizations might have Group Policy rules that prevent you from installing the required updates to Excel. If you can't install the updates, check with your administrator.
- Row-level security (RLS) is supported for Analyze in Excel. RLS is enforced at the data-model level, and is always applied to all users who access data in the report. Read more about [row-level security](../enterprise/service-admin-rls.md).
- There may be times when you use Analyze in Excel and you get an unexpected result, or the feature doesn't work as you expect. For solutions to common issues, see [Troubleshoot Analyze in Excel](desktop-troubleshooting-analyze-in-excel.md).
- Only Power BI datasets that use Import mode preserve hierarchies in Analyze in Excel workbooks. Power BI datasets that are built on DirectQuery or composite models don't retain their hierarchies when you use Analyze in Excel.
- Analyze in Excel doesn't support specifying a locale by modifying the connection string after workbook has been generated.
- You might see an error message if the data is larger than 2 GB. In that case, either reduce the amount of data, for example by applying filters, or use the XMLA endpoint. For more information, see [XMLA endpoint](../enterprise/service-premium-connect-tools.md).
- Guest users can't analyze Power BI data in Excel for datasets that are sent from a tenant that's different from the one that hosts the datasets. 
- Analyzing Power BI data in Excel is a Power BI service feature. You can't analyze Power BI data in Excel from Power BI Report Server or Power BI Embedded.
- Analyze in Excel might not work as expected if field parameters are used in the underlying Power BI dataset.


When you connect to Power BI data in Excel, see the **Prerequisites** section of [Connect Excel to Power BI datasets](service-connect-power-bi-datasets-excel.md#prerequisites) for other requirements.

## Next steps

You might also be interested in the following articles:

* [Use cross-report drillthrough in Power BI Desktop](../create-reports/desktop-cross-report-drill-through.md)
* [Using slicers Power BI Desktop](../visuals/power-bi-visualization-slicers.md)
* [Troubleshoot connecting Excel to Power BI data](desktop-troubleshooting-analyze-in-excel.md)
* [Access Power BI featured tables in Excel (preview)](service-excel-featured-tables.md).
* [How to apply sensitivity labels in Power BI](../enterprise/service-security-apply-data-sensitivity-labels.md)
