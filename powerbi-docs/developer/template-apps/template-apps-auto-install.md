---
title: Automatically configure template app installation for your customers
description: Learn about automating the configuration of template app installation.
author: PaulInbar
ms.author: painbar

ms.topic: conceptual
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 11/16/2020
#Customer intent: As an ISV developer, I want to automate configuration of the template app installation process for my customers.
---

# Automate configuration of a template app installation

Template apps are a great way for customers to start getting insights from their data. Template apps get them up and running quickly by connecting them to their data and providing them with prebuilt reports that they can then customize if they so desire.

Customers are not always familiar with the details of how to connect to their data, and having to provide these details when installing a template app can be a pain point for them.

If you are a data services provider and have created a template app to help your customers get started with their data on your service, you can make it easier for them to install your template app by automating the configuration of your template app's parameters. When the customer logs into your portal, they click a special link you've prepared. This launches the automation, which gathers the information it needs, preconfigures the template app parameters, and redirects the customer to their Power BI account where they can install the app. All they have to do there is click install, authenticate against their data source, and they're good to go! 

This customer experience is illustrated below.

![Illustration of user experience with auto install application.](media/template-apps-auto-install/highlevelflow.png)

This article describes the basic flow, prerequisites, and the  main steps and APIs you need for automating the configuration of a template app installation. However, if you prefer to just dive in and get started, you can skip to the [tutorial](#tutorial-create-a-short-application-using-our-sample-application) where you automate the configuration of the template app installation using a simple sample application we've prepared that uses an Azure Function.

## Basic flow

The basic flow of automating the configuration of a template app installation is as follows:

1. The user logs in to the ISV's portal and clicks the supplied link. This initiates the automated flow. The ISV's portal prepares the user specific configuration at this stage.

2. The ISV acquires an **App-only** token based on a [service principal (app-only token)](../embedded/embed-service-principal.md), that is registered in the ISV's tenant.

3. Using [Power BI REST APIs](https://docs.microsoft.com/rest/api/power-bi/), the ISV creates an **Install Ticket** which contains the user specific parameter configuration as prepared by the ISV.

4. The ISV redirects the user to Power BI using a ```POST``` redirection method that contains the install ticket.

5. The user is redirected to their Power BI account with the install ticket and is prompted to install the template app. When the user clicks install, the template app is installed for them.

>[!Note]
>While parameter values are configured by the ISV when creating the install ticket, data source related credentials are only supplied by the user in the final stages of the installation. This prevents them from being exposed to a third party, thus ensuring a secure connection between the user and the template app data sources.

## Prerequisites

To provide a preconfigured installation experience for your template app, the following prerequisites are required:

* A **Power BI Pro license**. If you're not signed up for Power BI Pro, [sign up for a free trial](https://powerbi.microsoft.com/pricing/) before you begin.

* Your own **Azure Active Directory tenant setup**. See [Create an Azure Active Directory tenant](https://docs.microsoft.com/power-bi/developer/embedded/create-an-azure-active-directory-tenant) for instructions how to set one up.

* A **service principal (app-only token)** registered in the above tenant. See [Embed Power BI content with service principal and an application secret](https://docs.microsoft.com/power-bi/developer/embedded/embed-service-principal), for more detail. Make sure to register the application as a **server-side web application** app. You register a server-side web application to create an application secret. From this process you need to save the *Application ID* (Client ID) and *Application secret* (Client Secret) for later steps.

* A **parameterized template app** that is ready for installation. The template app must be created in the same tenant in which you register your application in Azure Active Directory (Azure AD). See [template app tips](https://docs.microsoft.com/power-bi/connect-data/service-template-apps-tips.md) or [Create a template app in Power BI](https://docs.microsoft.com/power-bi/connect-data/service-template-apps-create) for more information. From the template app you need to note the following information for the next steps:
     * *App ID*, *Package Key*, and *Owner ID* as they appear in the installation URL at then end of the [Define the properties of the template app](../../connect-data/service-template-apps-create.md#define-the-properties-of-the-template-app) process when the app was created. You can also get the same link by clicking **Get link** in the template app's [Release Management](../../connect-data/service-template-apps-create.md#manage-the-template-app-release).

    * *Parameter Names* as they are defined in the template app's dataset. Parameter names are case-sensitive strings and can also be retrieved from the **Parameter Settings** tab when you [Define the properties of the template app](../../connect-data/service-template-apps-create.md#define-the-properties-of-the-template-app) or from the dataset settings in Power BI.

    >[!NOTE]
    >You can test your preconfigured install application on your template app if the template app is ready for installation, even if it isn't publicly available on AppSource yet. However, for users outside your tenant to be able to use the automated install application to install your template app, the template app must be publicly available in the [Power BI Apps marketplace](https://app.powerbi.com/getdata/services). So before distributing your template app using the automated install application you're creating, be sure to publish it to the [Partner Center](https://docs.microsoft.com/azure/marketplace/partner-center-portal/create-power-bi-app-offer).

## Main steps and APIs

The main steps for automating the configuration of a template app installation, and the APIs you'll need, are described in the sections below. While most of the steps are done with [Power BI REST APIs](https://docs.microsoft.com/rest/api/power-bi/), the codes examples described below are made with the **.NET SDK**.

## Step 1: Create a Power BI client object 

Using Power BI REST APIs requires you to get an **access token** for your [service principal](../embedded/embed-service-principal.md) from **Azure AD**. You're required to get an [Azure AD access token](../embedded/get-azuread-access-token.md#access-token-for-non-power-bi-users-app-owns-data) for your Power BI application before you make calls to the [Power BI REST APIs](https://docs.microsoft.com/rest/api/power-bi/).
To create the Power BI Client with your **access token**, you need to create your Power BI client object, which allows you to interact with the [Power BI REST APIs](https://docs.microsoft.com/rest/api/power-bi/). You create the Power BI client object by wrapping the **AccessToken** with a ***Microsoft.Rest.TokenCredentials*** object.

```csharp
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using Microsoft.Rest;
using Microsoft.PowerBI.Api.V2;

var tokenCredentials = new TokenCredentials(authenticationResult.AccessToken, "Bearer");

// Create a Power BI Client object. it's used to call Power BI APIs.
using (var client = new PowerBIClient(new Uri(ApiUrl), tokenCredentials))
{
    // Your code to goes here.
}
```

## Step 2: Create an install ticket

Create an install ticket, which is used for when redirecting your users to Power BI. The API used for this operation is the **CreateInstallTicket** API.
* [Template Apps CreateInstallTicket](https://docs.microsoft.com/rest/api/power-bi/templateapps/createinstallticket)

A sample of creating an install ticket for template app installation and configuration is available from the following file in the [sample application](https://github.com/microsoft/Template-apps-examples/tree/master/Developer%20Samples/Automated%20Install%20Azure%20Function/InstallTemplateAppSample).

* InstallTemplateApp/InstallAppFunction.cs

Below is a code example for using the template app *CreateInstallTicket* REST API.
```csharp
using Microsoft.PowerBI.Api.V2;
using Microsoft.PowerBI.Api.V2.Models;

// Create Install Ticket Request.
InstallTicket ticketResponse = null;
var request = new CreateInstallTicketRequest()
{
    InstallDetails = new List<TemplateAppInstallDetails>()
    {
        new TemplateAppInstallDetails()
        {
            AppId = Guid.Parse(AppId),
            PackageKey = PackageKey,
            OwnerTenantId = Guid.Parse(OwnerId),
            Config = new TemplateAppConfigurationRequest()
            {
                Configuration = Parameters
                                    .GroupBy(p => p.Name)
                                    .ToDictionary(k => k.Key, k => k.Select(p => p.Value).Single())
            }
        }
    }
};

// Issue the request to the REST API using .NET SDK
InstallTicket ticketResponse = await client.TemplateApps.CreateInstallTicketAsync(request);
```

## Step 3: Redirect users to Power BI with the ticket

Once you have created an install ticket, you use it to redirect your users to Power BI to continue with the template app install and configuration. This is done by using a ```POST``` method redirection to the template app's install URL, with the install ticket in its request body.

There are various documented methods of how to issue a redirection using ```POST``` requests. Choosing one or another depends on the scenario and how your users interact with your portal or service.

A simple example, mostly used for testing purposes, leverages a form with a hidden field, which automatically submits itself upon loading.

```javascript
<html>
    <body onload='document.forms["form"].submit()'>
        <!-- form method is POST and action is the app install URL -->
        <form name='form' action='https://app.powerbi.com/....' method='post' enctype='application/json'>
            <!-- value should be the new install ticket -->
            <input type='hidden' name='ticket' value='H4sI....AAA='>
        </form>
    </body>
</html>
```

Below is an example of the [sample application](https://github.com/microsoft/Template-apps-examples/tree/master/Developer%20Samples/Automated%20Install%20Azure%20Function/InstallTemplateAppSample)'s response, which holds the install ticket and automatically redirects users to Power BI. The response for this Azure Function is in fact the same automatically self-submitting form that we see in the html example above.

```csharp
...
    return new ContentResult() { Content = RedirectWithData(redirectUrl, ticket.Ticket), ContentType = "text/html" };
}

...

public static string RedirectWithData(string url, string ticket)
{
    StringBuilder s = new StringBuilder();
    s.Append("<html>");
    s.AppendFormat("<body onload='document.forms[\"form\"].submit()'>");
    s.AppendFormat("<form name='form' action='{0}' method='post' enctype='application/json'>", url);
    s.AppendFormat("<input type='hidden' name='ticket' value='{0}' />", ticket);
    s.Append("</form></body></html>");
    return s.ToString();
}
```

>[!Note]
>While there are various methods of using ```POST``` browser redirects, you should always use the most secure method, which depends on your service needs and restrictions. Remember that some forms of insecure redirection can result in exposing your users or service to security issues.

## Next steps

Use our sample application to automate the configuration of a template app installation using an Azure Function.

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
