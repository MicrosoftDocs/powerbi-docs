---
title: Optimize a Power BI visual for any size
description: Learn how to optimize visuals in existing reports in Power BI Desktop and the Power BI service for the Power BI phone apps.
author: mihart
manager: kvivek
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 04/13/2018
ms.author: mihart

LocalizationGroup: Create reports
---
# Optimize a Power BI visual for any size
By default, when you create a new report, the visuals are *responsive*: They change dynamically to display the maximum amount of data and insight, no matter the screen size. For older reports, you can set their visuals to resize dynamically, too.

As a visual changes size, Power BI prioritizes the data view, for example removing padding and moving the legend to the top of the visual automatically, so the visual remains informative even as it gets smaller. Responsiveness is especially useful in visuals in the Power BI mobile app on phones.

![Responsive visual resizing](media/desktop-create-responsive-visuals/power-bi-responsive-visual.gif)

Any visual with X and Y axes, and slicers, can resize responsively.

## Turn on responsiveness in Power BI Desktop
1. In an older report in Power BI Desktop, on the **View** tab, make sure you're in **Desktop Layout**.
   
    ![Desktop Layout icon](media/desktop-create-responsive-visuals/power-bi-desktop-layout.png)
2. Select a visual, and in the **Visualizations** pane select the **Format** section.
3. Expand **General** > slide **Responsive** to **On**.
   
    ![Responsive on](media/desktop-create-responsive-visuals/power-bi-turn-responsive-on.png)
   
     Now when you [create a report optimized for the phone](../desktop-create-phone-report.md) and add this visual, it will resize gracefully.

## Turn on responsiveness in the Power BI service
You can turn on responsiveness for a visual in an older report in the Power BI service. You need to be able to edit the report.

1. In a report in the Power BI service ([https://powerbi.com](https://powerbi.com)), select **Edit Report**.
2. Select a visual, and in the **Visualizations** pane select the **Format** section.
3. Expand **General** > slide **Responsive** to **On**.
   
    ![Responsive on](media/desktop-create-responsive-visuals/power-bi-turn-responsive-on.png)
   
     Now when you [create a phone view of this report](../desktop-create-phone-report.md) and add this visual, it will resize gracefully.

## Next steps
* [Create reports optimized for the Power BI phone apps](../desktop-create-phone-report.md)
* [View Power BI reports optimized for your phone](../consumer/mobile/mobile-apps-view-phone-report.md)
* More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

