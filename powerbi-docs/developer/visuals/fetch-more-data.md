---
title: Fetch more data from Power BI
description: This article discusses how to enable a segmented fetch of large datasets for Power BI visuals by using the fetchMoreData API.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 11/18/2022
---

# Fetch more data from Power BI

The **fetchMoreData API** supports loading data chunks as a way of enabling Power BI visuals to bypass the hard limit of a 30K row data view. In addition to the original approach of aggregating all requested chunks, the API now supports loading only the incremental data chunks.

This approach allows more flexibility in the way extra data chunks are loaded to the visual. To improve performance, you can configure the chunk size to accommodate your use case.

>[!NOTE]
>The `fetchMoreData` API is available from version 3.4 and above. To find out which version you're using, check the `apiVersion` in the *pbiviz.json* file.

## Enable a segmented fetch of large datasets

For the `dataview` segment mode, define a window size for `dataReductionAlgorithm` in the visual's *capabilities.json* file for the required `dataViewMapping`. The `count` determines the window size, which limits the number of new data rows that you can append to the `dataview` in each update.

Add the following code in the *capabilities.json* file:

```typescript
"dataViewMappings": [
    {
        "table": {
            "rows": {
                "for": {
                    "in": "values"
                },
                "dataReductionAlgorithm": {
                    "window": {
                        "count": 100
                    }
                }
            }
    }
]
```

New segments are appended to the existing `dataview` and provided to the visual as an `update` call.

## Using fetchMoreData in the Power BI visual

In Power BI, you can `fetchMoreData` in one of two ways:

* *segments aggregation* mode
* *incremental updates* mode

### Segments aggregation mode (default)

With the segments aggregation mode, the dataview that is provided to the visual contains the accumulated data from all previous `fetchMoreData` requests. Therefore, the dataview size should grow with each update. For example, if a total of 100,000 rows are expected, and the window size is set to 10,000, the first update dataview should include 10,000 rows, the second update dataview should include 20,000 rows, and so on.

Select the segments aggregation mode by calling `fetchMoreData` with `aggregateSegments = true`.

You can determine whether data exists by checking for the existence of `dataView.metadata.segment`:

```typescript
    public update(options: VisualUpdateOptions) {
        const dataView = options.dataViews[0];
        console.log(dataView.metadata.segment);
        // output: __proto__: Object
    }
```

You also can check to see whether the update is the first update or a subsequent update by checking `options.operationKind`. In the following code, `VisualDataChangeOperationKind.Create` refers to the first segment and `VisualDataChangeOperationKind.Append` refers to subsequent segments.

```typescript
// CV update implementation
public update(options: VisualUpdateOptions) {
    // indicates this is the first segment of new data.
    if (options.operationKind == VisualDataChangeOperationKind.Create) {

    }

    // on second or subsequent segments:
    if (options.operationKind == VisualDataChangeOperationKind.Append) {

    }

    // complete update implementation
}
```

You also can invoke the `fetchMoreData` method from a UI event handler:

```typescript
btn_click(){
{
    // check if more data is expected for the current data view
    if (dataView.metadata.segment) {
        // request for more data if available; as a response, Power BI will call update method
        let request_accepted: bool = this.host.fetchMoreData(true);
        // handle rejection
        if (!request_accepted) {
            // for example, when the 100 MB limit has been reached
        }
    }
}
```

As a response to calling the `this.host.fetchMoreData` method, Power BI calls the `update` method of the visual with a new segment of data.

> [!NOTE]
> To avoid client memory constraints, Power BI currently limits the fetched data total to 100 MB. When this limit is reached, `fetchMoreData()` returns `false`.

### Incremental updates mode

With the incremental updates mode, the dataview that is provided to the visual contains only incremental data. Therefore, dataview size doesn't pass the defined window size. For example, if a total of 101,000 rows are expected and the window size is set to 10,000, the visual would get 10 updates with a dataview size of 10,000 and one update with a dataview size of 1,000.

The incremental updates mode is selected by calling `fetchMoreData` with `aggregateSegments = false`.

You can determine whether data exists by checking for the existence of `dataView.metadata.segment`:

```typescript
    public update(options: VisualUpdateOptions) {
        const dataView = options.dataViews[0];
        console.log(dataView.metadata.segment);
        // output: __proto__: Object
    }
```

You also can check if the update is the first update or a subsequent update by checking `options.operationKind`. In the following code, `VisualDataChangeOperationKind.Create` refers to the first segment, and `VisualDataChangeOperationKind.Segment` refers to subsequent segments.

```typescript
// CV update implementation
public update(options: VisualUpdateOptions) {
    // indicates this is the first segment of new data.
    if (options.operationKind == VisualDataChangeOperationKind.Create) {

    }

    // on second or subsequent segments:
    if (options.operationKind == VisualDataChangeOperationKind.Segment) {
        
    }

    // skip overlapping rows 
    const rowOffset = (dataView.table['lastMergeIndex'] === undefined) ? 0 : dataView.table['lastMergeIndex'] + 1;

    // Process incoming data
    for (var i = rowOffset; i < dataView.table.rows.length; i++) {
        var val = <number>(dataView.table.rows[i][0]); // Pick first column               
            
     }
     
    // complete update implementation
}
```

You also can invoke the `fetchMoreData` method from a UI event handler:

```typescript
btn_click(){
{
    // check if more data is expected for the current data view
    if (dataView.metadata.segment) {
        // request for more data if available; as a response, Power BI will call update method
        let request_accepted: bool = this.host.fetchMoreData(false);
        // handle rejection
        if (!request_accepted) {
            // for example, when the 100 MB limit has been reached
        }
    }
}
```

As a response to calling the `this.host.fetchMoreData` method, Power BI calls the `update` method of the visual with a new segment of data.

> [!NOTE]
> Although the data in the different updates of the dataviews are mostly exclusive, there is some overlap between consecutive dataviews.
> For table and categorical data mapping, it is expected that the first `N` dataview rows will contain data copied from the previous dataview.
> `N` can be determined by `(dataView.table['lastMergeIndex'] === undefined) ? 0 : dataView.table['lastMergeIndex'] + 1`

## Considerations and limitations

* The window size is limited to a range of 2-30,000.
* The dataview total row count is limited to 1,048,576 rows.
* In segments aggregation mode, the dataview memory size is limited to 100 MB.

## Next steps

> [!div class="nextstepaction"]
> [Data view mappings](dataview-mappings.md)

> [!div class="nextstepaction"]
> [DataViewUtils](utils-dataview.md)
