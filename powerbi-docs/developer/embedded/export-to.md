---
title: Export Power BI embedded analytics reports API
description: Learn how to export an embedded Power BI report.
author: billmath
ms.author: billmath
ms.topic: how-to
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 12/15/2025
---

# Export Power BI report to file

The `exportToFile` API enables exporting a Power BI report by using a REST call. The following file formats are supported:

* **.pptx** (PowerPoint)
* **.pdf**
* **.png**
  * When you export to a .png, a report with multiple pages is compressed into a .zip file
  * Each file in the .zip represents a report page
  * The page names are the same as the return values of the [Get Pages](/rest/api/power-bi/reports/getpages) or [Get Pages in Group](/rest/api/power-bi/reports/getpagesingroup) APIs

>[!NOTE]
>Exporting a Power BI report to a file using the exportToFile API is not supported for Premium Per User (PPU).

## Usage examples

You can use the export feature in several ways. Here are a couple of examples:

* **Send to print button** - In your application, create a button that when clicked on triggers an export job. The job can export the viewed report as a .pdf or a .pptx. When it's complete, the user can receive the file as a download. Using bookmarks you can export the report in a specific state, including configured filters, slicers, and other settings. As the API is asynchronous, it may take some time for the file to be available.

* **Email attachment** - Send an automated email at set intervals, with an attached .pdf report. This scenario can be useful if you want to automate sending a weekly report to executives. For more information, see [Export and email a Power BI report with Power Automate](../../collaborate-share/service-automate-power-bi-report-export.md)

## Using the API

### License requirements

* The report you're exporting must reside in a workspace backed by a Premium, Embedded, or Fabric capacity.
* The `exportToFile` API, is *not* supported for [Premium Per User (PPU)](../../enterprise/service-premium-per-user-faq.yml).

### Admin settings

Before using the API, verify that the following [admin tenant settings](../../admin/service-admin-portal-about-tenant-settings.md) are enabled:

* **Export reports as PowerPoint presentations or PDF documents** - Enabled by default.
* **Export reports as image files** - Required only for *.png* and disabled by default.

### "Rendering" events

To make sure the export doesn't begin before the visual finishes rendering use the ["Rendering" events API](../visuals/event-service.md) and only begin the export when rendering is finished.

### Polling

The API is asynchronous. When the [exportToFile](/rest/api/power-bi/reports/exporttofile) API is called, it triggers an export job. After triggering an export job, use [polling](/rest/api/power-bi/reports/getexporttofilestatus) to track the job, until it's complete.

During polling, the API returns a number that represents the amount of work completed. The work in each export job is calculated based on the total of exports in the job. An export includes exporting a single visual, or a page with or without bookmarks. All exports have the same weight. If for example, your export job includes exporting a report with 10 pages, and the polling returns 70, it means the API processed seven out of the 10 pages in the export job.

When the export is complete, the polling API call returns a [Power BI URL](/rest/api/power-bi/reports/getfileofexporttofile) for getting the file. The URL is available for 24 hours.

## Supported features

This section describes how to use the following supported features:

