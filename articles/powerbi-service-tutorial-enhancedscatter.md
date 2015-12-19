<properties
   pageTitle="Tutorial: Enhanced Scatter charts in Power BI"
   description="Tutorial: Enhanced Scatter charts in Power BI."
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   editor=""
   tags="Visualizations"/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="12/15/2015"
   ms.author="mihart"/>


# Tutorial: Enhanced Scatter charts in Power BI

![](media/powerbi-service-tutorial-enhancedscatter/ES.png)

An Enchanced Scatter chart is similar to a Scatter chart in that it displays the relationship between 2 to 3 variables. The  difference is that you are not limited to circles (bubbles). You can display shapes, images, and also add images to the background.

For more information, watch a video on [Enhanced Scatter](https://youtu.be/xCfM0cjM4do?list=PL1N57mwBHtN1vIjfvuBIzZllrmKo-Vz6x).

## Create an Enhanced Scatter chart

This tutorial uses the Retail Analysis sample. To follow along, sign in to Power BI and select Get Data \> Samples \> Retail Analysis Sample. 

1. [Download the Enhanced Scatter visualization](powerbi-custom-visuals-download-from-the-gallery.md) and [add it to the report](powerbi-custom-visuals-add-to-report.md).

2. Open the "Retail Analysis Sample" report in Editing View and add a blank page.

3. Add an Enhanced Scatter chart to the page by selecting the icon     ![](media/powerbi-service-tutorial-enhancedscatter/PBI_enhancedScatterIcon.jpg) from the **Visualizations** pane.

    ![](media/powerbi-service-tutorial-enhancedscatter/PBI_enhancedScatterTemplate.jpg)

4. Create an enhanced scatter chart that displays this year's sales by category.

  - From the Fields pane, select **Item** \> **Category** and drag it to  **Legends**.

  - From the **Sales** table, select **Total Sales Variance %** to add it as the **X Axis**, **This Year Sales** to add it as the **Y Axis**, and **Avg $/Unit TY** and drag it to the **Size** field.

      ![](media/powerbi-service-tutorial-enhancedscatter/PBI_enhancedScatterStep1.png)

  Add fields to the **Shape**, **Image**, and **Backdrop** areas.  You must use a measure that returns a text value. If you have a column containing the shape name or image URLs, then you need to create a measure to return the first non-blank row (or any other logic that would return one text value and use that in this field bucket).

5. Add a shape.  The allowed values are circle, cross, diamond, square, triangle-up, triangle-down, star, hexagon, x, up arrow, and down arrow.

6. Optionally, add an image and backdrop.  Both require a URL that points to an image file.

- If you are using the Backdrop, then the xmin, xmax, ymin, and ymax fields allow you to align your background image with the x and y coordinates used to plot the data.


## Tips and Tricks for Enhanced Scatter Charts

  - coming soon!

## See also

[Reports in Power BI](powerbi-service-reports.md)

[Visualization types in Power BI](powerbi-service-visualization-types-for-reports-and-q-and-a.md)

[Visualizations in Power BI reports](powerbi-service-visualizations-for-reports.md)

[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)
