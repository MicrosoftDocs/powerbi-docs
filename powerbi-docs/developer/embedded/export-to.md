---
title: Export Power BI embedded analytics reports API
description: Learn how to export an embedded Power BI report.
author: KesemSharabi
ms.author: kesharab
ms.topic: how-to
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 09/09/2021
---

# Export Power BI report to file (preview)

The `exportToFile` API enables exporting a Power BI report by using a REST call. The following file formats are supported:
* **.pptx** (PowerPoint)
* **.pdf**
* **.png**
    * When exporting to a .png, a report with multiple pages is compressed into a .zip file
    * Each file in the .zip represents a report page
    * The page names are the same as the return values of the [Get Pages](/rest/api/power-bi/reports/getpages) or [Get Pages in Group](/rest/api/power-bi/reports/getpagesingroup) APIs

## Gen2

>[!IMPORTANT]
>The changes described in this section will be deployed to Premium Gen2 and Embedded Gen2 capacities in stages, over the following weeks. If these changes are not yet implemented in your Gen2 capacity, wait for the deployment to reach it.

An export API operation load will be evaluated as a slow-running background operation, as described in [Premium Gen2 capacity load evaluation](../../admin/service-premium-concepts.md#premium-gen2-capacity-load-evaluation). The workload under which export API operations will appear, is called `InteractiveReportExports`.

The following improvements are available for [Premium Gen2](../../admin/service-premium-concepts.md) and [Embedded Gen2](power-bi-embedded-generation-2.md) capacities:

* The number of Power BI exports per hour will not be limited to 50 per hour per capacity. Instead, the number of Power BI exports is limited to 50 report pages per minute per capacity.

* [Concurrent requests](#concurrent-requests) are not applicable for Gen2 capacities. There's no maximum concurrent report pages limitation.

## Usage examples

You can use the export feature in a variety of ways. Here are a couple of examples:

* **Send to print button** - In your application, create a button that when clicked on triggers an export job. The job can export the viewed report as a .pdf or a .pptx, and when it's complete, the user can receive the file as a download. Using bookmarks you can export the report in a specific state, including configured filters, slicers, and additional settings. As the API is asynchronous, it may take some time for the file to be available.

* **Email attachment** - Send an automated email at set intervals, with an attached .pdf report. This scenario can be useful if you want to automate sending a weekly report to executives. For more information see [Export and email a Power BI report with Power Automate](../../collaborate-share/service-automate-power-bi-report-export.md)

## Using the API

Before using the API, verify that the following [admin tenant settings](../../admin/service-admin-portal.md#tenant-settings) are enabled:
* **Export reports as PowerPoint presentations or PDF documents** - Enabled by default.
* **Export reports as image files** - Required only for *.png* and disabled by default.

The API is asynchronous. When the [exportToFile](/rest/api/power-bi/reports/exporttofile) API is called, it triggers an export job. After triggering an export job, use [polling](/rest/api/power-bi/reports/getexporttofilestatus) to track the job, until it's complete.

During polling, the API returns a number that represents the amount of work completed. The work in each export job is calculated based on the total of exports in the job. An export includes exporting a single visual, or a page with or without bookmarks. All exports have the same weight. If for example your export job includes exporting a report with 10 pages, and the polling returns 70, it means that the API has processed seven out of the 10 pages in the export job.

When the export is complete, the polling API call returns a [Power BI URL](/rest/api/power-bi/reports/getfileofexporttofile) for getting the file. The URL will be available for 24 hours.

## Supported features

This section describes the operation of the following supported features:

* [Selecting which pages to print](#selecting-which-pages-to-print)
* [Exporting a page or a single visual](#exporting-a-page-or-a-single-visual)
* [Bookmarks](#bookmarks)
* [Filters](#filters)
* [Authentication](#authentication)
* [Row Level Security (RLS)](#row-level-security-rls)
* [Data protection](#data-protection)
* [Localization](#localization)

### Selecting which pages to print

Specify the pages you want to print according to the [Get Pages](/rest/api/power-bi/reports/getpages) or [Get Pages in Group](/rest/api/power-bi/reports/getpagesingroup) return value. You can also specify the order of the pages you're exporting.

### Exporting a page or a single visual

You can specify a page or single visual to export. Pages can be exported with or without bookmarks.

Depending on the type of export, you need to pass different attributes to the [ExportReportPage](/rest/api/power-bi/reports/exporttofile#exportreportpage) object. The table below specifies which attributes are required for each export job.  

>[!NOTE]
>Exporting a single visual has the same weight as exporting a page (with or without bookmarks). This means that in terms of system calculations, both operations carry the same value.

|Attribute   |Page     |Single visual  |Comments|
|------------|---------|---------|---|
|`bookmark`  |Optional |![Does not apply to.](../../media/no.png)|Use to export a page in a specific state|
|`pageName`  |![Applies to.](../../media/yes.png)|![Applies to.](../../media/yes.png)|Use the [GetPages](/rest/api/power-bi/reports/getpage) REST API or the `getPages` client API. For more information see [Get pages and visuals](/javascript/api/overview/powerbi/get-visuals).   |
|`visualName`|![Does not apply to.](../../media/no.png)|![Applies to.](../../media/yes.png)|There are two ways to get the name of the visual:<li>Use the `getVisuals` client API. For more information, see [Get pages and visuals](/javascript/api/overview/powerbi/get-visuals).</li><li>Listen and log the *visualClicked* event, which is triggered when a visual is selected. For more information, see [How to handle events](/javascript/api/overview/powerbi/handle-events)</li>. |

### Bookmarks

[Bookmarks](../../consumer/end-user-bookmarks.md) can be used to save a report in a specific configuration, including applied filters and the state of the report's visuals. You can use the [exportToFile](/rest/api/power-bi/reports/exporttofile) API to programmatically export a report's bookmark, in two ways:

* **Export an existing bookmark**

    To export an existing [report bookmark](../../consumer/end-user-bookmarks.md#report-bookmarks), use the `name` property, a unique (case sensitive) identifier which you can get using the [bookmarks JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Bookmarks).

* **Export the report's state**

    To export the current state of the report, use the `state` property. For example, you can use the bookmark's `bookmarksManager.capture` method to capture the changes a specific user made to a report, and then export it in its current state using `capturedBookmark.state`.

>[!NOTE]
>[Personal bookmarks](../../consumer/end-user-bookmarks.md) and [persistent filters](https://powerbi.microsoft.com/blog/announcing-persistent-filters-in-the-service/) are not supported.

### Filters

Using `reportLevelFilters` in [PowerBIReportExportConfiguration](/rest/api/power-bi/reports/exporttofile#powerbireportexportconfiguration), you can export a report in a filtered condition.

To export a filtered report, insert the [URL query string parameters](../../collaborate-share/service-url-filters.md) you want to use as your filter, to [ExportFilter](/rest/api/power-bi/reports/exporttofile#exportfilter). When you enter the string, you must remove the `?filter=` part of the URL query parameter.

The table below includes a few syntax examples of strings you can pass to  `ExportFilter`.

|Filter    |Syntax    |Example    |
|---|----|----|----|
|A value in a field    |Table/Field eq 'value'    |Store/Territory eq 'NC'    |
|Multiple values in a field    |Table/Field in ('value1', 'value2')     |Store/Territory in ('NC', 'TN')    |
|A distinct value in one field, and a different distinct value in another field    |Table/Field1 eq 'value1' and Table/Field2 eq 'value2'    |Store/Territory eq 'NC' and Store/Chain eq 'Fashions Direct'    |

>[!NOTE]
>`ReportLevelFilters` can only contain a single [ExportFilter](/rest/api/power-bi/reports/exporttofile#exportfilter).

### Authentication

You can authenticate using a user (or master user) or a [service principal](embed-service-principal.md).

### Row Level Security (RLS)

With [Row Level Security (RLS)](embedded-row-level-security.md), you can export a report showing data that's only visible to certain users. For example, if you're exporting a sales report that's defined with regional roles, you can programmatically filter the report so that only a certain region is displayed.

To export using RLS, you must have the following permissions:
* Write and reshare permissions for the dataset the report is connected to
* If the report resides on a v1 workspace, you need to be the workspace admin
* If the report resides on a v2 workspace, you need to be a workspace member or admin

### Data protection

The .pdf and .pptx formats support [sensitivity labels](../../admin/service-security-sensitivity-label-overview.md). If you export a report with a sensitivity label to a .pdf or a .pptx, the exported file will display the report with its sensitivity label.

A report with a sensitivity label cannot be exported to a .pdf or a .pptx using a [service principal](embed-service-principal.md).

### Localization

When using the `exportToFile` API, you can pass your desired local. The localization settings affect the way the report is displayed, for example by changing formatting according to the selected local.

## Concurrent requests

>[!IMPORTANT]
>This section isn't applicable for Gen2 capacities. In Premium and Embedded Gen2, there's no maximum concurrent report pages limitation.

`exportToFile` supports concurrent export job requests. The table below shows the number of jobs you can run at the same time, depending on the SKU your report resides on. Concurrent requests refer to report pages. For example, 20 pages in one export request on an A6 SKU, will be processed concurrently. This will take roughly the same time as sending 20 export requests with one page each.

A job that exceeds its number of concurrent requests doesn't terminate. For example, if you export three pages in an A1 SKU, the first job will run, and the latter two will wait for the next two execution cycles.

>[!NOTE]
>Exporting a Power BI report to file using the `exporToFile` API, is not supported for [Premium Per User (PPU)](../../admin/service-premium-per-user-faq.yml). 

|Azure SKU  |Office SKU  |Maximum concurrent report pages  |
|-----------|------------|-----------|
|A1         |EM1         |1          |
|A2         |EM2         |2          |
|A3         |EM3         |3          |
|A4         |P1          |6          |
|A5         |P2          |12         |
|A6         |P3          |24         |

## Limitations

* The report you're exporting must reside on a Premium or Embedded capacity.
* The dataset of the report you're exporting must reside on a Premium or Embedded capacity.
* For public preview, the number of Power BI exports per hour is limited to 50 per capacity. An export refers to exporting a single visual or a report page with or without bookmarks, and doesn't include exporting paginated reports.
    >[!NOTE]
    >This limitation isn't applicable for Premium and Embedded Gen2 capacities. Instead, in Gen2, the number of Power BI exports is limited to 50 report pages per minute per capacity.
* Exported reports cannot exceed a file size of 250 MB.
* When exporting to .png, sensitivity labels are not supported.
* The number of exports (single visuals or report pages) that can be included in an exported report is 50 (this doesn't include exporting paginated reports). If the request includes more exports, the API returns an error and the export job is canceled.
* [Personal bookmarks](../../consumer/end-user-bookmarks.md) and [persistent filters](https://powerbi.microsoft.com/blog/announcing-persistent-filters-in-the-service/) are not supported.
* The Power BI visuals listed below are not supported. When a report containing these visuals is exported, the parts of the report that contain these visuals will not render, and will display an error symbol.
    * Uncertified Power BI visuals
    * R visuals
    * PowerApps
    * Python visuals
    * Visio

## Code examples

When you create an export job, there are three steps to follow:

1. [Sending an export request](#step-1---sending-an-export-request).
2. [Polling](#step-2---polling).
3. [Getting the file](#step-3---getting-the-file).
4. [Using the file stream](#step-4---using-the-file-stream).

This section provides examples for each step.

### Step 1 - sending an export request

The first step is sending an export request. In this example, an export request is sent for a specific page.

```csharp
private async Task<string> PostExportRequest(
    Guid reportId,
    Guid groupId,
    FileFormat format,
    IList<string> pageNames = null, /* Get the page names from the GetPages REST API */
    string urlFilter = null)
{
    var powerBIReportExportConfiguration = new PowerBIReportExportConfiguration
    {
        Settings = new ExportReportSettings
        {
            Locale = "en-us",
        },
        // Note that page names differ from the page display names
        // To get the page names use the GetPages REST API
        Pages = pageNames?.Select(pn => new ExportReportPage(Name = pn)).ToList(),
        // ReportLevelFilters collection needs to be instantiated explicitly
        ReportLevelFilters = !string.IsNullOrEmpty(urlFilter) ? new List<ExportFilter>() { new ExportFilter(urlFilter) } : null,

    };

    var exportRequest = new ExportReportRequest
    {
        Format = format,
        PowerBIReportConfiguration = powerBIReportExportConfiguration,
    };

    // The 'Client' object is an instance of the Power BI .NET SDK
    var export = await Client.Reports.ExportToFileInGroupAsync(groupId, reportId, exportRequest);

    // Save the export ID, you'll need it for polling and getting the exported file
    return export.Id;
}
```

### Step 2 - polling

After you've sent an export request, use polling to identify when the export file you're waiting for is ready.

```csharp
private async Task<HttpOperationResponse<Export>> PollExportRequest(
    Guid reportId,
    Guid groupId,
    string exportId /* Get from the PostExportRequest response */,
    int timeOutInMinutes,
    CancellationToken token)
{
    HttpOperationResponse<Export> httpMessage = null;
    Export exportStatus = null;
    DateTime startTime = DateTime.UtcNow;
    const int c_secToMillisec = 1000;
    do
    {
        if (DateTime.UtcNow.Subtract(startTime).TotalMinutes > timeOutInMinutes || token.IsCancellationRequested)
        {
            // Error handling for timeout and cancellations 
            return null;
        }

        // The 'Client' object is an instance of the Power BI .NET SDK
        httpMessage = await Client.Reports.GetExportToFileStatusInGroupWithHttpMessagesAsync(groupId, reportId, exportId);
        exportStatus = httpMessage.Body;

        // You can track the export progress using the PercentComplete that's part of the response
        SomeTextBox.Text = string.Format("{0} (Percent Complete : {1}%)", exportStatus.Status.ToString(), exportStatus.PercentComplete);
        if (exportStatus.Status == ExportState.Running || exportStatus.Status == ExportState.NotStarted)
        {
            // The recommended waiting time between polling requests can be found in the RetryAfter header
            // Note that this header is not always populated
            var retryAfter = httpMessage.Response.Headers.RetryAfter;
            var retryAfterInSec = retryAfter.Delta.Value.Seconds;
            await Task.Delay(retryAfterInSec * c_secToMillisec);
        }
    }
    // While not in a terminal state, keep polling
    while (exportStatus.Status != ExportState.Succeeded && exportStatus.Status != ExportState.Failed);

    return httpMessage;
}
```

### Step 3 - getting the file

Once polling returns a URL, use this example to get the received file.

```csharp
private async Task<ExportedFile> GetExportedFile(
    Guid reportId,
    Guid groupId,
    Export export /* Get from the PollExportRequest response */)
{
    if (export.Status == ExportState.Succeeded)
    {
        // The 'Client' object is an instance of the Power BI .NET SDK
        var fileStream = await Client.Reports.GetFileOfExportToFileAsync(groupId, reportId, export.Id);
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

### Step 4 - Using the file stream

When you have the file stream, you can handle it in the way that best fits your needs. For example, you can email it or use it to download the exported reports.

### End-to-end example

This is an end-to-end example for exporting a report. This example includes the following stages:
1. [Sending the export request](#step-1---sending-an-export-request).
2. [Polling](#step-2---polling).
3. [Getting the file](#step-3---getting-the-file).

```csharp
private async Task<ExportedFile> ExportPowerBIReport(
	Guid reportId,
	Guid groupId,
	FileFormat format,
	int pollingtimeOutInMinutes,
	CancellationToken token,
	IList<string> pageNames = null,  /* Get the page names from the GetPages REST API */
    string urlFilter = null)
{
	const int c_maxNumberOfRetries = 3; /* Can be set to any desired number */
	const int c_secToMillisec = 1000;
	try
	{
		Export export = null;
		int retryAttempt = 1;
		do
		{
			var exportId = await PostExportRequest(reportId, groupId, format, pageNames, urlFilter);
			var httpMessage = await PollExportRequest(reportId, groupId, exportId, pollingtimeOutInMinutes, token);
			export = httpMessage.Body;
			if (export == null)
			{
				// Error, failure in exporting the report
				return null;
			}
			if (export.Status == ExportState.Failed)
			{
				// Some failure cases indicate that the system is currently busy. The entire export operation can be retried after a certain delay
				// In such cases the recommended waiting time before retrying the entire export operation can be found in the RetryAfter header
				var retryAfter = httpMessage.Response.Headers.RetryAfter;
				if(retryAfter == null)
				{
				    // Failed state with no RetryAfter header indicates that the export failed permanently
				    return null;
                }

                var retryAfterInSec = retryAfter.Delta.Value.Seconds;
                await Task.Delay(retryAfterInSec * c_secToMillisec);
            }
        }
        while (export.Status != ExportState.Succeeded && retryAttempt++ < c_maxNumberOfRetries);

        if (export.Status != ExportState.Succeeded)
        {
            // Error, failure in exporting the report
            return null;
        }

        var exportedFile = await GetExportedFile(reportId, groupId, export);

        // Now you have the exported file stream ready to be used according to your specific needs
        // For example, saving the file can be done as follows:
        /*
            var pathOnDisk = @"C:\temp\" + export.ReportName + exportedFile.FileSuffix;

            using (var fileStream = File.Create(pathOnDisk))
            {
                exportedFile.FileStream.CopyTo(fileStream);
            }
        */

        return exportedFile;
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
>[Export paginated report to file](export-paginated-report.md)

> [!div class="nextstepaction"]
>[Embed for your customers](embed-sample-for-customers.md)

> [!div class="nextstepaction"]
>[Embed for your organization](embed-sample-for-your-organization.md)

> [!div class="nextstepaction"]
>[Export and email a Power BI report with Power Automate](../../collaborate-share/service-automate-power-bi-report-export.md)
