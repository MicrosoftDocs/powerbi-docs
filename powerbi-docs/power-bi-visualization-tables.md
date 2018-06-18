---
title: Table visualizations in Power BI reports and dashboards
description: Tutorial for working with table visualizations in Power BI reports and dashboards, including how to resize column widths.
author: mihart
manager: kfile
ms.reviewer: ''
featuredvideoid: ''

ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 05/27/2018
ms.author: mihart

LocalizationGroup: Visualizations
---
# Working with tables in Power BI reports and dashboards
A table is a grid that contains related data in a logical series of rows and columns. It may also contain headers and a row for totals. Tables work well with quantitative comparisons where you are looking at many values for a single category. For example, this table displays 5 different measures for **Category**.

![](media/power-bi-visualization-tables/table.png)

## When to use a table
Tables are a great choice:

* to see and compare detailed data and exact values (instead of visual representations)
* to display data in a tabular format
* to display numerical data by categories   

> [!NOTE]
> If a table has too many values, consider converting it to a matrix and/or using drilldown.
> 
> 
## Prerequisites
 - Power BI service or Power BI Desktop
 - Retail Analysis sample


## Create a table
We'll create the table pictured above to display sales values by item category. To follow along, sign in to Power BI service and select **Get Data \> Samples \> Retail Analysis Sample > Connect** and choose **Go to dashboard. Creating a visualization requires edit permissions to the dataset and report. Luckily, the Power BI samples are all editable. If a report has been shared with you, you won't be able to create visualizations in reports.

1. From the left navpane, select **Workspaces >My workspace**.    
2. Select the Datasets tab, and scroll down to the Retail Analysis Sample dataset you just added.  Select the **Create report** icon.
   
    ![](media/power-bi-visualization-tables/power-bi-create-report.png)
2. In the report editor, select **Item** > **Category**.  Power BI automatically creates a table that lists all the categories.
   
    ![](media/power-bi-visualization-tables/power-bi-table1.png)
3. Select **Sales > Average Unit Price** and **Sales > Last Year Sales** and **Sales > This Year Sales** and choose all 3 options (Value, Goal, Status).   
4. In the Visualizations pane, locate the **Values** well and drag-and-drop the values until the order of your chart columns matches the first image on this page.  Your Values well should look like this.
   
    ![](media/power-bi-visualization-tables/power-bi-table2.png)
5. Pin the table to the dashboard by selecting the pin icon  
   
     ![](media/power-bi-visualization-tables/pbi_pintile.png)

## Format the table
There are many many ways to format a table and we'll only cover a few of them here. A great way to learn about the other formatting options is to open the Formatting pane (paint roller icon ![](media/power-bi-visualization-tables/power-bi-format.png)) and explore.

* Try formatting the table grid. Here we've added a blue vertical grid, added space to the rows, increased the outline and text size a bit.
  
    ![](media/power-bi-visualization-tables/power-bi-table-gridnew.png)
  
    ![](media/power-bi-visualization-tables/power-bi-table-grid3.png)
* For the column headers we changed the background color, added an outline, and increased the font size. 
  
    ![](media/power-bi-visualization-tables/power-bi-table-column-headers.png)

  
    ![](media/power-bi-visualization-tables/power-bi-table-column2.png)

* You can even apply formatting to individual columns and column headers. Start by expanding **Field formatting** and selecting the column to format from the dropdown. Depending on the column values, Field formatting lets you set things like: display units, font color, number of decimal places, background, alignment, and more. Once you've adjusted the settings, decide whether to apply those settings to the header and totals row as well.

    ![](media/power-bi-visualization-tables/power-bi-field-formatting.png)

* And after some additional formatting, here is our final table. Since there are so many formatting options, the best way to learn is to start with the default formatting, open the Formatting pane  ![](media/power-bi-visualization-tables/power-bi-format.png) , and start exploring. 
  
    ![](media/power-bi-visualization-tables/power-bi-table-format.png)

### Conditional formatting
One type of formatting is referred to as *conditional formatting* and is applied to fields in the **Values** well of the **Visualizations** pane in Power BI service or Desktop. 

With conditional formatting for tables, you can specify customized cell background colors and font colors based on cell values, including using gradient colors. 

1. In the **Visualizations** pane in Power BI service or Desktop, select the down-arrow beside the value in the **Values** well that you want to format (or right-click the field). You can only manage conditional formatting for fields in the **Values** area of the **Fields** well.
   
    ![](media/power-bi-visualization-tables/power-bi-conditional-formatting-background.png)
2. Select **Background color scales**. In the dialog that appears, you can configure the color, as well as the *Minimum* and *Maximum* values. If you select the **Diverging** box, you can configure an optional *Center* value as well.
   
    ![](media/power-bi-visualization-tables/power-bi-conditional-formatting-background2.png)
   
    Let's apply some custom formatting to our Average Unit Price values. Select **Diverging**, add some colors, and choose **OK**. 
   
    ![](media/power-bi-visualization-tables/power-bi-conditional-formatting-data-background.png)
3. Add a new field to the table that has both positive and negative values.  Select **Sales > Total Sales Variance**. 
   
    ![](media/power-bi-visualization-tables/power-bi-conditional-formatting2.png)
4. Add data bar conditional formatting by selecting the down-arrow beside **Total Sales Variance** and choosing **Conditional formatting > Data bars**.
   
    ![](media/power-bi-visualization-tables/power-bi-conditional-formatting-data-bars.png)
5. In the dialog that appears, set colors for **Positive bar**, **Negative bar**, place a checkmark next to **Show bar only**, and make any other changes you'd like.
   
    ![](media/power-bi-visualization-tables/power-bi-data-bars.png)
   
    When you select **OK**, data bars replace the numerical values in the table making it easier to scan.
   
    ![](media/power-bi-visualization-tables/power-bi-conditional-formatting-data-bars2.png)
6. To remove conditional formatting from a visualization, just right-click the field again, and select **Remove Conditional Formatting**.

> [!TIP]
> Conditional formatting is also available from the Formatting pane (paintroller icon). Select the value to format and then set **Color scales** or **Data bars** to On to apply the default settings or, to customize the settings, select **Advanced controls**.
> 
> 

## Adjust the column width of a table
Sometimes Power BI will truncate a column heading in a report and on a dashboard. To show the entire column name, hover over the space to the right of the heading to reveal the double arrows, select and drag.

![](media/power-bi-visualization-tables/resizetable.gif)

## Considerations and troubleshooting
* When applying column formatting, you can only choose one alignment option per column: Auto, Left, Center, Right. Usually, a column contains all text or all numbers, and not a mix. But in cases where a column contains both numbers and text, **Auto** will align left for text and right for numbers. This behavior supports languagues where you read left-to-right.   

More questions? [Try the Power BI Community](http://community.powerbi.com/)

