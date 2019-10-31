---
title: Embedded analytics to embed Power BI paginated reports in your application for your customers
description: Learn how to integrate or embed, a Power BI paginated report into an application using the Power BI APIs for embedded analytics for your customers. Learn how to integrate Power BI into your application using embedded analytics software, embedded analytics tools, or embedded business intelligence tools.
author: KesemSharabi
ms.author: kesharab
manager: rkarlin
ms.reviewer: rkarlin
ms.topic: tutorial
ms.service: powerbi
ms.subservice: powerbi-developer
ms.custom: seodec18
ms.date: 04/02/2019
#Customer intent: As an ISV developer, I want to embed a Power BI paginated report into an application so that my customers can share data.
---

# Embed Power BI paginated reports into an application for your customers

With **Power BI Embedded in Azure** or **Power BI embedding in Office**, you can embed reports, dashboards, or tiles into an application using app owns data. **App owns data** is about having an application that uses Power BI as its embedded analytics platform. As an **ISV** or a **developer**, you can create Power BI content that displays reports, dashboards, or tiles in an application that is fully integrated and interactive, without requiring users to have a Power BI license. This tutorial demonstrates how to integrate a report into an application using the Power BI .NET SDK with the Power BI JavaScript API.

![Power BI Embed Report](media/embed-paginated-reports-for-customers/embedded-paginated-report.png)

In this tutorial, you learn how to:
> [!div class="checklist"]
> * Register an application in Azure.
> * Embed a Power BI paginated report into an application.

## Prerequisites

To get started, you're required to have:

