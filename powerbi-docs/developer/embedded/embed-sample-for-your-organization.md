---
title: Embed content in your Power BI embedded analytics application for your organization
description: Learn how to embed, a report, dashboard, or tile into a Power BI embedded analytics embed for your customers sample.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: tutorial
ms.custom: seodec18
ms.date: 12/09/2020
#Customer intent: As a developer, I want to embed Power BI content into an application, so users of an organization can share data.
---

# Tutorial: Embed Power BI content using a sample *embed for your organization* application

[!INCLUDE[embedded analytics overview](../../includes/embed-tutorial-overview.md)]

>[!div class="checklist"]
>* Set up your embedded environment.
>* Configure an *embed for your organization* (also known as *user owns data*) sample application.

To use your application, your users will need to sign in to Power BI.

The embed for your organization solution is usually used by enterprises and big organizations, and is intended for internal users.

[!INCLUDE[embedded analytics specifications](../../includes/embed-tutorial-specs1.md)]

* .NET Framework
* .NET Core
* React TS

[!INCLUDE[embedded analytics specifications and prerequisites](../../includes/embed-tutorial-specs2.md)]

    * One of the following licenses:

        * [Power BI Pro](../../admin/service-admin-purchasing-power-bi-pro.md)

        * [Premium Per User (PPU)](../../admin/service-premium-per-user-faq.md)

[!INCLUDE[move to production note](../../includes/embed-tutorial-production-note.md)]

* **Code dependencies**

    # [.NET Core](#tab/net-core)

    [!INCLUDE[.NET Core dependencies](../../includes/embed-tutorial-core-dependencies.md)]

    # [.NET Framework](#tab/net-framework)

    [!INCLUDE[.NET Framework dependencies](../../includes/embed-tutorial-net-dependencies.md)]

    # [React](#tab/react)

---

## Method

To create an *embed for your organization* sample app, follow these steps:

1. [Register an Azure AD application](#step-1---register-an-azure-ad-application).

2. [Create a Power BI workspace](#step-2---create-a-power-bi-workspace).

3. [Create and publish a Power BI report](#step-3---create-and-publish-a-power-bi-report).

4. [Get the embedding parameter values](#step-4---get-the-embedding-parameter-values).

5. [Embed your content](#step-5---embed-your-content).

## Step 1 - Register an Azure AD application

[!INCLUDE[Register Azure AD app part 1](../../includes/embed-tutorial-register-app1.md)]

[!INCLUDE[Register Azure AD app part 2](../../includes/embed-tutorial-register-app2.md)]

## Step 2 - Create a Power BI workspace

[!INCLUDE[Create a Power BI workspace](../../includes/embed-tutorial-create-workspace.md)]

## Step 3 - Create and publish a Power BI report

[!INCLUDE[Create a Power BI report](../../includes/embed-tutorial-create-report.md)]

## Step 4 - Get the embedding parameter values

To embed your content, you'll need to obtain certain parameter values. Before you embed your content, make sure you have all the values listed below.

* [Client ID](#client-id)
* [Workspace ID](#workspace-id)
* [Report ID](#report-id)

### Client ID

[!INCLUDE[Get the client ID](../../includes/embed-tutorial-client-id.md)]

### Workspace ID

[!INCLUDE[Get the workspace ID](../../includes/embed-tutorial-workspace-id.md)]

### Report ID

[!INCLUDE[Get the report ID](../../includes/embed-tutorial-report-id.md)]

## Step 5 - Embed your content

The Power BI embedded sample application allows you to create an *embed for your organization* Power BI app.

Follow these steps to modify the *embed for your organization* sample application, to embed your Power BI report.

[!INCLUDE[Embedding steps](../../includes/embed-tutorial-embedding-steps.md)]

    * .NET Core
    * .NET Framework
    * React-TS

    >[!NOTE]
    >The *embed for your organization* sample applications only support the languages listed above. The *Java*, *Node JS* and *Python* sample applications, only support the *[embed for your customers](embed-sample-for-customers.md)* solution.

5. Open the **Embed for your organization** folder.

# [.NET Core](#tab/net-core)

6. Open the *embed for your organization sample app* using one of these methods:

    * If you're using [Visual Studio](https://visualstudio.microsoft.com/), open the **UserOwnsData.sln** file.

    * If you're using [Visual Studio Code](https://code.visualstudio.com/), open the **UserOwnsData** folder.

7. Open **appsettings.json**.

8. Fill in the following parameter values:


# [.NET Framework](#tab/net-framework)


# [React](#tab/react)

---

## Developing your application

After configuring and running the *embed for your customers* sample application, you can start developing your own application.

[!INCLUDE[Move to production](../../includes/embed-tutorial-production.md)]

## Next steps

> [!div class="nextstepaction"]
>[Move to production](move-to-production.md)

>[!div class="nextstepaction"]
>[Embed for your customers](embed-sample-for-your-customers.md)

> [!div class="nextstepaction"]
>[Embed paginated reports for your customers](embed-paginated-reports-customers.md)

> [!div class="nextstepaction"]
>[Embed paginated reports for your organization](embed-paginated-reports-organization.md)

>[!div class="nextstepaction"]
>[Ask the Power BI Community](https://community.powerbi.com/)