---
title: Get data from Power BI Desktop files
description: Learn how to get data and reports from Power BI Desktop into Power BI
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 11/16/2022
LocalizationGroup: Data from files
---
# Get data from Power BI Desktop files
![Power B I Desktop file icon](media/service-desktop-files/pbid_file_icon.png)

**Power BI Desktop** makes business intelligence and reporting easy. Whether you're connecting to a many different data sources, querying and transforming data, modeling your data, and creating powerful and dynamic reports, **Power BI Desktop** makes business intelligence tasks intuitive and fast. If you're not familiar with **Power BI Desktop**, check out [Getting started with Power BI Desktop](../fundamentals/desktop-getting-started.md).

Once you bring data into **Power BI Desktop** and create a few reports, it’s time to get your saved file into the **Power BI service**.

## Where your file is saved makes a difference
**Local** - If you save your file to a local drive on your computer or another location in your organization, you can *import* your file or you can *publish* from Power BI Desktop to get its data and reports into Power BI. Your file will actually remain on your local drive, so the whole file isn’t really moved into Power BI. What really happens is a new dataset is created in Power BI and data and the data model from the Power BI Desktop file are loaded into the dataset. If your file has any reports, those will appear in your Power BI site under Reports.

**OneDrive for work or school** – If you have OneDrive for work or school and you sign into it with the same account you sign into Power BI with, this is by-far the most effective way to keep your work in Power BI Desktop and your dataset, reports, and dashboards in Power BI in-sync. Because both Power BI and OneDrive are in the cloud, Power BI *connects* to your file on OneDrive about every hour. If any changes are found, your dataset, reports, and dashboards are automatically updated in Power BI.

**OneDrive - Personal** – If you save your files to your own OneDrive account, you’ll get many of the same benefits as you would with OneDrive for work or school. The biggest difference is when you first connect to your file (using Get Data > Files > OneDrive – Personal) you’ll need to sign in to your OneDrive with your Microsoft account, which is usually different from what you use to sign in to Power BI. When signing in with your OneDrive with your Microsoft account, be sure to select the Keep me signed in option. This way, Power BI will be able to connect to your file about every hour and make sure your dataset in Power BI is in-sync.

**SharePoint Team-Sites** – Saving your Power BI Desktop files to SharePoint – Team Sites is much the same as saving to OneDrive for work or school. The biggest difference is how you connect to the file from Power BI. You can specify a URL or connect to the root folder. You can also <a href="https://support.microsoft.com/office/sync-sharepoint-and-teams-files-with-the-onedrive-sync-app-6de9ede8-5b6e-4503-80b2-6190f3354a88">set up a Sync folder</a> that points to the SharePoint folder; files there will sync with the master copy on SharePoint.



## Streamlined upload to Power BI
Beginning in November 2022, there's a new and streamlined experience for uploading files to the Power BI service. In the workspace into which you want to add files, you’ll see an **Upload** drop-down menu option next to the **New** button. You can use the drop-down menu to connect to files stored in *OneDrive for work or school* or any *SharePoint* site to which you have access, or you can upload them from your computer through the *Browse* menu option. The following image shows the menu options.

:::image type="content" source="media/service-excel-workbook-files/excel-files-new-01.png" alt-text="Screen shot of add file menu option.":::

If you choose to upload a local file, a copy of the file is added to the workspace. If you use the *OneDrive for work or school* or *SharePoint* option, Power BI creates a connection to the file and as you make changes to the file in SharePoint, Power BI can automatically sync those changes approximately each hour.

A benefit of uploading files this way, in addition to being easy to use, is that the *OneDrive for work or school* and *SharePoint* options use the same file selection interface used in many other Microsoft products.

Rather than having to paste a direct URL to a given SharePoint site, which was previously required, you can now simply select one of your sites through the *Quick access* section or the *More places* links.

When uploading an Excel file this way, your workbook appears in Power BI just like it would in Excel Online, as shown in the following image.

:::image type="content" source="media/service-excel-workbook-files/excel-files-new-02.png" alt-text="Screen shot of workbook appearing in Power B I.":::

Currently, if you want to import the data from the Excel file into a Power BI dataset, you can continue to use the [get data](#import-or-connect-to-a-power-bi-desktop-file-from-power-bi) experience described later in this article. 

If you don't have a subscription, *OneDrive for work or school* and *SharePoint* options will be disabled, but you can still *browse* for local files on your computer. The following image shows the subscription options disabled, with the *Browse* option highlighted.

:::image type="content" source="media/service-excel-workbook-files/excel-files-new-03.png" alt-text="Screen shot of subscription services disabled.":::

You cannot upload files from personal OneDrive accounts, but you can continue using the [get data](#import-or-connect-to-a-power-bi-desktop-file-from-power-bi) experience described later in this article for workbooks in personal OneDrive accounts. 


## Import or connect to a Power BI Desktop file from Power BI
>[!IMPORTANT]
>The maximum file size you can import into Power BI is 1 gigabyte.

1. In Power BI, in the navigator pane, click **Get data**.
   
   ![Screenshot of Get Data, showing the button in the navigation pane.](media/service-desktop-files/pbid_get_data_button.png)
2. In **Files**, click **Get**.
   
   ![Screenshot of the Files dialog, showing the Get button.](media/service-desktop-files/pbid_files_get.png)
3. Find your file. Power BI Desktop files have a .PBIX extension.
   
   ![Screenshot of four tiles to find your file, showing the Local File, OneDrive Business, OneDrive Personal, and SharePoint tiles.](media/service-desktop-files/pbid_find_your_file.png)

## Publish a file from Power BI Desktop to your Power BI site
Using Publish from Power BI Desktop is similar using Get Data in Power BI, in terms of initially importing your file data from a local drive or connecting to it on OneDrive. However, there are differences: if you upload from a local drive, you'll want to refresh that data frequently to ensure the online and local copies of the data are current with each other. 

Here’s the quick how to, but you can see [Publish from Power BI Desktop](../create-reports/desktop-upload-desktop-files.md) to learn more.

1. In Power BI Desktop, click **File** > **Publish** > **Publish to Power BI**, or click **Publish** on the ribbon.
   
   ![Screenshot of the Publish on the ribbon, showing how to Publish from Power B I Desktop.](media/service-desktop-files/pbid_publish.png)
2. Sign in to Power BI. You'll only need to do this the first time.
   
   When complete, you'll get a link to open your report in your Power BI site.
   
   ![Screenshot of the Sign in confirmation dialog, showing that you have successfully signed in with a link to open your report.](media/service-desktop-files/pbid_publishing.png)

## Next steps
**Explore your data** - Once you get data and reports from your file into Power BI, it's time to explore. If your file already has reports in it, they'll appear in the navigator pane in **Reports**. If your file just had data, you can create new reports; just right-click the new dataset and then click **Explore**.

**Refresh external data sources** - If your Power BI Desktop file connects to external data sources, you can set up scheduled refresh to make sure your dataset is always up-to-date. In most cases, setting up scheduled refresh is easy to do, but going into the details is outside the scope of this article. See [Data refresh in Power BI](refresh-data.md) to learn more.
