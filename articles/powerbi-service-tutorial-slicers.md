<properties
   pageTitle="Tutorial: Slicers in Power BI"
   description="Tutorial: Slicers in Power BI"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="01/22/2016"
   ms.author="mihart"/>

# Tutorial: Slicers in Power BI  

A Slicer narrows the portion of the dataset shown in the other visualizations on the page.  Slicers are an alternate way of filtering.  

  ![](media/powerbi-service-tutorial-slicers/PBI_slicer.png)

## When to use a slicer  
Slicers are a great choice:

-   to display commonly-used or important filters on the report canvas for easier access.

-   to make it easier to see the current filtered state without having to open a drop-down list to find the filtering details.

- When you want to hide columns you don't need but still be able to use them to filter - this makes for narrower, cleaner tables.

- to create more focused reports - since slicers are floating objects you can put them next to the interesting part of the report you want your users to focus on.

## Create a slicer

<iframe width="560" height="315" src="https://www.youtube.com/embed/ek03amXuMQw?list=PL1N57mwBHtN0JFoKSR0n-tBkUJHeMP2cP" frameborder="0" allowfullscreen></iframe>


1.  Open the Retail Analysis Sample in [Editing View](powerbi-service-interact-with-a-report-in-editing-view.md) and [add a new report page](powerbi-service-add-a-page-to-a-report.md).

2. From the Fields pane, select **District > District Manager**. 

    ![](media/powerbi-service-tutorial-slicers/PBI_Slicer_chartFirst.png)

3.  Convert the visualization to a slicer. In the Visualizations pane, select the slicer icon

    ![](media/powerbi-service-tutorial-slicers/PBI_Slicer_select.png).

## Format the slicer.

1. With the slicer selected, in the Visualizations pane, select the paint brush icon ![](media/powerbi-service-tutorial-slicers/PBI_paintbrush.png) to display the Format options.

2. Select **General > Outline color** and choose dark blue and change the **Weight** to **6**.

    ![](media/powerbi-service-tutorial-slicers/PBI_slicer_outline2.png)

3. Under **Selection Controls**, by default, **Select All** is **Off** and **Single Select** is **On**. This means that I have to use the CTRL key to select more than one name at a time. Turn **Select All** to **On** and **Single Select** to **Off**.

    ![](media/powerbi-service-tutorial-slicers/PBI_slicer_selectionControls2.png)

  - Notice that the slicer now has a **Select All** option at the top of the list. Toggle **Select All** to select all of the names or to select none of the names.

  - And you can now select more than one name without having to use the CTRL key.

4. Under **Items**, increase the text size to 14pt.  We want to be sure that our colleagues notice this slicer.

5. Lastly, set **Font color** to a dark red.  This will distinguish the selected names from the unselected names in our slicer.

    ![](media/powerbi-service-tutorial-slicers/PBI_slicer_font2.png)


## Use the slicer in a report

1. Add some additional visualizations to the report page.

    ![](media/powerbi-service-tutorial-slicers/PBI_slicers_added.png)

2. Slice the report page for Allan and Brad. Notice how the other visualizations update to reflect these selections.

    ![](media/powerbi-service-tutorial-slicers/PBI_slicers_sliced.png)

3. Sort the slicer alphabetically by District Manager last name.  Select the ellipses (...) in the top right corner of the slicer and choose **District Manager**.

    ![](media/powerbi-service-tutorial-slicers/PBI_slicer_sort2.png)

    ![](media/powerbi-service-tutorial-slicers/PBI_slicer_sorted.png)


## See also  
 [Add a visualization to a report](powerbi-service-add-visualizations-to-a-report-i.md)  

 [Visualization types in Power BI](powerbi-service-visualization-types-for-reports-and-q-and-a.md)

 [Power BI - Basic Concepts](powerbi-service-basic-concepts.md)  

[Try it out -- it's free!](https://powerbi.com/)  
