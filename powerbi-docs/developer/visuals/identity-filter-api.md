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
It filters the data by **data points** rather than mathematical expressions.

The data points are saved in an array and referenced by their position in the array.

This API is useful in the following scenarios:

* For custom visuals developed with group on keys
* Migrating visuals that used an old API to a newer API
* Allows selection to be done using opaque identities (numbers)

> [!NOTE]
> The **Identity filter API** is available from API version 5.1 To find out which version you’re using, check the `apiVersion` in the *pbiviz.json* file.

The API keeps track of user selections and 

The Identity filter model is based on the [IIdentityFilter](/javascript/api/powerbi/powerbi-models/iidentityfilter) interface.

```typescript
    private filter: IIdentityFilter = {
        $schema: “”,
        filterType: FilterType.Identity,
        operator: "In",
        target: []
    }
```

For example, let's say you have the following array:

:::image type="content" source="./media/identity-filter-api/target-array.png" alt-text="Screenshot of sample array.":::

Note that the array is of type number[] and it contains the opaque-id (the identityIndex fields below) that the user selected.

The identityIndex corresponds to the index of the value in the value array in the dataset (see below)

:::image type="content" source="./media/identity-filter-api/array-values.png" alt-text="Screenshot showing array values of names.":::

## How to use the Identity filter API

To use the Identity filter API, your powerbi-model version needs to be 1.9.1 or higher.

* Add the following property as a member of the visual.ts class.

  ```typescript
      private filter: IIdentityFilter = {
          $schema: “”,
          filterType: FilterType.Identity,
          operator: "In",
          target: []
      }
  ```

* To handle Power Bi updates, read the target array from the “jsonFilters” in the “VisualUpdateOptions” and translate it to the corresponding values. In the example above, a target array of [0,10] will correspond to the values of *Aliyah* and *Abigail*.

* To handle user selections, in the example above, clicking on the first *Abigail* should add the value 8 to the filter target array an send it using the following command:

```typescript
this.visualHost.applyJsonFilter(this.filter, "general", "filter", powerbi.FilterAction.merge);
```

## Sample JSON filter

Some sample JSON filter code is shown in the following

## Example: Identity filter API

The following example shows how the visual calls a filter operation.
