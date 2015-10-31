<properties
   pageTitle="Tutorial: Enhanced Scatter charts in Power BI"
   description="Tutorial: Enhanced Scatter charts in Power BI"
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
   ms.date="10/14/2015"
   ms.author="mihart"/>

# Tutorial: Enhanced Scatter charts in Power BI

An Enchanced Scatter chart is similar to a Scatter chart in that it displays the relationship between 2 to 3 variables. The  difference is that you are not limited to circles (bubbles).

## Create an Enhanced Scatter chart

This tutorial uses the Retail Analysis sample. To follow along, sign in to Power BI and select Get Data \> Samples \> Retail Analysis Sample. 

1. [Download the Enhanced Scatter visualization](xxx) and [add it to the report](xx).

2. Open the "Retail Analysis Sample" report in Editing View and add a blank page.

3. Add an Enhanced Scatter chart to the page by selecting the icon     ![](media/powerbi-service-tutorial-enhancedscatter/PBI_enhancedScatterIcon.jpg) from the **Visualizations** pane.

  ![](media/powerbi-service-tutorial-enhancedscatter/PBI_enhancedScatterTemplate.jpg)

4. Create a Waterfall chart that displays this year's sales by category.

 1.  From the Fields pane, select **Item** \> **Category** and drag it to  **Legends**.

 2.  From the **Sales** table, select **Total Sales Variance %** to add it as the **X Axis**, **This Year Sales** to add it as the **Y Axis**, and **Avg $/Unit TY** and drag it to the **Size** field.
    ![](media/powerbi-service-tutorial-enhancedscatter/PBI_enhancedScatterStep1.png)

 3.  Select Item \> Category to add it to the Legend area. 

    ![](media/powerbi-service-tutorial-doughnut-charts/doughnutTutorial.png)

## Tips and Tricks for Doughnut Charts

-   The sum of the doughnut chart values must add up to 100%.

-   Too many categories make it difficult to read and interpret.

-   Doughnut charts are best used to compare a particular section to the whole, rather than comparing individual sections with each other. 

## See Also:

[Reports in Power BI](powerbi-service-reports.md)

[Visualizations in Power BI reports](powerbi-service-visualizations-for-reports.md)

[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)
