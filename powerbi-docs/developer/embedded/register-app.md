---
title: Get started with Power BI Embedded
description: Set up Power BI Embedded using a setup tool to register a Microsoft Entra app, create a workspace, import content, grant permissions, and download a sample app.
author: mberdugo
ms.author: monaberdugo
keywords: 
ms.date: 01/23/2024
ms.topic: overview
ms.service: powerbi
ms.subservice: powerbi-developer
ms.custom: intro-overview
#customer intent: As a developer, I want to learn how to set up Power BI Embedded so that I can share my reports with others.
---

# Set up Power BI Embedded

**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::&nbsp;App&nbsp;owns&nbsp;data :::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::&nbsp;User&nbsp;owns&nbsp;data

If you want to start using Power BI Embedded to share your reports with others, use the [Power BI embedded analytics setup tool](https://app.powerbi.com/embedsetup) to get started. This article shows you how.

To use Power BI embedded analytics, you need to register a Microsoft Entra application in Azure. The Microsoft Entra app establishes permissions for Power BI REST resources, and allows access to the [Power BI REST APIs](/rest/api/power-bi/).

## Prerequisite

To set up a Power BI embedded analytics environment, you need one of the following:

* [Microsoft Entra tenant](./create-an-azure-active-directory-tenant.md) and an organizational (master) user
* [Power BI Pro](https://powerbi.microsoft.com/power-bi-pro/) account

## Before you begin

Before you can register your app, decide which of the following solutions best suits your needs:

* [For your customers](#embed-for-your-customers)
* [For your organization](#embed-for-your-organization)

### Embed for your customers

Use the [embed-for-your-customers](embed-sample-for-customers.md) solution, also known as *app owns data*, if you create an app that's designed for your customers. Users don't need to sign in to Power BI or have a Power BI license to use your app. Your app authenticates against Power BI by using either a **master user** account (a Power BI Pro license used for signing in to Power BI) or a [service principal](embed-service-principal.md).

The embed-for-your-customers solution is usually used by independent software vendors (ISVs) and developers who create applications for a third party.

### Embed for your organization

Use the [embed-for-your-organization](embed-sample-for-your-organization.md) solution, also known as *user owns data*, if you create an application that requires users to use their credentials to authenticate against Power BI.

The embed-for-your-organization solution is usually used by enterprises and large organizations, and is intended for internal users.

For more about the two solutions, see [What are the Power BI embedded analytics solutions?](embedded-analytics-power-bi.md#what-are-the-power-bi-embedded-analytics-solutions).

## Set up your environment

After you understand the two embedding options, you can use the setup tool to create your Power BI Embedded environment.

If you prefer to manually set up your environment, skip the steps in the following sections. Instead, follow the steps in [Manual registration](#manual-registration), later in this article.

> [!IMPORTANT]
> If you're embedding for a GCC, follow the instructions in [Manual registration](#manual-registration).

To use the tool to set up your environment, go to the [Power BI embedded analytics setup tool](https://app.powerbi.com/embedsetup). Select the embedding option that you want.

:::image type="content" source="./media/register-app/choose-embedding-solution.png" alt-text="Screenshot of the Power BI embedded analytics setup tool. The options for embedding for your customers or for your organization are highlighted.":::

## Step 1 - Sign in to Power BI

1. Under **Step 1** in the setup tool, select **Sign in**. This step signs you in to Power BI. If you're prompted to pick an account, sign in with a user that belongs to your Power BI tenant. The Microsoft Entra app gets registered under this user.

   > [!NOTE]
   > If you're already signed in, verify that you're signed in with the user you want to use to create the Microsoft Entra app. To change users, select **sign out**. After the tool restarts, sign in with the correct user.

1. Select **Next** to go to the next step.

   :::image type="content" source="./media/register-app/step-one-signed-in.png" alt-text="Screenshot of the Power BI embedded analytics setup tool after a user has signed in to Power BI. The Next button in highlighted.":::

## Step 2 - Register your application

In this step, you register a Microsoft Entra application in Azure. The Microsoft Entra app establishes permissions for Power BI REST resources, and allows access to the [Power BI REST APIs](/rest/api/power-bi/). You can always change these settings at a later time.

### [Embed for your customers](#tab/customers)

1. To register your application for your customers, fill in the following fields:

   * **Application Name** - Give your application a name.

   * **API access** - Select the Power BI APIs (also known as scopes) that your application needs. You can select **Select all** to select all the APIs. For more information about Power BI access permissions, see [Permissions and consent in the Microsoft identity platform endpoint](/azure/active-directory/develop/v2-permissions-and-consent).

1. Select **Register**.

1. Your Microsoft Entra app **Application ID** is displayed in the **Summary** box. Copy this value for later use.

   :::image type="content" source="./media/register-app/application-id.png" alt-text="Screenshot of the Power BI embedded analytics setup tool, with a Summary box on the right. Information in the box includes an application ID.":::

### [Embed for your organization](#tab/organization)

1. To register your application for your organization, fill in the following fields:

   * **Application Name** - Give your application a name.

   * **Home Page URL** - Enter a URL for your home page.

   * **Redirect URL** - Select a redirection option. When your users sign in, they're redirected to this address while your application receives an authentication code from Azure. Choose one of these options for this URL:

     * **Use a default URL** - This option automatically creates and downloads a sample embedded analytics application. The default URL is `http://localhost:13526/`.
     * **Use a custom URL** - This option is appropriate if you already have an embedded analytics application, and know what you want to use as a redirect URL.

   * **API access** - Select the Power BI APIs (also known as scopes) that your application needs. Select **Select all** to select all the APIs. For more information about Power BI access permissions, see [Permissions and consent in the Microsoft identity platform endpoint](/azure/active-directory/develop/v2-permissions-and-consent).

1. Select **Register**.

1. Your Microsoft Entra app **Application ID** and **Application secret** values are displayed in the **Summary** box. Copy these values for later use.

---

## Step 3 - Create a workspace (optional)

Create a workspace in the Power BI service:

* If you already have a Power BI workspace, select **Skip**.

* To create a workspace, enter a name for your workspace, and then select **Create workspace**. Your workspace name and ID appear in the **Summary** box. Copy these values for later use.

  >[!TIP]
  >For the **embedded analytics sample app** to work as expected, you have to use the tool to create a workspace.

## Step 4 - Import content (optional)

Select one of the following options:

* If you have your own Power BI app, you can select **Skip**.

* If you want to create a sample Power BI app by using a sample report, select **Sample Power BI report**, and then select **Import**.

* If you want to create a sample Power BI app by using your own report, select **Upload a *.pbix* file**, browse for your file, and then select **Import**.

## Step 5 - Grant permissions (*Embed for your customers* only)

Select **Grant permissions** and in the dialog, select **Accept**. This step allows your Microsoft Entra app to access the APIs you selected (also known as scopes) with your signed-in user. This user is also known as the **master user**.

## Download sample app (optional)

If you created a Power BI workspace and uploaded content to it by using this tool, you can now select **Download sample application**.

>[!NOTE]
>If you skipped the optional stages, you can still download a sample Power BI app. However, the code in the downloaded app lacks the properties that get filled in during registration. For example, if you don't create a workspace, the sample app doesn't include the workspace ID.

Make sure you copy all the information in the **Summary** box. Your Power BI embedding environment is ready to use.

## Manual registration

If you didn't use the Power BI embedded analytics setup tool, use the procedure in this section to manually register a Microsoft Entra app. But take these steps only if you're creating one of the following solutions:

* An embed-for-your-organization application
* An embed-for-your-customers application with a *service principal*

For more information about how to register applications in Microsoft Entra ID, see [Register an application with the Microsoft identity platform](/azure/active-directory/develop/quickstart-register-app).

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Select your Microsoft Entra tenant by selecting your account in the upper-right corner of the page.

1. Select **App registrations**. If you don't see this option, search for it.

1. In *App registrations*, select **New registration**.

1. Fill in the following fields:

   * **Name** - Give your application a name.

   * **Supported account type** - Select who can use the application.

1. (Optional) In the **Redirect URI** box, add a redirect URL.

1. Select **Register**. After your app is registered, you're directed to your app's overview page, where you can obtain the **Application ID**.

## Related content

More questions? [Try asking the Power BI Community](https://community.powerbi.com/).
