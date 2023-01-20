---
title: 'Third-party service: Google Analytics connector'
description: Learn how to connect to Google Analytics data with the Google Analytics connector from Power BI Desktop.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 01/20/2023
LocalizationGroup: Connect to data
---
# Use the Google Analytics connector for Power BI Desktop

> [!NOTE]
> The Google Analytics connector in Power BI Desktop relies on the Google Analytics Core Reporting API. As such, features and availability can vary over time.

You can connect to Google Analytics data using the **Google Analytics** connector. To connect, follow these steps:

1. In **Power BI Desktop**, select **Get data** from the **Home** ribbon tab.
2. In the **Get Data** window, select **Online Services** from the categories in the left pane.
3. Select **Google Analytics** from the selections in the right pane.
4. At the bottom of the window, select **Connect**.  
   :::image type="content" source="media/service-google-analytics-connector/tps_googleanalytics_1.png" alt-text="Screenshot of the Get Data ribbon with online services, Google Analytics, and Connect highlighted.":::

You're prompted with a dialog that explains that the connector is a Third-Party Service, and warns about how features and availability can change over time, and other clarifications.  
![Screenshot of the connection dialog, showing a warning that the connector relies on a third-party Service.](media/service-google-analytics-connector/tps_googleanalytics_2.png)

When you select **Continue**, you're prompted to sign in to Google Analytics.  
![Screenshot of the Google account dialog showing that you aren't signed in.](media/service-google-analytics-connector/tps_googleanalytics_3.png)

When you enter your credentials, you're prompted that Power BI would like to have offline access. This is how you use **Power BI Desktop** to access your Google Analytics data.  

Once you accept, **Power BI Desktop** shows that you're currently signed in.  
![Screenshot of the Google account dialog, showing that you're signed in.](media/service-google-analytics-connector/tps_googleanalytics_5.png)

Select **Connect**, and your Google Analytics data is connected to **Power BI Desktop**, and loads the data.  
![Screenshot of the Load dialog, showing the Google Analytics data is connected and loading.](media/service-google-analytics-connector/tps_googleanalytics_6.png)

## Changes to the API

Although we attempt to release updates in accordance with any changes, the API might change in a way that affects the results of the queries we generate. In some cases, certain queries might no longer be supported. Due to this dependency, we can't guarantee the results of your queries when you use this connector.

More details on changes to the Google Analytics API can be found in the [Google Analytics - All API Changelogs](https://developers.google.com/analytics/devguides/changelog).
