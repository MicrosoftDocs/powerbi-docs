---
title: Drill down and drill up in a visual
description: This article shows how to drill down in a visual in the Microsoft Power BI service.
author: mihart
ms.author: mihart
ms.reviewer: mihart
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 12/21/2020
LocalizationGroup: Visualizations
---
# Drill mode in a visual in Power BI

[!INCLUDE[consumer-appliesto-yyny](../includes/consumer-appliesto-yyny.md)]


This article shows how to drill down in a visual in the Microsoft Power BI service. Using drill down and drill up on your data points, you can explore in-depth details about your data. 

## Drill requires a hierarchy

When a visual has a hierarchy, you can drill down to reveal additional details. For example, you might have a visual that looks at Olympic medal count by a hierarchy made up of sport, discipline, and event. By default, the visual would show medal count by sport: gymnastics, skiing, aquatics, and so on. But, because it has a hierarchy, selecting one of the visual elements (like a bar, line, or bubble), would display an increasingly more-detailed picture. Selecting the **aquatics** element would show you data for swimming, diving, and water polo.  Selecting the **diving** element would show you details for springboard, platform, and synchronized diving events.

Dates are a unique type of hierarchy.  Report *designers* often add date hierarchies to visuals. A common date hierarchy is one that contains year, quarter, month, and day. 

## Figure out which visuals can be drilled
Not sure which Power BI visuals contain a hierarchy? Hover over a visual. If you see a combination of these drill controls at the top, your visual has a hierarchy.

![Screenshot of the drill icons.](./media/end-user-drill/power-bi-drill-icons.png)  


## Learn how to drill down and up

In this example we're using a treemap that has a hierarchy made up of territory, city, postal code, and store name. The treemap, before drilling, looks at total units sold this year by territory. Territory is the top level of the hierarchy.

![Screenshot of the treemap and its filters.](./media/end-user-drill/power-bi-treemap.png)  


### Two ways to access the drill features

You have two ways for accessing the drill-down, drill-up, and expand features for visuals that have hierarchies. Try them both, and use the one that you enjoy the most.

- First way: hover over a visual to see and use the icons. Turn on the drill-down feature first by selecting the downward arrow. The grey background lets you know that the drill-down option is active.   

    ![Screenshot of the hover example.](./media/end-user-drill/power-bi-drill-hover.png)

- Second way: right-click a visual to reveal and use the menu.

    ![Screenshot of the right-click example.](./media/end-user-drill/power-bi-drill-action-menu.png)



## Drill pathways

### Drill down all fields at once
![The drill-down icon](./media/end-user-drill/power-bi-drill-icon3.png)

You have several ways to drill into your visual. Selecting the double arrow ![icon for drill all levels at once](./media/end-user-drill/power-bi-drill-icon3.png)drill-down icon takes you to the next level in the hierarchy. If you're looking at the **Territory** level for Kentucky and Tennessee, you can drill down to city level for both states, then postal code level for both states, and, finally, the store name level for both states. Each step in the path shows you new information.

![Diagram showing the drill pathway](./media/end-user-drill/power-bi-drill-path.png)

Select the drill-up icon ![Drill-up icon](./media/end-user-drill/power-bi-drill-icon5.png) until you get back to "Total units this year by territory".

### Expand all fields at once
![The expand icon](./media/end-user-drill/power-bi-drill-icon6.png)

**Expand** adds an additional hierarchy level to the current view. So if you're looking at the **Territory** level, you can expand all current leaves in the tree at the same time.  Your first drill adds city data for both **KY** and **TN**. The next drill adds postal code data for both **KY** and **TN**, and keeps city data as well. Each step in the path shows you the same information and adds on one level of new information.

![Diagram showing the expand pathway](./media/end-user-drill/power-bi-expand-path.png)


### Drill down one field at a time


1. Select the drill-down icon to turn it on ![Screenshot of drill-down on/off icon turned on.](./media/end-user-drill/power-bi-drill-icon2.png).

    Now you have the option of drilling down **one field at a time** by selecting a visual element. Examples of visual elements are: bar, bubble, and leaf.

    ![Screenshot of visual with arrow pointing at drill-down on/off icon turned on.](media/end-user-drill/power-bi-select-drill-icon.png)

    If you don't turn on the drill-down option, selecting a visual element (like a bar, bubble, or leaf) won't drill down. Instead, it will cross-filter the other charts on the report page.

