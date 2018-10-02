---
title: Embed Power BI content into an application for your customers for sovereign clouds
description: Learn how to integrate, or embed, a dashboard, tile or report, into a web app using the Power BI APIs for your customers.
author: markingmyname
ms.author: maghan
manager: kfile
ms.service: powerbi
ms.component: powerbi-service
ms.topic: tutorial
ms.date: 07/26/2018
---

# Tutorial: Embed a Power BI dashboard, tile, or report into your application for sovereign clouds
Learn how to integrate, or embed, a dashboard, tile or report, into a web app using the Power BI .NET SDK along with the Power BI JavaScript API when embedding for your customers. This is typically an ISV scenario.

Power BI also supports sovereign (private) clouds.

The different sovereign clouds are:

* U.S. Government Community Cloud (GCC)

* U. S. Military Contractors (DoDCON)

* U. S. Military (DoD)

* Power BI for Germany cloud

* Power BI for China cloud

![Embedded dashboard](media/embed-sample-for-customers/powerbi-embed-dashboard.png)

To get started with this walkthrough, you need a **Power BI account**. If you don't have an account set up, then depending on the type of sovereign cloud, you can sign up for a [U. S. government Power BI account](../service-govus-signup.md), a [Power BI for Germany cloud account](https://powerbi.microsoft.com/power-bi-germany/?ru=https%3A%2F%2Fapp.powerbi.de%2F%3FnoSignUpCheck%3D1) or a [Power BI for China cloud account](http://www.21vbluecloud.com/powerbi/).

> [!NOTE]
> Looking to embed a dashboard for your organization instead? See, [Integrate a dashboard into an app for your organization](integrate-dashboard.md).
>

