---
title: Get data from Power BI Desktop files
description: Learn about different places to store Power BI files and how to get data and reports from Power BI Desktop into the Power BI service.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 11/10/2023
LocalizationGroup: Data from files
---
# Get data from Power BI Desktop files

:::image type="icon" source="media/service-desktop-files/pbid_file_icon.png":::

Power BI Desktop makes business intelligence and reporting easy. Whether you're connecting to many different data sources, querying and transforming data, modeling your data, and creating powerful and dynamic reports, Power BI Desktop makes business intelligence tasks intuitive and fast. If you're not familiar with Power BI Desktop, check out [Getting started with Power BI Desktop](../fundamentals/desktop-getting-started.md).

Once you bring data into Power BI Desktop and create a few reports, it's time to get your saved file into the Power BI service.

## Where your file is saved makes a difference

There are several locations where you might store Power BI Desktop files:

- **Local**. If you save your file to a local drive on your computer or another location in your organization, you can *import* your file, or you can *publish* from Power BI Desktop to get its data and reports into the Power BI service.

  Your file remains on your local drive. The whole file isn't moved into Power BI. A new semantic model is created in Power BI and data and the data model from the Power BI Desktop file are loaded into the semantic model. If your file has any reports, those reports appear in your Power BI service site under **Reports**.

- **OneDrive for work or school**. By far, the most effective way to keep your work in Power BI Desktop in sync with the Power BI service is to use your OneDrive for work or school and sign in with the same account as the Power BI service. Your work includes semantic model, reports, and dashboards. Because both the Power BI service and OneDrive are in the cloud, Power BI *connects* to your file on OneDrive about every hour. If it finds any changes, your semantic model, reports, and dashboards are updated in the Power BI service.

- **OneDrive - Personal**. If you save your files to your own OneDrive account, you get many of the same benefits as you would with OneDrive for work or school. The biggest difference is when you first connect to your file, you need to sign in to your OneDrive with your Microsoft account. This account is usually different from what you use to sign in to the Power BI service.

  When signing in with your OneDrive with your Microsoft account, be sure to select the **Keep me signed in** option. This way, the Power BI service can connect to your file about every hour and make sure that your semantic model in the Power BI service is in-sync.

- **SharePoint Team-Sites**. Saving your Power BI Desktop files to SharePoint – Team Sites is much the same as saving to OneDrive for work or school. The biggest difference is how you connect to the file from the Power BI service. You can specify a URL or connect to the root folder. You can also [set up a Sync folder](https://support.microsoft.com/office/sync-sharepoint-and-teams-files-with-the-onedrive-sync-app-6de9ede8-5b6e-4503-80b2-6190f3354a88) that points to the SharePoint folder. Files in that folder sync up with the ones on SharePoint.

## Streamlined upload to Power BI

Beginning in November 2022, there's a new and streamlined experience for uploading files to the Power BI service. In the workspace into which you want to add files, you see an **Upload** dropdown menu option next to the **New** button. You can use the dropdown menu to connect to files stored in *OneDrive for work or school* or any *SharePoint* site to which you have access, or you can upload them from your computer through the *Browse* menu option. The following image shows the menu options.

:::image type="content" source="media/service-excel-workbook-files/excel-files-new-01.png" alt-text="Screenshot of add file menu option.":::

If you choose to upload a local file, a copy of the file is added to the workspace. If you use the *OneDrive for work or school* or *SharePoint* option, the Power BI service creates a connection to the file and as you make changes to the file in SharePoint, Power BI can automatically sync those changes approximately each hour.

A benefit of uploading files this way, in addition to being easy to use, is that the *OneDrive for work or school* and *SharePoint* options use the same file selection interface used in many other Microsoft products.

Rather than having to paste a direct URL to a given SharePoint site, which was previously required, you can now simply select one of your sites through the *Quick access* section or the *More places* links.

When you upload an Excel file this way, your workbook appears in the Power BI service just like it would in Excel Online, as shown in the following image.

:::image type="content" source="media/service-excel-workbook-files/excel-files-new-02.png" alt-text="Screenshot of workbook appearing in Power BI.":::

If you don't have a subscription, *OneDrive for work or school* and *SharePoint* options are disabled, but you can still *browse* for local files on your computer. The following image shows the subscription options disabled, with the *Browse* option highlighted.

:::image type="content" source="media/service-excel-workbook-files/excel-files-new-03.png" alt-text="Screenshot of subscription services disabled.":::

> [!NOTE]
> You can't upload files from SharePoint Document set folder or from personal OneDrive accounts.

## Publish a file from Power BI Desktop to the Power BI service

Using **Publish** from Power BI Desktop is similar uploading files in the Power BI service. Both initially import your file data from a local drive or connect to it on OneDrive. However, there are differences. If you upload from a local drive, refresh that data frequently to ensure the online and local copies of the data are current with each other.

Here's the quick how to, but you can see [Publish from Power BI Desktop](../create-reports/desktop-upload-desktop-files.md) to learn more.

1. In Power BI Desktop, select **File** > **Publish** > **Publish to Power BI**, or select **Publish** on the ribbon.

   :::image type="content" source="media/service-desktop-files/pbid_publish.png" alt-text="Screenshot of the Publish on the ribbon, showing how to Publish from Power BI Desktop.":::

1. Sign in to the Power BI service. You only need to sign in the first time.

   When complete, you get a link to open your report in your Power BI site.

   :::image type="content" source="media/service-desktop-files/pbid_publishing.png" alt-text="Screenshot of the Sign-in confirmation dialog, showing that you've successfully signed in with a link to open your report.":::

## Related content

- **Explore your data**: Once you get data and reports from your file into the Power BI service, it's time to explore. If your file already has reports in it, they appear in the navigator pane in **Reports**. If your file just had data, you can create new reports; just right-click the new semantic model and then select **Explore**.

- **Refresh external data sources**: If your Power BI Desktop file connects to external data sources, you can set up scheduled refresh to make sure your semantic model is always up-to-date. In most cases, setting up scheduled refresh is easy to do, but going into the details is outside the scope of this article. See [Data refresh in Power BI](refresh-data.md) to learn more.
