---
title: Embed content in your application for your customers
description: Learn how to integrate or embed, a report, dashboard, or tile into an application using the Power BI APIs for embedded analytics for your customers. Learn how to integrate Power BI into your application using embedded analytics software, embedded analytics tools, or embedded business intelligence tools.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: rkarlin
ms.topic: tutorial
ms.service: powerbi
ms.subservice: powerbi-developer
ms.custom: seodec18
ms.date: 06/02/2020
#Customer intent: As an ISV developer, I want to embed a report, dashboard or tile into an application so that my customers can share data.
---

# Tutorial: Embed Power BI content into an application for your customers

**Embedded analytics** and **Power BI Embedded** (the Azure offer) allow you to embed reports, dashboards and tiles, into your application or web app.

In this tutorial you'll learn how to create an *embed for your customers* (also known as *app owns data*) application. Users will not need to sign in to Power BI or have a Power BI license, to use your application. Your application will use one of the following methods to authenticate against Power BI:

* **Master user** account (a Power BI Pro license used for signing in to Power BI)

* [Service principal](embed-service-principal.md)

Use the *embed for your customers* method of embedding Power BI content, if you're an independent software vendor (ISV) or a developer, who wants to create applications for third parties.

## Prerequisites

To get started, you're required to have:

* Your own [Azure Active Directory tenant](create-an-azure-active-directory-tenant.md).

