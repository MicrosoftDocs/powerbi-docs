<properties
   pageTitle="Migrate content from the Power BI Embedded Azure service"
   description="Power BI Embedded is being merged from an Azure service into the Power BI service. This means you will have one set of APIs for embeding your content."
   services="powerbi"
   documentationCenter=""
   authors="guyinacube"
   manager="erikre"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="05/01/2017"
   ms.author="asaxton"/>
# Migrate content from the Power BI Embedded Azure service

Learn how to migrate from Power BI Embedded to the Power BI service and leverage advances for embedding in apps.

Microsoft recently [announced Power BI Premium](https://powerbi.microsoft.com/blog/microsoft-accelerates-modern-bi-adoption-with-power-bi-premium/), a new capacity-based licensing model that increases flexibility for how users access, share and distribute content. The offering also delivers additional scalability and performance to the Power BI service.

With the introduction of Power BI Premium, Power BI Embedded and the Power BI service are converging to advance how Power BI content is embedded in apps. This means you will have one API surface, a consistent set of capabilities and access to the latest Power BI features – such as dashboards, gateways and app workspaces – when embedding your content. Moving forward you’ll be able to start with Power BI Desktop and move to deployment with Power BI Premium, which will be generally available late in the second quarter of 2017.

The current Power BI Embedded service will continue to be available for a limited time following general availability of the converged offering: customers under an Enterprise Agreement will have access to through the expiration of their existing agreements; customers that acquired Power BI Embedded through Direct or CSP channels will enjoy access for one year from General Availability of Power BI Premium.  This article will provide some guidance for migrating from the Azure service to the Power BI service and what to expect for changes in your application.

![](media\powerbi-developer-migrate-from-powerbi-embedded\powerbi-embedded-flow.png)

## Prepare for the migration

There are a few things you need to do to prepare for migrating from Power BI Embedded Azure service over to the Power BI service. You will need a tenant available, along with a user that has a Power BI Pro license.

1. Make sure you have access to an Azure Active Directory (Azure AD) tenant.

    Your organization may already have a tenant available that you are currently using Power BI with. If this is not available, you will need to create a new tenant. You can make use of an existing tenant for your organization. For more information you can see [Create an Azure Active Directory tenant](powerbi-developer-create-an-azure-active-directory-tenant.md) or [How to get an Azure Active Directory tenant](https://docs.microsoft.com/azure/active-directory/develop/active-directory-howto-tenant).

2. Make sure your user account has a Power BI license. This can be Free or Pro.

    In order to take advantage of certain features, such as App workspaces, you will need to have a Pro license. This will be needed for the developer, or other users that are publishing content that requires use of Pro features. You can make this work with a free user, however, all content would be within that user's *My Workspace* instead of taking advantage of App workspaces.

## Accounts within Azure AD

The following accounts will need to exist within your tenant and have a license for Power BI.

1. A tenant admin user.

    It is recommended that this user be a member of all App workspaces created for the purpose of embedding.

2. Accounts for analysts that will create content. 

    These users should be assigned to App workspaces as needed.

3. An application *master* user account.

    The applications backend will store the credentials for this account and use it for acquiring an Azure AD token for use with the Power BI APIs. This account will be used to generate the embed token for the application. This account should also be a member of the App workspaces created for embedding.

> [AZURE.NOTE] These accounts will need to have Power BI Pro licenses in order to use App workspaces and to create content that makes use of Pro features such as the On-Premises Data Gateway.

## App registration and permissions

You will need to register an application within Azure AD and grant certain permissions.

### Register an application

You can need to register an application as a native Azure application witn your Azure AD tenant. You can either register your application from the Power BI app registration tool, or directly within the Azure AD portal. For more information, see [Register a client app](powerbi-developer-register-a-client-app.md). Make sure that you select **Native App** for the **App type**.

### Apply permissions to your application

You will need to enable additional permissions to your application in addition to what was provided in app registration page. You can accomplish this through the Azure AD portal, or programmatically.

> [AZURE.NOTE] You will need to perform these steps with an admin account that has access to the Azure portal and to your tenant.

#### Using the Azure AD Portal

1. Browse to the [App registrations blade](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ApplicationsListBlade) within the Azure portal and select the app that you are using for embedding.

    ![](media\powerbi-developer-migrate-from-powerbi-embedded\powerbi-embedded-azuread-app-permissions01.png)

2. Select **Required permissions** under **API Access**.

    ![](media\powerbi-developer-migrate-from-powerbi-embedded\powerbi-embedded-azuread-app-permissions02.png)

3. Select **Windows Azure Active Directory** and then make sure **Access the directory as the signed-in user** is selected. Select **Save**.

    ![](media\powerbi-developer-migrate-from-powerbi-embedded\powerbi-embedded-azuread-app-permissions03.png)

4. Within **Required permissions**, select **Power BI Service (Power BI)**.

    ![](media\powerbi-developer-migrate-from-powerbi-embedded\powerbi-embedded-azuread-app-permissions05.png)

5. Select all permissions under **Delegated Permissions**. You will need to select them one by one in order to save the selections. Select **Save** when done.

    ![](media\powerbi-developer-migrate-from-powerbi-embedded\powerbi-embedded-azuread-app-permissions06.png)

6. Within **Required permissions**, select **Grant Permissions**.

    This will give the app permissions on behalf of all users in the tenant/organization. If you don't want this, you will need to sign in internactively with your app ID to Azure AD at least once.

    ![](media\powerbi-developer-migrate-from-powerbi-embedded\powerbi-embedded-azuread-app-permissions07.png)

#### Applying permissions programmatically

1. You will need to get the existing service principals (users) within your tenant. For information on how to do that, see [Get servicePrincipal](https://developer.microsoft.com/graph/docs/api-reference/beta/api/serviceprincipal_get).

    > [AZURE.NOTE] You can call the *Get servicePrincipal* api without {id} and it will get you all of the service principals within the tenant.

2. Check for a service principal with you app client id as **appId** property.

3. Create a new service plan if missing for your app.

    ```
    Post https://graph.microsoft.com/beta/servicePrincipals
    Authorization: Bearer ey..qw
    Content-Type: application/json
    {
    "accountEnabled" : true,
    "appId" : "{App_Client_ID}",
    "displayName" : "{App_DisplayName}"
    }
    ```

4. Grant App Permission to PowerBI API

    ```
    Post https://graph.microsoft.com/beta/OAuth2PermissionGrants
    Authorization: Bearer ey..qw
    Content-Type: application/json
    { 
    "clientId":"{Service_Plan_ID}",
    "consentType":"AllPrincipals",
    "resourceId":"c78b2585-1df6-41de-95f7-dc5aeb7dc98e",
    "scope":"Dataset.ReadWrite.All Dashboard.Read.All Report.Read.All Group.Read Group.Read.All Content.Create Metadata.View_Any Dataset.Read.All Data.Alter_Any",
    "expiryTime":"2018-03-29T14:35:32.4943409+03:00",
    "startTime":"2017-03-29T14:35:32.4933413+03:00"
    }
    ```

5. Grant App Permission to AAD

    ```
    Post https://graph.microsoft.com/beta/OAuth2PermissionGrants
    Authorization: Bearer ey..qw
    Content-Type: application/json
    { 
    "clientId":"{Service_Plan_ID}",
    "consentType":"AllPrincipals",
    "resourceId":"61e57743-d5cf-41ba-bd1a-2b381390a3f1",
    "scope":"User.Read Directory.AccessAsUser.All",
    "expiryTime":"2018-03-29T14:35:32.4943409+03:00",
    "startTime":"2017-03-29T14:35:32.4933413+03:00"
    }
    ```

## Create App workspaces (Optional)

You can take advantage of App workspaces to provide better isoliation if your application is servicing multiple customers. Dashboards and reports would be isolated between your customers. You could then use a Power BI account per App workspace to further isolate application experiences between your customers.

You will need a user that has a Pro license in order to create an App workspace within Power BI. The Power BI user that creates the App workspace will be an admin of that workspace by default.

You do not need an app workspace to embed reports into your application. If you do not use an App workspace, your dashboards and reports will be in the *My workspace* for the Power BI account you use with your application.

## Create and upload your reports

You can create your reports and datasets using Power BI Desktop and then publish those reports to a Power BI workspace. It is recommended to publish your reports to an App workspace to provide better isolation if your application is servicing multiple customers.

> [AZURE.NOTE] We will have an import/export tool for you to accomplish this step to assist with moving content from the Power BI Embedded Azure service to the Power BI service. This tool is coming soon.

## Rebuild your application

1. You will need to modify your application to use the Power BI REST APIs and the report location inside powerbi.com.

2. Rebuild your AuthN/AuthZ authentication using the *master* account for your application. You can take advantage of using an embed token to allow this user to act on behalf of other users.

    > [AZURE.NOTE] More information regarding the embed token will be made available soon.

3. Embed your reports from powerbi.com into your application.

## Map your users to a Power BI user

Within your application, you will map users that you manage within the application to a *master* Power BI credential for the purposes of your application. The credentials for this Power BI *master* account will be stored within your application and be used to creating embed tokens.

## What to do when you are ready for production

When you are ready to move to production, you will need to do the following.

1. Purchase a capacity that fits your needs. We will have a calculator to estimate the required capacity size.

2. Go to the Admin portal, within Power BI, and within **Manage capacity** section assign the workspace to the purchased capacity. This can be done with an admin account or a user with capacity assignment permissions.

    If you are using an App workspace to store your content, you can edit the App workspace and assign it to a Premium capacity under advanced.

    ![](media\powerbi-developer-migrate-from-powerbi-embedded\powerbi-embedded-premium-capacity.png)

3. Deploy your updated application to production and begin embedding reports from the Power BI service.

## After migration

You should do some cleanup within Azure.

- Remove all workspaces off of the deployed solution within the Azure service of Power BI Embedded.
- Delete any Workspace Collections that exist within Azure.

## Next steps

[Embedding with Power BI](powerbi-developer-embedding.md)  
[Power BI Premium announcement](https://powerbi.microsoft.com/blog/microsoft-accelerates-modern-bi-adoption-with-power-bi-premium/)  
[JavaScript API Git repo](https://github.com/Microsoft/PowerBI-JavaScript)  
[Power BI C# Git repo](https://github.com/Microsoft/PowerBI-CSharp)  
[JavaScript embed sample](https://microsoft.github.io/PowerBI-JavaScript/demo/)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)