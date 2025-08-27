---
title: "Using DAX user-defined functions in Power BI Desktop"
description: Learn how to create Data Analysis Expressions (DAX) user-defined functions (UDFs) in Power BI Desktop.
author: hsteffens30
ms.topic: how-to
ms.date: 09/15/2025
---

# DAX user-defined functions (preview)

> [!NOTE]
> DAX user-defined functions are currently in **preview**.

DAX user-defined functions (UDFs) let you package reusable, parameterized DAX logic into your models making your DAX code easier to write, maintain, and share. Instead of repeating formulas across measures, calculated columns, and visuals, UDFs bring programming-style flexibility to your semantic models, letting you define functions once and use them everywhere DAX is supported. To learn more, see [DAX user-defined functions](/dax/best-practices/dax-user-defined-functions).


## Why use user-defined functions?

- **Reusability  and consistency**: Define a calculation once and reuse it everywhere.
- **Maintainability**: Update logic in one place to fix or evolve rules.
- **Safer authoring**: Optional type hints and type check helpers support predictable, error-resistant code.
- **First-class model objects**: UDFs live in the model and can be viewed in Model Explorer.


## Getting started

To try UDFs in Desktop:
1. Go to **File > Options and settings > Options**.
2. Select **Preview features** and check **DAX user-defined functions**.
3. Select **OK** and **restart** Power BI Desktop.


## Define a function

You can define a user-defined function in Power BI Desktop using [DAX query view](dax-query-view.md) (DQV) or [TMDL view](desktop-tmdl-view.md).


### General syntax

The general syntax for a UDF is:

```dax
/// Optional description above the function
FUNCTION <FunctionName> = ( <ParameterName>: <ParameterType>, ... ) => <FunctionBody>
```


### Example: Simple tax function

Here is a simple example in **DQV** that adds tax onto the given amount. Note that you can also evaluate UDFs in DQV.

```dax
DEFINE
    /// AddTax takes in amount and returns amount including tax
    FUNCTION AddTax = (
            amount : NUMERIC
        ) =>
        amount * 1.1

EVALUATE
{ AddTax ( 10 ) }
// Returns 11
```

After a UDF has been defined, you can update the model or use the code lense to add the function to your model.

:::image type="content" source="media/dax-user-defined-functions/dax-query-view-save-to-model.png" alt-text="Screenshot of DAX query view in Power BI Desktop, highlighting two locations where you can save a user-defined function. The first is the Update model with changes button at the top of the view. The second is a status line in the code editor labeled Update model: Add new function" lightbox="media/dax-user-defined-functions/dax-query-view-save-to-model.png":::


The same example can be created in **TMDL view**.

```tmdl
createOrReplace
    /// AddTax takes in amount and returns amount including tax
    function AddTax = 
        (amount : NUMERIC) =>
            amount * 1.1
```

After a UDF has been defined, you can apply changes to add the function to your model.

:::image type="content" source="media/dax-user-defined-functions/view-save-to-model.png" alt-text="Screenshot of TMDL view in Power BI Desktop, highlighting the Apply button at the top of the view. This is the location where you can save a user-defined function." lightbox="media/dax-user-defined-functions/view-save-to-model.png":::


## Manage user-defined functions

Once defined and added to the model, you can view and manage all user-defined functions from [Model explorer](model-explorer.md) under the *Functions* node. 

:::image type="content" source="media/dax-user-defined-functions/model-explorer-view-functions.png" alt-text="Model explorer panel in Power BI Desktop showing the expanded Functions node. Three user-defined functions are listed: AddTax, AverageOrderValue, and CustomerLifetimeValue." lightbox="media/dax-user-defined-functions/model-explorer-view-functions.png":::

In [DAX query view](dax-query-view.md) (DQV), you can use **Quick queries** through Model explorer to easily define and evaluate functions.

:::image type="content" source="media/dax-user-defined-functions/model-explorer-quick-queries.png" alt-text="Model explorer pane in Power BI Desktop displays the expanded Functions node. Two context menus are open: the first menu provides Quick queries, Rename, Delete from model, Hide in report view, Unhide all, Collapse all, and Expand all. Quick queries is highlighted and selected. The second menu is highlighted and offers Quick queries options Evaluate, Define and evaluate, Define new function, and Define all functions in this model." lightbox="media/dax-user-defined-functions/model-explorer-quick-queries.png":::

