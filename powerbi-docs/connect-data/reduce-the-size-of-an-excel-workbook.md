---
title: Reduce the size of an Excel workbook to view it in Power BI
description: Learn about managing contents within a Microsoft Excel workbook, and how you can reduce the size of the workbook to view it in Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 02/01/2023
LocalizationGroup: Data from files
---
# Reduce the size of an Excel workbook to view it in Power BI
You can upload any Excel workbook smaller than 1 GB to Power BI. An Excel workbook can have two parts: a Data Model, and the rest of the report—the core worksheet contents. If the report meets the following size limits, you can save it to **OneDrive for work or school**, connect to it from Power BI, and view it in Excel Online:

* The workbook can be up to 1 GB.
* The core worksheet contents can be up to 30 MB.

## What makes core worksheet contents larger than 30 MB
Here are some elements that can make the core worksheet contents larger than 30 MB:

* Images
* [Shaded cells](https://support.office.com/article/Add-or-change-the-background-color-of-cells-ac10f131-b847-428f-b656-d65375fb815e)
* [Colored worksheets](https://support.office.com/article/add-or-remove-a-sheet-background-3577a762-8450-4556-96a2-cc265abc00a8)
* Text boxes
* Clip art

Consider removing these elements, if possible. 

If the report has a Data Model, you have some other options: 

* Remove data from Excel worksheets and store it in the Data Model. For more information, see the [Remove data from worksheets](#remove-data-from-worksheets) section. 
* [Create a memory-efficient Data Model](https://support.office.com/article/Create-a-memory-efficient-Data-Model-using-Excel-2013-and-the-Power-Pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70) to reduce the overall size of the report.

To make any of these changes, you need to edit the workbook in Excel.

Read more about [file size limits for Excel workbooks in SharePoint Online](https://support.office.com/article/File-size-limits-for-workbooks-in-SharePoint-Online-9e5bc6f8-018f-415a-b890-5452687b325e).

## Remove data from worksheets
If you import data into Excel from the Power Query Editor or the Excel Data tab, the workbook might have the same data in an Excel table and in the Data Model. Large tables in Excel worksheets may make the core worksheet contents more than 30 MB. Removing the table in Excel and keeping the data in the Data Model can greatly reduce the core worksheet contents of the report. 

When you import data into Excel, follow these tips:

* **In Power Query Editor**: Clear the **Load to worksheet** box under **File** > **Options and settings** > **Query Options**.

  :::image type="content" source="./media/reduce-the-size-of-an-excel-workbook/load-to-worksheet.png" alt-text="Screenshot that shows the Load to worksheet option.":::
  
  This imports data only into the Data Model, with no data in Excel worksheets.
* **From the Excel Data tab**, if you previously selected **Table** in the import wizard: 

  1. Go to **Existing Connections**.

     :::image type="content" source="./media/reduce-the-size-of-an-excel-workbook/existing-connections.png" alt-text="Screenshot that shows the Existing Connections button.":::

  1. Select the connection, and then select **Open**. Select **Only Create Connection**.

     :::image type="content" source="./media/reduce-the-size-of-an-excel-workbook/only-create-connection.png" alt-text="Screenshot that shows the Existing Connections button.":::
  
  1. Delete the original table or tables created during the initial import.
  
* **From the Excel Data tab**: 

  1. Don’t select **Table** in the **Import Data** box.

## Workbook size optimizer
If your workbook contains a data model, you can run the workbook size optimizer to reduce the size of your workbook. For more information, see [Download Workbook Size Optimizer](https://www.microsoft.com/download/details.aspx?id=38793).

## Related info
[Create a memory-efficient Data Model](https://support.office.com/article/Create-a-memory-efficient-Data-Model-using-Excel-2013-and-the-Power-Pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70)

[Use OneDrive for work or school links in Power BI Desktop](desktop-use-onedrive-business-links.md)

