<properties
   pageTitle="Publish to Power BI from Excel 2016"
   description="Learn how to publish an Excel workbook to your Power BI site."
   services="powerbi"
   documentationCenter=""
   authors="Minewiskan"
   manager="mblythe"
   editor=""
   tags=""
   qualityFocus="complete"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="04/01/2016"
   ms.author="owend"/>

# Publish to Power BI from Excel 2016
With Excel 2016, you can publish your Excel workbooks right to your [Power BI](https://powerbi.microsoft.com) site, where you can create highly interactive reports and dashboards based on your workbook’s data. You can then share your insights with others in your organization.

Before we go any further, there are few things to keep in mind:

- Before you can publish to Power BI, your workbook must be saved to OneDrive for Business.
- The account you use to sign in to Office, OneDrive for Business, and Power BI must be the same account.
- You cannot publish an empty workbook or a workbook that doesn’t have any Power BI supported content.
- You cannot publish encrypted or password protected workbooks, or workbooks with Information Protection Management.
- Publishing to Power BI requires modern authentication be enabled (default). If disabled, the Publish option is not available from the File menu.

## To publish your Excel workbook
In Excel, click **File** > **Publish**.

If your workbook isn’t already saved to OneDrive, you’ll need to save it there first. Click Save to Cloud and choose a location in OneDrive for Business.

![](media/powerbi-service-publish-from-excel/pbi_SaveToOneDrive.png)

Once your workbook is saved to OneDrive, when you click **Publish**, you’ll get two options on how to get your workbook into Power BI.

![](media/powerbi-service-publish-from-excel/pbi_UploadExport.png)
### Upload your workbook to Power BI
When you choose this option, your workbook will appear in Power BI just like it would in Excel Online. But, unlike Excel Online, you’ll have some great features to help you pin elements from your worksheets to dashboards.

You can’t edit your workbook in when open in Power BI, but if you need to make some changes, you can click **Edit**, and then choose to edit your workbook in Excel Online or open it in Excel on your computer. Any changes you make are saved to the workbook on OneDrive.

When you upload, no dataset is created in Power BI. Your workbook will appear in Reports, in your workspace navigation pane. Workbooks uploaded to Power BI have a special Excel icon, identifying them as Excel workbooks that have been uploaded.

Choose this option if you only have data in worksheets, or you have PivotTables and Charts you want to see in Power BI.
Using Upload from Publish to Power BI in Excel is pretty much the same as using Get Data > File > OneDrive for Business >Connect, Manage and View Excel in Power BI from Power BI in your browser.

### Export workbook data to Power BI
When you choose this option, any supported data in tables and/or a data model are exported into a new dataset in Power BI. If you have any Power View sheets, those will be re-created in Power BI as reports.

You can continue editing your workbook. When your changes are saved, they’ll be synchronized with the dataset in Power BI, usually within about an hour. If you need more immediate gratification, you can just click Publish again, and your changes are exported right then and there. Any visualizations you have in reports and dashboards will be updated, too.

Choose this option if you’ve used Get & Transform data or Power Pivot to load data into a data model, or if your workbook has Power View sheets with visualizations you want to see in Power BI.

Using Export from Publish to Power BI in Excel is pretty much the same as using Get Data > File > OneDrive for Business >Export Excel data into Power BI from Power BI in your browser.

## Publishing
When you choose either option, Excel will sign in to Power BI with your current account, and then publish your workbook to your Power BI site. Keep an eye on the status bar in Excel. It shows how things are going.

![](media/powerbi-service-publish-from-excel/pbi_PublishingStatus.png)

When complete, you can go to Power BI right from Excel.

![](media/powerbi-service-publish-from-excel/pbi_GoToPBI.png)

## See also
[Excel data in Power BI](articles/powerbi-service-excel-data.md)
