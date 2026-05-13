---
title: Get data from comma separated value (CSV) files
description: Learn about CSV files and find out how you can add a CSV semantic model to a workspace in the Power BI service.
author: kgremban
ms.author: kgremban
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 03/06/2026
LocalizationGroup: Data from files
---
# Get data from comma separated value (CSV) files

Comma separated value files, often known as CSV files, are simple text files with rows of data where each value is separated by a comma. These types of files can contain large amounts of data within a relatively small file size, making them an ideal data source for Power BI. You can download a [sample CSV file](https://go.microsoft.com/fwlink/?LinkID=619356).

If you have a CSV file, it's time to get it into your Power BI site as a semantic model where you can begin exploring your data, create some dashboards, and share your insights with others.

>[!TIP]
>Many organizations output a CSV file with updated data each day. To make sure your semantic model in Power BI stays in sync with your updated file, save the file to OneDrive with the same name.

## Where you save your file makes a difference

**Local** - If you save your CSV file to a local drive on your computer or another location in your organization, you can *import* your file into Power BI. Your file actually remains on your local drive, so the whole file isn't imported into Power BI. What really happens is that Power BI creates a new semantic model and loads data from the CSV file into the semantic model.

**OneDrive for work or school** – If you have OneDrive for work or school and you sign in to it by using the same account you use to sign in to Power BI, this method is the most effective way to keep your CSV file and your semantic model, reports, and dashboards in Power BI in sync. Because both Power BI and OneDrive are in the cloud, Power BI *connects* to your file on OneDrive about every hour. If Power BI finds any changes, it automatically updates your semantic model, reports, and dashboards.

**OneDrive - Personal** – If you save your files to your own OneDrive account, you get many of the same benefits as you would with OneDrive for work or school. The biggest difference is when you first connect to your file you need to sign in to your OneDrive by using your Microsoft account, which is different from what you use to sign in to Power BI. When signing in to your OneDrive by using your Microsoft account, be sure to select the **Keep me signed in** option. This way, Power BI can connect to your file about every hour and make sure your semantic model in Power BI is in sync.

**SharePoint** – Saving your Power BI Desktop files to SharePoint is much the same as saving to OneDrive for work or school. The biggest difference is how you connect to the file from Power BI. You can specify a URL or connect to the root folder.

## Import or connect to a CSV file

>[!IMPORTANT]
>You can import files up to 1 GB in size into Power BI.

1. In a Power BI workspace, select **New item**. Under **Store data**, select **Semantic model**.

   :::image type="content" source="media/service-comma-separated-value-files/new-upload-menu.png" alt-text="Screenshot of the workspace new menu with new and upload a file highlighted." lightbox="media/service-comma-separated-value-files/new-upload-menu.png":::

1. In the window that appears, select **CSV**.

   :::image type="content" source="media/service-comma-separated-value-files/add-data-to-get-started.png" alt-text="Screenshot of file type icons with CSV highlighted.":::

1. Browse to the file that you want to import from OneDrive or SharePoint, or select **Upload file** to import a file from your computer.

1. Select **Next**.

1. Preview the data to make sure it looks correct. Select **Next**.

1. Select **Create a report** to create a report based on your data, or select **Create a semantic model only** to create a semantic model without a report.

   :::image type="content" source="media/service-comma-separated-value-files/create-report-or-model.png" alt-text="Screenshot of the options to create a report or a semantic model.":::

1. Provide a name for your semantic model, and then select **Create**.

   The semantic model or the report built on the model loads in the main pane of Power BI.

## Explore and refresh your data

Hover over a semantic model in your workspace to see options for refreshing your data and exploring your data with reports and dashboards.

:::image type="content" source="media/service-comma-separated-value-files/dataset-more-options.png" alt-text="Screenshot of the workspace contents with the more options icon highlighted.":::

* **Refresh now** or **Schedule a refresh** - If you save your file to a local drive, you can schedule refreshes so your semantic model and reports in Power BI stay up-to-date. To learn more, see [Data refresh in Power BI](refresh-data.md). If you save your file to OneDrive, Power BI automatically synchronizes with it about every hour.

* **Explore your data** - After you get data from your file into Power BI, it's time to explore. Select **More options (...)**, and then choose an option from the menu. From this menu, you can create a report, manage your data, and more.



