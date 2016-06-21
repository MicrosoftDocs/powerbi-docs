<properties
   pageTitle="Enable Cortana for Power BI"
   description="Use Cortana with Power BI to get answers from your data. Activate Cortana for each Power BI dataset and then enable Cortana to access your datasets from mobile devices."
   services="powerbi"
   documentationCenter=""
   authors="mihart"  
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/21/2016"
   ms.author="mihart"/>


# Enable Cortana for Power BI

Before Cortana can look for answers in your Power BI datasets and reports, you'll need:

  - a dataset in Power BI enabled for Cortana to access.

  - to add the account you use with Power BI to Windows 10.

  >**NOTE**: Cortana for Power BI is currently only available in English. 

## Enable Cortana to access data in Power BI
In the Power BI service, you'll need to repeat these steps for each dataset that you want Cortana to be able to access.

1. In Power BI, select (highlight) the dataset that you'd like to enable for Cortana.

2. In the upper right corner, select the cog icon and choose **Settings**.

    ![](media/powerbi-service-cortana-enable/PBI_cortana_settings.png)

3. Select **Datasets** > **Q&A and Cortana** > **Allow Cortana to access this dataset** > **Apply**.

    ![](media/powerbi-service-cortana-enable/PBI_cortana-enable.jpg)

  In this example, we're enabling Cortana on the Retail Analysis Sample dataset.

  >**NOTE**: When a new dataset or custom Cortana Answer Page is added to Power BI and enabled for Cortana, it can take up to 30 minutes for results to begin appearing.  Logging in and out of Windows 10, or otherwise restarting the Cortana process in Windows 10, will allow new content to appear immediately.

  >**IMPORTANT**: If you enable a dataset for Cortana, and that dataset is part of a content pack, you will need to re-publish for your colleagues to also be able to use it with Cortana.


## Enable Cortana in Windows 10 to access Power BI
For Cortana in Windows 10 to access data in Power BI, you need to add the work or school account you use with Power BI.

1. Ensure you have [Windows 10 version 1511 (Windows 10 November Update) or higher](http://blogs.windows.com/windowsexperience/2015/11/12/first-major-update-for-windows-10-available-today/).  Check which version you have by selecting **Settings** > **System** > **About**.
>NOTE: You will only see the version number if you've installed the November update (or later).

2. Select **Settings** > **Accounts** > **work access** > **add a work or school account**

3. Scroll to the bottom where you'll see **Add a Microsoft account**.

4. Sign in with the account you use with Power BI.

Cortana will use this work or school account to check Power BI for potential answers to your questions in Cortana.


## See also
[Using Cortana with Power BI](powerbi-service-cortana-intro.md)

[Create Cortana *Answer pages* in Power BI](powerbi-service-cortana-desktop-entity-cards.md)

[Tips for using Power BI with Cortana](powerbi-service-cortana-ask-questions.md)

[Q&A in Power BI](powerbi-service-q-and-a.md)

[Power BI basic concepts](powerbi-service-basic-concepts.md)

[Get Started with Power BI](powerbi-service-get-started.md)
