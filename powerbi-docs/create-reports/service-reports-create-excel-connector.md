---
title: 'Create reports from Excel files in the Power BI service'
description: Learn how to create Power BI reports from Excel files in the Power BI service without using desktop or a workspace.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.search.form: Create report from Excel file without a workspace
ms.topic: how-to
ms.date: 08/07/2023
LocalizationGroup: Reports
---
# Create reports from Excel files in the Power BI service (Preview)

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Now you can upload an excel file through the navigation pane of the Power BI service. You can upload files directly on the web and don't need to download the Power BI desktop or use a workspace to create a report. If you need more information about reports, read [Reports in Power BI](../consumer/end-user-reports.md). 

## Considerations and limitations

- During public preview, you can't select more than eight tables selected in the navigation UI. 

- During public preview, use file sizes no larger than 10 MB for better performance. For now, use the Power BI desktop application if you want to use larger file sizes.

- If you select to upload your file from your local computer, the file will automatically upload to your OneDrive for business as well.

- You cancel the loading process if you no longer wish to continue with the report creation process. However, you can at any time decide to leave the loading page and continue with other work while we load your data in the background.

- A dataset is automatically created once your data is fully loaded. It shows up in your opened workspace as *"Untitled Model."* You can rename it, delete it, or change its settings from the workspace.

- There's no option to come back to the loading page once you decide to leave the page. However, you receive a notification on the Power BI service once your data is ready. If you select the notification, it takes you to the report canvas.

- Excel files with encryption enabled sensitivity label aren't supported.  

## Create a report from Excel data 

In the navigation pane in the Power BI service, you can select the **Create** button that opens a page where you can select your data source.

 1. Select on Excel tile to upload an excel file.

 1. You see a dialog to connect to your excel data source. You have a few options to connect to the data source:
     1. Paste the file path or URL of the excel file stored in your OneDrive 
     1. Browse your OneDrive and the select the file
     1. Upload the file from your local computer
     > [!NOTE]
     > If you select to upload your file from your local computer, we will automatically upload your file to your OneDrive for business

    :::image type="content" source="media/service-report-create-excel-connector/connect-to-data-source.png" alt-text="Screenshot of the Power BI service, uploading an excel file as the data source.":::

 1. Select **Next** once you've successfully uploaded the file or pasted the file path or URL. 

 1. Select up to 8 tables you want to add to your dataset in the navigation UI and select **Create**. As you go through the creation process, Power BI creates a new dataset for you and autofills the data pane with the tables you selected.
     
    :::image type="content" source="media/service-report-create-excel-connector/choose-data-tables.png" alt-text="Screenshot of the Power BI service, selecting tables from the uploaded excel file to create a dataset.":::

 1. Use the **Your data** pane to add or remove fields from the report. 

 1. Select and deselect the fields to update what you want to measure and analyze.
 
 ## Next Steps
* [Create a report from an Excel file in the Power BI service workspace](service-report-create-new.md)
* [Create a Power BI dashboard from a report](service-dashboard-create.md)
* [Change settings for Power BI reports](power-bi-report-settings.md)
* More questions? [Ask the Power BI Community](https://community.powerbi.com/)
 