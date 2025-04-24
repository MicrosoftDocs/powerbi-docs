---
title: Introduction to use Data view utils in Power BI visual
description: Learn how to install and use SVG utils to simplify parsing of the DataView object for Power BI visuals.
author: mberdugo
ms.author: monaberdugo
manager:
ms.reviewer: tebercov 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: concept-article
ms.date: 01/13/2024
#customer intent: As a Power BI visual developer, I want to learn how to use DataViewUtils to simplify parsing of the DataView object for Power BI visuals.
---

# DataViewUtils

The `DataViewUtils` is a set of functions and classes to simplify parsing of the DataView object for Power BI visuals.

## Installation

To install the package, run the following command in the directory with your current custom visual:

`npm install powerbi-visuals-utils-dataviewutils --save`

This command installs the package and adds a package as a dependency to your `package.json` file.

## DataViewWildcard

`DataViewWildcard` provides the `createDataViewWildcardSelector` function to support a property's [conditional formatting](conditional-format.md#define-how-conditional-formatting-behaves).

`createDataViewWildcardSelector` returns a selector that's required for defining how the conditional formatting entry in the format pane will be applied, based on `dataviewWildcardMatchingOption (InstancesAndTotals (default), InstancesOnly, TotalsOnly)`.

Example:

```typescript
import { dataViewWildcard } from "powerbi-visuals-utils-dataviewutils";

let selector = dataViewWildcard.createDataViewWildcardSelector(dataViewWildcard.DataViewWildcardMatchingOption.InstancesAndTotals);
// returns {data: [{dataViewWildcard:{matchingOption: 0}}]};

```

## DataRoleHelper

The `DataRoleHelper` provides functions to check roles of the dataView object.

The module provides the following functions:

### getMeasureIndexOfRole

This function finds the measure by the role name and returns its index.

```typescript
function getMeasureIndexOfRole(grouped: DataViewValueColumnGroup[], roleName: string): number;
```

Example:

```typescript
import powerbi from "powerbi-visuals-api";
import DataViewValueColumnGroup = powerbi.DataViewValueColumnGroup;
import { dataRoleHelper } from "powerbi-visuals-utils-dataviewutils";
// ...

// This object is actually a part of the dataView object.
let columnGroup: DataViewValueColumnGroup[] = [{
    values: [
        {
            source: {
                displayName: "Microsoft",
                roles: {
                    "company": true
                }
            },
            values: []
        },
        {
            source: {
                displayName: "Power BI",
                roles: {
                    "product": true
                }
            },
            values: []
        }
    ]
}];

dataRoleHelper.getMeasureIndexOfRole(columnGroup, "product");

// returns: 1
```

### getCategoryIndexOfRole

This function finds the category by the role name and returns its index.

```typescript
function getCategoryIndexOfRole(categories: DataViewCategoryColumn[], roleName: string): number;
```

Example:

```typescript
import powerbi from "powerbi-visuals-api";
import DataViewCategoryColumn = powerbi.DataViewCategoryColumn;
import { dataRoleHelper } from "powerbi-visuals-utils-dataviewutils";
// ...

// This object is actually a part of the dataView object.
let categoryGroup: DataViewCategoryColumn[] = [
    {
        source: {
            displayName: "Microsoft",
            roles: {
                "company": true
            }
        },
        values: []
    },
    {
        source: {
            displayName: "Power BI",
            roles: {
                "product": true
            }
        },
        values: []
    }
];

dataRoleHelper.getCategoryIndexOfRole(categoryGroup, "product");

// returns: 1
```

### hasRole

This function checks if the provided role is defined in the metadata.

```typescript
function hasRole(column: DataViewMetadataColumn, name: string): boolean;
```

Example:

```typescript
import powerbi from "powerbi-visuals-api";
import DataViewMetadataColumn = powerbi.DataViewMetadataColumn;
import { dataRoleHelper } from "powerbi-visuals-utils-dataviewutils";

// This object is actually a part of the dataView object.
let metadata: DataViewMetadataColumn = {
    displayName: "Microsoft",
    roles: {
        "company": true
    }
};

DataRoleHelper.hasRole(metadata, "company");

// returns: true
```

### hasRoleInDataView

This function checks if the provided role is defined in the dataView.

```typescript
function hasRoleInDataView(dataView: DataView, name: string): boolean;
```

Example:

