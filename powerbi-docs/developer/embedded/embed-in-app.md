---
title: Embed Power BI in your application
description: Learn how to embed a Power BI report in your application 
author: KesemSharabi
ms.author: kesharab
ms.topic: conceptual
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 06/14/2020
---

# Embed a Power BI report in your application

Overview

## Prerequisites

* A Power BI workspace with a report

* Integrated development environment (IDE) such as [Visual Studio](https://visualstudio.microsoft.com/downloads/)

* [.NET Core/Framework](https://dotnet.microsoft.com/download)

## Resources

This tutorial is using the following NuGet packages and APIs:


|Resource  |Usage  |
|---------|---------|
|Power BI REST [Reports API](https://docs.microsoft.com/rest/api/power-bi/reports)     |Embed the URL and retrieve the Embed token in an *Embed for your customers* scenario         |
|[MSAL.NET](https://www.nuget.org/packages/Microsoft.Identity.Client/)     |Azure Active Directory (Azure AD) authentication         |
|[Power BI JavaScript SDK](https://www.nuget.org/packages/Microsoft.PowerBI.JavaScript)     |Embed the report         |

## Embed a report in your app

# [Embed for your customers](#tab/customers)

### Step 1 - Get an Azure AD access token

1. Depending on which authentication method you're using, do one of the following:

    # [Master user](#tab/mater user)

    Do this: AAAAAAAAAAAAAAAAAAAAAAA

    # [Service principal](#tab/cservice principal)

    Do this: BBBBBBBBBBBBBBBBBBBBBBBBBBB

    ---

2. Using the [embedding setup tool](https://aka.ms/embedsetup), register a native app (for Master user) and grant  *Report.Read.All* permission to it. Register a Server-side app here for Service Principal. Refer documentation for more information on Service Principal authentication.

### Step 2 - Get embed token and embed URL

1. Use [Embed token](https://docs.microsoft.com/rest/api/power-bi/embedtoken/generatetoken) to retrieve the embedded token.

    ```csharp
    HttpClient embedTokenClient = new HttpClient();
    embedTokenClient.DefaultRequestHeaders.Accept.Clear();
    embedTokenClient.DefaultRequestHeaders.Authorization = (new AuthenticationHeaderValue("Bearer", accessToken));
    
    var tokenEndpoint = "https://api.powerbi.com/v1.0/myorg/GenerateToken";
    
    var requestBody = "{\"datasets\":[{\"id\":\"" + datasetId + "\"}],\"reports\": id\":\"" + reportId + "\"}]}";
    
    var content = new StringContent(requestBody, Encoding.UTF8, "application/json");
    
    var embedTokenApiResponse = embedTokenClient.PostAsync(tokenEndpoint, content).Result;
    
    var response = embedTokenApiResponse.Content.ReadAsStringAsync().Result;
    
    var embedResponse = JsonConvert.DeserializeObject(response) as JObject;
    
    var embedToken = embedResponse.GetValue("token").ToString();
    ```
2. Retrieve the embed URL using the [.NET Power BI client library](https://www.nuget.org/packages/Microsoft.PowerBI.Api/).

    ```csharp
    using (var client = new PowerBIClient(new Uri("https://api.powerbi.com/"), new TokenCredentials(accessToken, "Bearer")))
    {
    var embedUrl = client.Reports.GetReportInGroup(new Guid(workspaceId), new Guid(reportId)).EmbedUrl;
    }	

    ```

3. Use `embedToken` and `embedURL` from the previous steps, to embed a Power BI report on the client side.

# [Embed for your organization](#tab/organization)

     ```csharp
    var credentials = "{\"credentialData\":[{\"name\":\"username\", \"value\":\"john\"},{\"name\":\"password\", \"value\":\"*****\"}]}";
    ```

---

## Next steps

Review how to embed content for your customers and your organization:

> [!div class="nextstepaction"]
>[Export paginated report to file](export-paginated-report.md)

> [!div class="nextstepaction"]
>[Embed for your customers](embed-sample-for-customers.md)

> [!div class="nextstepaction"]
>[Embed for your organization](embed-sample-for-your-organization.md)


