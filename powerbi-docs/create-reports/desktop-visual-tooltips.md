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

## Considerations and limitations

The tooltip actions footer isn't available in the following scenarios:

- [Report page tooltips](desktop-tooltips.md)
- [Custom visuals](../developer/visuals/develop-power-bi-visuals.md) (AppSource visuals)
- [Decomposition trees](../visuals/power-bi-visualization-decomposition-tree.md)

## Related content

- [Create tooltips based on report pages](desktop-tooltips.md)
- [Set up drillthrough in Power BI reports](desktop-drillthrough.md)
