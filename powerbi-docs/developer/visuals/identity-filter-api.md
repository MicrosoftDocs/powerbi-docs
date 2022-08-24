---
title: The Identity filter API in Power BI custom visuals
description: This article discusses how to create Power BI visuals can filter categorical so you can explore different types of data in depth in Power BI embedded analytics.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 08/24/2022
---

# Identity filter API

The **Identity filter API** allows you to create a visual that can filter categorical data.  

This API is useful for the following scenarios:

* For custom visuals developed with groupon
For example, if you have a dataset of flags of all countries, you can select only the flags of specific countries.

> [!NOTE]
> The **Identity filter API** is available from API version 5.1 To find out which version you’re using, check the `apiVersion` in the *pbiviz.json* file.

Identity filter model is based on the [IIdentityFilter](/javascript/api/powerbi/powerbi-models/iidentityfilter) interface.

```typescript
    private filter: IIdentityFilter = {
        $schema: “”,
        filterType: FilterType.Identity,
        operator: "In",
        target: []
    }
```

## How to use the Identity filter API

To use the Identity filter API, your powerbi-model version needs to be 1.9.1 or higher.

* add the property above as a member of the visual.ts class.
* Handle PowerBi Updates (read the target array from the “jsonFilters” in the “VisualUpdateOptions” and translate it to the corresponding values): target array of [0,10] will correspond to the value of “Aliyah” and “Abigail” in the example above.
* Handle User Selection: clicking on the first “Abigail” should add the value 10 to the filter target array an send it using the following command:
this.visualHost.applyJsonFilter(this.filter, "general", "filter", powerbi.FilterAction.merge);


## Example: Identity filter API

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
