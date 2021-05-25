---
title: Fetch more data from Power BI
description: This article discusses how to enable a segmented fetch of large datasets for Power BI visuals.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 12/13/2020
---

# Fetch more data from Power BI

The `fetchMoreData` API enables Power BI visuals to bypass the hard limit of a 30K rows data view. With the 3.4 API release, the `fetchMoreData` API’s functionality is extended to support an approach of loading data chunks. In addition to the existing approach, which aggregates all the chunks requested, the API will support loading only the incremental data chunks.

The approach allows more flexibility in the way additional data chunks are loaded to the visual. To improve performance, you can configure the chunk size to accommodate your use case.

## Limitations of fetchMoreData

* Window size is limited to a range of 2 to 30,000.
* Dataview total row count is limitd to 1,048,576 rows.
* In segments aggregation mode, dataview memory size is limited to 100 MB.

## Enable a segmented fetch of large datasets

For the `dataview` segment mode, you define a window size for `dataReductionAlgorithm` in the visual's *capabilities.json* file for the required `dataViewMapping`. The `count` determines the window size, which limits the number of new data rows that can be appended to the `dataview` in each update.

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

## Usage in the Power BI visual

In Power BI, you can use `fetchMoreData` in the default segments aggregation mode or in incremental updates mode. 

### Using segments aggregation mode (default)

With this mode, the dataview provided to the visual contain the accumulated data for all the previous `fetchMoreData requests`. Therefore, dataview size is expected to grow with each update. For example, if a total of 100,000 rows are expected and the window size is set to 10,000, the first update dataview should include 10,000 rows, the second update dataview should include 20,000 rows, and so on.

This mode is selected by calling `fetchMoreData` with `aggregateSegments = true`.

You can determine whether data exists by checking for the existence of `dataView.metadata.segment`:

```typescript
    public update(options: VisualUpdateOptions) {
        const dataView = options.dataViews[0];
        console.log(dataView.metadata.segment);
        // output: __proto__: Object
    }
```

You also can check to see whether it's the first update or a subsequent update by checking `options.operationKind`. In the following code, `VisualDataChangeOperationKind.Create` refers to the first segment and `VisualDataChangeOperationKind.Append` refers to subsequent segments.

For a sample implementation, see the following code snippet:

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

You also can invoke the `fetchMoreData` method from a UI event handler, as shown here:

```typescript
btn_click(){
{
    // check if more data is expected for the current data view
    if (dataView.metadata.segment) {
        //request for more data if available; as a response, Power BI will call update method
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
> To avoid client memory constraints, Power BI currently limits the fetched data total to 100 MB. You can see that the limit has been reached when `fetchMoreData()` returns `false`.

### Using incremental updates mode

With this mode, the dataview provided to the visual contains just incremental data. Therefore, dataview size would not pass the defined window size. For example, if a total of 101,000 rows are expected and the window size is set to 10,000, the visual would get 10 updates with a dataview size of 10,000 and one update with a dataview of size 1,000.

This mode is selected by calling `fetchMoreData` with `aggregateSegments = false`.

You can determine whether data exists by checking for the existence of `dataView.metadata.segment`:

```typescript
    public update(options: VisualUpdateOptions) {
        const dataView = options.dataViews[0];
        console.log(dataView.metadata.segment);
        // output: __proto__: Object
    }
```

You also can check to see whether it's the first update or a subsequent update by checking `options.operationKind`. In the following code, `VisualDataChangeOperationKind.Create` refers to the first segment, and `VisualDataChangeOperationKind.Segment` refers to subsequent segments.

For a sample implementation, see the following code snippet:

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

You also can invoke the `fetchMoreData` method from a UI event handler, as shown here:

```typescript
btn_click(){
{
    // check if more data is expected for the current data view
    if (dataView.metadata.segment) {
        //request for more data if available; as a response, Power BI will call update method
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
> Although the dataviews data between the different updates is mostly exclusive, there will be some overlap between subsequent dataviews.
> For table and categorical data mapping, it is expected the the first N dataview rows will contain data copied from the previous dataview.
> N can be determined by: `(dataView.table['lastMergeIndex'] === undefined) ? 0 : dataView.table['lastMergeIndex'] + 1`