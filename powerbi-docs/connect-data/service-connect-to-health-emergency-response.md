---
title: Connect to the Hospital Emergency Response Dashboard
description: How to get and install the COVID-19 Decision Support Dashboard for healthcare emergency template app, and how to connect to data
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-template-apps
ms.topic: how-to
ms.date: 10/08/2024
LocalizationGroup: Connect to services
#customer intent:  As a healthcare emergency manager, I want to connect to and use the Hospital Emergency Response Decision Support Dashboard so that I can make timely and informed decisions based on aggregate data across the health system.
---
# Connect to the Hospital Emergency Response Decision Support Dashboard
The Hospital Emergency Response Decision Support Dashboard template app is the reporting component of the [Microsoft Power Platform solution for healthcare emergency response](/powerapps/sample-apps/emergency-response/deploy-configure). The dashboard shows emergency managers aggregate data across their health system to help them to make timely, correct decisions.

![Hospital Emergency Response Decision Support Dashboard app report](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-report.png)

This article tells  you how to install the app and how to connect to the data sources. To learn how to use the report that you'll see with this app, see the [Hospital Emergency Response Decision Support Dashboard documentation](/powerapps/sample-apps/emergency-response/deploy-configure).

After you've installed the template app and connected to the data sources, you can customize the report as per your needs. You can then distribute it as an app to colleagues in your organization.

## Prerequisites

Before installing this template app, you must first install and set up the [Hospital Emergency Response Power Platform solution](/powerapps/sample-apps/emergency-response/deploy-configure). Installing this solution creates the data source references necessary to populate the app with data.

When installing Hospital Emergency Response Power Platform solution, take note of the [URL of your Dataverse environment instance](/powerapps/sample-apps/emergency-response/deploy-configure#publish-the-power-bi-dashboard). You'll need it to connect the template app to the data.

## Install the app

1. Select the following link to get to the app: [Hospital Emergency Response Decision Support Dashboard template app](https://appsource.microsoft.com/en-us/product/dynamics-365/mscrm.pphersapp)

1. On the AppSource page for the app, select [**Get it now**](https://appsource.microsoft.com/en-us/product/dynamics-365/mscrm.pphersapp).

    [![Hospital Emergency Response Decision Support Dashboard app in AppSource](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-appsource-get-it-now.png)](https://aka.ms/AppSource_Hospital_offer)

1. You're taken to Dynamics365 where you're prompted to select an environment for installing the app.

1. Select **Install**.

    ![Install the Hospital Emergency Response Decision Support Dashboard app](media/service-connect-to-health-emergency-response/service-health-emergency-response-select-install.png)

    Once the app has installed, you see it on your Apps page.

## Connect to data sources

1. Select the entry in the list on your Apps page to open the app.

1. On the splash screen, select **Explore**.

   ![Template app splash screen](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-splash-screen.png)

   The app opens, showing sample data.

1. Select the **Connect your data** link on the banner at the top of the page.

   ![Hospital Emergency Response Decision Support Dashboard app connect your data link](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-connect-data.png)

1. In the dialog:
   1. In the organization name field, enter the name of your organization, for example, "Contoso Health Systems". This field is optional. This name appears in the upper-left side of the dashboard.
   1. In the CDS_base_solution field, Type the [URL of your Dataverse environment instance](/powerapps/sample-apps/emergency-response/deploy-configure#publish-the-power-bi-dashboard). For example: https://[myenv].crm.dynamics.com. When done, select **Next**.

   ![Hospital Emergency Response Decision Support Dashboard app URL dialog](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-url-dialog.png)

1. In the next dialog that appears, set the authentication method to **OAuth2**. You don't have to do anything to the privacy level setting.

   Select **Sign in**.

   ![Hospital Emergency Response Decision Support Dashboard app authentication dialog](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-authentication-dialog.png)

1. At the Microsoft sign-in screen, sign in to Power BI.

   ![Microsoft sign-in screen](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-microsoft-login.png)

   After you've signed in, the report connects to the data sources and is populated with up-to-date data. During this time, the activity monitor turns.

   ![Hospital Emergency Response Decision Support Dashboard app refresh in progress](media/service-connect-to-health-emergency-response/service-health-emergency-response-app-refresh-monitor.png)

## Schedule report refresh

When the data refresh has completed, [set up a refresh schedule](../connect-data/refresh-scheduled-refresh.md) to keep the report data up to date.

1. In the ribbon at the top of the report, select the three horizontal dots icon, then select **View semantic model**.

   ![View semantic model menu command](media/service-connect-to-health-emergency-response/service-health-emergency-response-menu.png)

1. On the page for the semantic model, select **Refresh** from the ribbon, then select **Schedule Refresh** and follow the instructions described in the [Configure scheduled refresh](../connect-data/refresh-scheduled-refresh.md) article.

## Customize and share

See [Customize and share the app](../connect-data/service-template-apps-install-distribute.md#customize-and-share-the-app) for details. Be sure to review the [report disclaimers](../create-reports/sample-covid-19-us.md#disclaimers) before publishing or distributing the app.

## Related content

* [Understanding the Hospital Emergency Response app](/powerapps/sample-apps/emergency-response/deploy-configure)
* [Set up and learn about the Crisis Communication sample app in Power Apps](/powerapps/maker/canvas-apps/sample-crisis-communication-app)
* [What are Power BI template apps?](../connect-data/service-template-apps-overview.md)
* [Install, share, and update template apps in your organization](../connect-data/service-template-apps-install-distribute.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
