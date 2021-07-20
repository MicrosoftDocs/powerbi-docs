---
title: Embed content in your Power BI embedded analytics application enabling better embedded BI insights for your organization
description: Learn how to integrate Power BI into your application using embedded analytics software, embedded analytics tools, or embedded business intelligence tools.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: tutorial
ms.custom: ''
ms.date: 12/17/2020
#Customer intent: As a developer, I want to embed Power BI content into an application, so users of an organization can share data.
---

# Tutorial: Embed Power BI content using a sample *embed for your organization* application

Power BI embedded analytics allows you to embed Power BI content such as reports, dashboards and tiles, into your application.

In this tutorial, you'll learn how to:

>[!div class="checklist"]
>* Set up your embedded environment.
>* Configure an *embed for your organization* (also known as *user owns data*) sample application.

To use your application, your users will need to sign in to Power BI.

The embed for your organization solution is usually used by enterprises and big organizations, and is intended for internal users.

## Code sample specifications

This tutorial includes instructions for configuring an *embed for your organization* sample application in one of the following frameworks:

* .NET Framework
* .NET Core
* React TypeScript

>[!NOTE]
>The *.NET Core* and the *.NET Framework* samples will allow the end user to view any Power BI dashboard, report or tile they have access to in Power BI service. The *React TypeScript* sample lets you embed only one report that your end user already has access to on Power BI service.

The code samples support the following browsers:

* Microsoft Edge
* Google Chrome
* Mozilla Firefox

## Prerequisites

Before you start this tutorial, verify that you have both the Power BI and code dependencies listed below:

* **Power BI dependencies**

    * Your own [Azure Active Directory tenant](create-an-azure-active-directory-tenant.md).

    * One of the following licenses:

        * [Power BI Pro](../../admin/service-admin-purchasing-power-bi-pro.md)

        * [Premium Per User (PPU)](../../admin/service-premium-per-user-faq.yml)

    >[!NOTE]
    >To [move to production](move-to-production.md) you'll need one of the following configurations:
    >* All users with Pro licenses.
    >* All users with PPU licenses.
    >* A *P* or *EM* [capacity](embedded-capacity.md). This configuration allows all users to have free licenses.

