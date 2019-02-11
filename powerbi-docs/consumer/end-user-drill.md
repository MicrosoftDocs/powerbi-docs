---
title: Drill-down and drill up in a visualization
description: This document shows how to drill down in a visualization in Microsoft Power BI service and Power BI Desktop.
author: mihart
manager: kvivek
ms.reviewer: ''
featuredvideoid: MNAaHw4PxzE
ms.custom: seodec18

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 12/06/2018
ms.author: mihart

LocalizationGroup: Visualizations
---
# Drill mode in a visualization in Power BI

## Drill requires a hierarchy
When a visual has a hierarchy, you can drill down to reveal additional details. For example, you might have a visualization that looks at Olympic medal count by a hierarchy made up of sport, discipline, and event. By default, the visualization would show medal count by sport -- gymnastics, skiing, aquatics, and so on. But, because it has a hierarchy, selecting one of the visual elements (such as a bar, line, or bubble), would display an increasingly more-detailed picture. Select the **aquatics** element to see data for swimming, diving, and water polo.  Select the **diving** element to see details for springboard, platform, and synchronized diving events.

You can add hierarchies to reports you own, but not to those reports shared with you.
Not sure which Power BI visualizations contain a hierarchy?  Hover over a visualization and if you see these drill controls in the top corners, your visualization has a hierarchy.

![drill-down one level](./media/end-user-drill/power-bi-drill-icon4.png)  ![turn drill-down on and off](./media/end-user-drill/power-bi-drill-icon2.png)  ![drill down all fields at once icon](./media/end-user-drill/power-bi-drill-icon3.png)
![drill up icon](./media/end-user-drill/power-bi-drill-icon5.png) ![expand down icon](./media/end-user-drill/power-bi-drill-icon6.png)  

Dates are a unique type of hierarchy. When you add a date field to a visualization, Power BI automatically adds a time hierarchy that contains year, quarter, month, and day. For more information, see [Visual hierarchies and drill-down behavior](../guided-learning/visualizations.yml?tutorial-step=18) or watch the video below.


  <iframe width="560" height="315" src="https://www.youtube.com/embed/MNAaHw4PxzE?list=PL1N57mwBHtN0JFoKSR0n-tBkUJHeMP2cP" frameborder="0" allowfullscreen></iframe>