* To authenticate your app against Power BI, you'll need one of the following:

    * [Service principal](embed-service-principal.md) - An Azure Active Directory (Azure AD) [service principal object](azure/active-directory/develop/app-objects-and-service-principals.md#service-principal-object) that allows Azure AD to authenticate your app.

    * [Power BI Pro account](../../admin/service-admin-purchasing-power-bi-pro.md) - This will be your **master user** and your app will use it to sign in to your Power BI Pro account.

>[!NOTE]
>To experiment with embedding, you can use one of these methods:
>* Sign up for a [free *Power BI pro* trial](https://powerbi.microsoft.com/pricing/).
>* Use a Premium Per User (PPU) license. You'll not be able to [move to production](embed-sample-for-customers.md#move-to-production).

## Method

To create an *embed for your customers* sample app, follow these steps:

1. Select your authentication method.

2. Register an Azure AD app.

3. Create a Power BI workspace.

4. Create and publish a Power BI report.

5. Get values needed for embedding

6. Embed your content.

7. Test your application.

>[!TIP]
>You can crete a ready made sample app using the the [embedding setup tool](https://app.powerbi.com/embedsetup). This tool replicates the steps described in this tutorial, and produces a .NET sample app that you can experiment with.

## Step 1 - Select your authentication method

To embed your Power BI content, you'll need to create an Azure AD app, which will authenticate itself against Power BI. Authenticating against Azure AD allows your embedded app to get an Azure AD token, which lists the permissions (also known as scopes) for the Power BI REST APIs.

You're embedded solution will vary depending on the authentication method you select. Therefore, it's important to understand the differences between the authentication methods, and decide which one best suits your solution.

The table below describes a few key differences between the **master user** and [service principal](embed-service-principal.md) authentication methods.

|Consideration  |Service principal  |Master user  |
|---------|---------|---------|
|Mechanism     |Your Azure AD app's [service principal object](/azure/active-directory/develop/app-objects-and-service-principals.md#service-principal-object) allows Azure AD to authenticate your embedded solution app against Power BI.         |Your Azure AD app uses the credentials (username and password) of a Power BI user, to authenticate against Power BI.         |
|Security     |*Service principal* is the Azure AD recommended authorization method. If you're using a *service principal* you can select between using an *application secret* or a *certificate*, as part of the authentication process.</br></br>This tutorial only describes using *service principal* with an *application secret*. To embed using a *service principal* and a *certificate*, refer to the [service principal with a certificate](embed-service-principal-certificate.md) article.         |This authentication method is not considered as secure as using a *service principal*. This is because you have to be vigilant with the *master user* credentials (username and password). For example, you must not expose them in your embedding application, and you should change the password frequently.         |
|License     |Doesn't require a Pro license. You can use content from any workspace that you're a member or an admin of.         |Requires a [Power BI Pro](../../admin/service-admin-purchasing-power-bi-pro.md) license.         |

## Step 2 - Register an Azure AD application

Registering your application with Azure AD allows you to:

* Establish an identity for your app

* Specify your app's [Power BI REST permissions](/azure/active-directory/develop/v2-permissions-and-consent)

* Let your app access the [Power BI REST APIs](/rest/api/power-bi/)

To register your application with Azure AD, follow the instructions in [Register your application](register-app.md).

>[!NOTE]
>Before registering your application, you'll need to decide which authentication method to use, *service principal* or *master user*.

## Step 3 - Create a Power BI workspace

Power BI keeps your reports, dashboards and tiles in a workspace. To embed these items, you'll need to create them or upload them into a workspace.

>[!TIP]
>If you already have a workspace, you can skip this step.

To create a workspace, do the following:

1. Sign in to Power BI.

2. Select **Workspaces**.

3. Select **Create a workspace**.

4. Name your workspace and select **Save**.

## Step 4 - Create and publish a Power BI report

>[!Tip]
>If you already have a workspace with a report, you can skip this step.

Your next step is to create a report and upload it to your workspace. You can [create your own report](powerbi-docs/fundamentals/desktop-getting-started.md#build-reports) using Power BI Desktop, and then [publish](powerbi-docs/fundamentals/desktop-getting-started.md#share-your-work) it to your workspace. Or, you can upload a sample report to your workspace.

To download a sample report and publish it to your workspace, follow these steps:

1. Open the GitHub [Power BI Desktop samples](https://github.com/microsoft/PowerBI-Developer-Samples) folder.

2. Select **Code** and then select **Download zip**.

    :::image type="content" source="media/embed-sample-for-customers/download-sample-report.png" alt-text="A screenshot showing the ZIP download option in the Power B I desktop samples GitHub":::

3. Extract the downloaded zip and navigate to the **Samples Reports** folder.

4. Select a report to embed, and [publish](powerbi-docs/fundamentals/desktop-getting-started.md#share-your-work) it to your workspace.

## Step 5 - Get values needed for embedding

To embed your content you'll need to obtain certain values. The table blow shows the required values, and indicates if they're applicable to the *service principal* authentication method, the *master user* authentication method, or both.

Before you embed your content, make sure you have all the values listed below. Some of the values will differ, depending on the authentication method you're using. 

|Value |Code name   |Service principal   |Master user  |
|-------------------|--------------------|---|---|
|[Application ID](#application-id) |`applicationId`     |![Applies to.](../../media/yes.png) |![Applies to.](../../media/yes.png) |
|[Workspace ID](#workspace-id)     |`workspaceI`        |![Applies to.](../../media/yes.png) |![Applies to.](../../media/yes.png) |
|[Report ID](#report-id)           |`reportId`          |![Applies to.](../../media/yes.png) |![Applies to.](../../media/yes.png) |
|[Application secret](#application-secret) |`applicationsecret` |![Applies to.](../../media/yes.png) |![Does not apply to.](../../media/no.png) |
|[Tenant](#tenant)                 |`tenant`            |![Applies to.](../../media/yes.png) |![Does not apply to.](../../media/no.png) |
|[Power BI username](#power-bi-username-and-password)   |`pbiUsername`       |![Does not apply to.](../../media/no.png) |![Applies to.](../../media/yes.png) |
|[Power BI password](#power-bi-username-and-password)   |`pbiPassword`       |![Does not apply to.](../../media/no.png) |![Applies to.](../../media/yes.png) |

### Application ID

To get the application ID GUID, follow these steps:

1. Log into [Microsoft Azure](https://ms.portal.azure.com/#allservices).

2. Search for **App registrations** and click the **App registrations** link.

3. Select the Azure AD app your using for embedding your Power BI content.

4. From the **Overview** blade, copy the **Application (clent) ID** GUID. 

### Workspace ID

To get the workspace ID GUID, follow these steps:

1. Sign in to Power BI service.

2. Open the report you want to embed.

3. Copy the GUID from the URL. The GUID is the number between **/groups/** and **/reports/**.

    :::image type="content" source="media/embed-sample-for-customers/workspace-id.png" alt-text="A screenshot showing workspace ID GUID in the Power B I service U R L":::

### Report ID

1. Sign in to Power BI service.

2. Open the report you want to embed.

3. Copy the GUID from the URL. The GUID is the number between **/reports/** and **/ReportSection**.

    :::image type="content" source="media/embed-sample-for-customers/report-id.png" alt-text="A screenshot showing report ID GUID in the Power B I service U R L":::

# [Service principal](#tab/service-principal)

### Application secret

To get the application secret, follow these steps:

1. Log into [Microsoft Azure](https://ms.portal.azure.com/#allservices).

2. Search for **App registrations** and click the **App registrations** link.

3. Select the Azure AD app your using for embedding your Power BI content.

4. Under **Mange**, select **Certificates & secrets**.

5. Under **Client secrets**, select **New client secret**.

6. In the **Add a client secret** pop-up window, provide a description for your application secret, select when the application secret expires, and select **Add**.

7. From the **Client secrets** section, copy the string in the **Value** column of the newly created application secret. The client secret value is your *application ID*.

    >[!NOTE]
    >After you navigate to another page in Azure, or sign out and in again, the client secret value will be hidden. Make sure to save the client secret value (also known as the *application ID*), in a secure place. If you lose this value, you'll have to create a new client secret.  

### Tenant

For an Azure AD app to be able to access the Power BI content and APIs, a Power BI admin needs to enable service principal access in the Power BI admin portal. If you're not the admin of your tenant, get the tenant's admin to enable the *Tenant settings* for you.

1. In *Power BI service*, select **Settings** > **Settings** > **Admin portal**.

    :::image type="content" source="media/embed-sample-for-customers/admin-settings.png" alt-text="A screenshot showing the admin settings menu option in the Power B I service settings menu":::

2. Select **Tenant settings** and then scroll down to the **Developer settings** section.

3. Expand **Allow service principals to use Power BI APIs**, and enable this option.

    :::image type="content" source="media/embed-sample-for-customers/developer-settings.png" alt-text="A screenshot showing how to enable the developer settings option, in the tenant settings menu option, in Power B I service":::

>[!NOTE]
>When using a *service principal*, it's recommended to limit their access to the tenant settings using a *security group*. To learn more about this feature, see these sections in the [service principal](embed-service-principal.md) article:
> * [Create an Azure AD security group](embed-service-principal.md#step-2---create-an-azure-ad-security-group)
>* [Enable the Power BI service admin settings](embed-service-principal.md#step-3---enable-the-power-bi-service-admin-settings)

# [Master user](#tab/master-user)

### Power BI username and password

Obtain the *user name* and *password* of the Power BI user you're using as your **master user**. This is the same user you used to create a workspace and upload a report to, in Power BI service. 

--- 

## Step 6 - Embed your content

The Power BI embedded sample application allows you to create an *embed for your customers* Power BI app. You can select a sample application in one of the following languages:

* .NET Framework
* .NET Core
* Java
* Node JS
* Python

Follow these steps to modify the a sample *embed for your customers* application, to embed your Power BI report.  

1. Open the [Power BI developer samples](https://github.com/microsoft/PowerBI-Developer-Samples) folder.

2. Select **Code** and then select **Download zip**.

    :::image type="content" source="media/embed-sample-for-customers/developer-samples.png" alt-text="A screenshot showing the ZIP download option in the Power B I developer samples GitHub":::

3. Extract the downloaded zip and navigate to the **PowerBI-Developer-Samples-master** folder.

4. Depending on the language you want your application to use, open one of these folders:

* .NET Framework
* .NET Core
* Java
* Node JS
* Python
    >[!NOTE]
    >The *embed for your customers* sample applications only support the languages listed above. The *React TS* sample application only supports the *[embed for your organization](embed-sample-for-your-organization.md)* solution.

5. Open the **Embed for your customers** folder.

# [.NET Framework](#tab/net-framework)

6. Using your preferred integrated development environment (IDE), open the **xxx** file.

    >[!NOTE]
    >We recommend using [Visual Studio](https://visualstudio.microsoft.com/) or [Visual Studio Code](https://code.visualstudio.com/).

# [.NET Core](#tab/net-core)

6. Using your preferred integrated development environment (IDE), open the **xxx** file.

    >[!NOTE]
    >We recommend using [Visual Studio](https://visualstudio.microsoft.com/) or [Visual Studio Code](https://code.visualstudio.com/).

# [Python](#tab/python)

6. Using your preferred integrated development environment (IDE), open the **xxx** file.

    >[!NOTE]
    >We recommend using [Visual Studio](https://visualstudio.microsoft.com/) or [Visual Studio Code](https://code.visualstudio.com/).

# [Java](#tab/java)

6. Using your preferred integrated development environment (IDE), open the **xxx** file.

    >[!NOTE]
    >We recommend using [Visual Studio](https://visualstudio.microsoft.com/) or [Visual Studio Code](https://code.visualstudio.com/).

# [Node JS](#tab/node-js)

---





### Run the application

1. Select **Run** in **Visual Studio**.

    ![Run the application](media/embed-sample-for-customers/embed-sample-for-customers-033.png)

2. Then select **Embed Report**. Depending on which content you choose to test with - reports, dashboards or tiles - then select that option in the application.

    ![Select a content](media/embed-sample-for-customers/embed-sample-for-customers-034.png)

3. Now you can view the report in the sample application.

    ![View application](media/embed-sample-for-customers/embed-sample-for-customers-035.png)

## Embed content within your application

Even though the steps to embed your content are done with the [Power BI REST APIs](/rest/api/power-bi/), the example codes described in this article are made with the **.NET SDK**.

Embedding for your customers within your application requires you to get an **access token** for your master account or [service principal](embed-service-principal.md) from **Azure AD**. You're required to get an [Azure AD access token](get-azuread-access-token.md#access-token-for-non-power-bi-users-app-owns-data) for your Power BI application before you make calls to the [Power BI REST APIs](/rest/api/power-bi/).

To create the Power BI Client with your **access token**, you want to create your Power BI client object, which allows you to interact with the [Power BI REST APIs](/rest/api/power-bi/). You create the Power BI client object by wrapping the **AccessToken** with a ***Microsoft.Rest.TokenCredentials*** object.

```csharp
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using Microsoft.Rest;
using Microsoft.PowerBI.Api.V2;

var tokenCredentials = new TokenCredentials(authenticationResult.AccessToken, "Bearer");

// Create a Power BI Client object. it's used to call Power BI APIs.
using (var client = new PowerBIClient(new Uri(ApiUrl), tokenCredentials))
{
    // Your code to embed items.
}
```

### Get the content item you want to embed

You can use the Power BI client object to retrieve a reference to the item you want to embed.

Here is a code sample of how to retrieve the first report from a given workspace.

*A sample of getting a content item whether it's a report, dashboard, or tile that you want to embed is available within the Services\EmbedService.cs file in the [sample application](https://github.com/Microsoft/PowerBI-Developer-Samples).*

```csharp
using Microsoft.PowerBI.Api.V2;
using Microsoft.PowerBI.Api.V2.Models;

// You need to provide the workspaceId where the dashboard resides.
ODataResponseListReport reports = await client.Reports.GetReportsInGroupAsync(workspaceId);

// Get the first report in the group.
Report report = reports.Value.FirstOrDefault();
```

### Create the embed token
Generate an embed token, which can be used from the JavaScript API. There are two types of APIs, the first group contains five APIs, each generates an embed token for a specific item. The second group, which contains only one API, generates a token that can be used to embed multiple items.

**APIs for generating an embed token for a specific item**

The embed token created with these APIs is specific to the item you're embedding. Any time you embed a Power BI item (such as a report, dashboard, or tile) with these APIs, you need to create a new embed token for it.
* [Dashboards GenerateTokenInGroup](/rest/api/power-bi/embedtoken/dashboards_generatetokeningroup)
* [Datasets GenerateTokenInGroup](/rest/api/power-bi/embedtoken/datasets_generatetokeningroup)
* [Reports GenerateTokenForCreateInGroup](/rest/api/power-bi/embedtoken/reports_generatetokenforcreateingroup)
* [Reports GenerateTokenInGroup](/rest/api/power-bi/embedtoken/reports_generatetokeningroup)
* [Tiles GenerateTokenInGroup](/rest/api/power-bi/embedtoken/tiles_generatetokeningroup)

Samples of creating an embed token for a report, dashboard, or tile, are available from the following files in the [sample application](https://github.com/Microsoft/PowerBI-Developer-Samples).
* Services\EmbedService.cs
* Models\EmbedConfig.cs
* Models\TileEmbedConfig.cs

Below is a code example for using the reports GenerateTokenInGroup embed token API.
```csharp
using Microsoft.PowerBI.Api.V2;
using Microsoft.PowerBI.Api.V2.Models;

// Generate Embed Token.
var generateTokenRequestParameters = new GenerateTokenRequest(accessLevel: "view");
EmbedToken tokenResponse = client.Reports.GenerateTokenInGroup(workspaceId, report.Id, generateTokenRequestParameters);

// Generate Embed Configuration.
var embedConfig = new EmbedConfig()
{
    EmbedToken = tokenResponse,
    EmbedUrl = report.EmbedUrl,
    Id = report.Id
};
```

**API for generating an embed token for multiple items**<a id="multiEmbedToken"></a>

The [Generate Token](/rest/api/power-bi/embedtoken/generatetoken) embed API generates a token that can be used for embedding multiple items.

It can also be used for dynamically selecting a dataset while embedding a report. For more information about this use of the API, see [dynamic binding](embed-dynamic-binding.md).


Below is an example of using this API.
 
```csharp
using Microsoft.PowerBI.Api.V2;
using Microsoft.PowerBI.Api.V2.Models;

var reports = new List<GenerateTokenRequestV2Report>()
{ 
    new GenerateTokenRequestV2Report()
    {
        AllowEdit = false,
        Id = report1.Id
    },
    new GenerateTokenRequestV2Report()
    {
        AllowEdit = true,
        Id = report2.Id
    }
};

var datasets= new List<GenerateTokenRequestV2Dataset>()
{
    new GenerateTokenRequestV2Dataset(dataset1.Id),
    new GenerateTokenRequestV2Dataset(dataset2.Id),
    new GenerateTokenRequestV2Dataset(dataset3.Id),
};

var targetWorkspaces = new List<GenerateTokenRequestV2TargetWorkspace>()
{
    new GenerateTokenRequestV2TargetWorkspace(workspace1.Id),
    new GenerateTokenRequestV2TargetWorkspace(workspace2.Id),
};

var request = new GenerateTokenRequestV2()
{
    Datasets = datasets,
    Reports = reports,
    TargetWorkspaces = targetWorkspaces,
};

var token = client.GetClient().EmbedToken.GenerateToken(request);
```

### Load an item using JavaScript

You can use JavaScript to load a report into a div element on your web page.

For a full sample of using the JavaScript API, you can use the [Playground tool](https://microsoft.github.io/PowerBI-JavaScript/demo). The Playground tool is a quick way to play with different types of Power BI Embedded samples. You can also get more Information about the JavaScript API by visiting the [PowerBI-JavaScript wiki](https://github.com/Microsoft/powerbi-javascript/wiki) page.

Here is a sample that uses an **EmbedConfig** model and a **TileEmbedConfig** model along with views for a report.

*A sample of adding a view for a report, dashboard, or tile is available within the Views\Home\EmbedReport.cshtml, Views\Home\EmbedDashboard.cshtml, or Views\Home\Embedtile.cshtml files in the [sample application](#embed-content-using-the-sample-application).*

```javascript
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

    // Embed configuration used to describe what and how to embed.
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

## Move to production

Now that you've completed developing your application, it's time to back your workspace with a capacity.

> [!Important]
> A capacity is required to move to production. All workspaces (the ones containing the reports or dashboards, and the ones containing the datasets) must be assigned to a capacity.

### Create a capacity

By creating a capacity, you can take advantage of having a resource for your customer. There are two types of capacity you can choose from:
* **Power BI Premium** - A tenant-level Office 356 subscription available in two SKU families, *EM* and *P*. When embedding Power BI content, this solution is referred to as *Power BI embedding*. For more information regarding this subscription, see [What is Power BI Premium?](../../admin/service-premium-what-is.md)
* **Azure Power BI Embedded** - You can purchase a capacity from the [Microsoft Azure portal](https://portal.azure.com). This subscription uses the *A* SKUs. For details on how to create a Power BI Embedded capacity, see [Create Power BI Embedded capacity in the Azure portal](azure-pbie-create-capacity.md).
> [!NOTE]
> With A SKUs, you can't access Power BI content with a FREE Power BI license.

The table below describes the resources and limits of each SKU. To determine which capacity best fits your needs, see the [which SKU should I purchase for my scenario](./embedded-faq.md#which-solution-should-i-choose) table.

| Capacity Nodes | Total v-cores | Backend v-cores | RAM (GB) | Frontend v-cores | DirectQuery/Live Connection (per sec) | Model Refresh Parallelism |
| --- | --- | --- | --- | --- | --- | --- |
| EM1/A1 | 1 | 0.5 | 2.5 | 0.5 | 3.75 | 1 |
| EM2/A2 | 2 | 1 | 5 | 1 | 7.5 | 2 |
| EM3/A3 | 4 | 2 | 10 | 2 | 15 | 3 |
| P1/A4 | 8 | 4 | 25 | 4 | 30 | 6 |
| P2/A5 | 16 | 8 | 50 | 8 | 60 | 12 |
| P3/A6 | 32 | 16 | 100 | 16 | 120 | 24 |
| | | | | | | |

### Development testing

For development testing, you can use embed trial tokens with a Pro license. To embed in a production environment, use a capacity.

The number of embed trial tokens a Power BI service principal or master account can generate is limited. Use the [Available Features](/rest/api/power-bi/availablefeatures/getavailablefeatures) API to check the percentage of your current embedded usage. The usage amount is displayed per service principal or master account.

If you run out of embed tokens while testing, you need to purchase a Power BI Embedded or Premium [capacity](embedded-capacity.md). There's no limit to the number of embed tokens you can generate with a capacity.


### Assign a workspace to a capacity

Once you create a capacity, you can assign your workspace to that capacity.

All the workspaces that contain Power BI resources related to the embedded content (including datasets, reports, and dashboards), must be assigned to capacities. For example, if an embedded report and the dataset bound to it reside in different workspaces, both workspaces must be assigned to capacities.

To assign a capacity to a workspace using [service principal](embed-service-principal.md), use the [Power BI REST API](/rest/api/power-bi/capacities/groups_assigntocapacity). When you are using the Power BI REST APIs, make sure to use the [service principal object ID](embed-service-principal.md).

Follow the steps below to assign a capacity to a workspace using a **master account**.

1. Within the **Power BI service**, expand workspaces and select the ellipsis for the workspace you're using for embedding your content. Then select **Edit workspaces**.

    ![Edit Workspace](media/embed-sample-for-customers/embed-sample-for-customers-036.png)

2. Expand **Advanced**, then enable **Capacity**, then select the capacity you created. Then select **Save**.

    ![Assign capacity](media/embed-sample-for-customers/embed-sample-for-customers-024.png)

3. After you select **Save**, you should see a **diamond** next to the workspace name.

    ![workspace tied to a capacity](media/embed-sample-for-customers/embed-sample-for-customers-037.png)

## Next steps

In this tutorial, you've learned how to embed Power BI content into an application for your customers. You can also try to embed Power BI content for your organization.

> [!div class="nextstepaction"]
>[Embed for your organization](embed-sample-for-your-organization.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)