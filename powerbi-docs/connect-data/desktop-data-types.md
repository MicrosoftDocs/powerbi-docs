---
title: Data types in Power BI Desktop
description: Data types in Power BI Desktop
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 10/27/2021
LocalizationGroup: Connect to data
---
# Data types in Power BI Desktop
This article describes data types supported in Power BI Desktop and Data Analysis Expressions (DAX). 

When you load data into Power BI Desktop, it will attempt to convert the data type of the source column into a data type that better supports more efficient storage, calculations, and data visualization. For example, if a column of values you import from Excel has no fractional values, Power BI Desktop will convert the entire column of data to a Whole Number data type, which is better suited for storing integers.

This concept is important because some DAX functions have special data type requirements. While in many cases DAX will implicitly convert a data type for you, there are some cases where it will not.  For instance, if a DAX function requires a Date data type and the data type for your column is Text, the DAX function will not work correctly.  So, it’s both important and useful to get the correct data type for a column. Implicit conversions are described later in this article.

## Determine and specify a column’s data type
In Power BI Desktop, you can determine and specify a column’s data type in the Power Query Editor, or in Data View or Report View:

**Data types in Power Query Editor**

![Screenshot of the Data type ribbon, showing it in the Query Editor.](media/desktop-data-types/pbiddatatypesinqueryeditort.png)

**Data types in Data View or Report View**

![Screenshot of the Data type ribbon, showing it in the Data View.](media/desktop-data-types/pbiddatatypesindatareportview.png)

The Data Type drop down in Power Query Editor has two data types not currently present in Data or Report View: **Date/Time/Timezone** and **Duration**. When a column with these data types is loaded into the model and viewed in Data or Report view, a column with a Date/Time/Timezone data type will be converted into a Date/Time, and a column with a Duration data type is converted into a Decimal Number.

The **Binary** data type is not currently supported outside of the Power Query Editor. Inside the Power Query Editor you can use it when loading binary files if you convert it to other data types before loading it to the Power BI model. It exists in the Data View and Report View menus for legacy reasons but if you try to load binary columns to the Power BI model you may run into errors.  

### Number types
Power BI Desktop supports three number types:

**Decimal Number** – Represents a 64 bit (eight-byte) floating point number. It’s the most common number type and corresponds to numbers as you usually think of them.  Although designed to handle numbers with fractional values, it also handles whole numbers.  The Decimal Number type can handle negative values from -1.79E +308 through -2.23E -308, 0, and positive values from 2.23E -308 through 1.79E + 308. For example, numbers like 34, 34.01, and 34.000367063 are valid decimal numbers. The largest precision that can be represented in a Decimal Number type is 15 digits long. The decimal separator can occur anywhere in the number. The Decimal Number type corresponds to how Excel stores its numbers.

**Fixed Decimal Number** – Has a fixed location for the decimal separator. The decimal separator always has four digits to its right and allows for 19 digits of significance.  The largest value it can represent is 922,337,203,685,477.5807 (positive or negative).  The Fixed Decimal Number type is useful in cases where rounding might introduce errors.  When you work with many numbers that have small fractional values, they can sometimes accumulate and force a number to be slightly off.  Since the values past the four digits to the right of decimal separator are truncated, the Fixed Decimal type can help you avoid these kinds of errors.   If you’re familiar with SQL Server, this data type corresponds to SQL Server’s Decimal (19,4), or the Currency Data type in Power Pivot. 

**Whole Number** – Represents a 64 bit (eight-byte) integer value. Because it’s an integer, it has no digits to the right of the decimal place. It allows for 19 digits; positive or negative whole numbers between -9,223,372,036,854,775,807 (-2^63+1) and 9,223,372,036,854,775,806 (2^63-2). It can represent the largest possible precision of the various numeric data types.  As with the Fixed Decimal type, the Whole Number type can be useful in cases where you need to control rounding. 

> [!NOTE]
>  The Power BI Desktop data model supports 64 bit integer values, but the largest number the visuals can safely express is 9,007,199,254,740,991 (2^53-1) due to JavaScript limitations. If you work with numbers in your data model above this, you can reduce the size through calculations before adding them to a visual 
> 
>