* **Code dependencies**

    # [.NET Core](#tab/net-core)

    * [.NET Core 3.1 SDK](https://dotnet.microsoft.com/download/dotnet-core) (or higher)
    
    * An integrated development environment (IDE). We recommend using one of the following:

        * [Visual Studio](https://visualstudio.microsoft.com/)

        * [Visual Studio Code](https://code.visualstudio.com/)

    # [.NET Framework](#tab/net-framework)

    * [.NET Framework 4.8](https://dotnet.microsoft.com/download/dotnet-framework/)
    
    * [Visual Studio](https://visualstudio.microsoft.com/)

    # [React TypeScript](#tab/react)

    * A text editor

    * Command line terminal (or PowerShell)

---

## Method

To create an *embed for your organization* sample app, follow these steps:

1. [Register an Azure AD application](#step-1---register-an-azure-ad-application).

2. [Create a Power BI workspace](#step-2---create-a-power-bi-workspace).

3. [Create and publish a Power BI report](#step-3---create-and-publish-a-power-bi-report).

4. [Get the embedding parameter values](#step-4---get-the-embedding-parameter-values).

5. [Embed your content](#step-5---embed-your-content).

## Step 1 - Register an Azure AD application

Registering your application with Azure AD allows you to establish an identity for your app.

[!INCLUDE[Register Azure AD app](../../includes/embed-tutorial-register-app.md)]

## Step 2 - Create a Power BI workspace

[!INCLUDE[Create a Power BI workspace](../../includes/embed-tutorial-create-workspace.md)]

## Step 3 - Create and publish a Power BI report

[!INCLUDE[Create a Power BI report](../../includes/embed-tutorial-create-report.md)]

## Step 4 - Get the embedding parameter values

To embed your content, you'll need to obtain a few parameter values. The parameter values you'll need depend on the language of the sample application you want to use. The table below lists which parameter values are required for each sample.

|Parameter  |.NET Core  |.NET Framework  |React TypeScript |
|---------|---------|---------|---------|
|[Client ID](#client-id) |![Applies to.](../../media/yes.png) |![Applies to.](../../media/yes.png)         |![Applies to.](../../media/yes.png) |
|[Client secret](#workspace-id) |![Applies to.](../../media/yes.png) |![Applies to.](../../media/yes.png) |![Does not apply to.](../../media/no.png) |
|[Workspace ID]() |![Does not apply to.](../../media/no.png) |![Does not apply to.](../../media/no.png) |![Applies to.](../../media/yes.png) |
|[Report ID]() |![Does not apply to.](../../media/no.png) |![Does not apply to.](../../media/no.png) |![Applies to.](../../media/yes.png) |

### Client ID

>[!TIP]
>**Applies to:** ![Applies to.](../../media/yes.png).NET Core ![Applies to.](../../media/yes.png).NET Framework ![Applies to.](../../media/yes.png)React TypeScript

[!INCLUDE[Get the client ID](../../includes/embed-tutorial-client-id.md)]

### Client secret

>[!TIP]
>**Applies to:** ![Applies to.](../../media/yes.png).NET Core ![Applies to.](../../media/yes.png).NET Framework ![Does not apply to.](../../media/no.png)React TypeScript

[!INCLUDE[Get the client secret](../../includes/embed-tutorial-client-secret.md)]

### Workspace ID

>[!TIP]
>**Applies to:** ![Does not apply to.](../../media/no.png).NET Core ![Does not apply to.](../../media/no.png).NET Framework ![Applies to.](../../media/yes.png)React TypeScript

[!INCLUDE[Get the workspace ID](../../includes/embed-tutorial-workspace-id.md)]

### Report ID

>[!TIP]
>**Applies to:** ![Does not apply to.](../../media/no.png).NET Core ![Does not apply to.](../../media/no.png).NET Framework ![Applies to.](../../media/yes.png)ReactTypeScript

[!INCLUDE[Get the report ID](../../includes/embed-tutorial-report-id.md)]

## Step 5 - Embed your content

The Power BI embedded sample application allows you to create an *embed for your organization* Power BI app.

Follow these steps to modify the *embed for your organization* sample application, to embed your Power BI report.

[!INCLUDE[Embedding steps](../../includes/embed-tutorial-embedding-steps.md)]

4. Depending on the language you want your application to use, open one of these folders:

    * .NET Core
    * .NET Framework
    * React-TS

    >[!NOTE]
    >The *embed for your organization* sample applications only support the frameworks listed above. The *Java*, *Node JS* and *Python* sample applications, only support the *[embed for your customers](embed-sample-for-customers.md)* solution.

# [.NET Core](#tab/net-core)

### Configure your Azure AD app

[!INCLUDE[Configure the Azure AD authentication options](../../includes/embed-tutorial-org-azure-ad-app.md)]

5. In *Platform configurations*, open your *Web* platform and in the **Redirect URIs** section, add `https://localhost:5000/signin-oidc`.

    > [!NOTE]
    >If you don't have a **Web** platform, select **Add a platform** and in the *Configure platforms* window, select **Web**.

6. Save your changes.

:::image type="content" source="media/embed-sample-for-your-organization/azure-ad-net-configurations.png" alt-text="Screenshot showing the Azure AD app authentication configurations including the web redirect U R I for the .NET core app sample.":::

### Configure the sample embedding app

1. Open the **Embed for your organization** folder.

2. Open the *embed for your organization sample app* using one of these methods:

    * If you're using [Visual Studio](https://visualstudio.microsoft.com/), open the **UserOwnsData.sln** file.

    * If you're using [Visual Studio Code](https://code.visualstudio.com/), open the **UserOwnsData** folder.

3. Open **appsettings.json** and fill in the following parameter values:

    * `ClientId` - Use the [client ID](#client-id) GUID

    * `ClientSecret` - Use the [client secret](#client-secret)

### Run the sample app

1. Run the project by selecting the appropriate option:

    * If you're using **Visual Studio**, select **IIS Express** (play).

    * If you're using **Visual Studio Code**, select **Run > Start Debugging**.

[!INCLUDE[The embedded application sample app interface](../../includes/embed-tutorial-org-sample-app.md)]

# [.NET Framework](#tab/net-framework)

### Configure your Azure AD app

[!INCLUDE[Configure the Azure AD authentication options](../../includes/embed-tutorial-org-azure-ad-app.md)]

5. In *Platform configurations*, configure the following:

    1. In your *Web* platform, in the **Redirect URIs** section, add `https://localhost:44300/`.

        > [!NOTE]
        >If you don't have a **Web** platform, select **Add a platform** and in the *Configure platforms* window, select **Web**.
    
    2. In *Implicit grant and hybrid flows*, enable the **ID tokens** option.
    
6. Save your changes.

:::image type="content" source="media/embed-sample-for-your-organization/azure-ad-framework-configurations.png" alt-text="Screenshot showing the Azure AD app authentication configurations including the web redirect U R I and the selected access token option for the .NET framework app sample.":::

### Configure the sample embedding app

1. Open the **Embed for your organization** folder.

2. Using [Visual Studio](https://visualstudio.microsoft.com/), open the **UserOwnsData.sln** file.

3. Open **Web.config** and fill in the following parameter values:

    * `clientId` - Use the [client ID](#client-id) GUID

    * `clientSecret` - Use the [client secret](#client-secret)

### Run the sample app

1. Run the project by selecting **IIS Express** (play).

[!INCLUDE[The embedded application sample app interface](../../includes/embed-tutorial-org-sample-app.md)]

# [React TypeScript](#tab/react)

### Configure your Azure AD app

[!INCLUDE[Configure the Azure AD authentication options](../../includes/embed-tutorial-org-azure-ad-app.md)]

5. In *Platform configurations*, configure your **Web** platform as follows:

    1. In **Redirect URIs** add `https://localhost:3000` and select **Configure**.

        > [!NOTE]
        >If you don't have a **Web** platform, select **Add a platform** and in the *Configure platforms* window, select **Web**.

    2. In *Implicit grant and hybrid flows*, enable both options:
        * **Access tokens**
        * **ID tokens**
    
6. Save your changes.

:::image type="content" source="media/embed-sample-for-your-organization/azure-ad-react-configurations.png" alt-text="Screenshot showing the Azure AD app authentication configurations including the web redirect U R I set for localhost 3000.":::

### Configure the sample embedding app

1. Open the **Embed for your organization** > **UserOwnsData** > **src** folder.

2. Using a text editor, open the **Config.ts** file and fill in the following parameter values:

    * `clientId` - Use the [client ID](#client-id) GUID

    * `workspaceId` - Use the [workspace ID](#client-secret)

    * `reportId` - Use the [report ID](#report-id)

3. Save the file.

### Run the sample app

1. Open a terminal in and navigate to **Embed for your organization** > **UserOwnsData**.

2. Install required dependencies by executing the following command:

   `npm install`

3. Run the application by executing the following command:

   `npm run start`

    >[!NOTE]
    >During your first sign in, you'll be prompted to allow Azure AD permissions for the app.

---

## Developing your application

After configuring and running the *embed for your customers* sample application, you can start developing your own application.

[!INCLUDE[Move to production](../../includes/embed-tutorial-production.md)]

## Next steps

> [!div class="nextstepaction"]
>[Move to production](move-to-production.md)

>[!div class="nextstepaction"]
>[Embed for your customers](embed-sample-for-customers.md)

> [!div class="nextstepaction"]
>[Embed paginated reports for your customers](embed-paginated-reports-customers.md)

> [!div class="nextstepaction"]
>[Embed paginated reports for your organization](embed-paginated-reports-organization.md)

>[!div class="nextstepaction"]
>[Ask the Power BI Community](https://community.powerbi.com/)