1. Select the leaf for **TN**. Your treemap now shows all the cities and territories in Tennessee that have a store.

    ![Screenshot of the treemap showing data for TN only.](media/end-user-drill/power-bi-drill-down-first.png)

1. At this point, you can:

    1. Continue drilling down for Tennessee.

    1. Drill down for a particular city in Tennessee.

    1. Expand instead.

    Let's continue to drill down one field at a time.  Select **Knoxville, TN**. Your treemap now shows the postal code for your store in Knoxville.

    ![Screenshot of the treemap showing postal code 37919.](media/end-user-drill/power-bi-drill-twice.png)

    Notice that the title changes as you drill down and back up again.

    And drill down one more field. Select postal code **37919** and drill down to store name. 

    ![Screenshot of the treemap showing Knoxville Lindseys.](media/end-user-drill/power-bi-drill-last.png)    

    For this particular data, drilling down all levels at once may not be interesting. Let's try expanding instead.

### Expand all and expand one field at a time

Having a treemap that shows us only a postal code or only a store name isn't informative.  So let's *expand* down one level in the hierarchy.  

1. First, drill back up to the postal code level.     
1. With the treemap active, select the *expand down* icon ![Screenshot of the expand-down icon.](./media/end-user-drill/power-bi-drill-icon6.png). Your treemap now shows two levels of the hierarchy: postal code and store name.

    ![Screenshot of the treemap showing postal code and store name](./media/end-user-drill/power-bi-expand.png)

1. To see all four hierarchy levels of data for Tennessee, select the drill-up arrow until you reach the second level, **Total units this year by territory and city**.

    ![Screenshot of the treemap showing all data for TN.](media/end-user-drill/power-bi-expand-second.png)

1. Make sure the drill-down option is still turned on, ![Screenshot of drill-down on/off icon turned on.](./media/end-user-drill/power-bi-drill-icon2.png) and select the *expand down* icon ![Screenshot of the expand-down icon.](./media/end-user-drill/power-bi-drill-icon6.png). Your treemap now shows the same number of leaves (boxes), but each leaf has additional detail. Instead of only showing city and state, it now also shows us postal code.

    ![Screenshot of the visual showing city, state, and postal code.](./media/end-user-drill/power-bi-expand-third.png)

1. Select the *expand down* icon one more time to display all four hierarchy levels of detail for Tennessee on your treemap. Hover over a leaf to see even more detail.

    ![Screenshot of the treemap showing a tooltip with leaf-specific data.](./media/end-user-drill/power-bi-expand-final.png)

## Show the data as you drill
Use **Show as a table** to get a look behind the scenes. Each time you drill or expand, **Show as a table** displays the data being used to build the visual. This may help you understand how hierarchies, drill, and expand work together to build visuals. 

In the upper-right corner, select **More actions** (...), and then select **Show as a table**. 

![Screenshot of the ellipses menu.](./media/end-user-drill/power-bi-more-actions.png)

Power BI opens the treemap so that it fills the canvas. The data that makes up the treemap displays below the visual. 

![Screenshot of treemap with data table displayed below.](./media/end-user-drill/power-bi-show-table.png)

With the visual alone in the canvas, continue drilling. Watch the data in the table change to reflect the data being used to create the treemap. The following table shows the results of drilling down all fields at once from territory to store name. The first table represents the top level of the hierarchy, the treemap showing two leaves, one for **KY** and one for **TN**. The next three tables represent the treemap's data as you drill down all levels at once--from territory to city to postal code to store name.


![Screenshot of showing data for all four levels of drill down.](./media/end-user-drill/power-bi-show-data.png)

Notice that the totals are the same for **City**, **PostalCode**, and **Name**. Matching totals won't always be the case.  But for this data, there's only one store in each postal code and in each city.  



## Considerations and limitations
- By default, drilling won't filter other visuals in a report. However, the report designer can change this default behavior. As you drill, look to see if the other visuals on the page are cross-filtering or cross-highlighting.

- Viewing a report that has been shared with you requires a Power BI Pro or Premium license or for the report to be stored in Power BI Premium capacity. [Which license do I have?](end-user-license.md)


## Next steps

[Visuals in Power BI reports](../visuals/power-bi-report-visualizations.md)

[Power BI reports](end-user-reports.md)

[Power BI - Basic Concepts](end-user-basic-concepts.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
