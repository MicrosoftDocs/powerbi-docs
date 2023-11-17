---
title: The Drilldown API in Power BI visuals
description: This article explains how to create a Power BI custom visual that can drill down into the data so you can explore your data in depth in Power BI embedded analytics.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 11/16/2023
---

# Drilldown API

The **Drilldown API** allows you to create a visual that can trigger a drilldown operation on its own, without user interaction.  

The API enables the visual to show next level, expand to next level, or drill up based on the parameters passed to the API. For more information about drilling down, see [Drill down support](drill-down-support.md).

> [!NOTE]
> The **Drilldown API** is available from API version 4.7 To find out which version you’re using, check the `apiVersion` in the *pbiviz.json* file.

## How to use the drilldown API

Add the following to the *capabilities.json* file:

```json
    "drilldown": {
        "roles": ["Rows", "Columns"]
    }
```

## Example: Drilldown API

The following example shows how the visual call a drilldown operation.

```typescript
public update(options: VisualUpdateOptions) {
        if ((options.dataViews[0].metadata.dataRoles.drillableRoles['Columns']).indexOf(powerbi.DrillType.Down) >= 0) {
            let args: powerbi.DrillDownArgs = {
                roleName: "Columns",
                drillType: powerbi.DrillType.Down
            };
            this.host.drill(args);
        }
```

## Dynamic drill control

The dynamic drill control feature allows the visual to enable or disable the drill feature dynamically using an API call.
When the drill feature is enabled, all the functionalities of drilldown and expand/collapse features will be available.
This includes API calls, context menu commands, header drill buttons, and support for hierarchy data.
When the drill feature is disabled, these functionalities will not be available

