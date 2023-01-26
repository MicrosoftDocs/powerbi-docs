---
title: Connect to Power BI Premium Capacity Metrics
description: Learn how to install the Power BI Premium Capacity Metrics template app and then connect to data sources.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-template-apps
ms.topic: how-to
ms.date: 01/23/2023
LocalizationGroup: Connect to services
---
# Power BI Premium Capacity Metrics app

Monitoring your capacities is essential to making informed decisions on how best to utilize your Premium capacity resources. The Power BI Premium Capacity Metrics app provides the most in-depth information into how your capacities are performing.

:::image type="content" source="media/service-connect-to-pbi-premium-capacity-metrics/service-pbi-premium-capacity-metrics-app-report.png" alt-text="Screenshot of the Power BI Premium capacity health center." lightbox="media/service-connect-to-pbi-premium-capacity-metrics/service-pbi-premium-capacity-metrics-app-report.png":::

This article describes how to install the app and connect to data sources. For information about the contents of the report and how to use it, see [Use the Gen2 metrics app](../enterprise/service-premium-gen2-metrics-app.md), and the [Premium Capacity Metrics app blog post](https://powerbi.microsoft.com/blog/premium-capacity-metrics-app-new-health-center-with-kpis-to-explore-relevant-metrics-and-steps-to-mitigate-issues/).

After you've installed the app and connected to the data sources, you can customize the report according to your needs. You can then distribute it to colleagues in your organization.

> [!NOTE]
> Installing template apps requires [permissions](./service-template-apps-install-distribute.md#prerequisites). Contact your Power BI admin if you find you don't have sufficient permissions.

## Install the app

1. Go to the Power BI Premium Capacity Metrics app on the AppSource page: [Power BI Premium Capacity Metrics template app](https://app.powerbi.com/groups/me/getapps/services/pbi_pcmm.capacity-metrics-dxt)

1. Select **Get It Now**.

   :::image type="content" source="media/service-connect-to-pbi-premium-capacity-metrics/service-pbi-premium-capacity-metrics-app-appsource-get-it-now.png" alt-text="Screenshot of the Power BI Premium Capacity Metrics App get it now page." lightbox="media/service-connect-to-pbi-premium-capacity-metrics/service-pbi-premium-capacity-metrics-app-appsource-get-it-now.png":::

1. Select **Install**.

    :::image type="content" source="media/service-connect-to-pbi-premium-capacity-metrics/service-pbi-premium-capacity-metric-select-install.png" alt-text="Screenshot of the install dialog, install is highlighted.":::

    > [!NOTE]
    > If you've installed the app previously, you'll be asked whether you want to [overwrite that installation](./service-template-apps-install-distribute.md#update-a-template-app) or install to another workspace.

    After the app has installed, it appears on your Apps page.

   :::image type="content" source="media/service-connect-to-pbi-premium-capacity-metrics/service-pbi-premium-capacity-metrics-app-apps-page-icon.png" alt-text="Screenshot of the Power BI apps page, the Power BI Premium Capacity Metrics app is highlighted.":::

## Connect to data sources

1. Select **Power BI Premium Capacity Metrics** on your Apps page.

1. The app opens, showing sample data. Select the **Connect your data** link on the banner at the top of the page.

   :::image type="content" source="media/service-connect-to-pbi-premium-capacity-metrics/service-pbi-premium-capacity-metrics-app-connect-data.png" alt-text="Screenshot of the Power BI Premium Capacity Metrics app banner with the connect your data link highlighted." lightbox="media/service-connect-to-pbi-premium-capacity-metrics/service-pbi-premium-capacity-metrics-app-connect-data.png":::

1. In the dialog box that appears, set the UTC offset, that is, the difference in hours between Coordinated Universal Time (UTC) and the time in your location. Select **Next**.
  
   :::image type="content" source="media/service-connect-to-pbi-premium-capacity-metrics/service-pbi-premium-capacity-metrics-app-setutc-dialog.png" alt-text="Screenshot of the connect dialog with UTC offset, UTC input and next are highlighted.":::
   **Note: The format for half hours should be decimal (for example, 5.5, 2.5, etc.).**

1. In the next dialog that appears, you don't have to do anything. Just select **Sign in and connect**.

   :::image type="content" source="media/service-connect-to-pbi-premium-capacity-metrics/premium-capacity-connect-sign-in-and-connect.png" alt-text="Screenshot of the authentication dialog with sign-in and connect highlighted.":::

1. At the Microsoft **Pick an account** dialog, select an account to sign in to Power BI.

   :::image type="content" source="media/service-connect-to-pbi-premium-capacity-metrics/service-pbi-premium-capacity-metrics-app-microsoft-login.png" alt-text="Screenshot of the Microsoft pick an account dialog.":::

   After you're signed in, the report connects to the data sources and is populated with up-to-date data. During this time, the activity monitor turns.

   :::image type="content" source="media/service-connect-to-pbi-premium-capacity-metrics/refresh-is-in-progress.png" alt-text="Screenshot of the banner showing refresh is in progress highlighted." lightbox="media/service-connect-to-pbi-premium-capacity-metrics/refresh-is-in-progress.png":::

   Your report data will automatically refresh once a day, unless you disabled this setting during the sign-in process. You can also [set up your own refresh schedule](./refresh-scheduled-refresh.md) to keep the report data up to date if you so desire.

## Customize and share

To start customizing the app, click the pencil icon in the upper right corner.

 :::image type="content" source="media/service-connect-to-pbi-premium-capacity-metrics/service-pbi-premium-capacity-metrics-app-customize.png" alt-text="Screenshot of a Power BI window showing the pencil icon.":::

For more information, see [Customize and share the app](./service-template-apps-install-distribute.md#customize-and-share-the-app).

## Next steps

* [Use the Gen2 metrics app](../enterprise/service-premium-gen2-metrics-app.md)
* [Premium Capacity Metrics app blog post](https://powerbi.microsoft.com/blog/premium-capacity-metrics-app-new-health-center-with-kpis-to-explore-relevant-metrics-and-steps-to-mitigate-issues/)
* [What are Power BI template apps?](./service-template-apps-overview.md)
* [Install, share and update template apps in your organization](./service-template-apps-install-distribute.md)
* Questions? [Ask the Power BI Community](https://community.powerbi.com/)
