---
title: "DAX: Use SELECTEDVALUE instead of VALUES"
description: Guidance on when to use the SELECTEDVALUE functions.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 11/20/2019
ms.author: v-pemyer
---

# DAX: Use SELECTEDVALUE instead of VALUES

This article targets data modelers developing models in Power BI Desktop.

## Background

Sometimes you might need to write a DAX expression that tests whether a column is filtered by a specific value. In earlier versions of DAX this can be safely achieved by using a pattern involving three DAX functions. The functions are [IF](/dax/if-function-dax), [HASONEVALUE](/dax/hasonevalue-function-dax) and [VALUES](/dax/values-function-dax).

The following measure definition presents an example. It calculates the sales tax amount, but only for sales made to Australian customers.

```dax
Australian Sales Tax =
IF(
    HASONEVALUE(Customer[Country-Region]),
    IF(
        VALUES(Customer[Country-Region]) = "Australia",
        [Sales] * 0.10
    )
)
```

In the example, the HASONEVALUE function returns TRUE only when a single value is used to filter the **Country-Region** column. When it is TRUE, the VALUES function is compared to the literal text "Australia". When the VALUES function returns TRUE, the **Sales** measure is multiplied by 0.10 (representing 10%). If the HASONEVALUE function returns FALSE—because more than one value filters the column—the IF function returns BLANK.

The use of the HASONVALUE is a defensive technique. It's required because it may be possible that multiple values filter the **Country-Region** column. In this case, the VALUES function returns a table of multiple rows. Comparing a table of multiple rows to a constant value will result in an error.

## Recommendation

We recommend that you use the [SELECTEDVALUE](/dax/selectedvalue-function) function. It achieves the same outcome as the pattern described in this article, yet more efficiently and elegantly.

Using the SELECTEDVALUE function, the example measure definition is now rewritten.

```dax
Australian Sales Tax =
IF(
    SELECTEDVALUE(Geography[Country-Region]) = "Australia",
    [Sales] * 0.10
)
```

You can leverage an additional benefit of the SELECTEDVALUE function. You can also pass an _alternate result_ value into the SELECTEDVALUE function. The alternate result value is returned when either no filters—or multiple filters—are applied to the column.
