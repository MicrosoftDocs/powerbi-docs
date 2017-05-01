<properties
   pageTitle="What can developers do with Power BI?"
   description="Learn how you can create application that makes use of an embed token so your users can view Power BI content."
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
# Use an embed token when embedding dashboards and reports

Learn how you can create application that makes use of an embed token so your users can view Power BI content.

You can use an embed token with the Power BI REST APIs to embed reports by using a single Power BI user. The embed token is then used with requests made by users in your application to view content within Power BI by way of that single Power BI user. The users within your application do not need to exist within your Power BI organization. The embed token is what makes it possible.

There are a few steps you have to do with your application to make this possible. We will go through the steps needed to allow you to create and use an embed token within your application.  Here is a look at the overall flow for embedding when using an embed token.

![](media\powerbi-developer-using-embed-token\powerbi-embedded-flow.png)

## Step 1: Create a Power BI account

You only need a single Power BI account for use with the embed token. However, there may other users you may want to consider for use within your organization. Let's have a look at the possible users.

The following accounts will need to exist within your tenant and have a license for Power BI.

> [AZURE.NOTE] These accounts will need to have Power BI Pro licenses in order to use App workspaces and to create content that makes use of Pro features such as the On-Premises Data Gateway.

### An organization/tenant admin user

It is recommended that your organization/tenant admin user should not be used as the account your application uses. This is minimize access that the application account has within your organization. It is recommended that the admin user be a member of all App workspaces created for the purpose of embedding.

### Accounts for analysts that will create content

You may have multiple users that create content for Power BI. You may need a Power BI account for each analyst.

### An application *master* user account.

This is the account your application will use when creating the embed token. This is really the only required account you need within your organization. It can also be used as the admin and analyst account, but it is not recommended. The applications backend will store the credentials for this account and use it for acquiring an Azure AD token for use with the Power BI APIs. This account will be used to generate the embed token for the application. You will also want this account to be a member of the App workspaces created for embedding.

## Step 2: App registration and permissions

You will need to register an application within Azure AD and grant permissions to that application for use with Power BI.

### Register an application

You can need to register an application as a native Azure application witn your Azure AD tenant. You can either register your application from the Power BI app registration tool, or directly within the Azure AD portal. For more information, see [Register a client app](powerbi-developer-register-a-client-app.md). Make sure that you select **Native App** for the **App type**.

### Apply permissions to your application

You will need to enable additional permissions to your application in addition to what was provided in app registration page. You can accomplish this through the Azure AD portal, or programmatically.

> [AZURE.NOTE] You will need to perform these steps with an admin account that has access to the Azure portal and to your tenant.

#### Using the Azure AD Portal

1. Browse to the [App registrations blade](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ApplicationsListBlade) within the Azure portal and select the app that you are using for embedding.

    ![](media\powerbi-developer-using-embed-token\powerbi-embedded-azuread-app-permissions01.png)

2. Select **Required permissions** under **API Access**.

    ![](media\powerbi-developer-using-embed-token\powerbi-embedded-azuread-app-permissions02.png)

3. Select **Windows Azure Active Directory** and then make sure **Access the directory as the signed-in user** is selected. Select **Save**.

    ![](media\powerbi-developer-using-embed-token\powerbi-embedded-azuread-app-permissions03.png)

4. Within **Required permissions**, select **Power BI Service (Power BI)**.

    ![](media\powerbi-developer-using-embed-token\powerbi-embedded-azuread-app-permissions05.png)

5. Select all permissions under **Delegated Permissions**. You will need to select them one by one in order to save the selections. Select **Save** when done.

    ![](media\powerbi-developer-using-embed-token\powerbi-embedded-azuread-app-permissions06.png)

6. Within **Required permissions**, select **Grant Permissions**.

    This will give the app permissions on behalf of all users in the tenant/organization. If you don't want this, you will need to sign in internactively with your app ID to Azure AD at least once.

    ![](media\powerbi-developer-using-embed-token\powerbi-embedded-azuread-app-permissions07.png)

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
[Migrate content from the Power BI Embedded Azure service](powerbi-developer-migrate-from-powerbi-embedded.md)  
[JavaScript API Git repo](https://github.com/Microsoft/PowerBI-JavaScript)  
[Power BI C# Git repo](https://github.com/Microsoft/PowerBI-CSharp)  
[JavaScript embed sample](https://microsoft.github.io/PowerBI-JavaScript/demo/)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)