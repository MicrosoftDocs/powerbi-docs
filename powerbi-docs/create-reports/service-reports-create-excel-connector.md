---
title: 'Create a dataset from an Excel file in the Power BI service'
description: Learn how to create a Power BI dataset from an Excel file in the Power BI service, without using Power BI Desktop.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.search.form: Create dataset from Excel file
ms.topic: how-to
ms.date: 09/06/2023
LocalizationGroup: Reports
---
# Create a dataset from an Excel file in the Power BI service (preview)

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

You can upload an Excel file from the navigation pane of the Power BI service. You can upload files directly on the web. You don't need to download Power BI Desktop to create a report. For more information about reports, read [Reports in Power BI](../consumer/end-user-reports.md).

## Create a dataset from Excel data 

1. In the navigation pane in the Power BI service, select the **Create** button.

    A page opens, where you can select your data source.

1. Select the Excel tile to upload an Excel file.

1. You see a dialog to connect to your Excel data source. You have a few options to connect to the data source:

     1. Paste the file path or URL of the Excel file stored in your OneDrive.
     1. Browse your OneDrive and the select the file.
     1. Upload the file from your local computer.
     > [!NOTE]
     > If you select to upload your file from your local computer, Power BI automatically uploads your file to your OneDrive for Business. To see where this file is located, select **Options** (...) to open the context menu, then select **Open file location**.

    :::image type="content" source="media/service-reports-create-excel-connector/connect-to-data-source.png" alt-text="Screenshot of the Power BI service, uploading an Excel file as the data source." lightbox="media/service-reports-create-excel-connector/connect-to-data-source.png":::

1. Select **Next** once you've successfully uploaded the file or pasted the file path or URL.

1. Select up to eight tables that you want to add to your dataset in the navigation UI and select **Create**. As you go through the creation process, Power BI creates a new dataset for you and autofills the data pane with the tables you selected.

    :::image type="content" source="media/service-reports-create-excel-connector/choose-data-tables.png" alt-text="Screenshot of the Power BI service, selecting tables from the uploaded Excel file to create a dataset." lightbox="media/service-reports-create-excel-connector/choose-data-tables.png":::

1. In the **Your data** pane, select and clear the fields to get the data you want to measure and analyze in the dataset.
 
## Considerations and limitations

- During public preview, you can't select more than eight tables in the navigation UI.

- During public preview, use file sizes no larger than 10 MB for better performance. For now, use the Power BI Desktop application for larger files.

- If you upload your file from your local computer, the file automatically uploads to your OneDrive for Business as well.

- You can cancel the loading process if you no longer wish to continue with the report creation process. However, you can at any time decide to leave the loading page and continue with other work while the data loads in the background.

- A dataset is automatically created once your data is fully loaded. It shows up in your opened workspace as *"Untitled Model"*. You can rename it, delete it, or change its settings from the workspace.

- There's no option to come back to the loading page after you leave the page. However, you receive a notification in the Power BI service when your data is ready. If you select the notification, it takes you to the report canvas.

- Excel files with encryption-enabled sensitivity labels aren't supported.

## Next steps

* [Create a report from an Excel file in the Power BI service](service-report-create-new.md)
* [Create a Power BI dashboard from a report](service-dashboard-create.md)
* [Change settings for Power BI reports](power-bi-report-settings.md)
* More questions? [Ask the Power BI Community](https://community.powerbi.com/)