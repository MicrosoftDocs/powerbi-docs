<properties
   pageTitle="Create Complex Interactions Between Visualizations"
   description="Learn how changing the interaction between visualizations can create complex relationships."
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   editor=""
   tags=""
   featuredVideoId="N_xYsCbyHPw"
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

# Create Complex Interactions Between Visualizations

*Watch to learn how changing the interaction between visualizations can create complex relationships*

When you have multiple visualizations on the same report page, selecting a particular segment by clicking or using a slicer will affect all the visuals on that page. In some cases, though, you may want to slice only specific visuals. This is particularly true when using elements such as scatter plots where limiting the data to a specific segment will remove crucial meaning. Fortunately, Power BI Desktop lets you control how interactions flow between visuals.

To change the interaction between your visualizations, select **Edit** in the Home tab to toggle Edit Mode on. Now when you select a visual on your report canvas, you will see a small opaque filter icon in the top right-hand corner of every other visual it will affect. To exclude a visual from the interaction, click the strikeout symbol next to the filter icon.

In some instances you can adjust the type of filter interaction that happens between visuals. With Edit Mode toggled on, select the visual you use to filter. If you can change the type of interaction, a pie chart icon will appear next to the filter icon in the top right-hand corner. Click the pie chart icon to highlight the segmented data. Otherwise, the data will be filtered. As before, you can click the strikeout symbol to remove all interaction.

A useful design tip is to draw a transparent shape around visuals that interact with each other, so it's clear to the user that they have an interactive relationship.
