<properties 
   pageTitle="Google Analytics content pack for Power BI"
   description="Google Analytics content pack for Power BI"
   services="powerbi" 
   documentationCenter="" 
   authors="mgblythe" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="09/28/2015"
   ms.author="tpalmer"/>
# Google Analytics content pack for Power BI

### Update 6/3:

The issue we were experiencing while connecting to Google Analytics has been resolved. If you were encountering any issues logging in to Google Analytics through Power BI or refreshing Google Analytics datasets, please try again.

### Connecting to the Google Analytics content pack for Power BI

Connecting to Google Analytics through Power BI starts by connecting to your Google Analytics account. You will get a Power BI dashboard and a set of Power BI reports that provide insights about your site traffic and user dimensions. You can use the dashboard and reports provided, or customize them to highlight the information you care most about.  The data will be refreshed automatically once per day.

Connect to the [Google Analytics content pack](https://app.powerbi.com/getdata/services/google-analytics)for Power BI.

In addition to this content pack, customized dashboards and reports can also be created starting from the Google Analytics content pack in Power BI Desktop. Just connect with your Google Analytics account and navigate to the View that you’re interested in. Once created, you can upload the content and tailor your dashboards accordingly.

### Get started using the content pack

1.  Select **Get Data** at the bottom of the left navigation pane.

    ![](media/powerbi-content-pack-google-analytics/PBI_GetData.png) 

2.  In the **Services** box, select **Get**.

    ![](media/powerbi-content-pack-google-analytics/PBI_GetServices.png) 

3.  Select **Google Analytics** \> **Connect**.

    ![](media/powerbi-content-pack-google-analytics/PBI_GoogleAnalyticsConnect.png)

4.  The content pack connects to a specific Google Analytics View. Provide the account name, property name and view name you’d like to connect to.  This information can be found in your Google Analytics account, either in the top left or on the **﻿Home**﻿ tab. See details below.

    **Important:** Parameters are case-sensitive. Enter them exactly as they appear in your Google Analytics account. 

    ![](media/powerbi-content-pack-google-analytics/PBI_GoogleAnalytics1.png)

5.   When prompted, enter your Google Analytics credentials.  Select **oAuth 2** as the Authentication Mechanism and click **Sign In**. Follow the Google authentication flow, which may include 2-factor authentication if you have it configured.

6.  Click **Accept **to allow Power BI to access your Google Analytics data.

    ![](media/powerbi-content-pack-google-analytics/googleanalytics.png)

7.  Click **Connect** to begin the import process. When complete, a new dashboard, report and model will appear in the Navigation Pane. Select the dashboard to view your imported data.

     ﻿![](media/powerbi-content-pack-google-analytics/googleanalytics2.png)

You can change this dashboard to display your data the way you want. It allows you to ask a question in Q&A or click a tile to open the underlying report and change the tiles in the dashboard.

### Troubleshooting 

If you're getting the message, "We couldn't import data from Google Analytics", confirm the parameters and try again. That's the most common issue. Parameters can fail during refresh instead of during the initial connection.

Other issues? Try signing in with a browser other than Internet Explorer. After you sign in, you can again use Internet Explorer with your Google Analytics data. 

Still having issues? Open a support ticket to reach the Power BI team:

-   While in the Power BI app, select the question mark \> **Contact Support.**

-   From the Power BI Support site (where you're reading this article), select **Contact Support** on the right side of the page.

## See also

[Get started with Power BI](powerbi-service-get-started.md)

[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)

![](media/powerbi-content-pack-google-analytics/PBIproduct_icon_black_GA.png)

