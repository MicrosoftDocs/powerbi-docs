<properties
   pageTitle="Explore Your Time-Based Data"
   description="Discover hierarchical drill-down tools for date fields"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   editor=""
   tags=""
   featuredVideoId="MNAaHw4PxzE"
   featuredVideoThumb=""
   courseDuration="6m"/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/29/2016"
   ms.author="v-jescoo"/>

# Explore Time-Based Data

It's easy to analyze time-based data with Power BI. The modeling tools in Power BI Desktop automatically include generated fields that let you drill down through years, quarters, months, and days with a single click.  

When you create a table visualization in your report using a date field, Power BI Desktop automatically includes breakdowns by time period. For example, the single date field in the **Date** table was automatically separated into Year, Quarter, Month and Day by Power BI, as shown in the following image.

![](media/powerbi-learning-2-6a-explore-time-based-data/2-6a_1.png)

Visualizations display data at the *year* level by default, but you can change that by turning on **Drill Down** in the top right-hand corner of the visual.

![](media/powerbi-learning-2-6a-explore-time-based-data/2-6a_2.png)

Now when you click on the bars or lines in your chart, it drills down to the next level of time hierarchy, for example from *years* to *quarters*. You can continue to drill down until you reach the most granular level of the hierarchy, which in this example is *days*. To move back up through the time hierarchy, click on **Drill Up** in the top left-hand corner of the visual.

![](media/powerbi-learning-2-6a-explore-time-based-data/2-6a_3.png)

You can also drill down through all of the data shown on the visual, rather than one selected period, by using the **Drill All* double-arrow icon, also in the top right-hand corner of the visual.

![](media/powerbi-learning-2-6a-explore-time-based-data/2-6a_4.png)

As long as your model has a date field, Power BI will automatically generate different views for different time hierarchies.
