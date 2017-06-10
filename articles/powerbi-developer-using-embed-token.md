<properties
   pageTitle="What can developers do with Power BI?"
   description="Learn how you can create an application that allows non-Power BI users the ability to view Power BI dashbaords and reports."
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
   ms.date="06/12/2017"
   ms.author="asaxton"/>

# Embed Power BI content for non-Power BI users

Learn how you can create an application that allows non-Power BI users the ability to view Power BI dashbaords and reports.

Microsoft recently [announced Power BI Premium](https://powerbi.microsoft.com/blog/microsoft-accelerates-modern-bi-adoption-with-power-bi-premium/), a new capacity-based licensing model that increases flexibility for how users access, share and distribute content. The offering also delivers additional scalability and performance to the Power BI service.

With the introduction of Power BI Premium, Power BI Embedded and the Power BI service are converging to advance how Power BI content is embedded in apps. This means you will have one API surface, a consistent set of capabilities and access to the latest Power BI features – such as dashboards, gateways and app workspaces – when embedding your content. Moving forward you’ll be able to start with Power BI Desktop and move to deployment with Power BI Premium, which will be generally available late in the second quarter of 2017.

You can use an embed token with the Power BI REST APIs to embed reports by using a single Power BI Pro user. The embed token is then used with requests made by users in your application to view content within Power BI by way of a single Power BI user. The users within your application do not need to exist within your Power BI organization. The embed token is what makes it possible.

> [AZURE.IMPORTANT] While embedding has a dependency on the Power BI service, there is not a dependecy on Power BI for the users of your application when using an **embed token**. They do not need to sign up for Power BI to view the embedded content in your application.

There are a few steps you have to do with your application to make this possible. We will go through the steps needed to allow you to create and use an embed token within your application.  Here is a look at the overall flow for embedding when using an embed token.

![](media\powerbi-developer-using-embed-token\powerbi-embed-flow.png)

## Step 1: Setup your embedded analytics development environment

Before you start embedding dashboards and reports into your application, you need to make sure your environment is setup to allow for embedding. As part of the setup, you will need to do the following.

* [Define your Azure Active Directory tenant](powerbi-developer-using-embed-token.md#azureadtenant)
* [Create your Power BI Pro account](powerbi-developer-using-embed-token.md#proaccount)
* [Register your Azure Active Directory application and permissions](powerbi-developer-using-embed-token.md#appreg)

### <a name="azureadtenant"></a>Azure Active Directory tenant

You will need an Azure Active Directory (Azure AD) tenant in order to embed items from Power BI. This tenant must have at least one Power BI Pro user. You will also need to define an Azure AD app within the tenant. You can make use of an existing Azure AD tenant or create a new one specifically for embedding purposes.

You will need to determine what tenant setup to use.

* Use your existing corporate Power BI tenant?
* Use a separate tenant for your application?
* Use a separate tenant for each customer?

If you decide to create a new tenant for your application, or one for each customer, see [Create an Azure Active Directory tenant](powerbi-developer-create-an-azure-active-directory-tenant.md) or [How to get an Azure Active Directory tenant](https://docs.microsoft.com/azure/active-directory/develop/active-directory-howto-tenant).

### <a name="proaccount"></a>Create a Power BI Pro user account

You only need a single Power BI Pro account to embed content. However, you may want to have a few different users that have specific access to items. Here is a look at possible users to consider within your tenant.

The following accounts will need to exist within your tenant and have a Power BI Pro license assigned to them.

> [AZURE.NOTE] These accounts will need to have Power BI Pro licenses in order to use App workspaces.

#### An organization/tenant admin user

It is recommended that your organization/tenant Global Admin user should not be used as the account your application uses. This is to minimize access that the application account has within your organization. It is recommended that the admin user be an admin of all App workspaces created for the purpose of embedding.

#### Accounts for analysts that will create content

You may have multiple users that create content for Power BI. You will need a Power BI Pro account for each analyst that is creating and deploying content to Power BI.

#### An application *master* user account

This is the account your application will use when embedding content. This is really the only required account you need within your organization. It can also be used as the admin and analyst account, but it is not recommended. Your application's backend will store the credentials for this account and use it for acquiring an Azure AD auth token for use with the Power BI APIs. This account will be used to generate the embed token for the application.

This account must be an admin of the app workspace that is being used for embedding.

### <a name="appreg"></a> App registration and permissions

You will need to register an application within Azure AD and grant permissions to that application for use with embedding content from Power BI. You will want to register the app using the *master* account that you created in the last step.

#### Register an application

You need to register an application as a native Azure application within your Azure AD tenant. You can either register your application from the Power BI app registration tool, or directly within the Azure AD portal. For more information, see [Register a client app](powerbi-developer-register-a-client-app.md). Make sure that you select **Native App** for the **App type**.

#### Apply permissions to your application

You will need to enable additional permissions to your application in addition to what was provided in app registration page. You can accomplish this through the Azure AD portal, or programmatically.

> [AZURE.NOTE] You will want to perform these steps with a tenant/organization admin. This would be a user in the Global admin role.

##### Using the Azure AD Portal

1. Browse to the [App registrations blade](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ApplicationsListBlade) within the Azure portal and select the app that you are using for embedding.

    ![](media\powerbi-developer-using-embed-token\powerbi-embedded-azuread-app-permissions01.png)

2. Select **Required permissions** under **API Access**.

    ![](media\powerbi-developer-using-embed-token\powerbi-embedded-azuread-app-permissions02.png)

3. Select **Windows Azure Active Directory** and then make sure **Access the directory as the signed-in user** is selected. Select **Save**.

    ![](media\powerbi-developer-using-embed-token\powerbi-embedded-azuread-app-permissions03.png)

4. Within **Required permissions**, select **Power BI Service (Power BI)**.

    ![](media\powerbi-developer-using-embed-token\powerbi-embedded-azuread-app-permissions05.png)

    > [AZURE.NOTE] If you created the app directly in the Azure AD portal, **Power BI Servcie (Power BI)** may not be present. If it is not, select **+ Add** and then **1 Select and API**. Select **Power BI Service** in the API list and select **Select**. You can then continue to step 5.

5. Select all permissions under **Delegated Permissions**. You will need to select them one by one in order to save the selections. Select **Save** when done.

    ![](media\powerbi-developer-using-embed-token\powerbi-embedded-azuread-app-permissions06.png)

6. Within **Required permissions**, select **Grant Permissions**.

    This will give the app permissions on behalf of all users in the tenant/organization. If you don't want this, you will need to sign in internactively with your app ID to Azure AD at least once.

    > [AZURE.NOTE] In order to give permission to all users in the tenant, this operation should be made by an account in the Global admin role. Otherwise the permission is only granted to the user that performed the step.

    ![](media\powerbi-developer-using-embed-token\powerbi-embedded-azuread-app-permissions07.png)

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

## Step 3: Create App workspaces (optional)

You can take advantage of App workspaces to provide better isoliation if your application is servicing multiple customers. Dashboards and reports would be isolated between your customers. You could then use a Power BI account per App workspace to further isolate application experiences between your customers.

You will need a user that has a Pro license in order to create an App workspace within Power BI. The Power BI user that creates the App workspace will be an admin of that workspace by default.

You do not need an app workspace to embed reports into your application. If you do not use an App workspace, your dashboards and reports will be in the *My workspace* for the Power BI account you use with your application.

## Step 4: Create and upload your reports

You can create your reports and datasets using Power BI Desktop and then publish those reports to a Power BI workspace. It is recommended to publish your reports to an App workspace to provide better isolation if your application is servicing multiple customers.

## Step 5: Embed your content

Within your application, you will need to authenticate with Power BI using the Power BI account for your application. This will require you to store the credentials for this account within your application.

1. Add AuthN/AuthZ authentication to Power BI using the *master* account for your application. This will allow you to generate the embed token. You can take advantage of using an embed token to allow this user to act on behalf of other users.

    > [AZURE.NOTE] More information regarding the embed token will be made available soon.

2. Use the Power BI and JavaScript APIs to embed dashboards and reports into your application. For more information, see the following.

    > [AZURE.NOTE] These examples will be updated with information about using the embed token soon.

    - [Integrate a dashboard into an app](powerbi-developer-integrate-dashboard.md)
    - [Integrate a tile into an app](powerbi-developer-integrate-tile.md)
    - [Integrate a report into an app](powerbi-developer-integrate-report.md)

## Licensing

When you are ready to move to production, you will need to do the following.

1. Purchase a capacity that fits your needs. We will have a calculator to estimate the required capacity size.

2. Go to the Admin portal, within Power BI, and within **Manage capacity** section assign the workspace to the purchased capacity. This can be done with an admin account or a user with capacity assignment permissions.

    If you are using an App workspace to store your content, you can edit the App workspace and assign it to a Premium capacity under advanced.

    ![](media\powerbi-developer-migrate-from-powerbi-embedded\powerbi-embedded-premium-capacity.png)

3. Deploy your updated application to production and begin embedding reports from the Power BI service.

## Next steps

[Embedding with Power BI](powerbi-developer-embedding.md)  
[How to migrate Power BI Embedded workspace collection content to Power BI](powerbi-developer-migrate-from-powerbi-embedded.md)  
[Power BI Premium announcement](https://powerbi.microsoft.com/blog/microsoft-accelerates-modern-bi-adoption-with-power-bi-premium/)  
[JavaScript API Git repo](https://github.com/Microsoft/PowerBI-JavaScript)  
[Power BI C# Git repo](https://github.com/Microsoft/PowerBI-CSharp)  
[JavaScript embed sample](https://microsoft.github.io/PowerBI-JavaScript/demo/)  
[Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)