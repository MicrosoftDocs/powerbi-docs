<properties
   pageTitle="Register a client app to embed Power BI content"
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
   ms.date="06/12/2017"
   ms.author="asaxton"/>

# Register a client app to embed Power BI content

Learn how to register an application within Azure Active Directory (Azure AD) for use with embedding Power BI content.

You register your client app with Azure AD to allow your application access to the Power BI REST APIs. This will allow you to establish an identity for your application and specify permissions to Power BI REST resources.

> [AZURE.IMPORTANT] Before you register a Power BI app you need an [Azure Active Directory tenant and an organizational user](powerbi-developer-create-an-azure-active-directory-tenant.md). If you haven't signed up for Power BI with a user in your tenant, the App registration will not complete successfully.

There are two ways to register your client app. The first is with the Power BI App Registration Tool or you can do it directly within the Azure Portal. The Power BI App Registration Tool is the easiest option since there are just a few fields to fill in. If you want to make changes to you app, this can be done through the Azure Portal.

## Register a client app with Power BI App Registration Tool

You need to register your client app in **Azure Active Directory** to establish an identity for your application and specify permissions to Power BI REST resources. When you register a client app, such as a console app, you receive a **Client ID**.  The **Client ID** is used by the application to identify themselves to the users that they are requesting permissions from.

Here's how to register your client app with the Power BI App Registration Tool:

1. Go to [dev.powerbi.com/apps](https://dev.powerbi.com/apps).

2. Select **Sign in with your existing account**.

3. Provide an **App Name**.

4. Select **Native app** from the **App Type** drop down.

5. Enter a value for **Redirect URL**. Any valid URL will work.

6. Choose the APIs that this application will have access to. For more information about Power BI access permissions, see [Power BI Permissions](powerbi-developer-power-bi-permissions.md).

    ![](media/powerbi-developer-register-a-client-app/app-registration-apis.png)

7. Select **Register App**. You will then be provided with a **Client ID**. You can also get the **Client ID** later from the Azure portal. 

You can now use your Client ID for your app.

## Register a client app with Azure portal

Your other option for registering a client application is to do so directly in the Azure portal. To register your application, follow these steps.

1. Accept the [Microsoft Power BI API Terms](https://powerbi.microsoft.com/api-terms).

2. Sign into your Microsoft Azure subscription at [portal.azure.com](https://portal.azure.com).

3. In the left service panel, choose **ACTIVE DIRECTORY**.
4. Click the active directory that you belong to.

  ![](media/powerbi-developer-register-a-client-app/register-app-ad.png)

5. Click **APPLICATIONS**.

    ![](media/powerbi-developer-register-a-client-app/register-app-applications.png)

6. Click **ADD**.

    ![](media/powerbi-developer-register-a-client-app/register-app-add.png)

7. In **Tell us about your application**, enter a **NAME**, and choose **NATIVE CLIENT APPLICATION** for the type, and click **Next** icon..

    ![](media/powerbi-developer-register-a-client-app/register-app-client-app.png)

8. In **Application information**, enter a **REDIRECT URI**. For a client app, a redirect uri gives AAD more details on the specific application that it will authenticate. For a client app, you can use any valid Uri such as https://login.live.com/oauth20_desktop.srf.

9.	Click the **Complete** icon.
10.	In the application page, choose **CONFIGURE**. You will see your **CLIENT ID**.
11.	In the **CONFIGURATION** page, under permissions to other applications, click **Add Application**.

    ![](media/powerbi-developer-register-a-client-app/register-app-add-application.png)

12. In **Permissions to other applications**, choose **Power BI Service**.

    ![](media/powerbi-developer-register-a-client-app/register-app-permissions-to-other-applications.png)

      **Important** If you do not see **Power BI Service** in the **Permissions to other applications** list, you need to sign up for the [Power BI Service](https://www.powerbi.com/). To sign up for the Power BI Service, you need at least one organizational user in your Azure Active Directory (AAD) tenant. If you do not have an Azure Active Directory (AAD) tenant, see [Create an Azure Active Directory tenant](powerbi-developer-create-an-azure-active-directory-tenant.md) to create an Azure AD tenant and an organizational user in your Azure AD tenant.

13. Click **Complete** icon.
14. In the **permissions to other applications** group, choose all **Delegated Permissions**, and chooses one or more permissions. For more information about Power BI permissions, see [Power BI Permissions](powerbi-developer-power-bi-permissions.md).

    ![](media/powerbi-developer-register-a-client-app/register-app-delegated-permissions.png)

15. Click **Save**.

<a name="clientID"></a>
## How to get a client app id
When you register a client app, such as a console app, you receive a **Client ID**.  The **Client ID** is used by the application to identify themselves to the users that they are requesting permissions from.

Here's how to get a client id:

1. Sign into your Microsoft Azure subscription at https://manage.windowsazure.com.
2. In the left service panel, choose **ACTIVE DIRECTORY**.
3. Click the active directory that you belong to.
4. Click **APPLICATIONS**.
5. Choose an application.
6. In the application page, choose **CONFIGURE**.
7. In the **CONFIGURE** page, copy the **CLIENT ID**.

    ![](media/powerbi-developer-register-a-client-app/register-app-clientid.png)

## Next steps

[Embedding with Power BI](powerbi-developer-embedding.md)  
[Embed Power BI content for non-Power BI users](powerbi-developer-using-embed-token.md)  
[Power BI permissions](powerbi-developer-power-bi-permissions.md)  
[Create an Azure Active Directory tenant](powerbi-developer-create-an-azure-active-directory-tenant.md)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)