---
title: The new Format pane in Power BI Desktop (preview)
description: Get to know the redesigned Format pane in Power BI Desktop.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.custom: 
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: conceptual
ms.date: 06/01/2022
LocalizationGroup: Get started
---
# The new Format pane in Power BI Desktop (preview)

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

This article explains the biggest changes we’ve made to improve usability and consistency across visual and non-visual elements. Starting with the February 2022 release of Power BI Desktop, the redesigned Format pane is on by default. 

The first time you open the latest release of Power BI Desktop, you see a notification about the updated Format pane. We know it's a big change so we're rolling it out slowly, to get your feedback and make adjustments. It's been in preview since the Power BI Desktop November 2021 release, with improvements every month. Give it a try!

## Video

In this video, Roseanne demonstrates the latest updates to the Format pane.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4Yb4T]

## Recent updates

### May 2022

Here are the improvements we added in May 2022:

- We added a user preference setting to expand all subcategories when you open a category card. Go to **Options** > **Report settings**, and under **Format pane**, select **Expand all subcategories by default when you open a category**.
- We readded Analytics pane support for custom visuals.
- We readded **No fill** for Title background, Tooltips background, and Header icons Help tooltip background color pickers.
- We added **color** back  to all color swatches for easier searching.
- We readded the **Conditional formatting** card for the decomposition tree visual.
- To help with adjusting to the new naming conventions, we added an alias for the renamed **Conditional formatting** card, which is now called **Cell elements**. When you search for “conditional formatting” for a matrix or table, we display the **Cell elements**.

### April 2022

Here are the improvements we added in April 2022:

- Shape map custom color has been reintroduced.
- Scatter chart *show blank values* toggle has been reintroduced.
- Slicers with slider type (between, before, after) responsive toggle has been reintroduced.
- Button icon size setting has been reintroduced.
- Issue causing delay in cursor position for text input boxes is resolved.

### February 2022

Here are the improvements we added in February 2022:

- Ability to toggle axis title independent of axis has been re-added.
- Ability to add shade area to combo charts has been re-added.
- Ability to customize marker shape by series for scatter charts has been re-added.
- Outline settings for matrix and table have been re-added.
- Minor reordering of the field wells within the Build pane to match the order of the new Format pane cards for pie chart, donut chart, and scatter chart.

## New pivot icons 

We’ve updated the format tab icon and added a descriptive subtitle to make it easier to find the Format pane. Previously, it was hard to find the *format page* settings. We’ve added a new **Format page** icon that you see when you haven't selected any visuals, and the canvas is ready for formatting.


|Old Format pane  |New Format pane  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/old-format-pane-icon.png" alt-text="Screenshot of the old Format pane icon.":::     | :::image type="content" source="media/desktop-format-pane/new-format-page-icon.png" alt-text="Screenshot of new Format page icon."::: <br><br> :::image type="content" source="media/desktop-format-pane/new-format-visual-icon.png" alt-text="Screenshot of new Format visual icon.":::       |


## Moving the Visualization types gallery

To address the limited vertical space on the Format pane, we’ve moved the Visualization types gallery to be present only on the **Build** tab.  

|Old Format pane  |New Format pane  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/old-visualizations-pane.png" alt-text="Screenshot of old Visualizations pane.":::    | :::image type="content" source="media/desktop-format-pane/new-visualizations-pane.png" alt-text="Screenshot of location of new Visualizations pane.":::        |


## Redesigned compact toggle

We condensed the toggle design to reduce truncation and improve readability of the settings.

|Old Format pane  |New Format pane  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/old-toggle-format.png" alt-text="Screenshot of old format for toggles.":::     | :::image type="content" source="media/desktop-format-pane/new-toggle-format.png" alt-text="Screenshot of new format for toggles.":::       |


## Splitting specific vs. general settings

We've split the long list of formatting cards into two categories: visual specific vs. general settings. The general settings contain cards that affect the visual container and are consistent across all visual types. The visual specific settings contain cards that pertain only to the visual type you’re currently working with. This change allows for easier adjustment of general settings when clicking across visuals, better scannability and discovery of visual specific cards, and helps new users learn where to find what. 

|Old Format pane  |New Format pane  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/old-list-formatting-cards.png" alt-text="Screenshot of old list of formatting cards.":::    | :::image type="content" source="media/desktop-format-pane/new-format-visual-general.png" alt-text="Screenshot of new Visuals and General groupings of cards.":::        |


## New global revert to default

On a new **More options (...)** menu, you can revert all settings back to default. Previously this process was painstaking, opening each card and selecting **Revert to default**. This option is especially helpful when you want your visuals to reflect your theme styling.  

:::image type="content" source="media/desktop-format-pane/new-revert-all-default.png" alt-text="Screenshot of new Revert all settings to defaults.":::

## Subcategories

You’ll notice that within the cards we've broken up the settings further into subcategories. Breaking them up improves readability and allows you to focus on specific parts of a card at a time. We’ve also added a new context menu for navigating these new subcategories. Now you can right-click in a card to expand all the subcategories at once, or collapse them all for quick scanning and scrolling. 

