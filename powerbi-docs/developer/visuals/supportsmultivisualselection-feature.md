---
title: Apply selection to multiple visuals feature in Power BI
description: This article describes how to apply a selection to multiple visuals by using the supportsMultiVisualSelection feature in Power BI.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 07/29/2021
---

# Apply a selection to multiple visuals in a report

The `supportsMultiVisualSelection` feature enables you to select values from one visual in a report and have that selection apply to all the visuals in that report.

For example, in the **Overview** page of the [Retail Analysis sample](../../create-reports/sample-retail-analysis.md), select *Fashions Direct* from **Chain** in one visual. Select *Jan* from **FiscalMonth** in another visual.

:::image type="content" source="media/supportsMultiVisualSelection-feature/selections.png" alt-text="Screenshot of different visual selections.":::

| Select *chain* from one visual  | Select *month* from another visual  |
|---|---|

In the report, these selections apply to *all* visuals that support this feature. The visuals will now scope to **Fashions Direct** and **January**.

## Enable the *support multiple visual selection* feature

To use the `supportsMultiVisualSelection` feature, add the following code to the *capabilities.json* file of your visual.

```json
    {   
            ...
        "supportsMultiVisualSelection": true
            ...
    }
```

## Known limitations and issues

* This feature requires API v3.2.0 or higher.
* This feature doesn't apply to image visuals.
* This feature doesn't apply to certain advanced visuals such as key driver, decomposition tree, Q&A visuals, textbox, and gauge charts.

## Next steps

>[!div class="nextstepaction"]
>[Visuals in Power BI](power-bi-visuals-concept.md).

>[!div class="nextstepaction"]
>[Developing a Power BI circle card](develop-circle-card.md).