To integrate a dashboard into a web app, you use the **Power BI** API, and an Azure Active Directory (AD) authorization **access token** to get a dashboard. Then, you load the dashboard using an embed token. The **Power BI** API provides programmatic access to specific **Power BI** resources. For more information, see [Power BI REST API](https://docs.microsoft.com/rest/api/power-bi/), [Power BI .NET SDK](https://github.com/Microsoft/PowerBI-CSharp) and the [Power BI JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript).

## Download the sample
This article shows the code used in the [Embedding for your customer sample](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/App%20Owns%20Data/PowerBIEmbedded_AppOwnsData) on GitHub. To follow along with this walkthrough, you can download the sample.

* Government Community Cloud (GCC):
    1. Overwrite Cloud.config file with GCCCloud.config content.
	2. Update clientid (Native app client id), groupid, the user (your master user) and password in Web.config file.
	3. Add the GCC parameters in the web.config file as follows.

```xml
<add key="authorityUrl" value="https://login.windows.net/common/oauth2/authorize/" />
<add key="resourceUrl" value="https://analysis.usgovcloudapi.net/powerbi/api" />
<add key="apiUrl" value="https://api.powerbigov.us/" />
<add key="embedUrlBase" value="https://app.powerbigov.us" />
```

* Military Contractors (DoDCON):
    1. Overwrite Cloud.config file with TBCloud.config content.
	2. Update clientid (Native app client id), groupid, the user (your master user) and password in Web.config file.
	3. Add the DoDCON parameters in the web.config file as follows.

```xml
<add key="authorityUrl" value="https://login.windows.net/common/oauth2/authorize/" />
<add key="resourceUrl" value="https://high.analysis.usgovcloudapi.net/powerbi/api" />
<add key="apiUrl" value="https://api.high.powerbigov.us/" />
<add key="embedUrlBase" value="https://app.high.powerbigov.us" />
```

* Military (DoD):
    1. Overwrite Cloud.config file with PFCloud.config content.
	2. Update clientid (Native app client id), groupid, the user (your master user) and password in Web.config file.
	3. Add the DoDCON parameters in the web.config file as follows.

```xml
<add key="authorityUrl" value="https://login.windows.net/common/oauth2/authorize/" />
<add key="resourceUrl" value="https://mil.analysis.usgovcloudapi.net/powerbi/api" />
<add key="apiUrl" value="https://api.mil.powerbigov.us/" />
<add key="embedUrlBase" value="https://app.mil.powerbigov.us" />
```

* Power BI for Germany cloud parameters
	1. Overwrite Cloud.config file with Power BI for Germany cloud content.
	2. Update clientid (Native app client id), groupid, the user (your master user) and password in Web.config file.
    3. Add the Power BI for Germany cloud parameters in the web.config file as follows.

```xml
<add key="authorityUrl" value=https://login.microsoftonline.de/common/oauth2/authorize/" />
<add key="resourceUrl" value="https://analysis.cloudapi.de/powerbi/api" />
<add key="apiUrl" value="https://api.powerbi.de/" />
<add key="embedUrlBase" value="https://app.powerbi.de" />
```

* Power BI for China cloud parameters
	1. Overwrite Cloud.config file with [Power BI for China](https://github.com/Microsoft/PowerBI-Developer-Samples/blob/master/App%20Owns%20Data/PowerBIEmbedded_AppOwnsData/CloudConfigs/Power%20BI%20operated%20by%2021Vianet%20in%20China/Cloud.config) cloud content.
	2. Update clientid (Native app client id), groupid, the user (your master user) and password in Web.config file.
    3. Add the Power BI for China cloud parameters in the web.config file as follows.

```xml
<add key="authorityUrl" value=https://login.chinacloudapi.cn/common/oauth2/authorize/" />
<add key="resourceUrl" value="https://analysis.chinacloudapi.cn/powerbi/api" />
<add key="apiUrl" value="https://api.powerbi.cn/" />
<add key="embedUrlBase" value="https://app.powerbi.cn" />
```

## Step 1 - register an app in Azure AD
You must register your application with Azure AD to make REST API calls. For more information, see [Register an Azure AD app to embed Power BI content](register-app.md). Since there are different sovereign cloud affiliations, there are distinct URLs to register your application.

* Government Community Cloud (GCC) - https://app.powerbigov.us/apps 

* Military Contractors (DoDCON) - https://app.high.powerbigov.us/apps 

* Military (DoD) - https://app.mil.powerbigov.us/apps

* Power BI for Germany cloud - https://app.powerbi.de/apps

* Power BI for China cloud - https://app.powerbi.cn/apps

If you downloaded the [Embedding for your customer sample](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/App%20Owns%20Data), you would use the **Client ID** you get, after registration, so that the sample can authenticate to Azure AD. To configure the sample, change the **clientId** in the *web.config* file.


## Step 2 - get an access token from Azure AD
Within your application, you need to get an **access token**, from Azure AD, before you can make calls to the Power BI REST API. For more information, see [Authenticate users and get an Azure AD access token for your Power BI app](get-azuread-access-token.md). Since there are different sovereign cloud affiliations, there are distinct URLs to get an access token for your application.

* Government Community Cloud (GCC) - https://login.microsoftonline.com

* Military Contractors (DoDCON) - http://login.microsoftonline.us

* Military (DoD) - https://login.microsoftonline.us

* Power BI for Germany cloud - https://login.microsoftonline.de

* Power BI for China cloud - https://login.microsoftonline.cn

You can see examples of this within each content item task in **Controllers\HomeController.cs**.

## Step 3 - get a content item
To embed your Power BI content, you need to do a couple of things to make sure it embeds correctly. While all of these steps can be done with the REST API directly, the sample application and the examples here use the .NET SDK.

### Create the Power BI Client with your access token
With your access token, you want to create your Power BI client object which allows you to interact with the Power BI APIs. This is done by wrapping the AccessToken with a *Microsoft.Rest.TokenCredentials* object.

```csharp
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using Microsoft.Rest;
using Microsoft.PowerBI.Api.V2;

var tokenCredentials = new TokenCredentials(authenticationResult.AccessToken, "Bearer");

// Create a Power BI Client object. This is used to call the Power BI APIs.
using (var client = new PowerBIClient(new Uri(ApiUrl), tokenCredentials))
{
    // Your code to embed items.
}
```

### Get the content item you want to embed
Use the Power BI client object to retrieve a reference to the item you want to embed. You can embed dashboards, tiles or reports. Here is an example of how to retrieve the first dashboard, tile or report from a given workspace.

A sample of this is available within **Controllers\HomeController.cs** of the [App Owns Data sample](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/App%20Owns%20Data).

**Dashboards**

```csharp
using Microsoft.PowerBI.Api.V2;
using Microsoft.PowerBI.Api.V2.Models;

// You need to provide the GroupID where the dashboard resides.
ODataResponseListDashboard dashboards = client.Dashboards.GetDashboardsInGroup(GroupId);

// Get the first report in the group.
Dashboard dashboard = dashboards.Value.FirstOrDefault();
```

**Tile**

```csharp
using Microsoft.PowerBI.Api.V2;
using Microsoft.PowerBI.Api.V2.Models;

// To retrieve the tile, you first need to retrieve the dashboard.

// You need to provide the GroupID where the dashboard resides.
ODataResponseListDashboard dashboards = client.Dashboards.GetDashboardsInGroup(GroupId);

// Get the first report in the group.
Dashboard dashboard = dashboards.Value.FirstOrDefault();

// Get a list of tiles from a specific dashboard
ODataResponseListTile tiles = client.Dashboards.GetTilesInGroup(GroupId, dashboard.Id);

// Get the first tile in the group.
Tile tile = tiles.Value.FirstOrDefault();
```

**Report**

```csharp
using Microsoft.PowerBI.Api.V2;
using Microsoft.PowerBI.Api.V2.Models;

// You need to provide the GroupID where the dashboard resides.
ODataResponseListReport reports = client.Reports.GetReportsInGroupAsync(GroupId);

// Get the first report in the group.
Report report = reports.Value.FirstOrDefault();
```

### Create the embed token
An embed token needs to be generated which can be used from the JavaScript API. The embed token is specific to the item you are embedding. This means that any time you embed a piece of Power BI content, you need to create a new embed token for it. For more information, including which **accessLevel** to use, see [Embed Token](https://docs.microsoft.com/rest/api/power-bi/embedtoken).

> [!IMPORTANT]
> Because embed tokens are intended for developer testing only, the number of embed tokens a Power BI master account can generate is limited. A [capacity must be purchased](https://docs.microsoft.com/power-bi/developer/embedded-faq#technical) for production embedding scenarios. There is no limit to embed token generation when a capacity is purchased.

A sample of this is available within **Controllers\HomeController.cs** of the [Embedding for your organization sample](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/App%20Owns%20Data).

This assumes a class is created for **EmbedConfig** and **TileEmbedConfig**. A sample of these are available within **Models\EmbedConfig.cs** and **Models\TileEmbedConfig.cs**.

**Dashboard**

```csharp
using Microsoft.PowerBI.Api.V2;
using Microsoft.PowerBI.Api.V2.Models;

// Generate Embed Token.
var generateTokenRequestParameters = new GenerateTokenRequest(accessLevel: "view");
EmbedToken tokenResponse = client.Dashboards.GenerateTokenInGroup(GroupId, dashboard.Id, generateTokenRequestParameters);

// Generate Embed Configuration.
var embedConfig = new EmbedConfig()
{
    EmbedToken = tokenResponse,
    EmbedUrl = dashboard.EmbedUrl,
    Id = dashboard.Id
};
```

**Tile**

```csharp
using Microsoft.PowerBI.Api.V2;
using Microsoft.PowerBI.Api.V2.Models;

// Generate Embed Token for a tile.
var generateTokenRequestParameters = new GenerateTokenRequest(accessLevel: "view");
EmbedToken tokenResponse = client.Tiles.GenerateTokenInGroup(GroupId, dashboard.Id, tile.Id, generateTokenRequestParameters);

// Generate Embed Configuration.
var embedConfig = new TileEmbedConfig()
{
    EmbedToken = tokenResponse,
    EmbedUrl = tile.EmbedUrl,
    Id = tile.Id,
    dashboardId = dashboard.Id
};
```

**Report**

```csharp
using Microsoft.PowerBI.Api.V2;
using Microsoft.PowerBI.Api.V2.Models;

// Generate Embed Token.
var generateTokenRequestParameters = new GenerateTokenRequest(accessLevel: "view");
EmbedToken tokenResponse = client.Reports.GenerateTokenInGroup(GroupId, report.Id, generateTokenRequestParameters);

// Generate Embed Configuration.
var embedConfig = new EmbedConfig()
{
    EmbedToken = tokenResponse,
    EmbedUrl = report.EmbedUrl,
    Id = report.Id
};
```
## Step 4 - load an item using JavaScript
You can use JavaScript to load a dashboard into a div element on your web page. The sample uses an EmbedConfig/TileEmbedConfig model along with views for a dashboard, tile or report. For a full sample of using the JavaScript API, you can use the [Microsoft Power BI Embedded Sample](https://microsoft.github.io/PowerBI-JavaScript/demo).

An application sample of this is available within the [Embedding for your organization sample](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/App%20Owns%20Data).

**Views\Home\EmbedDashboard.cshtml**

```csharp
<script src="~/scripts/powerbi.js"></script>
<div id="dashboardContainer"></div>
<script>
    // Read embed application token from Model
    var accessToken = "@Model.EmbedToken.Token";

    // Read embed URL from Model
    var embedUrl = "@Html.Raw(Model.EmbedUrl)";

    // Read dashboard Id from Model
    var embedDashboardId = "@Model.Id";

    // Get models. models contains enums that can be used.
    var models = window['powerbi-client'].models;

    // Embed configuration used to describe the what and how to embed.
    // This object is used when calling powerbi.embed.
    // This also includes settings and options such as filters.
    // You can find more information at https://github.com/Microsoft/PowerBI-JavaScript/wiki/Embed-Configuration-Details.
    var config = {
        type: 'dashboard',
        tokenType: models.TokenType.Embed,
        accessToken: accessToken,
        embedUrl: embedUrl,
        id: embedDashboardId
    };

    // Get a reference to the embedded dashboard HTML element
    var dashboardContainer = $('#dashboardContainer')[0];

    // Embed the dashboard and display it within the div container.
    var dashboard = powerbi.embed(dashboardContainer, config);
</script>
```

**Views\Home\EmbedTile.cshtml**

```csharp
<script src="~/scripts/powerbi.js"></script>
<div id="tileContainer"></div>
<script>
    // Read embed application token from Model
    var accessToken = "@Model.EmbedToken.Token";

    // Read embed URL from Model
    var embedUrl = "@Html.Raw(Model.EmbedUrl)";

    // Read tile Id from Model
    var embedTileId = "@Model.Id";

    // Read dashboard Id from Model
    var embedDashboardeId = "@Model.dashboardId";

    // Get models. models contains enums that can be used.
    var models = window['powerbi-client'].models;

    // Embed configuration used to describe the what and how to embed.
    // This object is used when calling powerbi.embed.
    // This also includes settings and options such as filters.
    // You can find more information at https://github.com/Microsoft/PowerBI-JavaScript/wiki/Embed-Configuration-Details.
    var config = {
        type: 'tile',
        tokenType: models.TokenType.Embed,
        accessToken: accessToken,
        embedUrl: embedUrl,
        id: embedTileId,
        dashboardId: embedDashboardeId
    };

    // Get a reference to the embedded tile HTML element
    var tileContainer = $('#tileContainer')[0];

    // Embed the tile and display it within the div container.
    var tile = powerbi.embed(tileContainer, config);
</script>
```

**Views\Home\EmbedReport.cshtml**

```csharp
<script src="~/scripts/powerbi.js"></script>
<div id="reportContainer"></div>
<script>
    // Read embed application token from Model
    var accessToken = "@Model.EmbedToken.Token";

    // Read embed URL from Model
    var embedUrl = "@Html.Raw(Model.EmbedUrl)";

    // Read report Id from Model
    var embedReportId = "@Model.Id";

    // Get models. models contains enums that can be used.
    var models = window['powerbi-client'].models;

    // Embed configuration used to describe the what and how to embed.
    // This object is used when calling powerbi.embed.
    // This also includes settings and options such as filters.
    // You can find more information at https://github.com/Microsoft/PowerBI-JavaScript/wiki/Embed-Configuration-Details.
    var config = {
        type: 'report',
        tokenType: models.TokenType.Embed,
        accessToken: accessToken,
        embedUrl: embedUrl,
        id: embedReportId,
        permissions: models.Permissions.All,
        settings: {
            filterPaneEnabled: true,
            navContentPaneEnabled: true
        }
    };

    // Get a reference to the embedded report HTML element
    var reportContainer = $('#reportContainer')[0];

    // Embed the report and display it within the div container.
    var report = powerbi.embed(reportContainer, config);
</script>
```

## Next steps

* A sample application is available on GitHub for you to review. The above examples are based on that sample. For more information, see [Embedding for your organization sample](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/App%20Owns%20Data).
* For more information about JavaScript API, please reference [Power BI JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript).
* For more information about for Power BI for Germany cloud, please reference [Power BI for Germany cloud FAQ](https://docs.microsoft.com/power-bi/service-govde-faq)
* [How to migrate Power BI Workspace Collection Workspace Collection content to Power BI](migrate-from-powerbi-embedded.md)

Limitations and Considerations
* GCC accounts only support P and EM capacities now

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

