---
title: Get data from Excel workbook files
description: Learn how to get data from Excel workbook files into Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 01/04/2023
ms.custom: video-l2wy4XgQIu0
LocalizationGroup: Data from files
---
# Get data from Excel workbook files

Microsoft Excel is one of the most widely used business applications and one of the most common ways to get data into Power BI.

## Types of workbooks that Power BI supports
Power BI supports importing or connecting to workbooks created in Excel 2007 and later. Some features this article describes are available only in later versions of Excel. Workbooks must be *.xlsx* or *.xlsm* file type and be smaller than 1 GB.

### Workbooks with ranges or tables of data
If your workbook has simple worksheets with ranges of data, be sure to format those ranges as tables to get the most out of your data in Power BI. When you create reports in Power BI, the named tables and columns in the **Fields** pane make it much easier to visualize your data.

### Workbooks with data models
A workbook can contain a data model that has one or more tables of data loaded into it by using linked tables, Power Query, **Get & Transform** in Excel, or Power Pivot. Power BI supports all data model properties, such as relationships, measures, hierarchies, and key progress indicators (KPIs).

> [!NOTE]
> You can't share workbooks with data models across Power BI tenants. For example, a user who signs in to Power BI with a `contoso.com` account can't share an Excel workbook with a user who signs in with a `woodgrovebank.com` account.

### Workbooks with connections to external data sources
If your Excel workbook connects to an external data source, once your workbook is in Power BI, you can create reports and dashboards based on data from that connected source. You can also set up scheduled refresh to automatically connect to the data source and get updates. You no longer need to refresh manually by using **Get Data** in Excel. Visualizations in reports and dashboard tiles that are based on the data source update automatically. For more information, see [Data refresh in Power BI](refresh-data.md).

### Workbooks with PivotTables and charts
Whether and how your PivotTables and charts appear in Power BI depends on where you save your workbook file, and how you choose to get the file into Power BI. The rest of this article explains the options.

## Data types
Mark data as specific data types in Excel to improve the Power BI experience. Power BI supports the following data types:

- Whole number
- Decimal number
- Currency
- Date
- True/false
- Text


## Streamlined upload to Power BI
There's a new, streamlined experience for uploading files to the Power BI service. In the workspace where you want to add the file, select the **Upload** option next to **New** at the top of the page. In the drop-down menu, select:

- **OneDrive for Business** to connect to files stored in your OneDrive for Business.
- **SharePoint**  to connect to files on any SharePoint site you have access to.
- **Browse** to upload files from your computer.

:::image type="content" source="media/service-excel-workbook-files/excel-files-new-01.png" alt-text="Screenshot of the Upload menu options.":::


If you choose to upload a local file, Power BI adds a copy of the file to the workspace. If you use the **OneDrive for Business** or **SharePoint** options, Power BI creates a connection to the file. As you make changes to the file in SharePoint, Power BI can automatically sync those changes about once an hour.

This upload method is easy to use, and the **OneDrive for Business** and **SharePoint** options use the same file selection interface as many other Microsoft products. Rather than having to enter a direct URL to a SharePoint site, you can select one of your sites through the **Quick access** section or the **More places** links.

When you upload an Excel file, the workbook item appears in Power BI just like it would in Excel Online, as shown in the following image:

:::image type="content" source="media/service-excel-workbook-files/excel-files-new-02.png" alt-text="Screenshot of an Excel workbook listed in Power BI.":::

If you don't have a subscription, the **OneDrive for Business** and **SharePoint** options are disabled, but you can still select **Browse** to get local files from your computer. The following image shows the subscription options disabled, with the **Browse** option highlighted.


:::image type="content" source="media/service-excel-workbook-files/excel-files-new-03.png" alt-text="Screen shot of subscription services disabled.":::

