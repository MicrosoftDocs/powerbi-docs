<properties
   pageTitle="Integrate a Tile Into Your Application"
   description="See how to embed dashboard tiles using the Power BI sample application."
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""
   featuredVideoId="ttjGtYl4qJU"
   featuredVideoThumb=""
   courseDuration=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="03/20/2016"
   ms.author="davidi"/>

# Integrate a Tile Into Your Application

*Discover how to embed dashboard tiles using the Power BI sample application*

Once you've built dashboards using Power BI, you can take the tiles and integrate them into your own applications.

When you visit the [Power BI GitHub repository](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/embed-a-tile-into-an-app "Power BI Tile Integration Sample Application") you'll see a sample application for integrating tiles into your own work. This includes all of the Visual Studio solutions and code that you'll need to get started.

When you run the sample, it will take you through the different steps and display the calls that you need to make to retrieve a tile from your account.

First, you will log in to your Power BI account. Once complete, this will display an access token in the sample application. Next, select the **Get Dashboards** button, which uses an API call to query the different dashboards that are available and return their name and GUID. Now enter the GUID for the dashboard you want to use into Step 3 and select **Get Tiles**. This returns a list of the title, embed URL, and GUID for each tile on that dashboard. Finally, enter the embed URL for the tile you want to use and enter it into Step 4. Select **Embed Tile**, and in a few moments you will see your tile embedded at the bottom of the sample application.
