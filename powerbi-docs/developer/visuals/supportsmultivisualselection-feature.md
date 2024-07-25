---
title: Apply selection to multiple visuals feature in Power BI
description: This article describes how to apply a selection to multiple visuals by using the support multiple visual selection feature in Power BI.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 12/19/2023
#customer intent: As a Power BI visual developer, I want to learn how to enable the support multiple visual selection feature in my visual so that users can apply a selection to multiple visuals in a report.
---

# Apply a selection to multiple visuals in a report

The `supportsMultiVisualSelection` feature enables you to select values from one visual in a Power BI report and apply the selected values to all the visuals in that report.

For example, in the **Overview** page of the [Retail Analysis sample](../../create-reports/sample-retail-analysis.md):

1. Select the **Total Sales Variance %, Sales Per Sq Ft and This Year Sales by District and District** visual. In the **Filters** pane that appears, under **Chain**, select **Fashions Direct**.

:::image type="content" source="media/supportsMultiVisualSelection-feature/selections.png" alt-text="Screenshot of the Power BI service. A bubble chart visual is selected. In the Filters pane, Fashions Direct is selected.":::

2. Select the **Total Sales Variance by FiscalMonth and District Manager** visual. In the **Filters** pane that appears, under **FiscalMonth**, select **Jan**.

:::image type="content" source="media/supportsMultiVisualSelection-feature/selections-2.png" alt-text="Screenshot of the Power BI service. A bar chart visual is selected. In the Fiscal Month pane, Jan is selected.":::

In the report, these selections apply to all visuals that support this feature. The scope of the visuals is now limited to **Fashions Direct** and **January**.

## Enable the support multiple visual selection feature

To use the support multiple visual selection feature, add the following code to the *capabilities.json* file of your visual:

```json
    {   
            ...
        "supportsMultiVisualSelection": true
            ...
    }
```

## Considerations and limitations

* This feature requires API v3.2.0 or later.
* This feature doesn't apply to image visuals.
* This feature doesn't apply to certain advanced visuals, such as key driver, decomposition tree, Q&A, textbox, and gauge chart visuals.

## Related content

* [Visuals in Power BI](power-bi-visuals-concept.md).
* [Developing a Power BI circle card](develop-circle-card.md).
