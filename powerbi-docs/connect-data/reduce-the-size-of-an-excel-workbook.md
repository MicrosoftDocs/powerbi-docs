---
title: Reduce the size of an Excel workbook to view it in Power BI
description: Learn about managing contents within a Microsoft Excel workbook, and how you can reduce the size of the workbook to view it in Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 10/17/2024
LocalizationGroup: Data from files
#customer intent: As a Power BI user, I want to reduce the size of my Excel workbook so that I can upload it to Power BI and view it without issues.
---
# Reduce the size of an Excel workbook to view it in Power BI

You can upload any Excel workbook smaller than 1 GB to Power BI. An Excel workbook can have two parts: a data model, and the rest of the report—the core worksheet contents. If the report meets the following size limits, you can save it to **OneDrive for work or school**, connect to it from Power BI, and view it in Excel Online:

* The workbook can be up to 1 GB.
* The core worksheet contents can be up to 30 MB.

This article tells you what you can do to limit or reduce the size of an Excel workbook so that it meets the size requirements for uploading data.

## What makes core worksheet contents larger than 30 MB

Here are some elements that can make the core worksheet contents larger than 30 MB:

* Images
* [Shaded cells](https://support.office.com/article/Add-or-change-the-background-color-of-cells-ac10f131-b847-428f-b656-d65375fb815e)
* [Colored worksheets](https://support.office.com/article/add-or-remove-a-sheet-background-3577a762-8450-4556-96a2-cc265abc00a8)
* Text boxes
* Clip art

Consider removing these elements, if possible.

If the report has a data model, you can reduce the overall size of the report using information in [Create a memory-efficient Data Model](https://support.office.com/article/Create-a-memory-efficient-Data-Model-using-Excel-2013-and-the-Power-Pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70).

You can also refer to this article on  [File size limits for Excel workbooks in SharePoint](https://support.office.com/article/File-size-limits-for-workbooks-in-SharePoint-Online-9e5bc6f8-018f-415a-b890-5452687b325e).

## Workbook size optimizer

If your workbook contains a data model, you can run the workbook size optimizer to reduce the size of your workbook. For more information, see [Download Workbook Size Optimizer](https://www.microsoft.com/download/details.aspx?id=38793).

## Related content

* [Create a memory-efficient Data Model by using Excel and the Power Pivot add-in](https://support.office.com/article/Create-a-memory-efficient-Data-Model-using-Excel-2013-and-the-Power-Pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70)

* [Use OneDrive for work or school links in Power BI Desktop](desktop-use-onedrive-business-links.md)
