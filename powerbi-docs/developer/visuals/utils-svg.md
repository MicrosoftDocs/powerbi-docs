---
title: Introduction to SVG utils in Power BI visuals
description: Learn about the SVG utils package and see examples of how you can use them to simplify SVG manipulations for Power BI visuals.
author: mberdugo
ms.author: monaberdugo
manager: rkarlin
ms.reviewer: tebercov 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: concept-article
ms.date: 01/10/2024
#customer intent: As a developer, I want to learn about the SVG utils package and see examples of how I can use them to simplify SVG manipulations for Power BI visuals.
---

# SVG utils

SVGUtils is a set of functions and classes to simplify SVG manipulations for Power BI visuals.

## Installation

To install the package, you should run the following command in the directory with your current visual:

```bash
npm install powerbi-visuals-utils-svgutils --save
```

## CssConstants

The `CssConstants` module provides the special function and interface to work with class selectors.

The `powerbi.extensibility.utils.svg.CssConstants` module provides the following function and interface:

## ClassAndSelector

This interface describes common properties of the class selector.

```typescript
interface ClassAndSelector {
  class: string;
  selector: string;
}
```

### createClassAndSelector

This function creates an instance of ClassAndSelector with the name of the class.

```typescript
function createClassAndSelector(className: string): ClassAndSelector;
```

Example:

```typescript
import { CssConstants } from "powerbi-visuals-utils-svgutils";
import createClassAndSelector = CssConstants.createClassAndSelector;
import ClassAndSelector = CssConstants.ClassAndSelector;

let divSelector: ClassAndSelector = createClassAndSelector("sample-block");

divSelector.selector === ".sample-block"; // returns: true
divSelector.class === "sample-block"; // returns: true
```

## manipulation

The `manipulation` method provides some special functions to generate strings that you can use with the SVG transform property.

The module provides the following functions:

### translate

This function creates a translate string for use with the SVG transform property.

```typescript
function translate(x: number, y: number): string;
```

Example:

```typescript
import { manipulation } from "powerbi-visuals-utils-svgutils";
// ...

manipulation.translate(100, 100);

// returns: translate(100,100)
```

### translateXWithPixels

This function creates a translateX string for use with the SVG transform property.

```typescript
function translateXWithPixels(x: number): string;
```

Example:

```typescript
import { manipulation } from "powerbi-visuals-utils-svgutils";
// ...

manipulation.translateXWithPixels(100);

// returns: translateX(100px)
```

### translateWithPixels

This function creates a translate string for use with the SVG transform property.

```typescript
function translateWithPixels(x: number, y: number): string;
```

Example:

```typescript
import { manipulation } from "powerbi-visuals-utils-svgutils";
// ...

manipulation.translateWithPixels(100, 100);

// returns: translate(100px,100px)
```

### translateAndRotate

This function creates a translate-rotate string for use with the SVG transform property.

```typescript
function translateAndRotate(
  x: number,
  y: number,
  px: number,
  py: number,
  angle: number
): string;
```

Example:

```typescript
import { manipulation } from "powerbi-visuals-utils-svgutils";
// ...

manipulation.translateAndRotate(100, 100, 50, 50, 35);

// returns: translate(100,100) rotate(35,50,50)
```

### scale

This function creates a scale string for use in a CSS transform property.

```typescript
function scale(scale: number): string;
```

Example:

```typescript
import { manipulation } from "powerbi-visuals-utils-svgutils";
// ...

manipulation.scale(50);

// returns: scale(50)
```

### transformOrigin

This function creates a transform-origin string for use in a CSS transform-origin property.

```typescript
function transformOrigin(xOffset: string, yOffset: string): string;
```

Example:

```typescript
import { manipulation } from "powerbi-visuals-utils-svgutils";
// ...

manipulation.transformOrigin(5, 5);

// returns: 5 5
```

### flushAllD3Transitions

This function forces every transition of D3 to complete.

```typescript
function flushAllD3Transitions(): void;
```

Example:

```typescript
import { manipulation } from "powerbi-visuals-utils-svgutils";
// ...

manipulation.flushAllD3Transitions();

// forces every transition of D3 to complete
```

### parseTranslateTransform

This function parses the transform string with value "translate(x,y)".

```typescript
function parseTranslateTransform(input: string): { x: string; y: string };
```

Example:

```typescript
import { manipulation } from "powerbi-visuals-utils-svgutils";
// ...

manipulation.parseTranslateTransform("translate(100px,100px)");

// returns: { "x":"100px", "y":"100px" }
```

### createArrow

This function creates an arrow.

```typescript
function createArrow(
  width: number,
  height: number,
  rotate: number
): { path: string; transform: string };
```

Example:

```typescript
import { manipulation } from "powerbi-visuals-utils-svgutils";
// ...

manipulation.createArrow(10, 20, 5);

/* returns: {
    "path": "M0 0L0 20L10 10 Z",
    "transform": "rotate(5 5 10)"
}*/
```

## Rect

The `Rect` module provides some special functions to manipulate rectangles.

The module provides the following functions:

### getOffset

This function returns an offset of the rectangle.

```typescript
function getOffset(rect: IRect): IPoint;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.getOffset({ left: 25, top: 25, width: 100, height: 100 });

/* returns: {
    x: 25,
    y: 25
}*/
```

### getSize

This function returns the size of the rectangle.

```typescript
function getSize(rect: IRect): ISize;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.getSize({ left: 25, top: 25, width: 100, height: 100 });

/* returns: {
    width: 100,
    height: 100
}*/
```

### setSize

This function modifies the size of the rectangle.

