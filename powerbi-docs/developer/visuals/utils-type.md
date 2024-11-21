---
title: Introduction to use type utils in Power BI visual
description: This article describes how to use SVG utils to extend the basic types for Power BI visuals and provides examples for each function.
author: mberdugo
ms.author: monaberdugo
manager: rkarlin
ms.reviewer: tebercov 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: concept-article
ms.date: 01/04/2024
#customer intent: As a developer, I want to understand how to use type utils to enhance my Power BI visuals.
---

# Type utils

TypeUtils is a set of functions and classes to extend the basic types for Power BI visuals.

## Installation

To install the package, run the following command in the directory with your current custom visual:

`npm install powerbi-visuals-utils-typeutils --save`

This command installs the package and adds a package as a dependency to your `package.json` file.

## Double

The `Double` module provides abilities to manipulate precision of the numbers.

It provides the following functions:

### pow10

This function returns power of 10.

```typescript
function pow10(exp: number): number;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.pow10(25);

// returns: 1e+25
```

### log10

This function returns a 10 base logarithm of the number.

```typescript
function log10(val: number): number;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.log10(25);

// returns: 1
```

## getPrecision

This function returns a power of 10 representing precision of the number.

```typescript
function getPrecision(x: number, decimalDigits?: number): number;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.getPrecision(562344, 6);

// returns: 0.1
```

### equalWithPrecision

This function checks if a delta between two numbers is less than provided precision.

```typescript
function equalWithPrecision(x: number, y: number, precision?: number): boolean;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.equalWithPrecision(1, 1.005, 0.01);

// returns: true
```

### lessWithPrecision

This function checks if the first value is less than the second value.

```typescript
function lessWithPrecision(x: number, y: number, precision?: number): boolean;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.lessWithPrecision(0.995, 1, 0.001);

// returns: true
```

### lessOrEqualWithPrecision

This function checks if the first value is less than or equal to the second value.

```typescript
function lessOrEqualWithPrecision(x: number, y: number, precision?: number): boolean;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.lessOrEqualWithPrecision(1.005, 1, 0.01);

// returns: true
```

### greaterWithPrecision

This function checks if the first value is greater than the second value.

```typescript
function greaterWithPrecision(x: number, y: number, precision?: number): boolean;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.greaterWithPrecision(1, 0.995, 0.01);

// returns: false
```

### greaterOrEqualWithPrecision

This function checks if the first value is greater than or equal to the second value.

```typescript
function greaterOrEqualWithPrecision(x: number, y: number, precision?: number): boolean;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.greaterOrEqualWithPrecision(1, 1.005, 0.01);

// returns: true
```

### floorWithPrecision

This function floors the number with the provided precision.

```typescript
function floorWithPrecision(x: number, precision?: number): number;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.floorWithPrecision(5.96, 0.001);

// returns: 5
```

### ceilWithPrecision

This function `ceils` the number with the provided precision.

```typescript
function ceilWithPrecision(x: number, precision?: number): number;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.ceilWithPrecision(5.06, 0.001);

// returns: 6
```

### floorToPrecision

This function floors the number to the provided precision.

```typescript
function floorToPrecision(x: number, precision?: number): number;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.floorToPrecision(5.96, 0.1);

// returns: 5.9
```

### ceilToPrecision

This function `ceils` the number to the provided precision.

```typescript
function ceilToPrecision(x: number, precision?: number): number;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.ceilToPrecision(-506, 10);

// returns: -500
```

### roundToPrecision

This function rounds the number to the provided precision.

```typescript
function roundToPrecision(x: number, precision?: number): number;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.roundToPrecision(596, 10);

// returns: 600
```

### ensureInRange

This function returns a number that is between min and max.

```typescript
function ensureInRange(x: number, min: number, max: number): number;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.ensureInRange(-27.2, -10, -5);

// returns: -10
```

### round

This function rounds the number.

```typescript
function round(x: number): number;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.round(27.45);

// returns: 27
```

### removeDecimalNoise

This function rounds the number to eliminate some decimal spaces.

```typescript
function removeDecimalNoise(value: number): number;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.removeDecimalNoise(21.493000000000002);

// returns: 21.493
```

### isInteger

This function checks if the number is an integer.

```typescript
function isInteger(value: number): boolean;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.isInteger(21.493000000000002);

// returns: false
```

### toIncrement

This function increments the number by the provided number and returns the rounded number.

```typescript
function toIncrement(value: number, increment: number): number;
```

Example:

```typescript
import { double } from "powerbi-visuals-utils-typeutils";
// ...

double.toIncrement(0.6383723, 0.05);

// returns: 0.65
```

## Prototype

The `Prototype` module provides the ability to inherit objects.

It provides the following functions:

## inherit

This function returns a new object with the provided object as its prototype.

```typescript
function inherit<T>(obj: T, extension?: (inherited: T) => void): T;
```

Example:

```typescript
import { prototype } from "powerbi-visuals-utils-typeutils";
// ...

let base = { Microsoft: "Power BI" };

prototype.inherit(base);

/* returns: {
    __proto__: {
        Microsoft: "Power BI"
    }
}*/
```

## inheritSingle

This function returns a new object with the provided object as its prototype if, and only if, the prototype hasn't been set.

```typescript
function inheritSingle<T>(obj: T): T;
```

Example:

```typescript
import { prototype } from "powerbi-visuals-utils-typeutils";
// ...

let base = { Microsoft: "Power BI" };

prototype.inheritSingle(base);

/* returns: {
    __proto__: {
        Microsoft: "Power BI"
    }
}*/
```

## PixelConverter

The `PixelConverter` module provides the ability to convert pixels to points, and points to pixels.

It provides the following functions:

## toString

This function converts the pixel value to a string.

```typescript
function toString(px: number): string;
```

Example:

```typescript
import { pixelConverter } from "powerbi-visuals-utils-typeutils";
// ...

pixelConverter.toString(25);

// returns: 25px
```

## fromPoint

This function converts the provided point value to the pixel value and returns the string interpretation.

```typescript
function fromPoint(pt: number): string;
```

Example:

```typescript
import { pixelConverter } from "powerbi-visuals-utils-typeutils";
// ...

pixelConverter.fromPoint(8);

// returns: 33.33333333333333px
```

## fromPointToPixel

This function converts the provided point value to the pixel value.

```typescript
function fromPointToPixel(pt: number): number;
```

Example:

```typescript
import { pixelConverter } from "powerbi-visuals-utils-typeutils";
// ...

pixelConverter.fromPointToPixel(8);

// returns: 10.666666666666666
```

## toPoint

This function converts the pixel value to the point value.

```typescript
function toPoint(px: number): number;
```

Example:

```typescript
import { pixelConverter } from "powerbi-visuals-utils-typeutils";
// ...

pixelConverter.toPoint(8);

// returns: 6
```
