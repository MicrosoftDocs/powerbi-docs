<properties
   pageTitle="Subscribe to a Power BI report"
   description="Learn how to subscribe yourself and others to a snapshot of a Power BI report"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   qualityFocus="monitoring"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="12/09/2016"
   ms.author="mihart"/>
# Subscribe to a Power BI report
When you subscribe yourself or others to a report page, Power BI emails a snapshot of that page after the report refreshes -- but no more than once a day.

##  Requirements
-   **Creating** a subscriptions is a Power BI Pro feature
-   However, Power BI Pro users can create subscriptions for free users of Power BI
-   To create a subscription you must be the owner of the report
-   Subscriptions can only be set up any reports whose datasets have scheduled refresh set up, including:
    -   Direct Query (on-prem and cloud) 
    -   Live connection
    -   Scheduled refresh (aka import)

##  Subscribe to a report page

1.  Open the report in [Reading view](powerbi-service-open-a-report-in-reading-view.md).

2.  From the top menubar, select **Subscribe**.

    ![](media/powerbi-service-subscribe-to-report/power-bi-subscribe-icon.png)

3.  You can subscribe to one report page at a time. Select the particular report page from the dropdown.

    ![](media/powerbi-service-subscribe-to-report/power-bi-subscribe-dialog.png)

4.  Use the yellow slider  to turn the subscription on and off.  Setting the slider to Off will not delete the subscription. To delete the subscription, select the trashcan icon.

    ![](media/powerbi-service-subscribe-to-report/power-bi-slider.png)

5.  Select **Save and close** to save the subscription. You will receive an email snapshot of this report page when the report is refreshed. If the report doesn't refresh, you will not receive a snapshot email that day.  If the report refreshes more than once a day, you will only receive the email snapshot after the first refresh.

##  Manage your subscriptions
There are 2 paths to the screen for managing your subscriptions.  The first is by selecting **Manage all subscriptions** from the **Subscribe to emails** dialog (see step 3 above). The second is by selecting the Power BI cog icon ![](media/powerbi-service-subscribe-to-report/power-bi-settings-icon.png) from the top menubar and choosing **Settings**.

![](media/powerbi-service-subscribe-to-report/power-bi-subscribe-settings.png)

The particular subscriptions displayed will depend on which workspace is currently active.  To see all of your subscriptions at once for all workspaces, be sure that **My Workspace** is active. For help understanding workspaces, see [Workspaces in Power BI](powerbi-service-workspaces.md).

![](media/powerbi-service-subscribe-to-report/power-bi-subscriptions.png)


##  Limitations

At the current time, subscribe is not available for content packs. The **Subscribe** button will be greyed out. But there is a workaround...make a copy of the report and add subscriptions to that report instead.

More questions? [Try the Power BI Community](http://community.powerbi.com/)