* [Selecting which pages to print](#selecting-which-pages-to-print)
* [Exporting a page or a single visual](#exporting-a-page-or-a-single-visual)
* [Bookmarks](#bookmarks)
* [Filters](#filters)
* [Authentication](#authentication)
* [Row Level Security (RLS)](#row-level-security-rls)
* [Data protection](#data-protection)
* [Localization](#localization)
* [Dynamic binding](#dynamic-binding)

### Selecting which pages to print

Specify the pages you want to print according to the [Get Pages](/rest/api/power-bi/reports/getpages) or [Get Pages in Group](/rest/api/power-bi/reports/getpagesingroup) return value. You can also specify the order of the pages you're exporting.

### Exporting a page or a single visual

You can specify a page or single visual to export. Pages can be exported with or without bookmarks.

Depending on the type of export, you need to pass different attributes to the [ExportReportPage](/rest/api/power-bi/reports/exporttofile#exportreportpage) object. The following table specifies which attributes are required for each export job.  

>[!NOTE]
>Exporting a single visual has the same weight as exporting a page (with or without bookmarks). This means that in terms of system calculations, both operations carry the same value.

|Attribute   |Page     |Single visual  |Comments|
|------------|---------|---------|---|
|`bookmark`  |Optional |![Does not apply to.](../../media/no.png)|Use to export a page in a specific state|
|`pageName`  |![Applies to.](../../media/yes.png)|![Applies to.](../../media/yes.png)|Use the [GetPages](/rest/api/power-bi/reports/getpage) REST API or the [`getPages` client API](/javascript/api/overview/powerbi/get-visuals).   |
|`visualName`|![Does not apply to.](../../media/no.png)|![Applies to.](../../media/yes.png)|There are two ways to get the name of the visual:<li>Use the [`getVisuals` client API](/javascript/api/overview/powerbi/get-visuals).</li><li>Listen and log the *visualClicked* event, which is triggered when a visual is selected. For more information, see [How to handle events](/javascript/api/overview/powerbi/handle-events)</li>. |

### Bookmarks

[Bookmarks](../../explore-reports/end-user-bookmarks.md) can be used to save a report in a specific configuration, including applied filters and the state of the report's visuals. You can use the [exportToFile](/rest/api/power-bi/reports/exporttofile) API to programmatically export a report's bookmark, in two ways:

* **Export an existing bookmark**

    To export an existing [report bookmark](../../explore-reports/end-user-bookmarks.md#report-bookmarks), use the `name` property, a unique (case sensitive) identifier, which you can get using the [bookmarks JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Bookmarks).

* **Export the report's state**

    To export the current state of the report, use the `state` property. For example, you can use the bookmark's `bookmarksManager.capture` method to capture the changes a specific user made to a report, and then export it in its current state using `capturedBookmark.state`.

>[!NOTE]
>[Personal bookmarks](../../explore-reports/end-user-bookmarks.md) and [persistent filters](https://powerbi.microsoft.com/blog/announcing-persistent-filters-in-the-service/) are not supported.

### Filters

Using `reportLevelFilters` in [PowerBIReportExportConfiguration](/rest/api/power-bi/reports/exporttofile#powerbireportexportconfiguration), you can export a report in a filtered condition.

To export a filtered report, insert the [URL query string parameters](../../collaborate-share/service-url-filters.md) you want to use as your filter, to [ExportFilter](/rest/api/power-bi/reports/exporttofile#exportfilter). When you enter the string, you must remove the `?filter=` part of the URL query parameter.

The table includes a few syntax examples of strings you can pass to  `ExportFilter`.

|Filter    |Syntax    |Example    |
|---|----|----|----|
|A value in a field    |Table/Field eq 'value'    |Store/Territory eq 'NC'    |
|Multiple values in a field    |Table/Field in ('value1', 'value2')     |Store/Territory in ('NC', 'TN')    |
|A distinct value in one field, and a different distinct value in another field    |Table/Field1 eq 'value1' and Table/Field2 eq 'value2'    |Store/Territory eq 'NC' and Store/Chain eq 'Fashions Direct'    |

### Authentication

You can authenticate using a user (or master user) or a [service principal](embed-service-principal.md).

### Row Level Security (RLS)

With [Row Level Security (RLS)](embedded-row-level-security.md), you can export a report showing data that's only visible to certain users. For example, if you're exporting a sales report defined with regional roles, you can programmatically filter the report so that only a certain region displays.

To export using RLS, you must have the following permissions:

* Write permissions for the semantic model the report is connected to
* Contributor or admin of the workspace where the report resides

### Data protection

The .pdf and .pptx formats support [sensitivity labels](../../enterprise/service-security-sensitivity-label-overview.md). If you export a report with a sensitivity label to a .pdf or a .pptx, the exported file displays the report with its sensitivity label.

A report with a sensitivity label can't be exported to a .pdf or a .pptx using a [service principal](embed-service-principal.md).

### Localization

When using the `exportToFile` API, you can pass your desired locale. The localization settings affect the way the report is displayed, for example by changing formatting according to the selected local.

### Dynamic binding

To export a report while it's connected to a semantic model other then the default semantic model, specify the required dataset ID in the [`datasetToBind`](/rest/api/power-bi/reports/export-to-file#powerbireportexportconfiguration) parameter when calling the API.
[Read more about dynamic binding](./embed-dynamic-binding.md).

## Concurrent requests

The `exportToFile` API supports a limited number of concurrent requests. The maximum number of concurrent requests supported is 500 per capacity. To avoid exceeding the limit and getting a Too Many Requests (429) error, either distribute the load over time or across capacities.
Only five pages of a report are processed concurrently. For example, if you're exporting a report with 50 pages, the export job is processed in 10 sequential intervals. When optimizing your export job, you may want to consider executing a few jobs in parallel.

## Code examples

When you create an export job, there are four steps to follow:

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

After you send an export request, use polling to identify when the export file you're waiting for is ready.

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

## Considerations and limitations

* An export API operation load is evaluated as a slow-running background operation, as described in [Premium capacity load evaluation](../../enterprise/service-premium-concepts.md).
* All related semantic models in the report you're exporting must reside on a Fabric, Premium or Embedded capacity, including semantic models with a Direct Query connection.
* Exported reports can't exceed a file size of 250 MB.
* When exporting to .png, sensitivity labels aren't supported.
* The number of exports (single visuals or report pages) that can be included in a single exported report is 50 (not including exporting paginated reports). If the request includes more exports, the API returns an error and the export job is canceled.
* [Personal bookmarks](../../explore-reports/end-user-bookmarks.md) and [persistent filters](https://powerbi.microsoft.com/blog/announcing-persistent-filters-in-the-service/) aren't supported for Power BI report export to file.
* The `exportToFile` API exports the report with default value if used without bookmarks or reportLevelFilters.
* Exporting a Power BI report that's connected to one or more composite semantic model, which has at least one external data source with single sign-on (SSO) enabled, is not supported. When exporting, visuals  might not render correctly.
* When exporting a report with [dynamic binding](embed-dynamic-binding.md) using the `exportToFile` REST API, the dynamically bound semantic model can't be a [composite model](../../transform-model/desktop-composite-models.md) with a direct query to SQL Server Analysis Services (SSAS).
* The Power BI visuals listed here aren't supported. When you export a report containing these visuals, the parts of the report that contain these visuals don't render, and display an error symbol.
  * Uncertified Power BI custom visuals
  * R visuals
  * PowerApps
  * Python visuals
  * Power Automate
  * Paginated report visual
  * Visio
  * ArcGIS visuals

## Related content

Review how to embed content for your customers and your organization:

* [Export paginated report to file](export-paginated-report.md)
* [Embed for your customers](embed-sample-for-customers.md)
* [Embed for your organization](embed-sample-for-your-organization.md)
* [Export and email a Power BI report with Power Automate](../../collaborate-share/service-automate-power-bi-report-export.md)

More Questions? Try the [Power BI Community](https://community.powerbi.com/)
