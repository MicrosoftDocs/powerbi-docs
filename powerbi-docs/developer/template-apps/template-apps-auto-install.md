---
title: Automatically install and configure template apps for your customers
description: Learn how to install and configure template apps for your customers.
author: PaulInbar
ms.author: painbar

ms.topic: tutorial
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 10/21/2020
#Customer intent: As an ISV developer, I want to develop a mechanism whereby my customers can click a link that automatically installs and configures a template app that I own.
---

# Create an application for programmatic preconfiguration of template apps

Template apps are a great way for customers to start getting insights from their data. Template apps get them up and running quickly by connecting them to their data and providing them with prebuilt reports that they can then customize if they so desire.

Customers are not always familiar with the details of how to connect to their data, and having to provide these details while installing a template app can be a pain point for them.

If you are a data services provider and have created a template app to help your customers get started with their data on your service, you can make it easy for them to install your template app by providing a special link on your service's website or portal. When clicked, this link preconfigures the template app with the necessary connection details and installs the template app for themT. The customer does not have to provide any connection details - all they have to do is give their consent to install, provide any sign in information required, and they are connected to their data. 

The customer experience when clicking a link that launches a template app preconfiguration application is illustrated below. 

![Illustration of user experience with auto install application.](media/template-apps-auto-install/highlevelflow.png)

In this article, you learn how to:
> [!div class="checklist"]
> * Register an application in Azure.
> * Create an application that installs and configures a template app on a customers tenant.

### Automated installation flow

**Automated Installation for Template Apps** lets you create a flow within your application or service, which prepares, installs and configures your template app for your customers with little to no additional actions by them. Leveraging Power BI's REST APIs, an ISV will prepare an install ticket which holds all information that's needed for a template app to be configured successfully.
Once a ticket is ready, the ISV will refer users to Power BI to install the application while "holding" the ticket.

Below is a short explanation of *Automated Install* flow steps:

![Diagram of automated template app install flow.](media/template-apps-auto-install/template-apps-automated-install.png)

1. User logs in to ISV portal.
This step initiates the flow. ISV portal should prepare the user specific configuration at this stage.

