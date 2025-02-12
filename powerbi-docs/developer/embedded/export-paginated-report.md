---
title: Export Power BI embedded analytics paginated reports API
description: Learn how to use the exportToFile API to export an embedded Power BI paginated report to various file formats, including PDF, PPTX, and more.
author: mberdugo
ms.author: monaberdugo
ms.topic: how-to
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 12/23/2024
#customer intent: As a developer, I want to export a paginated report to a file so that I can share it with others.
---

# Export paginated report to file

The `exportToFile` API enables exporting a Power BI paginated report by using a REST call. The following file formats are supported:

* **.pptx** (PowerPoint)
* **.pdf** (and [Accessible PDF, or PDF/UA](../../report-server/rendering-extension-support.md))
* **.xlsx** (Excel)
* **.docx** (Word)
* **.csv**
* **.xml**
* **.mhtml**
* **Image**  
  When exporting to an image, set the image format via the `OutputFormat` format setting. The supported `OutputFormat` values are:

  * *.tiff* (default)
  * *.bmp*
  * *.emf*
  * *.gif*
  * *.jpeg*
  * *.png*

## Usage examples

You can use the export feature in various ways. Here are a couple of examples:

* **Send to print button** - In your application, create a button that when clicked on triggers an export job. The job can export the viewed report as a .pdf or a .pptx. When it's complete, the user can receive the file as a download. Using report parameters and format settings you can export the report in a specific state, including filtered data, custom page sizes, and other format-specific settings. As the API is asynchronous, it may take some time for the file to be available.

* **Email attachment** - Send an automated email at set intervals, with an attached .pdf report. This scenario can be useful if you want to automate sending a weekly report to executives.

## Using the API

### License requirements

