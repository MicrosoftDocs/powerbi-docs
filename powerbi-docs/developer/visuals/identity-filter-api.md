---
title: The Identity filter API in Power BI custom visuals
description: This article discusses how to create Power BI visuals can filter categorical so you can explore different types of data in depth in Power BI embedded analytics.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 06/17/2024
#customer intent: As a Power BI visual developer, I want to learn how to create a visual that can filter categorical data using a semantic query so that I can explore different types of data in depth in Power BI embedded analytics.
---

# Identity filter API

The **Identity filter API** allows you to create a visual that can filter categorical data using a semantic query.  
It filters the data by **data points** rather than mathematical expressions.

The API keeps track of user selections and which data points to display. The data points are saved in an array and referenced by their position in the array.

This API is useful in the following scenarios:

* For custom visuals that use semantic models with group on keys
* Migrating visuals that used an older API (earlier than 2.2) to a newer API
* Allow selections using identifying index arrays

> [!NOTE]
> The **Identity filter API** is available from API version 5.1 To find out which version you’re using, check the `apiVersion` in the *pbiviz.json* file.

The Identity filter model is based on the [IIdentityFilter](/javascript/api/powerbi/powerbi-models/iidentityfilter) interface.

```typescript
    private filter: IIdentityFilter = {
        $schema: “”,
        filterType: FilterType.Identity,
        operator: "In",
        target: []
    }
```

For example, if the visual received the following data view update:

:::image type="content" source="./media/identity-filter-api/target-array.png" alt-text="Screenshot of sample array.":::

The array is of type number[] and it contains the identity fields of the items that the user selected.

The identityIndex corresponds to the index of the value in the semantic model's value array (see the following example).

:::image type="content" source="./media/identity-filter-api/array-values.png" alt-text="Screenshot showing array values of names.":::

In the above example:
{identityIndex: 0} = "Aaliyah"
{identityIndex: 1} = "Aaliyah"
{identityIndex: 02 = "Aaliyah"
etc.

## How to use the Identity filter API

To use the Identity filter API, your powerbi-models version needs to be 1.9.1 or higher.

* Add the following property as a member of the visual.ts class:

  ```typescript
      private filter: IIdentityFilter = {
          $schema: “”,
          filterType: FilterType.Identity,
          operator: "In",
          target: []
      }
  ```

* To handle Power BI updates, read the *target* array from the 'jsonFilters' in the 'VisualUpdateOptions' and translate it to the corresponding values. These values are the ones that were selected. In the previous example, a target array of [0,10] corresponds to the values of *Aliyah* and *Abigail*.

* To handle user selections in the previous example, click on the first *Abigail* to add the value 8 to the filter target array and send it using the following command:

```typescript
this.visualHost.applyJsonFilter(this.filter, "general", "filter", powerbi.FilterAction.merge);
```

<!--
## Sample JSON filter

Some sample JSON filter code is shown in the following

## Example: Identity filter API

The following example shows how the visual calls a filter operation.
-->

## Migrating visuals with old API

Starting from API 5.1.0, to support the identity filter on visuals that were created using a version earlier than 2.2, add the following lines to your *capabilities.json* file:

```json
    "migration": {
        "filter": {
            "shouldUseIdentityFilter": true
        }
    }
```

These lines convert the selections to identity filters.

> [!NOTE]
> This step is only necessary for existing visuals created with older APIs. Newer visuals don't need to add this.

## Related content

[Use Power BI visuals selections to add interactivity to a visual](selection-api.md)

More questions? Try the [Power BI Community](https://community.powerbi.com/).
