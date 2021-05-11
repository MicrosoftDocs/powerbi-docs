---
title: Power BI visuals display warning icon
description: Learn how to add a display warning icon to your Power BI visual.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
featuredvideoid: ''
ms.service: powerbi
ms.topic: how-to
ms.subservice: powerbi-custom-visuals
ms.date: 05/11/2021
---

# Add a display warning icon to your visual

In a Power BI visual, a display warning icon can notify the user of a possible problem or an error. Display warning icons can be useful in many cases, here are a few examples:

* A map  visual can display a warning icon when values are outside the latitude or longitude valid range.

* A pie chart visual can display a warning icon when it's displaying negative values that are mixed with positive ones.

* A cartesian chart can display a warning icon when infinity values are calculated. For example, if **Y** is zero, when dividing **X** by **Y** the result is infinity.

When the icon appears, the user can hover over it to see the title of the warning message.

:::image type="content" source="media/visual-display-warning-icon/warning-icon.png" alt-text="A screenshot showing a warning icon in a Power B I visual.":::

When the user selects the warning icon, a message describing the problem appears in a pop-up window.

:::image type="content" source="media/visual-display-warning-icon/warning-message.png" alt-text="A screenshot showing a warning message triggered by selecting a warning icon in a Power B I visual.":::

## Create a warning icon

You can create a warning icon with a customized message for the visual you're designing. The decision whether to raise the warning icon or not is up to you. As demonstrated by the examples below, the visual continues to function when the warning icon is displayed.

### Add a call to the update method

To add a display warning icon to your visual, you first need to invoke the `displayWarningIcon` method. The method is part of `IVisualHost` and is exposed using `powerbi-visuals-api`.

Add the following import to your file:

```javascript
import powerbiVisualsApi from "powerbi-visuals-api"; 
```

After adding the import, you'll need to add a condition that will determine when to display the warning icon. Use the examples below to view two optional conditions. The full code for these examples is available in [barChart.ts](https://github.com/microsoft/PowerBI-visuals-sampleBarChart/blob/master/src/barChart.ts), which is part of the [PowerBI-visuals-sampleBarChart](https://github.com/microsoft/PowerBI-visuals-sampleBarChart)  repository.

### Example 1 - Check language compatibility

Localization is used to display visuals in the customer's native language, which is determent by the operating system's settings.

In this example, the visual compares the language of the visual (set to US English) to the language of the operating system. If the languages don't match, the warning icon is displayed.

```javascript
if (this.locale != 'en-US') { 

            this.host.displayWarningIcon('Language mismatch', 'This visual does not support languages other than english. Please use US english as your browser language.'); 

        }
```

:::image type="content" source="media/visual-display-warning-icon/language-mismatch.png" alt-text="A screenshot showing the language mismatch warning message.":::

### Example 2 - Compare colors in adjacent columns  

In this example, the display warning icon appears when two columns that are next to each other, have the same color.

The `getColumnColorByIndex` method iterates through all the columns. If two adjacent columns have the same color, a warning icon is displayed.  

```javascript
let category = options.dataViews[0].categorical.categories[0]; 

let dataValue = options.dataViews[0].categorical.values[0]; 

let colorPalette = this.host.colorPalette; 

for (let i = 0, len = Math.max(category.values.length, dataValue.values.length); i < len-1; i++) { 

    const color1: string = getColumnColorByIndex(category, i, colorPalette); 

    const color2: string = getColumnColorByIndex(category, i+1, colorPalette); 

    if (color1 == color2) { 

        this.host.displayWarningIcon('same colors', 'there are two neighbor columns with the same color. please use the data color property to change it.'); 

    } 

} 
```

## Considerations

* Errors or warnings that are not caused by the visual, for example the *Too many values. Not showing all data* error which is derived from the Power BI service, get propagated prior to your visual’s calls and take precedence over errors that originate from your visual's code. If an error occurs while loading data, before the visual's code is run and the display warning icon condition is met, it will be displayed instead of the display warning icon error. 

* The display warning is cleared during each rendering of the visual, for example, when new data is dragged into the visual. The visual's `update()` method is invoked after the visual is rendered. Therefore, if the visual's warning is raised based on a condition that's checked in the update method, each time the visual is rendered, if the condition is met the warning will be displayed again.

* Resizing a visual doesn't affect the warning icon.

## Limitations

The following limitations refer to the display icon text:

* The maximum length of the title is 70 characters

* The maximum length of the text is 2,000 characters

* The text is only displayed as plain text

## Next steps

>[!div class="nextstepaction"]
>[DataViewUtils](utils-dataview.md)
