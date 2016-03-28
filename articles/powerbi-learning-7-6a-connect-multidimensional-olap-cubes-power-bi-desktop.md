<properties
   pageTitle="Work Live With Multidimensional and OLAP Cubes"
   description="Create a live connection between multidimensional and OLAP cubes and Power BI Desktop."
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   editor=""
   tags=""
   featuredVideoId="gjwi4GoiCuE"
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

# Work Live With Multidimensional and OLAP Cubes

*Watch and learn how to create a live connection between multidimensional and OLAP cubes and Power BI Desktop*

You can use Power BI Desktop to connect to SQL Server Analysis Services models that are running in multidimensional or OLAP mode. This is a new feature for Power BI, and it's currently only in preview.

To enable this feature, open Power BI Desktop. Select **File**, **Options and settings**, and then **Options**. Select **Preview Features** from the Options panel. This list changes on a monthly basis as new features are added to Power BI Desktop. Check the box next to Explore live with SQL Server Analysis Services multidimensional models. You now have to restart Power BI Desktop for your changes to take effect.

Once you restart, under the Analysis Services for Get Data you'll have an option to Explore live that will work even when you enter the name of a multidimensional model. Select a perspective from the Navigator list, and the Fields pane will be populated with names.

Measure groups and KPIs that have been defined in the cube are imported and have a small calculator icon next to them in the Fields pane. Dimensions that have been defined in the cube are displayed as tables. You can use these elements as usual to build reports. Keep in mind that your queries are being processed by the service in real-time, and so they may take a few moments to complete.
