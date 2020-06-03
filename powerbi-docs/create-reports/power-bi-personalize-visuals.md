---
title: Let users personalize visuals in a report
description: Let report readers create their own view of a report, without editing it. 
author: maggiesMSFT
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 05/21/2020
ms.author: maggies

LocalizationGroup: Reports
---
# Let users personalize visuals in a report

[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-desktop](../includes/yes-desktop.md)] [!INCLUDE [yes-service](../includes/yes-service.md)]

When you share a report with a broad audience, some of your users may want to see slightly different views of particular visuals. Maybe they'd want to swap what's on the axis, change the visual type, or add something to the tooltip. It's hard to make one visual that satisfies everyone's requirements. With this new capability, you can empower your consumers to explore and personalize visuals, all in report reading view. They can adjust the visual the way they want, and save it as a bookmark to come back to. They don't need to have edit permission for the report, or to go back to the report author for a change.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-visual.png" alt-text="Personalize a visual":::
 
## What report consumers can change

This feature allows consumers to gain further insights through ad-hoc exploration of visuals on a Power BI report. To learn how to use this feature as a consumer, see [Personalize visuals in your reports](../consumer/end-user-personalize-visuals.md). The feature is ideal for report creators who want enable basic exploration scenarios for their report readers. Here are modifications that report readers can make:

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


## Limitations and known issues

Currently the feature has a few limitations to be aware of.

- This feature isn't supported for embed scenarios, including publish to web.
- User explorations don't automatically persist. You need to save your view as a personal bookmark to capture your changes.
- This feature is supported in the Power BI mobile apps for iOS and Android tablets and in the Power BI Windows app; it is not supported in the Power BI mobile apps for phones. However, any change to a visual you save in a personal bookmark while in the Power BI service is respected in all the Power BI mobile apps.

There are also some known issues that we're addressing:

- Adding hierarchy isn't supported; you need to add the individual child items.
- You can't change a date hierarchy to a date or vice-versa. 
- With personal bookmarks, you might get results that are slightly different based on the sequence you select. Discrepancies are possible because we don't capture the full state of the report, but just the modifications made. The workaround is to select **Reset to default**, then select the bookmark you want to view. 

## Next steps

[Personalize visuals in your reports](../consumer/end-user-personalize-visuals.md).     

Give the new visual personalization experience a try. Give us your feedback for this feature, and how we can continue to improve it, on the [Power BI Ideas site](https://ideas.powerbi.com/forums/265200-power-bi). 

More questions? [Try the Power BI Community](https://community.powerbi.com/)
