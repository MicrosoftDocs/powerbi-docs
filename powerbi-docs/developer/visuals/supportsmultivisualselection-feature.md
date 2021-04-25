---
title: The supportsMultiVisualSelection feature in Power BI
description: This article describes how to use the supportsMultiVisualSelection feature in Power BI visuals, and its requirements.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 04/30/2020
---

# Use the supportsMultiVisualSelection feature

The `supportsMultiVisualSelection` feature enables you to use selection in multiple visuals in a report.

## Example

In a report with more than one visual, select two values to have those values apply to other visuals. For instance, in [Retail Analysis sample](../../create-reports/sample-retail-analysis.md), select **Fashions Direct** in one visual. Select ctrl and select **Jan** in another visual. In the report, your selections apply to the other visuals that support this feature usage. Other visuals now scope to **Fashions Direct** and **Jan**.

## Requirements

This feature requires API v3.2.0 or higher.

You can't apply this feature to image visuals. You can't apply it to some advanced visuals such as key driver, decomposition tree, Q&A visuals, textbox, and gauge charts.

## Usage

To use the `supportsMultiVisualSelection` feature, add the following code to the `capabilities.json` file of your visual.

```json
    {   
            ...
        "supportsMultiVisualSelection": true
            ...
    }
```

## Next steps

To learn about Power BI concepts, see [Visuals in Power BI](power-bi-visuals-concept.md).

To try out Power BI development, see [Developing a Power BI circle card](develop-circle-card.md).
