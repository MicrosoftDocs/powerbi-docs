---
title: Export embedded reports
description: Learn how to export an embedded Power BI report 
author: KesemSharabi
ms.author: kesharab
ms.topic: conceptual
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 13/01/2020
---

# Export embedded reports

The `xxx` API enables exporting a Power BI report by using a REST call. The following file formats are supported:
* PPTX (PowerPoint)
* PDF
* PNG - Secure labels are not supported; A report with multiple pages is compressed into a zip file.

## Example scenarios

You can use the embedded export feature in a variety of ways. Here are a couple of examples:

* **Printing button** - In your application, create a button that when clicked on, saves the viewed report as a PDF. The report is saved in its current state, including applied RLS rules and configured filters, slicers and additional settings.

* **Email attachment** - Send an automated email at set intervals, with an attached PDF report. This scenario can be useful if you want to automate sending a weekly report to executives.

## Using the API

The API is asynchronous. When it is called, it triggers an export job which takes about half a minute per report page. After triggering an export, use polling to track the job, until it's complete.

Exported reports are saved in Azure Storage. When the export is complete, the `get status` call returns a [SAS URL](https://docs.microsoft.com/azure/storage/common/storage-sas-overview) for getting the file. The URL will be available for 24 hours.

## Requirements

* The report you're exporting must reside on a capacity
* Throttles - **TBD**

## Supported features

* Selecting which pages to print
* Exporting reports simultaneously - You can export a number of reports that reside on the same capacity at the same time

## Limitations

* File size - Exported reports cannot exceed a file size of **TBD**.
* Number of pages - The number of pages that can be included in an exported report is **TBD**. If the report includes more pages, they will not be printed.
* Paginated reports are not supported.
* The Power BI visuals listed below are not supported. When a report containing these visuals is exported, the parts of the report that contain these visuals will not render, and will display an error symbol.
    * Uncertified Power BI visuals
    * R visuals
    * Python visuals

## Next steps

Review how to embed from workspaces for your third-party customers and your organization:

> [!div class="nextstepaction"]
>[Embed for third-party customers](embed-sample-for-customers.md)

> [!div class="nextstepaction"]
>[Embed for your organization](embed-sample-for-your-organization.md)
