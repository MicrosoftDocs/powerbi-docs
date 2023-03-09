---
title: Install the Log Analytics for Power BI Datasets Template App (preview)
description: Learn how to install the Template App that visualizes dataset activity from the Analysis Services.
author: bstar92
ms.author: kesharab
ms.reviewer: bstar92
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 05/20/2022
LocalizationGroup: Transform and shape data
---
# Install the Log Analytics for Power BI Datasets Template App (preview)

The Power BI Log Analytics for Analysis Services Engine app is designed to analyze AS Engine behavior in general, and to help isolate and debug specific problems in depth. Use this guide to install the app. After the app is installed, you can [learn how to use it](desktop-loganalytics-reportguide-datasets.md).

>[!NOTE]
>The app is updated regularly with new features and functionalities. If you see there's a pending update in the notifications center, we recommend that you update the app.
>
## Prerequisites

Before you install the AS Engine app, review these requirements:

* You need to have a Log Analytics Workspace

## Install the app

To install the AS Engine app, follow these steps:

1. Go to [AppSource > Power BI Log Analytics for Analysis Services Engine](https://appsource.microsoft.com/product/power-bi/pbi_pcmm.powerbiloganalyticsforasengine) and select **Get it now**.

1. If prompted, sign in to AppSource by using your work or school account and complete the registration screen. The app takes you to the Power BI Service to complete the process. Select **Install** to continue.

1. Open the app and when you see the message *You have to connect to your own data to view this report*, select **Connect**.

    :::image type="content" source="media/install-as-engine-app/install-as-engine.png" alt-text="Screenshot of Install AS Engine connect dialog.":::

1. In the first window, fill in the following fields:

    * **Days Ago to Start** - How many days ago to start loading log data. The maximum value you can select is 30 days.

    * **Days Ago to Finish** - How many days ago to stop loading log data. Use 0 for today.
    * **Log Analytics Table** -
 ​
       ​* PowerBIDatasetsWorkspace

       ​* PowerBIDatasetsTenant (Currently not supported.)

    * **Log Analytics WorkspaceId** - GUID of the Azure Log Analytics Workspace containing the AS Engine data.

    * **UTC Offset Hours** - An hourly offset used to convert the data from UTC to a local time zone

    * **Pagination Hours** - This parameter is optional. It describes the time window for each log analytics call from Power BI. You only need to update this parameter if you're running into failures while fetching data due to data size exceeding Log Analytics limits.
​

1. Select **Next**.

1. In the second window, fill in the following fields:

   ​***Authentication method** - Select your authentication method. The default authentication method is*OAuth2*.

   ​***Privacy level setting for this data source** - Select*Organizational* to enable app access to all the data sources in your organization.

1. Select **Sign in and continue**.

## Considerations and limitations

1. Template app doesn't work when private links are enabled on the Log Analytics workspace.
    * Power BI doesn't currently support refresh and ingestion of data in the template app when you enable private links for the Azure Log Analytics workspace and switch off the Network Isolation settings. To allow the template app to function, be sure that the settings shown in the following screenshot are switched **on**.

        :::image type="content" source="media/install-as-engine-app/network-isolation-log-analytics.png" alt-text="Screenshot of Network Isolation option.":::

        :::image type="content" source="media/install-as-engine-app/virtual-network-access-configuration.png" alt-text="Screenshot of Virtual Network Access Configuration toggles.":::

## Next steps

* [Using the Log Analytics for Power BI Datasets Template App (preview)](desktop-loganalytics-reportguide-datasets.md)
