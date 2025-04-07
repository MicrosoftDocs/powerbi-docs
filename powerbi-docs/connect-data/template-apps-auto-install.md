---
title: Automate configuration of template app installation
description: Learn about automating the configuration of template app installation to make it easier for your customers to connect to their data.
author: paulinbar
ms.author: painbar
ms.topic: conceptual
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 10/08/2024
#Customer intent: As an ISV developer, I want to automate configuration of the template app installation process for my customers.
---

# Automated configuration of a template app installation

Template apps are a great way for customers to start getting insights from their data. Template apps get them up and running quickly by connecting them to their data. The template apps provide them with prebuilt reports that they can customize if they so desire.

Customers aren't always familiar with the details of how to connect to their data. Having to provide these details when they install a template app can be a pain point for them.

If you are a data services provider and have created a template app to help your customers get started with their data on your service, you can make it easier for them to install your template app. You can automate the configuration of your template app's parameters. When the customer signs in to your portal, they select a special link you've prepared. This link:

- Launches the automation, which gathers the information it needs.
- Preconfigures the template app parameters.
- Redirects the customer to their Power BI account where they can install the app.

All they have to do is select **Install** and authenticate against their data source, and they're good to go!

The customer experience is illustrated here.

![Illustration of user experience with an auto-installation application.](media/template-apps-auto-install/high-level-flow.png)

This article describes the basic flow, the prerequisites, the main steps, and the  APIs you need to automate the configuration of a template app installation. If you want to dive in and get started, you can skip to the [tutorial](template-apps-auto-install-tutorial.md) where you automate the configuration of the template app installation by using a simple sample application we've prepared that uses an Azure function.

## Basic flow

The basic flow for automating the configuration of a template app installation proceeds as follows:

1. The user signs in to the ISV's portal and selects the supplied link. This action initiates the automated flow. The ISV's portal prepares the user-specific configuration at this stage.

1. The ISV acquires an *app-only* token based on a [service principal (app-only token)](./../developer/embedded/embed-service-principal.md) that's registered in the ISV's tenant.

1. Using [Power BI REST APIs](/rest/api/power-bi/), the ISV creates an *install ticket*, which contains the user-specific parameter configuration as prepared by the ISV.

1. The ISV redirects the user to Power BI by using a ```POST``` redirection method that contains the install ticket.

1. The user is redirected to their Power BI account with the install ticket and is prompted to install the template app. When the user selects **Install**, the template app is installed for them.

>[!Note]
>While parameter values are configured by the ISV in the process of creating the install ticket, data source-related credentials are only supplied by the user in the final stages of the installation. This arrangement prevents them from being exposed to a third party and ensures a secure connection between the user and the template app data sources.

## Prerequisites

To provide a preconfigured installation experience for your template app, the following prerequisites are required:

