---
title: Use drillthrough in Power BI Desktop
description: Learn how to drill down into data, on a new report page, in Power BI Desktop
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 11/28/2018
ms.author: davidi

LocalizationGroup: Create reports
---
# Use drillthrough in Power BI Desktop
With **drillthrough** in **Power BI Desktop**, you can create a page in your report that focuses on a specific entity such as a supplier, customer, or manufacturer. Users can right-click on a data point in other report pages. Then they can drill through to the focused page to get details that are filtered to that context.

![Using drillthrough](media/desktop-drillthrough/drillthrough_01.png)

## Using drillthrough
1. To use **drillthrough**, create a report page that has the visuals you want for the type of entity that you're going to provide drillthrough for. 

    For example, let's say you want to provide drillthrough for manufacturers. Then you might create a drillthrough page with visuals that show total sales, total units shipped, sales by category, sales by region, and so on. That way, when you drill through to that page, the visuals will be specific to the manufacturer you selected.

2. Then, on that drillthrough page, in the **Fields** section of the **Visualizations** pane, drag the field for which you want to enable drillthrough into the **Drillthrough filters** well.

    ![Drillthrough well](media/desktop-drillthrough/drillthrough_02.png)

    When you add a field to the **Drillthrough filters** well, **Power BI Desktop** automatically creates a *back* button visual. That visual becomes a button in published reports. Users who are consuming your report in the **Power BI service** can use this button to get back to the report page from which they came.

    ![Drillthrough image](media/desktop-drillthrough/drillthrough_03.png)

## Use your own image for a back button    
 Because the back button is an image, you can replace the image of that visual with any image you want. It will still operate as a back button so that report consumers can go back to their original page. To use your own image for a back button, take the following steps:

1. On the **Home** tab, select **Image**. Then locate your image, and place it on the drillthrough page.

2. Select your new image on the drillthrough page. Under the **Format Image** section, set the **Link** slider to **On**, and  then set the **Type** to **Back**. Your image now functions as a back button.

    ![Use image for back](media/desktop-drillthrough/drillthrough_05.png)

    
     Now users can right-click a data point in your report and get a context menu that supports drillthrough to that page. 

    ![Drillthrough menu](media/desktop-drillthrough/drillthrough_04.png)

    When report consumers choose to drill through, the page is filtered to show information about the data point on which they right-clicked. For example, lets say they right-clicked on a data point about Contoso (a manufacturer), and selected to drill through. The drillthrough page they go to is filtered to Contoso.

## Pass all filters in drillthrough

Beginning with the May 2018 version of **Power BI Desktop**, you can pass all applied filters to the drillthrough window. For example, you can select only a certain category of products and the visuals filtered to that category, and then select drillthrough. You might be interested in what that drillthrough would look like with all those filters applied.

To keep all applied filters, in the **Drillthrough** section of the **Visualizations** pane, set the **Pass all filters** toggle to **on**. 

![Keep all filters](media/desktop-drillthrough/drillthrough_06.png)

In versions of **Power BI Desktop** that were released before May 2018, the behavior is the same as having this toggle set to **off**.

When you then drill through on a visual, you can see which filters were applied as a result of the source visual having temporary filters applied. In the drillthrough window, those transient filters are shown in italics. 

![Transient filters in italics](media/desktop-drillthrough/drillthrough_07.png)

You could do this with tooltips pages, but that would be an odd experience because the tooltip wouldn't appear to be working properly. For this reason, so doing so with tooltips isn't recommended.

## Add a measure to drillthrough

Besides passing all filters to the drillthrough window, you can also add a measure or a summarized numeric column to the drillthrough area. Drag the drillthrough field to the drillthrough card to apply it. 

![Add a measure to drillthrough](media/desktop-drillthrough/drillthrough_08.png)

When you add a measure or summarized numeric column, you can drill through to the page when the field is used in the *Value* area of a visual.

That's all there is to using **drillthrough** in your reports. It's a great way to get an expanded view of the entity information that you selected for your drillthrough filter.

## Next steps

You might also be interested in the following articles:

* [Using slicers Power BI Desktop](visuals/desktop-slicers.md)

