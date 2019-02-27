---
title: 'Power BI integration with Microsoft Flow'
description: Learn how to create Flows triggered by Power BI data alerts.
author: mgblythe
manager: kfile
ms.reviewer: ''
featuredvideoid: YhmNstC39Mw

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 03/01/2018
ms.author: mblythe

LocalizationGroup: Get started
---
# Microsoft Flow and Power BI

[Microsoft Flow](https://flow.microsoft.com/documentation/getting-started) is a SaaS offering for automating workflows across the growing number of applications and SaaS services that business users rely on. With Flow you can automate tasks by integrating your favorite apps and services (including Power BI) to get notifications, synchronize files, collect data, and more. Repetitive tasks become easy with workflow automation.

[Get started using Flow now.](https://flow.microsoft.com/documentation/getting-started)

Watch Sirui create a Flow that sends a detailed email to colleagues when a Power BI alert is triggered. Then follow the step-by-step instructions below the video to try it out yourself.

<iframe width="560" height="315" src="https://www.youtube.com/embed/YhmNstC39Mw" frameborder="0" allowfullscreen></iframe>

## Create a flow that is triggered by a Power BI data alert

### Prerequisites
This tutorial will show you how to create two different flows; one from a template and one from scratch. To follow along, [create a data alert in Power BI](service-set-data-alerts.md), create a free Slack account, and [sign up for Microsoft Flow](https://flow.microsoft.com/#home-signup) (it's free!).

## Create a flow that uses Power BI - from a template
In this task we'll use a template to create a simple flow that is triggered by a Power BI data alert (notification).

1. Sign in to Microsoft Flow (flow.microsoft.com).
2. Select **My flows**.
   
   ![Flow menubar](media/service-flow-integration/power-bi-my-flows.png)
3. Select **Create from template**.
   
    ![My flows menubar](media/service-flow-integration/power-bi-template.png)
4. Use the Search box to find Power BI templates and select **Send an e-mail to any audience when a Power BI data alert is triggered > Continue**.
   
    ![search results](media/service-flow-integration/power-bi-flow-alert.png)


### Build the flow
This template has one trigger (Power BI data alert for new Olympic medals for Ireland) and one action (send an email). As you select a field, Flow displays dynamic content that you can include.  In this example we'll included the tile value and the tile URL in the message body.

![flow template](media/service-flow-integration/power-bi-template1.png)

1. From the trigger dropdown, select a Power BI data alert. Select **New medal for Ireland**. To learn how to create an alert, see [Data alerts in Power BI](service-set-data-alerts.md).
   
   ![alert dropdown](media/service-flow-integration/power-bi-trigger-flow.png)
2. Enter one or more valid email addresses and then select **Edit** (shown below) or **Add dynamic content**. 
   
   ![Send an email screen](media/service-flow-integration/power-bi-flow-email.png)

3. Flow creates a title and message for you which you can keep or modify. All the values you set when you created the alert in Power BI are available for your use -- just place your cursor and select from the gray highlighted area. 

   ![Send an email screen](media/service-flow-integration/power-bi-flow-email-default.png)

1.  For example, if you created an alert title in Power BI of **We won another medal**, you can select **Alert title** to add that text to your email Subject field.

    ![create the email text](media/service-flow-integration/power-bi-flow-message.png)

    And, you can accept the default Email body or create your own. The example above contains a few modifications to the message.

1. When you're done, select **Create flow** or **Save flow**.  The flow is created and evaluated.  Flow lets you know if it finds errors.
2. If errors are found, select **Edit flow** to fix them, otherwise, select **Done** to run the new flow.
   
   ![success message](media/service-flow-integration/power-bi-flow-running.png)
5. When the data alert is triggered, an email will be sent to the addresses you indicated.  
   
   ![alert email](media/service-flow-integration/power-bi-flow-email2.png)

## Create a Flow that uses Power BI - from scratch (blank)
In this task we'll create a simple flow from scratch that is triggered by a Power BI data alert (notification).

1. Sign in to Microsoft Flow.
2. Select **My flows** > **Create from blank**.
   
   ![Flow top menubar](media/service-flow-integration/power-bi-my-flows.png)
3. Use the Search box to find a Power BI trigger and select **Power BI - when a data driven alert is triggered**.

### Build your flow
1. From the dropdown, select the name of your alert.  To learn how to create an alert, see [Data alerts in Power BI](service-set-data-alerts.md).
   
    ![select the name of the Alert](media/service-flow-integration/power-bi-totalstores2.png)
2. Select **New step** > **Add an action**.
   
   ![add a new step](media/service-flow-integration/power-bi-new-step.png)
3. Search for **Outlook** and select **Create event**.
   
   ![build the flow](media/service-flow-integration/power-bi-create-event.png)
4. Fill in the event fields. As you select a field, Flow displays dynamic content that you can include.
   
   ![continue to build the flow](media/service-flow-integration/power-bi-flow-event.png)
5. Select **Create flow** when done.  Flow saves and evaluates the flow. If there are no errors, select **Done** to run this flow.  The new flow is added to your **My flows** page.
   
   ![Complete the flow](media/service-flow-integration/power-bi-flow-running.png)
6. When the flow is triggered by your Power BI data alert, you'll receive an Outlook event notification similar to this one.
   
    ![Flow triggers Outlook notification](media/service-flow-integration/power-bi-flow-notice.png)

## Next steps
* [Get started with Microsoft Flow](https://flow.microsoft.com/documentation/getting-started/)
* [Set data alerts in Power BI service](service-set-data-alerts.md)
* [Set data alerts on your iPhone](consumer/mobile/mobile-set-data-alerts-in-the-mobile-apps.md)
* [Set data alerts in the Power BI mobile app for Windows 10](consumer/mobile/mobile-set-data-alerts-in-the-mobile-apps.md)
* More questions? [Try the Power BI Community](http://community.powerbi.com/)

