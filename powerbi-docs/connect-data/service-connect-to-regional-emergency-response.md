---
title: Connect to the Regional Emergency Response Dashboard
description: Learn how to install the Regional Government Emergency Response Dashboard template app for Power BI and connect to your data sources to view critical emergency metrics.
author: JulCsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: powerbi-template-apps
ms.topic: how-to
ms.date: 10/01/2025
ai-usage: ai-assisted
LocalizationGroup: Connect to services
#customer intent: As a regional organization admin, I want to connect to the Regional Government Emergency Response Dashboard so that I can quickly view important data and metrics to make efficient decisions.
---

# Connect to the Regional Government Emergency Response Dashboard

The Regional Government Emergency Response Dashboard helps regional organization admins quickly view critical data and metrics to make efficient emergency response decisions. This reporting component integrates with the [Microsoft Power Platform Regional Government Emergency Response and Monitoring solution](/powerapps/sample-apps/regional-emergency-response/overview) and displays directly in your Power BI tenant.

This article shows you how to install and connect the Regional Government Emergency Response Dashboard template app to your data sources.

For detailed information about what is presented in the dashboard, see [Get insights](/powerapps/sample-apps/regional-emergency-response/portals-admin-reporting#get-insights).

After you've installed the template app and connected to the data sources, you can customize the report as per your needs. You can then distribute it as an app to colleagues in your organization.

## Prerequisites

Before installing this template app, you must first install and set up the [Regional Government Emergency Response and Monitoring solution](/powerapps/sample-apps/regional-emergency-response/deploy). Installing this solution creates the data source references necessary to populate the app with data.

When installing the Regional Government Emergency Response and Monitoring solution, take note of the [URL of your Dataverse environment instance](/powerapps/sample-apps/regional-emergency-response/deploy#step-5-configure-and-publish-power-bi-dashboard). You need it to connect the template app to the data.

## Install the app

1. Click the following link to get to the app: [Regional Government Emergency Response Dashboard template app](https://appsource.microsoft.com/product/power-bi/powerapps_cxo.regional_response)
1. On the AppSource page for the app, select [**Get it now**](https://appsource.microsoft.com/product/power-bi/powerapps_cxo.regional_response).

    :::image type="content" source="media/service-connect-to-regional-emergency-response/service-regional-emergency-response-app-appsource-get-it-now.png" alt-text="Screenshot of Regional Government Emergency Response Dashboard app in AppSource.":::

1. Select **Install**.

    :::image type="content" source="media/service-connect-to-regional-emergency-response/service-regional-emergency-response-select-install.png" alt-text="Screenshot of Install the Regional Government Emergency Response Dashboard app.":::

    Once the app has installed, you see it on your Apps page.

## Connect to data sources

1. Select the entry in the list on your Apps page to open the app.

1. On the splash screen, select **Explore**.

   :::image type="content" source="media/service-connect-to-regional-emergency-response/service-regional-emergency-response-app-splash-screen.png" alt-text="Screenshot of Template app splash screen.":::

   The app opens, showing sample data.

1. Select the **Connect your data** link on the banner at the top of the page.

   :::image type="content" source="media/service-connect-to-regional-emergency-response/service-regional-emergency-response-app-connect-data.png" alt-text="Screenshot of Regional Government Emergency Response Dashboard app connect your data link.":::

1. In the dialog that appears, enter the [URL of your Dataverse environment instance](/powerapps/sample-apps/emergency-response/deploy-configure#publish-the-power-bi-dashboard). For example: `https://[myenv].crm.dynamics.com`. When done, select **Next**.
1. In the next dialog that appears, set the authentication method to **OAuth2**. You don't have to change the privacy level setting.

   Select **Sign in**.

1. At the Microsoft sign-in screen, sign in to Power BI.

   After you sign in, the report connects to the data sources and is populated with current data. During this time, the activity monitor displays progress.

## Schedule report refresh

When the data refresh has completed, [set up a refresh schedule](../connect-data/refresh-scheduled-refresh.md) to keep the report data up to date.

1. In the ribbon at the top of the report, select the three horizontal dots icon, and then select **View semantic model**.
1. On the page for the semantic model, select **Refresh** from the ribbon, and then select **Schedule refresh** and follow the instructions described in [Configure scheduled refresh](../connect-data/refresh-scheduled-refresh.md).

## Customize and share

See [Customize and share the app](../connect-data/service-template-apps-install-distribute.md#customize-and-share-the-app) for details. Be sure to review the [report disclaimers](/powerapps/sample-apps/regional-emergency-response/overview#disclaimer) before publishing or distributing the app.

## Related content

- [Understanding the Regional Government Emergency Response dashboard](/powerapps/sample-apps/regional-emergency-response/portals-admin-reporting#get-insights)
- [Set up and learn about the Crisis Communication sample template in Power Apps](/powerapps/maker/canvas-apps/sample-crisis-communication-app)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- [What are Power BI template apps?](../connect-data/service-template-apps-overview.md)
- [Install, share, and update template apps in your organization](../connect-data/service-template-apps-install-distribute.md)
