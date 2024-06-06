---
title: The Visual Filters API for better embedded BI insights
description: This article discusses how Power BI visuals can filter other visuals. Enable better embedded BI insights using Power BI embedded analytics.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 06/06/2024
#customer intent: As a Power BI visual developer, I want to learn how to use the Visual Filters API to filter data in Power BI visuals so that I can enable better embedded BI insights.
---

# The Visual Filters API in Power BI visuals

The Visual Filters API allows you to filter data in Power BI visuals. The main difference between the filter API and other ways of selecting data is how it affects other visuals in the report. When a filter is applied to a visual, only the filtered data will be visible in all visuals, despite highlight support by other visuals.

To enable filtering for the visual, the *capabilities.json* file should contain a `filter` object in the `general` section.

```json
"objects": {
        "general": {
            "displayName": "General",
            "displayNameKey": "formattingGeneral",
            "properties": {
                "filter": {
                    "type": {
                        "filter": true
                    }
                }
            }
        }
    }
```

>[!NOTE]
>
> * Visual filters API interfaces are available in the [powerbi-models](https://www.npmjs.com/package/powerbi-models) package. This package also contains classes to create filter instances.
>
>    ```cmd
>    npm install powerbi-models --save
>    ```
>
> * If you're using an older (earlier than 3.x.x) version of the tools, include `powerbi-models` in the visuals package. For more information, see the short guide, [Add the Advanced Filter API to the custom visual](https://github.com/Microsoft/powerbi-visuals-sampleslicer/blob/master/doc/AddingAdvancedFilterAPI.md). To find out which version you’re using, check the `apiVersion` in the *pbiviz.json* file.

All filters use the [`IFilter` interface](/azure/machine-learning/studio-module-reference/ifilter-interface), as shown in the following code:

```typescript
export interface IFilter {
        $schema: string;
        target: IFilterTarget;
}
```

Where `target` is a table column in the data source.

There are three filter APIs:

* [Basic filter API](#the-basic-filter-api)
* [Advanced filter API](#the-advanced-filter-api)
* [Tuple (multi-column) filter API](#the-tuple-filter-api-multi-column-filter)

## The Basic Filter API

Basic filter interface is shown in the following code:

```typescript
export interface IBasicFilter extends IFilter {
    operator: BasicFilterOperators;
    values: (string | number | boolean)[];
}
```

Where:

* `operator` is an enumeration with the values *In*, *NotIn*, and *All*.
* `values` are values for the condition.

### Example of a basic filter

The following example returns all rows where `col1` equals the value 1, 2, or 3.

```typescript
let basicFilter = {
    target: {
        column: "Col1"
    },
    operator: "In",
    values: [1,2,3]
}
```

The SQL equivalent of the above example is:

```sql
SELECT * FROM table WHERE col1 IN ( 1 , 2 , 3 )
```

To create a filter, you can use the BasicFilter class in `powerbi-models`.

If you are using an older version of the tool, you should get an instance of models in the window object by using `window['powerbi-models']`, as shown in the following code:

```javascript
let categories: DataViewCategoricalColumn = this.dataView.categorical.categories[0];

let target: IFilterColumnTarget = {
    table: categories.source.queryName.substr(0, categories.source.queryName.indexOf('.')),
    column: categories.source.displayName
};

let values = [ 1, 2, 3 ];

let filter: IBasicFilter = new window['powerbi-models'].BasicFilter(target, "In", values);
```

The visual invokes the filter by calling the `applyJsonFilter()` method on the host interface, `IVisualHost`, which is provided to the visual in the constructor method.

```typescript
IVisualHost.applyJsonFilter(filter, "general", "filter", FilterAction.merge);
```

## The Advanced Filter API

The [Advanced Filter API](https://github.com/Microsoft/powerbi-models) enables complex cross-visual data-point selection and filtering queries that are based on multiple criteria, such as *LessThan*, *Contains*, *Is*, *IsBlank*, and so on).

This filter was introduced in the Visuals API version 1.7.0.

As opposed to the *Basic API*, in the *Advanced Filter API*:

* The `target` requires both a `table` and `column` name (the *Basic API* just had `column`).
* Operators are *And* and *Or* (as opposed to *In*).
* The filter uses conditions (*less than*, *greater than* etc.) instead of values with the interface:

```typescript
interface IAdvancedFilterCondition {
    value: (string | number | boolean);
    operator: AdvancedFilterConditionOperators;
}
```

Condition operators for the `operator` parameter are:
 *None*, *LessThan*, *LessThanOrEqual*, *GreaterThan*, *GreaterThanOrEqual*, *Contains*, *DoesNotContain*, *StartsWith*, *DoesNotStartWith*, *Is*, *IsNot*, *IsBlank*, and "IsNotBlank"`

```javascript
let categories: DataViewCategoricalColumn = this.dataView.categorical.categories[0];

let target: IFilterColumnTarget = {
    table: categories.source.queryName.substr(0, categories.source.queryName.indexOf('.')), // table
    column: categories.source.displayName // col1
};

let conditions: IAdvancedFilterCondition[] = [];

conditions.push({
    operator: "LessThan",
    value: 0
});

let filter: IAdvancedFilter = new window['powerbi-models'].AdvancedFilter(target, "And", conditions);

// invoke the filter
visualHost.applyJsonFilter(filter, "general", "filter", FilterAction.merge);
```

The SQL equivalent is:

```sql
SELECT * FROM table WHERE col1 < 0;
```

For the complete sample code for using the Advanced Filter API, go to the [Sampleslicer visual repository](https://github.com/Microsoft/powerbi-visuals-sampleslicer).

## The Tuple Filter API (multi-column filter)

The *Tuple Filter* API was introduced in Visuals API 2.3.0. It is similar to the *Basic Filter API*, but it allows you to define conditions for several columns and tables.

The filter interface is shown in the following code:

```typescript
interface ITupleFilter extends IFilter {
    $schema: string;
    filterType: FilterType;
    operator: TupleFilterOperators;
    target: ITupleFilterTarget;
    values: TupleValueType[];
}
```

Where

* `target` is an array of columns with table names:

    ```typescript
    declare type ITupleFilterTarget = IFilterTarget[];
    ```

    The filter can address columns from various tables.

* `$schema` is <https://powerbi.com/product/schema#tuple>.

* `filterType` is *FilterType.Tuple*.

* `operator` allows use only in the *In* operator.

* `values` is an array of value tuples. Each tuple represents one permitted combination of the target column values.

```typescript
declare type TupleValueType = ITupleElementValue[];

interface ITupleElementValue {
    value: PrimitiveValueType
}
```

Complete example:

```typescript
let target: ITupleFilterTarget = [
    {
        table: "DataTable",
        column: "Team"
    },
    {
        table: "DataTable",
        column: "Value"
    }
];

let values = [
    [
        // the first column combination value (or the column tuple/vector value) that the filter will pass through
        {
            value: "Team1" // the value for the `Team` column of the `DataTable` table
        },
        {
            value: 5 // the value for the `Value` column of the `DataTable` table
        }
    ],
    [
        // the second column combination value (or the column tuple/vector value) that the filter will pass through
        {
            value: "Team2" // the value for `Team` column of `DataTable` table
        },
        {
            value: 6 // the value for `Value` column of `DataTable` table
        }
    ]
];

let filter: ITupleFilter = {
    $schema: "https://powerbi.com/product/schema#tuple",
    filterType: FilterType.Tuple,
    operator: "In",
    target: target,
    values: values
}

// invoke the filter
visualHost.applyJsonFilter(filter, "general", "filter", FilterAction.merge);
```

> [!IMPORTANT]
> The order of the column names and condition values is important.

The SQL equivalent of the above code is:

```sql
SELECT * FROM DataTable WHERE ( Team = "Team1" AND Value = 5 ) OR ( Team = "Team2" AND Value = 6 );
```  

## Restore the JSON filter from the data view

Starting with API version 2.2.0, you can restore the JSON filter from *VisualUpdateOptions*, as shown in the following code:

```typescript
export interface VisualUpdateOptions extends extensibility.VisualUpdateOptions {
    viewport: IViewport;
    dataViews: DataView[];
    type: VisualUpdateType;
    viewMode?: ViewMode;
    editMode?: EditMode;
    operationKind?: VisualDataChangeOperationKind;
    jsonFilters?: IFilter[];
}
```

When you switch bookmarks, Power BI calls the `update` method of the visual, and the visual gets a corresponding `filter` object. For more information, see [Add bookmark support for Power BI visuals](bookmarks-support.md).

### Sample JSON filter

Some sample JSON filter code is shown in the following image:

:::image type="content" source="media/filter-api/json-filter.png" alt-text="Screenshot of sample JSON filter code showing values in an array.":::

### Clear the JSON filter

To reset or clear the filter, pass a `null` value to the filter API.

```typescript
// invoke the filter
visualHost.applyJsonFilter(null, "general", "filter", FilterAction.merge);
```

## Related content

[Use Power BI visuals selections to add interactivity to a visual](selection-api.md)
