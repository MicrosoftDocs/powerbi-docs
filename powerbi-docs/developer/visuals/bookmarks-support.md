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

With Power BI report bookmarks, you can capture and save a configured view of a report page. The bookmark saves the entire configuration, including selections and filters.

For more information about bookmarks, see [Use bookmarks to share insights and build stories in Power BI](../../create-reports/desktop-bookmarks.md).

## Bookmarks support in your visual

To create a Power BI visual that supports bookmarks you have to configure it to react correctly when changes are made to it.
If your visual interacts with other visuals, selects data points, or filters other visuals, you need to save the bookmarked state in *properties*.

> [!NOTE]
>
> To create a visual that supports bookmarks you need:
>
> * [Powerbi-visuals-utils-interactivityutils](https://github.com/Microsoft/PowerBI-visuals-utils-interactivityutils/) version 3.0.0 or later for filter visuals and any visual that uses `InteractivityService`.
>
> * Visual API version 1.11.0 or later for non-filter visuals that use `SelectionManager` rather than `InteractivityService`.

## How Power BI visuals interact with Power BI in report bookmarks

Let's consider the following scenario: you want to create several bookmarks on the report page, with a different selection state in each bookmark.

First, you select a data point in your visual. The visual interacts with Power BI and other visuals by passing your selections to the host. You then select **Add** in the **Bookmark** pane, and Power BI saves the current selections for the new bookmark.

You do this several times to create new bookmarks. After you create the bookmarks, you can switch between them.

When you select a bookmark, Power BI restores the saved filter or selection state and passes it to the visuals. Other visuals in the report are highlighted or filtered according to the state that's stored in the bookmark. The Power BI host is responsible for these actions. Your visual is responsible for correctly reflecting the correct selection state (for example, for changing the colors of rendered data points).

The new selection state is communicated to the visual through the `update` method. The `options` argument contains a property, `options.jsonFilters`, which can be either `Advanced Filter` or `Tuple Filter`.

If the visual uses filters, restore the filter values to the corresponding values of the selected bookmark. Or, if the visual only uses selections, you can use the callback function, `registerOnSelectCallback`, in `ISelectionManager`.

## Add bookmark support to visuals that have a selection

If your visual interacts with other visuals by using [Selection](https://github.com/PowerBi-Projects/PowerBI-visuals/blob/master/Tutorial/Selection.md), you can add bookmarks in one of two ways:

* If the visual uses [InteractivityService](https://github.com/microsoft/powerbi-visuals-utils-interactivityutils/blob/master/src/interactivityService.ts) to manage selections, use the `applySelectionFromFilter` method in the `InteractivityService`.

* If the visual doesn't use [InteractivityService](https://github.com/microsoft/powerbi-visuals-utils-interactivityutils/blob/master/src/interactivityService.ts), use the `ISelectionManager.registerOnSelectCallback` method.

### Use **InteractivityService** to restore bookmark selections

If your visual uses `InteractivityService`, you don't need any additional actions to support the bookmarks in your visual.

When you select a bookmark, the utility automatically handles the visual's selection state.

### Use **SelectionManager** to restore bookmark selections

If you are not using `InteractivityService` you can still save and recall bookmark selections as follows:

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

## Add bookmark support to visuals that have a filter

To support bookmarks in visuals that have a filter, you need to use `InteractivityService`.

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
> In the above report bookmarks scenario, the visual shouldn't call `applyJsonFilter` to filter the other visuals. They will already be filtered by Power BI.

The [Timeline Slicer](../../visuals/desktop-slicer-filter-date-range.md) visual changes the range selector to the corresponding data ranges.

## Save the filter state of the visual in bookmarks

In addition to saving the conditions of the filter for the bookmark, you can also save other aspects of the filter.

For example, the [timeline Slicer](https://github.com/microsoft/powerbi-visuals-timeline/commit/8b7d82dd23cd2bd71817f1bc5d1e1732347a185e) stores the `Granularity` property values as a filter state. It allows the granularity (days, months, years, etc.) to change as you change bookmarks.

The `filterState` property saves an aspect of the filter as a property. The visual can store a variety of `filterState` values in bookmarks.

To save a property value as a filter state, set the object property as `"filterState": true` in the *capabilities.json* file.

## Next steps

> [!div class="nextstepaction"]
> [Bookmark buttons](../../consumer/end-user-buttons#bookmark-buttons.md)
