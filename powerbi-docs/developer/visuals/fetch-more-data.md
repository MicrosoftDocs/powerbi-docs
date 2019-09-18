---
title: Fetch more data from Power BI
description: This article discusses how to enable a segmented fetch of large datasets for Power BI visuals.
author: KesemSharabi
ms.author: kesharab
manager: rkarlin
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/18/2019
---

# Fetch more data from Power BI

This article discusses how to load more data to bypass the hard limit of a 30-KB data point. This approach provides data in chunks. To improve performance, you can configure the chunk size to accommodate your use case.  

## Enable a segmented fetch of large datasets

For the `dataview` segment mode, you define a window size for dataReductionAlgorithm in the visual's *capabilities.json* file for the required dataViewMapping. The `count` determines the window size, which limits the number of new data rows that can be appended to the `dataview` in each update.

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

You can determine whether data exists by checking the existence of `dataView.metadata.segment`:

```typescript
    public update(options: VisualUpdateOptions) {
        const dataView = options.dataViews[0];
        console.log(dataView.metadata.segment);
        // output: __proto__: Object
    }
```

You can also check to see whether it's the first update or a subsequent update by checking `options.operationKind`. In the following code, `VisualDataChangeOperationKind.Create` refers to the first segment, and `VisualDataChangeOperationKind.Append` refers to subsequent segments.

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

You can also invoke the `fetchMoreData` method from a UI event handler, as shown here:

```typescript
btn_click(){
{
    // check if more data is expected for the current data view
    if (dataView.metadata.segment) {
        //request for more data if available; as a response, Power BI will call update method
        let request_accepted: bool = this.host.fetchMoreData();
        // handle rejection
        if (!request_accepted) {
            // for example, when the 100 MB limit has been reached
        }
    }
}
```

As a response to calling the `this.host.fetchMoreData` method, Power BI calls the `update` method of the visual with a new segment of data.

> [!NOTE]
> To avoid client memory constraints, Power BI currently limits the fetched data total to 100 MB. You can see that the limit has been reached when fetchMoreData() returns `false`.
