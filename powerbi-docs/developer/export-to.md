---
title: Export Power BI reports API
description: Learn how to export an embedded Power BI report 
author: KesemSharabi
ms.author: kesharab
ms.topic: conceptual
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 01/15/2020
---

# Export reports API

The `exportToFile` API enables exporting a Power BI report by using a REST call. The following file formats are supported:
* PPTX (PowerPoint)
* PDF
* PNG - Sensitivity labels are not supported; A report with multiple pages is compressed into a zip file.

## Example scenarios

You can use the embedded export feature in a variety of ways. Here are a couple of examples:

* **Printing button** - In your application, create a button that when clicked on, exports the viewed report as a PDF. Using bookmarks you can export the report in a specific state, including configured filters, slicers and additional settings.

* **Email attachment** - Send an automated email at set intervals, with an attached PDF report. In the API call, you can specify the RLS identities for each recipient. This scenario can be useful if you want to automate sending a weekly report to executives.

## Using the API

Before using the API, verify that the following admin tenant settings are enabled:
* **Export reports as PowerPoint presentations or PDF documents** - Enabled by default.
* **TBD ---> Export as image <---** - Required only for PNG and disabled by default.

The API is asynchronous. When the [exportToFile](link-to-postExport) API is called, it triggers an export job. After triggering an export, use [polling](link-to-getStatus) to track the job, until it's complete.

When the export is complete, the polling API call returns a [Power BI URL](link-to-getFile) for getting the file. The URL will be available for 24 hours.

## Supported features

* Selecting which pages to print
* Bookmarks
* [Row Level Security (RLS)](embedded-row-level-security.md)
* Localization
* [Sensitivity labels](../admin/service-security-data-protection-overview.md) (only for PDF and PPTX)

## Limitations

* The report you're exporting must reside on a capacity.
* In a specific capacity, you can only export up to 50 report pages per hour.
* Exported reports cannot exceed a file size of 250 MB.
* The number of pages that can be included in an exported report is 50. If the report includes more pages, the API returns an error and the export job is canceled.
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
