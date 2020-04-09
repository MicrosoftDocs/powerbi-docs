---
title: Let users personalize visuals in a report
description: Let report readers create their own view of a report, without editing it. 
author: maggiesMSFT
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 04/09/2020
ms.author: maggies

LocalizationGroup: Reports
---
# Let users personalize visuals in a report

[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-desktop](../includes/yes-desktop.md)] [!INCLUDE [yes-service](../includes/yes-service.md)]

When you share a report with a broad audience, some of your users may want to see slightly different views of particular visuals. Maybe they'd want to swap what's on the axis, change the visual type, or add something to the tooltip. It's hard to make one visual that satisfies everyone's requirements. With this new capability, you can empower your consumers to explore and personalize visuals, all in report reading view. They can adjust the visual the way they want, and save it as a bookmark to come back to. They don't need to have edit permission for the report, or to go back to the report author for a change.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-visual.png" alt-text="Personalize a visual":::
 
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

## Turn on the preview feature

Since this feature is in preview, you first need to turn on the feature switch. Go to **File** > **Options and Settings** > **Options**. Under **Global** settings > **Preview features**, make sure **Personalize visuals** is selected.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-preview-personalize-visual.png" alt-text="Turn on Personalize visuals":::

You may have to restart Power BI Desktop to see it in the settings for the current file.

## Enable personalization in a report

After you turn on the preview switch, you need to specifically enable it for the reports that you want consumers to be able to personalize visuals for.

You can enable the feature either in Power BI Desktop or the Power BI service.

### In Power BI Desktop

To enable the feature in Power BI Desktop, go to **File** > **Options and Settings** > **Options** > **Current file** > **Report settings**. Make sure **Personalize visuals (preview)** is turned on.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-report-settings-personalize-visual.png" alt-text="Enable personalization in a report":::

### In the Power BI service

To enable the feature in the Power BI service instead, go to **Settings** for your report.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-report-service-settings-personalize-visual.png" alt-text="Report settings in the Power BI service":::

Turn on **Personalize visuals (preview)** > **Save**.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-report-service-personalize-visual.png" alt-text="Turn on Personalize visuals in the service":::

## Select visuals that can be personalized

When you enable this setting for a given report, by default all visuals in that report can be personalized. If you don't want all the visuals to be personalized, you can turn the setting on or off per visual.

Select the visual > select **Format** in the **Visualizations** pane > expand **Visual header**.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-format-visual-header-personalize.png" alt-text="Select Visual header":::
 
Slide **Personalize visual** >  **On** or **Off**.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-format-visual-personalize-on-off.png" alt-text="Personalize visual slider on or off":::

## Personalize visuals in the Power BI Service

By personalizing a visual, your consumers can explore your data in many ways, without leaving report reading view. The following examples show different ways users can modify a visualization to meet their needs. 

1. Open a report in reading view in the Power BI service.

2. In the upper-right corner of the visual, select the **Personlize this visual** :::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-visual-icon.png" alt-text="Personalize visual icon"::: icon. 

### Change the visualization type

You can view the visualization to a different representation by changing the **Visualization type**.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-change-visual-type.png" alt-text="Change visualization type":::
 
### Swap out a measure or dimension
You can replace a measure or dimension on the X axis by selecting the field that you want to replace, then selecting another measure or dimension.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-change-axis.png" alt-text="Change the axis":::
 
### Add or remove a legend
By adding a legend, you can color-code a visual based on a category. You can eliminate the categorical color-coding by clearing the **Legend** box in the **Personalize** pane. 

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-change-legend.png" alt-text="Add or remove the legend":::

### Compare two or more different measures
You can compare and contrast values for different measures by using the + icon to add multiple measures for a visual.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-compare-measures.png" alt-text="Compare measures":::

### Change aggregations
You can change how a measure is computed by changing the aggregation in the **Personalize** pane. (for an implicit measure)

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-change-aggregation.png" alt-text="Change aggregations":::

### Capture changes 
Using personal bookmarks, capture your changes so you can return to your personalized view. 

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-bookmark.png" alt-text="Create a bookmark":::
 
YOu can also make the bookmark your default view.

### Share changes 
If you have read and reshare permissions, when you share the report you can choose to include your changes.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-share-changes.png" alt-text="Share changes":::
 
### Reset all your changes to a report

Select **Reset to default** to remove all your changes in the report and set it back to the author's last saved view of the report.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-reset-all.png" alt-text="Reset all changes":::
 
### Reset all your changes to a visual

Select **Reset this visual** to remove all your changes to a particular visual and set it back to the author's last saved view of that visual.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-reset-visual.png" alt-text="Reset all visual changes":::
 
### Clear recent changes

Select the eraser icon to clear all recent changes you've made since you opened the **Personalize** pane.  

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-revert-changes.png" alt-text="Revert recent changes":::

## Limitations and known issues

Currently the feature has a few limitations to be aware of.

- This feature isn't supported for embed scenarios, including publish to web.
- User explorations don't automatically persist. You need to save your view as a personal bookmark to capture your changes.
- You can't change visuals while in the Power BI mobile apps. However, any visual changes you save in a personal bookmark while in the Power BI service are respected in the mobile apps.

There are also some known issues that we're addressing:

- Adding hierarchy isn't supported; you need to add the individual child items.
- You can't change a date hierarchy to a date or vice-versa. 
- With personal bookmarks, you might get results that are slightly different based on the sequence you select. Discrepancies are possible because we don't capture the full state of the report, but just the modifications made. The workaround is to select **Reset to default**, then select the bookmark you want to view. 

## Next steps

Give the new visual personalization experience a try. Give us your feedback for this feature, and how we can continue to improve it, on the [Power BI Ideas site](https://ideas.powerbi.com/forums/265200-power-bi). 

More questions? [Try the Power BI Community](https://community.powerbi.com/)

