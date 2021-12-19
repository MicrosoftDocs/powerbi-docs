---
title: Install the Premium Gen2 metrics app
description: Learn how to install the Premium Gen2 metrics app, which lets monitor Power BI Premium Gen2 capacities.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 12/19/2021
LocalizationGroup: Premium 
---

# Install the Gen2 metrics app

The *Power BI Premium Utilization and Metrics* app is designed to provide monitoring capabilities for Power BI Gen2 Premium capacities. Use this guide to install the app. Once the app is installed, you can [learn how to use it](service-premium-gen2-metrics-app.md).

>[!NOTE]
>The app is updated regularly with new features and functionalities. If you see there's a pending update in the notifications center, we recommend that you update the app.

## Prerequisites

Before you install the Gen2 metrics app, review these requirements:

* You need to be a capacity admin

* The app only works with Gen2 capacities

## Install the app

Follow the steps below according to the type of installation you need.

>[!NOTE]
>If you're installing the app in a government cloud environment, use one of these links:
>
>* [Microsoft 365 Government Community Cloud (GCC)](https://aka.ms/USGovCapacityUsageReport)
>
>* [Microsoft 365 Government Community Cloud High (GCC High)](https://aka.ms/USGovHighCapacityUsageReport)
>
>* [Microsoft 365 Department of Defense (DoD)](https://aka.ms/USGovDodCapacityUsageReport)

# [First time installation](#tab/1st)

To install the *Power BI Premium Capacity Utilization and Metrics* app for the first time, follow these steps:

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

3. In the *Install this Power BI app* window, select **Install**.

    :::image type="content" source="media\service-premium-install-gen2-app\install-app.png" alt-text="Screen capture of the install this Power B I app, with the install button highlighted.":::

4. Wait a few seconds for the app to install.

# [Upgrade the app](#tab/upgrade)

To upgrade a previous installation of the *Power BI Premium Capacity Utilization and Metrics* app, follow these steps:

1. Select one of these options to get the app from AppSource:

    * Go to [AppSource > Power BI Premium Capacity Utilization and Metrics](https://appsource.microsoft.com/product/power-bi/pbi_pcmm.pbipremiumcapacitymonitoringreport) and select **Get it now**.

    * In Power BI service, do the following:

        1. Select **Apps**.

        2. Select **Get apps**.

        3. Search for **Power BI Premium**.

        4. Select the **Power BI Premium Capacity Utilization and Metrics** app.

        5. Select **Get it now**.

2. In the **Update app** window, select one of the following:

    * **Update the workspace and the app** - Updates the current app you have and the Power BI workspace it resides in. This is the default option for upgrading the app. It will remove the current version and its workspace and replace them with the new version of the app and a corresponding workspace.

    * **Update only workspace content without updating the app** - Updates the Power BI workspace but doesn't update the app. Select this option to update the app's workspace without upgrading the app.

    * **Install another copy of the app into a new workspace** - Creates a new Power BI workspace and installs the new version of the app in this workspace. Select this option if you want to keep the old version of the app alongside the new one. This option creates another workspace for the app new version and installs the app in the newly created workspace. If you select this option, you'll need to provide a name for the new workspace.

3. Select **Install**.

    :::image type="content" source="media\service-premium-install-gen2-app\update-app.png" alt-text="Screen capture of the update app window, with the update the workspace and the app option selected, and the install button highlighted.":::

---

## Run the app for the first time

To complete the installation, you need to configure the Power BI Premium utilization and metrics app by running it for the first time.

1. In Power BI service, select **Apps**.

2. Select the **Premium Capacity Utilization And Metrics** app.

3. when you see the message *You have to connect to your own data to view this report*, select **Connect**.

    :::image type="content" source="media\service-premium-install-gen2-app\app-setup-connect.png" alt-text="Screen capture of the power B I premium utilization and metrics app's setup screen, showing the connect button.":::

4. In the **Connect to Premium Capacity Utilization And Metrics** first window, fill in the following fields:

    * **CapacityID** - An ID of a capacity you're an admin of. You can find the capacity ID in the URL of the capacity management page. In the Power BI service, go to **Settings** > **Admin portal** > **Capacity settings**, then select a Gen2 capacity.

        The capacity ID is shown in the URL after */capacities/*. For example, `9B77CC50-E537-40E4-99B9-2B356347E584` is the capacity ID in this URL: `https://app.powerbi.com/admin-portal/capacities/9B77CC50-E537-40E4-99B9-2B356347E584`.

    * **UTC_offset** - 0

    * **Timepoint** - The start time for the time period you want the app to draw metrics for. Set this value using a valid date time format such as `mm/dd/yyyy`.

    * **Timepoint2** - The end time for the time period you want the app to draw metrics for. Set this value using a valid date time format such as `mm/dd/yyyy`.

    >[!NOTE]
    >The app automatically refreshed your data at midnight. This option can be disabled by expanding the *advanced* option.

5. Select **Next**.

6. In the In the **Connect to Premium Capacity Utilization And Metrics** second window, fill in the following fields:

    * **Authentication method** - Select your authentication method. The default authentication method is *OAuth2*.

    * **Privacy level setting for this data source** - Select *Organizational* to enable app access to all the data sources in your organization.

    >[!NOTE]
    >*ExtensionDataSourceKind* and *ExtensionDataSourcePath* are internal fields related to the app's connector. Do not change the values of these fields.

7. Select **Sign in and continue**.

    :::image type="content" source="media/service-premium-install-gen2-app/second-window.png" alt-text="Screen capture showing the second connect to premium capacity utilization and metrics window. The authentication method option is set to O Auth 2 and the privacy level setting for this data source option is set to organizational. The sign in and continue button is highlighted":::

8. After configuring the app, it may take a few minutes for the app to get your data. If you run the app and it's not displaying any data, refresh the app. This behavior happens only when you open the app for the first time.

    :::image type="content" source="media\service-premium-install-gen2-app\refresh-app.png" alt-text="Screen capture of the Power B I premium utilization and metrics app displaying no data.":::

## Next steps

> [!div class="nextstepaction"]
> [Use the gen2 metrics app](service-premium-gen2-metrics-app.md)