```typescript
import powerbi from "powerbi-visuals-api";
import DataView = powerbi.DataView;
import { dataRoleHelper } from "powerbi-visuals-utils-dataviewutils";

// This object is actually a part of the dataView object.
let dataView: DataView = {
    metadata: {
        columns: [
            {
                displayName: "Microsoft",
                roles: {
                    "company": true
                }
            },
            {
                displayName: "Power BI",
                roles: {
                    "product": true
                }
            }
        ]
    }
};

DataRoleHelper.hasRoleInDataView(dataView, "product");

// returns: true
```

### hasRoleInValueColumn

This function checks if the provided role is defined in the value column.

```typescript
function hasRoleInValueColumn(valueColumn: DataViewValueColumn, name: string): boolean;
```

Example:

```typescript
import powerbi from "powerbi-visuals-api";
import DataViewValueColumn = powerbi.DataViewValueColumn;
import { dataRoleHelper } from "powerbi-visuals-utils-dataviewutils";

// This object is actually a part of the dataView object.
let valueColumn: DataViewValueColumn = {
    source: {
        displayName: "Microsoft",
        roles: {
            "company": true
        }
    },
    values: []
};

dataRoleHelper.hasRoleInValueColumn(valueColumn, "company");

// returns: true
```

## DataViewObjects

The `DataViewObjects` provides functions to extract the values of the objects.

The module provides the following functions:

### getValue

This function returns the value of the specific object.

```typescript
function getValue<T>(objects: DataViewObjects, propertyId: DataViewObjectPropertyIdentifier, defaultValue?: T): T;
```

Example:

```typescript
import powerbi from "powerbi-visuals-api";
import DataViewObjectPropertyIdentifier = powerbi.DataViewObjectPropertyIdentifier;
import { dataViewObjects } from "powerbi-visuals-utils-dataviewutils";

let property: DataViewObjectPropertyIdentifier = {
    objectName: "microsoft",
    propertyName: "bi"
};

// This object is actually a part of the dataView object.
let objects: powerbi.DataViewObjects = {
    "microsoft": {
        "windows": 5,
        "bi": "Power"
    }
};

dataViewObjects.getValue(objects, property);

// returns: Power
```

### getObject

This function returns an object from specified objects.

```typescript
function getObject(objects: DataViewObjects, objectName: string, defaultValue?: IDataViewObject): IDataViewObject;
```

Example:

```typescript
import { dataViewObjects } from "powerbi-visuals-utils-dataviewutils";

// This object is actually a part of the dataView object.
let objects: powerbi.DataViewObjects = {
    "microsoft": {
        "windows": 5,
        "bi": "Power"
    }
};

dataViewObjects.getObject(objects, "microsoft");

/* returns: {
    "bi": "Power",
    "windows": 5

}*/
```

### getFillColor

This function returns a solid color of the objects.

```typescript
function getFillColor(objects: DataViewObjects, propertyId: DataViewObjectPropertyIdentifier, defaultColor?: string): string;
```

Example:

```typescript
import powerbi from "powerbi-visuals-api";
import DataViewObjectPropertyIdentifier = powerbi.DataViewObjectPropertyIdentifier;
import { dataViewObjects } from "powerbi-visuals-utils-dataviewutils";

let property: DataViewObjectPropertyIdentifier = {
    objectName: "power",
    propertyName: "fillColor"
};

// This object is actually part of the dataView object.
let objects: powerbi.DataViewObjects = {
    "power": {
        "fillColor": {
            "solid": {
                "color": "yellow"
            }
        },
        "bi": "Power"
    }
};

dataViewObjects.getFillColor(objects, property);

// returns: yellow
```

### getCommonValue

This universal function retrieves the color or value of a specific object.

```typescript
function getCommonValue(objects: DataViewObjects, propertyId: DataViewObjectPropertyIdentifier, defaultValue?: any): any;
```

Example:

```typescript
import powerbi from "powerbi-visuals-api";
import DataViewObjectPropertyIdentifier = powerbi.DataViewObjectPropertyIdentifier;
import { dataViewObjects } from "powerbi-visuals-utils-dataviewutils";

let colorProperty: DataViewObjectPropertyIdentifier = {
    objectName: "power",
    propertyName: "fillColor"
};

let biProperty: DataViewObjectPropertyIdentifier = {
    objectName: "power",
    propertyName: "bi"
};

// This object is actually part of the dataView object.
let objects: powerbi.DataViewObjects = {
    "power": {
        "fillColor": {
            "solid": {
                "color": "yellow"
            }
        },
        "bi": "Power"
    }
};

dataViewObjects.getCommonValue(objects, colorProperty); // returns: yellow
dataViewObjects.getCommonValue(objects, biProperty); // returns: Power
```

