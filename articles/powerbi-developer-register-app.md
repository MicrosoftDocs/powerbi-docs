<properties
   pageTitle="Register an app to embed Power BI content"
   description="Learn how to register an application within Azure Active Directory for use with embedding Power BI content."
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
   ms.date="07/07/2017"
   ms.author="asaxton"/>

# Register an app to embed Power BI content

Learn how to register an application within Azure Active Directory (Azure AD) for use with embedding Power BI content.

You register your application with Azure AD to allow your application access to the Power BI REST APIs. This will allow you to establish an identity for your application and specify permissions to Power BI REST resources.

> [AZURE.IMPORTANT] Before you register a Power BI app you need an [Azure Active Directory tenant and an organizational user](powerbi-developer-create-an-azure-active-directory-tenant.md). If you haven't signed up for Power BI with a user in your tenant, the App registration will not complete successfully.

There are two ways to register your application. The first is with the [Power BI App Registration Tool](https://dev.powerbi.com/apps/) or you can do it directly within the Azure Portal. The Power BI App Registration Tool is the easiest option since there are just a few fields to fill in. If you want to make changes to your app, this can be done through the Azure Portal.

## Register with the Power BI App Registration Tool

You need to register your application in **Azure Active Directory** to establish an identity for your application and specify permissions to Power BI REST resources. When you register an application, such as a console app or a web site, you receive an identifier which is used by the application to identify themselves to the users that they are requesting permissions from.

Here's how to register your application with the Power BI App Registration Tool:

1. Go to [dev.powerbi.com/apps](https://dev.powerbi.com/apps).

2. Select **Sign in with your existing account**.

3. Provide an **App Name**.

4. The App type selection will depend on the type of application you are using.

    * Use **Server-side Web app** for web apps or web APIs.
    * Use **Native app** for apps that run on client devices. *You will also choose **Native app** if you are embedding content for non-Power BI users (app owns data) regardless of what the actual application is.*

5. Enter a value for **Redirect URL** and **Home Page URL**. Any valid URL will work.

    > [AZURE.NOTE] **Home Page URL** is only available if you choose **Server-side Web app** for the applciation type.

6. Choose the APIs that this application will have access to. For more information about Power BI access permissions, see [Power BI Permissions](powerbi-developer-power-bi-permissions.md).

    ![](media/powerbi-developer-register-app/app-registration-apis.png)

7. Select **Register App**.

    You will then be provided with a **Client ID**. If you selected **Server-side Web app**, you will also receive a **Client Secret**. The **Client ID** can be retrieved from the Azure portal, at a later time, if needed. If you lost the **Client Secret**, you will need to create a new one within the Azure portal.

You can now used the registered application as part of your custom application to interact with the Power BI service.

> [AZURE.NOTE] If you are embedding content for non-Power BI users (app owns data), you will need to configure additional permissions within 

## Register with the Azure portal

Your other option for registering your application is to do so directly in the Azure portal. To register your application, follow these steps.

1. Accept the [Microsoft Power BI API Terms](https://powerbi.microsoft.com/api-terms).

2. Sign into the [Azure portal](https://portal.azure.com).

3. Choose your Azure AD tenant by selecting your account in the top right corner of the page.

4. In the left-hand navigation pane, choose **More Services**, select **App Registrations**, and select **New application registration**.

    ![](media/powerbi-developer-register-app/azuread-new-app-registration.png)

5. Follow the prompts and create a new application.

    * For Web Applications, provide the Sign-On URL, which is the base URL of your app, where users can sign in e.g http://localhost:12345.
    * For Native Applications, provide a Redirect URI, which Azure AD uses to return token responses. Enter a value specific to your application, .e.g http://MyFirstAADApp

For more information about how to register applications in Azure Active Directory, see [Integrating applications with Azure Active Directory](https://docs.microsoft.com/azure/active-directory/develop/active-directory-integrating-applications)

## How to get the client id

When you register an application, you receive a **Client ID**.  The **Client ID** is used by the application to identify themselves to the users that they are requesting permissions from.

Here's how to get a client id:

1. Sign into the [Azure portal](https://portal.azure.com).

2. Choose your Azure AD tenant by selecting your account in the top right corner of the page.

3. In the left-hand navigation pane, choose **More Services** and select **App Registrations**.

4. Select the application that you want to retrieve the client id for.

5. You will see **Application ID** listed with a GUID. This is the client id for the application.

## Apply permissions to your application

> [AZURE.IMPORTANT] This section only applies to applications that are embedding content for non-Power BI users (app owns data).

You will need to enable additional permissions to your application in addition to what was provided in app registration page. You can accomplish this through the Azure AD portal, or programmatically.

You will want to perform these steps with a tenant/organization admin. This would be a user in the Global admin role.

### Using the Azure AD Portal

1. Browse to the [App registrations blade](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ApplicationsListBlade) within the Azure portal and select the app that you are using for embedding.

    ![](media/powerbi-developer-register-app/powerbi-embedded-azuread-registered-apps.png)

2. Select **Required permissions** under **API Access**.

    ![](media/powerbi-developer-register-app/powerbi-embedded-azuread-app-required-permissions.png)

3. Select **Windows Azure Active Directory** and then make sure **Access the directory as the signed-in user** is selected. Select **Save**.

    ![](media/powerbi-developer-register-app/powerbi-embedded-azuread-app-permissions01.png)

4. Within **Required permissions**, select **Power BI Service (Power BI)**.

    ![](media/powerbi-developer-register-app/powerbi-embedded-azuread-app-permissions03.png)

    > [AZURE.NOTE] If you created the app directly in the Azure AD portal, **Power BI Servcie (Power BI)** may not be present. If it is not, select **+ Add** and then **1 Select and API**. Select **Power BI Service** in the API list and select **Select**. You can then continue to step 5.

5. Select all permissions under **Delegated Permissions**. You will need to select them one by one in order to save the selections. Select **Save** when done.

    ![](media/powerbi-developer-register-app/powerbi-embedded-azuread-app-permissions04.png)

6. Within **Required permissions**, select **Grant Permissions**.

    > [AZURE.NOTE] The **Grant Permissions** action is needed for the *master account* to avoid being prompted for concent by Azure AD. If the account performing this action is a Global Admin, you will grant permissions to all users within your organization for this application. If the account performing this action is the *master account* and is not a Global Admin, you will grant permissions only to the *master account* for this application.

    ![](media/powerbi-developer-register-app/powerbi-embedded-azuread-app-grant-permissions.png)

### Applying permissions programmatically

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

    > [AZURE.NOTE] The **Grant Permissions** action is needed for the *master account* to avoid being prompted for concent by Azure AD. If the account performing this action is a Global Admin, you will grant permissions to all users within your organization for this application. If the account performing this action is the *master account* and is not a Global Admin, you will grant permissions only to the *master account* for this application.

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

    If you are using an existing tenant, and not interested in granting permissions on behalf of all tenant users, you can grant permissions to a specific user by replacing the value of **contentType**.
    

## Next steps

[Embedding with Power BI](powerbi-developer-embedding.md)  
[How to embed your Power BI dashboards, reports and tiles](powerbi-developer-embedding-content.md)  
[Power BI permissions](powerbi-developer-power-bi-permissions.md)  
[Create an Azure Active Directory tenant](powerbi-developer-create-an-azure-active-directory-tenant.md)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)