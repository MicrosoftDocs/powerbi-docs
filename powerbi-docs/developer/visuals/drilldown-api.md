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

### Migrate an existing visual to use the dynamic drill control API

Using the drilldown feature represents a breaking change. Therefore, for the smoothest transition, we recommend that you use **a new visual GUID** for the new version.

If, however, you want to keep the same GUID, keep in mind the following points:

* When you migrate from a nondrillable version to a new drillable version, some data might not be provided in the `dataView` due to the hierarchical data support introduced as part of the drill feature. The dynamic drill control feature doesn't offer automatic support for this issue but can be used to manage the migration process.

* For self-migration of the visual, the visual should take the following actions:

  * Identify the first time the new version is loaded instead of the older version, and apply the `persistProperties` API.

  * Disable the drill to receive all the data, using the `setCanDrill` API.

The following example shows how to self-migrate an older visual to one that has synamic drill control:

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

    }
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
                    if (!this.formattingSettings.DrillMigration.isMigrated) {
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
