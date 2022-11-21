---
title: Personalize visuals in a report
description: Create your own view of a report, without editing it. 
author: mihart
ms.author: mihart
ms.reviewer: mihart
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 10/19/2021
LocalizationGroup: Reports
---
# Personalize visuals in a report

[!INCLUDE[consumer-appliesto-ynny](../includes/consumer-appliesto-ynny.md)]

It's hard to make one visual that satisfies everyone's requirements. But, when a colleague shares a report with you, you may want to make changes to the visuals -- without having to ask your colleague to make the changes for you. 

Maybe you'd like to swap what's on the axis, change the visual type, or add something to the tooltip. With the **Personalize this visual** feature, make the changes yourself and when you have the visual the way you want it, save it as a [bookmark](end-user-bookmarks.md) to come back to. You don't even need edit permission for the report.

:::image type="content" source="media/end-user-personalize-visuals/power-bi-personalize.png" alt-text="Personalize a visual":::
 
## What you can change

This feature helps you gain further insights through ad-hoc exploration of visuals on a Power BI report. Here are some of the modifications that you can make. The available options vary by visual type. 

- Change the visualization type
- Swap out a measure or dimension
- Add or remove a legend
- Compare two or more measures
- Change aggregations, etc.

Not only does this feature allow for new exploration capabilities. It also includes ways for you to capture and share your changes:

- Capture your changes
- Share your changes
- Reset all your changes for a report
- Reset all your changes for a visual
- Clear out your recent changes

> [!IMPORTANT]
> The ability to personalize a visual must be enabled by the report *designer*. If you don't see the **Personalize this visual** ![Personalize this visual icon](media/end-user-personalize-visuals/power-bi-personalize-visual-icon.png) icon, then the report designer has not enabled this feature for the current report. Check with the report owner or your Power BI administrator to have the feature enabled. To display contact information for the report owner, select the name of the report from the Power BI menu bar.

## Personalize visuals in the Power BI service

By personalizing a visual, you can explore your data in many ways, without leaving [report reading view](end-user-reading-view.md). The following examples show different ways you can modify a visualization to meet your needs. 

1. Open a report in reading view in the Power BI service.

2. In the menu bar for the visual, select the **Personalize this visual** ![Personalize this visual icon](media/end-user-personalize-visuals/power-bi-personalize-visual-icon.png) icon. 

### Change the visualization type

Do you think the data would display better as a Stacked column chart? Change the **Visualization type**.

:::image type="content" source="media/end-user-personalize-visuals/power-bi-personalize-change-visual-type.png" alt-text="Change visualization type":::
 
### Swap out a measure or dimension
Replace the field being used for the X axis by selecting the field that you want to replace, then selecting a different field.

:::image type="content" source="media/end-user-personalize-visuals/power-bi-personalize-change-axis.png" alt-text="Change the axis":::
 
### Add or remove a legend
By adding a legend, you can color-code a visual based on a category. In this example, we're color-coding based on company name. 

:::image type="content" source="media/end-user-personalize-visuals/power-bi-personalize-change-legend.png" alt-text="Add or remove the legend":::

### Change the placement of fields

Using drag and drop, you can change the placement of fields within the same visual property or even across different visual properties. For example, you can quickly move a field in the legend to the axis of a visual.

:::image type="content" source="media/end-user-personalize-visuals/personalize-drag-and-drop.png" alt-text="Screenshot of dragging a field in a visual.":::

You can also quickly reorder the columns of a table or matrix.

:::image type="content" source="media/end-user-personalize-visuals/personalize-reorder-columns.png" alt-text="Screenshot of reordering columns in a table.":::

### Compare two or more different measures
Compare and contrast values for different measures by using the + icon to add multiple measures for a visual. To remove a measure, select **More options (...)** and choose **Remove field**.

:::image type="content" source="media/end-user-personalize-visuals/power-bi-personalize-compare-measures.png" alt-text="Compare measures":::

### Change aggregations
Change how a measure is computed by changing the aggregation in the **Personalize** pane. Select **More options (...)** and choose the aggregation to use.

:::image type="content" source="media/end-user-personalize-visuals/power-bi-personalize-change-aggregation.png" alt-text="Change aggregations":::

### Capture changes 
Using personal bookmarks, capture your changes so you can return to your personalized view. Select **Bookmarks** > **Personal bookmarks** and give the bookmark a name. 

:::image type="content" source="media/end-user-personalize-visuals/power-bi-personalize-bookmark.png" alt-text="Create a bookmark":::
 
You can also make the bookmark your default view.

### Share changes 
If you have read and reshare permissions, when you share the report you can choose to include your changes. This personalized version does not overwrite the author's version. The colleague who is viewing your personalized report can select **Reset to default** and return to the author's version of the report. If the colleague has editing permissions, they can save your personalized version as a new report.

:::image type="content" source="media/end-user-personalize-visuals/power-bi-personalize-share-changes.png" alt-text="Share changes":::
 
### Reset all your changes to a report

From the upper-right corner of your report canvas, select **Reset to default**. This removes all your changes in the report and sets it back to the author's last saved view of the report.

:::image type="content" source="media/end-user-personalize-visuals/power-bi-personalize-reset-all.png" alt-text="Reset all changes":::
 
### Reset all your changes to a visual

From the menu bar for the visual, select **Reset this visual** to remove all your changes to a particular visual and set it back to the author's last saved view of that visual.

:::image type="content" source="media/end-user-personalize-visuals/power-bi-personalize-reset-visual.png" alt-text="Reset all visual changes":::
 
### Clear recent changes

Select the eraser icon to clear all recent changes you've made since you opened the **Personalize** pane.  

:::image type="content" source="media/end-user-personalize-visuals/power-bi-personalize-revert-changes.png" alt-text="Revert recent changes":::

## Considerations and limitations

Currently the feature has a few limitations to be aware of.

- **Personalize this visual** can be turned off for an entire report or for a particular visual. If you don't have an option to personalize a visual, check with your Power BI admin or the report owner. To display contact information for the report owner, select the name of the report from the Power BI menu bar.
- User explorations don't automatically persist. You need to save your view as a personal bookmark to capture your changes.
- This feature is supported in the Power BI mobile apps for iOS and Android tablets and in the Power BI Windows app; it is not supported in the Power BI mobile apps for phones. However, any change to a visual you save in a personal bookmark while in the Power BI service is respected in all the Power BI mobile apps.

## Next steps
[Copy a report visual as a static image](../visuals/power-bi-visualization-copy-paste.md)    
More questions? [Try the Power BI Community](https://community.powerbi.com/)
