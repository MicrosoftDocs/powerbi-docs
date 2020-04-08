---
title: Let users personalize visuals in a report
description: Let report readers create their own view of a report, without editing it. 
author: maggiesMSFT
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 04/07/2020
ms.author: maggies

LocalizationGroup: Reports
---
# Let users personalize visuals in a report

[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-desktop](../includes/yes-desktop.md)] [!INCLUDE [yes-service](../includes/yes-service.md)]

When you share a report with a broad audience, some of your users may want to see slightly different views of particular visuals. Maybe they'd want to swap what's on the axis, change the visual type, or add something to the tooltip. It's hard to make one visual that satisfies everyone's requirements. With this new capability, you can empower your consumers to explore and personalize visuals, all in report reading view. They can adjust the visual the way they want, and save it as a bookmark to come back to. They don't need to have edit permission for the report, or to go back to the report author for a change.
 
## What report consumers can change

This feature allows consumers to gain further insights through ad-hoc exploration of visuals on a Power BI report. The feature is ideal for report creators who want enable basic exploration scenarios their report readers. Here are modifications that report readers can make:

- Change the visualization type
- Swap out a measure or dimension
- Add or remove a legend
- Compare two or more measures
- Change aggregations, etc.

Not only does this feature allow for new exploration capabilities. It also includes ways for consumers to capture and share their changes:

- Capture their changes
- Share their changes
- Reset all their changes for a report
- Reset all their changes for a visual
- Clear out their recent changes

## Setup experience

### Turn on the preview feature

Since this feature is in preview, you first need to turn on the feature switch. Go to **File** > **Options and Settings** > **Options**. Under **Global** settings > **Preview features**, make sure **Personalize visuals** is selected.


You may have to restart Power BI Desktop to see it in the settings for the current file.

### Enable personalization in a report

After you turn on the preview switch, you need to specifically enable it for the reports that you want consumers to be able to personalize visuals for.

You can enable the feature either in Power BI Desktop or the Power BI service.

#### In Power BI Desktop

To enable the feature in Power BI Desktop, go to **File** > **Options and Settings** > **Options** > **Current file** > **Report settings**. Make sure **Personalize visuals (preview)** is turned on.


#### In the Power BI service

To enable the feature in the Power BI service instead, go to **Settings** for your report.


 
Turn on **Personalize visuals (preview)** > **Save**.

### Select the visuals that can be personalized

When you enable this setting for a given report, by default all visuals in that report can be personalized. If you don't want all the visuals to be personalized, you can turn the setting on or off per visual.

Select the visual > select **Format** in the **Visualizations** pane > expand **Visual header**.


 
Slide **Personalize visual** >  **On** or **Off**.


## Consumption experience (Power BI Service – reading mode)
Using this feature, your consumers can explore a visual in many ways! Check out the examples below to see different ways users can tweak a visualization to meet their needs. 
Change the visualization type
Users can view the visualization in a different representation by simply changing the Visualization type.
 
Swap out a measure or dimension
Users can replace a measure or dimension by selecting the field that they want to replace and then selecting another measure or dimension.
 
Add or remove a legend
By adding a legend, users can color-code a visual based on a category, or by removing the legend through the context menu, they can eliminate the categorical color-coding. 
 
Compare two or more different measures
By adding multiple measures for a visual using the + icon, they can compare and contrast how the different measures behave.
  

Change aggregations
If users want to change how a measure is computed, they can change the aggregation (for an implicit measure) through the context menu.
 
Capture their changes 
Using personal bookmarks, users can capture their changes so that they can return to their personalized view. 
 
Additionally, they have the option to make the bookmark their default view.
Share their changes 
For your consumers that have read and reshare permissions, when they share the report, they can choose to include their changes.

 
Reset all their changes to a report
Using reset to default, users can reset all their changes in the report back to the authors last saved view of the report.
 
Reset all their changes to a visual
Using reset this visual, users can reset their changes to a particular visual so that that visual reflects the authors last saved view for that visual.
 
Clear out their recent changes
Using the eraser icon, users can clear any of the recent changes they've made starting from point when they opened the flyout.  
 

## Limitations and known issues

Currently the feature has a few limitations to be aware of.

- This feature isn't supported for embed scenarios, including publish to web.
- User explorations don't automatically persist. Users need to save their view as a personal bookmark to capture their changes.
- Users can't change visuals while in the Power BI mobile apps. However, any visual changes they save in a personal bookmark while in the Power BI service are respected in the mobile apps.

There are some known issues that we're in the process of addressing:

- Adding hierarchy isn't supported; users will need to add the individual child items.
- Users can't change a date hierarchy to a date and vice-versa. 
- With Personal bookmarks, users might get results that are slightly different based on the sequence they select. This is due to the fact that we don't capture the full state of the report just the modifications made; the workaround is to hit reset to default and then selecting the bookmark you want to view. 

## Next steps

Give the new visual personalization experience a try. Give us your feedback for this feature, and how we can continue to improve it, on the [Power BI Ideas site](https://ideas.powerbi.com/forums/265200-power-bi). 

More questions? [Try the Power BI Community](https://community.powerbi.com/)

