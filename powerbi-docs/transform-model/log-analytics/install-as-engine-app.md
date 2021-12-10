---
title: Installing the Log Analytics for Power BI Datasets Template App (preview)
description: Installation guide for the Template App that visualizes Dataset activity from Analysis Services
author: Bhavik-MSFT
ms.author: bhmerc
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 12/10/2021
LocalizationGroup: Transform and shape data
---
# Installing the Log Analytics for Power BI Datasets Template App (preview)

The Power BI Log Analytics for Analysis Services Engine app is designed to analyze AS Engine behavior in general, and to help isolate and debug specific problems in depth. Use this guide to install the app. Once the app is installed, you can [learn how to use it](desktop-loganalytics-reportguide-datasets.md).

>[!NOTE]
>The app is updated regularly with new features and functionalities. If you see there's a pending update in the notifications center, we recommend that you update the app.

## Prerequisites

Before you install the AS Engine app, review these requirements:

* You need to have a Log Analytics Workspace 

## Install the app

To install the AS Engine app, follow these steps:

1. Go to [AppSource > Power BI Log Analytics for Analysis Services Engine](https://aka.ms/AS_Engine_TemplateApp) and select **Get it now**.

1. If prompted, sign in to AppSource using your work or school account and complete the registration screen. The app will take you to the Power BI Service to complete the process. Select **Install** to continue.

1. Open the app and when you see the message *You have to connect to your own data to view this report*, select **Connect**.

    ![Install AS Engine - Connect your own data](media/install-as-engine-app/InstallASEngine.png)

1. In the first window, fill in the following fields:

    * **Days Ago to Start** - How many days ago to start loading log data. Maximum value you can select here is 30 days.

    * **Days Ago to Finish** - How many days ago to stop loading log data. Use 0 for today. 
    * **Log Analytics Table** - 
 ​
       ​* PowerBIDatasetsWorkspace 

       ​* PowerBIDatasetsTenant (Currently not supported.)


    * **Log Analytics WorkspaceId** - GUID of the Azure Log Analytics Workspace containing the AS Engine data.

    * **UTC Offset Hours** - An hourly offset used to convert the data from UTC to a local time zone

    * **Pagination Hours** - This is an optional parameter. It describes the time window for each log analytics call from Power BI. You only need to update this if you're running into failures while fetching data due to data size exceeding Log Analytics limits.
​

4. Select **Next**.

5. In the second window, fill in the following fields:

   ​* **Authentication method** - Select your authentication method. The default authentication method is *OAuth2*.

   ​* **Privacy level setting for this data source** - Select *Organizational* to enable app access to all the data sources in your organization.


6. Select **Sign in and continue**.

## Next steps

* [Using the Log Analytics for Power BI Datasets Template App (preview)](desktop-loganalytics-reportguide-datasets.md)