---
title:  Introduction to use color utils in Power BI visual
description: This article describes how to use color utils simplify applying of themes and palettes on visual's data points on Power BI visuals
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 02/14/2020
---

# Color utils
This article will help you to install, import, and use color utils. This article describes how to use color utils simplify applying of themes and palettes on visual's data points on Power BI visuals.

## Requirements
To use the package you should have the following things:
* [node.js](https://nodejs.org) (we recommend the latest LTS version)
* [npm](https://www.npmjs.com/) (the minimal supported version is 3.0.0)
* The custom visual created by [PowerBI-visuals-tools](https://github.com/Microsoft/PowerBI-visuals-tools)

## Installation

> [!NOTE]
> If you continue to use the old version of powerbi-visuals-tools (version number less that 3.x.x) install the new version of the tools (3.x.x).

> [!IMPORTANT]
[Read more, how to update your visual's code to use with the latest tools](migrate-to-new-tools.md)

To install the package, you should run the following command in the directory with your current visual:

```bash
npm install powerbi-visuals-utils-colorutils --save
```
This command installs the package and adds a package as a dependency to your ```package.json```

Learn more about how to install the ColorUtils in your custom visuals:
* [Installation Guide](https://github.com/Microsoft/powerbi-visuals-utils-colorutils/blob/master/docs/usage/installation-guide.md)

## Usage

To user interactivity utils, you have to import the required component in the source code of the visual.
```typescript
import { ColorHelper } from "powerbi-visuals-utils-colorutils";
```

Learn how to install and use the ColorUtils in your custom visuals:

* [Usage Guide]
The Usage Guide describes a public API of the package. You will find a description and a few examples for each public interface of the package.

This package contains the following classes and modules:
* ColorHelper - helps to generate different colors for your chart values
* colorUtils - helps to convert color formats

### `ColorHelper` usage
The `ColorHelper` class provides the following functions and methods:

* The `getColorForSeriesValue` method gets the color for the given series value. If no explicit color or default color has been set then the color is allocated from the color scale for this series.
```typescript
getColorForSeriesValue(objects: IDataViewObjects, value: PrimitiveValue, themeColorName?: ThemeColorName): string;
```

* The  `getColorForMeasure` method gets the color for the given measure.
```typescript
 getColorForMeasure(objects: IDataViewObjects, measureKey: any, themeColorName?: ThemeColorName): string;
```
* The static `normalizeSelector` method returns the normalized selector
```typescript
static normalizeSelector(selector: Selector, isSingleSeries?: boolean): Selector;
```

* Methods `getThemeColor` and `getHighContrastColor` are both related to color theme colors.
Also `ColorHelper` has `isHighContrast` property that should be useful for check.

The `getThemeColor` method returns theme color
```typescript
 getThemeColor(themeColorName?: ThemeColorName): string;
```
 The `getHighContrastColor` method return color for high contrast mode
```typescript
getHighContrastColor(themeColorName?: ThemeColorName, defaultColor?: string): string;
```
Example related to high contrast mode usage:
```typescript

import { ColorHelper } from "powerbi-visuals-utils-colorutils";

export class MyVisual implements IVisual {
        private colorHelper: ColorHelper;

        private init(options: VisualConstructorOptions): void {
            this.colors = options.host.colorPalette;
            this.colorHelper = new ColorHelper(this.colors);
        } 

            private createViewport(element: HTMLElement): void {
                const fontColor: string = "#131aea";
                const axisBackgroundColor: string = this.colorHelper.getThemeColor();
                
                // some d3 code before
                d3ElementName.attr("fill", colorHelper.getHighContrastColor("foreground", fontColor);
            }
                
            public static parseSettings(dataView: DataView, colorHelper: ColorHelper): VisualSettings {
                // some code that should be applied on formatting settings
                if (colorHelper.isHighContrast) {
                        this.settings.fontColor = colorHelper.getHighContrastColor("foreground", this.settings.fontColor);
                    }
            }
}
```


### `ColorUtils` usage


## Contributing
* Read our [contribution guideline](https://github.com/Microsoft/powerbi-visuals-utils-colorutils/blob/master/CONTRIBUTING.md) to find out how to contribute bugs fixes and improvements
* [Issue Tracker](https://github.com/Microsoft/powerbi-visuals-utils-colorutils/issues)
* [Development workflow](https://github.com/Microsoft/powerbi-visuals-utils-colorutils/blob/master/docs/dev/development-workflow.md)
* [How to build](https://github.com/Microsoft/powerbi-visuals-utils-colorutils/blob/master/docs/dev/development-workflow.md#how-to-build)
* [How to run unit tests locally](https://github.com/Microsoft/powerbi-visuals-utils-colorutils/blob/master/docs/dev/development-workflow.md#how-to-run-unit-tests-locally)

## License
See the [LICENSE](https://github.com/Microsoft/powerbi-visuals-utils-colorutils/blob/master/LICENSE) file for license rights and limitations (MIT).