> [!NOTE]
> To learn how to create hierarchies using Power BI Desktop, watch the video [How to create and add hierarchies](https://youtu.be/q8WDUAiTGeU)
> 

## Prerequisites

1. In Power BI service or Desktop, drill requires a visualization with a hierarchy. 
   
2. To follow along, [open the Retail Analysis sample](../sample-datasets.md) and create a tree map that looks at **Total Units This Year** (Values) by **Territory**, **City**, **Postal Code**, and **Name** (Group).  The tree map has a hierarchy made up of territory, city, postal code, and city name. Each territory has one or more cities, each city has one or more postal codes, and so on. By default, the visualization displays only the territory data, because *Territory* appears first in the list.
   
   ![Select "Territory"](media/end-user-drill/power-bi-hierarcy-list.png)

2. Understanding how the various drill icons work together can be confusing, so let's filter the tree map to show only 2 of the smaller territories: **KY** and **TN**. Select the tree map and under **Visual level filters** expand **Territory** and select **KY** and **TN**.

    ![filter for KY and TN](./media/end-user-drill/power-bi-filter.png)    

   Now only two territories display in the tree map.

   ![double drill icon](./media/end-user-drill/power-bi-territories.png)

## Three ways to access the drill features
You have several options for accessing the drill-down, drill up, and expand features for visualizations that have hierarchies. This article shows you how to use the first option below. Once you understand the basics of drill-down and expand, all three of these methods accomplish the same things, try them out and pick the one that you enjoy the most.

- Hover over a visualization to see and use the icons.  

    ![drill pathway](./media/end-user-drill/power-bi-hover.png)

- Right-click a visualization to reveal and use the menu.
    
    ![contextual menu](./media/end-user-drill/power-bi-drill-menu.png)

- From the Power BI menu bar, select the **Explore** button.

   ![Selecting Explore displays drill icons and options](media/end-user-drill/power-bi-explore.png)

## Drill pathways
### Drill-down
You have several ways to drill into your visualization. ***drill-down*** takes you to the next level in the hierarchy, so if you're looking at the **Territory** level, you can drill down to city level then postal code level and finally name level. Each step in the path shows you new information.

![drill pathway](./media/end-user-drill/power-bi-drill-path.png)

### Expand

***Expand*** adds an additional hierarchy level to the current view. So if you're looking at the **Territory** level, you can expand and add city, postal code, and name detail to your tree map. Each step in the path shows you the same information and adds on one level of new information.

![expand pathway](./media/end-user-drill/power-bi-expand-path.png)

You can also choose whether to drill down or expand on one field at a time or on all fields at a time. 

## Drill down all fields at a time

1. Start at the top level of the tree map showing data for KY and TN. Widen your tree map by selecting one of the handles and dragging to the right. 

    ![tree map showing two states](./media/end-user-drill/power-bi-drill-down.png) .

2. To drill down ***all fields at once***, select the double arrow in the upper-left corner of the visualization ![double drill-down icon](./media/end-user-drill/power-bi-drill-icon3.png). Your tree map now shows city data for Kentucky and Tennessee. 

    ![double drill icon](./media/end-user-drill/power-bi-drill-down1.png)
   
5. Drill-down one more time to the postal code level of the hierarchy.

    ![double drill icon](./media/end-user-drill/power-bi-drill-down2.png)

3. To drill back up, select the up arrow in the upper-left corner of the visualization ![drill up one level icon](./media/end-user-drill/power-bi-drill-icon5.png).


## Drill-down one field at a time
This method uses the drill-down icon that appears in the top-right corner of the visualization itself. 

1. Select the drill-down icon to turn it on ![drill-down turned on](./media/end-user-drill/power-bi-drill-icon2.png). Now you have the option of drilling down ***one field at a time***. 
   
   ![arrow pointing at drill-down on/off icon](media/end-user-drill/power-bi-drill-icon-new.png)

   If you don't turn on drill-down, selecting a visual element (such as a bar or bubble or leaf) will not drill down but will instead cross-filter the other charts on the report page.

2. Select the *leaf* for **TN**. Your tree map now displays all the cities in Tennessee that have a store. 

    ![tree map shows data for Tennesee only](media/end-user-drill/power-bi-drill-down-one1.png)

2. At this point, you can continue drilling down for Tennesee or you can drill down for a particular Tennesee city or you can expand instead (see **Expand all fields at once**, below). Let's continue to drill down one field at a time.  Select **Knoxville, TN**. Your tree map now displays the postal code for your store in Knoxville. 

   ![tree map shows 37919](media/end-user-drill/power-bi-drill-down-one2.png)

    Notice that the title changes as you drill-down and back up again.  

## Expand all and expand one field at a time
Having a tree map that shows us only a postal code isn't informative.  So let's expand down one level in the hierarchy.  

1. With the tree map active, select the *expand down* icon ![expand down icon](./media/end-user-drill/power-bi-drill-icon6.png). Your tree map now shows two levels of our hierarchy: postal code and store name. 

    ![showing postal code and store name](./media/end-user-drill/power-bi-expand1.png)

2. To see all four hierarchy levels of data for Tennesee, select the drill up arrow until you reach the second level, **Total units this year by territory and city**, of your tree map. 

    ![tree map showing all data for Tennesee](media/end-user-drill/power-bi-drill-down-one1.png)


3. Make sure drill-down is still turned on, ![drill-down turned on](./media/end-user-drill/power-bi-drill-icon2.png) and select the *expand down* icon ![expand down icon](./media/end-user-drill/power-bi-drill-icon6.png). Your tree map now shows some additional detail; instead of only showing city and state it now also shows us postal code. 

    ![double drill icon](./media/end-user-drill/power-bi-expand-one3.png)

4. Select the *expand down* icon one more time to display all four hierarchy levels of detail for Tennesee on your tree map. Hover over a leaf to see even more detail.

   ![tree map showing Tennesee data](./media/end-user-drill/power-bi-expand-all.png)

## Drilling filters other visuals
As you work in Drill mode, you get to decide how drill-down and expanding impacts the other visualizations on the page. 

By default, drilling will not filter other visuals in a report. But this feature can be enabled in Power BI Desktop and Power BI service. 

1. In Desktop, select the **Format** tab and select the checkbox for **Drilling filters other visuals**.

    ![setting in Power BI Desktop](./media/end-user-drill/power-bi-drill-filters-desktop.png)

2. Now when you drill down (or drill up or expand) in a visual with a hierarchy, that action filters the other visuals on the page. 

    ![setting in Desktop](./media/end-user-drill/power-bi-drill-filters.png)

    ![setting in Desktop](./media/end-user-drill/power-bi-drill-filters2.png)

> [!NOTE]
> To enable this in Power BI service, from the top menubar, select **Visual interactions > Drilling filters other visuals**.
>
> ![setting in Power BI service](./media/end-user-drill/power-bi-drill-filters-service.png)



## Understanding the hierarchy axis and hierarchy group
You can think of the hierarchy axis and the hierarchy group as the mechanisms that you can use to increase and decrease the granularity of data you want to view. Any data that can be organized into categories and subcategories qualifies as having a hierarchy. This, of course, includes dates and times.

You can create a visualization in Power BI to have a hierarchy by selecting one or more data fields to add to either the **Axis** well or the **Group** well, along with the data you want to examine as data fields in the **Values** well. You'll know if your data is hierarchical if *Drill mode* icons appear on the upper-left and right corners of your visualization. 

Essentially, it's convenient to think of two types of hierarchical data:
- Date and time data - If you have a data field with a DateTime data type, you already have hierarchical data. Power BI automatically creates a hierarchy for any data field whose values can be parsed into a [DateTime](https://msdn.microsoft.com/library/system.datetime.aspx) structure. You only need to add one DateTime field to the **Axis** or **Group** well.
- Categorical data - If your data is derived from collections that contain subcollections, or otherwise has rows of data that share common values, you have hierarchical data.

Power BI enables you to expand by one or by all subsets. You can drill down through your data to see a single subset at each level, or to see all of the subsets simultaneously at each level. For example, you can drill down for a specific year, or see all of the results for each year as you go down the hierarchy. 
Conversely, you can drill up in the same manner.

The following sections describe drilling down from the highest view, middle view, and lowest view.

### Hierarchical data and time data
For this example, follow along with the [Retail Analysis sample](../sample-datasets.md) and create a stacked column chart visualization that looks at **Month** (Axis) by **TotalSales** (Values).  

Even though the Axis data field is **Month**, it still creates a **Year** category in the **Axis** well. This is because Power BI provides the full DateTime structure for all the values it reads. The top of the hierarchy shows data for the year.

![Single bar showing data grouped by year](media/end-user-drill/power-bi-hierarchical-axis-datetime-1.png)

With drill-down mode on, click the bar in the chart to go down one level of the hierarchy. You will see three bars for the data of the quarters available. 
Then from the upper left icons, choose **Expand all down one level of the hierarchy**. Then do that again to get to the lowest level of the hierarchy, that shows results for each month.

![bar chart to see bar per month](media/end-user-drill/power-bi-hierarchical-axis-datetime-2.png)

Apart from the visualization, we can see the hierarchy reflected in the data rendered for each report. The following table shows the results of **Show Data** in a report drilling down from a single month or all months. 

Notice that the data is the same for quarter and year reports, but after you drill down to the level of detail specified for **Values**, you can see how the single report gets more specific and the "all months" report has more data.


|Expand mode|Year|Quarter|Month|Day|
| ---|:---:|:---:|:---:|---|
|Single|![single year](./media/end-user-drill/power-bi-hierarchical-year.png)|![single quarter](media/end-user-drill/power-bi-hierarchical-quarter.png)|![single month](./media/end-user-drill/power-bi-hierarchical-one-month.png)|![single day](media/end-user-drill/power-bi-hierarchical-one-day.png)|
|All|![all years](./media/end-user-drill/power-bi-hierarchical-year.png)|![all quarters](media/end-user-drill/power-bi-hierarchical-quarter.png)|![all months](./media/end-user-drill/power-bi-hierarchical-all-month.png)|![all days](media/end-user-drill/power-bi-hierarchical-all-day.png)|


### Hierarchical category data
Data that has modeled from collections and subcollections is hierarchical. 
A good example of this is location data. Consider a table in a data source whose columns are Country, State, City, and Zip. Data that shares the same Country, State, and City are hierarchical.

For this example, follow along with the [Retail Analysis sample](../sample-datasets.md). Create a stacked column chart visualization that looks at **Total Units This Year** (Values) by **Territory**, **City**, **Postal Code**, and **Name** (Group).  

![bar chart showing Total units this year by territory](media/end-user-drill/power-bi-hierarchical-axis-category-1.png)

With drill-down mode on, from the upper left icons, choose **Expand all down one level of the hierarchy** three times.
You should be at the lowest level of the hierarchy, which shows the results for Territory, City, and Postal Code.

![bar chart showing lowest level of the hierarchy, most detail](media/end-user-drill/power-bi-hierarchical-axis-category-2.png)

Apart from the visualization, we can see the hierarchy reflected in the data rendered for each report. The following table shows the results of **Show Data** in a report drilling-down for a single territory or all territories. As you drill down, you can see how the single report gets more specific and the "all territories" report has more data.


| Expand mode|Territory|City|Postal|Name|
| ---|:---:|:---:|:---:|---|
|Single|![single territory](./media/end-user-drill/power-bi-hierarchical-territory.png)|![single city](media/end-user-drill/power-bi-hierarchical-one-territory-city.png)|![single postal code](./media/end-user-drill/power-bi-hierarchical-one-territory-city-postal.png)|![single name](media/end-user-drill/power-bi-hierarchical-one-territory-city-postal-name.png)|
|All|![all territories](./media/end-user-drill/power-bi-hierarchical-territory.png)|![all cities](media/end-user-drill/power-bi-hierarchical-all-territory-city.png)|![all postal codes](./media/end-user-drill/power-bi-hierarchical-all-territory-city-postal.png)|![all names](media/end-user-drill/power-bi-hierarchical-all-territory-city-postal-name.png)|


## Considerations and limitations
* If adding a date field to a visualization does not create a hierarchy, it may be that the "date" field is not actually saved as a date. If you own the dataset, open it in *Data* view in Power BI Desktop, select the column that contains the date, and in the Modeling tab, change the **Data Type** to **Date** or **Date/Time**. If the report has been shared with you, contact the owner to request the change.  
  
  ![select data view and, in top right, see Date Type](media/end-user-drill/power-bi-change-data-type2.png)

## Next steps
[Visualizations in Power BI reports](../visuals/power-bi-report-visualizations.md)

[Power BI reports](end-user-reports.md)

[Power BI - Basic Concepts](end-user-basic-concepts.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)

