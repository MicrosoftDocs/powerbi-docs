---
title: Install the Premium Gen2 metrics app
description: Learn how to install the Premium Gen2 metrics app, which lets monitor Power BI Premium Gen2 capacities.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 12/14/2021
LocalizationGroup: Premium 
---

# Install the Gen2 metrics app

The Power BI Premium utilization and metrics app is designed to provide monitoring capabilities for Power BI Gen2 Premium capacities. Use this guide to install the app. Once the app is installed, you can [learn how to use it](service-premium-gen2-metrics-app.md).

>[!NOTE]
>The app is updated regularly with new features and functionalities. If you see there's a pending update in the notifications center, we recommend that you update the app.

## Prerequisites

Before you install the Gen2 metrics app, review these requirements:

* You need to be a capacity admin

* The app only works with Gen2 capacities

## Install the app for the first time

To install the Power BI Premium Capacity Utilization and Metrics app for the first time, follow these steps:

1. Select one of these options to get the app from AppSource:

    * Go to [AppSource > Power BI Premium Capacity Utilization and Metrics](https://appsource.microsoft.com/product/power-bi/pbi_pcmm.pbipremiumcapacitymonitoringreport) and select **Get it now**.

    * In Power BI service, do the following:

        1. Select **Apps**.

        2. Select **Get apps**.

        3. Search for **Power BI Premium**.

        4. Select the **Power BI Premium Capacity Utilization and Metrics** app.

        5. Select **Get it now**.

2. When prompted, sign in to AppSource using your Microsoft account and complete the registration screen. The app will take you to the Power BI service to complete the process. Select **Install** to continue.

    :::image type="content" source="media\service-premium-install-gen2-app\one-more-thing.png" alt-text="Screen capture of the one more thing window which includes fields to fill in with your Microsoft account details.":::

3. In the *Install this Power BI app* window, select install.

    :::image type="content" source="media\service-premium-install-gen2-app\install-app.png" alt-text="Screen capture of the install this Power B I app, with the install button highlighted.":::

4. Wait a few seconds for the app to install.

## Upgrade the app

To upgrade a previous installation of the Power BI Premium Capacity Utilization and Metrics app, follow these steps:

1. Select one of these options to get the app from AppSource:

    * Go to [AppSource > Power BI Premium Capacity Utilization and Metrics](https://appsource.microsoft.com/product/power-bi/pbi_pcmm.pbipremiumcapacitymonitoringreport) and select **Get it now**.

    * In Power BI service, do the following:

        1. Select **Apps**.

        2. Select **Get apps**.

        3. Search for **Power BI Premium**.

        4. Select the **Power BI Premium Capacity Utilization and Metrics** app.

        5. Select **Get it now**.

2. In the **Update app** window, select one of the following:

    * **Update the workspace and the app** - Updates the current app you have and the Power BI workspace it resides in. This is the default option for upgrading the app. It'll remove the current version and its workspace and replace them with the new app version and a corresponding workspace.

    * **Update only workspace content without updating the app** - Updates the Power BI workspace but doesn't update the app. Select this option to update your workspace without upgrading the app.

    * **Install another copy of the app into a new workspace** - Creates a new Power BI workspace and installs the new version of the app in this workspace. Select this option if you want to keep the old version of the app alongside the new one. This option creates another workspace for the app new version and installs the app in the newly created workspace. If you select this option, you'll need 

## Run the app for the first time

To complete the installation, you need to configure the Power BI Premium utilization and metrics app by running it for the first time.

1. In Power BI service, select **Apps**.

2. Select the **Premium Capacity Utilization And Metrics** app.

3. when you see the message *You have to connect to your own data to view this report*, select **Connect**.

    :::image type="content" source="media\service-premium-install-gen2-app\app-setup-connect.png" alt-text="Screen capture of setup screen showing connect button.":::

4. In the **Connect to Premium Capacity Utilization And Metrics** window, fill in the following fields:

    * **CapacityID** - An ID of a capacity you're an admin of. You can find the capacity ID in the URL of the capacity management page. In the Power BI service, go to **Settings** > **Admin portal** > **Capacity settings**, then select a Gen2 capacity. The capacity ID is shown in the URL.

     :::image type="content" source="media/service-premium-install-gen2-app/connect-capacity-id.png" alt-text="Screen capture showing where to find the capacity I D in the page U R L.":::

    * **UTC_offset** - 0

    * **Timepoint** - The time that you want the app to draw metrics for. Set this value using a valid date time format such as `dd/mm/yyyy hh/mm/ss`.

5. Select **Next**.

6. In the second window, fill in the following fields:

    * **Authentication method** - Select your authentication method. The default authentication method is *OAuth2*.

    * **Privacy level setting for this data source** - Select *Organizational* to enable app access to all the data sources in your organization.

    >[!NOTE]
    >*ExtensionDataSourceKind* and *ExtensionDataSourcePath* are internal fields related to the app's connector. Do not change the values of these fields.

6. Select **Sign in and continue**.

## Next steps

> [!div class="nextstepaction"]
> [Use the gen2 metrics app](service-premium-gen2-metrics-app.md)
