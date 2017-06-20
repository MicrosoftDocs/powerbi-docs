<properties
   pageTitle="How to embed your Power BI dashboards, reports and tiles"
   description="Learn about the steps you need to take to embed Power BI content within your application."
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
   ms.date="06/20/2017"
   ms.author="asaxton"/>

# How to embed your Power BI dashboards, reports and tiles

Learn about the steps you need to take to embed Power BI content within your application.

Microsoft recently [announced Power BI Premium](https://powerbi.microsoft.com/blog/microsoft-accelerates-modern-bi-adoption-with-power-bi-premium/), a new capacity-based licensing model that increases flexibility for how users access, share and distribute content. The offering also delivers additional scalability and performance to the Power BI service.

With the introduction of Power BI Premium, Power BI Embedded and the Power BI service are converging to advance how Power BI content is embedded in apps. This means you will have one API surface, a consistent set of capabilities and access to the latest Power BI features – such as dashboards, gateways and app workspaces – when embedding your content. Moving forward you’ll be able to start with Power BI Desktop and move to deployment with Power BI Premium, which will be generally available late in the second quarter of 2017.

This article will look at embedding your Power BI content for both users of Power BI and non-Power BI users. The steps are similar between the two. Callouts will be made when a step is specific to embedding for non-Power BI users.

There are a few steps you have to do with your application to make this possible. We will go through the steps needed to allow you to create and use embedded content within your application.

> [AZURE.NOTE] The Power BI APIs still refer to app workspaces as groups. Any references to groups mean that you are working with app workspaces.

## Step 1: Setup your embedded analytics development environment

Before you start embedding dashboards and reports into your application, you need to make sure your environment is setup to allow for embedding. As part of the setup, you will need to do the following.

* [Define your Azure Active Directory tenant](powerbi-developer-embedding-content.md#azureadtenant)
* [Create your Power BI Pro account](powerbi-developer-embedding-content.md#proaccount)
* [Register your Azure Active Directory application and permissions](powerbi-developer-embedding-content.md#appreg)

> [AZURE.NOTE] Power BI Premium is not required for development of your application. The developers of the application will need to have a Power BI Pro license.

### <a name="azureadtenant"></a>Azure Active Directory tenant

You will need an Azure Active Directory (Azure AD) tenant in order to embed items from Power BI. This tenant must have at least one Power BI Pro user. You will also need to define an Azure AD app within the tenant. You can make use of an existing Azure AD tenant or create a new one specifically for embedding purposes.

You will need to determine what tenant setup to use.

* Use your existing corporate Power BI tenant?
* Use a separate tenant for your application?
* Use a separate tenant for each customer?

If you decide to create a new tenant for your application, or one for each customer, see [Create an Azure Active Directory tenant](powerbi-developer-create-an-azure-active-directory-tenant.md) or [How to get an Azure Active Directory tenant](https://docs.microsoft.com/azure/active-directory/develop/active-directory-howto-tenant).

> [AZURE.NOTE] It is recommended to create a new Azure AD tenant if you will be embedding for non-Power BI users. 

### <a name="proaccount"></a>Create a Power BI Pro user account

You only need a single Power BI Pro account to embed content. However, you may want to have a few different users that have specific access to items. Here is a look at possible users to consider within your tenant.

The following accounts will need to exist within your tenant and have a Power BI Pro license assigned to them.

> [AZURE.NOTE] These accounts will need to have Power BI Pro licenses in order to use App workspaces.

#### An organization/tenant admin user

It is recommended that your organization/tenant Global Admin user should not be used as the account your application uses. This is to minimize access that the application account has within your organization. It is recommended that the admin user be an admin of all App workspaces created for the purpose of embedding.

#### Accounts for analysts that will create content

You may have multiple users that create content for Power BI. You will need a Power BI Pro account for each analyst that is creating and deploying content to Power BI.

#### An application *master* user account for non-Power BI users

This is the account your application will use when embedding content for non-Power BI users. This is really the only required account you need within your organization. It can also be used as the admin and analyst account, but it is not recommended. Your application's backend will store the credentials for this account and use it for acquiring an Azure AD auth token for use with the Power BI APIs. This account will be used to generate an embed token for the application to use for non-Power BI users.

This account must be an admin of the app workspace that is being used for embedding.

### <a name="appreg"></a> App registration and permissions

You will need to register an application within Azure AD and grant permissions to that application when embedding content from Power BI. You will want to register the app using the *master* account that you created in the last step.

#### Register an application

You will first need to register the application with Azure AD. While this can be done with the Azure AD portal, we have created a web page you can use to quickly register the app. Depending on who you are embedding content for will determine what items you want to select for the application. If you will be embedding for non-Power BI users, the app type must by **Native**.

|Embedding for|Application type|
|---------|---------|---------|
|Power BI users|Server-side Web app or Native app|
|Non-Power BI users|Native app|

For steps on how to register the applications, see [Register an application](powerbi-developer-register-app.md).

#### Apply permissions to your application

> [AZURE.IMPORTANT] This section only applies to applications that are embedding content for *non-Power BI* users.

You will need to enable additional permissions to your application in addition to what was provided in app registration page. You can accomplish this through the Azure AD portal, or programmatically.

You will want to perform these steps with a tenant/organization admin. This would be a user in the Global admin role.

##### Using the Azure AD Portal

1. Browse to the [App registrations blade](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ApplicationsListBlade) within the Azure portal and select the app that you are using for embedding.

    ![](media\powerbi-developer-embedding-content\powerbi-embedded-azuread-app-permissions01.png =502x286)

2. Select **Required permissions** under **API Access**.

    ![](media\powerbi-developer-embedding-content\powerbi-embedded-azuread-app-permissions02.png  =302x322)

3. Select **Windows Azure Active Directory** and then make sure **Access the directory as the signed-in user** is selected. Select **Save**.

    ![](media\powerbi-developer-embedding-content\powerbi-embedded-azuread-app-permissions03.png  =572x380)

4. Within **Required permissions**, select **Power BI Service (Power BI)**.

    ![](media\powerbi-developer-embedding-content\powerbi-embedded-azuread-app-permissions05.png  =502x194)

    > [AZURE.NOTE] If you created the app directly in the Azure AD portal, **Power BI Servcie (Power BI)** may not be present. If it is not, select **+ Add** and then **1 Select and API**. Select **Power BI Service** in the API list and select **Select**. You can then continue to step 5.

5. Select all permissions under **Delegated Permissions**. You will need to select them one by one in order to save the selections. Select **Save** when done.

    ![](media\powerbi-developer-embedding-content\powerbi-embedded-azuread-app-permissions06.png =502x345)

6. Within **Required permissions**, select **Grant Permissions**.

    This will give the app permissions on behalf of all users in the tenant/organization. If you don't want this, you will need to sign in internactively with your app ID to Azure AD at least once.

    > [AZURE.NOTE] In order to give permission to all users in the tenant, this operation should be made by an account in the Global admin role. Otherwise the permission is only granted to the user that performed the step.

    ![](media\powerbi-developer-embedding-content\powerbi-embedded-azuread-app-permissions07.png =502x193)

##### Applying permissions programmatically

1. You will need to get the existing service principals (users) within your tenant. For information on how to do that, see [Get servicePrincipal](https://developer.microsoft.com/en-us/graph/docs/api-reference/beta/api/serviceprincipal_get).

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

### Create app workspaces

If you are embedding dashboards and reports for non-Power BI users, those dashboards and reports have to be placed within an app workspace. For information on how to create an app workspace, see [Create and distribute an app in Power BI](powerbi-service-create-apps.md).

> [AZURE.IMPORTANT] The *master* account, that was mentioned above, needs to be an admin of the app workspace.

### Create and upload your reports

You can create your reports and datasets using Power BI Desktop and then publish those reports to an app workspace. The end user publishing the reports need to have a Power BI Pro license in order to publish to an app workspace.

## Step 2: Embed your content

Within your application, you will need to authenticate with Power BI. If you are embedding content for non-Power BI users, this will require you to store the credentials for the *master* account within your application.

Use the Power BI and JavaScript APIs to embed dashboards and reports into your application. For more information, see the following.

- [Integrate a dashboard into an app](powerbi-developer-integrate-dashboard.md)
- [Integrate a tile into an app](powerbi-developer-integrate-tile.md)
- [Integrate a report into an app](powerbi-developer-integrate-report.md)

When embedding for non-Power BI users, an embed token is required. To learn more see, [GenerateToken](https://msdn.microsoft.com/library/mt784614.aspx).

## Step 3: Promote your solution to production

When you are ready to move to production, you will need to do the following.

### Power BI users

If you are embedding for Power BI users, you only need to let people know how to get to your application.

### Non-Power BI users

If you are embedding for non-Power BI users, you will want to do the following.

* While you can use your organizations production tenant, it is recommended to create a new embedded analytics environment for production. For more information, see Step 1 above.

* If you are using a separate tenant for development, then you will need to make sure your app workspaces, along with dashboards and reports, are available in your production environment. You will also need to make sure that you created the application in Azure AD for your production tenant and assigned the proper app permissions as indicated in Step 1.

* Purchase a capacity that fits your needs. You can use the [Power BI Premium calculator](https://powerbi.microsoft.com/calculator/) to help understand what you may need. When you are ready to purchase, you can do so within the [Office 365 admin center](https://portal.office.com/adminportal/home#/catalog).

* Edit the App workspace and assign it to a Premium capacity under advanced.

    ![](media\powerbi-developer-migrate-from-powerbi-embedded\powerbi-embedded-premium-capacity.png =567x343)

* Deploy your updated application to production and begin embedding reports from the Power BI service.

## Next steps

[Embedding with Power BI](powerbi-developer-embedding.md)  
[How to migrate Power BI Embedded workspace collection content to Power BI](powerbi-developer-migrate-from-powerbi-embedded.md)  
[Power BI Premium announcement](https://powerbi.microsoft.com/blog/microsoft-accelerates-modern-bi-adoption-with-power-bi-premium/)  
[JavaScript API Git repo](https://github.com/Microsoft/PowerBI-JavaScript)  
[Power BI C# Git repo](https://github.com/Microsoft/PowerBI-CSharp)  
[JavaScript embed sample](https://microsoft.github.io/PowerBI-JavaScript/demo/)  
[Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)