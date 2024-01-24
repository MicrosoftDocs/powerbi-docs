---
title: Connect to the Crisis Communication Presence Report
description: How to get and install the COVID-19 Crisis Communication Presence Report template app, and how to connect to data
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-template-apps
ms.topic: how-to
ms.date: 04/06/2020
LocalizationGroup: Connect to services
---
# Connect to the Crisis Communication Presence Report

This Power BI app is the report/dashboard artifact in the Microsoft Power Platform solution for Crisis Communication. It tracks worker location for Crisis Communication app users. The solution combines capabilities of Power Apps, Power Automate, Teams, SharePoint and Power BI. It can be used on the web, mobile or in Teams.

![Crisis Communication Presence Report app report](media/service-connect-to-crisis-communication-presence-report/service-crisis-communication-presence-report.png)

The dashboard shows emergency managers aggregate data across their health system to help them to make timely, correct decisions.

This article tells  you how to install the app and how to connect to the data sources. For more information about the Crisis Communication app, see [Set up and learn about the Crisis Communication sample template in Power Apps](/powerapps/maker/canvas-apps/sample-crisis-communication-app)

After you've installed the template app and connected to the data sources, you can customize the report as per your needs. You can then distribute it as an app to colleagues in your organization.

## Prerequisites

Before installing this template app, you must first install and set up the [Crisis Communication sample](/powerapps/maker/canvas-apps/sample-crisis-communication-app). Installing this solution creates the datasource references necessary to populate the app with data.

When installing the Crisis Communication sample, take note of the [SharePoint list folder path of "CI_Employee Status" and list ID](/powerapps/maker/canvas-apps/sample-crisis-communication-app#monitor-office-absences-with-power-bi).

## Install the app

1. Click the following link to get to the app: [Crisis Communication Presence Report template app](https://appsource.microsoft.com/en-us/product/power-bi/pbi-contentpacks.crisiscomms)

1. On the AppSource page for the app, select [**GET IT NOW**](https://appsource.microsoft.com/en-us/product/power-bi/pbi-contentpacks.crisiscomms).

    [![Crisis Communication Presence Report app in AppSource](media/service-connect-to-crisis-communication-presence-report/service-crisis-communication-presence-report-app-appsource-get-it-now.png)](https://appsource.microsoft.com/en-us/product/power-bi/pbi-contentpacks.crisiscomms)

1. Read the information in **One more thing**, and select **Continue**.

    ![Crisis Communication Presence Report app, One more thing](media/service-connect-to-crisis-communication-presence-report/service-crisis-communication-presence-report-1-more-thing.png)

1. Select **Install**. 

    ![Install the Crisis Communication Presence Report app](media/service-connect-to-crisis-communication-presence-report/service-crisis-communication-presence-report-select-install.png)

    Once the app has installed, you see it on your Apps page.

   ![Crisis Communication Presence Report app on App page](media/service-connect-to-crisis-communication-presence-report/service-crisis-communication-presence-report-app-apps-page-icon.png)

## Connect to data sources

1. Select the icon on your Apps page to open the app.


   The app opens, showing sample data.

1. Select the **Connect your data** link on the banner at the top of the page.

   ![Crisis Communication Presence Report app connect your data link](media/service-connect-to-crisis-communication-presence-report/service-crisis-communication-presence-report-app-connect-data.png)

1. In the dialog box:
   1. In the SharePoint_Folder field, enter your ["CI_Employee Status" SharePoint list path](/powerapps/maker/canvas-apps/sample-crisis-communication-app#monitor-office-absences-with-power-bi).
   1. In the List_ID field, enter your list ID that you got from list settings. When done, click **Next**.

   ![Crisis Communication Presence Report app URL dialog](media/service-connect-to-crisis-communication-presence-report/service-crisis-communication-presence-report-app-url-dialog.png)

1. In the next dialog that appears, set the authentication method to **OAuth2**. You don't have to do anything to the privacy level setting.

   Select **Sign in**.

   ![Crisis Communication Presence Report app authentication dialog](media/service-connect-to-crisis-communication-presence-report/service-crisis-communication-presence-report-app-authentication-dialog.png)

1. At the Microsoft sign-in screen, sign in to Power BI.

   ![Microsoft sign-in screen](media/service-connect-to-crisis-communication-presence-report/service-crisis-communication-presence-report-app-microsoft-login.png)

   After you've signed in, the report connects to the data sources and is populated with up-to-date data. During this time, the activity monitor turns.

   ![Crisis Communication Presence Report app refresh in progress](media/service-connect-to-crisis-communication-presence-report/service-crisis-communication-presence-report-app-refresh-monitor.png)

## Schedule report refresh

When the data refresh has completed, [set up a refresh schedule](../connect-data/refresh-scheduled-refresh.md) to keep the report data up to date.

1. In the top header bar, select **Power BI**.

   ![Power BI breadcrumb](media/service-connect-to-crisis-communication-presence-report/service-crisis-communication-presence-report-app-powerbi-breadcrumb.png)

1. In the left navigation pane, look for the Hospital Emergency Response Decision Support Dashboard workspace under **Workspaces**, and follow the instruction described in the [Configure scheduled refresh](../connect-data/refresh-scheduled-refresh.md) article.

## Customize and share

See [Customize and share the app](../connect-data/service-template-apps-install-distribute.md#customize-and-share-the-app) for details. Be sure to review the [report disclaimers](../create-reports/sample-covid-19-us.md#disclaimers) before publishing or distributing the app.

## Related content

* [Set up and learn about the Crisis Communication sample template in Power Apps](/powerapps/maker/canvas-apps/sample-crisis-communication-app)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
* [What are Power BI template apps?](../connect-data/service-template-apps-overview.md)
* [Install and distribute template apps in your organization](../connect-data/service-template-apps-install-distribute.md)
