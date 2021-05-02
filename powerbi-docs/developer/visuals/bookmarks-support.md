---
title: Add bookmark support for Power BI visuals
description: Power BI visuals can handle bookmarks switching
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 06/18/2019
---

# Add bookmark support for Power BI visuals

With Power BI report bookmarks, you can capture a configured view of a report page, the selection state, and the filtering state of the visual. But it requires additional action from the Power BI visuals side to support the bookmark and react correctly to changes.

For more information about bookmarks, see [Use bookmarks to share insights and build stories in Power BI](../../create-reports/desktop-bookmarks.md).

## Report bookmarks support in your visual

If your visual interacts with other visuals, selects data points, or filters other visuals, you need to restore the state from properties.

## Add report bookmarks support

1. Install (or update) the required utility, [powerbi-visuals-utils-interactivityutils](https://github.com/Microsoft/PowerBI-visuals-utils-interactivityutils/) version 3.0.0 or later. It contains additional classes to manipulate with the state selection or filter. It's required for filter visuals and any visual that uses `InteractivityService`.

2. Update the visual API to version 1.11.0 to use `registerOnSelectCallback` in an instance of `SelectionManager`. It's required for non-filter visuals that use the plain `SelectionManager` rather than `InteractivityService`.

### How Power BI visuals interact with Power BI in report bookmarks

Let's consider the following scenario: you want to create several bookmarks on the report page, with a different selection state in each bookmark.

First, you select a data point in your visual. The visual interacts with Power BI and other visuals by passing selections to the host. You then select **Add** in the **Bookmark** pane, and Power BI saves the current selections for the new bookmark.

It happens repeatedly as you change the selection and add new bookmarks. After you create the bookmarks, you can switch between them.

When you select a bookmark, Power BI restores the saved filter or selection state and passes it to the visuals. Other visuals are highlighted or filtered according to the state that's stored in the bookmark. The Power BI host is responsible for the actions. Your visual is responsible for correctly reflecting the new selection state (for example, for changing the colors of rendered data points).

The new selection state is communicated to the visual through the `update` method. The `options` argument contains a special property, `options.jsonFilters`. Its JSONFilter property can contain `Advanced Filter` and `Tuple Filter`.

The visual should restore the filter values to display the corresponding state of the visual for the selected bookmark. Or, if the visual uses selections only, you can use the special callback function call that's registered as the `registerOnSelectCallback` method of ISelectionManager.

### Visuals with Selection

If your visual interacts with other visuals by using [Selection](https://github.com/PowerBi-Projects/PowerBI-visuals/blob/master/Tutorial/Selection.md), you can add bookmarks in either of two ways:

* If the visual hasn't already used [InteractivityService](https://github.com/microsoft/powerbi-visuals-utils-interactivityutils/blob/master/src/interactivityService.ts), you can use the `FilterManager.restoreSelectionIds` method.

* If the visual already uses [InteractivityService](https://github.com/microsoft/powerbi-visuals-utils-interactivityutils/blob/master/src/interactivityService.ts) to manage selections, you should use the `applySelectionFromFilter` method in the instance of `InteractivityService`.

#### Use ISelectionManager.registerOnSelectCallback

When you select a bookmark, Power BI calls the `callback` method of the visual with the corresponding selections. 

```typescript
this.selectionManager.registerOnSelectCallback(
    (ids: ISelectionId[]) => {
        //called when a selection was set by Power BI
    });
);
```

Let's assume that you have a data point in your visual that was created in the [visualTransform](https://github.com/Microsoft/PowerBI-visuals-sampleBarChart/blob/master/src/barChart.ts#L74) method.

And `datapoints` looks like:

```typescript
visualDataPoints.push({
    category: categorical.categories[0].values[i],
    color: getCategoricalObjectValue<Fill>(categorical.categories[0], i, 'colorSelector', 'fill', defaultColor).solid.color,
    selectionId: host.createSelectionIdBuilder()
        .withCategory(categorical.categories[0], i)
        .createSelectionId(),
    selected: false
});
```

You now have `visualDataPoints` as your data points and the `ids` array passed to the `callback` function.

At this point, the visual should compare the `ISelectionId[]` array with the selections in your `visualDataPoints` array and mark the corresponding data points as selected.

```typescript
this.selectionManager.registerOnSelectCallback(
    (ids: ISelectionId[]) => {
        visualDataPoints.forEach(dataPoint => {
            ids.forEach(bookmarkSelection => {
                if (bookmarkSelection.equals(dataPoint.selectionId)) {
                    dataPoint.selected = true;
                }
            });
        });
    });
);
```

After you update the data points, they'll reflect the current selection state that's stored in the `filter` object. Then, when the data points are rendered, the custom visual's selection state will match the state of the bookmark.

### Use InteractivityService for control selections in the visual

If your visual uses `InteractivityService`, you don't need any additional actions to support the bookmarks in your visual.

When you select bookmarks, the utility handles the visual's selection state.

### Visuals with a filter

Let's assume that the visual creates a filter of data by date range. You have `startDate` and `endDate` as the start and end dates of the range.

The visual creates an advanced filter and calls the host method `applyJsonFilter` to filter data by the relevant conditions.

The target is the table that's used for filtering.

```typescript
import { AdvancedFilter } from "powerbi-models";

const filter: IAdvancedFilter = new AdvancedFilter(
    target,
    "And",
    {
        operator: "GreaterThanOrEqual",
        value: startDate
            ? startDate.toJSON()
            : null
    },
    {
        operator: "LessThanOrEqual",
        value: endDate
            ? endDate.toJSON()
            : null
    });

this.host.applyJsonFilter(
    filter,
    "general",
    "filter",
    (startDate && endDate)
        ? FilterAction.merge
        : FilterAction.remove
);
```

Each time you select a bookmark, the custom visual gets an `update` call.

The custom visual should check the filter in the object:

```typescript
const filter: IAdvancedFilter = FilterManager.restoreFilter(
    && options.jsonFilters
    && options.jsonFilters[0] as any
) as IAdvancedFilter;
```

If the `filter` object isn't null, the visual should restore the filter conditions from the object:

```typescript
const jsonFilters: AdvancedFilter = this.options.jsonFilters as AdvancedFilter[];

if (jsonFilters
    && jsonFilters[0]
    && jsonFilters[0].conditions
    && jsonFilters[0].conditions[0]
    && jsonFilters[0].conditions[1]
) {
    const startDate: Date = new Date(`${jsonFilters[0].conditions[0].value}`);
    const endDate: Date = new Date(`${jsonFilters[0].conditions[1].value}`);

    // apply restored conditions
} else {
    // apply default settings
}
```

After that, the visual should change its internal state to reflect the current conditions. The internal state includes the data points and visualization objects (lines, rectangles, and so on).

> [!IMPORTANT]
> In the report bookmarks scenario, the visual shouldn't call `applyJsonFilter` to filter the other visuals. They will already be filtered by Power BI.

The Timeline Slicer visual changes the range selector to the corresponding data ranges.

For more information, see the [Timeline Slicer repository](https://github.com/Microsoft/powerbi-visuals-timeline/commit/606f1152f59f82b5b5a367ff3b117372d129e597?diff=unified#diff-b6ef9a9ac3a3225f8bd0de84bee0a0df).

### Filter the state to save visual properties in bookmarks

The `filterState` property makes a property of a part of filtering. The visual can store a variety of values in bookmarks.

To save the property value as a filter state, mark the object property as `"filterState": true` in the *capabilities.json* file.

For example, the Timeline Slicer stores the `Granularity` property values in a filter. It allows the current granularity to change as you change the bookmarks.

For more information, see the [Timeline Slicer repository](https://github.com/microsoft/powerbi-visuals-timeline/commit/8b7d82dd23cd2bd71817f1bc5d1e1732347a185e#diff-290828b604cfa62f1cb310f2e90c52fdR334).
