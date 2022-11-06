---
title: Get started with Power BI Embedded
description: Step by step guide to registering an app and setting up Power BI Embedded.
author: mberdugo
ms.author: monaberdugo
keywords: 
ms.date: 11/7/2022
ms.topic: overview
ms.service: powerbi
ms.subservice: powerbi-developer
ms.custom: intro-overview
---
# Set up Power BI Embedded

Once you've made the decision that you want to purchase and start using Power BI Embedded to share your reports with others, follow these instructions to get started.

## Prerequisite

To set up a Power BI Embedded analytics environment, you need one of the following:

* [Azure Active directory tenant](./create-an-azure-active-directory-tenant.md) and an organizational (master) user
* [Power BI Pro](https://powerbi.microsoft.com/power-bi-pro/) account

## Before you begin

Before you can start downloading Power BI Embedded, decide which of the following solutions best suits your needs.

* [For your customers](#embed-for-your-customers)
* [For your organization](./embedded-analytics-power-bi.md#embed-for-your-organization)

### Embed for your customers

Use the [embed for your customers](embed-sample-for-customers.md) solution, also known as *app owns data*, if you're planning to create an application that's designed for your customers. Users will not need to sign in to Power BI or have a Power BI license, to use your application. Your application will use one of the following methods to authenticate against Power BI:

* **Master user** account (a Power BI Pro license used for signing in to Power BI)
* [Service principal](embed-service-principal.md)

The embed for your customers solution is usually used by independent software vendors (ISVs) and developers who are creating applications for a third party.
For more information see [Embed for you customers](./embedded-analytics-power-bi.md#embed-for-your-customers).

### Embed for your organization

Use the [embed for your organization](embed-sample-for-your-organization.md) solution, also known as *user owns data*, if you're planning to create an application  that requires users to use their credentials to authenticate against Power BI.

The embed for your organization solution is usually used by enterprises and big organizations, and is intended for internal users.

For more on the differences between the two solutions, see [What are the Power BI embedded analytics solutions?](embedded-analytics-power-bi.md#what-are-the-power-bi-embedded-analytics-solutions)

## Step 0 - Power BI Embedded Analytics setup tool

Once you understand the difference between these two options and decide which one you want, go to the [Power BI Embedded analytics setup tool](https://app.powerbi.com/embedsetup) and select the solution you want in the *Choose an embedding solution* section.

:::image type="content" source="./media/embedded-get-started/choose-embedding-solution.png" alt-text="Screenshot of the first page of Set up your Power BI embedding environment. The options to embed for your customers or embed for your organization are shown.":::

## Step 1 - Sign in to Power BI

1. Under *Sign in to Power BI*, sign in with a user that belongs to your Power BI tenant. The Azure AD app will be registered under this user. Make sure you're signed in as the user you want to use when you create the Azure AD app.

   > [!NOTE]
   > If you're already signed in, verify that you're signed in with the user you want to use for creating the Azure AD app. To change a user, select the *sign out* link and once the tool restarts, sign in again

1. Select **Next** to go to the next step.

:::image type="content" source="./media/embedded-get-started/step-one-signed-in.png" alt-text="Screenshot of the Set up your Power BI embedding environment page after Power BI sign in.  The next button in highlighted.":::

## Step 2 - Register your application

Register an Azure Active Directory (Azure AD) application in Azure. The Azure AD app establishes permissions for Power BI REST resources, and allows access to the [Power BI REST APIs](/rest/api/power-bi/). You can always change these settings at a later time.

> [!IMPORTANT]
> If you are embedding for a GCC, follow the instructions for **Manual registration**.

### [Embed for your customers](#tab/customers)

To register your application, fill in the following fields:

* **Application Name** - Give your application a name.

* **API access** - Select the Power BI APIs (also known as scopes) that your application needs. You can use *Select all* to select all the APIs. For more information about Power BI access permissions, see [Permissions and consent in the Microsoft identity platform endpoint](/azure/active-directory/develop/v2-permissions-and-consent).

    ![Screenshot showing how to register you application.](media/register-app/register-app.png)

Select **Register**.
Your Azure AD app **Application ID** is displayed in the *Summary* box. Copy this value for later use.

:::image type="content" source="./media/embedded-get-started/application-id.png" alt-text="Screenshot showing application id.":::

### [Embed for your organization](#tab/organization)

To register your application, fill in the following fields:

* **Application Name** - Give your application a name.

* **Home Page URL** - Enter a URL for your home page.

* **Redirect URL** - Upon signing in, your application users will be redirected to this address while your application receives an authentication code from Azure. Select one of these options:

  * **Use a default URL** - This option will automatically create and download a sample embedded analytics application. The default URL is http://localhost:13526/.

  * **Use a custom URL** - Select this option if you already have an embedded analytics application, and know what you want to use as a redirect URL.

* **API access** - Select the Power BI APIs (also known as scopes) that your application needs. You can use *Select all* to select all the APIs. For more information about Power BI access permissions, see [Permissions and consent in the Microsoft identity platform endpoint](/azure/active-directory/develop/v2-permissions-and-consent).

Select **Register**.

Your Azure AD app **Application ID** and **Application secret** values are displayed in the *Summary* box. Copy these values for later use.

### [Manual registration](#tab/manual)

Use the Azure AD manual app registration only if you're creating one of the following solutions:

* An *embed for your organization* application.

* An *embed for your customers* application with a *service principal*.

For more information about how to register applications in Azure Active Directory, see [Register an app with the Azure Active Directory](/azure/active-directory/develop/quickstart-v2-register-an-app).

1. Sign into the [Azure portal](https://portal.azure.com).

2. Select your Azure AD tenant by selecting your account in the upper right corner of the page.

3. Select **App registrations**. If you can't see this option, search for it.

4. In *App registrations*, select **New registration**.

5. Fill in the following fields:

    * **Name** - Give your application a name.

    * **Supported account type** - Select who can use the application.

6. (Optional) In the **Redirect URI**, add a redirect URL.

7. Select **Register**. After your app is registered you're directed to your app's overview page, where you can obtain the *Application ID*.

---

## Step 3 - Create a workspace (optional)

Create a workspace in Power BI service:

* If you already have a Power BI workspace, select **Skip**.

* To create a workspace, enter a name for your workspace and select **Create workspace**. Your Workspace name and ID appear in the *Summary* box. Copy these values for later use.

    >[!NOTE]
    >For the **embedded analytics sample app** to work as expected, you have to create a workspace using the tool.

## Step 4 - Import content (optional)

Select one of following options:

* If you have your own Power BI app, you can select **Skip**.

* If you want to create a sample Power BI app using a sample report, select **Sample Power BI report** and then select **Import**.

* If you want to create a sample Power BI app using your own report, select **Upload a *.pbix* file**, browse for your file and then select **Import**.

## Step 5 - Grant permissions (Embed for your customers only)

Select **Grant permissions** and in the pop-up window select **accept**. This allows your Azure AD app to access the APIs you selected (also known as scopes) with your signed in user. This user is also known as the **master user**.

## Download sample app (Optional) 

If you created a Power BI workspace and uploaded content to it using this tool, you can now select **Download sample application**. Make sure you copy all the information in the *Summary* Box.

>[!NOTE]
>If you skipped the optional stages, you can still download a sample Power BI app. However, the code in the downloaded app, will lack the properties that you didn't fill in during registration. For example, if you didn't create a workspace, the sample app will not include the workspace ID.

## Next steps

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
