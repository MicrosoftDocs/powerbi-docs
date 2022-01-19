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
ms.date: 12/07/2021
LocalizationGroup: Get started
---
# The new Format pane in Power BI Desktop (preview)

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

We’re introducing a redesigned Format pane in Power BI Desktop. This article explains the biggest changes we’ve made to improve usability and consistency across visuals and non-visual elements.  

We know it's a big change so we're rolling it out slowly, to get your early feedback and make any needed adjustments. It's currently in preview starting with the Power BI Desktop November 2021 release. Give it a try!

## Turn on the preview

- Go to **File** > **Options and settings** > **Options** > **Preview features** > **New Format pane**.

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

Across the Format pane, we’ve merged font family and font size onto a single line. Again, we want to reduce vertical space and better to align with Office.

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

## Considerations and limitations

Some features aren't available yet in the current version of the new Format pane.

- Some visuals, such as Azure maps, Esri maps, Power Automate, and decomposition tree, haven't been updated with subcategories yet.


## Next steps

[Get started with Power BI Desktop](desktop-getting-started.md)
