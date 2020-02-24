---
title: Export Power BI reports API
description: Learn how to export an embedded Power BI report 
author: KesemSharabi
ms.author: kesharab
ms.topic: conceptual
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 02/17/2020
---

# Use the export report to file API (preview)

The `exportToFile` API enables exporting a Power BI report by using a REST call. The following file formats are supported:
* **PPTX** (PowerPoint)
* **PDF**
* **PNG**
    * When exporting to a PNG, a report with multiple pages is compressed into a zip file
    * Each file in the PNG zip represents a report page
    * The page names are the same as the return values of the [Get Pages](https://docs.microsoft.com/rest/api/power-bi/reports/getpages) API

## Usage examples

You can use the export feature in a variety of ways. Here are a couple of examples:

* **Send to print button** - In your application, create a button that when clicked on triggers an export job. The job can export the viewed report as a PDF or a PPTX, and when it's complete, the user can receive the file as a download. Using bookmarks you can export the report in a specific state, including configured filters, slicers and additional settings. As the API is asynchronous, it may take some time for the file to be available.

* **Email attachment** - Send an automated email at set intervals, with an attached PDF report. This scenario can be useful if you want to automate sending a weekly report to executives.

## Using the API

Before using the API, verify that the following [admin tenant settings](../service-admin-portal.md#tenant-settings) are enabled:
* **Export reports as PowerPoint presentations or PDF documents** - Enabled by default.
* **Export reports as image files** - Required only for PNG and disabled by default.

The API is asynchronous. When the [exportToFile](https://docs.microsoft.com/en-us/rest/api/power-bi/reports/exporttofile) API is called, it triggers an export job. After triggering an export job, use [polling](https://docs.microsoft.com/en-us/rest/api/power-bi/reports/getexporttofilestatus) to track the job, until it's complete.

During polling, the API returns a number that represents the amount of work completed. The work in each export job is calculated based on the number of pages the report has. All pages have the same weight. If for example you're exporting a report with 10 pages, and the polling returns 70, it means that the API has processed seven out of the 10 pages in the export job.

When the export is complete, the polling API call returns a [Power BI URL](link-to-getFile) for getting the file. The URL will be available for 24 hours.

## Supported features

### Selecting which pages to print

Specify the pages you want to print according to the [Get Pages](https://docs.microsoft.com/rest/api/power-bi/reports/getpages) or [Get Pages in Group](https://docs.microsoft.com/rest/api/power-bi/reports/getpagesingroup) return value. You can also specify the order of the pages you're exporting.

### Bookmarks

 You can use the `exportToFile` API to programmatically export a report in a specific state, for example after applying filters to it. This is done using [Bookmarks](../consumer/end-user-bookmarks.md) capabilities. To export a report using bookmarks, use the [bookmarks javascript API](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Bookmarks).

[Personal bookmarks](../consumer/end-user-bookmarks.md#personal-bookmarks) and [persistent filters](https://powerbi.microsoft.com/blog/announcing-persistent-filters-in-the-service/) are not supported.

### Authentication

You can only authenticate using a user (or master user). Currently [service principal](embed-service-principal.md) is not supported.

### Row Level Security (RLS)

With [Row Level Security (RLS)](embedded-row-level-security.md) you can export a report showing data that's only visible to certain users. For example, if you're exporting a sales report that's defined with regional roles, you can programmatically filter the report so that that only a certain region is exported. 

To export using RLS, you must be a workspace admin with write permissions for the report and the dataset it's connected to. If you do not have these permissions, you'll receive an error.

### Data protection

The PDF and PPTX formats support [sensitivity labels](../admin/service-security-data-protection-overview.md#sensitivity-labels-in-power-bi). If you export a report with a sensitivity label to a PDF or a PPTX, the exported file will display the report with its sensitivity label.

### Localization

When using the `exportToFile` API, reports are exported with their localization settings, such as formatting.

## Concurrent requests

`exportToFile` supports concurrent export job requests. The table below shows the amount of jobs you can run at the same time, depending on the SKU your report resides on. Concurrent requests refer to report pages. For example, 20 pages in one export request on an A6 SKU, will be processed concurrently. This will take roughly the same time as sending 20 export requests with one page each.

A job that exceeds its number of concurrent requests doesn’t terminate. For example, if you export three pages in an A1 SKU, the first job will run, and the latter two will wait for the next two execution cycles.

|Azure SKU  |Office SKU  |Maximum concurrent report pages  |
|-----------|------------|-----------|
|A1         |EM1         |1          |
|A2         |EM2         |2          |
|A3         |EM3         |3          |
|A4         |P1          |6          |
|A5         |P2          |12         |
|A6         |P3          |24         |

## Limitations

* The report you're exporting must reside on a capacity.
* The dataset of the report you're exporting must reside on a capacity.
* Exported reports cannot exceed a file size of 250 MB.
* When exporting to PNG, sensitivity labels are not supported.
* [Service principal](embed-service-principal.md) is not supported.
* The number of pages that can be included in an exported report is 30. If the report includes more pages, the API returns an error and the export job is canceled.
* [Personal bookmarks](../consumer/end-user-bookmarks.md#personal-bookmarks) and [persistent filters](https://powerbi.microsoft.com/blog/announcing-persistent-filters-in-the-service/) are not supported
* Paginated reports are currently not supported.
* The Power BI visuals listed below are not supported. When a report containing these visuals is exported, the parts of the report that contain these visuals will not render, and will display an error symbol.
    * Uncertified Power BI visuals
    * R visuals
    * PowerApps
    * Python visuals
    * Visio

## Code examples

When you create an export job, there are three steps to follow:

1. Sending an export request.
2. Polling.
3. Getting the file.

This section provides examples for each step.

### Step 1 - sending an export request

The first step is sending an export request. In this example an export request is sent for a specific page.

```csharp
/////// Export sample ///////
private async Task<string> PostExportRequest(
    Guid reportId,
    Guid groupId,
    FileFormat format,
    IList<string> pageNames = null /* Page names should be acquired from the GetPages API */)
{
    var powerBIReportExportConfiguration = new PowerBIReportExportConfiguration
    {
        Settings = new ExportReportSettings
        {
            Locale = "en-us",
        },

        // Note that page names are different from the page display names. To get the page names please use the GetPages API
        Pages = pageNames?.Select(pn => new ExportReportPage(Name = pn)).ToList(),
    };

    var exportRequest = new ExportReportRequest
    {
        Format = format,
        PowerBIReportConfiguration = powerBIReportExportConfiguration,
    };

    var export = await m_clientManager.GetClient().Reports.ExportToFileInGroupAsync(groupId, reportId, exportRequest);

    // Save the export ID, you'll need it for polling and getting the exported file
    return export.Id;
}
```

### Step 2 - polling

After you've sent an export request, use poling to identify when the export file you're waiting for is ready.

```csharp
/////// Polling sample ///////
private async Task<Export> PollExportRequest(
    Guid reportId,
    Guid groupId,
    string exportId /* Should be acquired from the ExportToAsync response */,
    int timeOutInMinutes,
    CancellationToken token)
{
    Export exportStatus = null;
    PowerBIClient client = m_clientManager.GetClient();
    DateTime startTime = DateTime.UtcNow;
    const int c_secToMillisec = 1000;
    do
    {
        if (DateTime.UtcNow.Subtract(startTime).TotalMinutes > timeOutInMinutes || token.IsCancellationRequested)
        {
            // Error handling for timeout and cancellations
            return null;
        }

        var httpMessage = await client.Reports.GetExportToFileStatusInGroupWithHttpMessagesAsync(groupId, reportId, exportId);
        exportStatus = httpMessage.Body;

        // You can track the export progress using PercentComplete, which is part of the response
        SomeTextBox.Text = string.Format("{0} (Percent Complete : {1}%)", exportStatus.Status.ToString(), exportStatus.PercentComplete);

        if (exportStatus.Status == ExportState.Running || exportStatus.Status == ExportState.NotStarted)
        {
            // The recommended waiting time between polling requests can be found in the RetryAfter header
            // Note that this header is only populated when the status is either Running or NotStarted
            var retryAfter = httpMessage.Response.Headers.RetryAfter;
            var retryAfterInSec = retryAfter.Delta.Value.Seconds;
            await Task.Delay(retryAfterInSec * c_secToMillisec);
        }
    }
    // While not in a terminal state, keep polling
    while (exportStatus.Status != ExportState.Succeeded && exportStatus.Status != ExportState.Failed);

    return exportStatus;
}
```

### Step 3 - getting the file

Once poling returns a URL, use this example to get the received file.

```csharp
/////// Getting file sample ///////
private async Task<ExportedFile> GetExportedFile(
    Guid reportId,
    Guid groupId,
    Export export /*Should be acquired from GetExportStatusAsync response*/)
{
    if (export.Status == ExportState.Succeeded)
    {
        var fileStream = await m_clientManager.GetClient().Reports.GetFileOfExportToFileAsync(groupId, reportId, export.Id);

        return new ExportedFile
        {
            FileStream = fileStream,
            FileSuffix = export.ResourceFileExtension,
        };
     }

    return null;
}

public class ExportedFile
{
    public Stream FileStream;
    public string FileSuffix;
}
```

### End-to-end example

This is an end-to-end example for exporting a report. This example includes the following stages:
1. [Sending the export request](#step-1---sending-an-export-request).
2. [Polling](#step-2---polling).
3. [Getting the file](#step-3---getting-the-file).

```csharp
/////// End-to-end sample ///////
private async Task<ExportedFile> ExportPowerBIReport(
    Guid reportId,
    Guid groupId,
    FileFormat format,
    int pollingtimeOutInMinutes,
    CancellationToken token,
    IList<string> pageNames = null /* Page names should be acquired from the GetPages API */)
{
    try
    {
        var exportId = await PostExportRequest(reportId, groupId, format, pageNames);

        var export = await PollExportRequest(reportId, groupId, exportId, pollingtimeOutInMinutes, token);
        if (export == null || export.Status != ExportState.Succeeded)
        {
            // Error, failure to export the report
            return null;
        }

        return await GetExportedFile(reportId, groupId, export);
    }
    catch
    {
        // Error handling
        throw;
    }
}
```

## Next steps

Review how to embed content for your customers and your organization:

> [!div class="nextstepaction"]
>[Embed for your customers](embed-sample-for-customers.md)

> [!div class="nextstepaction"]
>[Embed for your organization](embed-sample-for-your-organization.md)
