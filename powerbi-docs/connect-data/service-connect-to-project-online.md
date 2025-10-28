---
title: Connect to Project Web App with Power BI
description: Learn how to connect to Microsoft Project Web App using the Power BI template app. Unlock insights for project portfolio management. Get started now.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: juliacawthra
ms.service: powerbi
ms.subservice: powerbi-template-apps
ms.topic: how-to
ms.date: 10/01/2025
ai-usage: ai-assisted
LocalizationGroup: Connect to services
---

# Connect to Project Web App with Power BI

Microsoft Project Web App is a flexible online solution for project portfolio management (PPM) and everyday work. Project Web App enables organizations to get started, prioritize project portfolio investments and deliver the intended business value. The Project Web App Template App for Power BI allows you to unlock insight from Project Web App to help manage projects, portfolios, and resources.

Connect to the [Project Web App Template App](https://appsource.microsoft.com/product/power-bi/pbi_msprojectonline.pbi-microsoftprojectwebapp) for Power BI.

## How to connect

1. In the Power BI service, select **Apps** from the navigation pane, then select **Get apps**.
1. Search for **Microsoft Project Web App** in AppSource or the Power BI marketplace.
1. Select **Get it now**, then select **Install** when prompted.
1. After installation completes, select the **Microsoft Project Web App** tile from your **Apps** page to open the app.
1. Select **Connect data** to begin configuration.
1. In the **Project Web App URL** text box, enter the URL for your Project Web App (PWA) instance that you want to connect to. If you have a custom domain, this URL might differ from the example shown.
1. In the **PWA Site Language** text box, enter the number that corresponds to your PWA site language:
   - **1** - English
   - **2** - French
   - **3** - German
   - **4** - Portuguese (Brazil)
   - **5** - Portuguese (Portugal)
   - **6** - Spanish
1. For **Authentication Method**, select **OAuth2**, then select **Sign In**. When prompted, enter your Project Web App credentials and follow the authentication process.

    > [!NOTE]
    > You need Portfolio Viewer, Portfolio Manager, or Administrator permissions for the Project Web App instance you're connecting to.

1. A notification indicates your data is loading. Depending on the size of your account, this might take some time. After Power BI imports the data, you'll see the contents of your new workspace. You might need to refresh the semantic model to get the latest updates.

    After Power BI imports the data, you'll see the report with 13 pages and the semantic model in the navigation pane.

1. Once your reports are ready, start exploring your Project Web App data. The Template App comes with 13 rich and detailed reports for Portfolio Overview (six report pages), Resource Overview (five report pages), and Project Status (two report pages).

## Refresh data

Your semantic model is scheduled to refresh daily by default. You can change the refresh schedule or try refreshing it on demand using **Refresh now** from the semantic model settings.

## Customize the template app

You can further customize this template app by downloading the source file from the [Project Web App GitHub repository](https://github.com/OfficeDev/Project-Power-BI-Content-Packs).

> [!NOTE]
> Verify that the GitHub repository is still actively maintained before proceeding with customization.

## Related content

- [What are Power BI template apps?](service-template-apps-overview.md)
- [Install and distribute template apps in your organization](service-template-apps-install-distribute.md)
- [Get started with the Power BI service](../fundamentals/service-get-started.md)