## DataViewObject

The `DataViewObject` provides functions to extract the value of the object.

The module provides the following functions:

### getValue

This function returns a value of the object by the property name.

```typescript
function getValue<T>(object: IDataViewObject, propertyName: string, defaultValue?: T): T;
```

Example:

```typescript
import { dataViewObject } from "powerbi-visuals-utils-dataviewutils";

// This object is actually a part of the dataView object.
let object: powerbi.DataViewObject = {
    "windows": 5,
    "microsoft": "Power BI"
};

dataViewObject.getValue(object, "microsoft");

// returns: Power BI
```

### getFillColorByPropertyName

This function returns a solid color of the object by the property name.

```typescript
function getFillColorByPropertyName(object: IDataViewObject, propertyName: string, defaultColor?: string): string;
```

Example:

```typescript
import { dataViewObject } from "powerbi-visuals-utils-dataviewutils";

// This object is actually a part of the dataView object.
let object: powerbi.DataViewObject = {
    "windows": 5,
    "fillColor": {
        "solid": {
            "color": "green"
        }
    }
};

dataViewObject.getFillColorByPropertyName(object, "fillColor");

// returns: green
```

### converterHelper

The `converterHelper` provides functions to check properties of the dataView.

The module provides the following functions:

### categoryIsAlsoSeriesRole

This function checks if the category is also a series.

```typescript
function categoryIsAlsoSeriesRole(dataView: DataViewCategorical, seriesRoleName: string, categoryRoleName: string): boolean;
```

Example:

```typescript
import powerbi from "powerbi-visuals-api";
import DataViewCategorical = powerbi.DataViewCategorical;
import { converterHelper } from "powerbi-visuals-utils-dataviewutils";
// ...


// This object is actually part of the dataView object.
let categorical: DataViewCategorical = {
    categories: [{
        source: {
            displayName: "Microsoft",
            roles: {
                "power": true,
                "bi": true
            }
        },
        values: []
    }]
};

converterHelper.categoryIsAlsoSeriesRole(categorical, "power", "bi");

// returns: true
```

### getSeriesName

This function returns a name of the series.

```typescript
function getSeriesName(source: DataViewMetadataColumn): PrimitiveValue;
```

Example:

```typescript
import powerbi from "powerbi-visuals-api";
import DataViewMetadataColumn = powerbi.DataViewMetadataColumn;
import { converterHelper } from "powerbi-visuals-utils-dataviewutils";

// This object is actually a part of the dataView object.
let metadata: DataViewMetadataColumn = {
    displayName: "Microsoft",
    roles: {
        "power": true,
        "bi": true
    },
    groupName: "Power BI"
};

converterHelper.getSeriesName(metadata);

// returns: Power BI
```

### isImageUrlColumn

This function checks if the column contains an image URL.

```typescript
function isImageUrlColumn(column: DataViewMetadataColumn): boolean;
```

Example:

```typescript
import powerbi from "powerbi-visuals-api";
import DataViewMetadataColumn = powerbi.DataViewMetadataColumn;
import { converterHelper } from "powerbi-visuals-utils-dataviewutils";

// This object is actually a part of the dataView object.
let metadata: DataViewMetadataColumn = {
    displayName: "Microsoft",
    type: {
        misc: {
            imageUrl: true
        }
    }
};

converterHelper.isImageUrlColumn(metadata);

// returns: true
```

### isWebUrlColumn

This function checks if the column contains a web URL.

```typescript
function isWebUrlColumn(column: DataViewMetadataColumn): boolean;
```

Example:

```typescript
import powerbi from "powerbi-visuals-api";
import DataViewMetadataColumn = powerbi.DataViewMetadataColumn;
import { converterHelper } from "powerbi-visuals-utils-dataviewutils";

// This object is actually a part of the dataView object.
let metadata: DataViewMetadataColumn = {
    displayName: "Microsoft",
    type: {
        misc: {
            webUrl: true
        }
    }
};

converterHelper.isWebUrlColumn(metadata);

// returns: true
```

### hasImageUrlColumn

This function checks if the dataView has a column with an image URL.

```typescript
function hasImageUrlColumn(dataView: DataView): boolean;
```

Example:

