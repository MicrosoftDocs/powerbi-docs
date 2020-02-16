---
title: Export Power BI reports API
description: Learn how to export an embedded Power BI report 
author: KesemSharabi
ms.author: kesharab
ms.topic: conceptual
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 02/16/2020
---

# Export reports API (preview)

The `exportToFile` API enables exporting a Power BI report by using a REST call. The following file formats are supported:
* PPTX (PowerPoint)
* PDF
* PNG - A report with multiple pages is compressed into a zip file. The files in the zip have the same names as the getPages API files **<-- explain files in zip -->**

## Example scenarios

You can use the embedded export feature in a variety of ways. Here are a couple of examples:

* **<-- look for another term --> Interactive** - In your application, create a button that when clicked on triggers an export job. The job can export the viewed report as a PDF, and when it's complete, the user can receive the PDF as a download. Using bookmarks you can export the report in a specific state, including configured filters, slicers and additional settings.

* **Email attachment** - Send an automated email at set intervals, with an attached PDF report. In the API call, you can specify the RLS identities for each recipient. This scenario can be useful if you want to automate sending a weekly report to executives.

## Using the API

**<-- explain getPages -->** How to prepare for printing a few pages (getting the pages).

Before using the API, verify that the following admin tenant settings are enabled:
* **Export reports as PowerPoint presentations or PDF documents** - Enabled by default.
* **Export reports as image files** - Required only for PNG and disabled by default.

The API is asynchronous. When the [exportToFile](link-to-postExport) API is called, it triggers an export job. After triggering an export, use [polling](link-to-getStatus) to track the job, until it's complete.

During polling, the API returns a number that represents the amount of work completed. The work in each export job is calculated based on the number of pages the report has. All pages have the same weight. If for example you're exporting a report with 10 pages, and the polling returns 70, it means that the API has processed seven out of the 10 pages in the export job.

When the export is complete, the polling API call returns a [Power BI URL](link-to-getFile) for getting the file. The URL will be available for 24 hours.

### Selecting pages

To select which pages to print, use the getPages API. 

## Concurrent requests

`exportToFile` supports concurrent export job requests. The table below shows the amount of jobs you can run at the same time, depending on the SKU your report resides on.


|Azure SKU  |Office SKU  |Maximum concurrent report pages  |
|-----------|------------|-----------|
|A1       |EM1           |1          |
|A2       |EM2           |2          |
|A3       |EM3           |3          |
|A4       |P1            |6          |
|A5       |P2            |12         |
|A6       |P3            |24         |

## Supported features

* Selecting which pages to print
* [Bookmarks](../consumer/end-user-bookmarks.md) + add an explanation about how to use
* You can authenticate using both user and [service principal]()
* [Row Level Security (RLS)](embedded-row-level-security.md) - explain that an admin can use to view others but needs permission
* Locale - explain

## Limitations

* The report you're exporting must reside on a capacity.
* The dataset of the report you're exporting must reside on a capacity.
* In a specific capacity, you can only export up to 50 report pages per hour.
* Exported reports cannot exceed a file size of 250 MB.
* [Sensitivity labels](../admin/service-security-data-protection-overview.md) are not supported.
* The number of pages that can be included in an exported report is 50. If the report includes more pages, the API returns an error and the export job is canceled.
* Paginated reports are currently not supported. This feature is coming soon.
* The Power BI visuals listed below are not supported. When a report containing these visuals is exported, the parts of the report that contain these visuals will not render, and will display an error symbol.
    * Uncertified Power BI visuals
    * R visuals
    * PowerApps
    * Python visuals
    * Visio

## Code examples

### Sending an export request

### Polling

### Getting the file

## Next steps

Review how to embed from workspaces for your third-party customers and your organization:

> [!div class="nextstepaction"]
>[Embed for third-party customers](embed-sample-for-customers.md)

> [!div class="nextstepaction"]
>[Embed for your organization](embed-sample-for-your-organization.md)
