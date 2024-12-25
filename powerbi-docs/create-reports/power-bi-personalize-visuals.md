---
title: Let users personalize visuals in a report
description: Learn how to let report readers create their own view of a report without editing it, all in report reading view. 
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 03/01/2023
LocalizationGroup: Reports
---
# Let users personalize visuals in a report

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

When you share a report with a broad audience, some of your users might want to see slightly different views of particular visuals. Maybe they'd want to swap what's on the axis, change the visual type, or add something to the tooltip. It's difficult to make one visual that satisfies everyone's requirements. With this new capability, you can empower your business users to explore and personalize visuals, all in report reading view. They can adjust the visual the way they want and save it as a bookmark to come back to. They don't need to have edit permission for the report or go back to the report author for a change.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-visual.png" alt-text="Screenshot showing a personalized visual.":::

## What report users can change

This feature is ideal for report creators: You can enable basic exploration scenarios for your report readers. Your report readers gain further insights through ad hoc exploration of visuals on a Power BI report. Here are modifications that they can make:

- Change the visualization type.
- Swap out a measure or dimension.
- Add or remove a legend.
- Compare two or more measures.
- Change aggregations, etc.

Not only does this feature allow for new exploration capabilities, it also includes ways for users to capture and share their changes:

- Capture their changes.
- Share their changes.
- Reset all their changes for a report. Selecting **Reset to default** removes all personalizations.
- Reset all their changes for a visual.
- Clear out their recent changes.

After report readers personalize a report, they can [create personal bookmarks](../consumer/end-user-bookmarks.md#create-personal-bookmarks-in-the-power-bi-service) to save their personalizations. To learn how report readers can use this feature, see [Personalize visuals in your reports](../consumer/end-user-personalize-visuals.md).

## Enable personalization in a report

You can enable the feature either in Power BI Desktop or the Power BI service. You can also enable it in embedded reports.

# [Power BI Desktop](#tab/powerbi-desktop)

To enable the feature in Power BI Desktop, go to **File** > **Options and settings** > **Options** > **Current file** > **Report settings**. Select the **Personalize visuals** checkbox.

:::image type="content" source="media/power-bi-personalize-visuals/personalize-report-setting-desktop-2.png" alt-text="Screenshot of the Options dialog with the Personalize visuals checkbox selected.":::

# [Power BI service](#tab/powerbi-service)

To enable the feature in the Power BI service instead, go to **Settings** for your report.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-report-service-settings-personalize-visual-2.png" alt-text="Screenshot highlighting Report settings in the Power BI service.":::

Switch on **Personalize visuals** > **Save**.

:::image type="content" source="media/power-bi-personalize-visuals/personalize-report-setting-service-2.png" alt-text="Screenshot showing the Personalize visuals checkbox selected.":::

---

## Switch the feature on or off at a page or visual level

When you enable Personalize visuals for a given report, by default all visuals in that report can be personalized. If you don't want all the visuals to be personalized, you can switch the setting on or off per page or per visual.

### Personalize visual per page

Select the page tab > select **Format** in the **Visualizations** pane.

:::image type="content" source="media/power-bi-personalize-visuals/personalize-page-level-setting-desktop-2.png" alt-text="Screenshot shows the menu to select Personalize visual for a page.":::

Slide **Personalize visual** > **On** or **Off**.

### Personalize visual per visual

Select the visual. Then select **Format** > **General** > **Header icons** > **Icons**.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-format-visual-header-personalize-desktop-2.png" alt-text="Screenshot shows the Icons menu, where you can select personalization.":::

Slide **Personalize visual** > **On** or **Off**.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-format-visual-personalize-on-off-desktop-2.png" alt-text="Screenshot shows the Personalize visual slider.":::

## Use Perspectives for a more focused view

For Personalize visuals, you can use **Perspectives** to choose a subset of a model that provides a more focused view. Choosing a subset can be helpful when working with a large data model, allowing you to focus on a manageable subset of fields. Choosing a subset can also help to not overwhelm report readers with the full collection of fields in that large model.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-perspective-1.png" alt-text="Screenshot showing the Personalize visuals options.":::

Keep the following considerations in mind when working with perspectives:

* Perspectives aren't meant to be used as a security mechanism, they're a tool for providing a better end-user experience. All security for a perspective is inherited from the underlying model.

* Perspectives in both tabular and multi-dimensional models are supported. However, for perspectives in multi-dimensional models, you can only set the perspective to be the same as the base cube for the report.

* Before deleting a perspective from a model, be sure to check that the perspective isn't being used in the Personalize visuals experience.

To use Perspectives, you must enable Personalize visuals for the report. You also must create at least one Perspective that includes the dimensions and measures you want end-users to interact with for the Personalize visuals experience.

To create the perspective use Tabular Editor, which you can download from the following location: [Tabular Editor download](https://tabulareditor.com/).

Once you install **Tabular Editor**, open your report in **Power BI Desktop** and launch **Tabular Editor** from the **External Tools** tab of the ribbon.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-perspective-2.png" alt-text="Screenshot of the Tabular Editor in the External Tools ribbon.":::

In Tabular Editor, right-click on **Perspectives** > **Create** > **Perspective**.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-perspective-3.png" alt-text="Screenshot of the Tabular Editor, highlighting Create and Perspective.":::

You can double-click the text to rename the perspective.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-perspective-4.png" alt-text="Screenshot highlighting the name of the perspective.":::

Next, add fields to the perspective by opening the **Tables** folder in Tabular Editor. Then right-click on the fields you want to show in the perspective.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-perspective-5.png" alt-text="Screenshot of the Tabular Editor right-click menu, highlighting Shown in perspectives.":::

Repeat that process for each field you want to add to the perspective. You can’t add duplicate fields in a perspective, so any field you already added can’t be added again.

After you added all the fields you want, be sure to save your settings, both in Tabular Editor and then also in Power BI Desktop.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-perspective-6.png" alt-text="Screenshot highlighting the Save perspectives settings in the Tabular Editor.":::

Once you save the new perspective to the model and save the Power BI Desktop report, go to the **Format** pane for the page, where you see a new section for **Personalize visual**.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-perspective-7.png" alt-text="Screenshot showing the Personalize visual section in the Format pane.":::

The selection for *Report-reader perspective* is set to *Default fields* initially. Once you select the dropdown arrow, you see the other Perspectives you’ve created.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-perspective-08.png" alt-text="Screenshot showing the dropdown arrow to see other perspectives.":::

Once you set the Perspective for the report page, the Personalize visuals experience for that page is filtered to the selected Perspective. Select **Apply to all pages** to apply your Perspective setting to all existing pages in your report.

:::image type="content" source="media/power-bi-personalize-visuals/power-bi-personalize-perspective-09.png" alt-text="Screenshot showing how to apply the perspective to the entire report.":::

## Considerations and limitations

The feature has a few limitations to be aware of.

- This feature isn't supported for publish to web.
- Export to PowerPoint and PDF don't capture personalized visuals.
- User explorations don't automatically persist. Encourage your report readers to [save their views as personal bookmarks](../consumer/end-user-bookmarks.md#create-personal-bookmarks-in-the-power-bi-service) to capture their changes.
- This feature is supported in the Power BI mobile apps for iOS and Android tablets. It isn't supported in the Power BI mobile apps for phones. However, any change to a visual you save in a personal bookmark while in the Power BI service is respected in all the Power BI mobile apps.

## Related content

- [Personalize visuals in your reports](../consumer/end-user-personalize-visuals.md).

- More questions? [Ask the Power BI Community](https://community.powerbi.com/)