### Date/time types
Power BI Desktop supports five Date/Time data types in Query View.  Both Date/Time/Timezone and Duration are converted during load into the model. The Power BI Desktop data model only supports date/time, but they can be formatted as dates or times independently. 

**Date/Time** – Represents both a date and time value.  Underneath the covers, the Date/Time value is stored as a Decimal Number Type.  So you can actually convert between the two.   The time portion of a date is stored as a fraction to whole multiples of 1/300 seconds (3.33 ms).  Dates between years 1900 and 9999 are supported.

**Date** – Represents just a Date (no time portion).  When converted into the model, a Date is the same as a Date/Time value with zero for the fractional value.

**Time** – Represents just Time (no Date portion).  When converted into the model, a Time value is the same as a Date/Time value with no digits to the left of the decimal place.

**Date/Time/Timezone** – Represents a UTC Date/Time with a timezone offset.  It’s converted into Date/Time when loaded into the model. The Power BI model doesn't adjust the timezone based on a user's location or locale etc. If a value of 09:00 is loaded into the model in the USA, it will display as 09:00 wherever the report is opened or viewed. 

**Duration** – Represents a length of time. It’s converted into a Decimal Number Type when loaded into the model.  As a Decimal Number type it can be added or subtracted from a Date/Time field with correct results.  As a Decimal Number type, you can easily use it in visualizations that show magnitude.

### Text type
**Text** - A Unicode character data string. Can be strings, numbers, or dates represented in a text format. Maximum string length is 268,435,456 Unicode characters (256 mega characters) or 536,870,912 bytes.

### True/false type
**True/False** – A Boolean value of either a True or False.

Power BI converts and displays data differently in certain situations. This section describes common cases of converting Boolean values, and how to address conversions that create unexpected results in Power BI.  

For the best and most consistent results, when loading a column that contains Boolean information (true/false) into Power BI, set the column type to *True/False* as described and explained in the following example.

In this example, we loaded data about whether our customers have signed up for our newsletter: a value of *TRUE* indicates the customer has signed up for the newsletter, a value of *FALSE* indicates the customer has not signed up. However, when we publish the report to the Power BI service, we notice that the column tracking the newsletter sign-up status shows as *0* and *-1* instead of the expected values of *TRUE* or *FALSE*. The following collections of steps involving querying, publishing, and refreshing the data describe how conversions occur, and how to address them.

The simplified query for this table shown in the following image.

:::image type="content" source="media/desktop-data-types/desktop-data-types-boolean-01.png" alt-text="Columns set to boolean":::

The data type of the **Subscribed To Newsletter** column is set to *Any*, and as a result of that data type setting, the data is loaded as text into the Power BI model:

:::image type="content" source="media/desktop-data-types/desktop-data-types-boolean-02.png" alt-text="Data loaded into Power B I appears as expected":::

When we add a simple visualization showing the detailed information per customer, the data appears in the visual as expected, both in Power BI Desktop, and when published to the Power BI service. 

:::image type="content" source="media/desktop-data-types/desktop-data-types-boolean-03.png" alt-text="Visual shows data appearing as expected":::

However, when we refresh the dataset in the Power BI service the **Subscribed To Newsletter** column in the visuals displays values as *-1* and *0*, instead of displaying them as *TRUE* or *FALSE*:

:::image type="content" source="media/desktop-data-types/desktop-data-types-boolean-04.png" alt-text="Visual shows data appearing in an unexpected format after refresh":::

If we republish the report from Power BI Desktop, the **Subscribed To Newsletter** column will again show *TRUE* or *FALSE* as we expect, but once a refresh occurs in the Power BI service, the values are again changed to show *-1* and *0*.

The **solution** to ensure this doesn't happen is to set any Boolean columns to type **True/False** in Power BI Desktop, and republish your report.

:::image type="content" source="media/desktop-data-types/desktop-data-types-boolean-05.png" alt-text="Change the data type of the column to true false":::