|Old Format pane  |New Format pane  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/old-no-categories.png" alt-text="Screenshot of old subcategories.":::     | :::image type="content" source="media/desktop-format-pane/new-expand-collapse-categories.png" alt-text="Screenshot of new expand and collapse subcategories.":::        |

## No more double scrollbars

Previously, when scrolling within a long card, the Format pane would have two scrollbars. Now when you expand cards and subcategories, you have one scrollbar that adapts to the length of the contents.

|Old Format pane  |New Format pane  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/old-double-scrollbars.png" alt-text="Screenshot of old double scrollbars.":::     | :::image type="content" source="media/desktop-format-pane/new-single-scrollbar.png" alt-text="Screenshot of new single scrollbar.":::        |

## Hidden dynamic cards exposed

Previously, you only saw some cards when you added certain fields in the build tab. For new users, it can be hard to understand when and why some cards are available or unavailable. With our newly added vertical space, we can expose these hidden dynamic cards with helpful tooltips on what actions to take to enable the cards.  

## Merged font settings

Across the Format pane, we’ve merged font family and font size onto a single line. Again, we want to reduce vertical space and to better align with Office.

|Old Format pane  |New Format pane  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/old-font-settings.png" alt-text="Screenshot of old font settings.":::     | :::image type="content" source="media/desktop-format-pane/new-font-settings.png" alt-text="Screenshot of new font settings.":::        |


## Customize series mechanism

Previously, the old Format pane repeated the same list of settings after toggling **Customize series** to **On**. We've consolidated this list into an **Apply settings to** dropdown that lets you easily switch between updating the settings for all series or a particular series without having to scroll.

|Old Format pane  |New Format pane  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/old-customize-series.png" alt-text="Screenshot of old customize series.":::     | :::image type="content" source="media/desktop-format-pane/new-customize-series.png" alt-text="Screenshot of new customize series.":::         |

## Button states mechanism

Similar to customizing a series, we’ve consolidated the button style cards. Consolidation allows us to use one **Apply settings to** dropdown to easily toggle between button states and update various aspects of the style.  

|Old Format pane  |New Format pane  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/old-button-states.png" alt-text="Screenshot of old button state cards.":::    | :::image type="content" source="media/desktop-format-pane/new-button-states.png" alt-text="Screenshot of new button state cards":::         |


## Highlighting match in search

In a small but mighty change, we’ve added the same yellow highlight you see in the Fields list and Filter pane to the Format pane search results. When in search mode, results will reflect contents from both the visual and general pivots.

|Old Format pane  |New Format pane  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/old-search-no-highlight.png" alt-text="Screenshot of no highlight in the old Search experience.":::     | :::image type="content" source="media/desktop-format-pane/new-search-highlight.png" alt-text="Screenshot of now there's a highlight in the new Search experience.":::       |

## Order, naming, and hierarchy

Through the years, the Format pane has received many new additions but they haven't always been added consistently. It’s hard, especially for new users, to learn where things are when cards and settings constantly jump around. Or the name of a setting in one visual is called something entirely different in another. We’ve rearranged, renamed, added missing units, and consolidated cards/settings to behave consistently across visuals.  


## Consolidated outline settings for matrix and table

The outline settings for matrix and tables are now consolidated to enabling be set from the **Grid** card. Previously users had to use the Grid card to set the color and width, then navigate to each section of the matrix to adjust the border location. With this update, you can adjust the borders for the whole matrix and refine each section from the same place within the **Grid** card.

|Old behavior  |New behavior  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/format-pane-matrix-border-old.png" alt-text="Screenshot of old outline format experience.":::     | :::image type="content" source="media/desktop-format-pane/format-pane-matrix-border-new.png" alt-text="Screenshot of new outline format experience.":::       |


## Split for column grand and row totals for matrix

In the previous Format pane settings, changing grand totals would affect both row and columns. With the April 2022 updates you can format each separately.

|Old behavior  |New behavior  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/format-pane-totals-old.png" alt-text="Screenshot of old totals format experience.":::     | :::image type="content" source="media/desktop-format-pane/format-pane-totals-new.png" alt-text="Screenshot of new totals format experience.":::       |


## Legend locations options

More location options for legend locations are provided beginning with the April 2022 update.

|Old behavior  |New behavior  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/format-pane-legend-options-old.png" alt-text="Screenshot of old legend location options.":::     | :::image type="content" source="media/desktop-format-pane/format-pane-legend-options-new.png" alt-text="Screenshot of new legend location options.":::       |



## Turn off the preview

- If you need to turn off the preview, go to **File** > **Options and settings** > **Options** > **Preview features** > **New Format pane**.

    We encourage you to give us feedback about why you're turning it off. Select **Share feedback** link next to the **New format pane** checkbox, and let us know.

    :::image type="content" source="media/desktop-format-pane/format-pane-preview-switch-feedback.png" alt-text="Screenshot of switching off the New Format pane.":::


## Considerations and limitations

Some features aren't available yet in the current version of the new Format pane.

- Some visuals, such as Azure maps, Esri maps, Power Automate, and decomposition tree, haven't been updated with subcategories yet.


## Next steps

[Get started with Power BI Desktop](desktop-getting-started.md)
