---
title: Analyze in Excel for Power BI
description: Analyze Power BI datasets in Microsoft Excel
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.custom: contperf-fy20q4
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 11/30/2021
LocalizationGroup: Reports
---
# Analyze in Excel

With **Analyze in Excel**, you can bring Power BI datasets into Excel, and then view and interact with them using PivotTables, charts, slicers, and other Excel features. To use **Analyze in Excel** you must first download the feature from Power BI, install it, and then select one or more datasets to use in Excel. 

![Analyze in Excel](media/service-analyze-in-excel/analyze-excel-00a.png)

This article shows you how to install and use Analyze in Excel, describes its limitations, then provides some next steps. Here's what you'll learn:

* [Install Analyze in Excel](#install-analyze-in-excel)
* [Connect to Power BI data](#connect-to-power-bi-data)
* [Use Excel to analyze the data](#use-excel-to-analyze-the-data)
* [Saving and sharing your workbook](#saving-and-sharing-your-new-workbook)
* [Requirements](#requirements)

Let's jump in, and get the installation process started.

## Install Analyze in Excel

You must install **Analyze in Excel** from links provided in the Power BI service. Power BI detects the version of Excel you have on your computer, and automatically downloads the appropriate version (32-bit or 64-bit). You can sign in to the Power BI service using the following link:

* [Sign in to Power BI](https://app.powerbi.com)

Once you've signed in and the Power BI service is running in your browser, select **More options** (the ...) in the upper-right corner and then select **Download > Analyze in Excel updates**. This menu item applies to new installations of updates of Analyze in Excel.

![Download Analyze in Excel from Power BI Home](media/service-analyze-in-excel/analyze-excel-02.png)

Alternatively, you can navigate in the Power BI service to a dataset you want to analyze, and select the **More options** item for a dataset, report, or other Power BI item. From the menu that appears, select the **Analyze in Excel** option, as shown in the following image.

![Analyze in Excel from dataset](media/service-analyze-in-excel/analyze-excel-01.png)

Either way, Power BI detects whether you have Analyze in Excel installed, and if not, you're prompted to download. 

![Updates needed](media/service-analyze-in-excel/analyze-excel-03.png)

When you select download, Power BI detects the version of Excel you have installed and downloads the appropriate version of the Analyze in Excel installer. You see a download status in the bottom of your browser, or wherever your browser displays download progress. 

![Updates downloading](media/service-analyze-in-excel/analyze-excel-04.png)

When the download completes, run the installer (.msi) to install Analyze in Excel. The name of the installation process is different from Analyze in Excel; the name will be **Microsoft Analysis Services OLE DB Provider** as shown in the following image, or something similar.

![Updates installing Analysis Services OLE DB provider](media/service-analyze-in-excel/analyze-excel-05.png)

Once it completes, you're ready to select a report in the Power BI service (or other Power BI data element, like a dataset), and then analyze it in Excel.

## Connect to Power BI data

In the Power BI service, navigate to the dataset or report you want to analyze in Excel, and then:

1. Select the **More options** menu.

1. Select **Analyze in Excel** from the menu items that appear.

    The following image shows selecting a report.

    ![Updates installing](media/service-analyze-in-excel/analyze-excel-06.png)
    
    >[!NOTE]
    >Remember that if you select Analyze in Excel from a Report menu, it is the report's underlying dataset that is brought into Excel.

    The Power BI service then creates an Excel file of the dataset that's designed (and structured) for use with **Analyze in Excel**, and begins a download process in your browser.
    
    ![Downloading the Excel file](media/service-analyze-in-excel/analyze-in-excel-download-xlsx.png)

    The file name matches the dataset (or report, or other data source) from which it was derived. So if the report was called *Quarterly Report*, then the downloaded file would be **Quarterly Report.xlsx**.

    >[!Note]
    >Analyze in Excel now downloads an Excel file instead of an ODC file. This enables data protection on data exported from Power BI. The downloaded Excel file inherits the sensitivity label of the dataset chosen for Analyze in Excel.

3. Launch the Excel file.

    >[!NOTE]
    >The first time you open the file, you may have to **Enable Editing** and then **Enable Content**, depending on your [Protected view](https://support.microsoft.com/en-gb/office/what-is-protected-view-d6f09ac7-e6b9-4495-8e43-2bbcdbcb6653?ui=en-us&rs=en-gb&ad=gb) and [Trusted document](https://support.microsoft.com/en-us/office/trusted-documents-cf872bd8-47ec-4c02-baa5-1fdba1a11b53) settings.
    >
    >![Screenshot of Protected view enable editing banner](media/service-analyze-in-excel/protected-view-enable-editing-banner.png)
    >
    >![Screenshot of Trusted document enable content banner](media/service-analyze-in-excel/trusted-document-enable-content-banner.png)

When using Excel to analyze Power BI using a PivotTable, Power BI extends sensitivity label inheritance to Excel. A sensitivity label applied on a Power BI dataset is automatically applied to the Excel file when you create a PivotTable in Excel. 

If the label on the dataset subsequently changes to be more restrictive, the label applied to the Excel file is automatically updated upon data refresh in Excel. If the dataset changes to become less restrictive, no label inheritance or update occurs.

Sensitivity labels in Excel that were manually set are not automatically overwritten by the dataset's label. If an Excel file has a manually set sensitivity label, a policy tip will appear with a recommendation to upgrade the label. 

For more information, see [how to apply sensitivity labels in Power BI](../admin/service-security-apply-data-sensitivity-labels.md).


## Saving and sharing your new workbook

You can **Save** the Excel workbook you create with the Power BI dataset, just like any other workbook. However, you cannot publish or import the workbook back into Power BI, because you can only publish or import workbooks into Power BI that have data in tables, or that have a data model. Since the new workbook simply has a connection to the dataset in Power BI, publishing or importing it into Power BI would be going in circles!

Once your workbook is saved, you can share it with other Power BI users in your organization. 

When a user with whom you’ve shared your workbook opens it, they’ll see your PivotTables and data as they appeared when the workbook was last saved, which may not be the latest version of the data. To get the latest data, users must use the **Refresh** button on the **Data** ribbon. And since the workbook is connecting to a dataset in Power BI, users attempting to refresh the workbook must sign in to Power BI and install the Excel updates the first time they attempt to update using this method.

Since users need to refresh the dataset, and refresh for external connections is not supported in Excel Online, it’s recommended that users open the workbook in the desktop version of Excel on their computer.

> [!NOTE]
> Administrators for Power BI tenants can use the *Power BI Admin Portal* to disable the use of **Analyze in Excel** with on-premises datasets housed in Analysis Services (AS) databases. When that option is disabled, **Analyze in Excel** is disabled for AS databases, but continues to be available for use with other datasets.


## Other ways to access Power BI datasets from Excel
Users with specific Office SKUs can also connect to Power BI datasets from within Excel by using the **Get Data** feature in Excel. If your SKU does not support this feature, the **Get Data** menu option does not appear.

From the **Data** ribbon menu, select **Get Data > From Power BI dataset** as shown in the following image.

![Using the Get Data menu](media/service-analyze-in-excel/analyze-excel-10.png)

A pane appears, in which you can browse datasets to which you have access, see if datasets are certified or promoted, and determine whether data protection labels have been applied to those datasets. 

For more information about getting data into Excel in this way, see [Create a PivotTable from Power BI datasets](https://support.office.com/article/31444a04-9c38-4dd7-9a45-22848c666884) in the Excel documentation.

You can also access **featured tables** in Excel, in the **Data Types** gallery. To learn more about featured tables, and how to access them, see [Access Power BI featured tables in Excel (preview)](service-excel-featured-tables.md).


## Next steps

You might also be interested in the following articles:

* [Use cross-report drillthrough in Power BI Desktop](../create-reports/desktop-cross-report-drill-through.md)
* [Using slicers Power BI Desktop](../visuals/power-bi-visualization-slicers.md)
* [Troubleshooting Analyze in Excel](desktop-troubleshooting-analyze-in-excel.md)
* [Access Power BI featured tables in Excel (preview)](service-excel-featured-tables.md).
* [How to apply sensitivity labels in Power BI](../admin/service-security-apply-data-sensitivity-labels.md)
