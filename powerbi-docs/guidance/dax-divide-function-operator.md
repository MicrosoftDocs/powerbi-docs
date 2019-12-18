---
title: "DAX: DIVIDE function vs divide operator (/)"
description: Guidance on when to use the DAX DIVIDE function.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 09/09/2019
ms.author: v-pemyer
---

# DAX: DIVIDE function vs divide operator (/)

As a data modeler, when you write a DAX expression to divide a numerator by a denominator, you can choose to use the [DIVIDE](/dax/divide-function-dax) function or the divide operator (/ - forward slash).

When using the DIVIDE function, you must pass in numerator and denominator expressions. Optionally, you can pass in a value that represents an _alternate result_.

```dax
DIVIDE(<numerator>, <denominator> [,<alternateresult>])
```

The DIVIDE function was designed to automatically handle division by zero cases. If an alternate result is not passed in, and the denominator is zero or BLANK, the function returns BLANK. When an alternate result is passed in, it's returned instead of BLANK.

The DIVIDE function is convenient because it saves your expression from having to first test the denominator value. The function is also better optimized for testing the denominator value than the [IF](/dax/if-function-dax) function. The performance gain is significant since checking for division by zero is expensive. Further using DIVIDE results in a more concise and elegant expression.

## Example

The following measure expression produces a safe division, but it involves using four DAX functions.

```dax
Profit Margin =
IF(
    OR(
        ISBLANK([Sales]),
        [Sales] == 0
    ),
    BLANK(),
    [Profit] / [Sales]
)
```

This measure expression achieves the same outcome, yet more efficiently and elegantly.

```dax
Profit Margin =
DIVIDE([Profit], [Sales])
```

## Recommendations

We recommend that you use the DIVIDE function whenever the denominator is an expression that _could_ return zero or BLANK.

In the case that the denominator is a constant value, we recommend that you use the divide operator. In this case, the division is guaranteed to succeed, and your expression will perform better because it will avoid unnecessary testing.

Carefully consider whether the DIVIDE function should return an alternate value. For measures, it's usually a better design that they return BLANK when a meaningful result cannot be evaluated. For more information, see [Avoid converting BLANKs to values](dax-avoid-converting-blank.md).

## Next steps

For more information about this article, check out the following resources:

- [Data Analysis Expressions (DAX) Reference](/dax/)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
