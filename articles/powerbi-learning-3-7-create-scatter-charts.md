<properties
   pageTitle="Scatter Charts"
   description="Long live bubbles - see scatter charts in action"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""
   featuredVideoId="xLQ_ZVScI60"
   featuredVideoThumb=""
   courseDuration="9m"/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="get-started-article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/20/2016"
   ms.author="davidi"/>

# How to Use Scatter Charts

If you want to compare two different measures, such as unit sales verses revenue, a common visualization to use is a scatter chart.

![](media/powerbi-learning-3-7-create-scatter-charts/3-7_1.png)

To create a blank chart, select **Scatter chart** from the **Visualizations** pane. Drag and drop the two fields you want to compare from the **Fields** pane to the *X Axis* and *Y Axis* options buckets. At this point, your scatter chart probably just has a small bubble in the center of the visual - you need to add a measure to the *Details* bucket to indicate how you would like to segment your data. For example, if are comparing item sales and revenue, perhaps you want to split the data by category, or manufacturer, or month of sale.

Adding an additional field to the *Legend* bucket color-codes your bubbles according to the field's value. You can also add a field to the *Size* bucket to alter the bubble size according to that value.

![](media/powerbi-learning-3-7-create-scatter-charts/3-7_2.png)

Scatter charts have many visual formatting options as well, such as turning on an outline for each colored bubble and toggling individual labels. You can change the data colors for other chart types, as well.

![](media/powerbi-learning-3-7-create-scatter-charts/3-7_3.png)

You can create an animation of your bubble chart's changes over time by adding a time-based field to the *Play Axis* bucket. Click on a bubble during an animation to see a trace of its path.

![](media/powerbi-learning-3-7-create-scatter-charts/3-7_4.png)

>Note: Remember, if you only see one bubble in your scatter chart, it's because Power BI is aggregating your data, which is the default behavior. Add a category to the *Details* bucket, in the **Visualizations** pane, to get more bubbles.
