---
title: Connect to the Hospital Emergency Response Decision Support Dashboard
description: How to get and install the COVID-19 Decision Support Dashboard for healthcare emergency template app, and how to connect to data
author: paulinbar

ms.service: powerbi
ms.subservice: powerbi-template-apps
ms.topic: conceptual
ms.date: 04/03/2020
ms.author: painbar

LocalizationGroup: Connect to services
---
# Connect to the Hospital Emergency Response Decision Support Dashboard
The Hospital Emergency Response Decision Support Dashboard template app is the reporting component of the [Microsoft Power Platform solution for healthcare emergency response](https://docs.microsoft.com/powerapps/maker/canvas-apps/sample-crisis-communication-app). The dashboard shows emergency managers aggregate data across their health system to help them to make timely, correct decisions.

This article tells  you how to install the app and how to connect to the data sources.

![Hospital Emergency Response Decision Support Dashboard app report](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-report.png)

After you've installed the template app and connected to the data sources, you can customize the report as per your needs. You can then distribute it as an app to colleagues in your organization.

## Install the app

1. Select the following image to get to the app.

   [![Hospital Emergency Response Decision Support Dashboard web app](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-logo.png)](https://appsource.microsoft.com/product/power-bi/pbi-contentpacks.powerapps_healthcare)

1. On the AppSource page for the app, select **GET IT NOW**.

    ![Hospital Emergency Response Decision Support Dashboard app in AppSource](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-appsource-get-it-now.png)

1. Read the information in **One more thing**, and select **Continue**.

    ![Hospital Emergency Response Decision Support Dashboard app, One more thing](media/service-connect-to-health-emergency-response/service-health-emergency-response-1-more-thing.png)

1. Select **Install**. 

    ![Install the Hospital Emergency Response Decision Support Dashboard app](media/service-connect-to-health-emergency-response/service-health-emergency-response-select-install.png)

    Once the app has installed, you see it on your Apps page.

   ![Hospital Emergency Response Decision Support Dashboard app on App page](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-apps-page-icon.png)

## Connect to data sources

1. Select the icon on your Apps page to open the app.

1. On the splash screen, select **Explore**.

   ![Template app splash screen](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-splash-screen.png)

   The app opens, showing sample data.

1. Select the **Connect your data** link on the banner at the top of the page.

   ![Hospital Emergency Response Decision Support Dashboard app connect your data link](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-connect-data.png)

1. In the dialog box, enter the name of your organization, for example, "Contoso Health Systems". This field is optional. This name appears in the upper-left side of the dashboard.
   
1. In the CDS_base_solution field, enter your organization's Emergency Response App URL to the CDS database > **Next**.

   ![Hospital Emergency Response Decision Support Dashboarde app URL dialog](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-url-dialog.png)

1. In the next dialog that appears, set the authentication method to **OAuth2**. You don't have to do anything to the privacy level setting.

   Select **Sign in**.

   ![Hospital Emergency Response Decision Support Dashboard app authentication dialog](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-authentication-dialog.png)

1. At the Microsoft sign-in screen, sign in to Power BI.

   ![Microsoft sign-in screen](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-microsoft-login.png)

   After you've signed in, the report connects to the data sources and is populated with up-to-date data. During this time, the activity monitor turns.

   ![Hospital Emergency Response Decision Support Dashboard app refresh in progress](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-refresh-monitor.png)

## Schedule report refresh

When the data refresh has completed, [set up a refresh schedule](../refresh-scheduled-refresh.md) to keep the report data up to date.

1. In the top header bar, select **Power BI**.

   ![Power BI breadcrumb](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-powerbi-breadcrumb.png)

1. In the left navigation pane, look for the Hospital Emergency Response Decision Support Dashboard workspace under **Workspaces**, and follow the instruction described in the [Configure scheduled refresh](../refresh-scheduled-refresh.md) article.

## Customize and share

See [Customize and share the app](../service-template-apps-install-distribute.md#customize-and-share-the-app) for details. Be sure to review the [report disclaimers](../create-reports/sample-covid-19-us.md#disclaimers) before publishing or distributing the app.

## Next steps
* [Set up and learn about the Crisis Communication sample template in Power Apps](https://docs.microsoft.com/powerapps/maker/canvas-apps/sample-crisis-communication-app)
* [COVID-19 tracking sample for US state and local governments](../create-reports/sample-covid-19-us.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
* [What are Power BI template apps?](../service-template-apps-overview.md)
* [Install and distribute template apps in your organization](../service-template-apps-install-distribute.md)
