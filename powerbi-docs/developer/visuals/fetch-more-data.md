---
title: Fetch more data
description: Enable segmented fetch of large datasets
author: AviSander
ms.author: asander
manager: AviSander
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/18/2019
---

# Fetch more data

Load more data API overcome the hard limit of 30K data point. It brings data in chunks. The chunk size is configurable to improve performance according to use case.  

## Enable segmented fetch of large datasets

For dataview segment mode, define a "window" dataReductionAlgorithm in the visual's `capabilities.json` for the required dataViewMapping.
The `count` will determine the window size, which limits the number of new data rows appended to the dataview in each update. 

To be added in capabilities.json 
 
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
New segments are appended to the existing dataview and provided to the visual as an `update` call.

## Usage in the custom visual

The indication of whether or not more data exists by checking the existence of `dataView.metadata.segment`: 
```typescript
    public update(options: VisualUpdateOptions) {
        const dataView = options.dataViews[0];
        console.log(dataView.metadata.segment);
        // output: __proto__: Object
    }
```

It is also possible to check whether it is the first or subsequent update by checking `options.operationKind`.

`VisualDataChangeOperationKind.Create` means the first segment, and `VisualDataChangeOperationKind.Append` means subsequent segments.

See the code snippet below for a sample implementation:
```typescript
// CV update implementation
public update(options: VisualUpdateOptions) {
	// indicates this is the first segment of new data.
	if (options.operationKind == VisualDataChangeOperationKind.Create) {

	} 

	// on second or subesquent segments:
	if (options.operationKind == VisualDataChangeOperationKind.Append) {

	}

	// complete update implementation
}
```

The `fetchMoreData` method could also be invoked from a UI event handler
```typescript
btn_click(){
{
	// check if more data is expected for the current dataview
	if (dataView.metadata.segment) {
		//request for more data if available, as resopnce Power BI will call update method
		let request_accepted: bool = this.host.fetchMoreData();
		// handle rejection
		if (!request_accepted) {
			// for example when the 100MB limit has been reached
		}
	}

}
```

Power BI will call `update` method of the visual with new segment of data as resopnse to call `this.host.fetchMoreData` method.

*Please note that Power BI will presently limit the total fetched data to **100MB** to avoid client memory constraints. You can detect this limit being reached when fetchMoreData() returns 'false'.*