* A [service principal (app-only token)](embed-service-principal.md)
* A [Microsoft Azure](https://azure.microsoft.com/) subscription
* Your own [Azure Active Directory tenant](create-an-azure-active-directory-tenant.md) setup
* At least an A4 [capacity](#create-a-dedicated-capacity) with paginated report workload enabled

If you don’t have an Azure subscription, create a [free account](https://azure.microsoft.com/free/?WT.mc_id=A261C142F) before you begin.

## Set up your Power BI environment

### Create an app workspace

As you're using a [service principal](embed-service-principal.md) to sign into your application, you're required to you use the [new workspaces](../service-create-the-new-workspaces.md). As a *service principal*, you must also be an admin or member of the app workspaces involved with your application.

### Create and upload your paginated reports

You can create your paginated report using [Power BI Report Builder](../paginated-reports-report-builder-power-bi.md#create-reports-in-power-bi-report-builder), and then [upload the report to the service](../paginated-reports-quickstart-aw.md#upload-the-report-to-the-service).

If you're using service principal, you can import paginated reports into the new workspaces using the [Power BI REST APIs](https://docs.microsoft.com/rest/api/power-bi/imports/postimportingroup).

## Embed content using the sample application

This sample is deliberately kept simple for demonstration purposes. It's up to the you or your developers to protect the application secret.

Follow the steps below to start embedding your content using the sample application.

1. Download [Visual Studio](https://www.visualstudio.com/) (version 2013 or later). Make sure to download the latest [NuGet package](https://www.nuget.org/profiles/powerbi).

2. Download the [App Owns Data sample](https://github.com/Microsoft/PowerBI-Developer-Samples) from GitHub to get started.

    ![App Owns Data application sample](media/embed-sample-for-customers/embed-sample-for-customers-026.png)

3. Open the **Web.config** file in the sample application. There are fields you need to fill in to run the application. Choose **ServicePrincipal** for the **AuthenticationType**.

    Fill in the following fields:
    * [applicationId](#application-id)
    * [workspaceId](#workspace-id)
    * [reportId](#report-id)
    * [applicationsecret](#application-secret)
    * [tenant](#tenant)

    > [!Note]
    > The default **AuthenticationType** in this sample is MasterUser. Make sure you change it to **ServicePrincipal**. 


   </center>

    ![Web Config file](media/embed-sample-for-customers/embed-sample-for-customers-030.png)

### Application ID

Fill in the **applicationId** information with the **Application ID** from **Azure**. The **applicationId** is used by the application to identify itself to the users from which you're requesting permissions.

To get the **applicationId**, follow these steps:

1. Sign into the [Azure portal](https://portal.azure.com).

2. In the left-hand navigation pane, select **All Services**, and select **App Registrations**.

    ![App registration search](media/embed-sample-for-customers/embed-sample-for-customers-003.png)

3. Select the application that needs the **applicationId**.

    ![Choosing App](media/embed-sample-for-customers/embed-sample-for-customers-006.png)

4. There's an **Application ID** that is listed as a GUID. Use this **Application ID** as the **applicationId** for the application.

    ![applicationId](media/embed-sample-for-customers/embed-sample-for-customers-007.png)

### Workspace ID

Fill in the **workspaceId** information with the app workspace (group) GUID from Power BI. You can get this information either from the URL when signed into the Power BI service or using Powershell.

URL <br>

![workspaceId](media/embed-paginated-reports-for-customers/groups-red-url.png)

Powershell <br>

```powershell
Get-PowerBIworkspace -name "App Owns Paginated Report Embed"
```

   ![workspaceId from powershell](media/embed-paginated-reports-for-customers/powershell.png)

### Report ID

Fill in the **reportId** information with the report GUID from Power BI. You can get this information either from the URL when signed into the Power BI service or using Powershell.

URL<br>

![reportId](media/embed-paginated-reports-for-customers/rdl-report-url.png)

Powershell <br>

```powershell
Get-PowerBIworkspace -name "App Owns Paginated Report Embed" | Get-PowerBIReport
```

![reportId from powershell](media/embed-paginated-reports-for-customers/powershell-report-id.png)

### Application secret

Fill in the **ApplicationSecret** information from the **Keys** section of your **App registrations** section in **Azure**.

To get the **ApplicationSecret**, follow these steps:

1. Sign in to the [Azure portal](https://portal.azure.com).

2. In the left-hand navigation pane, select **All services** and then select **App registrations**.

    ![App registration search](media/embed-sample-for-customers/embed-sample-for-customers-003.png)

3. Select the application that needs to use the **ApplicationSecret**.

    ![Choose an app](media/embed-sample-for-customers/embed-sample-for-customers-0038.png)

4. Select **Certificates and secrets** under **Manage**.

5. Select **New client secrets**.

6. Enter a name in the **Description** box and select a duration. Then select **Save** to get the **Value** for your application. When you close the **Keys** pane after saving the key value, the value field shows only as hidden. At that point, you aren't able to retrieve the key value. If you lose the key value, create a new one in the Azure portal.

    ![Key value](media/embed-sample-for-customers/embed-sample-for-customers-042.png)

### Tenant

Fill in the **tenant** information with your azure tenant ID. You can get this information from the [Azure AD admin center](/onedrive/find-your-office-365-tenant-id) when signed into the Power BI service or by using Powershell.

### Run the application

1. Select **Run** in **Visual Studio**.

    ![Run the application](media/embed-sample-for-customers/embed-sample-for-customers-033.png)

2. Then select **Embed Report**.

    ![Select a content](media/embed-sample-for-customers/embed-sample-for-customers-034.png)

3. Now you can view the report in the sample application.

    ![View application](media/embed-paginated-reports-for-customers/embedded-paginated-report.png)

## Embed Power BI paginated reports within your application

Even though the steps to embed your Power BI paginated reports are done with the [Power BI REST APIs](https://docs.microsoft.com/rest/api/power-bi/), the example codes described in this article are made with the **.NET SDK**.

Embedding Power BI paginated reports for your customers within your application, requires you to have an **Azure AD** [service principal](embed-service-principal.md) and get an [Azure AD access token](get-azuread-access-token.md#access-token-for-non-power-bi-users-app-owns-data) for your Power BI application, before you make calls to the [Power BI REST APIs](https://docs.microsoft.com/rest/api/power-bi/).

To create the Power BI Client with your **access token**, create a Power BI client object, which allows you to interact with the [Power BI REST APIs](https://docs.microsoft.com/rest/api/power-bi/). You create the Power BI client object by wrapping the **AccessToken** with a ***Microsoft.Rest.TokenCredentials*** object.

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

### Get the paginated report you want to embed

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

Generate an embed token, which can be used from the JavaScript API. To create an embedded token for embedding Power BI paginated reports, use the [Reports GenerateTokenForCreateInGroup](https://docs.microsoft.com/rest/api/power-bi/embedtoken/reports_generatetokenforcreateingroup) API.

A sample of creating an embed token for a report, dashboard, or tile want to embed is available within the *Services\EmbedService.cs* file in the [sample application](https://github.com/Microsoft/PowerBI-Developer-Samples).

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

### Load an item using JavaScript

You can use JavaScript to load a paginated report into a div element on your web page.

For a full sample of using the JavaScript API, you can use the [Playground tool](https://microsoft.github.io/PowerBI-JavaScript/demo). The Playground tool is a quick way to play with different types of Power BI Embedded samples. You can also get more Information about the JavaScript API by visiting the [PowerBI-JavaScript wiki](https://github.com/Microsoft/powerbi-javascript/wiki) page.

Here is a sample that uses an **EmbedConfig**  for a paginated report.

*A sample of adding a paginated report is available in the Views\Home\EmbedReport.cshtml file, in the  [sample application](#embed-content-using-the-sample-application).*

```javascript
<script src="~/scripts/powerbi.js"></script>
<div id="reportContainer"></div>
<script>
    // Read embed application token from textbox
    var txtAccessToken = $('#txtAccessToken').val();

    // Read embed URL from textbox
    var txtEmbedUrl = $('#txtReportEmbed').val();

    // Read paginated report Id from textbox
    var txtEmbedReportId = $('#txtEmbedReportId').val();

    // Read embed type from radio
    var tokenType = $('input:radio[name=tokenType]:checked').val();

    // Get models. models contains enums that can be used.
    var models = window['powerbi-client'].models;

    // View permissions.
    var permissions = models.Permissions.View;

    // Embed configuration used to describe what and how to embed.
    // This object is used when calling powerbi.embed.
    // This also includes settings and options such as filters.
    // You can find more information at https://github.com/Microsoft/PowerBI-JavaScript/wiki/Embed-Configuration-Details
    var config = {
            type: 'report',
            tokenType: tokenType == '0' ? models.TokenType.Aad : models.TokenType.Embed,
            accessToken: txtAccessToken,
            embedUrl: txtEmbedUrl,
            id: txtEmbedReportId,
            permissions: permissions,
    };

    // Get a reference to the paginated embedded report HTML element
    var paginatedReportContainer = $('#paginatedReportContainer')[0];

    // Embed the paginated report and display it within the div container.
    var report = powerbi.embed(paginatedReportContainer, config);
</script>
```

## Move to production

Now that you've completed developing your application, it's time to back your app workspace with a dedicated capacity. 

> [!Important]
> Dedicated capacity is required to move to production. All workspaces (the ones containing the reports or dashboards, and the ones containing the datasets) must be assigned to a capacity.

### Create a dedicated capacity

By creating a dedicated capacity, you can take advantage of having a dedicated resource for your customer. There are two types of capacity you can choose from:
* **Power BI Premium** - A tenant-level Office 356 subscription available in two SKU families, *EM* and *P*. When embedding Power BI content, this solution is referred to as *Power BI embedding*. For more informtion regarding this subscription, see [What is Power BI Premium?](../service-premium-what-is.md)
* **Azure Power BI Embedded** - You can purchase a dedicated capacity from the [Microsoft Azure portal](https://portal.azure.com). This subscription uses the *A* SKUs. For details on how to create a Power BI Embedded capacity, see [Create Power BI Embedded capacity in the Azure portal](azure-pbie-create-capacity.md).
> [!NOTE]
> With A SKUs, you can't access Power BI content with a FREE Power BI license.

The table below describes the resources and limits of each SKU. To determine which capacity best fits your needs, see the [which SKU should I purchase for my scenario](https://docs.microsoft.com/power-bi/developer/embedded-faq#power-bi-now-offers-three-skus-for-embedding-a-skus-em-skus-and-p-skus-which-one-should-i-purchase-for-my-scenario) table.

| Capacity Nodes | Total v-cores | Backend v-cores | RAM (GB) | Frontend v-cores | 
| --- | --- | --- | --- | --- |
| P1/A4 | 8 | 4 | 25 | 4 |
| P2/A5 | 16 | 8 | 50 | 8 |
| P3/A6 | 32 | 16 | 100 | 16 |
| | | | | |

**_With A SKUs, you can't access Power BI content with a FREE Power BI license._**

Using embed tokens with PRO licenses are intended for development testing, so the number of embed tokens a service principal can generate is limited. A dedicated capacity requires embedding in a production environment. There's no limit on how many embed tokens you can generate with a dedicated capacity. Go to [Available Features](https://docs.microsoft.com/rest/api/power-bi/availablefeatures/getavailablefeatures) to check the usage value that indicates the current embedded usage in percentage. Note that the usage amount is based on master account, and not on service principal.

For more information, see [Embedded analytics capacity planning whitepaper](https://aka.ms/pbiewhitepaper).

### Assign an app workspace to a dedicated capacity

Once you create a dedicated capacity, you can assign your app workspace to that dedicated capacity.

To assign a dedicated capacity to a workspace using [service principal](embed-service-principal.md), use the [Power BI REST API](https://docs.microsoft.com/rest/api/power-bi/capacities/groups_assigntocapacity). When you are using the Power BI REST APIs, make sure to use the [service principal object ID](embed-service-principal.md#how-to-get-the-service-principal-object-id).

## Next steps

In this tutorial, you've learned how to embed Power BI paginated reports into an application for your customers. You can also try to embed Power BI content for your organization.

> [!div class="nextstepaction"]
>[Embed for your organization](embed-sample-for-your-organization.md)

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)
