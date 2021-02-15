---
title: Embed Power BI report in a Power BI embedded analytics application for your customers
description: Learn how to embed a Power BI report in a Power BI embedded analytics application for your customers 
author: KesemSharabi
ms.author: kesharab
ms.topic: tutorial
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 02/10/2021
---

# Tutorial: Embed a Power BI report in an application for your customers

In this tutorial you'll learn how to embed a Power BI report in an application for your customers. Embedding Power BI content (such as reports, dashboards and tiles) in a customer facing app, is also known as an *app owns data* solution. In this solution, your users don't need to authenticate against Power BI, your app does it for them.

In this tutorial, you'll learn how to embed:

>[!div class="checklist"]
>* A Power BI report
>* In an *app owns data* app
>* Using .NET
>* With [service principal](embed-service-principal.md) as your app's authentication method against Azure AD

## Prerequisites

* A [Power BI Pro](../../admin/service-admin-purchasing-power-bi-pro.md) or [Premium Per User (PPU)](../../admin/service-premium-per-user-faq.md) license.

    >[!NOTE]
    >To [move to production](move-to-production.md) you'll need a [capacity](embedded-capacity.md).

* A Power BI workspace with a report.

* Your own [Azure Active Directory tenant](create-an-azure-active-directory-tenant.md).

* An [Azure AD app](register-app.md).

* [Service principal](embed-service-principal.md) - An Azure Active Directory (Azure AD) [service principal object](/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object) that allows Azure AD to authenticate your app.

* A .NET Core 5 model view controller (MVC) app.

* [.NET Core 3.1 SDK](https://dotnet.microsoft.com/download/dotnet-core) (or higher).

* An integrated development environment (IDE). We recommend using one of the following:

    * [Visual Studio](https://visualstudio.microsoft.com/).

    * [Visual Studio Code](https://code.visualstudio.com/).

## Resources

This tutorial is using the following NuGet packages and APIs:

* Power BI REST [Reports API](https://docs.microsoft.com/rest/api/power-bi/reports) - Used to embed the URL and retrieve the embed token.

* [Microsoft Identity Web authentication library](/active-directory/develop/microsoft-identity-web).

* [Power BI embedded analytics Client APIs](/javascript/api/overview/powerbi/) -Use to embed the report.

## Method

To embed Power BI content in an *embed for your customers* app, follow these steps:

1. [Get the required component values](#step-1---get-component-values).

## Embed a report in your app

## Step 1 - Get component values

To embed your report, you'll need the values of the following components:

* [Client ID](#client-id)
* [Client secret](#client-secret)
* [Workspace ID](#workspace-id)
* [Report ID](#report-id)

### Client ID

[!INCLUDE[Get the client ID](../../includes/embed-tutorial-client-id.md)]

### Client secret

[!INCLUDE[Get the client secret](../../includes/embed-tutorial-client-secret.md)]

### Workspace ID

[!INCLUDE[Get the workspace ID](../../includes/embed-tutorial-workspace-id.md)]

### Report ID

[!INCLUDE[Get the report ID](../../includes/embed-tutorial-report-id.md)]

### Step 1 - Get an Azure AD access token


# [Embed for your customers](#tab/customers)

1. Using the [embedding setup tool](https://aka.ms/embedsetup), register a server side app. Alternaivly, you can register your app in the [Azure portal](register-app.md#register-with-the-azure-portal).

2. Use the client secret to retrieve the access token using [MSAL.NET](https://github.com/AzureAD/microsoft-authentication-library-for-dotnet/wiki/Client-credential-flows)
    
    ```csharp
    var clientApp = ConfidentialClientApplicationBuilder.Create(clientId)
                                                        .WithClientSecret(clientSecret)
                                                        .WithClientSecret(tenantSpecificUrl)
                                                        .Build()
    var authenticationResult = clientApp.AcquireTokenForClient(scope).ExecuteAsync().Result;
    ```

# [Embed for your organization](#tab/organization)

1. Using the [embedding setup tool](https://aka.ms/embedsetup), register a server side app. Alternaivly, you can register your app in the [Azure portal](register-app.md#register-with-the-azure-portal).

2. Use login popup or redirect for user authentication (using [MSAL JS](https://github.com/AzureAD/microsoft-authentication-library-for-js/wiki/MSAL-JS-1.2.0)).

    ```csharp
    // Initialize MSAL for sign-in
    var userAgentApplication = new Msal.UserAgentApplication(appConfig);
    
    // Redirect user to the sign-in page
    userAgentApplication.loginRedirect(request);
    
    // Register Callbacks for Redirect flow
    userAgentApplication.handleRedirectCallback(authRedirectCallBack);
    function authRedirectCallBack(error, response) {
    
        // Handle error redirect callback
        if (error) {
            console.error("Redirect error: " + error)
        } else {
            if (response.tokenType === "id_token") {
                getUserInfo();
            } else if (response.tokenType === "access_token") {
          var accessToken = response.accessToken;
            } else {
                console.error("Token type is: " + response.tokenType);
            }
        }
    }
    
    function getUserInfo() {
    
        // If user is logged-in or cached
        if (userAgentApplication.getAccount()) {
            // Get Access token from cache
            return userAgentApplication.acquireTokenSilent(request).then(function (tokenResponse) {
                initializeEmbed(tokenResponse);
            }).catch(function (error) {
    
                // Use interaction when silent call fails
                return userAgentApplication.acquireTokenRedirect(request);
            });
        }
    }
    ```

---

### Step 2 - Get embed token and embed URL

# [Embed for your customers](#tab/customers)

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

???

---

## Embed a report in an app for your customers

### Step 1 - Create an HTML file

1. Create a document with a container to embed the report.

    ```html
    <section id="embed-container"></section>
    ```

2. Add a reference to *powerbi-client* and to your custom JavaScript file.

    ```html
    <script src="/lib/powerbi/dist/powerbi.min.js"></script>
    <script src="/js/embed.js"></script>
    ```

Step 2 - Create a JavaScript file

1. To render your reports faster, use [Power BI bootstrap](https://github.com/microsoft/PowerBI-JavaScript/wiki/Bootstrap-For-Better-Performance).

    ```csharp
    var models = window["powerbi-client"].models;
    ```
2. Create a configuration for bootstrap.

    ```csharp
    var bootstrapConfig = { type: "report" };
    ```


## Next steps

Review how to embed content for your customers and your organization:

> [!div class="nextstepaction"]
>[Export paginated report to file](export-paginated-report.md)

> [!div class="nextstepaction"]
>[Embed for your customers](embed-sample-for-customers.md)

> [!div class="nextstepaction"]
>[Embed for your organization](embed-sample-for-your-organization.md)


