<properties pageTitle="Visualization types available in Power BI reports and Q&A" description="Visualization types available in Power BI reports and Q&A" services="powerbi" documentationCenter="" authors="v-anpasi" manager="mblythe" editor=""/>
<tags ms.service="powerbi" ms.devlang="NA" ms.topic="article" ms.tgt_pltfrm="NA" ms.workload="powerbi" ms.date="06/26/2015" ms.author="v-anpasi"/>
# Visualization types available in Power BI reports and Q&A

[← Visualizations in reports](https://support.powerbi.com/knowledgebase/topics/65160-visualizations-in-reports)  
## Power BI report visualizations

This is the current list of visualizations that can be added to Power BI reports. We'll be adding new visualizations as well, stay tuned!  All of these can be added to a Power BI report but [](https://support.powerbi.com/knowledgebase/articles/611046)[](https://support.powerbi.com/knowledgebase/articles/469552#pin)[not all of these can be pinned to a dashboard](https://support.powerbi.com/knowledgebase/articles/611046) and [not all of these are recognized by Q&A](https://support.powerbi.com/knowledgebase/articles/469552#pinqa) (see list below).

### Bar and column charts

![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/pbi_Nancy_viz_bar.png)  ![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/pbi_Nancy_viz_col.png)  

### Single number card tiles

![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/pbi_Nancy_viz_card.png)

### Combo charts

![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/pbi_Nancy_viz_combo.png)

For more information, see [Tutorial: Combo Charts in Power BI](https://support.powerbi.com/knowledgebase/articles/436737-tutorial-combo-chart-merge-visualizations-in-po).

### Funnel charts

![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/pbi_Nancy_viz_funnel.png)

For more information, see [Tutorial: Funnel Charts in Power BI](https://support.powerbi.com/knowledgebase/articles/556197-tutorial-funnel-charts-in-power-bi).

### Gauge charts

![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/gauge_m.png)  

For more information, see [Tutorial: Gauge Charts in Power BI](https://support.powerbi.com/knowledgebase/articles/556188).

### Line charts

![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/pbi_Nancy_viz_line.png)

### Maps (basic)

![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/pbi-Nancy_viz_map.png)

### Filled Maps (Choropleth)

![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/pbi_Nancy_viz_FilledMap.png)

For more information, see [Tutorial:  Filled Maps in Power BI](https://support.powerbi.com/knowledgebase/articles/556194).

### Pie charts

![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/pbi_Nancy_viz_pie.png)

### Scatter and bubble charts

![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/pbi_Nancy_viz_bubble.png)

### Slicer

![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/pbi_Nancy_viz_slicer.png)

### Small Multiples

![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/pbi_Nancy_viz_sm.png)

### Standalone images

![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/pbi_Nancy_viz_image.png)

### Tables

![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/pbi_Nancy_viz_chart.png)

### Tree Maps

![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/pbi_Nancy_viz_tree.png)

## Visualizations you can specify with Q&A

When typing natural language queries with Power BI Q&A, there are some visualization types that you can specify in the query.  For example:

"***sales by state as a treemap***"

![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/QAtreeMap.png)

The visualization types that currently work with Q&A are:

-   Bar and column charts: Clustered, stacked
-   Cards (Cards and Callout Cards without KPIs or images)
-   Line charts
-   Maps (basic)
-   Pie charts with a legend but without details  
    This pie chart has no details:

    ![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/PBI_PieSmNoDetails.png)

    This pie chart has details subdividing each slice:

    ![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/PBI_PieDetailsWhiteLines.png)
-   Scatter and bubble charts
-   Tables or matrixes with no images or KPIs
-   Single-number card tiles (made from the question box or a card with a single measure. If you're using a Card, make sure you have set an aggregation in the Field Well rather than 'Do Not Summarize')

    ![](media/powerbi-service-visualization-types-for-reports-and-q-and-a/menu.png)
-   Tree maps (for more information, see [Tutorial: Treemaps in Power BI](https://support.powerbi.com/knowledgebase/articles/556200))

## See Also:

[Visualizations in Power BI reports](http://support.powerbi.com/knowledgebase/articles/434821-visualizations-in-power-bi-reports)  
[Visualizations that can be pinned to a dashboard](https://support.powerbi.com/knowledgebase/articles/611046)  
[Power BI - Basic Concepts](http://support.powerbi.com/knowledgebase/articles/487029-power-bi-preview-basic-concepts)  

This is a draft topic in development. Feedback? Click **Contact support** on the right side of this page.