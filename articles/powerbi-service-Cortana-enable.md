<properties
   pageTitle="Enable Cortana for Power BI"
   description="Use Cortana with Power BI to get answers from your data. Activate Cortana for each Power BI dataset and then enable Cortana to access your datasets from mobile devices."
   services="powerbi"
   documentationCenter=""
   authors="mihart"  
   manager="mblythe"
   editor=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="11/22/2015"
   ms.author="mihart"/>


# Enable Cortana for Power BI

Before Cortana can look for answers in your Power BI datasets and reports, you'll need:

  - a dataset in Power BI enabled for Cortana to access.

  - to add the account you use with Power BI to Windows 10.

## Enable Cortana to access data in Power BI
In the Power BI service, you'll need to repeat these steps for each dataset that you want Cortana to be able to access.

1. In Power BI, select (highlight) the dataset that you'd like to enable for Cortana.

2. In the upper right corner, select the cog icon and choose **Settings**.

  ![](media/powerbi-service-Cortana-enable/PBI_cortana_settings.png)

3. Select **Datasets** > **Cortana** > **Enable Cortana to access this dataset** > **Apply**.

  ![](media/powerbi-service-Cortana-enable/PBI_cortana-enable.jpg)

  In this example, we're enabling Cortana on the Retail Analysis Sample dataset.

  >NOTE: When a new dataset or custom Cortana Answer Page is added to Power BI and enabled for Cortana, it can take up to 30 minutes for results to begin appearing.  Logging in and out of Windows 10 or otherwise restarting the Cortana process in Windows 10 will allow new content to appear immediately.


## Enable Cortana in Windows 10
For Cortana in Windows 10 to access data in Power BI, you need to add the work or school account you use with Power BI.

1. Ensure you have [Windows 10 version 1511 or higher](http://blogs.windows.com/windowsexperience/2015/11/12/first-major-update-for-windows-10-available-today/).  Check which version you have by selecting **Settings** > **System** > **About**.

2. Select **Settings** > **Accounts**.

3. Scroll to the bottom and select **Accounts used by other apps** > **Add a Microsoft account**.

  ![](media/powerbi-service-Cortana-enable/PBI_cortana-enableW10.jpg)

4. Sign in with the account you use with Power BI.

Cortana will use this work or school account to check Power BI for potential answers to your questions in Cortana.


## See also
[Using Cortana with Power BI](powerbi-service-Cortana-intro.md)

[Create Cortana *Answer pages* in Power BI](powerbi-service-Cortana-Desktop-entity-cards.md)

[Tips for using Power BI with Cortana](powerbi-service-Cortana-intro.md)

[Q&A in Power BI](powerbi-service-q-and-a.md)

[Power BI basic concepts](powerbi-service-basic-concepts.md)

[Get Started with Power BI](powerbi-service-get-started.md)
