<properties
   pageTitle="Connect SQL Server Analysis Services and Power BI Desktop"
   description="Create a live connection between SQL Server Analysis Services and Power BI Desktop."
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   editor=""
   tags=""
   featuredVideoId="ZpxJRQLiXGY"
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

# Connect SQL Server Analysis Services and Power BI Desktop

*Watch and learn how to create a live connection between SQL Server Analysis Services and Power BI Desktop*

Let's look at how you can use SQL Server Analysis Services as a data source for your Power BI reports. SSAS is a powerful data source that supports more complex security requirements, including role-based security where different departments in your organization have permission to access different pieces of data. When you connect to Analysis Services using Power BI, all of your security policies are observed, and the users only get to see the data that they are allowed to access. This is equally true whether the user is creating a visual in Power BI Desktop, or viewing a report that has been published to the Power BI service.

To create a direct connection to SQL Server Analysis Services in Power BI Desktop, first select **Get Data**. Choose **SQL Server Analysis Services Database** from the sources list. Enter the server and database name, and make sure that you have "live connection" selected instead of just importing data into the Power BI Desktop cache. (Note that Power BI Desktop can only support one live connection at a time.)

Use the Navigator to browse through the available models and select the one you would like to use. The tables and columns from that model that you can access will appear in the Fields pane, and you can use them as usual to build and publish reports. Keep in mind that your queries are being processed by the service in real-time, and so they may take a few moments to complete.