- A Power BI Pro license. If you're not signed up for Power BI Pro, [sign up for a free trial](https://powerbi.microsoft.com/pricing/) before you begin.
- Your own Microsoft Entra tenant setup. For instructions on how to set one up, see [Create a Microsoft Entra tenant](./../developer/embedded/create-an-azure-active-directory-tenant.md).
- A **service principal (app-only token)** registered in the preceding tenant. For more information, see [Embed Power BI content with service principal and an application secret](./../developer/embedded/embed-service-principal.md). Make sure to register the application as a **server-side web application** app. You register a server-side web application to create an application secret. From this process, you need to save the *application ID* (ClientID) and *application secret* (ClientSecret) for later steps.
- A **parameterized template app** that's ready for installation. The template app must be created in the same tenant in which you register your application in Microsoft Entra ID. For more information, see [Template app tips](service-template-apps-tips.md) or [Create a template app in Power BI](service-template-apps-create.md). From the template app, you need to note the following information for the next steps:
  - *App ID*, *Package Key*, and *Owner ID* as they appear in the installation URL at the end of the process of [defining the properties of the template app](service-template-apps-create.md#define-the-properties-of-the-template-app) when the app was created. You can also get the same link by selecting **Get link** in the template app's [Release Management](service-template-apps-create.md#manage-the-template-app-release) pane.
  - *Parameter names* as they're defined in the template app's semantic model. Parameter names are case-sensitive strings and can also be retrieved from the **Parameter Settings** tab when you [define the properties of the template app](service-template-apps-create.md#define-the-properties-of-the-template-app) or from the semantic model settings in Power BI.
- To be able to test your automation work flow, add the service principal to the template app workspace as an Admin.

    >[!NOTE]
    >You can test your preconfigured installation application on your template app if the template app is ready for installation, even if it isn't publicly available on AppSource yet. For users outside your tenant to be able to use the automated installation application to install your template app, the template app must be publicly available in [AppSource](https://appsource.microsoft.com/en-us/marketplace/apps?product=power-bi). Before you distribute your template app by using the automated installation application you're creating, be sure to [publish it to Partner Center](/azure/marketplace/partner-center-portal/create-power-bi-app-offer).

## Main steps and APIs

The main steps for automating the configuration of a template app installation, and the APIs you'll need, are described in the following sections. While most of the steps are done with [Power BI REST APIs](/rest/api/power-bi/), the code examples described here are made with the .NET SDK.

## Step 1: Create a Power BI client object

Using Power BI REST APIs requires you to get an *access token* for your [service principal](./../developer/embedded/embed-service-principal.md) from Microsoft Entra ID. You're required to get a [Microsoft Entra access token](./../developer/embedded/generate-embed-token.md) for your Power BI application before you make calls to the [Power BI REST APIs](/rest/api/power-bi/).
To create the Power BI client with your access token, you need to create your Power BI client object, which allows you to interact with the Power BI REST APIs. You create the Power BI client object by wrapping the **AccessToken** with a **Microsoft.Rest.TokenCredentials** object.

```csharp
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using Microsoft.Rest;
using Microsoft.PowerBI.Api.V2;

var tokenCredentials = new TokenCredentials(authenticationResult.AccessToken, "Bearer");

// Create a Power BI client object. It's used to call Power BI APIs.
using (var client = new PowerBIClient(new Uri(ApiUrl), tokenCredentials))
{
    // Your code goes here.
}
```

## Step 2: Create an install ticket

Create an install ticket, which is used when you redirect your users to Power BI. The API used for this operation is the **CreateInstallTicket** API.

- [Template Apps - Create Install Ticket](/rest/api/power-bi/template-apps/create-install-ticket)

A sample of how to create an install ticket for template app installation and configuration is available from the [InstallTemplateApp/InstallAppFunction.cs](https://github.com/microsoft/Template-apps-examples/blob/master/Developer%20Samples/Automated%20Install%20Azure%20Function/InstallTemplateAppSample/InstallTemplateApp/InstallAppFunction.cs) file in the [sample application](https://github.com/microsoft/Template-apps-examples/tree/master/Developer%20Samples/Automated%20Install%20Azure%20Function/InstallTemplateAppSample).

The following code example shows how to use the template app **CreateInstallTicket** REST API.

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

// Issue the request to the REST API using .NET SDK.
InstallTicket ticketResponse = await client.TemplateApps.CreateInstallTicketAsync(request);
```

## Step 3: Redirect users to Power BI with the ticket

After you've created an install ticket, you use it to redirect your users to Power BI to continue with the template app installation and configuration. You use a ```POST``` method redirection to the template app's installation URL, with the install ticket in its request body.

There are various documented methods of how to issue a redirection by using ```POST``` requests. Choosing one or another depends on the scenario and how your users interact with your portal or service.

A simple example, mostly used for testing purposes, uses a form with a hidden field, which automatically submits itself upon loading.

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

The following example of the [sample application](https://github.com/microsoft/Template-apps-examples/tree/master/Developer%20Samples/Automated%20Install%20Azure%20Function/InstallTemplateAppSample)'s response holds the install ticket and automatically redirects users to Power BI. The response for this Azure function is the same automatically self-submitting form that we see in the preceding HTML example.

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
>There are various methods of using ```POST``` browser redirects. You should always use the most secure method, which depends on your service needs and restrictions. Remember that some forms of insecure redirection can result in exposing your users or service to security issues.

## Step 4: Move your automation to production

When the automation you've designed is ready, be sure to move it to production.

## Related content

- Try our [tutorial](template-apps-auto-install-tutorial.md), which uses a simple Azure function to automate the configuration of a template app installation.
- More questions? [Try asking the Power BI Community](https://community.powerbi.com/).
