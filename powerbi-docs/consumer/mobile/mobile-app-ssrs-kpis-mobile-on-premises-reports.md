---
title: View on-premises reports and KPIs in the Power BI mobile apps
description: Learn how the Power BI mobile apps offer access to your on-premises business content in SQL Server Reporting Services and Power BI Report Server.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 02/01/2023
---

# View on-premises report server reports and KPIs in the Power BI mobile apps

The Power BI mobile apps deliver live, touch-enabled mobile access to your on-premises business information in Power BI Report Server and SQL Server 2016 Reporting Services (SSRS).

Applies to:

| :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/iphone-logo-50-px.png"::: | :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/ipad-logo-50-px.png"::: | :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/android-phone-logo-50-px.png"::: | :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/android-tablet-logo-50-px.png"::: |
|:--- |:--- |:--- |:--- |
| iPhones |iPads |Android phones |Android tablets |

:::image type="content" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/power-bi-ipad-pbi-report-server-home.png" alt-text="Screenshot of the Report Server home in the mobile apps.":::

## First things first

**The mobile apps are where you view Power BI content, not where you create it.**

* You and other report creators in your organization [create Power BI reports with Power BI Desktop, then publish them to the Power BI Report Server](../../report-server/quickstart-create-powerbi-report.md) web portal.
* You create [KPIs right in the web portal](/sql/reporting-services/working-with-kpis-in-reporting-services), organize them in folders, and mark your favorites so you can find them easily.
* You [create Reporting Services mobile reports](/sql/reporting-services/mobile-reports/create-mobile-reports-with-sql-server-mobile-report-publisher) with SQL Server 2016 Enterprise Edition Mobile Report Publisher and publish them to the [Reporting Services web portal](/sql/reporting-services/web-portal-ssrs-native-mode).  

Then in the Power BI mobile apps, connect to up to five report servers to view the Power BI reports and KPIs, organized in folders or collected as favorites.

## Explore samples in the mobile apps without a server connection

Even if you don't have access to a Reporting Services web portal, you can still explore the features of Reporting Services mobile reports and KPIs.

1. Tap your profile picture in the upper-left corner and then tap **Settings** on the accounts panel that slides out.

2. On the settings page that opens, tap **Reporting Services samples**, then browse to interact with the sample KPIs and mobile reports.

   :::image type="content" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/power-bi-iphone-ssrs-samples.png" alt-text="Screenshot of Reporting Services samples.":::

## Connect to an on-premises report server

You can view on-premises Power BI reports, Reporting Services mobile reports, and KPIs in the Power BI mobile apps.

>[!NOTE]
> To connect to Report Server from your mobile app, you must have access to Report Server’s home folder. Contact the Report Server administrator if you don’t have such access.

1. On your mobile device, open the Power BI app.
2. If you haven't signed in to Power BI yet, tap **Report server**.

   :::image type="content" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/power-bi-connect-to-rs-login.png" alt-text="Screenshot of the Sign In dialog box with Report server highlighted.":::

   If you've already signed in to the Power BI app, tap your profile picture in the upper-left corner and then tap **Settings** on the accounts pane that slides out.
3. On the settings page that opens, tap **Connect to server**.

   :::image type="content" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/power-bi-android-server-sign-in.png" alt-text="Screenshot of the settings dialog box with Connect to server highlighted.":::

   The mobile app needs to access the server in some way. There are a few ways to do that:
    * Being on the same network/using VPN is the easiest way.
    * It's possible to use a Web Application Proxy to connect from outside the organization. For more information, see [Connect to Report Server and SSRS from your Power BI mobile applications](../../report-server/mobile-oauth-ssrs.md).
    * Open a connection (port) in the firewall.

4. Fill in the server address and give the server a friendly name, if you'd like. Use this format for the server address:

     `https://<servername>/reports`

     OR

     `http://<servername>/reports`

   Include **https** or **http** in front of the connection string.

   :::image type="content" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/power-bi-ios-connect-to-server-dialog.png" alt-text="Screenshot of the Connect to server dialog box.":::

5. Once you've typed in the server address and optional friendly name, tap **Connect**, and then fill in your username and password when prompted.
6. Now you see the server in the Accounts pane - in this example, it is called "Work server".

   :::image type="content" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/power-bi-iphone-left-nav-report-server.png" alt-text="Screenshot of the Report Server in the nav pane.":::

### Connect to an on-premises report server in iOS or Android

If you're viewing Power BI in the iOS or Android mobile app, your IT admin might have defined an app configuration policy. If so, your experience connecting to the report server is streamlined, and you won't have to provide as much information when you connect to a report server.

1. You see a message that your mobile app is configured with a report server. Tap **Sign in**.

   :::image type="content" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/power-bi-config-server-sign-in.png" alt-text="Screenshot of the Sign in required dialog box to the Report Server.":::

2. On the **Connect to server** page, the report server details already filled in. Tap **Connect**.

   :::image type="content" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/power-bi-ios-remote-configure-connect-server.png" alt-text="Screenshot of Report Server details filled in.":::

3. Type a password to authenticate, then tap **Sign in**.

   :::image type="content" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/power-bi-config-server-address.png" alt-text="Screenshot of password entry with a Sign In button.":::

Now you can view and interact with KPIs and Power BI reports stored on the report server.

## View Power BI reports and KPIs in the Power BI app

Power BI reports, Reporting Services mobile reports, and KPIs are displayed in the same folders they're in on the Reporting Services web portal.

* Tap a Power BI report :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/power-bi-rs-mobile-report-icon.png":::. It opens in landscape mode, and you can interact with it in the Power BI app.

  > [!NOTE]
  > Drill down and up is currently not enabled in Power BI reports on a Power BI Report Server.
  
  :::image type="content" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/power-bi-iphone-report-server-report.png" alt-text="Screenshot of a Report Server report in the Power BI mobile app.":::

* In Power BI Desktop, report owners can [optimize a report](../../create-reports/power-bi-create-mobile-optimized-report-about.md) for the Power BI mobile apps. On your mobile phone, optimized reports have a special icon, :::image type="icon" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/power-bi-rs-mobile-optimized-icon.png":::, and layout.
  
  :::image type="content" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/power-bi-rs-mobile-optimized-report.png" alt-text="Screenshot of a Power BI report optimized for mobile.":::

* Tap a KPI to see it in focus mode.
  
  :::image type="content" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/pbi_ipad_ssmrp_tile.png" alt-text="Screenshot of a KPI in focus mode in the Power BI mobile app..":::

## View your favorite KPIs and reports

You can mark KPIs and reports as favorites on the web portal, and then view them in one convenient folder on your mobile device, along with your Power BI favorite dashboards.

Tap **Favorites** on the navigation bar.
  
:::image type="content" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/power-bi-ipad-faves-pbi-report-server-update.png" alt-text="Screenshot of Favorites icon on the navigation bar.":::
  
Your favorite KPIs and reports from the web portal are all on this page, along with Power BI dashboards in the Power BI service:
  
:::image type="content" source="./media/mobile-app-ssrs-kpis-mobile-on-premises-reports/power-bi-ipad-favorites.png" alt-text="Screenshot of Power BI reports and dashboard in the Favorites page.":::

## Remove a connection to a report server

1. Open the accounts pane, and then tap **Settings**.
2. Tap the name of the server you don't want to be connected to.
3. Tap **Remove Server**.

## Related content

* [What is Power BI?](../../fundamentals/power-bi-overview.md)  
* Questions? [Ask the Power BI Community](https://community.powerbi.com/)