When the change is made, the visualization shows the values in the **Subscribed To Newsletter** column slightly differently; rather than the text being all capital letters (as entered in the table), they are now italic and only the first letter is capitalized, which is the result of change the column's data type.

:::image type="content" source="media/desktop-data-types/desktop-data-types-boolean-06.png" alt-text="Values appear differently when the data type is changed":::

Once the data type is changed and republished to the Power BI service, and when a refresh occurs, the values are displayed as *True* or *False*, as expected.

:::image type="content" source="media/desktop-data-types/desktop-data-types-boolean-07.png" alt-text="When true or false values use the true false data type, data appears as expected after refresh":::

In summary, when working with Boolean data in Power BI, make sure your columns are set to the **True/False** data type in Power BI Desktop.

### Blanks/nulls type
**Blank** - Is a data type in DAX that represents and replaces SQL nulls. You can create a blank by using the [BLANK](/dax/blank-function-dax) function, and test for blanks by using the [ISBLANK](/dax/isblank-function-dax) logical function.

### Binary data type

The Binary data type can be used to represent any other data with a binary format. Inside the Power Query Editor, you can use it when loading binary files if you convert it to other data types before loading it to the Power BI model. Binary columns aren't supported in the Power BI data model. It exists in the Data View and Report View menus for legacy reasons but if you try to load binary columns to the Power BI model you may run into errors.




> [!NOTE]
>  If a binary column is in the output of the steps of a query, attempting to refresh the data through a gateway can cause errors. It's recommended that you explicitly remove any binary columns as the last step in your queries.    
> 

### Table data type
DAX uses a table data type in many functions, such as aggregations and time intelligence calculations. Some functions require a reference to a table; other functions return a table that can then be used as input to other functions. In some functions that require a table as input, you can specify an expression that evaluates to a table; for some functions, a reference to a base table is required. For information about the requirements of specific functions, see [DAX Function Reference](/dax/dax-function-reference).

## Implicit and explicit data type conversion in DAX formulas
Each DAX function has specific requirements as to the types of data that are used as inputs and outputs. For example, some functions require integers for some arguments and dates for others; other functions require text or tables.

If the data in the column you specify as an argument is incompatible with the data type required by the function, DAX in many cases will return an error. However, wherever possible DAX will attempt to implicitly convert the data to the required data type. For example:

* You can type a date as a string, and DAX will parse the string and attempt to cast it as one of the Windows date and time formats.
* You can add TRUE + 1 and get the result 2, because TRUE is implicitly converted to the number 1 and the operation 1+1 is performed.
* If you add values in two columns, and one value happens to be represented as text ("12") and the other as a number (12), DAX implicitly converts the string to a number and then does the addition for a numeric result. The following expression returns 44: = "22" + 22.
* If you attempt to concatenate two numbers, Excel will present them as strings and then concatenate. The following expression returns "1234": = 12 & 34.

### Table of implicit data conversions
The type of conversion that is performed is determined by the operator, which casts the values it requires before performing the requested operation. These tables list the operators, and indicate the conversion that is performed on each data type in the column when it is paired with the data type in the intersecting row.

> [!NOTE]
>  Text data types are not included in these tables. When a number is represented as in a text format, in some cases Power BI will attempt to determine the number type and represent it as a number.
> 
> 

**Addition (+)**

| Operator(+) | INTEGER | CURRENCY | REAL | Date/time |
| --- | --- | --- | --- | --- |
| INTEGER |INTEGER |CURRENCY |REAL |Date/time |
| CURRENCY |CURRENCY |CURRENCY |REAL |Date/time |
| REAL |REAL |REAL |REAL |Date/time |
| Date/time |Date/time |Date/time |Date/time |Date/time |

For example, if a real number is used in an addition operation in combination with currency data, both values are converted to REAL, and the result is returned as REAL.

**Subtraction (-)**

In the following table, the row header is the minuend (left side) and the column header is the subtrahend (right side).

