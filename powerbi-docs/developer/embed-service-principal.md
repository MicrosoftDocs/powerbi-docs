---
title: Register an Azure AD app using service principal to embed Power BI content
description: Learn how to register an application within Azure Active Directory using service principal for use with embedding Power BI content.
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: ""
ms.component: power-bi-developer
ms.topic: conceptual
ms.custom: ""
ms.date: 01/31/2018
---

# Service principal for use with Power BI embedded analytics (Preview)

To access resources that secure an Azure AD tenant, the entity that requires access represents a security principal. This action holds true for both users (user principal) and applications (service principal).

A security principal defines the access policy and permissions for users and applications in the Azure AD tenant. This access policy enables core features such as authentication of users and applications during sign-in, and authorization during resource access. For more information, reference [service principal object](https://docs.microsoft.com/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object)

**Power BI APIs** and **Power BI .NET SDK** now support calls using service principal.

## Application and service principal relationship

Consider the application object as the *global* representation of your application for use across all tenants, and the service principal as the *local* representation for use in a specific tenant.

The application object serves as the template from which common and default properties are *derived* for use in creating corresponding service principal objects.

A service principal must be created in each tenant where the application is used, enabling it to establish an identity for sign-in and/or access to resources being secured by the tenant. A single-tenant application has only one service principal (in its home tenant), created and consented for use during application registration.

## Application registration

When you [register an Azure AD application](register-app.md) in the Azure portal, two objects are created in your Azure AD tenant:

- An application object
- A [service principal object]((https://docs.microsoft.com/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object))

Service principal doesn't allow multi-tenant applications. You can't import or export an application using service principal in Azure.

## Service principal with Power BI Embedded

With service principal, you can mask your account information in your application by using an application ID (app ID) and an application secret (app secret). You don't have to hard-code a master user account into your application to authenticate.

You can generate an [embed token](https://docs.microsoft.com/rest/api/power-bi/embedtoken) using service principal.

If your Azure tenant settings have **[multi-factor authentication (MFA)](https://docs.microsoft.com/azure/active-directory/authentication/concept-mfa-howitworks)** enabled then it is recommended to use a service prinipal token to authenticate, as a master account does not allow you to authenticate your Power BI Embedded application.

Using service principal allows you to make changes to workspaces such as create workspaces and add or remove users from workspaces. You can also import reports into workspaces using the service principal.

You can only use a service principal if your Power BI artifacts and resources are stored in a [Power BI new version workspace](../service-create-the-new-workspaces.md).

## Service principal vs. Power BI Pro account

There are differences between using a service principal token versus a standard Power BI Pro login (master) account for authenticating into your Power BI Embedded application.

The main difference between using service principal over a master account is that service principal can't be used to sign in to the Power BI service. It isn't required, but we recommend that you have a master account to view your Power BI resources and to troubleshoot your resources in the Power BI service.

You can only use service principal if your Power BI artifacts and resources are stored in the [new Power BI app workspace](../service-create-the-new-workspaces.md). However, when using a master account you can use either versions of a workspace.

You can't install an **On-premises data gateway** using just a service principal. Installing an On-premises data gateway still requires a Power BI account. However, you can edit the credentials of the gateway using the service principal.

A service principal can't be used to sign in to the Power BI service.

## Get started with service principal

### Azure portal

1. Create an application in Azure

    ![New app registration in Azure](media/embed-service-principal/new-app-reg.png)

    ![Create new app](media/embed-service-principal/new-app-create.png)

    ![New app](media/embed-service-principal/new-app.png)

2. Create nn application secret

    ![Create an app secret](media/embed-service-principal/app-secret-create.png)

    ![App secret](media/embed-service-principal/app-secret.png)

3. A Power BI admin needs to login to the Power BI admin portal and allow the application (service principal) to have access to Power BI

    ![Power BI admin portal](media/embed-service-principal/admin-portal.png)

4. Through the Rest APIs import Power BI content into the Workspace (V2)

    Need code here?

5. In your application, authenticate via service principle (application ID and application secret)

    Application code

### Powershell

1. Open Powershell as an administrator

2. Install the Azure AD module

    ```powershell
    Install-Module -Name AzureAD
    ```
3. Then run the command *Set-ExecutionPolicy -ExecutionPolicy Bypass*

    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy Bypass
    ```
4. Run Powershell script

    ```powershell
    param (
    [string]$applicationName
    )

    # Login to Azure and be able to use the app cmdlets
    Connect-AzureAD
    Login-AzureRmAccount

    # Create a new AAD web application
    $App = New-AzureADApplication -DisplayName $applicationName -Homepage "https://localhost:44322" -ReplyUrls "https://localhost:44322"

    # Add service principal to the application (only for allowed users)
    New-AzureRmADServicePrincipal -ApplicationId $App.AppId
    ```

    > [!Note]
    > Once you exit out of the blade, it is not visible any more so save it. However, if you forget to save it, then you can just craete a new one.

## Migrate from master account to service principal

You can migrate to service principal if you're currently using a master account.  If you currently using Power BI Workspace Collections using service principal is recommended when migrating to Power BI Embedded.

## Considerations and limitations

- Only works with the [new app workspaces](../service-create-the-new-workspaces.md).
- The **My Workspace** isn't supported.
- Dedicated capacity is required when moving to production.
- A Power BI Pro license is not required.
- Doesn't support multi-tenant applications.
- Can't install an on-premises data gateway
- Can't be an on-premises data gateway admin.
- Can't sign into the Power BI portal.
- Can't import or export applications.

## Next steps

- [Register an app](register-app.md)
- [Power BI Embedded for your customers](embed-sample-for-customers.md)
- [Application and service principal objects in Azure Active Directory](https://docs.microsoft.com/azure/active-directory/develop/app-objects-and-service-principals)
