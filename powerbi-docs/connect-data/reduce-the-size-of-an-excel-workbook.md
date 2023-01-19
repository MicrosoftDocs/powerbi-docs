---
title: Reduce the size of an Excel workbook to view it in Power BI
description: Reduce the size of an Excel workbook to view it in Power BI
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 01/10/2019
LocalizationGroup: Data from files
---
# Reduce the size of an Excel workbook to view it in Power BI
You can upload any Excel workbook smaller than 1 GB to Power BI. An Excel workbook can have two parts: a Data Model, and the rest of the report—the core worksheet contents. If the report meets the following size limits, you can save it to **OneDrive for work or school**, connect to it from Power BI, and view it in Excel Online:

* The workbook as a whole can be up to 1 GB.
* The core worksheet contents can be up to 30 MB.

## What makes core worksheet contents larger than 30 MB
Here are some elements that can make the core worksheet contents larger than 30 MB:

* Images.
* Shaded cells. [Remove a cell shading format](https://support.office.com/article/Add-or-change-the-background-color-of-cells-ac10f131-b847-428f-b656-d65375fb815e).
* Colored worksheets. [Remove a sheet background](https://support.office.com/article/add-or-remove-a-sheet-background-3577a762-8450-4556-96a2-cc265abc00a8).
* Text boxes.
* Clip art.

Consider removing these elements, if possible. 

If the report has a Data Model, you have some other options: 

* Remove data from Excel worksheets, and store it in the Data Model instead. See “Remove data from worksheets” below for details. 
* [Create a memory-efficient Data Model](https://support.office.com/article/Create-a-memory-efficient-Data-Model-using-Excel-2013-and-the-Power-Pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70) to reduce the overall size of the report.

To make any of these changes, you need to edit the workbook in Excel.

Read more about [file size limits for Excel workbooks in SharePoint Online](https://support.office.com/article/File-size-limits-for-workbooks-in-SharePoint-Online-9e5bc6f8-018f-415a-b890-5452687b325e).

## Remove data from worksheets
If you import data into Excel from the Power Query tab or the Excel Data tab, the workbook might have the same data in an Excel table and in the Data Model. Large tables in Excel worksheets may make the core worksheet contents more than 30 MB. Removing the table in Excel and keeping the data in the Data Model can greatly reduce the core worksheet contents of the report. 

When you import data into Excel, follow these tips:

* **In Power Query**: Clear the **Load to worksheet** box.
  
  The data is imported only into the Data Model, with no data in Excel worksheets.
* **From the Excel Data tab**, if you previously checked **Table** in the import wizard: Go to **Existing Connections** \> click the connection \> **Only create connection**. Delete the original table or tables created during the initial import.
* **From the Excel Data tab**: don’t check **Table** in the **Import Data** box.

## Workbook Size Optimizer
If your workbook contains a data model, you can run the workbook size optimizer to reduce the size of your workbook. [Download Workbook Size Optimizer](https://www.microsoft.com/download/details.aspx?id=38793).

## Related info
[Create a memory-efficient Data Model](https://support.office.com/article/Create-a-memory-efficient-Data-Model-using-Excel-2013-and-the-Power-Pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70)

[Use OneDrive for work or school links in Power BI Desktop](desktop-use-onedrive-business-links.md)