| Operator(-) | INTEGER | CURRENCY | REAL | Date/time |
| --- | --- | --- | --- | --- |
| INTEGER |INTEGER |CURRENCY |REAL |REAL |
| CURRENCY |CURRENCY |CURRENCY |REAL |REAL |
| REAL |REAL |REAL |REAL |REAL |
| Date/time |Date/time |Date/time |Date/time |Date/time |

For example, if a date is used in a subtraction operation with any other data type, both values are converted to dates, and the return value is also a date.

> [!NOTE]
>    Data models also support the unary operator, - (negative), but this operator does not change the data type of the operand.
> 
> 

**Multiplication (*)**

| Operator(*) | INTEGER | CURRENCY | REAL | Date/time |
| --- | --- | --- | --- | --- |
| INTEGER |INTEGER |CURRENCY |REAL |INTEGER |
| CURRENCY |CURRENCY |REAL |CURRENCY |CURRENCY |
| REAL |REAL |CURRENCY |REAL |REAL |

For example, if an integer is combined with a real number in a multiplication operation, both numbers are converted to real numbers, and the return value is also REAL.

**Division (/)**

In the following table, the row header is the numerator and the column header is the denominator.

| Operator(/) (Row/Column) | INTEGER | CURRENCY | REAL | Date/time |
| --- | --- | --- | --- | --- |
| INTEGER |REAL |CURRENCY |REAL |REAL |
| CURRENCY |CURRENCY |REAL |CURRENCY |REAL |
| REAL |REAL |REAL |REAL |REAL |
| Date/time |REAL |REAL |REAL |REAL |

For example, if an integer is combined with a currency value in a division operation, both values are converted to real numbers, and the result is also a real number.

### Comparison operators
In comparison expressions, Boolean values are considered greater than string values and string values are considered greater than numeric or date/time values; numbers and date/time values are considered to have the same rank. No implicit conversions are performed for Boolean or string values; BLANK or a blank value is converted to 0/""/false depending on the data type of the other compared value.

The following DAX expressions illustrate this behavior:

=IF(FALSE()\>"true","Expression is true", "Expression is false"), returns "Expression is true"

=IF("12"\>12,"Expression is true", "Expression is false"), returns "Expression is true"

=IF("12"=12,"Expression is true", "Expression is false"), returns "Expression is false"

Conversions are performed implicitly for numeric or date/time types as described in the following table:

| Comparison Operator | INTEGER | CURRENCY | REAL | Date/time |
| --- | --- | --- | --- | --- |
| INTEGER |INTEGER |CURRENCY |REAL |REAL |
| CURRENCY |CURRENCY |CURRENCY |REAL |REAL |
| REAL |REAL |REAL |REAL |REAL |
| Date/time |REAL |REAL |REAL |Date/Time |

### Handling blanks, empty strings, and zero values
In DAX, a null, blank value, empty cell, or a missing value is all represented by the same new value type, a BLANK. You can also generate blanks by using the BLANK function, or test for blanks by using the ISBLANK function.

How blanks are handled in operations such as addition or concatenation depends on the individual function. The following table summarizes the differences between DAX and Microsoft Excel formulas, in the way that blanks are handled.

| Expression | DAX | Excel |
| --- | --- | --- |
| BLANK + BLANK |BLANK |0(zero) |
| BLANK + 5 |5 |5 |
| BLANK * 5 |BLANK |0(zero) |
| 5/BLANK |Infinity |Error |
| 0/BLANK |NaN |Error |
| BLANK/BLANK |BLANK |Error |
| FALSE OR BLANK |FALSE |FALSE |
| FALSE AND BLANK |FALSE |FALSE |
| TRUE OR BLANK |TRUE |TRUE |
| TRUE AND BLANK |FALSE |TRUE |
| BLANK OR BLANK |BLANK |Error |
| BLANK AND BLANK |BLANK |Error |


## Next steps

You can do all sorts of things with Power BI Desktop and data. For more information on its capabilities, check out the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Query overview with Power BI Desktop](../transform-model/desktop-query-overview.md)
* [Data sources in Power BI Desktop](desktop-data-sources.md)
* [Shape and combine data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Common query tasks in Power BI Desktop](../transform-model/desktop-common-query-tasks.md)
