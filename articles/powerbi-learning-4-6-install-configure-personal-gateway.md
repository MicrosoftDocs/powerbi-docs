<properties
   pageTitle="Install and Configure a Personal Gateway"
   description="Set up a Personal Gateway to automatically update local and on-premises data sources."
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   editor=""
   tags=""
   featuredVideoId="UwSaTCke5MU"
   featuredVideoThumb=""
   courseDuration="11m"/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/20/2016"
   ms.author="v-jescoo"/>

# Install and Configure a Personal Gateway

*Watch and learn how to set up and configure a Personal Gateway, and automatically update your local data sources*

In previous topics we've looked at how you can use Power BI to connect to data sources, and how to manually refresh your datasets on the Power BI service. However, you're not going to want to manually refresh things every time your data changes, so you can use Power BI to set up a scheduled refresh that will connect to your data sources and publish them into the Power BI Service automatically. This also gives you a way to connect the service with any on-premises data sources, including Excel files, Access databases, SQL databases, and more.

The system that lets you connect your on-premises data sources to the Power BI service is called the **Personal Gateway**. It's a small application that runs on your computer, and uses a prearranged schedule to connect to your data, gather any updates, and push them up to the Power BI service.

> Note: The computer  that is running the Power BI Personal Gateway *must* be on and connected to the Internet for **Personal Gateway** to work properly.

To set up your Personal Gateway, first login to the Power BI service. Select the **Download** icon in the top right-hand corner of the screen, and then select **Power BI Gateways** from the menu.

![](media/powerbi-learning-4-6-install-configure-personal-gateway/4-6_1.png)

From there you'll be taken to a web page where you can select the **Power BI Gateway - Personal**, as shown below.

![](media/powerbi-learning-4-6-install-configure-personal-gateway/4-6_2.png)

Run the application once it finishes downloading, and complete the installation wizard.

![](media/powerbi-learning-4-6-install-configure-personal-gateway/4-6_3.png)

You'll see a few warnings, including the following warning that the computer must be turned on, and have an Internet connection, for the **Gateway** to properly refresh your data.

![](media/powerbi-learning-4-6-install-configure-personal-gateway/4-6_4.png)

Once the installation process is complete, you'll be asked first to login to your Power BI service account, and then to login to the machine's Windows account.

![](media/powerbi-learning-4-6-install-configure-personal-gateway/4-6_5.png)

Return to the Power BI service. Select the ellipsis (three dots) menu next to the dataset you want to refresh, and then select **Schedule Refresh**. This opens the **Refresh Settings** page. Power BI detects that you've installed a **Personal Gateway**, and lets you know its status.

Select **Edit credentials** next to each applicable data source and set up authentication.

![](media/powerbi-learning-4-6-install-configure-personal-gateway/4-6_6.png)

Finally, set the options under **Schedule Refresh** to activate automatic updates and set when and how frequently they occur.

![](media/powerbi-learning-4-6-install-configure-personal-gateway/4-6_7.png)

And that's it. On the scheduled times, Power BI will go out to those data sources, using the credentials you provided and the connection to the computer that has your **Personal Gateway** running, and update the reports and datasets according to your schedule. The next time you go to Power BI, those dashboards, reports, and datasets will reflect data as of the most recent scheduled refresh.
