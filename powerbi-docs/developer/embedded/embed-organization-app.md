---
title: Embed Power BI report in a Power BI embedded analytics application for your organization
description: Learn how to embed a Power BI report in a Power BI embedded analytics application for your organization 
author: KesemSharabi
ms.author: kesharab
ms.topic: tutorial
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 02/10/2021
---

# Tutorial: Embed a Power BI report in an application for your organization

In this tutorial you'll learn how to embed a Power BI report in an application for your organization. Embedding Power BI content (such as reports, dashboards and tiles) in an app for your organization, is also known as an *app owns data* solution. In this solution, your users need to authenticate against Power BI with their own credentials.

In this tutorial, you'll learn how to embed:

>[!div class="checklist"]
>* A Power BI report
>* In a *user owns data* app
>* Using .NET
>* With the Microsoft.Identity.Web library

## Prerequisites

* A [Power BI Pro](../../admin/service-admin-purchasing-power-bi-pro.md) or [Premium Per User (PPU)](../../admin/service-premium-per-user-faq.md) license.

    >[!NOTE]
    >To [move to production](move-to-production.md) you'll need a [capacity](embedded-capacity.md).

* A Power BI workspace with a report.

* Your own [Azure Active Directory tenant](create-an-azure-active-directory-tenant.md).

* An [Azure AD app](register-app.md).

* A .NET Core 5 model view controller (MVC) app.

