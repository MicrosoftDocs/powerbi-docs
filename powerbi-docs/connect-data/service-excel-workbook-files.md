---
title: Get data from Excel workbook files
description: Learn how to import data from Excel workbook files into Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 07/05/2023
ms.custom: video-l2wy4XgQIu0
LocalizationGroup: Data from files
---

# Get data from Excel workbook files

Microsoft Excel is one of the most widely used business applications and one of the most common data sources for Power BI.

## Supported workbooks

Power BI supports importing or connecting to workbooks created in Excel 2007 and later. Some features that this article describes are available only in later versions of Excel. Workbooks must be in the .xlsx or .xlsm file type and be smaller than 1 GB.

### Workbooks with ranges or tables of data

If your workbook contains simple worksheets with ranges of data, be sure to format those ranges as tables to get the most out of your data in Power BI. When you create reports in Power BI, the named tables and columns in the **Tables** pane make it much easier to visualize your data.

### Workbooks with data models

A workbook can contain a data model that has one or more tables of data loaded into it via linked tables, Power Query, **Get & Transform Data** in Excel, or Power Pivot. Power BI supports all data model properties, like relationships, measures, hierarchies, and key performance indicators (KPIs).

> [!NOTE]
> You can't share workbooks that contain data models across Power BI tenants. For example, a user who signs in to Power BI with a `contoso.com` account can't share a workbook containing data models with a user who signs in with a `woodgrovebank.com` account.

### Workbooks with connections to external data sources

If your Excel workbook connects to an external data source, after your workbook is in Power BI, you can create reports and dashboards based on data from that connected source. You can also set up scheduled refresh to automatically connect to the data source and get updates. You no longer need to refresh manually by using **Get Data** in Excel. Visualizations in reports and dashboard tiles that are based on the data source update automatically. For more information, see [Data refresh in Power BI](refresh-data.md).

### Workbooks with PivotTables and charts

Whether and how your PivotTables and charts appear in Power BI depends on where you save your workbook file, and how you choose to get the file into Power BI. The rest of this article explains the options.

## Data types

Assign data specific data types in Excel to improve your Power BI experience. Power BI supports these data types:

- Whole number
- Decimal number
- Currency
- Date
- True/false
- Text

## Upload to Power BI

You can use the **Upload** button to upload files to the Power BI service. In the workspace where you want to add the file, select **Upload** at the top of the page. In the drop-down list, select:

- **OneDrive for Business** to connect to files that are stored in OneDrive for Business.
- **SharePoint**  to connect to files on any SharePoint site that you have access to.
- **Browse** to upload files from your computer.

:::image type="content" source="media/service-excel-workbook-files/upload.png" alt-text="Screenshot that shows the Upload menu options.":::

If you upload a local file, Power BI adds a copy of the file to the workspace. If you use the **OneDrive for Business** or **SharePoint** options, Power BI creates a connection to the file. As you make changes to the file in SharePoint or OneDrive, Power BI automatically syncs those changes about once an hour.

This upload method is easy to use, and the **OneDrive for Business** and **SharePoint** options use the same file selection interface as many other Microsoft products. Rather than entering a URL to a SharePoint or OneDrive location, you can select one of your sites by using the **Quick access** section or selecting **More places**.

When you upload an Excel file, the workbook item appears in Power BI just like it would in Excel Online, as shown here:

:::image type="content" source="media/service-excel-workbook-files/workbook-power-bi.png" alt-text="Screenshot that shows an Excel workbook listed in Power BI.":::

If you don't have a subscription, the **OneDrive for Business** and **SharePoint** options are unavailable, but you can still select **Browse** to get local files from your computer. This image shows the unavailable options, but the **Browse** option is enabled:

:::image type="content" source="media/service-excel-workbook-files/excel-files-new-03.png" alt-text="Screenshot that shows the unavailable options.":::

You can't use **Upload** to get files from personal OneDrive accounts, but you can upload files from your computer.

## Prepare your workbook for Power BI

Watch this video to learn more about how to make sure your Excel workbooks are ready for Power BI:

> [!NOTE]  
> This video might use earlier versions of Power BI Desktop or the Power BI service.

<iframe width="500" height="281" src="https://www.youtube.com/embed/l2wy4XgQIu0" frameborder="0" allowfullscreen></iframe>

## Where to save your workbook file

Where you save your workbook file makes a difference.

- **Local**. If you save your workbook file to a drive on your computer or another location in your organization, you can load your file into Power BI. Your file actually remains on the source drive, so Power BI doesn't really import the file. Power BI actually creates a new dataset and loads data and any data model from the workbook into the dataset.

  Local Excel workbooks open in Excel Online within Power BI. Unlike Excel workbooks stored on OneDrive or SharePoint team sites, you can't edit local Excel files within Power BI.

  Excel also has a **Publish** command on the **File** menu. Using **Publish** is effectively the same as using **Upload** > **Browse** from Power BI. If you regularly make changes to the workbook, it's often easier to update your dataset in Power BI.

- **OneDrive for Business**. Signing in to OneDrive for Business with the same account as Power BI is the most effective way to keep your work in Excel in sync with your Power BI dataset, reports, and dashboards. Both Power BI and OneDrive are in the cloud, and Power BI connects to your workbook file on OneDrive about once an hour. If Power BI finds any changes, it automatically updates your Power BI dataset, reports, and dashboards.

  As when you have a file saved to a local drive, you can use **Publish** in Excel to update your Power BI dataset and reports immediately. Otherwise, Power BI automatically synchronizes, usually within an hour.

- **SharePoint team site**. Saving your Power BI Desktop files to a SharePoint team site is almost the same as saving them to OneDrive for Business. The biggest difference is how you connect to the file from Power BI. You can specify a URL or connect to the root folder.

<a name="one-excel-workbook--two-ways-to-use-it"></a>

### Upload from OneDrive for Business

When you upload your workbook from OneDrive for Business, it appears in Power BI just like it would in Excel Online. But you also have some great features to help you pin elements from your worksheets to your dashboards.

You can't edit your workbook in Power BI, but if you need to make changes, you can select **Edit** and then choose to edit your workbook in Excel Online or open it in Excel on your computer. Any changes save to the workbook on OneDrive.

If you use Excel 2016 and later, you can also use **File** > **Publish** > **Upload** from Excel. For more information, see [Publish to Power BI from Microsoft Excel](service-publish-from-excel.md).

<a name="import-or-connect-to-an-excel-workbook-from-power-bi"></a>

> [!NOTE]
> If you upload an Excel workbook that's connected to an on-premises SQL Server Analysis Services (SSAS) cube, you can't refresh the underlying data model in the Power BI service.

## Troubleshooting and limitations

- If your workbook file is too large, see [Reduce the size of an Excel workbook to view it in Power BI](reduce-the-size-of-an-excel-workbook.md).

- The upload of Excel workbooks to a Power BI workspace isn't supported for sovereign cloud customers.

- You can't use scheduled refresh for Excel workbooks that have connections to on-premises SSAS tabular models through a gateway.

## Next steps

- **Explore your data**. After you get data and reports from your file into Power BI, you can select the new dataset to explore the data. When you select the workbook, it opens in Power BI the same as if it were in Excel Online.

- **Schedule refresh**. If your Excel workbook connects to external data sources, or if you imported from a local drive, you can set up scheduled refresh to make sure your dataset or report is always up-to-date. In most cases, setting up scheduled refresh is easy to do. For more information, see [Data refresh in Power BI](refresh-data.md).

- [Publish to Power BI from Microsoft Excel](service-publish-from-excel.md)