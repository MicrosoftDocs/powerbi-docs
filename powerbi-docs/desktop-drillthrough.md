---
title: Use drillthrough in Power BI Desktop
description: Learn how to drill down into data, on a new report page, in Power BI Desktop
services: powerbi
documentationcenter: ''
author: davidiseminger
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 12/06/2017
ms.author: davidi

LocalizationGroup: Create reports
---
# Use drillthrough in Power BI Desktop
With **drillthrough** in **Power BI Desktop**, you can create a page in your report that focuses on a specific entity - such as a supplier, customer, or manufacturer. With that focused report page, users can right-click on a data point in other report pages and drillthrough to the focused page to get details that are filtered to that context.

![](media/desktop-drillthrough/drillthrough_01.png)

## Using drillthrough
To use **drillthrough**, create a report page that has visuals you'd like to see for the type of entity on which you'll provide drillthrough. For example, if you're interested in providing drillthrough for manufacturers, you might create a drillthrough page with visuals that show total sales, total units shipped, sales by category, sales by region, and so on. That way, when you drillthrough to that page, the visuals will be specific to the manufacturer you selected.

Then, on that drillthrough page, in the **Fields** section of **Visualizations** pane, drag the field about which you want to drillthrough into the **Drillthrough filters** well.

![](media/desktop-drillthrough/drillthrough_02.png)

When you add a field to the **Drillthrough filters** well, **Power BI Desktop** automatically creates a *back* button visual. That visual becomes a button in published reports, and lets users who are consuming your report in the **Power BI service** easily get back to the report page from which they came (the page from which they selected to drillthrough).

![](media/desktop-drillthrough/drillthrough_03.png)

Because the back button is an image, you can replace the image of that visual with any image you want, and it will still operate as a back button so report consumers can go back to their original page. To use your own image for a back button, just place an image visual on the drillthrough page, then select the visual, and set the *Back button* slider to on. Your image now functions as a back button.

![](media/desktop-drillthrough/drillthrough_05.png)

When your **drillthrough** page is complete and users right-click a data point in your report that uses the field you put into the **Drillthrough filters** well, a context menu appears that supports drillthrough to that page.

![](media/desktop-drillthrough/drillthrough_04.png)

When report consumers choose to drillthrough, the page is filtered to show information about the data point on which they right-clicked. For example, if they right-clicked on a data point about Contoso (a manufacturer), and selected to drillthough, the drillthrough page they are taken to is filtered to Contoso.

> [!NOTE]
> Only the field that is in the **Drillthrough filters** well gets passed through to the drillthrough report page. No other contextual information is passed.
> 
> 

And, that's all there is to using **drillthrough** in your reports. It's a great way to get an expanded view on the entity information you select for your drillthrough filter.

