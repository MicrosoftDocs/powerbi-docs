---
title: Introduction to use formatting utils in Power BI visual
description: Learn how to use formatting utils to format values and apply localization to values in Power BI visuals.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: rkarlin
manager: rkarlin
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: concept-article
ms.date: 01/06/2024
#customer intent: As a developer, I want to learn how to use formatting utils to format values and apply localization to values in Power BI visuals.
---

# Formatting utils

Formatting utils contain classes, interfaces, and methods to format values. It also contains extender methods to process strings and measure text size in an SVG/HTML document.

## Text measurement service

The module provides the following functions and interfaces:

### TextProperties interface

This interface describes common properties of the text.

```typescript
interface TextProperties {
    text?: string;
    fontFamily: string;
    fontSize: string;
    fontWeight?: string;
    fontStyle?: string;
    fontVariant?: string;
    whiteSpace?: string;
}
```

### measureSvgTextWidth

This function measures the width of the text with specific SVG text properties.

```typescript
function measureSvgTextWidth(textProperties: TextProperties, text?: string): number;
```

Example of using `measureSvgTextWidth`:

```typescript
import { textMeasurementService } from "powerbi-visuals-utils-formattingutils";
import TextProperties = textMeasurementService.TextProperties;
// ...

let textProperties: TextProperties = {
    text: "Microsoft PowerBI",
    fontFamily: "sans-serif",
    fontSize: "24px"
};

textMeasurementService.measureSvgTextWidth(textProperties);

// returns: 194.71875
```

### measureSvgTextRect

This function returns a rect with the given SVG text properties.

```typescript
function measureSvgTextRect(textProperties: TextProperties, text?: string): SVGRect;
```

Example of using `measureSvgTextRect`:

```typescript
import { textMeasurementService } from "powerbi-visuals-utils-formattingutils";
import TextProperties = textMeasurementService.TextProperties;
// ...

let textProperties: TextProperties = {
    text: "Microsoft PowerBI",
    fontFamily: "sans-serif",
    fontSize: "24px"
};

textMeasurementService.measureSvgTextRect(textProperties);

// returns: { x: 0, y: -22, width: 194.71875, height: 27 }
```

### measureSvgTextHeight

This function measures the height of the text with specific SVG text properties.

```typescript
function measureSvgTextHeight(textProperties: TextProperties, text?: string): number;
```

Example of using `measureSvgTextHeight`:

```typescript
import { textMeasurementService } from "powerbi-visuals-utils-formattingutils";
import TextProperties = textMeasurementService.TextProperties;
// ...


let textProperties: TextProperties = {
    text: "Microsoft PowerBI",
    fontFamily: "sans-serif",
    fontSize: "24px"
};

textMeasurementService.measureSvgTextHeight(textProperties);

// returns: 27
```

### estimateSvgTextBaselineDelta

This function returns a baseline of specific SVG text properties.

```typescript
function estimateSvgTextBaselineDelta(textProperties: TextProperties): number;
```

Example:

```typescript
import { textMeasurementService } from "powerbi-visuals-utils-formattingutils";
import TextProperties = textMeasurementService.TextProperties;
// ...

let textProperties: TextProperties = {
    text: "Microsoft PowerBI",
    fontFamily: "sans-serif",
    fontSize: "24px"
};

textMeasurementService.estimateSvgTextBaselineDelta(textProperties);

// returns: 5
```

### estimateSvgTextHeight

This function estimates the height of the text with specific SVG text properties.

```typescript
function estimateSvgTextHeight(textProperties: TextProperties, tightFightForNumeric?: boolean): number;
```

Example of using `estimateSvgTextHeight`:

```typescript
import { textMeasurementService } from "powerbi-visuals-utils-formattingutils";
import TextProperties = textMeasurementService.TextProperties;
// ...

let textProperties: TextProperties = {
    text: "Microsoft PowerBI",
    fontFamily: "sans-serif",
    fontSize: "24px"
};

textMeasurementService.estimateSvgTextHeight(textProperties);

// returns: 27
```

