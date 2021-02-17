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

    * [Visual Studio Code](https://code.visualstudio.com/).

## Resources

This tutorial is using the following NuGet packages and APIs:

* Power BI REST [Reports API](https://docs.microsoft.com/rest/api/power-bi/reports) - Used to embed the URL and retrieve the embed token.

* [Microsoft Identity Web authentication library](/active-directory/develop/microsoft-identity-web).

* [Power BI embedded analytics Client APIs](/javascript/api/overview/powerbi/) -Use to embed the report.

## Method

To embed Power BI content in an *embed for your organization* app, follow these steps:

1. [Get the required component values](#step-1---get-component-values).

2. [Create a server side authentication file](#step-2---create-a-server-side-authentication-file).

3. [Configure your Azure AD app](#step-3---configure-your-azure-ad-app)

4. [Create a client side authentication file](#step-4---create-a-client-side-authentication-file)

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

## Step 2 - Create a server side authentication file

To embed in your app, you need to create a server side authentication file.

>[!NOTE]
>In this tutorial, the server side authentication file contains sensitive information such as *client ID* and *client secret*. For security reasons, it's not recommended to keep this information in the settings file. When embedding in your application, consider a more secure method of keeping this information.

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

3. Fill in component values obtained from [Step 1 - Get component values](#step-1---get-component-values):

    * **Domain** - ???
    * **TenantId** - ???
    * **ClientId** - [Client ID](#client-id)
    * **ClientSecret** - [Client secret](#client-secret)

## Step 3 - Configure your Azure AD app

Before your web app contacts Power BI, it needs to authenticate against Azure AD to get an [Azure AD token](#azure-ad-token). The *Azure AD token* enables your web app to call Power BI REST APIs.

If you don't have an Azure AD app, create one using the instructions in [Register an Azure AD application to use with Power BI](register.app.md).

To configure your Azure AD app, follow the instructions in [Configure your Azure AD app](embed-sample-for-your-organization?tabs=net-core#configure-your-azure-ad-app).

## Step 4 - Create a client side authentication file


## Next steps

> [!div class="nextstepaction"]
>[Embedded analytics application tokens](embed-tokens.md)

> [!div class="nextstepaction"]
>[Move your embedded app to production](move-to-production.md)

> [!div class="nextstepaction"]
>[Capacity and SKUs in Power BI embedded analytics](embedded-capacity.md)

> [!div class="nextstepaction"]
>[Capacity planning in Power BI embedded analytics](embedded-capacity-planning.md)
