<properties
   pageTitle="Create a Direct Connection to Azure SQL"
   description="Create a live connection between an Azure SQL database and Power BI."
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   editor=""
   tags=""
   featuredVideoId="TJ71od0SbAg"
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

# Create a Direct Connection to Azure SQL

*Watch and learn how to create a live connection between an Azure SQL database and Power BI*

SQL Azure is used for a number of different enterprise-level applications.

To set up a direct, live connection to SQL Azure, first log in to the Power BI service and select **Get Data**. Under Import or Connect to Data, select **Get** for Databases. Choose **Azure SQL Database** from the list and select **Connect**.

You will now be asked for information necessary to connect to your database, such as the server and database name, and authentication details. Your database is now available in the navigation bar on the left-hand side of the screen under Datasets. When you click on it, the tables and columns of your database are available in the Fields pane, and you can use them to create reports as usual. Keep in mind that your queries are being processed by the database in real-time, and so they may take a few moments to complete.

Visuals created with a live database connection can be pinned to any dashboard. Any updates to the database will automatically be pushed to Power BI.
