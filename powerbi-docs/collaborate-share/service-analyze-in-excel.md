---
title: Start in Power BI to analyze in Excel
description: Analyze Power BI datasets in Microsoft Excel
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.custom: contperf-fy20q4
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 12/09/2021
LocalizationGroup: Reports
---
# Start in Power BI to analyze in Excel

With **Analyze in Excel**, you can bring Power BI datasets into Excel, and then view and interact with them using PivotTables, charts, slicers, and other Excel features. 


## Connect to Power BI data with Analyze in Excel

In the Power BI service, to the workspace that contains the dataset or report you want to analyze in Excel and use any of these options:

- Select **More options (...)** next to the dataset or report name and select **Analyze in Excel**.

    ![Select More options next to the dataset or report name.](media/service-analyze-in-excel/start-powerbi-analyze-in-excel-more-options.png)
    
- Open the report and select **Export** > **Analyze in Excel**.

    :::image type="content" source="media/service-analyze-in-excel/start-powerbi-export-analyze-excel.png" alt-text="Start from a report, select Export, then Analyze in Excel.":::

- Select a dataset. In the **Dataset details** pane, under **Analyze in Excel**, select **Analyze**.

    :::image type="content" source="media/service-analyze-in-excel/start-powerbi-dataset-analyze-excel.png" alt-text="Start from a dataset, then select Analyze in Excel.":::

    >[!NOTE]
    >Remember that if you select Analyze in Excel for a report, it is the report's underlying dataset that is brought into Excel.

For any of these options, the Analyze in Excel feature should install automatically. Select **Download**.

:::image type="content" source="media/service-analyze-in-excel/install-analyze-excel-first-updates.png" alt-text="Install Analyze in Excel updates.":::

If it doesn't install automatically, see [Install Analyze in Excel](desktop-troubleshooting-analyze-in-excel.md#install-analyze-in-excel) in the article "Troubleshoot Analyze in Excel."

The Power BI service generates an Excel workbook that contains an OLAP connection to the Power BI dataset, and downloads this workbook to your computer. 

![Downloading the Excel file](media/service-analyze-in-excel/analyze-in-excel-download-xlsx.png)

The workbook file name matches the dataset (or report, or other data source) from which it was derived. So if the report was called *Sales Analysis*, then the downloaded file would be **Sales Analysis.xlsx**.

Open the new Excel file.

The first time you open the file, you may have to **Enable Editing**, depending on your [Protected view](https://support.microsoft.com/en-gb/office/what-is-protected-view-d6f09ac7-e6b9-4495-8e43-2bbcdbcb6653?ui=en-us&rs=en-gb&ad=gb).
![Screenshot of Protected view enable editing banner](media/service-analyze-in-excel/protected-view-enable-editing-banner.png)

You may also have to **Enable Content**, depending on your [Trusted document](https://support.microsoft.com/en-us/office/trusted-documents-cf872bd8-47ec-4c02-baa5-1fdba1a11b53) settings.

![Screenshot of Trusted document enable content banner](media/service-analyze-in-excel/trusted-document-enable-content-banner.png)

When using Analyze in Excel, any sensitivity label that's applied to a Power BI dataset is automatically applied to the Excel file. If the sensitivity label on the dataset later changes to be more restrictive, when you refresh the data in Excel, the label applied to the Excel file updates automatically. If the dataset changes to become less restrictive, no label inheritance or update occurs.

If you manually set sensitivity labels in Excel, they aren’t automatically overwritten by the dataset's sensitivity label. Instead, a policy tip appears with a recommendation to upgrade the label.

For more information, see [how to apply sensitivity labels in Power BI](../admin/service-security-apply-data-sensitivity-labels.md).


## Save and share your new workbook

You can **Save** the Excel workbook you create with the Power BI dataset, just like any other workbook. However, you can't publish or import the workbook back into Power BI. You can only publish or import workbooks into Power BI that have data in tables, or that have a data model. Because the new workbook just has a connection to the dataset in Power BI, publishing or importing it into Power BI would be going in circles!

Once your workbook is saved, you can share it with other Power BI users in your organization. 

When a user opens the workbook that you’ve shared your workbook with them, they see your PivotTables and data as they were when you last saved the workbook. That data may not be the latest version. To get the latest data, users must use the **Refresh** button on the **Data** ribbon. And since the workbook connects to a dataset in Power BI, the first time users try to refresh the workbook, they must sign in to Power BI and install the Excel updates.

Refresh for external connections isn't supported in Excel Online. Since users need to refresh the dataset, we recommend that they open the workbook in the desktop version of Excel.

> [!NOTE]
> Administrators for Power BI tenants can use the *Power BI admin portal* to disable the use of **Analyze in Excel** with on-premises datasets housed in Analysis Services (AS) databases. When that option is disabled, **Analyze in Excel** is disabled for AS databases, but continues to be available for other datasets.

## Considerations and limitations

- Some organizations may have Group Policy rules that prevent installing the required updates to Excel. If you can't install the updates, check with your administrator.

- Row-level security (RLS) is supported for Analyze in Excel. RLS is enforced at the data-model level, and is always applied to all users accessing data in the report. Read more about [row-level security](../admin/service-admin-rls.md).
- There may be times when using Analyze in Excel that you get an unexpected result, or the feature doesn't work as you expected. See [Troubleshoot Analyze in Excel](desktop-troubleshooting-analyze-in-excel.md) for solutions to common issues.
- Only Power BI datasets that use Import mode will preserve hierarchies in Analyze in Excel workbooks. Power BI datasets built on DirectQuery or composite models will not have their hierarchies retained when using Analyze in Excel.
- Analyze in Excel doesn't support specifying a locale by modifying the connection string _after_ a workbook has been generated.
- You may see an error message if the data is larger than 2 GB. In that case, either reduce the amount of data, for example by applying filters, or use the XMLA endpoint. Learn more about the [XMLA endpoint](../admin/service-premium-connect-tools.md).


## Next steps

You might also be interested in the following articles:

* [Use cross-report drillthrough in Power BI Desktop](../create-reports/desktop-cross-report-drill-through.md)
* [Using slicers Power BI Desktop](../visuals/power-bi-visualization-slicers.md)
* [Troubleshooting Analyze in Excel](desktop-troubleshooting-analyze-in-excel.md)
* [Access Power BI featured tables in Excel (preview)](service-excel-featured-tables.md).
* [How to apply sensitivity labels in Power BI](../admin/service-security-apply-data-sensitivity-labels.md)
