<properties
   pageTitle="How to Use Gauges and Single Number Cards"
   description="See how to create and customize gauges and single number cards"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   editor=""
   tags=""
   featuredVideoId="otRQsFYOHfc"   
   featuredVideoThumb=""
   courseDuration=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/19/2016"
   ms.author="v-jescoo"/>

# How to Use Gauges and Single Number Cards

*Watch and learn how to create and customize gauges and single number cards*

Generally, visualizations are used to compare two or more different values. However, sometimes when building reports you may want to track a just single Key Performance Indicator or metric over time. The way to do this in Power BI Desktop is with a gauge or single number card visual.

Gauges are particularly useful when you are building dashboards and want to show progress towards a particular target. To create a gauge, select it from the Visualizations pane and drag the field you want to track into the Value bucket.

Gauges appear by default at 50%, or double the Value, and there are two ways to adjust this setting. To dynamically set the values, drag fields to the Minimum, Maximum, and Target Value buckets. Alternatively, use the visual formatting options to manually customize the range of your gauge.

Card visualizations simply show a numeric representation of a field. By default card visuals use display units to keep the number short, for example displaying "$5bn" instead of "$5,000,000,000". Use the visual formatting options to change the unit being used, or disable it completely.

One interesting application of cards is to have them display a custom measure that you've concatenated with text. To use the earlier example, with a custom measure your card could include advanced DAX functions and display something like, "Total revenue this year: $5bn".
