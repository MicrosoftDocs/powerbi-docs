---
title: "DAX: Appropriate use of error functions"
description: Guidance on when to use the DAX error functions.
author: peter-myers
manager: asaxton
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 09/26/2019
ms.author: v-pemyer
---
## DAX: Appropriate use of error functions

This article targets data modelers who define DAX expressions.

## Background

When writing a DAX expression that you might raise evaluation-time error, you can consider using two helpful DAX functions.

- The [ISERROR](/dax/iserror-function-dax) function, which takes a single expressions and returns TRUE if that expression results in error.
- The [IFERROR](/dax/iferror-function-dax) function, which takes two expressions. Should the first expression result in error, the value for the second expression is returned. It is in fact a more optimized implementation of nesting the ISERROR function inside an [IF](/dax/if-function-dax) function.

However, while these functions can be helpful and can contribute to writing easy-to-understand expressions, they can also significantly degrade the performance of calculations. This is because these functions increase the number of storage engine scans required.

Note that most evaluation-time errors are due to unexpected BLANKs or zero values, or invalid data type conversion.

## Recommendations

It is better to avoid using the ISERROR and IFERROR functions. Instead, apply defensive strategies when developing the model and writing expressions. These can include:

- **Ensuring quality data is loaded into the model:** Use Power Query transformations to remove or substitute invalid or missing values, and to set correct data types. A Power Query transformation can also be used to filter rows when errors, like invalid data conversion, occur.

    Data quality can also be controlled by setting the model column **Is Nullable** property to Off, which will fail the data refresh should BLANKs be encountered. Note that if this failure occurs, data loaded as a result of a successful refresh will remain in the tables.
- **Using the IF function:** The IF function logical test expression can be used to determine whether an error result would occur. Note, like the ISERROR and IFERROR functions, this function can result in additional storage engine scans, but will likely perform better than them as no error needs to be raised.
- **Using error-tolerant functions:** Some DAX functions will test and compensate for error conditions. These functions allow you to enter an alternate result that would be returned instead. The [DIVIDE](/dax/divide-function-dax) function is one such example. For additional guidance about this function, read the [DAX: DIVIDE function vs divide operator (/)](dax-divide-function-operator.md) article.

## Example

The following measure expression tests whether an error would be raised. It returns BLANK in this instance (which is the case when you do not provide the IF function with a value-if-false expression).
```dax
= IF(ISERROR([Profit] / [Sales]))
```
This next version of the measure expression has been improved by using the IFERROR function in place of the IF and ISERROR functions.
```dax
= IFERROR([Profit] / [Sales], BLANK())
```
However, this final version of the measure expression achieves the same outcome, yet more efficiently and elegantly.
```dax
= DIVIDE([Profit], [Sales])
```