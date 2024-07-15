---
title: Conditional formatting of Power BI custom visuals
description: Learn how to customize your Power BI visual by applying conditional formatting functionality based on data values.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ""
featuredvideoid: ''
ms.service: powerbi
ms.topic: how-to
ms.subservice: powerbi-custom-visuals
ms.date: 1/12/2024
#customer intent: As a Power BI visual developer, I want to learn how to apply conditional formatting to my custom visual so I can customize the visual appearance based on the data values.
---

# Add conditional formatting

[Conditional formatting](../../visuals/service-tips-and-tricks-for-color-formatting.md#add-conditional-formatting-for-visuals) lets a report creator specify how colors are displayed in a report, according to a numerical value.

This article describes how to add the conditional formatting functionality to your Power BI visual.

Conditional formatting can only be applied to the following property types:

* Color
* Text
* Icon
* Web URL

## Add conditional formatting to your project

This section shows how to add conditional formatting to an existing Power BI visual. The example code in this article is based on the [SampleBarChart](https://github.com/microsoft/PowerBI-visuals-sampleBarChart) visual. You can examine the source code in [barChart.ts](https://github.com/microsoft/PowerBI-visuals-sampleBarChart/blob/master/src/barChart.ts).

### Add a conditional color formatting entry in the format pane

In this section you learn how to add a conditional color formatting entry, to a data point in format pane.

1. Use the `propertyInstanceKind` array in `VisualObjectInstance`, which is exposed by `powerbi-visuals-api`. Verify that your file includes this import:

    ```typescript
    import powerbiVisualsApi from "powerbi-visuals-api";
    ```

2. To specify the appropriate type of formatting (*Constant*, *ConstantOrRule*, or *Rule*), use  the `VisualEnumerationInstanceKinds` enum. Add the following import to your file:

    ```typescript
    import VisualEnumerationInstanceKinds = powerbiVisualsApi.VisualEnumerationInstanceKinds;
    ```

3. Set formatting property instance kind

#### [getFormattingModel API method](#tab/getFormattingModel)

To format properties that support conditional formatting, set the required instance kind in their `descriptor`.

```typescript
 public getFormattingModel(): powerbi.visuals.FormattingModel {
    // ...
    formattingGroup.slices.push(
        {
            uid: `colorSelector${barDataPoint_indx}_uid`,
            displayName: barDataPoint.category,
            control: {
                type: powerbi.visuals.FormattingComponent.ColorPicker,
                properties: {
                    descriptor: {
                        objectName: "colorSelector",
                        propertyName: "fill",                
                        selector: dataViewWildcard.createDataViewWildcardSelector(dataViewWildcard.DataViewWildcardMatchingOption.InstancesAndTotals),
                        altConstantValueSelector: barDataPoint.selectionId.getSelector(),
                        instanceKind: powerbi.VisualEnumerationInstanceKinds.ConstantOrRule // <=== Support conditional formatting
                    },
                    value: { value: barDataPoint.color }
                }
            }
        }
    );
    // ...
 }
```

#### [enumerateObjectInstances API method - deprecated](#tab/enumerateObjectInstances)

List all the properties that you'd like to support conditional formatting, under `propertyInstanceKind` array. Define these properties in the `enumerateObjectInstances` method.

```typescript
public enumerateObjectInstances(options: EnumerateVisualObjectInstancesOptions): VisualObjectInstanceEnumeration {
        …
        case 'colorSelector':
            …
                objectEnumeration.push({
                    objectName: objectName,
                    displayName: barDataPoint.category,
                    properties: {
                        fill: {
                            solid: {
                                color: barDataPoint.color
                            }
                        }
                    },
                    selector: dataViewWildcard.createDataViewWildcardSelector(dataViewWildcard.DataViewWildcardMatchingOption.InstancesAndTotals),
                    altConstantValueSelector: barDataPoint.selectionId.getSelector(),

                    // List your conditional formatting properties
                    propertyInstanceKind: {
                        fill: VisualEnumerationInstanceKinds.ConstantOrRule
                    }
                });
            }
        …
}
```

---

`VisualEnumerationInstanceKinds.ConstantOrRule` creates the conditional formatting UI entry alongside the constant formatting UI element.

:::image type="content" source="media/conditional-formatting/conditional-formatting-ui.png" alt-text="Screenshot of the conditional formatting button, as it appears in Power BI, next to the regular color button.":::

### Define how conditional formatting behaves

Define how formatting is applied to your data points.

Using `createDataViewWildcardSelector` declared under `powerbi-visuals-utils-dataviewutils`, specify whether to apply conditional formatting to instances, totals, or both. For more information, see [DataViewWildcard](utils-dataview.md#).

Make the following changes to the properties you want to apply conditional formatting to:

* Replace the `selector` value with the `dataViewWildcard.createDataViewWildcardSelector(dataViewWildcardMatchingOption)` call. `DataViewWildcardMatchingOption` defines whether conditional formatting is applied to instances, totals, or both.

* Add the `altConstantValueSelector` property with the value previously defined for the `selector` property.

#### [getFormattingModel API method](#tab/getFormattingModel)

For formatting properties that support conditional formatting, set the required instance kind in their `descriptor`.

```typescript
 
 public getFormattingModel(): powerbi.visuals.FormattingModel {
    // ...

    formattingGroup.slices.push(
        {
            uid: `colorSelector${barDataPoint_indx}_uid`,
            displayName: barDataPoint.category,
            control: {
                type: powerbi.visuals.FormattingComponent.ColorPicker,
                properties: {
                    descriptor: {
                        objectName: "colorSelector",
                        propertyName: "fill",                
                        // Define whether the conditional formatting will apply to instances, totals, or both
                        selector: dataViewWildcard.createDataViewWildcardSelector(dataViewWildcard.DataViewWildcardMatchingOption.InstancesAndTotals),

                        // Add this property with the value previously defined for the selector property
                        altConstantValueSelector: barDataPoint.selectionId.getSelector(),

                        instanceKind: powerbi.VisualEnumerationInstanceKinds.ConstantOrRule
                    },
                    value: { value: barDataPoint.color }
                }
            }
        }
    );

    // ...
 }
    
```

#### [enumerateObjectInstances API method - deprecated](#tab/enumerateObjectInstances)

List all the properties that want to support conditional formatting under the `propertyInstanceKind` array. Define these properties in the `enumerateObjectInstances` method.

```typescript
public enumerateObjectInstances(options: EnumerateVisualObjectInstancesOptions): VisualObjectInstanceEnumeration {
        …
        case 'colorSelector':
            …
                objectEnumeration.push({
                    objectName: objectName,
                    displayName: barDataPoint.category,
                    properties: {
                        fill: {
                            solid: {
                                color: barDataPoint.color
                            }
                        }
                    },
                    // Define whether the conditional formatting will apply to instances, totals, or both
                    selector: dataViewWildcard.createDataViewWildcardSelector(dataViewWildcard.DataViewWildcardMatchingOption.InstancesAndTotals),

                    // Add this property with the value previously defined for the selector property
                    altConstantValueSelector: barDataPoint.selectionId.getSelector(),

                    propertyInstanceKind: {
                        fill: VisualEnumerationInstanceKinds.ConstantOrRule
                    }
                });
            }
        …
}
```

---

## Considerations and limitations

Conditional formatting isn't supported for the following visuals:

* Table based visuals

* Matrix based visuals

We recommend that you don’t use conditional formatting with series. Instead, you should allow customers to format each series individually, making it easy to visually distinguish between series. Most out-of-the-box visuals with series, share this approach.

## Related content

[DataViewUtils](utils-dataview.md)
