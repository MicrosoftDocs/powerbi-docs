<properties
   pageTitle="Gauges and single-number cards"
   description="Drive fast dashboard insights with gauges and numbers"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""
   featuredVideoId="xmja6EpqaO0"   
   featuredVideoThumb=""
   courseDuration="7m"/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="get-started-article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/06/2017"
   ms.author="davidi"/>

# How to Use Gauges and Single Number Cards

Generally, visualizations are used to compare two or more different values. However, sometimes when building reports you may want to track a just single Key Performance Indicator (KPI) or metric over time. The way to do this in Power BI Desktop is with a **Gauge** or **single number** card visual. To create a blank chart of either type, select its icon from the **Visualizations** pane.

![](media/powerbi-learning-3-9-create-gauges-cards/3-9_1.png)

Gauges are particularly useful when you are building dashboards and want to show progress towards a particular target. To create a gauge, select its icon from the **Visualizations** pane, and drag the field you want to track into the *Value* bucket.

![](media/powerbi-learning-3-9-create-gauges-cards/3-9_1a.png)

Gauges appear by default at 50%, or double the *Value*, and there are two ways to adjust this setting. To dynamically set the values, drag fields to the *Minimum*, *Maximum*, and *Target* Value buckets. Alternatively, use the visual formatting options to manually customize the range of your gauge.

![](media/powerbi-learning-3-9-create-gauges-cards/3-9_2.png)

Card visualizations simply show a numeric representation of a field. By default card visuals use display units to keep the number short, for example displaying "$5bn" instead of "$5,000,000,000". Use the visual formatting options to change the unit being used, or disable it completely.

![](media/powerbi-learning-3-9-create-gauges-cards/3-9_3.png)

One interesting application of cards is to have them display a custom measure that you've concatenated with text. To use the earlier example, with a custom measure your card could include advanced DAX functions and display something like, "Total revenue this year: $5bn" or "Progress on unit sales this year:" and then add the number that represents the progress.

![](media/powerbi-learning-3-9-create-gauges-cards/3-9_4.png)
