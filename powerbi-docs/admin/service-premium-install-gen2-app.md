---
title: Install the Premium Gen2 metrics app
description: Learn how to install the Premium Gen2 metrics app, which lets monitor Power BI Premium Gen2 capacities.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 08/18/2021
LocalizationGroup: Premium 
---

# Install the Gen2 metrics app (preview)

The Power BI Premium utilization and metrics app is designed to provide monitoring capabilities for Power BI Gen2 Premium capacities. Use this guide to install the app. Once the app is installed, you can [learn how to use it](service-premium-gen2-metrics-app.md).

The app is updated regularly with new features and functionalities. If you see there's a pending update in the notifications center, we recommend that you update the app.

## Prerequisites

Before you install the Gen2 metrics app, review these requirements:

* You need to be a capacity admin

* The app only works with Gen2 capacities

## Install the app

To install the Gen2 metrics app, follow these steps:

1. Go to [AppSource > Power BI Premium Capacity Utilization and Metrics](https://appsource.microsoft.com/product/power-bi/pbi_pcmm.pbipremiumcapacitymonitoringreport) and select **Get it now**.

   :::image type="content" source="media/service-premium-install-gen2-app/app-get-it-now.png" alt-text="Screen capture of app download with get it now button highlighted.":::

1. If prompted, sign in to AppSource using your work or school account and complete the registration screen. The app will take you to the Power BI Service to complete the process. Select **Install** to continue.

1. Open the app and when you see the message *You have to connect to your own data to view this report*, select **Connect**.

    :::image type="content" source="media\service-premium-install-gen2-app\app-setup-connect.png" alt-text="Screen capture of setup screen showing connect button.":::

3. In the first window, fill in the following fields:

    * **CapacityID** - An ID of a capacity you're an admin of. You can find the capacity ID in the URL of the capacity management page. In the Power BI service, go to **Settings** > **Admin portal** > **Capacity settings**, then select a Gen2 capacity. The capacity ID is shown in the URL.

   :::image type="content" source="media/service-premium-install-gen2-app/connect-capacity-id.png" alt-text="Screen capture showing where to find the capacity I D in the page U R L.":::

    * **UTC_offset** - 0

    * **APIBaseURL** - `api.powerbi.com`

    * (Optional) - The app automatically refreshes data every day at midnight. To turn off this option, expand the *Advanced* option and turn the switch off.

4. Select **Next**.

5. In the second window, fill in the following fields:

    * **Authentication method** - Select your authentication method. The default authentication method is *OAuth2*.

    * **Privacy level setting for this data source** - Select *Organizational* to enable app access to all the data sources in your organization.

    >[!NOTE]
    >*ExtensionDataSourceKind* and *ExtensionDataSourcePath* are internal fields related to the app's connector. Do not change the values of these fields.

6. Select **Sign in and continue**.

## Next steps

> [!div class="nextstepaction"]
> [Use the gen2 metrics app](service-premium-gen2-metrics-app.md)
