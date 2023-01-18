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

Service principal is an authentication method that can be used to let an Azure Active Directory (Azure AD) application access Power BI service content and APIs.

When you create an [Azure AD](/azure/active-directory/fundamentals/active-directory-whatis) app, a [service principal object](/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object) is created. The service principal object, also known simply as *service principal*, allows Azure AD to authenticate your app. After it's authenticated, the app can access Azure AD tenant resources.

To authenticate, the service principal uses the Azure AD app's *application ID* and one of the following:

* Certificate
* Application secret

This article describes service principal authentication using an *application ID* and an *application secret*.

>[!NOTE]
>Azure AD recommends that you secure your backend services using certificates, rather than secret keys.
>
>* [Learn more about getting access tokens from Azure AD using secret keys or certificates](/azure/architecture/multitenant-identity/client-assertion).
>* To secure your solution by using a certificate, complete the instructions in this article and then follow the steps described in [Embed Power BI content with service principal and a certificate](embed-service-principal-certificate.md).

## Method

To use service principal and an application ID for embedded analytics, take the following steps, which are described in detail in subsequent sections:

1. Create an [Azure AD app](/azure/active-directory/manage-apps/what-is-application-management).

    1. Create the Azure AD app's secret.
    2. Get the app's *application ID* and *application secret*.

    >[!NOTE]
    >These steps are described in **step 1**. For more information about creating an Azure AD app, see [create an Azure AD app](/azure/active-directory/develop/howto-create-service-principal-portal).

2. Create an Azure AD security group.

3. Enable the Power BI service admin settings.

4. Add the service principal to your workspace.

5. Embed your content.

> [!IMPORTANT]
> An Azure AD application doesn't require you to configure any Delegated Permissions or Application Permissions in the Azure portal when it has been created for a service principal. When you create an Azure AD application for a service principal to access the Power BI REST API, it's recommended that you **avoid adding permissions**. They're never used and can cause errors that are hard to troubleshoot.

## Step 1 - Create an Azure AD app

Create an Azure AD app by using one of these methods:

