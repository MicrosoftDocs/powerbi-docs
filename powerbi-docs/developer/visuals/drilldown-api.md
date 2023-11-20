---
title: The Drilldown API in Power BI visuals
description: This article explains how to create a Power BI custom visual that can drill down into the data so you can explore your data in depth in Power BI embedded analytics.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 07/19/2022
---

# Drilldown API

The **Drilldown API** allows you to create a visual that can trigger a drilldown operation on its own, without user interaction.  

The API enables the visual to show next level, expand to next level, or drill up based on the parameters passed to the API. For more information about drilling down, see [Drill down support](drill-down-support.md).

> [!NOTE]
> The **Drilldown API** is available from API version 4.7.0 To find out which version you’re using, check the `apiVersion` in the *pbiviz.json* file.

## How to use the drilldown API

Add the following to the *capabilities.json* file:

```json
    "drilldown": {
        "roles": ["Rows", "Columns"]
    }
```

### Example: Drilldown API

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

> [!NOTE]
> The **Dynamic drill control API** is available from API version 5.7.0

The dynamic drill control feature allows the visual to [enable or disable the drill feature](./drill-down-support.md#dynamic-drill-down-control) dynamically using an API call.

### How to use the dynamic drill control API

To support the dynamic drill control feature, add the following code to the capabilities.json file:

* To disable drill by default:

  ```json
      "drilldown": {
          "roles": [
              "Rows",
              "Columns"
          ],
          "canDisableDrill": { 
              "disabledByDefault": true
          }
      },
  ```

* To enable drill by default:

  ```json
      "drilldown": {
          "roles": [
              "Rows",
              "Columns"
          ],
          "canDisableDrill": {}
      },
  ```

The `canDisableDrill` property indicates that the visual supports this feature. Without this property the API call isn't respected.  
The `disabledByDefault` property indicates whether or not to disable the drill feature by default.

> [!NOTE]
> The `disabledByDefault` property takes effect when you do one of the following actions:
>
> * Add a new visual to the canvas
> * Convert a visual from one that doesn't support this feature.
>
> For example, if you convert a *sourceVisual* to *targetVisual*, the *targetVisual*'s `disabledByDefault` property is considered only if the *sourceVisual* doesn't support this feature. If *sourceVisual* does support this feature, the *targetVisual* keeps the *sourceVisual*'s state and not the default.



