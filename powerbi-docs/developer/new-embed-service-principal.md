---
title: Service principal with Power BI
description: Learn how to register an application within Azure Active Directory using service principal for use with embedding Power BI content.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: nishalit
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.custom: ""
ms.date: 12/12/2019
---

# Service principal with Power BI

Service principal is an authentication method that can be used to let an Azure AD application access the Power BI portal programmatically.

When you create an Azure Active Directory (Azure AD) app, a [service principal object](https://docs.microsoft.com/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object) is created. The service principal object, also known simply as *service principal*, allows Azure AD to authenticate your app. Once authenticated, the app can access Azure AD tenant resources.

To authenticate, service principal uses your app's *Application ID* and *Application secret*. This authentication method doesn't require a master user.

To use the service principal with embedded analytics, you follow these three steps:

1. [Create an Azure AD app](#Step-1---Create-an-Azure-AD-app) and get the app's *Application ID* and *Application secret*.

2. [Create an Azure AD security group](#Step-2---Create-an-Azure-AD-security-group).

3. [Enable the Power BI service admin settings](#Step-3---Enable-the-Power-BI-service-admin-settings).

> [!IMPORTANT]
> Once you enable service principal to be used with Power BI, the application's AD permissions don't take effect anymore. The application's permissions are then managed through the Power BI admin portal.

## Step 1 - Create an Azure AD app

Create an Azure AD app using one of these methods:
* Create the app in the [Microsoft Azure portal]((https://ms.portal.azure.com/#allservices))
* Create the app in using [PowerShell](https://docs.microsoft.com/powershell/azure/create-azure-service-principal-azureps?view=azps-3.6.1).

### Creating an app in the Microsoft Azure portal

1. Log into [Microsoft Azure](https://ms.portal.azure.com/#allservices).

2. Search for **App registrations**.

3. Click the **App registrations** link.

    ![Azure app registration](media/embed-service-principal/azure-app-registration.png)

4. Click **New registration**.

    ![Azure app registration](media/embed-service-principal/new-registration.png)

5. Fill in the required information:
    * **Name** - Enter a name for your application
    * **Supported account types** - Select who can access the app
    * (Optional) **Redirect URI** - Enter a URI if needed

6. Click **Register**.

7. After registering, the *Application ID* is available from the **Overview** tab. Copy and save the *Application ID* for later use.

8. Click the **Certificates & secrets** tab.

9. 

### Creating an app using PowerShell

Below is a sample script to create a new Azure Active Directory application using [PowerShell](https://docs.microsoft.com/powershell/azure/create-azure-service-principal-azureps?view=azps-1.1.0).

```powershell
# The app ID - $app.appid
# The service principal object ID - $sp.objectId
# The app key - $key.value

# Sign in as a user that is allowed to create an app.
Connect-AzureAD

# Create a new Azure AD web application
$app = New-AzureADApplication -DisplayName "testApp1" -Homepage "https://localhost:44322" -ReplyUrls "https://localhost:44322"

# Creates a service principal
$sp = New-AzureADServicePrincipal -AppId $app.AppId

# Get the service principal key.
$key = New-AzureADServicePrincipalPasswordCredential -ObjectId $sp.ObjectId
```

## Step 2 - Create an Azure AD security group

Create a security group in Azure Active Directory (AAD), and add the [application](https://docs.microsoft.com/azure/active-directory/develop/app-objects-and-service-principals) you created to that security group.

Below is a sample script to create a new security group and add an application to that security group.

```powershell
# Required to sign in as a tenant admin
Connect-AzureAD

# Create an AAD security group
$group = New-AzureADGroup -DisplayName <Group display name> -SecurityEnabled $true -MailEnabled $false -MailNickName notSet

# Add the service principal to the group
Add-AzureADGroupMember -ObjectId $($group.ObjectId) -RefObjectId $($sp.ObjectId)
    ```
## Step 3 - Enable the Power BI service admin settings

3. As a Power BI admin, you need to enable service principal in the **Developer settings** in the Power BI admin portal. Add the security group that you created in Azure AD to the specific security group section in the **Developer settings**. You can also enable service principal access for the entire organization. In that case, step 2 is not needed.

   > [!Important]
   > Service principals have access to any tenant settings that are enabled for the entire organization or enabled for security groups that have service principals as a part of the group. To restrict service principal access to specific tenant settings, allow access only to specific security groups, or create a dedicated security group for service principals and exclude it.

    ![Admin portal](media/embed-service-principal/admin-portal.png)

4. Set up your [Power BI environment](embed-sample-for-customers.md#set-up-your-power-bi-environment).

    ![Add a service principal as an admin to a workspace](media/embed-service-principal/add-service-principal-in-the-UI.png)

## Example of using the API

Add to workspace...

1. Now choose to embed your content within a sample application, or within your own application.

    * [Embed content using the sample application](embed-sample-for-customers.md#embed-content-using-the-sample-application)
    * [Embed content within your application](embed-sample-for-customers.md#embed-content-within-your-application)

2. Now you're ready to [move to production](embed-sample-for-customers.md#move-to-production).

## Considerations and limitations

* Service principal only works with [new workspaces](../service-create-the-new-workspaces.md).
* **My Workspace** isn't supported when using service principal.
* Dedicated capacity is required when moving to production.
* You can't sign into the Power BI portal using service principal.
* Power BI admin rights are required to enable service principal in developer settings within the Power BI admin portal.
* You can't install or manage an on-premises data gateway using service principal.
* [Embed for your organization](embed-sample-for-your-organization.md) applications are unable to use service principal.
* [Dataflows](../service-dataflows-overview.md) management is not supported.
* Service principal currently does not support any admin APIs.
* When using service principal with an [Azure Analysis Services](https://docs.microsoft.com/azure/analysis-services/analysis-services-overview) data source, the service principal itself must have an Azure Analysis Services instance permissions. Using a security group that contains the service principal for this purpose, doesn't work.

## Next steps

* [Register an app](register-app.md)
* [Power BI Embedded for your customers](embed-sample-for-customers.md)
* [Application and service principal objects in Azure Active Directory](https://docs.microsoft.com/azure/active-directory/develop/app-objects-and-service-principals)
* [Row-level security using on-premises data gateway with service principal](embedded-row-level-security.md#on-premises-data-gateway-with-service-principal)