```typescript
import DataView = powerbi.DataView;
import converterHelper = powerbi.extensibility.utils.dataview.converterHelper;

// This object is actually part of the dataView object.
let dataView: DataView = {
    metadata: {
        columns: [
            {
                displayName: "Microsoft"
            },
            {
                displayName: "Power BI",
                type: {
                    misc: {
                        imageUrl: true
                    }
                }
            }
        ]
    }
};

converterHelper.hasImageUrlColumn(dataView);

// returns: true
```

## DataViewObjectsParser

The `DataViewObjectsParser` provides the simplest way to parse the properties of the formatting panel.

The class provides the following methods:

### getDefault

This static method returns an instance of DataViewObjectsParser.

```typescript
static getDefault(): DataViewObjectsParser;
```

Example:

```typescript
import { dataViewObjectsParser } from "powerbi-visuals-utils-dataviewutils";
// ...

dataViewObjectsParser.getDefault();

// returns: an instance of the DataViewObjectsParser
```

### parse

This method parses the properties of the formatting panel and returns an instance of `DataViewObjectsParser`.

```typescript
static parse<T extends DataViewObjectsParser>(dataView: DataView): T;
```

Example:

```typescript
import powerbi from "powerbi-visuals-api";
import IVisual = powerbi.extensibility.IVisual;
import VisualUpdateOptions = powerbi.extensibility.visual.VisualUpdateOptions;
import { dataViewObjectsParser } from "powerbi-visuals-utils-dataviewutils";

/**
 * This class describes formatting panel properties.
 * Name of the property should match its name described in the capabilities.
 */
class DataPointProperties {
    public fillColor: string = "red"; // This value is a default value of the property.
}

class PropertiesParser extends dataViewObjectsParser.DataViewObjectsParser {
    /**
     * This property describes a group of properties.
     */
    public dataPoint: DataPointProperties = new DataPointProperties();
}

export class YourVisual extends IVisual {
    // implementation of the IVisual.

    private propertiesParser: PropertiesParser;

    public update(options: VisualUpdateOptions): void {
        // Parses properties.
        this.propertiesParser = PropertiesParser.parse<PropertiesParser>(options.dataViews[0]);

        // You can use the properties after parsing
        console.log(this.propertiesParser.dataPoint.fillColor); // returns "red" as default value, it will be updated automatically after any change of the formatting panel.
    }
}
```

## enumerateObjectInstances

> [!IMPORTANT]
> `enumerateObjectInstances` was deprecated in API version 5.1. It was replaced by [getFormattingModel](format-pane-general.md).
> Also, see [FormattingModel utils](./utils-formatting-model.md).

This static method enumerates properties and returns an instance of `VisualObjectInstanceEnumeration`.

Execute it in the `enumerateObjectInstances` method of the visual.

```typescript
static enumerateObjectInstances(dataViewObjectParser: dataViewObjectsParser.DataViewObjectsParser, options: EnumerateVisualObjectInstancesOptions): VisualObjectInstanceEnumeration;
```

Example:

```typescript
import powerbi from "powerbi-visuals-api";
import IVisual = powerbi.extensibility.IVisual;
import EnumerateVisualObjectInstancesOptions = powerbi.EnumerateVisualObjectInstancesOptions;
import VisualObjectInstanceEnumeration = powerbi.VisualObjectInstanceEnumeration;
import VisualUpdateOptions = powerbi.extensibility.visual.VisualUpdateOptions;
import { dataViewObjectsParser } from "powerbi-visuals-utils-dataviewutils";

/**
 * This class describes formatting panel properties.
 * Name of the property should match its name described in the capabilities.
 */
class DataPointProperties {
    public fillColor: string = "red";
}

class PropertiesParser extends dataViewObjectsParser.DataViewObjectsParser {
    /**
     * This property describes a group of properties.
     */
    public dataPoint: DataPointProperties = new DataPointProperties();
}

export class YourVisual extends IVisual {
    // implementation of the IVisual.

    private propertiesParser: PropertiesParser;

    public update(options: VisualUpdateOptions): void {
        // Parses properties.
        this.propertiesParser = PropertiesParser.parse<PropertiesParser>(options.dataViews[0]);
    }

    /**
     * This method will be executed only if the formatting panel is open.
     */
    public enumerateObjectInstances(options: EnumerateVisualObjectInstancesOptions): VisualObjectInstanceEnumeration {
        return PropertiesParser.enumerateObjectInstances(this.propertiesParser, options);
    }
}
```