* [.NET Core 5 SDK](https://dotnet.microsoft.com/download/dotnet-core) (or higher).

* An integrated development environment (IDE). We recommend using one of the following:

    * [Visual Studio](https://visualstudio.microsoft.com/).

    * [Visual Studio Code](https://code.visualstudio.com/) (with the [C# extension](https://code.visualstudio.com/docs/languages/csharp)).

## Resources

This tutorial is using the following NuGet packages and APIs:

* Power BI REST [Reports API](https://docs.microsoft.com/rest/api/power-bi/reports) - Used to embed the URL and retrieve the embed token.

* [Microsoft Identity Web authentication library](/active-directory/develop/microsoft-identity-web).

* [Power BI embedded analytics Client APIs](/javascript/api/overview/powerbi/) -Use to embed the report.

## Method

To embed Power BI content in an *embed for your organization* app, follow these steps:

1. [Configure your Azure AD app](#step-1---configure-your-azure-ad-app)

2. [Get the required component values](#step-2---get-component-values).

3. [Enable server side authentication](#step-3---enable-server-side-authentication).

4. [Create a client side authentication file](#step-4---create-a-client-side-authentication-file)

## Step 1 - Configure your Azure AD app

Before your web app contacts Power BI, it needs to authenticate against Azure AD to get an [Azure AD token](#azure-ad-token). The *Azure AD token* enables your web app to call Power BI REST APIs.

If you don't have an Azure AD app, create one using the instructions in [Register an Azure AD application to use with Power BI](register.app.md).

To configure your Azure AD app, follow the instructions in [Configure your Azure AD app](embed-sample-for-your-organization?tabs=net-core#configure-your-azure-ad-app).

## Step 2 - Get component values

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

## Step 3 - Enable server side authentication

Enable server side authentication in your app, by creating or modifying the files in the table below

|File                 |Use  |
|---------------------|-----|
|Startup.cs           |Initialize the Microsoft.Identity.Web authentication service |
|appsettings.json     |Server side authentication |
|_LoginPartial.cshtml |Integrate with Microsoft.Identity.Web |

### Configure your startup file to support Microsoft.Identity.Web

Modify the code in **Startup.cs** to properly initialize the authentication service provided by Microsoft.Identity.Web.

The code in **ConfigureServices** accomplishes several important things:

1. The call to AddMicrosoftWebAppCallsWebApi configures the Microsoft authentication library to acquire access tokens. Next, the call to AddInMemoryTokenCaches configures a token cache that the Microsoft authentication library will use to cache access tokens and refresh tokens behind the scenes. Finally, the call to services.AddScoped(typeof(PowerBiServiceApi)) configures the PowerBiServiceApi class as a service class that can be added to other classes using dependency injection.

1. Open your app's **Startup.cs** file.

2. Add the following code to **Startup.cs**.

    ```csharp
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Authentication;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Builder;
    using Microsoft.AspNetCore.Hosting;
    using Microsoft.AspNetCore.HttpsPolicy;
    using Microsoft.AspNetCore.Mvc.Authorization;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.DependencyInjection;
    using Microsoft.Extensions.Hosting;
    using Microsoft.Identity.Web;
    using Microsoft.Identity.Web.TokenCacheProviders;
    using Microsoft.Identity.Web.TokenCacheProviders.InMemory;
    using Microsoft.Identity.Web.UI;
    using UserOwnsData.Services;
    
    namespace UserOwnsData {
    
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
            var policy = new AuthorizationPolicyBuilder ()
              .RequireAuthenticatedUser ()
              .Build ();
            options.Filters.Add (new AuthorizeFilter (policy));
          });
    
          mvcBuilder.AddMicrosoftIdentityUI ();
    
          services.AddRazorPages ();
    
        }
    
        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure (IApplicationBuilder app, IWebHostEnvironment env) {
          if (env.IsDevelopment ()) {
            app.UseDeveloperExceptionPage ();
          } else {
            app.UseExceptionHandler ("/Home/Error");
            // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
            app.UseHsts ();
          }
          app.UseHttpsRedirection ();
          app.UseStaticFiles ();
    
          app.UseRouting ();
    
          app.UseAuthentication ();
          app.UseAuthorization ();
    
          app.UseEndpoints (endpoints => {
            endpoints.MapControllerRoute (
              name: "default",
              pattern: "{controller=Home}/{action=Index}/{id?}");
            endpoints.MapRazorPages ();
          });
        }
      }
    }
    ```

### Create an appsettings.json server side authentication file

In this tutorial, the server side authentication file contains sensitive information such as *client ID* and *client secret*. For security reasons, it's not recommended to keep this information in the settings file. When embedding in your application, consider a more secure method of keeping this information.

1. In your project, create a new file and call it `appsettings.json`.

2. Add the following code to `appsettings.json`:

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
        "PowerBI": {
            "ServiceTootUrl": "https://api.powerbi.com"
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

3. Fill in the component values obtained from [Step 2 - Get component values](#step-2---get-component-values):

    * **Domain** - If you don't know what's your domain, see [Find the Microsoft Azure AD tenant ID and primary domain name](/partner-center/find-ids-and-domain-names#find-the-microsoft-azure-ad-tenant-id-and-primary-domain-name)
    * **TenantId** - If you don't know what's your tenant ID, see [Find the Microsoft Azure AD tenant ID and primary domain name](/partner-center/find-ids-and-domain-names#find-the-microsoft-azure-ad-tenant-id-and-primary-domain-name)
    * **ClientId** - [Client ID](#client-id)
    * **ClientSecret** - [Client secret](#client-secret)

>[!NOTE]
>In the code snippet above, the `PowerBi:ServiceRootUrl` parameter is added as a custom configuration value to track the base URL to the Power BI service. When you are programming against the Power BI service in the Microsoft public cloud, the URL is https://api.powerbi.com/. However, the root URL for the Power BI service will be different in other clouds such as the government cloud. Therefore, this value is stored as a project configuration value so it is easy to change whenever required.

### Modify the _LoginPartial.cshtml authentication method

Modify the partial razor view file **_LoginPartial.cshtml**, to integrate with Microsoft.Identity.Web.

1. From the **Views** > **Shared** folder, open the **_LoginPartial.cshtml** file.

2. Modify the file so that the **asp-area** value points to the **MicrosoftIdentity** library.

    ```html
    @using System.Security.Principal

    <ul class="navbar-nav">
      @if (User.Identity.IsAuthenticated) {
        <li class="nav-item">
          <span class="navbar-text text-dark">Hello @User.FindFirst("name").Value</span>
        </li>
        <li class="nav-item">
          <a class="nav-link text-dark" asp-area="MicrosoftIdentity" asp-controller="Account" asp-action="SignOut">
              Sign out
          </a>
        </li>
      }
      else {
        <li class="nav-item">
          <a class="nav-link text-dark" asp-area="MicrosoftIdentity" asp-controller="Account" asp-action="SignIn">
              Sign in
          </a>
        </li>
      }
    </ul>
    ```

## Step 4 - Create a client side authentication file

|File                 |Use  |
|---------------------|-----|
|PowerBiServiceApi.cs |Get the Azure AD token |
|     |     |
|     |     |

* **PowerBiServiceApi.cs** - Get the Azure AD token

### Get an Azure AD token

In order to embed Power BI content (such as reports and dashboards), you app needs to get an [Azure AD token](embedded/embed-tokens.md#azure-ad-token). To get the token, you'll need a [configuration object](/javascript/api/overview/powerbi/embed-report#embed-an-existing-report).

The code in this section uses the .NET Core dependency injection pattern. When your class needs to use a service, you can simply add a constructor parameter for that service and the .NET Core runtime takes care of passing the service instance at run time. In this case, the constructor is injecting an instance of the .NET Core configuration service using the `IConfiguration` parameter which is used to retrieve the **PowerBi:ServiceRootUrl** configuration value from **appsettings.json**. The `ITokenAcquisition` parameter which is named **tokenAcquisition** holds a reference to the Microsoft authentication service provided by the Microsoft.Identity.Web library and will be used to acquire access tokens from Azure AD.

The **RequiredScopes** field holds a string array containing a set of [delegated permissions](/azure/active-directory/develop/v2-permissions-and-consent) supported by the Power BI service API. When your application calls across the network to acquire an Azure AD token, it will pass this set of delegated permissions so that Azure AD can include them in the access token it returns.

1. In your app's project, create a new folder titled **Services**.

2. In the **Services** folder, create a new file titled **PowerBiServiceApi.cs**.

3. Add the following code to **PowerBiServiceApi.cs**.

    ```csharp
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.CodeAnalysis;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Identity.Web;
    using Microsoft.PowerBI.Api;
    using Microsoft.PowerBI.Api.Models;
    using Microsoft.Rest;
    using Newtonsoft.Json;
    
    namespace UserOwnsData.Services {
    
        //A view model class to pass the data needed to embed a single report.
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
    
    		public static readonly string[] RequiredScopes = new string[] {
    			"https://analysis.windows.net/powerbi/api/Group.Read.All",
    			"https://analysis.windows.net/powerbi/api/Report.ReadWrite.All",
    			"https://analysis.windows.net/powerbi/api/Dataset.ReadWrite.All",
    			"https://analysis.windows.net/powerbi/api/Content.Create",
    			"https://analysis.windows.net/powerbi/api/Workspace.ReadWrite.All"
    		};
    
    		public string GetAccessToken() {
    			return this.tokenAcquisition.GetAccessTokenForUserAsync(RequiredScopes).Result;
    		}
    
    		public PowerBIClient GetPowerBiClient()	{
    			var tokenCredentials = new TokenCredentials(GetAccessToken(), "Bearer");
    			return new PowerBIClient(new Uri(urlPowerBiServiceApiRoot), tokenCredentials);
    		}
    
    		public async Task<EmbeddedReportViewModel> GetReport(Guid WorkspaceId, Guid ReportId) {
    			
    			PowerBIClient pbiClient = GetPowerBiClient();
    			
    			// call to Power BI Service API to get embedding data
    			var report = await pbiClient.Reports.GetReportInGroupAsync(WorkspaceId, ReportId);
    			
    			// return report embedding data to caller
    			return new EmbeddedReportViewModel {
    				Id = report.Id.ToString(),
    				EmbedUrl = report.EmbedUrl,
    				Name = report.Name,
    				Token = GetAccessToken()
    			};
    		}
    
    	}
    
    }
    ```

## Next steps

> [!div class="nextstepaction"]
>[Embedded analytics application tokens](embed-tokens.md)

> [!div class="nextstepaction"]
>[Move your embedded app to production](move-to-production.md)

> [!div class="nextstepaction"]
>[Capacity and SKUs in Power BI embedded analytics](embedded-capacity.md)

> [!div class="nextstepaction"]
>[Capacity planning in Power BI embedded analytics](embedded-capacity-planning.md)
