---
title: 'Third-party service: Google Analytics connector'
description: 'Third-party service: Google Analytics connector for Power BI Desktop'
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 05/08/2019
LocalizationGroup: Connect to data
---
# Use the Google Analytics connector for Power BI Desktop
> [!NOTE]
> The Google Analytics template app and the connector in Power BI Desktop rely on the Google Analytics Core Reporting API. As such, features and availability may vary over time.

You can connect to Google Analytics data using the **Google Analytics** connector. To connect, follow these steps:

1. In **Power BI Desktop**, select **Get Data** from the **Home** ribbon tab.
2. In the **Get Data** window, select **Online Services** from the categories in the left pane.
3. Select **Google Analytics** from the selections in the right pane.
4. At the bottom of the window, select **Connect**.  
   ![Screenshot of the Home tab, showing the Get Data ribbon with Google Analytics selected and Connect button.](media/service-google-analytics-connector/tps_googleanalytics_1.png)

You're prompted with a dialog that explains that the connector is a Third-Party Service, and warns about how features and availability may change over time, and other clarifications.  
![Screenshot of the connection dialog, showing a warning that the connector relies on a Third-Party Service.](media/service-google-analytics-connector/tps_googleanalytics_2.png)

When you select **Continue**, you're prompted to sign in to Google Analytics.  
![Screenshot of the Google Analytics prompt, showing that you need to sign in to connect.](media/service-google-analytics-connector/tps_googleanalytics_3.png)

When you enter your credentials, you're prompted that Power BI would like to have offline access. This is how you use **Power BI Desktop** to access your Google Analytics data.  

Once you accept, **Power BI Desktop** shows that you're currently signed in.  
![Screenshot of the Google Analytics prompt, showing that you are signed in.](media/service-google-analytics-connector/tps_googleanalytics_5.png)

Select **Connect**, and your Google Analytics data is connected to **Power BI Desktop**, and loads the data.  
![Screenshot of the Load dialog, showing the Google Analytics data is connected and loading.](media/service-google-analytics-connector/tps_googleanalytics_6.png)

## Changes to the API
Although we attempt to release updates in accordance with any changes, the API may change in a way that affects the results of the queries we generate. In some cases, certain queries may no longer be supported. Due to this dependency we cannot guarantee the results of your queries when using this connector.

More details on changes to the Google Analytics API can be found in their [changelog](https://developers.google.com/analytics/devguides/changelog).

