---
title: Get started formatting Power BI visualizations
description: 'Customize visualization title, background, and legend'
author: mihart
manager: kvivek
ms.reviewer: ''
featuredvideoid: IkJda4O7oGs

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 01/22/2018
ms.author: mihart

LocalizationGroup: Visualizations
---
# Customize visualization titles, legends, and backgrounds
In this tutorial you'll learn a few different ways to customize your visualizations.   There are so many options for customizing your visualizations, the best way to learn about them all is by exploring the Formatting pane (select the paintroller icon).  To get you started, this article shows you how to customize a visualization title, legend, and background.  

Not all visualizations can be customized, [see the complete list](#list).  

Fast-forward to 4:50 in the video for a demonstration of how to customize visualizations. Then follow the instructions below the video to try it out yourself with your own data.

<iframe width="560" height="315" src="https://www.youtube.com/embed/IkJda4O7oGs" frameborder="0" allowfullscreen></iframe>

### Prerequisites
- Power BI service or Power BI Desktop
- Retail Analysis sample

## Customize visualization titles in reports
To follow along, sign into Power BI service (app.powerbi.com) and [open the Retail Analysis Sample](../sample-datasets.md) report in [Editing View](../service-interact-with-a-report-in-editing-view.md).

> [!NOTE]
> When you pin a visualization to a dashboard, it becomes a dashboard tile.  The tiles themselves can also be customized with [new titles and subtitles, hyperlinks, and resized](../service-dashboard-edit-tile.md).
> 
> 

1. Navigate to the "New Stores" page of the report and select the "Open Store Count by Open Month..." column chart.
2. In the Visualizations pane, select the paintroller icon to reveal the formatting options.  and select **Title** to expand that section.  

   ![](media/power-bi-visualization-customize-title-background-and-legend/power-bi-formatting-menu.png)
3. Turn  **Title** on and off by selecting the On (or Off) slider. For now, leave it **On**.  

   ![](media/power-bi-visualization-customize-title-background-and-legend/onoffslider.png)
4. Change **Title Text** by typing **Store count by month opened** in the text field.  
5. Change **Font color** to orange and **Background Color** to yellow.

   * Select the dropdown and choose a color from the **Theme Colors**, **Recent Colors**, or **Custom color**.
   * Select the dropdown to close the color window.  
     ![](media/power-bi-visualization-customize-title-background-and-legend/customizecolorpicker.png)

   You can always revert to the default colors by selecting **Revert to default** in the color window.
6. Increase the text size to 12.
7. The last customization we'll make to the chart title is to align it in the center of the visualization. The title position defaults to left-aligned.  
   ![](media/power-bi-visualization-customize-title-background-and-legend/customizealign.png)

    At this point in the tutorial, your column chart **title** should look like something like this:  
    ![](media/power-bi-visualization-customize-title-background-and-legend/tutorialprogress1.png)

    To revert all the title customization we've done so far, select **Revert To Default**, at the bottom of the **Title** customization pane.  
    ![](media/power-bi-visualization-customize-title-background-and-legend/revertall.png)

## Customize visualization backgrounds
With the same column chart selected, expand the Background options.

1. Turn the background on and off by selecting the On (or Off) slider. For now, leave it **On**.
2. Change the background color to 74% grey.

   * Select the dropdown and choose a grey color from the **Theme Colors**, **Recent Colors**, or **Custom color**.
   * Change Transparency to 74%.   
     ![](media/power-bi-visualization-customize-title-background-and-legend/power-bi-customize-background.png)

   To revert all the title background customization we've done so far, select **Revert To Default**, at the bottom of the **Background** customization pane.

## Customize visualization legends
1. Open the **Overview** report page and select the "Total Sales Variance by FiscalMonth and District Manager" chart.
2. In the Visualization tab, select the paintbrush icon to open the formatting pane.  
3. Expand **Legend** options.

      ![](media/power-bi-visualization-customize-title-background-and-legend/legend.png)
4. Turn the legend on and off by selecting the On (or Off) slider. For now, leave it **On**.
5. Move the legend to the left side of the visualization.    
6. Add a legend title by toggling **Title** to **On** and, in the **Legend name** field, typing **Managers**.
   ![](media/power-bi-visualization-customize-title-background-and-legend/legend-move.png)

   To revert all the legend customization we've done so far, select **Revert To Default**, at the bottom of the **Legend** customization pane.

<a name="list"></a>

## Visualization types that can be customized

| Visualization | Title | Background | Legend |
|:--- |:--- |:--- |:--- |
| area |yes |yes |yes |
| bar |yes |yes |yes |
| card |yes |yes |n/a |
| multi row card |yes |yes |n/a |
| column |yes |yes |yes |
| combo |yes |yes |yes |
| donut |yes |yes |yes |
| filled map |yes |yes |yes |
| funnel |yes |yes |n/a |
| gauge |yes |yes |n/a |
| kpi |yes |yes |n/a |
| line |yes |yes |yes |
| map |yes |yes |yes |
| matrix |yes |yes |n/a |
| pie |yes |yes |yes |
| scatter |yes |yes |yes |
| slicer |yes |yes |n/a |
| table |yes |yes |n/a |
| textbox |no |yes |n/a |
| treemap |yes |yes |yes |
| waterfall |yes |yes |yes |

## Next steps
[Customize X-axis and Y-axis](power-bi-visualization-customize-x-axis-and-y-axis.md)  
[Customize colors and axis properties](service-getting-started-with-color-formatting-and-axis-properties.md)  
[Power BI - Basic Concepts](../consumer/end-user-basic-concepts.md)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)

