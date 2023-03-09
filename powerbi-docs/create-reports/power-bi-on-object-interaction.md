---
title: Use on-object interaction in your report (preview)
description: Learn how to use on-object interaction in a report in Power BI Desktop.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.custom:
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 03/09/2023
LocalizationGroup: Visualizations
---
# Use on-object interaction in your report (preview)

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

On-object interaction is the new way to build and format your visuals, directly on the visual. It puts common actions for creating and formatting visuals on the visuals themselves, actions such as adding fields, changing visualization types, and formatting text.

## Get started

Because on-object is a preview feature, you need to turn it on.

1. In Power BI Desktop, select **File** > **Options and settings** > **Options** > **Preview Features** > **On-object interaction**. 

    :::image type="content" source="media/power-bi-on-object-interaction/on-object-preview-option.png" alt-text="turn on preview feature.":::

1. Restart Power BI Desktop to see the new experience.

## Build a visual with on-object interaction

You can begin building a new visual in one of three ways. 

- Select or drag fields from the Data pane.
- Select a new visual from the **Insert** section of the ribbon, and then add fields. If you have the ribbon collapsed, select **Visual gallery** > select a visual.
- Right-click the canvas > **Add visual**.

You notice the Visualizations pane is no longer available, by design.

> [!NOTE]
> Custom visuals aren't currently shown in the ribbon gallery collapsed tray, but they're available from the dropdown.

As you add fields, the visual type updates dynamically based on what Power BI believes is the best visual type for your data. If you want to  change the visual type manually, select the **Build a visual** button and select a visual in the **Visual types** tray, or turn off the automatic **Suggest a type** toggle.

From this flyout menu, you can continue to add data. Select the **Add data** button and select fields from the **Select data** pane.

Graphical user interface, Select data pane

If you prefer to see all the field wells as before, turn off the **Suggest a type** toggle to expand the full **Build a visual** menu.

> [!TIP]
> You can also turn this toggle off by default as well as pinning the full visualization gallery tray open. Select **File** > **Options and settings** > **Options** > **Report settings**, and clear the **Suggest a visual for me by default** check box.

## Format a visual on object

The default behavior when you hover over a visual is to see tooltips, and clicking around a visual, you get the cross-highlight and cross-filter effect. To avoid conflicting with this existing behavior, we introduced a new *format* mode. When you're in format mode, the hover and click behavior changes to show subselection regions.  

You enter format mode in one of two ways:

- Double-click a visual.
- Right-click a visual > select **Format**.

You know you’re in this new mode when the bounding box turns blue, the handle shapes turn to squares, and the hover and click behavior changes to show subselection regions.

format-mode

Now you can hover and click around in the visual to format specific subselections. Right-click the selected element to use the mini-toolbar and shortcut menu.

:::image type="content" source="media/power-bi-on-object-interaction/mini-toolbar-shortcut-menu.png" alt-text="mimi-toolbar formatting options.":::

### Edit labels and titles

You can edit labels and titles on visuals directly. Double-click the label you’d like to edit and begin typing. Click away from the label, or press Enter to save your changes.

:::image type="content" source="media/power-bi-on-object-interaction/on-object-edit-title.png" alt-text="on-object editing title.":::

> [!NOTE]
> If you set the title or label by conditional formatting, it's possible to override the text with this new feature. It's a known issue we're working to block, and warn users that dynamic text takes precedence.

### Selecting overlapping elements

When selecting an element that's very close or overlapping another, Power BI takes the best guess at your selection. If the selection is incorrect, right-click and use the dropdown menu to change your selection to the element you’d like to format.

:::image type="content" source="media/power-bi-on-object-interaction/select-overlapping-elements.png" alt-text="select overlapping elements.":::

## Changes to the Visualizations pane

### Pane switcher 

We have removed the Visualizations pane in favor of the on-object menus. In doing so, we introduced a *pane switcher* to align to the Microsoft Office pattern of *one pane at a time*, to give more real estate to the canvas.

pane-switcher

As you open panes, you see them added to the switcher on the right. If you accidentally close a pane, you can bring it back from the **View** tab in the ribbon.

If you prefer to have the panes side by side like before, you can right-click the pane you’d like and choose **Open in new pane**.

### Drillthrough and tooltip page setup

Drillthrough and tooltip page settings moved from the Visualizations pane into the **Format** page settings.

visualizations-format-pane

### Analytics pane merged with Format pane

Analytics features were on their own tab in the Visualizations pane. With the removal of the Visualizations pane, we've added the analytics features to the Format pane as *elements to add to your visual*.

analytics-format-pane

## Limitations and known issues

### Supported visuals for on-object formatting

- On-object formatting is currently supported for bar, column, line, area, combo, and scatter visuals. Small multiples aren't currently supported.
- Format mode isn't currently supported in mobile layout.
- Format mode isn't currently supported in focus mode.

### Sub-selections

- Small multiples and analytics pane items aren't currently selectable in format mode. 
- Sub-selection regions don't scale as expected in spotlight mode and after using zoom sliders.
- Reset to default might not reset direct text edit and background colors for data and category labels.

### On-object buttons

- On-object buttons might show above the formula bar if they're open at the same time.

### Warnings

- Warning messages aren't shown within the **Add to your visual** menu.
- If you set the title or label by conditional formatting, it's possible to override the text with the new direct text editing feature. It's a known issue we're working to block, and warn users that dynamic text takes precedence.
- While responsive is on, the mini-toolbar will increase to the responsive upper bound, then stop. It might appear as a bug that it’s broken. We plan to add an error state to communicate this.

### Custom visuals

- We plan to release an API for custom visual developers to be able to define sub-selection regions within their visuals.  
- To find custom visuals using the new visualization gallery in the ribbon, you must expand the full dropdown.

### Accessibility

- Full accessibility isn't currently supported.

## Next steps

[Page layout and formatting](/training/modules/visuals-in-power-bi/12-formatting)

[Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md)

More questions? [Try the Power BI community](https://community.powerbi.com/)