* [Create the app in the Azure portal](embed-service-principal.md#create-an-azure-ad-app-in-the-azure-portal).

* [Create the app by using PowerShell](embed-service-principal.md#create-an-azure-ad-app-by-using-powershell).

### Create an Azure AD app in the Azure portal

1. Sign in to the [Azure portal](https://ms.portal.azure.com/#allservices).

2. Search for and select **App registrations**.

    ![azure app registration](media/embed-service-principal/azure-app-registration.png)

3. Select **New registration**.

    ![new registration](media/embed-service-principal/new-registration.png)

4. Fill in the required information:
    * **Name** - Enter a name for your application.
    * **Supported account types** - Select supported account types.
    * (Optional) **Redirect URI** - Enter a URI if needed.

5. Select **Register**.

6. After registering, the **Application ID** is available from the **Overview** tab. Copy and save the **Application ID** for later use.

    ![Screenshot shows where to obtain an Application I D in the Overview tab.](media/embed-service-principal/application-id.png)

7. Select the **Certificates & secrets** tab.

     ![A screenshot that shows the certificates and secrets pane for an app in the Azure portal.](media/embed-service-principal/certificates-and-secrets.png)

8. Select **New client secret**

    ![A screenshot that shows the new client secret button in the certificates and secrets pane.](media/embed-service-principal/new-client-secret.png)

9. In the **Add a client secret** window, enter a description, specify when you want the client secret to expire, and select **Add**.

10. Copy and save the **Client secret** value.

    ![A screenshots that shows a blurred out secret value in the certificates and secrets pane.](media/embed-service-principal/client-secret-value.png)

    >[!NOTE]
    >After you leave this window, the client secret value is hidden, and you can't view or copy it again.

### Create an Azure AD app by using PowerShell

The following sample [PowerShell](/powershell/azure/create-azure-service-principal-azureps) script creates a new Azure AD app. Before you run this script, install the [Microsoft Graph PowerShell SDK](/graph/sdks/sdk-installation#install-the-microsoft-graph-powershell-sdk).

```powershell
# Sign in as a user who's allowed to create an app.
Connect-MgGraph -Scopes "Application.ReadWrite.All" 

# Create a new Azure AD web application.
$web = @{
    RedirectUris = "https://localhost:44322"
    HomePageUrl = "https://localhost:44322"
}
$params = @{
    DisplayName = "testApp1"
    Web = $($web)
}
$app = New-MgApplication @params

# Create a service principal.
$ServicePrincipalID=@{
  "AppId" = $($app.AppId)
  }
$sp = New-MgServicePrincipal -BodyParameter $($ServicePrincipalId)

# Create a key for the service principal.
$credential = Add-MgServicePrincipalPassword -ServicePrincipalId $($sp.Id)
Write-Host "Service principal credential: " $($credential.SecretText)
```

## Step 2 - Create an Azure AD security group

Your service principal doesn't have access to any of your Power BI content and APIs. To give the service principal access, create a security group in Azure AD, and add the service principal you created to that security group.

There are two ways to create an Azure AD security group:

* [Manually (in Azure)](embed-service-principal.md#create-a-security-group-manually)
* [By using PowerShell](embed-service-principal.md#create-a-security-group-by-using-powershell)

>[!NOTE]
>If you want to enable service principal access for the entire organization, skip this step.

### Create a security group manually

To create an Azure security group manually, follow the instructions in [create a basic group and add members](/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal#create-a-basic-group-and-add-members).

### Create a security group by using PowerShell

The following sample script creates a new security group and adds a service principal to that security group.

```powershell
# Sign in as an admin.
Connect-MgGraph -Scopes "Application.ReadWrite.All"

# Get the service principal that you created earlier.
$servicePrincipal = Get-MgServicePrincipal -Filter "AppId eq '<app-client-id>'"

# Create an Azure AD security group.
$group = New-MgGroup -DisplayName "securitygroup1" -SecurityEnabled -MailEnabled:$False -MailNickName "notSet"

# Add the service principal to the group.
New-MgGroupMember -GroupId $($group.Id) -DirectoryObjectId $($servicePrincipal.Id)
```

## Step 3 - Enable the Power BI service admin settings

For an Azure AD app to be able to access the Power BI content and APIs, a Power BI admin needs to enable the following settings:

* Embed content in apps.
* Allow service principals to use Power BI APIs.

Go to **Tenant settings** in the [**Admin portal**](../../admin/service-admin-portal.md), and scroll down to **Developer settings**.

* Enable **Embed content in apps** either for the entire organization or for the specific security group you created in Azure AD.

  :::image type="content" source="./media/embed-service-principal/admin-portal-embed-content-in-apps.png" alt-text="Screenshot showing the developer settings in the admin options embedding content in apps.":::

* Enable **Allow service principals to use Power BI APIs** either for the entire organization or for the specific security group you created in Azure AD.

  >[!div class="mx-imgBorder"]
  >:::image type="content" source="media/embed-service-principal/admin-portal-allow-apis.png" alt-text="Screenshot showing the developer settings in the admin options in Power B I service.":::

  >[!IMPORTANT]
  >Service principals have access to any tenant settings they're enabled for. Depending on your admin settings, this includes specific security groups or the entire organization.
  >
  >To restrict service principal access to specific tenant settings, allow access only to specific security groups. Alternatively, you can create a dedicated security group for service principals, and exclude it from the desired tenant settings.

## Step 4 - Add the service principal to your workspace

To enable your Azure AD app to access items such as reports, dashboards, and datasets in the Power BI service, add the service principal entity, or the security group that includes your service principal, as a member or admin to your workspace.

>[!NOTE]
>This section provides UI instructions. You can also use the [Groups - add group user API](/rest/api/power-bi/groups/addgroupuser) to add a service principal or a security group to a workspace.

1. Scroll to the workspace you want to enable access for. From the **More** menu, select **Workspace access**.

    :::image type="content" source="media/embed-service-principal/workspace-access.png" alt-text="Screenshot showing the workspace access button in the more menu of a Power BI workspace.":::

2. In the **Access** pane box, add one of the following:

    * Your **service principal**. The name of your service principal is the **Display name** of your Azure AD app, as it appears in your Azure AD app's overview tab.

    * The **security group** that includes your service principal.

3. From the drop-down menu, select **Member** or **Admin**.

4. Select **Add**.

### Add a service principal as a workspace member by using PowerShell

This section includes a sample script to add a service principal as a workspace member by using [PowerShell](/powershell/azure/create-azure-service-principal-azureps).

```powershell
# Sign in to Power BI.
Login-PowerBI

# Set up the service principal ID.
$SPObjectId = "<service-principal-ID>"

# Get the workspace.
$pbiWorkspace = Get-PowerBIWorkspace -Filter "name eq '<workspace-name>'"

# Add the service principal to the workspace.
Add-PowerBIWorkspaceUser -Id $($pbiWorkspace.Id) -AccessRight Member -PrincipalType App -Identifier $($SPObjectId)

```

### Add a security group as a workspace member by using PowerShell

This section includes a sample script to add a security group as a workspace member by using [PowerShell](/powershell/azure/create-azure-service-principal-azureps).

```powershell
# Sign in to Power BI.
Login-PowerBI

# Set up the security group object ID.
$SGObjectId = "<security-group-object-ID>"

# Get the workspace.
$pbiWorkspace = Get-PowerBIWorkspace -Filter "name eq '<workspace-name>'"

# Add the security group to the workspace.
Add-PowerBIWorkspaceUser -Id $($pbiWorkspace.Id) -AccessRight Member -PrincipalType Group -Identifier $($SGObjectId)
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
* Power BI admin rights are required to enable service principal in developer settings within the Power BI admin portal.
* [Embed for your organization](embed-sample-for-your-organization.md) applications can't use service principal.
* [Dataflows](../../transform-model/dataflows/dataflows-introduction-self-service.md) management is not supported.
* Service principal only supports some read-only admin APIs. To enable service principal support for read-only admin APIs, you have to enable the Power BI service admin settings in your tenant. For more information, see [Enable service principal authentication for read-only admin APIs](../../enterprise/read-only-apis-service-principal-authentication.md).
* When using service principal with an [Azure Analysis Services](/azure/analysis-services/analysis-services-overview) data source, the service principal itself must have an Azure Analysis Services instance permissions. Using a security group that contains the service principal for this purpose doesn't work.

## Next steps

* [Register an app](register-app.md)
* [Power BI Embedded for your customers](embed-sample-for-customers.md)
* [Application and service principal objects in Azure Active Directory](/azure/active-directory/develop/app-objects-and-service-principals)
