---
title: Get data from comma separated value (CSV) files
description: Learn about CSV files and find out how you can add a CSV semantic model to a workspace in the Power BI service.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 01/17/2024
LocalizationGroup: Data from files
---
# Get data from comma separated value (CSV) files

:::image type="icon" source="media/service-comma-separated-value-files/csv_icon.png":::

Comma separated value files, often known as a CSV, are simple text files with rows of data where each value is separated by a comma. These types of files can contain large amounts of data within a relatively small file size, making them an ideal data source for Power BI. You can download a [sample CSV file](https://go.microsoft.com/fwlink/?LinkID=619356).

If you have a CSV, it’s time to get it into your Power BI site as a semantic model where you can begin exploring your data, create some dashboards, and share your insights with others.

>[!TIP]
>Many organizations output a CSV with updated data each day. To make sure your semantic model in Power BI stays in-sync with your updated file, be sure the file is saved to OneDrive with the same name.

## Where your file is saved makes a difference

**Local** - If you save your CSV file to a local drive on your computer or another location in your organization, you can *import* your file into Power BI. Your file will actually remain on your local drive, so the whole file isn’t imported into Power BI. What really happens is a new semantic model is created in Power BI and data from the CSV file is loaded into the semantic model.

**OneDrive for work or school** – If you have OneDrive for work or school and you sign into it with the same account you use to sign into Power BI, this method is the most effective way to keep your CSV file and your semantic model, reports, and dashboards in Power BI in-sync. Because both Power BI and OneDrive are in the cloud, Power BI *connects* to your file on OneDrive about every hour. If any changes are found, your semantic model, reports, and dashboards are automatically updated in Power BI.

**OneDrive - Personal** – If you save your files to your own OneDrive account, you’ll get many of the same benefits as you would with OneDrive for work or school. The biggest difference is when you first connect to your file you’ll need to sign in to your OneDrive with your Microsoft account, which is different from what you use to sign in to Power BI. When signing into your OneDrive with your Microsoft account, be sure to select the **Keep me signed in** option. This way, Power BI will be able to connect to your file about every hour and make sure your semantic model in Power BI is in-sync.

**SharePoint** – Saving your Power BI Desktop files to SharePoint is much the same as saving to OneDrive for work or school. The biggest difference is how you connect to the file from Power BI. You can specify a URL or connect to the root folder.

## Import or connect to a CSV file

>[!IMPORTANT]
>The maximum file size you can import into Power BI is 1 GB.

1. In a Power BI workspace, select **New item**, then under **Store data**, select **Semantic model**.

   :::image type="content" source="media/service-comma-separated-value-files/new-upload-menu.png" alt-text="Screenshot of the workspace new menu with new and upload a file highlighted." lightbox="media/service-comma-separated-value-files/new-upload-menu.png":::

2. In the window that appears, select **CSV**.

   :::image type="content" source="media/service-comma-separated-value-files/add-data-to-get-started.png" alt-text="Screenshot of file type icons with CSV highlighted.":::

3. Go to the file you want to upload and then choose **Import**. A new **Semantic model details** window appears in the main pane of Power BI.

   :::image type="content" source="media/service-comma-separated-value-files/uploaded-financial-file.png" alt-text="Screenshot of the workspace with the uploaded CSV file.":::

## Related content

**Explore your data** - Once you get data from your file into Power BI, it's time to explore. Select **More options (...)**, and then choose an option from the menu.

:::image type="content" source="media/service-comma-separated-value-files/dataset-more-options.png" alt-text="Screenshot of the workspace contents with the more options icon highlighted.":::

**Schedule refresh** - If your file is saved to a local drive, you can schedule refreshes so your semantic model and reports in Power BI stay up-to-date. To learn more, see [Data refresh in Power BI](refresh-data.md). If your file is saved to OneDrive, Power BI will automatically synchronize with it about every hour.

