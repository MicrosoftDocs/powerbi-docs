---
title: The new Format pane in Power BI Desktop
description: Get to know the redesigned Format pane in Power BI Desktop.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.custom: 
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: conceptual
ms.date: 11/11/2021
LocalizationGroup: Get started
---
# The new Format pane in Power BI Desktop

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

We’re introducing a redesigned Format pane. This article explains the biggest changes we’ve made to improve the usability and consistency across visuals, and non-visual elements.  

We know it's a big change so we're rolling it out slowly, to get your early feedback and make any needed adjustments. It's currently in preview starting with the Power BI Desktop November release. Give it a try!

## Turn on the preview

- Go to **File** > **Options and settings** > **Options** > **Preview features** > **New format pane**.

## New pivot icons 

We’ve updated the format tab icon and added a descriptive subtitle to make it easier to find the format pane. Previously, it was hard to find the *format page* settings. We’ve added a new **Format page** icon that you see when you haven't selected any visuals, and the canvas is ready for formatting.


|Old format pane  |New format pane  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/old-format-pane-icon.png" alt-text="Screenshot of the old Format pane icon.":::     | :::image type="content" source="media/desktop-format-pane/new-format-page-icon.png" alt-text="Screenshot of new Format page icon."::: <br><br> :::image type="content" source="media/desktop-format-pane/new-format-visual-icon.png" alt-text="Screenshot of new Format visual icon.":::       |


## Moving the Visualization types gallery

To address the limited vertical space on the Format pane, we’ve moved the Visualization types gallery to be present only on the **Build** tab.  

|Old format pane  |New format pane  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/old-visualizations-pane.png" alt-text="Screenshot of old Visualizations pane.":::    | :::image type="content" source="media/desktop-format-pane/new-visualizations-pane.png" alt-text="Screenshot of location of new Visualizations pane.":::        |


## Redesigned compact toggle

We condensed the toggle design to reduce truncation and improve readability of the settings.

|Old format pane  |New format pane  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/old-toggle-format.png" alt-text="Screenshot of old format for toggles.":::     | :::image type="content" source="media/desktop-format-pane/new-toggle-format.png" alt-text="Screenshot of new format for toggles.":::       |


## Splitting specific vs. general settings

We've split the long list of formatting cards into two categories: visual specific vs. general settings. The general settings contain cards that affect the visual container and are consistent across all visual types. The visual specific settings contain cards that pertain only to the visual type you’re currently working with. This change allows for easier adjustment of general settings when clicking across visuals, better scannability and discovery of visual specific cards, and helps new users learn where to find what. 

|Old format pane  |New format pane  |
|---------|---------|
|:::image type="content" source="media/desktop-format-pane/old-list-formatting-cards.png" alt-text="Screenshot of old list of formatting cards.":::    | :::image type="content" source="media/desktop-format-pane/new-format-visual-general.png" alt-text="Screenshot of new Visuals and General groupings of cards.":::        |


## New global revert to default

We’ve now added a new **More options (...)** menu that allows you to revert all settings back to default. Previously this process was painstaking, opening each card and selecting Revert to default. This option is especially helpful when you want your visual to reflect your theme styling.  

:::image type="content" source="media/desktop-format-pane/new-revert-all-default.png" alt-text="Screenshot of new Revert all settings to defaults.":::

## Subcategories

You’ll also notice within the cards we have broken up the settings further into subcategories. This improves readability and allows you to focus on specific parts of a card a time. We’ve also added a new context menu for navigating these new subcategories. Now you can right click within a card to expand all the sub-categories at once or collapse for quick scanning and scrolling. 

|Old format pane  |New format pane  |
|---------|---------|
|Row1     |         |

## No more double scrollbars

This a big usability improvement. Previously, when scrolling within a long card the format pane would have 2 scrollbars! Now when you expand cards and subcategories, we have 1 scrollbar that adapts to the length of the contents. 

|Old format pane  |New format pane  |
|---------|---------|
|Row1     |         |


## Hidden dynamic cards exposed

Previously, some cards were only shown when you added certain fields in the build tab. For new users, this can be hard to understand when and why some cards were available or unavailable. With our newly added vertical space, we can expose these hidden dynamic cards with helpful tooltips on what actions to take to enable the cards.  

## Merged font settings

Across the format pane, we’ve now merged font family and font size to be on 1 line. Again, this was in an effort to reduce vertical space and better to align with Office. 

|Old format pane  |New format pane  |
|---------|---------|
|Row1     |         |


## Customize series mechanism

Previously, the old format pane would repeat the same list of settings after toggling the “customize series” toggle on. We have now consolidated this into an “apply settings to” dropdown that lets you easily switch between updating the settings for all series or a particular series without having to scroll. 

|Old format pane  |New format pane  |
|---------|---------|
|Row1     |         |

## Button states mechanism

Similar to customize series, we’ve also consolidated the button style cards. This allows us to use 1 “apply settings to” dropdown to easily toggle between button states to update various aspects of the style.  

|Old format pane  |New format pane  |
|---------|---------|
|Row1     |         |


## Highlighting match in search

Small but mighty change, we’ve added the same yellow highlight you see in the Fields list and Filter pane to the Format pane search results. Note, when in search mode, results will reflect contents from both the visual and general pivots. 

|Old format pane  |New format pane  |
|---------|---------|
|Row1     |         |


## Order, naming conventions, and information hierarchy

Throughout the years, the format pane has received many new additions but not always have these additions been added in a consistent fashion. It’s especially hard for new users to learn where things are when cards and settings constantly jump around. Or the name of the same setting in one visual is called something entirely different in another. We’ve now rearranged, renamed, added missing units, and consolidated cards/settings to behave consistent across visuals.  

Bonus! Analytics pane updated styling: 

To match the new format pane style, we’ve also updated the Analytics pane look and feel.  
