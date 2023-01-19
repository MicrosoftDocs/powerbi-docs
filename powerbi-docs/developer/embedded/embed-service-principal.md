---
title: Embed Power BI content in an embedded analytics application with service principal and an application secret
description: Learn how to authenticate for embedded analytics by using an Azure Active Directory application service principal and an application secret.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.custom: ""
ms.date: 01/19/2023
---

# Embed Power BI content with service principal and an application secret

Service principal is an authentication method that can be used to let an [Azure Active Directory (Azure AD)](/azure/active-directory/fundamentals/active-directory-whatis) application access Power BI service content and APIs.

When you create an Azure AD app, a [service principal object](/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object) is created. The service principal object, also known simply as *service principal*, allows Azure AD to authenticate your app. After it's authenticated, the app can access Azure AD tenant resources.

To authenticate, the service principal uses the Azure AD app's *application ID* and one of the following:

* A certificate
* An application secret

This article describes service principal authentication using an *application ID* and an *application secret*.

>[!NOTE]
>We recommend that you secure your back-end services by using certificates, rather than secret keys.
>
>* [Learn more about getting access tokens from Azure AD using secret keys or certificates](/azure/architecture/multitenant-identity/client-assertion).
>* To secure your solution by using a certificate, complete the instructions in this article and then follow the steps described in [Embed Power BI content with service principal and a certificate](embed-service-principal-certificate.md).

## Method

To use service principal and an application ID for embedded analytics, you take the following steps. Subsequent sections describe these steps in detail.

1. Create an [Azure AD app](/azure/active-directory/manage-apps/what-is-application-management).

    1. Create a secret for your Azure AD app.
    1. Get the app's *application ID* and *application secret*.

    >[!NOTE]
    >These steps are described in **step 1**. For more information about creating an Azure AD app, see [create an Azure AD app](/azure/active-directory/develop/howto-create-service-principal-portal).

1. Create an Azure AD security group.

1. Enable the Power BI service admin settings.

1. Add the service principal to your workspace.

1. Embed your content.

> [!IMPORTANT]
> An Azure AD application doesn't require you to configure any delegated permissions or application permissions in the Azure portal when it has been created for a service principal. When you create an Azure AD application for a service principal to access the Power BI REST API, we recommended that you **avoid adding permissions**. They're never used and can cause errors that are hard to troubleshoot.

## Step 1 - Create an Azure AD app

Create an Azure AD app by using one of these methods:

