---
title: "DAX: Avoid using FILTER as a filter argument"
description: Guidance on using the FILTER function as a filter argument.
author: peter-myers
ms.author: kfollis
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 12/30/2019
---

# DAX: Avoid using FILTER as a filter argument

As a data modeler, it's common you'll write DAX expressions that need to be evaluated in a modified filter context. For example, you can write a measure definition to calculate sales for "high margin products". We'll describe this calculation later in this article.

> [!NOTE]
> This article is especially relevant for model calculations that apply filters to Import tables.

The [CALCULATE](/dax/calculate-function-dax) and [CALCULATETABLE](/dax/calculatetable-function-dax) DAX functions are important and useful functions. They let you write calculations that remove or add filters, or modify relationship paths. It's done by passing in filter arguments, which are either Boolean expressions, table expressions, or special filter functions. We'll only discuss Boolean and table expressions in this article.

Consider the following measure definition, which calculates red product sales by using a table expression. It will replace any filters that might be applied to the **Product** table.

```dax
Red Sales =
CALCULATE(
    [Sales],
    FILTER('Product', 'Product'[Color] = "Red")
)
```

The CALCULATE function accepts a table expression returned by the [FILTER](/dax/filter-function-dax) DAX function, which evaluates its filter expression for each row of the **Product** table. It achieves the correct result—the sales result for red products. However, it could be achieved much more efficiently by using a Boolean expression.

Here's an improved measure definition, which uses a Boolean expression instead of the table expression. The [KEEPFILTERS](/dax/keepfilters-function-dax) DAX function ensures any existing filters applied to the **Color** column are preserved, and not overwritten.

```dax
Red Sales =
CALCULATE(
    [Sales],
    KEEPFILTERS('Product'[Color] = "Red")
)
```

We recommend you pass filter arguments as Boolean expressions, whenever possible. It's because Import model tables are in-memory column stores. They are explicitly optimized to efficiently filter columns in this way.

There are, however, restrictions that apply to Boolean expressions when they're used as filter arguments. They:

- Cannot compare columns to other columns
- Cannot reference a measure
- Cannot use nested CALCULATE functions
- Cannot use functions that scan or return a table

It means that you'll need to use table expressions for more complex filter requirements.

Consider now a different measure definition.

```dax
High Margin Product Sales =
CALCULATE(
    [Sales],
    FILTER(
        'Product',
        'Product'[ListPrice] > 'Product'[StandardCost] * 2
    )
)
```

The definition of a _high margin product_ is one that has a list price exceeding double its standard cost. In this example, the FILTER function must be used. It's because the filter expression is too complex for a Boolean expression.

Here's one more example. The requirement this time is to calculate sales, but only for months that have achieved a profit.

```dax
Sales for Profitable Months =
CALCULATE(
    [Sales],
    FILTER(
        VALUES('Date'[Month]),
        [Profit] > 0)
    )
)
```

In this example, the FILTER function must also be used. It's because it requires evaluating the **Profit** measure to eliminate those months that didn't achieve a profit. It's not possible to use a measure in a Boolean expression when it's used as a filter argument.

## Recommendations

For best performance, we recommend you use Boolean expressions as filter arguments, whenever possible.

Therefore, the FILTER function should only be used when necessary. You can use it to perform filter complex column comparisons. These column comparisons can involve:

- Measures
- Other columns
- Using the [OR](/dax/or-function-dax) DAX function, or the OR logical operator (||)

## Next steps

For more information about this article, check out the following resources:

- [Data Analysis Expressions (DAX) Reference](/dax/)
- [Filter functions (DAX)](/dax/filter-function-dax)
- Learning path: [Use DAX in Power BI Desktop](/learn/paths/dax-power-bi/)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com)