<properties 
   pageTitle="SendGrid content pack for Power BI"
   description="SendGrid content pack for Power BI"
   services="powerbi" 
   documentationCenter="" 
   authors="theresapalmer" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/08/2016"
   ms.author="tpalmer"/>
   
# SendGrid content pack for Power&nbsp;BI

The Power BI content pack for SendGrid allows you to extract insights and statistics from your SendGrid account. Using the SendGrid content pack you can visualize your SendGrid statistics in a dashboard.

Connect to the [SendGrid content pack](https://app.powerbi.com/getdata/services/sendgrid) for Power BI.

### Import data from your SendGrid account

1.  Select Get Data at the bottom of the left navigation pane.

    ![](media/powerbi-content-pack-sendgrid/PBI_GetData.png) 

2.  In the Services box, select Get.

    ![](media/powerbi-content-pack-sendgrid/PBI_GetServices.png) 

3.  Select the **SendGrid **content pack and click **Connect**.

    ![](media/powerbi-content-pack-sendgrid/PBI_SendGridConnect.png) 

4.  When prompted, provide your SendGrid user name and password. Select **Sign In**.

    ![](media/powerbi-content-pack-sendgrid/PBI_SendGridSignIn.png)

5.  After Power BI imports the data, you see a new dashboard, report, and dataset in the left navigation pane, populated with your email statistics for the past 90 days. New items are marked with a yellow asterisk \*.

    ![](media/powerbi-content-pack-sendgrid/PBI_SendGridDash.png)

You can change this dashboard to display your data the way you want it. Plus you can ask a [question in ](powerbi-service-q-and-a.md)[Q&A](powerbi-service-q-and-a.md) or click a tile to [open the underlying report](powerbi-service-dashboard-tiles.md) and [c](powerbi-service-edit-a-tile-in-a-dashboard.md)[](powerbi-service-edit-a-tile-in-a-dashboard.md)[hange the tiles](powerbi-service-edit-a-tile-in-a-dashboard.md) in the dashboard. 

### What's included

The following metrics are available in the SendGrid dashboard:

-   Overall email statistics - Requests, Delivered, Bounced, Spam Blocked, Spam Report, etc.

-   Email statistics by category

-   Email statistics by geography

-   Email statistics by ISP

-   Email statistics by device, client, browser

### Scheduled Refresh

The SendGrid content pack is configured by default to refresh once a day.

### Using Q&A to get insights from your SendGrid data using natural language queries

Within your SendGrid dashboard, you can use Q&A as a way of using natural language to query your SendGrid data. Because of the limitations of the SendGrid data model, keep in mind that you will not be able to get meaningful answers to questions that feature more than one dimension (for example, "total email requests by category and geography").

## See Also:

[Get started with Power BI](powerbi-service-get-started.md)

[Get Data](powerbi-service-get-data.md)

