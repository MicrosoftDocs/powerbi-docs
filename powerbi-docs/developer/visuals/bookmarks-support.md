---
title: Add bookmark support for Power BI custom visuals
description: Learn how to add bookmark support to your custom visuals in Power BI so that you can switch between different bookmarked states.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: tebercov 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 01/03/2024
#customer intent: As a custom visuals developer, I want to learn how to add bookmark support to my visuals in Power BI so that I can switch between different bookmarked states.
---

# Add bookmark support to visuals in Power BI reports

With Power BI report bookmarks, you can capture and save a configured view of a report page. Then you can go back to the saved view quickly and easily whenever you want. The bookmark saves the entire configuration, including selections and filters.

For more information about bookmarks, see [Use bookmarks to share insights and build stories in Power BI](../../create-reports/desktop-bookmarks.md).

## Visuals that support bookmarks

A Power BI visual that supports bookmarks has to be able to save and provide the correct information when needed.
If your visual interacts with other visuals, selects data points, or filters other visuals, you need to save the bookmarked state in the visual's *filterState* properties.

> [!NOTE]
>> Creating a visual that supports bookmarks requires:
>
> - Visual API version 1.11.0 or later for non-filter visuals that use `SelectionManager`.
> - Visual API version 2.6.0 or later for filter visuals.
> - To find out which version you’re using, check the `apiVersion` in the *pbiviz.json* file.

## How Power BI visuals interact with Power BI in report bookmarks

Let's say you want to create several bookmarks on a report page with each bookmark having different data points selected.

First, select one or more data points in your visual. The visual passes your selections to the host. Then select **Add** in the [**Bookmark pane**](../../consumer/end-user-bookmarks.md). Power BI saves the current selections for the new bookmark.

Do this several times to create new bookmarks. After you create the bookmarks, you can switch between them.

Each time you select a bookmark, Power BI restores the saved filter or selection state and passes it to the visuals. The visuals in the report are highlighted or filtered according to the state stored in the bookmark. To restore the correct state, your visual must pass the correct selection state to the host (for example, the colors of rendered data points).

The new selection state (or filter) is communicated through the `options.jsonFilters` property in the `update` method. The `jsonFilters` can be either [`Advanced Filter`](filter-api.md#the-advanced-filter-api) or [`Tuple Filter`](filter-api.md#the-tuple-filter-api-multi-column-filter).

- If your visual contains selected data points, [reset the selection](#visuals-with-selection) to that of the selected bookmark by using the callback function, `registerOnSelectCallback`, in `ISelectionManager`.
- If your visual uses filters to select data, [reset the filter](#visuals-with-a-filter) values to the corresponding values of the selected bookmark.

## Visuals with selection

> [!NOTE]
> InteractivityService has been deprecated.

If your visual interacts with other visuals using [Selection](https://github.com/PowerBi-Projects/PowerBI-visuals/blob/master/Tutorial/Selection.md), you can add bookmark support in one of two ways:

- Through [InteractivityService](#use-interactivityservice-to-restore-bookmark-selections---deprecated) to manage selections, use the `applySelectionFromFilter`. This is deprecated method.
- Through [SelectionManager](#use-selectionmanager-to-restore-bookmark-selections).

### Use **InteractivityService** to restore bookmark selections - deprecated

If your visual uses [InteractivityService](https://github.com/microsoft/powerbi-visuals-utils-interactivityutils/blob/master/src/interactivityService.ts), you don't need any other actions to support the bookmarks in your visual.

When you select a bookmark, the utility automatically handles the visual's selection state.

### Use SelectionManager to restore bookmark selections

You can save and recall bookmark selections using the `ISelectionManager.registerOnSelectCallback` method as follows:

When you select a bookmark, Power BI calls the `callback` method of the visual with the corresponding selections.

```typescript
this.selectionManager.registerOnSelectCallback(
    (ids: ISelectionId[]) => {
        //called when a selection was set by Power BI
    });
);
```

Let's assume you created a data point in the [visualTransform](https://github.com/Microsoft/PowerBI-visuals-sampleBarChart/blob/master/src/barChart.ts#L74) method of your visual.

The `datapoints` looks like this:

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

At this point, the visual should compare the `ISelectionId[]` array with the selections in your `visualDataPoints` array, and then mark the corresponding data points as selected.

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

After you update the data points, they'll reflect the current selection state stored in the `filter` object. Then, when the data points are rendered, the custom visual's selection state matches the state of the bookmark.

## Visuals with a filter

Let's assume that the visual creates a filter of data by date range. You have `startDate` and `endDate` as the start and end dates of the range.

The visual creates an advanced filter and calls the host method `applyJsonFilter` to filter data by the relevant conditions.

The target is the table used for filtering.

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

In the `update` method, the visual checks the filter in the object:

```typescript
const filter: IAdvancedFilter = FilterManager.restoreFilter(
    && options.jsonFilters
    && options.jsonFilters[0] as any
) as IAdvancedFilter;
```

If the `filter` object isn't null, the visual restores the filter conditions from the object:

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

After that, the visual changes its internal state to match the current conditions. The internal state includes the data points and visualization objects (lines, rectangles, and so on).

The [Timeline Slicer](../../visuals/desktop-slicer-filter-date-range.md) visual changes the range selector to the corresponding data ranges.

## Save the filter state of the visual

In addition to saving the conditions of the filter for the bookmark, you also can save other filter aspects.

For example, the [Timeline Slicer](https://github.com/microsoft/powerbi-visuals-timeline/commit/8b7d82dd23cd2bd71817f1bc5d1e1732347a185e) stores the `Granularity` property values as a filter state. It allows the granularity of the timeline (days, months, years, etc.) to change as you change bookmarks.

The `filterState` property saves a filter aspect as a property. The visual can store various `filterState` values in bookmarks.

To save a property value as a filter state, set the object property as `"filterState": true` in the *capabilities.json* file.

## Related content

- [What are bookmarks](../../consumer/end-user-bookmarks.md)
- [Create bookmarks in desktop reports](../../create-reports/desktop-bookmarks.md#create-report-bookmarks)
