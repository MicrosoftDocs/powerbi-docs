---
title: Register a Power BI Embedded app
description: Set up Power BI Embedded to register a Microsoft Entra app, create a workspace, import content, grant permissions.
author: billmath
ms.author: billmath
ms.date: 02/02/2025
ms.topic: how-to
ms.service: powerbi
ms.subservice: powerbi-developer
ms.custom: intro-overview
#customer intent: As a developer, I want to learn how to set up Power BI Embedded so that I can share my reports with others.
---

# Set up Power BI Embedded

**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::&nbsp;App&nbsp;owns&nbsp;data :::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::&nbsp;User&nbsp;owns&nbsp;data

This article shows you how to start using Power BI Embedded to share your reports with others. To use Power BI embedded analytics, you need to register a Microsoft Entra application in Azure. The Microsoft Entra app establishes permissions for Power BI REST resources, and allows access to the [Power BI REST APIs](/rest/api/power-bi/).

> [!TIP]
> You can try out Power BI Embedded without registering an app. Check out the [Power BI embedded analytics playground](./power-bi-playground.md) to get started developing and to keep up with all the new Power BI Embedded features and updates.

## Prerequisite

To set up a Power BI embedded analytics environment, you need one of the following:

* [Microsoft Entra tenant](./create-an-azure-active-directory-tenant.md) and an organizational (master) user
* [Power BI Pro](https://powerbi.microsoft.com/power-bi-pro/) account

## Before you begin

Before you can register your app, decide which of the following solutions best suits your needs:

* [For your customers](#embed-for-your-customers)
* [For your organization](#embed-for-your-organization)

### Embed for your customers

Use the [embed-for-your-customers](embed-sample-for-customers.md) solution, also known as *app owns data*, if you create an app designed for your customers. Users don't need to sign in to Power BI or have a Power BI license to use your app. Your app authenticates against Power BI by using either a **master user** account (a Power BI Pro license used for signing in to Power BI) or a [service principal](embed-service-principal.md).

The embed-for-your-customers solution is usually used by independent software vendors (ISVs) and developers who create applications for a third party.

### Embed for your organization

Use the [embed-for-your-organization](embed-sample-for-your-organization.md) solution, also known as *user owns data*, if you create an application that requires users to use their credentials to authenticate against Power BI.

The embed-for-your-organization solution is usually used by enterprises and large organizations, and is intended for internal users.

For more about the two solutions, see [What are the Power BI embedded analytics solutions?](embedded-analytics-power-bi.md#what-are-the-power-bi-embedded-analytics-solutions).

## Register your app

To register a Microsoft Entra app, use the following procedure in this section. Take these steps only if you're creating one of the following solutions:

* An embed-for-your-organization application
* An embed-for-your-customers application with a *service principal*

For more information about how to register applications in Microsoft Entra ID, see [Register an application with the Microsoft identity platform](/azure/active-directory/develop/quickstart-register-app).

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Select your Microsoft Entra tenant by selecting your account in the upper-right corner of the page.

1. Select **App registrations**. If you don't see this option, search for it.

1. In *App registrations*, select **New registration**.

1. Fill in the following fields:

   * **Name** - Give your application a name.

   * **Supported account type** - Select who can use the application. Select *Accounts in this organizational directory only* for single tenant apps, or *Accounts in any organizational directory* for cross-tenant scenarios.

1. (Optional) In the **Redirect URI** box, add a redirect URL.

1. Select **Register**. After your app is registered, you're directed to your app's overview page, where you can obtain the **Application ID**. Copy and save the **Application ID** and all information in the **Summary** box for later use. Your Power BI embedding environment is ready to use.

   :::image type="content" source="media/register-app/application-id.png" alt-text="Screenshot of the Overview page of the new app. The Application ID is indecipherable and is highlighted.":::

## Create a secret key (optional)

If you want to use a service principal to authenticate your app, you need to create a client secret. A client secret is a password that your application uses to authenticate against the Microsoft Entra ID. You can create a client secret in the Azure portal.

1. Select **Certificates & secrets**.

   :::image type="content" source="media/register-app/certificates-and-secrets.png" alt-text="Screenshot of the Overview page of the new app. On the navigation pane, Certificates & secrets is highlighted.":::

1. Select **New client secret**.

1. In the **Add a client secret** window, enter a description, specify when you want the client secret to expire, and select **Add**.

1. Copy and save the client secret value.

   :::image type="content" source="media/register-app/client-secret-value.png" alt-text="Screenshot of the Certificates & secrets page for the app. Under Client secrets, a new secret is visible. Its indecipherable value is highlighted.":::

   > [!NOTE]
   > Once you save the client secret, the value of the client secret is displayed. This is only displayed once, so copy this value and store it where your application can retrieve it, usually where your application keeps values like clientId, or authority in the source code. You need to provide the secret value along with the application's client ID to sign in as the application. After you leave this window, the client secret value is hidden, and you can't view or copy it again.

## Related content

More questions? [Try asking the Power BI Community](https://community.powerbi.com/).