If you want to import data from an Excel file into a Power BI dataset, use the **Get data** experience. For more information, see [Import or connect to an Excel workbook by using Get data](#import-or-connect-by-using-get-data).

You can't use **Upload** to get files from personal OneDrive accounts, but you can continue to use the [Get data](#import-or-connect-by-using-get-data) experience for workbooks in personal OneDrive accounts.

## Prepare your workbook for Power BI
Watch this helpful video to learn more about how to make sure your Excel workbooks are ready for Power BI.

> [!NOTE]  
> This video might use earlier versions of Power BI Desktop or the Power BI service.

<iframe width="500" height="281" src="https://www.youtube.com/embed/l2wy4XgQIu0" frameborder="0" allowfullscreen></iframe>

## Where to save your workbook file
Where you save your workbook file makes a difference.

- **Local**. If you save your workbook file to a drive on your computer or another location in your organization, you can load your file into Power BI. Your file actually remains on the source drive, so Power BI doesn't really import the file. Power BI actually creates a new dataset and loads data and any data model from the workbook into the dataset.

  Excel also has a **Publish** feature under the **File** menu. Using **Publish** is effectively the same as using **Get Data** > **Files** > **Local File** from Power BI. If you regularly make changes to the workbook, it's often easier to update your dataset in Power BI.

- **OneDrive - Business**. Signing in to OneDrive for Business with the same account as Power BI is by far the most effective way to keep your work in Excel and your Power BI dataset, reports, and dashboards in sync. Both Power BI and OneDrive are in the cloud, so Power BI connects to your workbook file on OneDrive about once an hour. If Power BI finds any changes, it automatically updates your Power BI dataset, reports, and dashboards.

  Just like with saving to a local drive, you can also use **Publish** in Excel to update your Power BI dataset and reports immediately. Otherwise, Power BI automatically synchronizes, usually within an hour.

- **OneDrive - Personal**. If you save your workbook files to your personal OneDrive account, you get many of the same benefits as with OneDrive for Business. The biggest difference is that when you first connect to your file by using **Get Data** > **Files** > **OneDrive – Personal**, you need to sign in to your OneDrive with your Microsoft account, which might be different from the account you use to sign in to Power BI.

  When you sign in to your OneDrive with your Microsoft account, be sure to select the **Keep me signed in** option. Power BI can then connect to your workbook file about every hour and make sure your Power BI dataset and reports are in sync.

- **SharePoint - Team Sites**. Saving your Power BI Desktop files to SharePoint Team Sites is much the same as saving to OneDrive for Business. The biggest difference is how you connect to the file from Power BI. You can specify a URL or connect to the root folder.


<a name="one-excel-workbook--two-ways-to-use-it"></a>
## Import or connect from OneDrive for Business
If you save your workbook files to OneDrive for Business, you have a couple of ways to explore your data in Power BI, **Import** or **Connect**.

![Screenshot of OneDrive for work or school, showing the option to Import or Connect to Excel data.](media/service-excel-workbook-files/excel_import_connect.png)

### Import Excel data into Power BI
When you choose **Import**, Power BI imports any supported data in tables and any data model into a new Power BI dataset.

You can continue editing your workbook. When you save your changes, Power BI synchronizes them with the dataset in Power BI, usually within about an hour. If you need more immediate gratification, you can select **Publish** to export your changes. Any visualizations in reports and dashboards are updated, too, based on the following refresh triggers:

|Report tiles  |Dashboard tiles  |
|---------|---------|
|Open the report, after the cache expires.|Open the dashboard, after the cache refreshes.|
|Select **Refresh** in the report.|Select **Refresh** in the dashboard.|
|     |Automatically for pinned tiles when the cache refreshes, if the dashboard is already open.|

> [!NOTE]
> Pinned report pages don't have the automatic refresh feature.

Choose the **Import** option if you used **Get & Transform Data** or **Power Pivot** to load data into a data model.

### Connect, manage, and view Excel data in Power BI
When you choose **Connect**, your workbook appears in Power BI just like it would in Excel Online. But you also have some great features to help you pin elements from your worksheets to your dashboards.

You can't edit your workbook in Power BI, but if you need to make changes, you can select **Edit** and then choose to edit your workbook in Excel Online or open it in Excel on your computer. Any changes save to the workbook on OneDrive.

Choose the **Connect** option if you have only data in worksheets, or you have ranges, PivotTables and charts you want to pin to dashboards.

In Excel 2016 and later, you can also use **File** > **Publish** > **Upload**. It's essentially the same thing. For more information, see [Publish to Power BI from Microsoft Excel](service-publish-from-excel.md).

<a name="import-or-connect-to-an-excel-workbook-from-power-bi"></a>
## Import or connect by using Get data

Instead of using the **Upload** option from your workspace, you can use **Get data** to import or connect to an Excel workbook.

1. At the bottom of the Power BI navigation pane, select **Get data**.
   
   :::image type="content" source="media/service-excel-workbook-files/excel_get_data_button.png" alt-text="Screenshot of Get data in the navigation pane.":::
   
2. Under **Files**, select **Get**.
   
   ![Screenshot of the Files tile, showing the Get button.](media/service-excel-workbook-files/excel_files_get.png)
3. Find and select your file.
   
   ![Screenshot of the Local File, OneDrive - Business, OneDrive - Personal, and SharePoint - Team Sites tiles.](media/service-excel-workbook-files/excel_find_your_file.png)
4. If your workbook file is on OneDrive or SharePoint team sites, select **Import** or **Connect**.

### Local Excel workbooks
To upload a local Excel file into Power BI:

1. Select **Get data**, select **Get** under **Files**, and then select **Local File**.

1. Navigate to where you saved your Excel workbook, select your file, and select **Open**.

   ![Screenshot of the Local File tile, showing how to navigate to select the Excel workbooks.](media/service-excel-workbook-files/excel_import_6.png)

1. Select **Upload**.

   ![Screenshot of the Local File dialog, showing the Upload selection.](media/service-excel-workbook-files/excel_import_7.png)

Once your workbook is uploaded, you can find it in the navigation pane in the **Workbooks** section of the workspace, and in the content list for the workspace.

![Screenshot of the Workbooks section, showing the Excel workbook.](media/service-excel-workbook-files/excel_import_9.png)

Local Excel workbooks open in Excel Online within Power BI. Unlike Excel workbooks stored on OneDrive or SharePoint team sites, you can't edit local Excel files within Power BI.

## Publish from Excel to your Power BI site
Using the Excel **Publish to Power BI** feature is effectively the same as using **Get data** in Power BI to import or connect to your file. For more information, see [Publish to Power BI from Microsoft Excel](service-publish-from-excel.md).

> [!NOTE]
> If you upload an Excel workbook that's connected to an on-premises SQL Server Analysis Services (SSAS) cube, you can't refresh the underlying data model in the Power BI service.

## Troubleshooting and limitations
- If your workbook file is too large, see [Reduce the size of an Excel workbook to view it in Power BI](reduce-the-size-of-an-excel-workbook.md).

- When you choose **Import**, Power BI imports only data that's part of a named table or a data model. If the workbook doesn't contain any named tables or Excel data models, you might see the error **Error: We couldn't find any data formatted as a table. To import from Excel into the Power BI service, you need to format the data as a table**. To fix your workbook and reimport it, see [Error: We couldn't find any data in your Excel workbook](service-admin-troubleshoot-excel-workbook-data.md).

- The upload of Excel workbooks to a Power BI workspace isn't supported for sovereign cloud customers.

- Scheduled refresh of Excel workbooks with connections to on-premises SSAS tabular models through a gateway won't work.

## Next steps
- **Explore your data**. Once you get data and reports from your file into Power BI, you can right-click the new dataset and select **Explore**. If you chose to connect to a workbook file on OneDrive, your workbook appears under **Reports**. When you select the workbook, it opens in Power BI the same as if it were in Excel Online.

- **Schedule refresh**. If your Excel workbook connects to external data sources, or you imported from a local drive, you can set up scheduled refresh to make sure your dataset or report is always up-to-date. In most cases, setting up scheduled refresh is easy to do. For more information, see [Data refresh in Power BI](refresh-data.md) to learn more.

- [Publish to Power BI from Microsoft Excel](service-publish-from-excel.md)

