---
title: The dynamic drill-down API in Power BI visuals
description: This article explains how to create a Power BI custom visual that allows the user to enable or disable drill-down support.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 06/06/2024
#customer intent: As a Power BI visual developer, I want to learn how to create a Power BI custom visual that allows the user to enable or disable drill-down support so that I can provide a more interactive experience.
---

# Dynamic drill control

>[!NOTE]
> This feature is available from API version 5.7.0.

The dynamic drill control feature allows the visual to enable or disable the [drill feature](./drill-down-support.md) dynamically using an [API call](#dynamic-drill-control-requirements). When the drill feature is enabled, all drilldown functionalities and [expand/collapse features](./dataview-mappings.md#expand-and-collapse-row-headers) are available, including API calls, context menu commands, header drill buttons, and support for hierarchy data. When disabled, these functionalities aren't available.

The following images show an example of a visual with the dynamic drill control feature enabled and disabled:

### [Drill enabled](#tab/drill-enabled)

:::image type="content" source="media/dynamic-drill-down/drill-enabled.png" alt-text="Screenshot of a visual with drilldown disabled displaying each continent with all the countries/regions in that continent displayed under it.":::

### [Drill disabled](#tab/drill-disabled)

:::image type="content" source="media/dynamic-drill-down/drill-disabled.png" alt-text="Screenshot of a visual with drilldown enabled showing the population of each continent with Ocenana expanded to show Australia and New Zealand.":::

---

The dynamic drill control feature includes the following API elements:

* The `isDrillDisabled` flag in the `DataRolesInfo`:

  ```typescript
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

```typescript
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

## Dynamic drill control requirements

[Drilling](./drill-down-support.md) is enabled by default, but the dynamic drill control feature allows the visual to enable or disable drilling using an API call.

A visual with the dynamic drill control feature, has the following code in the *capabilities.json* file:

* With drill disabled by default:

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

* With drill enabled by default:

  ```json
      "drilldown": {
          "roles": [
              "Rows",
              "Columns"
          ],
          "canDisableDrill": {}
      },
  ```

The `canDisableDrill` property indicates that the visual supports this feature. Without this property, the API call isn't respected.  
The `disabledByDefault` property indicates whether or not to disable the drill feature by default.

> [!NOTE]
> The `disabledByDefault` property takes effect when you do one of the following actions:
>
> * Add a new visual to the canvas
> * Convert a visual from one that doesn't support this feature.
>
> For example, if you convert a *sourceVisual* to *targetVisual*, the *targetVisual*'s `disabledByDefault` property is considered only if the *sourceVisual* doesn't support this feature. If *sourceVisual* does support this feature, the *targetVisual* keeps the *sourceVisual*'s state and not the default.

## Adding drill-down support to a new version of an existing visual

Using the drilldown feature represents a breaking change. Therefore, for the smoothest transition, we recommend that you use **a new visual GUID** for the new version.

If, however, you want to keep the same GUID, keep in mind the following points:

* When you migrate from a nondrillable version to a new drillable version, some data might not be provided in the `dataView` due to the hierarchical data support introduced as part of the drill feature. The dynamic drill control feature doesn't offer automatic support for this issue but can be used to manage the migration process.

* For self-migration of the visual, the visual should take the following actions:

  * Identify the first time the new version is loaded instead of the older version, and apply the `persistProperties` API.

  * Disable the drill to receive all the data, using the `setCanDrill` API.

The following example shows how to self-migrate an older visual to one that uses dynamic drill control:

1. Add the following object to the capabilities.json file:

    ```json
    "DrillMigration": {
      "displayName": "Drill Migration",
      "properties": {
          "isMigrated": {
              "displayName": "Is Drill Migrated",
              "type": {
                  "bool": true
              }
          }
      }
    },
    ```

1. Add the following to the *visual.ts* file:

   ```typescript
   export class Visual implements IVisual {
       //...
         private isCalledToDisableDrillInMigrationScenario = false;
         private drillMigration = { disabledByDefault: true };
         constructor(options: VisualConstructorOptions) {
          //...
          this.host = options.host;
          //...
         }
         private update(options: VisualUpdateOptions) {
            this.handleSelfDrillMigration(options);
             //...
         }
         private handleSelfDrillMigration(options: VisualUpdateOptions): void {
             if (options && options.dataViews && options.dataViews[0] && options.dataViews[0].metadata) {
                 const metadata = options.dataViews[0].metadata;
                 if (metadata && metadata.dataRoles) {
                     const isDrillDisabled = metadata.dataRoles.isDrillDisabled;
                     if (isDrillDisabled === undefined) {
                         return;
                     }
                     // Continue in case the visual is already migrated
                     if (!metadata.objects?.DrillMigration?.isMigrated) {
                         // Persist the isMigrated property when the drill has the correct state
                         if (this.drillMigration.disabledByDefault === isDrillDisabled) {
                             this.persistMigrationProperty();
                         } else if (!this.isCalledToDisableDrillInMigrationScenario) {
                             // Use the API call only once
                             this.host.setCanDrill(!this.drillMigration.disabledByDefault);
                             this.isCalledToDisableDrillInMigrationScenario = true;
                         }
                     }
                 }
             }
         }
         private persistMigrationProperty(): void {
             let property = {
                 merge: [{
                     objectName: "DrillMigration",
                     properties: {
                         isMigrated: true
                     },
                     selector: null
                 }]
             };
             this.host.persistProperties(property);
         }
     }
   ```

The first time the visual is opened after adding this code, the DrillMigration variable is set to true and the visual opens in the default state.

## Considerations and limitations

* The drill state isn't saved after disabling the drill. If you reenable the drill after disabling it, only the first level is displayed regardless of what was displayed before it was disabled.

* The expand/collapse state isn't saved after disabling the drill. All the rows are collapsed once the drill is reenabled.

* The API call isn't supported for dashboards.

* Data view mapping conditions: Use `"max": 1` for all conditions for the drillable role to limit the visual to showing only one field when drill is disabled. For example:
  * For categorical data view:

     ```json
     "conditions": [
         { "category": { "min": 1 }, "measure": { "max": 1 }}
     ]
     ```

  * For matrix data view:

     ```json
     "conditions": [
        { "Rows": { "max": 0 }, "Columns": { "max": 0 }, "Value": { "min": 1 } },
        { "Rows": { "min": 1 }, "Columns": { "min": 0 }, "Value": { "min": 0 } },
        { "Rows": { "min": 0 }, "Columns": { "min": 1 }, "Value": { "min": 0 } },
     ]
     ```