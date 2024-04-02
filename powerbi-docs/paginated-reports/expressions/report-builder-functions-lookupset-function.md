---
title: "LookupSet function in a paginated report"
description: Find out about the LookupSet function in a paginated report, which returns the set of matching values for a specified name from a dataset that contains name or value pairs.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
ms.date: 06/16/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---
# Report Builder functions - LookupSet function in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Returns the set of matching values for the specified name from a dataset that contains name/value pairs in a paginated report.

## Syntax

```syntaxsql
LookupSet(source_expression , destination_expression , result_expression , dataset)
```

### Parameters

*source_expression*  
(**Variant**) An expression that is evaluated in the current scope and that specifies the name or key to look up. For example, `=Fields!ID.Value`.

*destination_expression*  
(**Variant**) An expression that is evaluated for each row in a dataset and that specifies the name or key to match on. For example, `=Fields!CustomerID.Value`.

*result_expression*  
(**Variant**) An expression that is evaluated for the row in the dataset where *source_expression* = *destination_expression*, and that specifies the value to retrieve. For example, `=Fields!PhoneNumber.Value`.

*dataset*  
A constant that specifies the name of a dataset in the report. For example, "ContactInformation".

## Return

Returns a **VariantArray**, or **Nothing** if there's no match.

## Remarks

Use **LookupSet** to retrieve a set of values from the specified dataset for a name/value pair where there's a 1-to-many relationship. For example, for a customer identifier in a table, you can use **LookupSet** to retrieve all the associated phone numbers for that customer from a dataset that isn't bound to the data region.

**LookupSet** does the following:

- Evaluates the source expression in the current scope.

- Evaluates the destination expression for each row of the specified dataset after filters have been applied, based on the collation of the specified dataset.

- For each match of source expression and destination expression, evaluates the result expression for that row in the dataset.

- Returns the set of result expression values.

To retrieve a single value from a dataset with name/value pairs for a specified name where there's a 1-to-1 relationship, use [Lookup Function (Power BI Report Builder)](/sql/reporting-services/report-design/report-builder-functions-lookup-function). To call **Lookup** for a set of values, use [Multilookup Function (Power BI Report Builder)](/sql/reporting-services/report-design/report-builder-functions-multilookup-function).

The following restrictions apply:

- **LookupSet** is evaluated after all filter expressions are applied.

- Only one level of lookup is supported. A source, destination, or result expression can't include a reference to a lookup function.

- Source and destination expressions must evaluate to the same data type.

- Source, destination, and result expressions can't include references to report or group variables.

- **LookupSet** can't be used as an expression for the following report items:

    - Dynamic connection strings for a data source.

    - Calculated fields in a dataset.

    - Query parameters in a dataset.

    - Filters in a dataset.

    - Report parameters.

    - The Report.Language property.

For more information, see [Aggregate Functions Reference (Power BI Report Builder)](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference) and [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md).

## Examples

In the following examples, assume the table is bound to a dataset that includes a sales territory identifier TerritoryGroupID. A separate dataset called "Stores" contains the list of all stores in a territory and includes the territory identifier ID and the name of the store StoreName.

### A. Use LookupSet

In the following expression, **LookupSet** compares the value TerritoryGroupID to ID for each row in the dataset called "Stores". For each match, the value of the StoreName field for that row is added to the result set.

```
=LookupSet(Fields!TerritoryGroupID.Value, Fields!ID.Value, Fields!StoreName.Value, "Stores")
```

### B. Use Join to create a result list

Because **LookupSet** returns a collection of objects, you can't display the result expression directly in a text box. You can concatenate the value of each object in the collection as a string.

Use the Visual Basic function **Join** create a delimited string from a set of objects. Use a comma as a separator to combine the objects in a single line. In some renderers, you might use a Visual Basic line feed (`vbCrLF`) as a separator to list each value on a new line.

The following expression, when it is used as the Value property for a text box, uses **Join** to create a list.

```
=Join(LookupSet(Fields!TerritoryGroupID.Value, Fields!ID.Value, Fields!StoreName.Value, "Stores"),",")
```

### C. Add code to generate HTML

For text boxes that only render a few times, you might choose to add custom code to generate HTML to display values in a text box. HTML in a text box requires extra processing, so this would not be a good choice for a text box that is rendered thousands of times.

Copy the following Visual Basic functions to a Code block in a report definition. **MakeList** takes the object array that is returned in *result_expression* and builds an unordered list by using HTML tags. **Length** returns the number of items in the object array.

```
Function MakeList(ByVal items As Object()) As String
   If items is Nothing Then
      Return Nothing
   End If
  
   Dim builder As System.Text.StringBuilder =
      New System.Text.StringBuilder()
   builder.Append("<ul>")
  
   For Each item As Object In items
      builder.Append("<li>")
      builder.Append(item)
   Next
   builder.Append("</ul>")
  
   Return builder.ToString()
End Function
  
Function Length(ByVal items as Object()) as Integer
   If items is Nothing Then
      Return 0
   End If
   Return items.Length
End Function
```

### D. Call the function

To generate the HTML, you must call the function. Paste the following expression in the Value property for the text box and set the markup type for text to HTML. For more information, see [Add HTML into a Report (Power BI Report Builder)](/sql/reporting-services/report-design/add-html-into-a-report-report-builder-and-ssrs).

```
=Code.MakeList(LookupSet(Fields!TerritoryGroupID.Value, Fields!ID.Value, Fields!StoreName.Value, "Stores"))
```

## Related content

- [Expression Uses in Reports (Power BI Report Builder)](./expression-uses-reports-report-builder.md)
- [Expression Examples (Power BI Report Builder)](./report-builder-expression-examples.md)
- [Data Types in Expressions (Power BI Report Builder)](./data-types-expressions-report-builder.md)
- [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md)
