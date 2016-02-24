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

People can use Azure SQL Database for a whole range of different things. In this section, you will look at a database that has some HR information and add that to the existing information that was uploaded into your VanArsdel Sales Dashboard.
To create a direct connection to Azure SQL Database, go to the Power BI service and select **Get Data**.
 
One of the options, on the Get Data screen, is to connect to live to an Azure SQL Database and other databases. Select Get within Databases.

You will then be presented with a few different options. Select Azure SQL Database. This will bring up a description. Select Connect.

You can then enter the Server and Database that you are connecting to, and select Next.

On the next screen, enter the Username and Password for the server and select Sign in.

You will see a notification, in the upper right of the screen, that the service is importing the data. It’s not actually importing any data. It is getting the definition, or schema, of the database that’s sitting in Azure to show you.
The dataset will show up under the Datasets list on the left.

When you select that dataset, you will see the report canvas and you will see the tables that you are connected to on the right.

At this point, you can drag fields onto the report canvas to create visualizations just like you would do if you had the data actually stored in Power BI.  You work with the Power BI report the same way you would with any other data source.
Now when you create a visualization, the service is sending a query over to Azure. When you work with live data, it may take a little bit longer to display the visualization as you are working with live queries. The queries are going back to that Azure database.
You can also pin visualization to your dashboard. You can even pin your visualizations to a dashboard that uses different data sources. Even ones that were imported.
When data in the Azure SQL Database is updated, it will be reflected in your report automatically. If you look at the menu options of the dataset, it will even tell you that the data source is always up-to-date.

You don’t need to setup scheduled refresh.
