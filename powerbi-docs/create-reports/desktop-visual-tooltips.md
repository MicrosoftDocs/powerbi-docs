---
title: Create Visual Tooltips
description: Learn how modern visual tooltips in Power BI Desktop and Power BI service let you create rich hover-based tooltips with drill actions and theme-based styling for visuals in your reports.
author: julcsc
ms.author: juliacawthra
ms.reviewer: sunaraya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 01/13/2026
ai-usage: ai-assisted
LocalizationGroup: Create reports
---

# Create visual tooltips

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

## Overview

Visual tooltips in Power BI improve usability, accessibility, and interactivity by helping users understand a data point without clicking or navigating away from the visual.  

When a user hovers over a visual element, such as a bar, column, segment, or other data point in the visual, the tooltip displays helpful details such as field values, contextual information, and available actions to explore the data further.

This article explains how visual tooltips behave, how to customize their content, and how to design them, so they align with your report’s visual style and user experience. Use this information to create reports that are clear, consistent, and easy for users to explore.

## Using tooltips in Power BI

### How Power BI displays tooltips

When a user hovers over a visual data point, the tooltip displays:

- The **field name and value** for each field used in the visual.
- **Additional fields** specifically placed in the **Tooltip** well.
- Optional **actions**, such as:

  - **Drill down** into the next level of a hierarchy
  - **Drill through** to a related report page
    These actions appear automatically when a visual supports them.  

Tooltips provide fast insight while keeping the user inside the flow of the report.

[image: Tooltip displayed  “Tooltip displaying Field Name/ Value, Additional fields, and Drill down/through.”]

### Adjust tooltip behavior

Most Power BI visuals support tooltips by default, but the available options vary slightly depending on the visual type. You can adjust how a tooltip behaves from the Format pane when a supported visual is selected.

#### Find tooltip settings

    1. Select a visual on the report canvas.
    1. From the Visualizations pane, select the Format visual icon.
    1. Under the General tab, expand the Tooltip card to access the settings for that visual.

    These settings let you control whether tooltips appear, which type of tooltip to use, and how they’re styled.

[image: Tooltip settings (format pane) “Tooltip settings for selected visual in Visualizations pane > Format visual > General tab.”]

#### Tooltip settings and options

After selecting a supported visual and expanding the Tooltip control in the Format pane, you can configure:

- **Tooltip visibility:** Toggle tooltips On or Off for that visual.
- **Tooltip type:** Choose between a Default tooltip or a Report page tooltip.
- **Styling options:** Tooltips inherit their colors from the report theme. Format options let you refine Font, Label and Value color, Drill text and icon color, and Background color and transparency.
- **Actions footer:** Some visuals support drill actions (Drill down, Drill through) directly in the tooltip footer. These actions appear only on visuals that support drill behavior.

These settings apply per visual, giving report creators full control over how tooltips appear and behave across a report.

## Considerations and limitations

The tooltip actions footer isn't available in the following scenarios:

- [Report page tooltips](desktop-tooltips.md)
- [Custom visuals](../developer/visuals/develop-power-bi-visuals.md) (AppSource visuals)
- [Decomposition trees](../visuals/power-bi-visualization-decomposition-tree.md)

## Related content

- [Create tooltips based on report pages](desktop-tooltips.md)
- [Set up drillthrough in Power BI reports](desktop-drillthrough.md)