* [Create the app in the Azure portal](embed-service-principal.md#create-an-azure-ad-app-in-the-azure-portal).
* [Create the app by using PowerShell](embed-service-principal.md#create-an-azure-ad-app-by-using-powershell).

### Create an Azure AD app in the Azure portal

1. Sign in to the [Azure portal](https://ms.portal.azure.com/#allservices).

1. Search for and select **App registrations**.

   :::image type="content" source="media/embed-service-principal/azure-app-registration.png" alt-text="Screenshot of the Azure portal, with app registration in the search box. That box and the App registrations icon are highlighted.":::

1. Select **New registration**.

   :::image type="content" source="media/embed-service-principal/new-registration.png" alt-text="Screenshot of the App registrations page in the Azure portal. New registration is highlighted.":::

1. Fill in the required information:

   * **Name** - Enter a name for your application.
   * **Supported account types** - Select supported account types.
   * (Optional) **Redirect URI** - Enter a URI if needed.

1. Select **Register**.

1. After you register your app, the **Application ID** is available from the **Overview** tab. Copy and save the **Application ID** for later use.

   :::image type="content" source="media/embed-service-principal/application-id.png" alt-text="Screenshot of the Overview page of the new app. The Application ID is indecipherable and is highlighted.":::

1. Select **Certificates & secrets**.

   :::image type="content" source="media/embed-service-principal/certificates-and-secrets.png" alt-text="Screenshot of the Overview page of the new app. On the navigation pane, Certificates & secrets is highlighted.":::

1. Select **New client secret**.

   :::image type="content" source="media/embed-service-principal/new-client-secret.png" alt-text="Screenshot that shows part of the Certificates & secrets page for the app. Under Client secrets, the New client secret button is highlighted.":::

1. In the **Add a client secret** window, enter a description, specify when you want the client secret to expire, and select **Add**.

1. Copy and save the client secret value.

   :::image type="content" source="media/embed-service-principal/client-secret-value.png" alt-text="Screenshot of the Certificates & secrets page for the app. Under Client secrets, a new secret is visible. Its indecipherable value is highlighted.":::

   >[!NOTE]
   >After you leave this window, the client secret value is hidden, and you can't view or copy it again.

### Create an Azure AD app by using PowerShell

The following sample [PowerShell](/powershell/azure/create-azure-service-principal-azureps) script creates a new Azure AD app and a service principal. Before you run this script:

- Install the [latest version of PowerShell](/powershell/scripting/install/installing-powershell-on-windows).
- Install the [Microsoft Graph PowerShell SDK](/graph/sdks/sdk-installation#install-the-microsoft-graph-powershell-sdk).

After the script runs, make a note of the following information in the script output:

- The client ID of the new app
- The object ID of the new service principal
- The value of the service principal secret

```powershell
# Sign in as a user who's allowed to create an app.
Connect-MgGraph -Scopes "Application.ReadWrite.All" 

# Create a new Azure AD web application.
$web = @{
    RedirectUris = "https://localhost:44322"
    HomePageUrl = "https://localhost:44322"
}
$params = @{
    DisplayName = "myAzureADApp"
    Web = $($web)
}
$app = New-MgApplication @params
Write-Host "Client ID of new app: " $($app.AppId)

# Create a service principal.
$ServicePrincipalID=@{
  "AppId" = $($app.AppId)
  }
$sp = New-MgServicePrincipal -BodyParameter $($ServicePrincipalId)
Write-Host "Object ID of new service principal: " $($sp.Id)

# Create a key for the service principal.
$credential = Add-MgServicePrincipalPassword -ServicePrincipalId $($sp.Id)
Write-Host "Credential of new service principal: " $($credential.SecretText)
```

## Step 2 - Create an Azure AD security group

Your service principal doesn't have access to any of your Power BI content and APIs. To give the service principal access, create a security group in Azure AD. Then add the service principal you created to that security group.

>[!NOTE]
>If you want to enable service principal access for the entire organization, skip this step.

There are two ways to create an Azure AD security group:

* [Manually (in Azure)](embed-service-principal.md#create-a-security-group-manually)
* [By using PowerShell](embed-service-principal.md#create-a-security-group-by-using-powershell)

### Create a security group manually

To create an Azure security group manually, follow the instructions in [create a basic group and add members](/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal#create-a-basic-group-and-add-members).

### Create a security group by using PowerShell

The following sample script creates a new security group. It also adds the service principal that you created earlier to the new security group.

- Before you run the script, replace `<app-client-ID>` with the client ID that you recorded earlier for your new app.
- After you run the script, make a note of the object ID of the new security group, which you can find in the script output.

```powershell
# Sign in as an admin.
Connect-MgGraph -Scopes "Application.ReadWrite.All"

# Get the service principal that you created earlier.
$servicePrincipal = Get-MgServicePrincipal -Filter "AppId eq '<app-client-ID>'"

# Create an Azure AD security group.
$group = New-MgGroup -DisplayName "securitygroup1" -SecurityEnabled -MailEnabled:$False -MailNickName "notSet"
Write-Host "Object ID of new security group: " $($group.Id)

# Add the service principal to the group.
New-MgGroupMember -GroupId $($group.Id) -DirectoryObjectId $($servicePrincipal.Id)
```

## Step 3 - Enable the Power BI service admin settings

For an Azure AD app to access the Power BI content and APIs, a Power BI admin needs to enable the following settings:

* Embed content in apps
* Allow service principals to use Power BI APIs

In the [**Power BI Admin portal**](../../admin/service-admin-portal.md), go to **Tenant settings**, and scroll down to **Developer settings**.

* Enable **Embed content in apps** either for the entire organization or for the specific security group you created in Azure AD.

  :::image type="content" source="./media/embed-service-principal/admin-portal-embed-content-in-apps.png" alt-text="Screenshot of the Developer settings in the Tenant settings section of the Admin portal. The option for embedding content in apps is turned on.":::

* Enable **Allow service principals to use Power BI APIs** either for the entire organization or for the specific security group you created in Azure AD.

  :::image type="content" source="media/embed-service-principal/admin-portal-allow-apis.png" alt-text="Screenshot of the Developer settings section. The option for allowing service principals to use Power BI APIs is turned on for one security group.":::

  >[!IMPORTANT]
  >Service principals have access to any tenant settings they're enabled for. Depending on your admin settings, this includes specific security groups or the entire organization.
  >
  >To restrict service principal access to specific tenant settings, allow access only to specific security groups. Alternatively, you can create a dedicated security group for service principals, and exclude it from the desired tenant settings.

## Step 4 - Add the service principal to your workspace

Your Azure AD app can access your Power BI reports, dashboards, and datasets only when it has access to your Power BI workspace. You provide that access by adding the app's service principal or its security group to your workspace as a member or admin.

There are three ways to add a service principal or its security group to your workspace:

- [Manually](#add-a-service-principal-or-security-group-manually)
- [Use PowerShell](#add-a-service-principal-or-security-group-by-using-powershell)
- Use the [Groups - add group user API](/rest/api/power-bi/groups/addgroupuser)

### Add a service principal or security group manually

1. In the Power BI service, scroll to the workspace you want to enable access for. From its **More** menu, select **Workspace access**.

   :::image type="content" source="media/embed-service-principal/workspace-access.png" alt-text="Screenshot that shows the expanded More menu for a workspace. On that menu, Workspace access is highlighted.":::

1. In the **Access** pane, under **Add admins, members, or contributors**, add one of the following:

    * Your **service principal**. The name of your service principal is the **Display name** of your Azure AD app, as it appears in your Azure AD app's overview tab.
    * The **security group** that includes your service principal.

1. On the dropdown menu, select **Member** or **Admin**.

1. Select **Add**.

### Add a service principal or security group by using PowerShell

The following sections provide sample [PowerShell](/powershell/azure/create-azure-service-principal-azureps) scripts for adding a service principal and a security group to a Power BI workspace as a member.

#### Add a service principal as a workspace member by using PowerShell

The following script adds a service principal as a workspace member. Before you run the script:

- Replace `<service-principal-object-ID>` with the object ID that you recorded earlier for your new service principal.
- Replace `<workspace-name>` with the name of the workspace that you'd like to give the service principal access to.

```powershell
# Sign in to Power BI.
Login-PowerBI

# Set up the service principal ID.
$SPObjectID = "<service-principal-object-ID>"

# Get the workspace.
$pbiWorkspace = Get-PowerBIWorkspace -Filter "name eq '<workspace-name>'"

# Add the service principal to the workspace.
Add-PowerBIWorkspaceUser -Id $($pbiWorkspace.Id) -AccessRight Member -PrincipalType App -Identifier $($SPObjectID)

```

#### Add a security group as a workspace member by using PowerShell

The following script adds a security group as a workspace member. Before you run the script:

- Replace `<security-group-object-ID>` with the object ID that you recorded earlier for your new security group.
- Replace `<workspace-name>` with the name of the workspace that you'd like to give the security group access to.

```powershell
# Sign in to Power BI.
Login-PowerBI

# Set up the security group object ID.
$SGObjectID = "<security-group-object-ID>"

# Get the workspace.
$pbiWorkspace = Get-PowerBIWorkspace -Filter "name eq '<workspace-name>'"

# Add the security group to the workspace.
Add-PowerBIWorkspaceUser -Id $($pbiWorkspace.Id) -AccessRight Member -PrincipalType Group -Identifier $($SGObjectID)
```

## Step 5 - Embed your content

You can [embed your content within a sample application](embed-sample-for-customers.md), or within your own application.

After your content is embedded, you're ready to [move to production](move-to-production.md).

>[!NOTE]
>To secure your content by using a certificate, follow the steps described in [Embed Power BI content with service principal and a certificate](embed-service-principal-certificate.md).

## Considerations and limitations

* **My Workspace** isn't supported when using service principal.
* A capacity is required when moving to production.
* You can't sign in to the Power BI portal by using service principal.
* Power BI admin rights are required to enable service principal in developer settings within the Power BI Admin portal.
* [Embed for your organization](embed-sample-for-your-organization.md) applications can't use service principal.
* [Dataflows](../../transform-model/dataflows/dataflows-introduction-self-service.md) management isn't supported.
* Service principal only supports some read-only admin APIs. To enable service principal support for read-only admin APIs, you have to enable the Power BI service admin settings in your tenant. For more information, see [Enable service principal authentication for read-only admin APIs](../../enterprise/read-only-apis-service-principal-authentication.md).
* When you use service principal with an [Azure Analysis Services](/azure/analysis-services/analysis-services-overview) data source, the service principal itself must have Azure Analysis Services instance permissions. Using a security group that contains the service principal for this purpose doesn't work.

## Next steps

* [Register an app](register-app.md)
* [Power BI Embedded for your customers](embed-sample-for-customers.md)
* [Application and service principal objects in Azure Active Directory](/azure/active-directory/develop/app-objects-and-service-principals)