For an example, see [custom visual code](https://github.com/Microsoft/powerbi-visuals-sankey/blob/4d544ea145b4e15006083a3610dfead3da5f61a4/src/visual.ts#L372).

### measureSvgTextElementWidth

This function measures the width of the svgElement.

```typescript
function measureSvgTextElementWidth(svgElement: SVGTextElement): number;
```

Example of using measureSvgTextElementWidth:

```typescript
import { textMeasurementService } from "powerbi-visuals-utils-formattingutils";
// ...

let svg: D3.Selection = d3.select("body").append("svg");

svg.append("text")
    .text("Microsoft PowerBI")
    .attr({
        "x": 25,
        "y": 25
    })
    .style({
        "font-family": "sans-serif",
        "font-size": "24px"
    });

let textElement: D3.Selection = svg.select("text");

textMeasurementService.measureSvgTextElementWidth(textElement.node());

// returns: 194.71875
```

### getMeasurementProperties

This function fetches the text measurement properties of the given DOM element.

```typescript
function getMeasurementProperties(element: Element): TextProperties;
```

Example of using `getMeasurementProperties`:

```typescript
import { textMeasurementService } from "powerbi-visuals-utils-formattingutils";
// ...

let element: JQuery = $(document.createElement("div"));

element.text("Microsoft PowerBI");

element.css({
    "width": 500,
    "height": 500,
    "font-family": "sans-serif",
    "font-size": "32em",
    "font-weight": "bold",
    "font-style": "italic",
    "white-space": "nowrap"
});

textMeasurementService.getMeasurementProperties(element.get(0));

/* returns: {
    fontFamily:"sans-serif",
    fontSize: "32em",
    fontStyle: "italic",
    fontVariant: "",
    fontWeight: "bold",
    text: "Microsoft PowerBI",
    whiteSpace: "nowrap"
}*/
```

### getSvgMeasurementProperties

This function fetches the text measurement properties of the given SVG text element.

```typescript
function getSvgMeasurementProperties(svgElement: SVGTextElement): TextProperties;
```

Example of using `getSvgMeasurementProperties`:

```typescript
import { textMeasurementService } from "powerbi-visuals-utils-formattingutils";
// ...

let svg: D3.Selection = d3.select("body").append("svg");

let textElement: D3.Selection = svg.append("text")
    .text("Microsoft PowerBI")
    .attr({
        "x": 25,
        "y": 25
    })
    .style({
        "font-family": "sans-serif",
        "font-size": "24px"
    });

textMeasurementService.getSvgMeasurementProperties(textElement.node());

/* returns: {
    "text": "Microsoft PowerBI",
    "fontFamily": "sans-serif",
    "fontSize": "24px",
    "fontWeight": "normal",
    "fontStyle": "normal",
    "fontVariant": "normal",
    "whiteSpace": "nowrap"
}*/
```

## getDivElementWidth

This function returns the width of a div element.

```typescript
function getDivElementWidth(element: JQuery): string;
```

Example of using `getDivElementWidth`:

```typescript
import { textMeasurementService } from "powerbi-visuals-utils-formattingutils";
// ...

let svg: Element = d3.select("body")
    .append("div")
    .style({
        "width": "150px",
        "height": "150px"
    })
    .node();

textMeasurementService.getDivElementWidth(svg)

// returns: 150px
```

### getTailoredTextOrDefault

Compares a label's text size to the available size, and renders ellipses when the available size is smaller.

```typescript
function getTailoredTextOrDefault(textProperties: TextProperties, maxWidth: number): string;
```

Example of using `getTailoredTextOrDefault`:

```typescript
import { textMeasurementService } from "powerbi-visuals-utils-formattingutils";
import TextProperties = textMeasurementService.TextProperties;
// ...

let textProperties: TextProperties = {
    text: "Microsoft PowerBI!",
    fontFamily: "sans-serif",
    fontSize: "24px"
};

textMeasurementService.getTailoredTextOrDefault(textProperties, 100);

// returns: Micros...
```

## String extensions

The module provides the following functions:

## endsWith

This function checks if a string ends with a substring.

```typescript
function endsWith(str: string, suffix: string): boolean;
```

Example of using `endsWith`:

```typescript
import { stringExtensions } from "powerbi-visuals-utils-formattingutils";
// ...

stringExtensions.endsWith("Power BI", "BI");

// returns: true
```

### equalIgnoreCase

This function compares strings, ignoring case.

```typescript
function equalIgnoreCase(a: string, b: string): boolean;
```

Example of using `equalIgnoreCase`:

```typescript
import { stringExtensions } from "powerbi-visuals-utils-formattingutils";
// ...

stringExtensions.equalIgnoreCase("Power BI", "power bi");

// returns: true
```

### startsWith

This function checks if a string starts with a substring.

```typescript
function startsWith(a: string, b: string): boolean;
```

Example of using `startsWith`:

```typescript
import { stringExtensions } from "powerbi-visuals-utils-formattingutils";
// ...

stringExtensions.startsWith("Power BI", "Power");

// returns: true
```

### contains

This function checks if a string contains a specified substring.

```typescript
function contains(source: string, substring: string): boolean;
```

Example of using `contains` method:

```typescript
import { stringExtensions } from "powerbi-visuals-utils-formattingutils";
// ...

stringExtensions.contains("Microsoft Power BI Visuals", "Power BI");

// returns: true
```

### isNullOrEmpty

Checks if a string is null or undefined or empty.

```typescript
function isNullOrEmpty(value: string): boolean;
```

Example of `isNullOrEmpty` method:

```typescript
import { stringExtensions } from "powerbi-visuals-utils-formattingutils";
// ...

stringExtensions.isNullOrEmpty(null);

// returns: true
```

## Value formatter

The module provides the following functions, interfaces, and classes:

## IValueFormatter

This interface describes public methods and properties of the formatter.

```typescript
interface IValueFormatter {
    format(value: any): string;
    displayUnit?: DisplayUnit;
    options?: ValueFormatterOptions;
}
```

### IValueFormatter.format

This method formats the specified value.

```typescript
function format(value: any, format?: string, allowFormatBeautification?: boolean): string;
```

Examples for `IValueFormatter.format`:

#### The thousand formats

```typescript
import { valueFormatter } from "powerbi-visuals-utils-formattingutils";

let iValueFormatter = valueFormatter.create({ value: 1001 });

iValueFormatter.format(5678);

// returns: "5.68K"
```

#### The million formats

```typescript
import { valueFormatter } from "powerbi-visuals-utils-formattingutils";

let iValueFormatter = valueFormatter.create({ value: 1e6 });

iValueFormatter.format(1234567890);

// returns: "1234.57M"
```

#### The billion formats

```typescript
import { valueFormatter } from "powerbi-visuals-utils-formattingutils";

let iValueFormatter = valueFormatter.create({ value: 1e9 });

iValueFormatter.format(1234567891236);

// returns: 1234.57bn
```

#### The trillion format

```typescript
import { valueFormatter } from "powerbi-visuals-utils-formattingutils";

let iValueFormatter = valueFormatter.create({ value: 1e12 });

iValueFormatter.format(1234567891236);

// returns: 1.23T
```

#### The exponent format

```typescript
import { valueFormatter } from "powerbi-visuals-utils-formattingutils";

let iValueFormatter = valueFormatter.create({ format: "E" });

iValueFormatter.format(1234567891236);

// returns: 1.234568E+012
```

### The culture selector

```typescript
import { valueFormatter } from "powerbi-visuals-utils-formattingutils";

let valueFormatterUK = valueFormatter.create({ cultureSelector: "en-GB" });

valueFormatterUK.format(new Date(2007, 2, 3, 17, 42, 42));

// returns: 03/03/2007 17:42:42

let valueFormatterUSA = valueFormatter.create({ cultureSelector: "en-US" });

valueFormatterUSA.format(new Date(2007, 2, 3, 17, 42, 42));

// returns: 3/3/2007 5:42:42 PM
```

#### The percentage format

```typescript
import { valueFormatter } from "powerbi-visuals-utils-formattingutils";

let iValueFormatter = valueFormatter.create({ format: "0.00 %;-0.00 %;0.00 %" });

iValueFormatter.format(0.54);

// returns: 54.00 %
```

#### The dates format

```typescript
import { valueFormatter } from "powerbi-visuals-utils-formattingutils";

let date = new Date(2016, 10, 28, 15, 36, 0),
    iValueFormatter = valueFormatter.create({});

iValueFormatter.format(date);

// returns: 11/28/2016 3:36:00 PM
```

#### The boolean format

```typescript
import { valueFormatter } from "powerbi-visuals-utils-formattingutils";

let iValueFormatter = valueFormatter.create({});

iValueFormatter.format(true);

// returns: True
```

#### The customized precision

```typescript
import { valueFormatter } from "powerbi-visuals-utils-formattingutils";

let iValueFormatter = valueFormatter.create({ value: 0, precision: 3 });

iValueFormatter.format(3.141592653589793);

// returns: 3.142
```

For an example, see [custom visual code](https://github.com/Microsoft/powerbi-visuals-sankey/blob/4d544ea145b4e15006083a3610dfead3da5f61a4/src/visual.ts#L359).

## ValueFormatterOptions

This interface describes `options` of the IValueFormatter and options of `create` function.

```typescript
import { valueFormatter } from "powerbi-visuals-utils-formattingutils";
import ValueFormatterOptions = valueFormatter.ValueFormatterOptions;

interface ValueFormatterOptions {
    /** The format string to use. */
    format?: string;
    /** The data value. */
    value?: any;
    /** The data value. */
    value2?: any;
    /** The number of ticks. */
    tickCount?: any;
    /** The display unit system to use */
    displayUnitSystemType?: DisplayUnitSystemType;
    /** True if we are formatting single values in isolation (e.g. card), as opposed to multiple values with a common base (e.g. chart axes) */
    formatSingleValues?: boolean;
    /** True if we want to trim off unnecessary zeroes after the decimal and remove a space before the % symbol */
    allowFormatBeautification?: boolean;
    /** Specifies the maximum number of decimal places to show*/
    precision?: number;
    /** Detect axis precision based on value */
    detectAxisPrecision?: boolean;
    /** Specifies the column type of the data value */
    columnType?: ValueTypeDescriptor;
    /** Specifies the culture */
    cultureSelector?: string;
}
```

## create

This method creates an instance of IValueFormatter.

```typescript
import { valueFormatter } from "powerbi-visuals-utils-formattingutils";
import create = valueFormatter.create;

function create(options: ValueFormatterOptions): IValueFormatter;
```

### Example of using create

```typescript
import { valueFormatter } from "powerbi-visuals-utils-formattingutils";

valueFormatter.create({});

// returns: an instance of IValueFormatter.
```

## format

Alternative way to format the value without creating `IValueFormatter`. Useful for cases with [dynamic formats string](./dynamic-format.md)

```typescript
import { format } from "powerbi-visuals-utils-formattingutils";
import format = valueFormatter.format;

function format(value: any, format?: string, allowFormatBeautification?: boolean, cultureSelector?: string): string;
```

### Example of using format

```typescript
import { valueFormatter } from "powerbi-visuals-utils-formattingutils";

const value = 12
const format = '¥ #,0'
valueFormatter.format(value, format);

// returns: formatted value as string (¥ 12)
```

## Related content

[Add the local language to your Power BI visual](localization.md)  