* The report you're exporting must reside in a workspace backed by a Premium, Embedded, or Fabric capacity.
* The `exportToFile` API, has [limited support](#concurrent-requests) in [Premium Per User (PPU)](../../enterprise/service-premium-per-user-faq.yml).

### Rendering events

To make sure the export doesn't begin before the visual finishes rendering, use the ["Rendering" events API](../visuals/event-service.md) and only begin the export when rendering is finished.

### Polling

The API is asynchronous. When the [exportToFile](/rest/api/power-bi/reports/exporttofile) API is called, it triggers an export job. After triggering an export job, use [polling](/rest/api/power-bi/reports/getexporttofilestatus) to track the job, until it's complete.

When the export is complete, the polling API call returns a [Power BI URL](/rest/api/power-bi/reports/getfileofexporttofile) for getting the file. The URL is available for 24 hours.

## Supported features

### Format settings

Specify various format settings for each file format. The supported properties and values are equivalent to [Device Info parameters](../../paginated-reports/report-builder-url-parameters.md#report-commands-rdl) for paginated report URL parameters.

Here are two examples. The first is for exporting the first four pages of a report using the report page size to a .pptx file. The second example is for exporting the third page of a report to a .jpeg file.

#### Exporting the first four pages to a .pptx

```json
{
      "format": "PPTX",
      "paginatedReportConfiguration":{
            "formatSettings":{
                  "UseReportPageSize": "true",
                  "StartPage": "1",
                  "EndPage": "4"
            }
      }
}
```

#### Exporting the third page to a .jpeg

```json
{
      "format": "IMAGE",
      "paginatedReportConfiguration":{
            "formatSettings":{
                  "OutputFormat": "JPEG",
                  "StartPage": "3",
                  "EndPage": "3"
            }
      }
}
```

### Report parameters

You can use the `exportToFile` API to programmatically export a report with a set of report parameters. This is done using [report parameter](../../paginated-reports/parameters/paginated-reports-create-parameters.md) capabilities.

Here's an example for setting report parameter values.

```json
{
      "format": "PDF",
      "paginatedReportConfiguration":{
            "parameterValues":[
                  {"name": "State", "value": "WA"},
                  {"name": "City", "value": "Seattle"},
                  {"name": "City", "value": "Bellevue"},
                  {"name": "City", "value": "Redmond"}
            ]
      }
}
```

### Authentication

You can authenticate using a user (or master user) or a [service principal](embed-service-principal.md).

### Row Level Security (RLS)

When using a Power BI semantic model that has Row Level Security (RLS) defined as a data source, you can export a report showing data that's only visible to certain users. For example, if you're exporting a sales report that's defined with regional roles, you can programmatically filter the report so that only a certain region is displayed.

To export using RLS, you must have read permission for the Power BI semantic model the report is using as a data source.

Here's an example of supplying an effective user name for RLS.

```json
{
      "format": "PDF",
      "paginatedReportConfiguration":{
            "identities": [
                  {"username": "john@contoso.com"}
            ]
      }
}
```

### Single Sign-on SQL and Dataverse (SSO)

In Power BI, you have the option to set OAuth with SSO. When you do, the credentials for the user viewing the report are used to retrieve data. The access token in the request header isn't used to access the data. The token must be passed in with the effective identity in the post body.

Getting the correct access token for the resource that you want to access can sometimes be tricky.

* For Azure SQL, the resource is `https://database.windows.net`.
* For Dataverse, the resource is the `https://` address for your environment. For example, `https://contoso.crm.dynamics.com`.

Access the token API using the [AuthenticationContext.AcquireTokenAsync](/azure/active-directory/develop/msal-net-migration-confidential-client) method.

Here's an example for supplying an effective identity (user name) with an access token.

```json
{
       "format":"PDF",
       "paginatedReportConfiguration":{
          "formatSettings":{
             "AccessiblePDF":"true",
             "PageHeight":"11in",
             "PageWidth":"8.5in",
             "MarginBottom":"2in"
          },
          "identities":[
             {
                "username":"john@contoso.com",
                "identityBlob": {
                "value": "eyJ0eX....full access token"
         }
        }
     ]
   }
}
```

## Concurrent requests

The `exportToFile` supports a limited number of concurrent requests. The maximum number of [concurrent paginated report render requests](../../paginated-reports/paginated-capacity-planning.md#concurrent-requests) is 500. To avoid exceeding the limit and getting a Too Many Requests (429) error, either distribute the load over time or across capacities.

With [Premium Per User (PPU)](../../enterprise/service-premium-per-user-faq.yml), the `exportToFile` API allows just *one* request in a five-minute window. Multiple requests within the five-minute window result in a *Too Many Requests* (429) error.

## Code examples

The Power BI API SDK used in the code examples can be download [here](https://www.nuget.org/packages/Microsoft.PowerBI.Api).

When you create an export job, there are three steps to follow:

1. Sending an export request.
2. Polling.
3. Getting the file.

This section provides examples for each step.

### Step 1 - sending an export request

The first step is sending an export request. In this example, an export request is sent for a specific page range, size, and report parameter values.

```csharp
private async Task<string> PostExportRequest(
    Guid reportId,
    Guid groupId)
{
    // For documentation purposes the export configuration is created in this method
    // Ordinarily, it would be created outside and passed in
    var paginatedReportExportConfiguration = new PaginatedReportExportConfiguration()
    {
        FormatSettings = new Dictionary<string, string>()
        {
            {"PageHeight", "14in"},
            {"PageWidth", "8.5in" },
            {"StartPage", "1"},
            {"EndPage", "4"},
        },
        ParameterValues = new List<ParameterValue>()
        {
            { new ParameterValue() {Name = "State", Value = "WA"} },
            { new ParameterValue() {Name = "City", Value = "Redmond"} },
        },
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
    const int secToMillisec = 1000;
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

            await Task.Delay(retryAfterInSec * secToMillisec);
        }
    }
    // While not in a terminal state, keep polling
    while (exportStatus.Status != ExportState.Succeeded && exportStatus.Status != ExportState.Failed);

    return exportStatus;
}
```

### Step 3 - getting the file

Once polling returns a URL, use this example to get the received file.

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

## Considerations and limitations

* Exporting a paginated report that has a Power BI semantic model as its data source, isn't supported in the following cases:

  * The caller is a [service principal profile](./embed-multi-tenancy.md).
  * One of the semantic model's data sources is configured with single sign-on (SSO) enabled and an effective identity was provided.
  * The Power BI semantic model has DirectQuery to Azure Analysis Services or to another Power BI semantic model, and an effective identity was provided.

* Exporting a paginated report that has Azure Analysis Services data source configured with single sign-on (SSO) enabled, isn't supported in the following cases:

  * The caller is a [service principal profile](./embed-multi-tenancy.md).
  * The caller is a master user and an effective identity was provided.

* To export a paginated report with an effective identity, the username must be an existing user from your tenant’s Microsoft Entra ID.

* Export of a report is limited to 60 minutes, which matches the life of the user access token. If you get a timeout error past the 60-minute mark when exporting large amounts of data, consider reducing the amount of data using appropriate filters.

* The file share URL hyperlink (file share /UNC path) doesn't works when exporting a published paginated report on Power BI service online.  

## Related content

Review how to embed content for your customers and your organization:

* [Export report to file](export-to.md)
* [Embed for your customers](embed-sample-for-customers.md)
* [Embed for your organization](embed-sample-for-your-organization.md)
