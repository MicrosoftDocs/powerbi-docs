---
title: Embed Power BI report in a Power BI embedded analytics application for your customers
description: Learn how to embed a Power BI report in a Power BI embedded analytics application for your customers 
author: KesemSharabi
ms.author: kesharab
ms.topic: tutorial
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 06/23/2021
---

# Tutorial: Embed a Power BI report in an application for your customers

In this tutorial, you'll learn how to embed a Power BI report in a .NET 5.0 application, as part of the *embed for your customers* (also known as an *app owns data*) solution. In an *embed for your customers* solution, your app users will not need to sign in to Power BI or have a Power BI license.

In this tutorial, you'll learn how to embed:

>[!div class="checklist"]
>* A Power BI report
>* In an *embed for your customers* app
>* Using a *service principal*
>* Using .NET 5.0
>* With the `Microsoft.Identity.Web` library (this library is also supported in .NET Core)

>[!NOTE]
>The full solution used in this tutorial, is available from the [DOTNET5-AppOwnsData-Tutorial](https://github.com/PowerBiDevCamp/DOTNET5-AppOwnsData-Tutorial) GitHub repository.

## Prerequisites

* A [Power BI Pro](../../admin/service-admin-purchasing-power-bi-pro.md) or [Premium Per User (PPU)](../../admin/service-premium-per-user-faq.yml) license.

* A Power BI workspace with a report.

* Your own [Azure Active Directory tenant](create-an-azure-active-directory-tenant.md).

* An [Azure AD app](register-app.md).

* A .NET Core 5 model view controller (MVC) app.

* [.NET Core 5 SDK](https://dotnet.microsoft.com/download/dotnet-core) (or higher).

* An integrated development environment (IDE). We recommend using one of the following:

    * [Visual Studio](https://visualstudio.microsoft.com/).

    * [Visual Studio Code](https://code.visualstudio.com/) (with the [C# extension](https://code.visualstudio.com/docs/languages/csharp)).

## Resources

In this tutorial, you'll use:

* Power BI REST [Reports API](/rest/api/power-bi/reports) - Used to embed the URL and retrieve the embed token.

* [Microsoft Identity Web authentication library](/azure/active-directory/develop/microsoft-identity-web).

* [Power BI embedded analytics Client APIs](/javascript/api/overview/powerbi/) - Use to embed the report.

## Method

To embed Power BI content in an *embed for your customers* solution, follow these steps:

1. [Configure your Azure AD app and enable service principal access](#step-1---configure-your-azure-ad-app).

2. [Get the embedding parameter values](#step-2---get-the-embedding-parameter-values).

3. [Add the required NuGet packages](#step-3---add-the-required-nuget-packages)

4. [Enable server side authentication](#step-4---enable-server-side-authentication).

5. [Build your app's client side](#step-5---build-your-apps-client-side).

6. [Run your application](#step-6---run-your-application)

## Step 1 - Configure your Azure AD app and enable service principal access

In this tutorial you'll use a *service principal* to authenticate you're web app against Azure AD. You'll also need an Azure AD app which will enable you to generate an [Azure AD token](embed-tokens.md#azure-ad-token). The *Azure AD token* enables your web app to call Power BI REST APIs and embed Power BI items such as reports, dashboards or tiles.

Follow the [service principal instructions](embed-service-principal.md) to create an Azure AD app and enable the apps service principal to work with your Power BI content.

## Step 2 - Get the embedding parameter values

To embed your report, you'll need the following values:

* [Domain](#domain-and-tenant-id)
* [Tenant ID](#domain-and-tenant-id)
* [Client ID](#client-id)
* [Client secret](#client-secret)
* [Workspace ID](#workspace-id)
* [Report ID](#report-id)

### Domain and tenant ID

If you don't know what's your domain or tenant ID, see [Find the Microsoft Azure AD tenant ID and primary domain name](/partner-center/find-ids-and-domain-names#find-the-microsoft-azure-ad-tenant-id-and-primary-domain-name).

>[!NOTE]
>To [embed content for a user on a different tenant](embedded-troubleshoot.md#azure-ad-token-for-a-different-tenant-guest-user) (a guest user), you'll need to adjust the `authorityUri` parameter.

### Client ID

[!INCLUDE[Get the client ID](../../includes/embed-tutorial-client-id.md)]

### Client secret

[!INCLUDE[Get the client secret](../../includes/embed-tutorial-client-secret.md)]

### Workspace ID

[!INCLUDE[Get the workspace ID](../../includes/embed-tutorial-workspace-id.md)]

>[!NOTE]
>To get the workspace ID programmatically, use the [Get Groups](/rest/api/power-bi/groups/getgroups) API.

### Report ID

[!INCLUDE[Get the report ID](../../includes/embed-tutorial-report-id.md)]

>[!NOTE]
>To get the report ID programmatically, use the [Get Reports In Group](/rest/api/power-bi/reports/getreportsingroup) API.

## Step 3 - Add the required NuGet packages

Before you can start, you'll need to add the `Microsoft.Identity.Web`, and `Microsoft.PowerBI.Api` NuGet packages to your app.

Add the NuGet packages listed below to your app:

* In **VS Code**, open a terminal and type in the code below.

* In **Visual studio**, navigate to *Tools* > *NuGet Package Manager* > *Package Manager Consol* and type in the code below.

```powershell
dotnet add package Microsoft.Identity.Web -v 0.3.0-preview
dotnet add package Microsoft.Identity.Web.UI -v 0.3.0-preview
dotnet add package Microsoft.PowerBI.Api
```

If your app previously used `Microsoft.AspNetCore` to authenticate, remove this package from your project by typing:

```powershell
dotnet remove package Microsoft.AspNetCore.Authentication.AzureAD.UI
```

## Step 4 - Enable server-side authentication

Enable server-side authentication in your app, by creating or modifying the files in the table below.

|File                 |Use  |
|---------------------|-----|
|Startup.cs           |Initialize the `Microsoft.Identity.Web` authentication service |
|appsettings.json     |Authentication details |
|PowerBiServiceApi.cs |Get the Azure AD token and embedding metadata    |
|HomeController.cs    |Pass embedding data as a model to the view |

### Configure your startup file to support `Microsoft.Identity.Web`

Modify the code in **Startup.cs** to properly initialize the authentication service provided by `Microsoft.Identity.Web`.

Add the code snippet below to your app's **Startup.cs** file.

>[!NOTE]
>The code in `ConfigureServices` accomplishes several important things:
>1. The call to `AddMicrosoftWebAppCallsWebApi` configures the Microsoft authentication library to acquire access tokens (Azure AD tokens).
>2. The call to `AddInMemoryTokenCaches` configures a token cache that the Microsoft authentication library will use to cache access tokens and refresh tokens behind the scenes
>3. The call to `services.AddScoped(typeof(PowerBiServiceApi))` configures the `PowerBiServiceApi` class as a service class that can be added to other classes using dependency injection.

```csharp
using Microsoft.Identity.Web;
using Microsoft.Identity.Web.TokenCacheProviders;
using Microsoft.Identity.Web.TokenCacheProviders.InMemory;
using Microsoft.Identity.Web.UI;
using AppOwnsData.Services;

namespace AppOwnsData {

  public class Startup {

    public Startup (IConfiguration configuration) {
      Configuration = configuration;
    }

    public IConfiguration Configuration { get; }

    // This method gets called by the runtime. Use this method to add services to the container.
    public void ConfigureServices (IServiceCollection services) {

      services
        .AddMicrosoftIdentityWebAppAuthentication(Configuration)
        .EnableTokenAcquisitionToCallDownstreamApi(PowerBiServiceApi.RequiredScopes)
        .AddInMemoryTokenCaches();

      services.AddScoped (typeof (PowerBiServiceApi));

      var mvcBuilder = services.AddControllersWithViews (options => {
        var policy = new AuthorizationPolicyBuilder()
          .RequireAuthenticatedUser()
          .Build();
        options.Filters.Add (new AuthorizeFilter (policy));
      });

      mvcBuilder.AddMicrosoftIdentityUI();

      services.AddRazorPages();

    }
  }
}
```

### Create an authentication details file

In this tutorial, the `appsettings.json` file contains sensitive information such as *client ID* and *client secret*. For security reasons, it's not recommended to keep this information in the settings file. When embedding in your application, consider a more secure method such as [Azure Key Vault](/azure/key-vault/general/overview) for keeping this information.

1. In your project, create a new file and call it **appsettings.json**.

2. Add the following code to **appsettings.json**:

    ```json
    {
        "AzureAd": {
            "Instance": "https://login.microsoftonline.com/",
            "Domain": "",
            "TenantId": "",
            "ClientId": "",
            "ClientSecret": "",
            "CallbackPath": "/signin-oidc",
            "SignedOutCallbackPath": "/signout-callback-oidc"
        },
        "PowerBi": {
            "ServiceRootUrl": "https://api.powerbi.com"
        },
        "Logging": {
            "LogLevel": {
                "Default": "Information",
                "Microsoft": "Warning",
                "Microsoft.Hosting.Lifetime": "Information"
            }
        },
        "AllowedHosts": "*"
    }
    ```

3. Fill in the embedding parameter values obtained from [Step 2 - Get the embedding parameter values](#step-2---get-the-embedding-parameter-values).

    * `Domain` - [Domain and tenant ID](#domain-and-tenant-id)
    * `TenantId` - [Domain and tenant ID](#domain-and-tenant-id)
    * `ClientId` - [Client ID](#client-id)
    * `ClientSecret` - [Client secret](#client-secret)

>[!NOTE]
>In the code snippet above, the `PowerBi:ServiceRootUrl` parameter is added as a custom configuration value to track the base URL to the Power BI service. When you are programming against the Power BI service in the Microsoft public cloud, the URL is https://api.powerbi.com/. However, the root URL for the Power BI service will be different in other clouds such as the government cloud. Therefore, this value is stored as a project configuration value so it is easy to change whenever required.

### Get the Azure AD access token and call the Power BI service

In order to embed Power BI content (such as reports and dashboards), your app needs to get an [Azure AD token](embed-tokens.md#azure-ad-token). To get the token, you'll need a [configuration object](/javascript/api/overview/powerbi/embed-report#embed-a-new-report).

The code in this section uses the .NET Core dependency injection pattern. When your class needs to use a service, you can add a constructor parameter for that service and the .NET Core runtime takes care of passing the service instance at run time. In this case, the constructor is injecting an instance of the .NET Core configuration service using the `IConfiguration` parameter, which is used to retrieve the `PowerBi:ServiceRootUrl` configuration value from **appsettings.json**. The `ITokenAcquisition` parameter, which is named `tokenAcquisition` holds a reference to the Microsoft authentication service provided by the `Microsoft.Identity.Web` library and will be used to acquire access tokens from Azure AD.

The `RequiredScopes` field holds a string array containing a set of [delegated permissions](/azure/active-directory/develop/v2-permissions-and-consent) supported by the Power BI service API. When your application calls across the network to acquire an Azure AD token, it will pass this set of delegated permissions so that Azure AD can include them in the access token it returns.

>[!NOTE]
>Verify that your *Azure AD app* is configured with the scopes required by your web app. For more information, see [Change your Azure AD app's permissions](register-app.md#change-your-azure-ad-apps-permissions).

1. In your app's project, create a new folder titled **Services**.

2. In the **Services** folder, create a new file titled **PowerBiServiceApi.cs**.

3. Add the following code to **PowerBiServiceApi.cs**.

    ```csharp
    using Microsoft.Identity.Web;
    using Microsoft.Rest;
    using Microsoft.PowerBI.Api;
    using Microsoft.PowerBI.Api.Models;
    using Newtonsoft.Json;
    
    namespace AppOwnsData.Services {
    
    // A view model class to pass the data needed to embed a single report.
      public class EmbeddedReportViewModel {
        public string Id;
        public string Name;
        public string EmbedUrl;
        public string Token;
      }
    
      public class PowerBiServiceApi {
    
        private ITokenAcquisition tokenAcquisition { get; }
        private string urlPowerBiServiceApiRoot { get; }
    
        public PowerBiServiceApi(IConfiguration configuration, ITokenAcquisition tokenAcquisition) {
          this.urlPowerBiServiceApiRoot = configuration["PowerBi:ServiceRootUrl"];
          this.tokenAcquisition = tokenAcquisition;
        }
    
        public const string powerbiApiDefaultScope = "https://analysis.windows.net/powerbi/api/.default";
    
        // A method to get the Azure AD token (also known as 'access token')
        public string GetAccessToken() {
          return this.tokenAcquisition.GetAccessTokenForAppAsync(powerbiApiDefaultScope).Result;
        }
    
        public PowerBIClient GetPowerBiClient() {
          var tokenCredentials = new TokenCredentials(GetAccessToken(), "Bearer");
          return new PowerBIClient(new Uri(urlPowerBiServiceApiRoot), tokenCredentials);
        }
    
        public async Task<EmbeddedReportViewModel> GetReport(Guid WorkspaceId, Guid ReportId) {
    
          PowerBIClient pbiClient = GetPowerBiClient();
    
          // Call the Power BI service API to get the embedding data
          var report = await pbiClient.Reports.GetReportInGroupAsync(WorkspaceId, ReportId);
    
          // Generate a read-only embed token for the report
          var datasetId = report.DatasetId;
          var tokenRequest = new GenerateTokenRequest(TokenAccessLevel.View, datasetId);
          var embedTokenResponse = await pbiClient.Reports.GenerateTokenAsync(WorkspaceId, ReportId, tokenRequest);
          var embedToken = embedTokenResponse.Token;
    
          // Return the report embedded data to caller
          return new EmbeddedReportViewModel {
            Id = report.Id.ToString(),
            EmbedUrl = report.EmbedUrl,
            Name = report.Name,
            Token = embedToken
          };
        }
    
        public async Task<string> GetEmbeddedViewModel(string appWorkspaceId = "") {
    
          PowerBIClient pbiClient = GetPowerBiClient();
    
          Object viewModel;
    
          Guid workspaceId = new Guid(appWorkspaceId);
          var workspaces = (await pbiClient.Groups.GetGroupsAsync()).Value;
          var currentWorkspace = workspaces.First((workspace) => workspace.Id == workspaceId);
          var datasets = (await pbiClient.Datasets.GetDatasetsInGroupAsync(workspaceId)).Value;
          var reports = (await pbiClient.Reports.GetReportsInGroupAsync(workspaceId)).Value;
    
          IList<GenerateTokenRequestV2Dataset> datasetRequests = new List<GenerateTokenRequestV2Dataset>();
          foreach (var dataset in datasets) {
            datasetRequests.Add(new GenerateTokenRequestV2Dataset(dataset.Id));
          };
    
          IList<GenerateTokenRequestV2Report> reportRequests = new List<GenerateTokenRequestV2Report>();
          foreach (var report in reports) {
            reportRequests.Add(new GenerateTokenRequestV2Report(report.Id, allowEdit: true));
          };
    
    
          IList<GenerateTokenRequestV2TargetWorkspace> workspaceRequests =
            new GenerateTokenRequestV2TargetWorkspace[] {
                    new GenerateTokenRequestV2TargetWorkspace(workspaceId)
          };
    
    
          GenerateTokenRequestV2 tokenRequest =
            new GenerateTokenRequestV2(datasets: datasetRequests,
                                        reports: reportRequests,
                                        targetWorkspaces: workspaceRequests);
    
    
          // Call the Power BI service API and pass the GenerateTokenRequest object to generate an embed token
          string embedToken = pbiClient.EmbedToken.GenerateToken(tokenRequest).Token;
    
    
          viewModel = new {
            workspaces = workspaces,
            currentWorkspace = currentWorkspace.Name,
            datasets = datasets,
            reports = reports,
            token = embedToken
          };
    
          return JsonConvert.SerializeObject(viewModel);
        }
    
        public async Task<Group> GetFirstWorkspace() {
          PowerBIClient pbiClient = this.GetPowerBiClient();
          var workspaces = (await pbiClient.Groups.GetGroupsAsync()).Value;
          if (workspaces.Count > 0) {
            return workspaces.First();
          }
          else {
            return null;
          }
        }
    
      }
    }
    ```

### Modify the HomeController.cs file

In this code example, you'll use dependency injection. As you registered the `PowerBiServiceApi` class as a service by calling `services.AddScoped` in the `ConfigureServices` method. You can add a `PowerBiServiceApi` parameter to the constructor, and the .NET Core runtime will take care of creating a `PowerBiServiceApi` instance and passing it to the constructor.

From the **Controllers** folder, open the **HomeController.cs** file and add to it the following code snippet:

```csharp
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using AppOwnsData.Models;
using AppOwnsData.Services;

namespace AppOwnsData.Controllers {
    [Authorize]
    public class HomeController : Controller {

        private PowerBiServiceApi powerBiServiceApi;

        public HomeController (PowerBiServiceApi powerBiServiceApi) {
            this.powerBiServiceApi = powerBiServiceApi;
        }

        [AllowAnonymous]
        public IActionResult Index() {
            return View();
        }

        public async Task<IActionResult> Embed() {
            Guid workspaceId = new Guid("11111111-1111-1111-1111-111111111111");
            Guid reportId = new Guid("22222222-2222-2222-2222-222222222222");
            var viewModel = await powerBiServiceApi.GetReport(workspaceId, reportId);
            return View(viewModel);
        }

        [AllowAnonymous]
        [ResponseCache (Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error() {
            return View (new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
```

## Step 5 - Build your app's client side

For client-side implementation, you'll need to create or modify the files in the table below

|File                 |Use  |
|---------------------|-----|
|embed.js             |Contains the client-side JavaScript code |
|Embed.cshtml         |Contains your app's document object model (DOM), and a DIV for embedding the report |

### Create a container for your embedded report

Create the **Embed.cshtml** file, which has a `div` element used as a container for your embedded report, and three scripts.

1. In the **View** > **Home** folder, create a file called **Embed.cshtml**.

2. Add the following code snippet to the **Embed.cshtml** file.

    ```html
    @model AppOwnsData.Services.EmbeddedReportViewModel;

    <div id="embed-container" style="height:800px;"></div>
    
    @section Scripts {
    
        <!-- powerbi.min.js is the JavaScript file that loads the client-side Power BI JavaScript API library.
        Make sure that you're working with the latest library version.
        You can check the latest library available in https://cdnjs.com/libraries/powerbi-client -->
        <script src="https://cdn.jsdelivr.net/npm/powerbi-client@2.18.0/dist/powerbi.min.js"></script>
    
        <!-- This script creates a JavaScript object named viewModel which is accessible to the JavaScript code in embed.js. -->
        <script> 
            var viewModel = {
                reportId: "@Model.Id",
                embedUrl: "@Model.EmbedUrl",
                token: "@Model.Token"
            }; 
        </script>
        
        <!-- This script specifies the location of the embed.js file -->
        <script src="~/js/embed.js"></script>
    }
    ```

### Add client-side JavaScript to embed your report

To embed Power BI content, you need to create a configuration object. To learn more about creating the configuration object, see [Embed a report](/javascript/api/overview/powerbi/embed-report).

In this tutorial, you'll create a JavaScript file named **embed.js** with a configuration object for embedding your report, using the variable `models`.

`models` is initialized using a call to `window['powerbi-client'].models`. The `models` variable is used to set configuration values such as `models.Permissions.All`, `models.TokenType.Aad` and `models.ViewMode.View`.

The `powerbi.embed` function uses the `models` configuration object to embed your report.

1. In the **wwwroot** > **js** folder, create a file called **embed.js**.

2. Add the following code snippet to the **embed.js** file.

    ```javascript
    $(function(){
        // 1 - Get DOM object for div that is report container
        let reportContainer = document.getElementById("embed-container");
    
        // 2 - Get report embedding data from view model
        let reportId = window.viewModel.reportId;
        let embedUrl = window.viewModel.embedUrl;
        let token = window.viewModel.token
    
        // 3 - Embed report using the Power BI JavaScript API.
        let models = window['powerbi-client'].models;
        let config = {
            type: 'report',
            id: reportId,
            embedUrl: embedUrl,
            accessToken: token,
            permissions: models.Permissions.All,
            tokenType: models.TokenType.Aad,
            viewMode: models.ViewMode.View,
            settings: {
                panes: {
                    filters: { expanded: false, visible: true },
                    pageNavigation: { visible: false }
                }
            }
        };
    
        // Embed the report and display it within the div container.
        let report = powerbi.embed(reportContainer, config);
    
        // 4 - Add logic to resize embed container on window resize event
        let heightBuffer = 12;
        let newHeight = $(window).height() - ($("header").height() + heightBuffer);
        $("#embed-container").height(newHeight);
        $(window).resize(function() {
            var newHeight = $(window).height() - ($("header").height() + heightBuffer);
            $("#embed-container").height(newHeight);
        });
        
    });
    ```

## Step 6 - Run your application

After you've made all the adjustments listed in this tutorial, you're ready to run your application. Execute your application and experiment with the way your Power BI report is embedded. You can use the [Power BI embedded analytics Client APIs](/javascript/api/overview/powerbi/) to enhance your app using client side APIs.

When your app is ready, you can [move your embedded app to production](move-to-production.md).

## Next steps

> [!div class="nextstepaction"]
>[Embedded analytics application tokens](embed-tokens.md)

> [!div class="nextstepaction"]
>[Move your embedded app to production](move-to-production.md)

> [!div class="nextstepaction"]
>[Capacity and SKUs in Power BI embedded analytics](embedded-capacity.md)

> [!div class="nextstepaction"]
>[Capacity planning in Power BI embedded analytics](embedded-capacity-planning.md)
