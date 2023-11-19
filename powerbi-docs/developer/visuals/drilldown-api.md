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

The dynamic drill control feature includes the following API elements:

* The `isDrillDisabled` flag in the `DataRolesInfo`:

  ```json
   export interface DataRolesInfo {
        //…
        isDrillDisabled?: boolean; // ----- NEW -----
    }
  ```  

* The `setCanDrill` method in the `IVisualHost` interface:

  ```typescript
    export interface IVisualHost extends extensibility.IVisualHost {
        //…
        setCanDrill: (drillAllowed: boolean) => void; // ----- NEW -----
    }
  ```

To identify whether the drill is disabled, use the `isDrillDisabled` property in the update method:

```json
    private update(options: VisualUpdateOptions) {
   //…
   const isDrillDisabled = options.dataViews[0].metadata.dataRoles.isDrillDisabled;
   //…
    }
```

Then use the API call to enable or disable the drill as needed:

* To enable:
  `this.host.setCanDrill(true /* drillAllowed */);`
 
* To disable:
  `this.host.setCanDrill(false /* drillAllowed */);`

## Considerations and limitations

* The drill state isn't saved after disabling the drill. If you reenable the drill after disabling it, only the first level is displayed regardless of what was displayed before it was disabled.

* The expand/collapse state isn't saved after disabling the drill. All the rows will be collapsed once the drill is reenabled.

* Data view mapping conditions: To limit the visual to show only only one field when the drill is disabled,  using `"max": 1` for all conditions for the drillable role. Therefore, we recommend not using this condition unless you intend to restrict the visual in this way.