In [TMDL view](desktop-tmdl-view.md), you can **drag and drop** functions into the canvas or use **Script TMDL to** throught Model explorer.

:::image type="content" source="media/dax-user-defined-functions/model-explorer-script-to.png" alt-text="Model explorer pane in Power BI Desktop displays the expanded Functions node. Two context menus are open: the first menu provides Script TMDL to, Rename, Delete from model, Hide in report view, Unhide all, Collapse all, and Expand all. Script to TMDL is highlighted and selected. The second menu is highlighted and offers Script to TMDL options Script tab and Clipboard." lightbox="media/dax-user-defined-functions/model-explorer-script-to.png":::

If using a [Power BI Project](../developer/projects/projects-overview.md), functions are also stored in `functions.tmdl` within the *definition* folder.

:::image type="content" source="media/dax-user-defined-functions/project-script.png" alt-text="Visual Studio Code screenshot of a Power BI project. Explorer is open to the semantic model folder. 'functions.tmdl' is open in the code editor. Three functions are displayed: CustomerLifetimeValue, AverageOrderValue, and AddTax." lightbox="media/dax-user-defined-functions/project-script.png":::


## Using user-defined functions

After adding a UDF to the model, you can use it anywhere DAX is supported. We will use `AddTax` as an example.

Use UDFs with full filter context with **measures**.

```dax
Total Sales with Tax = AddTax ( [Total Sales] )
```

Apply UDFs to every row in a table with **calculated columns**.

```dax
Sales Amount with Tax = CONVERT ( AddTax ( 'Sales'[Sales Amount] ), CURRENCY )
```

Use UDFs directly in visuals with **visual calculations**.

```dax
Sales Amount with Tax = AddTax ( [Sales Amount] )
```

Nest UDFs for advanced scenarios.

```dax
DEFINE
    /// AddTax takes in amount and returns amount including tax
    FUNCTION AddTax = (
            amount : NUMERIC
        ) =>
        amount * 1.1

	FUNCTION AddTaxAndDiscount = (
			amount : NUMERIC,
			discount : NUMERIC
		) =>
		AddTax ( amount - discount )

EVALUATE
{ AddTaxAndDiscount ( 10, 2 ) }
// Returns 8.8
```


## Parameters

DAX UDFs support zero or more parameters. To make your functions safer and more predictable you can optionally specify parameter type hints:

- **Type**: what type of value the parameter accepts (`AnyVal`, `Scalar`, `Table`, or `AnyRef`).
- **Subtype** (only for scalar type): the specific scalar data type (`Variant`, `Int64`, `Decimal`, `Double`, `String`, `DateTime`, `Boolean`, or `Numeric`). 
- **ParameterMode**: when the argument is evaluated (`val` for eager or `expr` for lazy).

Type hints follow the form: `[type] [subtype] [parameterMode]`


### Example: Type casting

```dax
DEFINE
    /// returns x cast to an Int64
    FUNCTION CastToInt = (
            x : SCALAR INT64 VAL
        ) =>
        x

EVALUATE
{ CastToInt ( 3.4 ), CastToInt ( 3.5 ), CastToInt ( "5" ) }
// returns 3, 4, 5
```

This uses a `Scalar` type, `Int64` subtype, and `val` parameterMode. You can also achieve this by just including the `Int64` subtype as seen in the example below. Non-numeric strings will result in an error.

```dax
DEFINE
    /// returns x as an Int64
    FUNCTION CastToInt = (
            x : INT64
        ) =>
        x

EVALUATE
{ CastToInt ( 3.4 ), CastToInt ( 3.5 ), CastToInt ( "5" ) }
// returns 3, 4, 5
```


## Type checking

Validate parameter types inside your function using built-in DAX type-checking functions such as:
- [ISNUMERIC](/dax/isnumeric-function-dax)
- [ISDOUBLE](/dax/isdouble-function-dax)
- [ISSTRING](/dax/isstring-function-dax)
- [ISBOOLEAN](/dax/isboolean-function-dax)

For a complete list of available type-checking functions, see [DAX user-defined functions](/dax/best-practices/dax-user-defined-functions).


## Related content

For more information on using user-defined functions, see the following resources:

- [DAX user-defined functions](/dax/best-practices/dax-user-defined-functions)
