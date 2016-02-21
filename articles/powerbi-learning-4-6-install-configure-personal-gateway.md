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
   courseDuration=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/20/2016"
   ms.author="v-jescoo"/>

# Install and Configure a Personal Gateway

*Watch and learn how to set up and configure a Personal Gateway to automatically update your local data sources*

In previous articles we've looked at how you can use Power BI to connect to data sources, and how to manually refresh your datasets on the Power BI service. However, you're not going to want to do that every time your data changes, so you can use Power BI to set up a scheduled refresh that will connect to your data sources and publish them into the Power BI Service automatically. This also gives you a way to connect the service with any on-premises data sources, including Excel files, Access databases, SQL databases, and more.

This system is called the Personal Gateway. It's a small application that runs on your computer and uses a prearranged schedule to connect to your data, gather any updates, and push them up to the Power BI service. (Note that the machine that is running the Power BI Personal Gateway does need to be turned on and connected to the internet for it to work.)

To set up your Personal Gateway, first login to the Power BI service. Select the **Download** icon in the top right-hand corner of the screen, and then select **Power BI Personal Gateway** from the menu. Run the application once it has finished downloading, and complete the installation wizard.

Once the installation process is complete, you'll be asked first to login to your Power BI service account, and then to login to the machine's Windows account.

Return to the Power BI service. Select the ellipsis menu next to the dataset you want to refresh, and then select **Schedule Refresh**. This will open the Refresh Settings page. Select **Edit credentials** next to each applicable data source and set up authentication. Finally, set the options under Schedule Refresh to activate automatic updates and set when and how frequently they occur.