2. ISV acquires **App-only** token based on a [service principal (app-only token)](https://docs.microsoft.com/en-us/power-bi/developer/embedded/embed-service-principal), registered in the ISV's tenant.

3. Using [Power BI REST APIs](https://docs.microsoft.com/rest/api/power-bi/), ISV creates an **Install Ticket** which contains the user specific parameter configuration as prepared by the ISV.

4. ISV refers the user to Power BI using a ```POST``` redirection method, containing the install ticket.

5. User is redirected to Power BI with the install ticket, is prompted to install the desired template app. With the user's consent, the new application is installed for them.

Using the above flow, would save both ISVs and customers time in installing and configuring their template apps. The install ticket allows users to get a pre-configured application, ready to be used over their own data.

>[!Note]
>While parameter values are configured by the ISV when creating the install ticket, any datasource related credentials need to be configured by the user upon final install stages. This is done to ensure secure connection between the user and the template app datasources without the risk of credential exposure to a 3rd party.

## Prerequisites

Before getting started, you need to have:

* A **Power BI Pro license**. If you're not signed up for Power BI Pro, [sign up for a free trial](https://powerbi.microsoft.com/pricing/) before you begin.

* Your own **Azure Active Directory tenant setup**. See [Create an Azure Active Directory tenant](https://docs.microsoft.com/en-us/power-bi/developer/embedded/create-an-azure-active-directory-tenant) for instructions how to set one up.

* A **service principal (app-only token)** registered in the above tenant. See [Embed Power BI content with service principal and an application secret](https://docs.microsoft.com/en-us/power-bi/developer/embedded/embed-service-principal), for more detail.

* A **parameterized template app** that is ready to be installed by Power BI users. This template app should be available on AppSource. The template app should be created in the same tenant in which you register your application in Azure Active Directory (Azure AD). See [template app tips](https://docs.microsoft.com/en-us/power-bi/connect-data/service-template-apps-tips.md) or [Create a template app in Power BI](https://docs.microsoft.com/en-us/power-bi/connect-data/service-template-apps-create) for more information.

## Set up your template apps automation development environment

Before you continue setting up your application, follow the prerequisite steps described in [Quickstart: Create an Azure Functions app with Azure App Configuration](https://docs.microsoft.com/azure/azure-app-configuration/quickstart-azure-functions-csharp) to develop an Azure Function along with Azure App Configuration. Create your App Configuration as described in the article.

### Register an application in Azure Active Directory (Azure AD)

Create a **service principal**, according to the instructions in [Embed Power BI content with service principal and an application secret](https://docs.microsoft.com/en-us/power-bi/developer/embedded/embed-service-principal). Make sure to register the application as a **server-side web application** app. You register a server-side web application to create an application secret. Save the *Application ID* (Client ID) and *Application secret* (Client Secret) for later steps.

You can go through the [Embedding setup tool](https://aka.ms/embedsetup/AppOwnsData), so you can quickly get started creating an app registration. **[WHAT DO YOU MEAN BY "GO THROUGH"? USING THAT TOOL MAKES THIS STEP EASIER? CLARIFICATION NEEDED]**

## Prepare your template app

Before distributing your template app using the automated install application that you're going to create, make sure to publish it to the [Partner Center](https://docs.microsoft.com/en-us/azure/marketplace/partner-center-portal/create-power-bi-app-offer).

>[!NOTE]
>For testing purposes, you can always use your automated install application to install template apps you own in your own tenant, even before they are publicly available. Users outside your tenant will not be able to use the automated install APIs to install and configure these template apps until they are publicly available in the [Power BI Apps marketplace](https://app.powerbi.com/getdata/services).

Once you've prepared your template app and it's ready to be installed by your users, save the following information for the next steps:

* *App ID*, *Package Key*, and *Owner ID* as they appear in the installation URL at then end of the [Define the properties of the template app](https://docs.microsoft.com/power-bi/connect-data/service-template-apps-create#define-the-properties-of-the-template-app) process when the app was created. You can also get the same link by clicking **Get Link** in the template app's [Release Management](https://docs.microsoft.com/en-us/power-bi/connect-data/service-template-apps-create#manage-the-template-app-release).

* *Parameter Names* as they are defined in the template app's dataset. Parameter names are case-sensitive strings and can also be retrieved from the **Parameter Settings** tab when you [create an app](https://docs.microsoft.com/en-us/power-bi/connect-data/service-template-apps-create#manage-the-template-app-release) or from the dataset settings in Power BI.

## Install and configure your app using our Azure Function sample [Need to make title more clear]

In this section you will use an automated install Azure Function sample that we have created to preconfigure and install your template app. This sample has deliberately been kept simple for demonstration purposes. It allows you to leverage an [Azure Function](https://docs.microsoft.com/en-us/azure/azure-functions/functions-overview) and [Azure App Configuration](https://docs.microsoft.com/en-us/azure/azure-app-configuration/overview) to easily deploy and use the automated install API for you template apps.

1. Download [Visual Studio](https://www.visualstudio.com/) (version 2017 or later). Make sure to download the latest [NuGet package](https://www.nuget.org/profiles/powerbi).

2. Follow the [prerequisites](https://docs.microsoft.com/en-us/azure/azure-app-configuration/quickstart-azure-functions-csharp) to develop an Azure Function along with Azure App Configuration. **[I am confused. Is this what we did above?]**

3. Download the [Automated Install Azure Function sample](https://github.com/microsoft/Template-apps-examples/tree/master/Developer%20Samples/Automated%20Install%20Azure%20Function) from GitHub to get started.

    ![Automated Install Azure Function sample](media/template-apps-auto-install/azure-function-sample.png)

4. To run this sample, you need to setup your Azure App Configuration **[is this the thing you did in step 2?]** with the values & keys as described below. Keys are also defined in the **Constants.cs** file.

    <center>

    | Configuration Key | Meaning           |
    |---------------    |-------------------|
    | TemplateAppInstall:Application:AppId | *AppId* from [install URL](#prepare-your-template-app) |
    | TemplateAppInstall:Application:PackageKey | *PackageKey* from [install URL](#prepare-your-template-app) |
    | TemplateAppInstall:Application:OwnerId | *OwnerId* from [install URL](#prepare-your-template-app) |
    | TemplateAppInstall:ServicePrincipal:ClientId | Service Principal [Application ID](#application-ID) |
    | TemplateAppInstall:ServicePrincipal:ClientSecret | Service Principal [Application secret](#application-secret) |

    </center>
    
    The **Constants.cs** file:

    ![Constant.cs file](media/template-apps-auto-install/constants-app-configuration.png)

### Template App Properties

Fill in all relevant Template app properties as they are defined when the app is created. These properties are the template app's **AppId**, **PakcageKey** & **OwnerId**.

To get the above values, follow these steps:

1. Sign into [Power BI](https://app.powerbi.com).

2. Go to the application's original workspace.

3. Open the Release management pane.

    ![Release Management pane](media/template-apps-auto-install/release-management-001.png)

4. Select the app version and get its install link.

    ![Get link](media/template-apps-auto-install/release-management-002.png)

5. Copy the link to clipboard.

    ![Get link](media/template-apps-auto-install/release-management-003.png)

6. This install URL hold the 3 url parameters whose values you need. Use the **appId**, **packageKey** & **ownerId** values for the application. Sample URL will look like the below.

```https://app.powerbi.com/Redirect?action=InstallApp&appId=3c386...16bf71c67&packageKey=b2df4b...dLpHIUnum2pr6k&ownerId=72f9...1db47&buildVersion=5```

### Application ID

Fill in the **applicationId** information with the **Application ID** from **Azure**. The **applicationId** is used by the application to identify itself to the users from which you're requesting permissions.

To get the **applicationId**, follow these steps:

1. Sign into the [Azure portal](https://portal.azure.com).

2. In the left-hand nav pane, select **All Services**, and select **App Registrations**.

    ![App registration search](media/template-apps-auto-install/embed-sample-for-customers-003.png)

3. Select the application that needs the **applicationId**.

    ![Choosing App](media/template-apps-auto-install/embed-sample-for-customers-006.png)

4. There's an **Application ID** that is listed as a GUID. Use this **Application ID** as the **applicationId** for the application.

    ![applicationId](media/template-apps-auto-install/embed-sample-for-customers-007.png)

### Application secret

Fill in the **ApplicationSecret** information from the **Keys** section of your **App registrations** section in **Azure**.  This attribute works when using [service principal](embed-service-principal.md).

To get the **ApplicationSecret**, follow these steps:

1. Sign in to the [Azure portal](https://portal.azure.com).

2. In the left-hand nav pane, select **All services** and then select **App registrations**.

    ![App registration search](media/template-apps-auto-install/embed-sample-for-customers-003.png)

3. Select the application that needs to use the **ApplicationSecret**.

    ![Choose an app](media/template-apps-auto-install/embed-sample-for-customers-0038.png)

4. Select **Certificates and secrets** under **Manage**.

5. Select **New client secrets**.

6. Enter a name in the **Description** box and select a duration. Then select **Save** to get the **Value** for your application. When you close the **Keys** pane after saving the key value, the value field shows only as hidden. At that point, you aren't able to retrieve the key value. If you lose the key value, create a new one in the Azure portal.

    ![Key value](media/template-apps-auto-install/embed-sample-for-customers-042.png)

### Test the application
## Test this function locally

Follow the steps as described in [Run the function locally](https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-your-first-function-visual-studio#run-the-function-locally) to start your function.

Configure your portal to issue a ```POST``` request to the url of the function (e.g. ```POST http://localhost:7071/api/install```). Request body should be a JSON object describing Key-Value pairs, where keys are *parameter names* (defined in Power BI Desktop) and values are the desired values to set for each parameter in the template app.

>[!Note]
> Parameter values in production are to be deduced for each user by your portal's intended logic.

The desired flow should be:

1. Portal prepares the request, per user\session.
2. ```POST /api/install``` request issued to Azure Function.
3. If all is configured properly, browser should automatically redirect to Power BI and show automated install flow.
4. Upon installation, parameter values are set as configured in steps 1 & 2.

## Automatically install and configure you app for your customers

Even though the steps to install and configure your template app for your customers are done with the [Power BI REST APIs](https://docs.microsoft.com/rest/api/power-bi/), the example codes described in this article are made with the **.NET SDK**.

Using Power BI REST APIs requires you to get an **access token** for your [service principal](../embedded/embed-service-principal.md) from **Azure AD**. You're required to get an [Azure AD access token](../embedded/get-azuread-access-token.md#access-token-for-non-power-bi-users-app-owns-data) for your Power BI application before you make calls to the [Power BI REST APIs](https://docs.microsoft.com/rest/api/power-bi/).

To create the Power BI Client with your **access token**, you want to create your Power BI client object, which allows you to interact with the [Power BI REST APIs](https://docs.microsoft.com/rest/api/power-bi/). You create the Power BI client object by wrapping the **AccessToken** with a ***Microsoft.Rest.TokenCredentials*** object.

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

### Create an install ticket

Create an install ticket, which is used for when redirecting your users to Power BI. The API which is used for this operation is the **CreateInstallTicket** API.
* [Template Apps CreateInstallTicket](https://docs.microsoft.com/en-us/rest/api/power-bi/templateapps/createinstallticket)

A sample of creating an install ticket for template app installation & configuration is available from the following file in the [sample application](https://github.com/microsoft/Template-apps-examples/tree/master/Developer%20Samples/Automated%20Install%20Azure%20Function/InstallTemplateAppSample).

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

### Redirect users to Power BI with ticket

Once you have created you install ticket, you should use it to redirect your users to Power BI to continue with the app install and configuration. This is done by using a ```POST``` method redirection to the template app's install URL, with the install ticket in its request body.

There are various documented methods of how to issue a redirection using ```POST``` requests. Choosing one or another depends on the scenario and interaction of your users with your portal or servie.

A simple example, mostly used for testing purposes can leverage a form with a hidden field, which will automatically submit itself upon loading.

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

Below is an example of the [sample application](https://github.com/microsoft/Template-apps-examples/tree/master/Developer%20Samples/Automated%20Install%20Azure%20Function/InstallTemplateAppSample)'s response which holds the install ticket and automatically redirects users to Power BI. The response for this Azure Function is in fact the same automatically submitting form as above.

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

> [!Note] While there are various methods of using ```POST``` browser redirects, you should always use the most secure method to your choosing, which depends on your service needs and restrictions. Some forms of insecure redirections can result in exposing your users or service to security issues.

## Next steps

In this tutorial, you've learned how to install and configure Power BI template app for your customers.

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
