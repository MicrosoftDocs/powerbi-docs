---
title: Export Paginated Reports API
description: Learn how to export a Paginated Report 
author: AndreMilbradt
ms.author: andremi
ms.topic: conceptual
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 02/28/2020
---

# Export Paginated Report to file (preview)

The `exportToFile` API enables exporting a Power BI report by using a REST call. The following file formats are supported:
* **PPTX** (PowerPoint)
* **PDF**
* **XLSX** (Excel)
* **DOCX** (Word)
* **CSV**
* **XML**
* **MHTML**
* **IMAGE**
    * When exporting to IMAGE, set the image format via the OutputFormat format setting.
    * The supported OutputFormat values are: BMP, EMF, GIF, JPEG, PNG, or TIFF (default)

## Using the API

The API is asynchronous. When the [exportToFile](https://docs.microsoft.com/rest/api/power-bi/reports/exporttofile) API is called, it triggers an export job. After triggering an export job, use [polling](https://docs.microsoft.com/rest/api/power-bi/reports/getexporttofilestatus) to track the job, until it's complete.

When the export is complete, the polling API call returns a [Power BI URL](https://docs.microsoft.com/rest/api/power-bi/reports/getfileofexporttofile) for getting the file. The URL will be available for 24 hours.

## Supported features

### Format settings

Specify a variety of format settings for each file format. The supported properties and values are equivalent to [Device Information settings](https://docs.microsoft.com/en-us/sql/reporting-services/device-information-settings-for-rendering-extensions-reporting-services) for Reporting Services.

Here is an example for exporting to a PDF file:

```json
{
      "format": "PDF",
      "paginatedReportConfiguration":{
            "formatSettings":{
                  "PageHeight": "14in",
                  "PageWidth": "8.5in",
                  "StartPage": "1",
                  "EndPage": "4"
            }
      }
}
```

### Report parameters

You can use the `exportToFile` API to programmatically export a report with a set of report parameters. This is done using [Report Parameter](https://docs.microsoft.com/en-us/power-bi/paginated-reports-parameters) capabilities.

Here is an example for setting report parameter values:

```json
{
      "format": "PDF",
      "paginatedReportConfiguration":{
            "parameterValues":[
                  { "name": "State", "value": "WA"},
                  { "name": "City", "value": "Redmond"}
            ]
      }
}
```

### Authentication

You can only authenticate using a user (or master user). Currently [service principal](embed-service-principal.md) is not supported.

### Row Level Security (RLS)

When using a Power BI dataset that has Row Level Security (RLS) defined as a data source, you can export a report showing data that's only visible to certain users. For example, if you're exporting a sales report that's defined with regional roles, you can programmatically filter the report so that only a certain region is displayed.

To export using RLS, you must have the following permissions:
* Write and reshare permissions for the Power BI dataset the report is using as a data source

## Limitations

* [Service principal](embed-service-principal.md) is not supported.

## Code examples

When you create an export job, there are three steps to follow:

1. Sending an export request.
2. Polling.
3. Getting the file.

This section provides examples for each step.

### Step 1 - sending an export request

The first step is sending an export request. In this example, an export request is sent for a specific page range & size and report parameter values.

```csharp
private async Task<string> PostExportRequest(
    Guid reportId,
    Guid groupId)
{
    // For documentation purposes the export configuration is created in this method. 
    // Ordinarily, it would be created outside and passed in.
    var paginatedReportExportConfiguration = new PaginatedReportExportConfiguration()
    {
        FormatSettings = new Dictionary<string, string>()
        {
            {"PageHeight", "14in"},
            {"PageWidth", "8.5in" },
            {"StartPage", "1"},
            {"EndPage", "4"}
        },
        ParameterValues = new List<ParameterValue>()
        {
            { new ParameterValue() {Name = "State", Value = "WA"} },
            { new ParameterValue() {Name = "City", Value = "Redmond"} }
        }
    };

    var exportRequest = new ExportReportRequest
    {
        Format = FileFormat.PDF,
        PaginatedReportExportConfiguration = paginatedReportExportConfiguration,
    };

    var export = await Client.Reports.ExportToFileInGroupAsync(groupId, reportId, exportRequest);

    // Save the export ID, you'll need it for polling and getting the exported file
    return export.Id;
}
```

### Step 2 - polling

After you've sent an export request, use polling to identify when the export file you're waiting for is ready.

```csharp
private async Task<Export> PollExportRequest(
    Guid reportId,
    Guid groupId,
    string exportId /* Get from the ExportToAsync response */,
    int timeOutInMinutes,
    CancellationToken token)
{
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

        var httpMessage = 
            await Client.Reports.GetExportToFileStatusInGroupWithHttpMessagesAsync(groupId, reportId, exportId);
            
        exportStatus = httpMessage.Body;
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
private async Task<ExportedFile> GetExportedFile(
    Guid reportId,
    Guid groupId,
    Export export /* Get from the GetExportStatusAsync response */)
{
    if (export.Status == ExportState.Succeeded)
    {
        var httpMessage = 
            await Client.Reports.GetFileOfExportToFileInGroupWithHttpMessagesAsync(groupId, reportId, export.Id);

        return new ExportedFile
        {
            FileStream = httpMessage.Body,
            ReportName = export.ReportName,
            FileExtension = export.ResourceFileExtension,
        };
    }

    return null;
}

public class ExportedFile
{
    public Stream FileStream;
    public string ReportName;
    public string FileExtension;
}
```

### End-to-end example

This is an end-to-end example for exporting a report. This example includes the following stages:
1. [Sending the export request](#step-1---sending-an-export-request).
2. [Polling](#step-2---polling).
3. [Getting the file](#step-3---getting-the-file).

```csharp
private async Task<ExportedFile> ExportPaginatedReport(
    Guid reportId,
    Guid groupId,
    int pollingtimeOutInMinutes,
    CancellationToken token)
{
    try
    {
        var exportId = await PostExportRequest(reportId, groupId);

        var export = await PollExportRequest(reportId, groupId, exportId, pollingtimeOutInMinutes, token);
        if (export == null || export.Status != ExportState.Succeeded)
        {
            // Error, failure in exporting the report
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