```typescript
function setSize(rect: IRect, value: ISize): void;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

let rectangle = { left: 25, top: 25, width: 100, height: 100 };

Rect.setSize(rectangle, { width: 250, height: 250 });

// rectangle === { left: 25, top: 25, width: 250, height: 250 }
```

### right

This function returns a right position of the rectangle.

```typescript
function right(rect: IRect): number;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.right({ left: 25, top: 25, width: 100, height: 100 });

// returns: 125
```

### bottom

This function returns a bottom position of the rectangle.

```typescript
function bottom(rect: IRect): number;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.bottom({ left: 25, top: 25, width: 100, height: 100 });

// returns: 125
```

### topLeft

This function returns a top-left position of the rectangle.

```typescript
function topLeft(rect: IRect): IPoint;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.topLeft({ left: 25, top: 25, width: 100, height: 100 });

// returns: { x: 25, y: 25 }
```

### topRight

This function returns a top-right position of the rectangle.

```typescript
function topRight(rect: IRect): IPoint;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.topRight({ left: 25, top: 25, width: 100, height: 100 });

// returns: { x: 125, y: 25 }
```

### bottomLeft

This function returns a bottom-left position of the rectangle.

```typescript
function bottomLeft(rect: IRect): IPoint;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.bottomLeft({ left: 25, top: 25, width: 100, height: 100 });

// returns: { x: 25, y: 125 }
```

### bottomRight

This function returns a bottom-right position of the rectangle.

```typescript
function bottomRight(rect: IRect): IPoint;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.bottomRight({ left: 25, top: 25, width: 100, height: 100 });

// returns: { x: 125, y: 125 }
```

### clone

This function creates a copy of the rectangle.

```typescript
function clone(rect: IRect): IRect;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.clone({ left: 25, top: 25, width: 100, height: 100 });

/* returns: {
    left: 25, top: 25, width: 100, height: 100}
*/
```

### toString

This function converts the rectangle to a string.

```typescript
function toString(rect: IRect): string;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.toString({ left: 25, top: 25, width: 100, height: 100 });

// returns: {left:25, top:25, width:100, height:100}
```

### offset

This function applies an offset to the rectangle.

```typescript
function offset(rect: IRect, offsetX: number, offsetY: number): IRect;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.offset({ left: 25, top: 25, width: 100, height: 100 }, 50, 50);

/* returns: {
    left: 75,
    top: 75,
    width: 100,
    height: 100
}*/
```

### add

This function adds the first rectangle to the second rectangle.

```typescript
function add(rect: IRect, rect2: IRect): IRect;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.add(
  { left: 25, top: 25, width: 100, height: 100 },
  { left: 50, top: 50, width: 75, height: 75 }
);

/* returns: {
    left: 75,
    top: 75,
    height: 175,
    width: 175
}*/
```

### getClosestPoint

This function returns the closest point on the rectangle to a specific point.

```typescript
function getClosestPoint(rect: IRect, x: number, y: number): IPoint;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.getClosestPoint({ left: 0, top: 0, width: 100, height: 100 }, 50, 50);

/* returns: {
    x: 50,
    y: 50
}*/
```

### equal

This function compares rectangles and returns true if they're the same.

```typescript
function equal(rect1: IRect, rect2: IRect): boolean;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.equal(
  { left: 0, top: 0, width: 100, height: 100 },
  { left: 50, top: 50, width: 100, height: 100 }
);

// returns: false
```

### equalWithPrecision

This function compares rectangles by considering precision of the values.

```typescript
function equalWithPrecision(rect1: IRect, rect2: IRect): boolean;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.equalWithPrecision(
  { left: 0, top: 0, width: 100, height: 100 },
  { left: 50, top: 50, width: 100, height: 100 }
);

// returns: false
```

### isEmpty

This function checks if a rectangle is empty.

```typescript
function isEmpty(rect: IRect): boolean;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.isEmpty({ left: 0, top: 0, width: 0, height: 0 });

// returns: true
```

### containsPoint

This function checks if a rectangle contains a specific point.

```typescript
function containsPoint(rect: IRect, point: IPoint): boolean;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.containsPoint(
  { left: 0, top: 0, width: 100, height: 100 },
  { x: 50, y: 50 }
);

// returns: true
```

### isIntersecting

This function checks if rectangles are intersecting.

```typescript
function isIntersecting(rect1: IRect, rect2: IRect): boolean;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.isIntersecting(
  { left: 0, top: 0, width: 100, height: 100 },
  { left: 0, top: 0, width: 50, height: 50 }
);

// returns: true
```

### intersect

This function returns an intersection of rectangles.

```typescript
function intersect(rect1: IRect, rect2: IRect): IRect;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.intersect(
  { left: 0, top: 0, width: 100, height: 100 },
  { left: 0, top: 0, width: 50, height: 50 }
);

/* returns: {
    left: 0,
    top: 0,
    width: 50,
    height: 50
}*/
```

### combine

This function combines rectangles.

```typescript
function combine(rect1: IRect, rect2: IRect): IRect;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.combine(
  { left: 0, top: 0, width: 100, height: 100 },
  { left: 0, top: 0, width: 50, height: 120 }
);

/* returns: {
    left: 0,
    top: 0,
    width: 100,
    height: 120
}*/
```

### getCentroid

This function returns a center point of the rectangle.

```typescript
function getCentroid(rect: IRect): IPoint;
```

Example:

```typescript
import { shapes } from "powerbi-visuals-utils-svgutils";
import Rect = shapes.Rect;
// ...

Rect.getCentroid({ left: 0, top: 0, width: 100, height: 100 });

/* returns: {
    x: 50,
    y: 50
}*/
```
