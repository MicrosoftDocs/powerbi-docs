---
title: Implement time-based calculations in Power BI
description: Learn how to use time intelligence to implement time-based calculations
author: kgremban
ms.author: kgremban
ms.reviewer: jterh
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: concept-article
ms.date: 09/15/2025
LocalizationGroup: Model your data
no-loc: [SAMEPERIODLASTYEAR,TOTALYTD,TOTALQTD,TOTALMTD,TOTALWTD,DATEADD,PARALLELPERIOD,SUM,CALCULATE,PREVIOUSDAY,PREVIOUSMONTH]
---
# Implement time-based calculations in Power BI

Power BI offers multiple tools to perform time-based calculations, which either rely on automatic date tables or date tables you add.

We recommend using [calendar-based time intelligence (preview)](#calendar-based-time-intelligence-preview) because it provides the best performance and highest range of flexibility to meet any calendar.

This table compares the three tools provided:

|Tool|Setup effort required|Ease of management|Flexibility|Notes|
|--|--|--|--|--|
|[Auto-date/time](desktop-auto-date-time.md)|virtually zero|hard|low|Increases model size due to multiple hidden date tables created|
|[Classic time intelligence](#classic-time-intelligence)|medium|easy|low|Requires creation of a date table, assumes Gregorian or shifted Gregorian calendar, suffers from performance issues in some specific scenarios|
|[Calendar-based time intelligence](#calendar-based-time-intelligence-preview)|high|medium|high|Recommended to create a date table, highest flexibility, best performance, but increased setup cost|

> [!NOTE]
> We advise against using alternative time intelligence techniques, particularly those that involve adding extra columns to date tables to calculate offsets except for specific use cases. While these approaches may appeal to beginners due to their straightforward DAX formulas, they tend to inflate semantic models unnecessarily. This bloating can lead to slower data refreshes and diminished report performance as datasets grow.

## Auto-date/time

The auto-date/time feature automatically creates hidden date tables for each date field in your data model. For more information about this automatic behavior, see [Apply auto date/time in Power BI Desktop](desktop-auto-date-time.md).

> [!NOTE]
> While auto-date/time is a convenient option for simple models, it isn't recommended for more complex scenarios and larger models. For those models, it's preferable to create a dedicated table for more flexibility.

## Add a date table

For most models, it's recommended to add a date table (or more in some scenarios). Many data analysts prefer to create their own date tables, which is fine.

There are multiple ways of creating such a table, including:

- **Power Query M**. You can use the [List.Dates](/powerquery-m/list-dates) function. [An example is provided later in this document](#create-a-date-table-using-built-in-tools).
- **DAX**. You can use the [CALENDAR](/dax/calendar-function-dax) or [CALENDARAUTO](/dax/calendarauto-function-dax) functions to generate a basic calculated date table. You can also use a more advanced DAX statement to create a date table. [An example is provided later in this document](#create-a-date-table-using-built-in-tools).
- **External tools**.
- **Loading from a source**, such as a source system, a file, or another Power BI semantic model.

Which option is best for you depends on various factors and is beyond the scope of this tutorial.

## Work with time-based calculations

Assuming you aren't using [auto date/time](desktop-auto-date-time.md), there are two alternative ways of working with [Time intelligence functions in Power BI](/dax/time-intelligence-functions-dax) to perform time-based calculations:

- [**Classic time intelligence**](#classic-time-intelligence). The easiest option and works great for Gregorian or shifted Gregorian calendars but has limited flexibility for calendars that are structured differently or for week-based calculations.
- [**Calendar-based time intelligence (preview)**](#calendar-based-time-intelligence-preview). Newer option, but requires a bit more work to set up. However, it also gives you better performance, more flexibility to work with non-Gregorian calendars and the ability to perform week-based calculations.

> [!NOTE]
> You need to [set your table as a date table](desktop-date-tables.md#how-to-set-your-own-date-table) for specific scenarios.

## Classic time intelligence

This option requires you to have a date table in your model and to [set it accordingly](desktop-date-tables.md). Afterwards, you can use the [time intelligence functions](/dax/time-intelligence-functions-dax) and refer to your date table. For example, if you have a date table called **Date** in your model that you set as your date table, which contains a Date column then you can use:

```dax
SAMEPERIODLASTYEAR ( 'Date'[Date] )
```

While this is a fast and easy approach, there are many downsides compared to the [calendar-based approach](#calendar-based-time-intelligence-preview):

- it requires you set the date table
- it only works with models that have at least one dedicated date table
- the date columns used should have no missing dates between the first and last dates. If there are any missing dates between the first and last dates, an error is thrown.
- it's less flexible as it's optimized for Gregorian or shifted Gregorian calendars, such as fiscal years that start on July 1 but still follow a Gregorian calendar
- it doesn't provide week-based calculations
- in specific scenarios, time-based calculations don't perform well.

> [!NOTE]
> We recommend you use the [enhanced, calendar-based](#calendar-based-time-intelligence-preview) approach.

## Calendar-based time intelligence (preview)

Calendars are metadata definitions added to a table to indicate which columns from that table represent what attributes of time. You can define one or more calendars on any table in your model. After you defined the calendar in your model, you can refer to it in your time-intelligence functions. For example, here's how to calculate a total year to date of Sales using a defined **Fiscal calendar**:

```dax
TOTALYTD ( [Sales], 'Fiscal Calendar' )
```

### Benefits of calendar-based time intelligence

Main benefits of calendar-based time intelligence are:

- [Works with any calendar](#works-with-any-calendar)
- [Sparse dates](#sparse-dates)
- [Week-based calculations](#week-based-calculations)
- [Performance improvements](#performance-improvements)

#### Works with any calendar

Calendars give you full flexibility to decide how to divide up time in years, quarters, months, and weeks. You can, for example, define the calendars that follow these patterns:

- Gregorian
- Shifted Gregorian
- Retail (445, 454, 544 patterns)
- 13-month
- Lunar

The possibilities are endless as there's no built-in assumption from Power BI on how your calendar is structured. Calendar-based time intelligence makes no assumptions about the underlying dates. All calculations use the underlying data exactly as-is.

#### Sparse dates

[Classic time intelligence](#classic-time-intelligence) requires that the date column provided is complete - if there are any missing dates between the first and last dates, an error is thrown. Calendar-based time intelligence functions don't have such a requirement. Instead, they operate on the dates as-is. While we still recommend having a complete and dedicated calendar table, you're no longer required to have that. For example, if all of your retail stores are closed over the weekend, you can skip over the weekend days as they don't have any sales. Assuming your weekend is Saturday and Sunday, you can now use [PREVIOUSDAY](/dax/previousday-function-dax) with a calendar based on a table that doesn't have entries for the weekend to jump from Monday straight to Friday.

#### Week-based calculations

Calendar-based time intelligence directly supplies DAX functions that operate at a week granularity. For example, week-to-date totals can be computed directly using [TOTALWTD](/dax/totalwtd-function-dax):

```dax
TOTALWTD ( Expr, CalendarName )
```

#### Performance improvements

Some scenarios may exhibit improved performance when comparing a calendar-based time intelligence function to its classic counterpart. For example, a visual that is grouped by the week and performs a year-to-date calculation using `TOTALYTD ( ..., CalendarName )` should generally execute more quickly than if its classic counterpart, `TOTALYTD ( ..., TableName[DateColumnName] )`, were used. For insight into why this might happen, refer to the [**Context clearing**](#context-clearing) section.

### Enable the enhanced DAX Time Intelligence preview

To get started, you first need to enable the **Enhanced DAX Time Intelligence** preview feature.

1. In Power BI Desktop, go to File > Options and settings > Options > Preview features.
1. Select the **Enhanced DAX Time Intelligence** preview.
1. Select **OK**
1. Restart Power BI Desktop

### Manage calendars

To manage a calendar, right-click the table that contains the calendar or on which you want to define the calendar and choose **Calendar options** or select **Calendar options** in the Table tools ribbon after selecting the table:

:::image type="content" source="media/desktop-time-intelligence/calendar-options-entry-points.png" alt-text="Screenshot showing the entry points to open the Calendar Options on a table." lightbox="media/desktop-time-intelligence/calendar-options-entry-points.png":::

Alternatively you can use external tools or the [TMDL view](desktop-tmdl-view.md) to define a calendar. For more information, see the [TMDL script](#tmdl-script-for-calendars).

Calendars are also shown in the [model explorer](model-explorer.md) under the table on which they're defined:

:::image type="content" source="media/desktop-time-intelligence/calendars-model-explorer.png" alt-text="Screenshot showing the model explorer for a semantic model. The Date table node is expanded and the calendars are highlighted." lightbox="media/desktop-time-intelligence/calendars-model-explorer.png":::

### The calendar options screen

The calendar options screen shows the calendars defined on the selected table. Here you can:

- create a new calendar by selecting **New calendar**
- edit an existing calendar by selecting **Edit**
- delete an existing calendar by selecting **Delete**
- [set the table as a date table](desktop-date-tables.md) by selecting **Mark as date table**

:::image type="content" source="media/desktop-time-intelligence/calendar-options-for-table.png" alt-text="Screenshot showing the Calendar Options on a table." lightbox="media/desktop-time-intelligence/calendar-options-for-table.png":::

### Assign column categories

Defining a calendar involves giving it a name and assigning columns to categories. Each category represents a unit of time and specific [column categories](#available-column-categories) are available. You need to at least assign one primary column to a category to save your calendar. Each category should have a [primary column and can have zero or more associated columns](#primary-versus-associated-columns). Whenever any columns associated to a category are in context Power BI knows what unit of time they present. Additionally, for some functions such as [TOTALMTD](/dax/totalmtd-function-dax) Power BI uses the primary column mapped to the relevant category in the referenced calendar to perform the requested calculation.
To assign a column to a category, select the category from the **Add category** menu and then select the primary and optional associated columns.

:::image type="content" source="media/desktop-time-intelligence/calendar-select-category.png" alt-text="Screenshot showing the calendar creation and edit screen." lightbox="media/desktop-time-intelligence/calendar-select-category.png":::

### Available column categories

The following table shows the categories that are available. The table also gives example values and cardinalities for Gregorian calendars.

Categories are divided into two groups:

- **Complete**. Data in columns assigned to Complete categories is enough to uniquely identify the time period.
- **Partial**. Data in columns assigned to Partial categories isn't enough to uniquely identify the time period.

|Category|Description|Type|Example cardinality in a Gregorian calendar|Example column values in a Gregorian calendar|
|--|--|--|--|--|
|Year|The year|Complete|`Y` = number of years|2024, 2025|
|Quarter|The quarter including the year|Complete|`4*Y`|Q1 2024, Q2 2025|
|Quarter of Year|The quarter of the year|Partial|`4`|Year Quarter 1, YQ1, Q1, Quarter 2|
|Month|The month including the year|Complete|`12*Y ≤ value ≤ 13*Y`|January 2023, 2024 Feb|
|Month of Year|The month of the year|Partial|`12`|January, Year Month 11, YM11, M11, 11|
|Month of Quarter|The month of the quarter|Partial|`3`|1, QM2|
|Week|The week including the year|Complete|`52 ≤ value ≤ 53`|Week 50 2023, W50-2023, 2023-W50|
|Week of Year|The week of the year|Partial|`52`|Week 50, W50, 50|
|Week of Quarter|The week of the quarter|Partial|`13`|Quarter Week 10, QW10, 10|
|Week of Month|The week of the month|Partial|`5`|Month Week 2, MW2, 2|
|Date|The date|Complete|`365*Y ≤ value ≤ 366*Y`|12/31/2025|
|Day of Year|The day of the year|Partial|`365 ≤ value ≤366`|365, D1|
|Day of Quarter|The day of the quarter|Partial|`92`|Quarter Day 10, QD2, 50|
|Day of Month|The day of the month|Partial|`31`|Month Day 30, MD10, 30|
|Day of Week|The day of the week|Partial|`7`|Week Day 5, WD5, 5|

In addition to these categories, you can associate any number of columns on your table with the **Time-related** category. This isn't currently possible in the calendar options, but can instead only be done using external tools or [TMDL](#tmdl-script-for-calendars).

> [!NOTE]
> Context on any columns that are assigned to the **time-related** category is removed when performing calculations in all functions except DATEADD and SAMEPERIODLASTYEAR. Any context on columns that are part of the table on which the calendar is defined but aren't tagged in that calendar is kept.

> [!NOTE]
> We recommend you associate only the columns in your calendar that you want to use in time intelligence calculations.

### Primary versus associated columns

The primary column is required for each category. Whenever that column or any associated columns assigned to the same category on the referenced calendar are in context or the category is required to perform a calculation, Power BI uses the primary column. Additionally, the primary columns are used for sorting. If the values in the primary column don't allow it to be sortable as expected you can either [configure the primary column to sort by another column](../create-reports/desktop-sort-by-column.md) or use another column and make the original column an associated column. For example, a column with textual data containing month number and year in a format of `mm-yyyy` (that is, `01-2024`, `02-2024`, and so on) won't sort correctly across multiple years, but a column that uses the `yyyy-mm` format will:

:::image type="content" source="media/desktop-time-intelligence/calendar-sorting-textual-data-patterns.png" alt-text="Screenshot showing two tables. Each table has one column. The first table contains a column that contains textual month number and year information in a mm-yyyy format and the second contains the same information in a yyyy-mm format. The column containing the mm-yyyy format data isn't sorted correctly." lightbox="media/desktop-time-intelligence/calendar-sorting-textual-data-patterns.png":::

You can have zero or more associated columns assigned to a category.

### Validation

It's important to validate and test your calendar so you're certain it meets your needs. The validations offered in Power BI include both [real-time validations](#real-time-validations) and [offline validations](#offline-validations).

> [!NOTE]
> You can save your calendar despite offline validation errors, but resolving them first is recommended. Real-time validation failures must be fixed to save.

### Real-time validations

The real-time validations performed on the calendars are:

- **Unique calendar name**. Each calendar has to have a unique name in the semantic model.
- **Single association per calendar**. A column can't belong to more than one category in the same calendar.
- [**Period Uniqueness**](#period-uniqueness). Assigned categories should uniquely identify the period.
- [**Consistent categorization**](#consistent-categorization). This ensures that columns are associated with the same category across calendars.

#### Period Uniqueness

There should always be a path to uniquely identify the period for the assigned categories.

Whenever you add a **partial category**, Power BI validates that a matching combination of complete or partial categories is also tagged in the same calendar. If that isn't the case, a warning is shown.

:::image type="content" source="media/desktop-time-intelligence/calendar-realtime-validation-error.png" alt-text="Screenshot showing the calendar creation and edit screen with a real-time validation error." lightbox="media/desktop-time-intelligence/calendar-realtime-validation-error.png":::

For example, when setting up a calendar for week-based calculations, make sure to assign at least a primary column to one of the following sets of categories:

- Week
- Week of Year, Year
- Week of Quarter, Quarter
- Week of Quarter, Quarter of Year, Year
- Week of Month, Month
- Week of Month, Month of Year, Year
- Week of Month, Month of Quarter, Quarter
- Week of Month, Month of Quarter, Quarter of Year, Year

#### Consistent categorization

Columns must have a consistent category across calendars. You can't assign the same column to different categories like **Year**, **Quarter of Year**, or **time-related** in separate calendars.

### Offline validations

Offline validations can potentially be time consuming as they access table data. Therefore, they don't run automatically in contrast with the [real-time validations](#real-time-validations). To run the validations, select **Validate data**:

:::image type="content" source="media/desktop-time-intelligence/calendar-run-offline-validations.png" alt-text="Screenshot showing the calendar creation and edit screen. The Validate data button is highlighted." lightbox="media/desktop-time-intelligence/calendar-run-offline-validations.png":::

The offline validations check the following rules and  returns a warning if any rules are invalidated in your calendar:

- a column associated with a category doesn't have blank values.
- higher level and lower level categories have a one-to-many cardinality ratio. For example, columns associated with the Year category should have a one-to-many cardinality with columns associated with the Month category.
- columns associated with categories on the same level have a one-to-one cardinality ratio. For example, columns associated with the Month category should have a one-to-one cardinality with the combinations of the columns associated with the Month of Year and Year categories.
- primary and associated columns assigned to the same category have a one-to-one cardinality ratio. For example, when assigned to the Month category, a primary column Month and an associated column EnglishMonthName should have a one-to-one cardinality.

### Work with calendars

Once a calendar is defined, you can refer to it in [Time intelligence functions](/dax/time-intelligence-functions-dax). For example, the following measure calculates a total month to date value of Total Quantity against the **ISO-454** calendar:

```dax
Total Quantity MTD ISO-454 = TOTALMTD ( [Total Quantity], 'ISO-454' )
```

If the calendar isn't defined and error is returned:

:::image type="content" source="media/desktop-time-intelligence/calendar-time-intelligence-non-existing-calendar.png" alt-text="Screenshot showing a measure using the TOTALMTD function with a calendar parameter to a nonexisting calendar." lightbox="media/desktop-time-intelligence/calendar-time-intelligence-non-existing-calendar.png":::

Even if the calendar is defined, however, a measure might still return an error. This happens if the function used expects a category to be present in the calendar and the calendar doesn't have that category. For example, [TOTALWTD](/dax/totalwtd-function-dax) expects specific categories to be present in the calendar. If they aren't, an error is returned:

:::image type="content" source="media/desktop-time-intelligence/calendar-time-intelligence-missing-category-calendar.png" alt-text="Screenshot showing a measure using the TOTALWTD function with a valid calendar reference that doesn't define the required categories." lightbox="media/desktop-time-intelligence/calendar-time-intelligence-missing-category-calendar.png":::

### Time intelligence functions and required categories

Many [Time intelligence functions](/dax/time-intelligence-functions-dax) require sufficient categories to be included on the calendar that is referenced in the function call so Power BI can identify a uniquely particular unit of time. In other words, Power BI needs to be able to "walk-up" from the level the calculation is performed on all the way to an individual year. For example, when performing a calculation on quarters, for example using [TOTALQTD](/dax/totalqtd-function-dax) either assign  **Quarter** category, or assign both **Quarter of Year** and **Year** in the calendar as dictated by the [**Period uniqueness**](#period-uniqueness) validation.

> [!NOTE]
> For some functions their name is indicative of which level the calculation operates (for example, [TOTALYTD](/dax/totalytd-function-dax)), while for others it's dependent on the parameters and context (for example, [DATEADD](/dax/dateadd-function-dax)).

### Context clearing

Time intelligence functions operate by starting at a point in time, and then performing some operation on it in order to yield a different point in time. Naturally, the initial point in time may conflict with this result, thus causing a filter context intersection that by default, would yield partial or empty results. For example, consider the following scenario.

#### Calendar definition
We have a simple Gregorian calendar that tags three categories, defined as:

| Category | Primary Column |
| --- | --- |
| Year | Year |
| Month of Year | MonthOfYear |
| Quarter | Quarter |

#### Measure definitions

Two basic measures are defined: one to compute the total sales, and another to compute the total sales from the previous quarter:

```dax
[TotalSales] = CALCULATE ( SUM( FactInternetSales[SalesAmount] ) )
[LastQuarterSales] = CALCULATE ( [TotalSales], DATEADD( GregorianCalendar, -1, QUARTER ) )
```

#### Example: How context clearing works

Our table visual browses at a month granularity using the **Year** and **MonthOfYear** columns:

| Year | MonthOfYear | TotalSales | LastQuarterSales |
| --- | --- | --- | --- |
| 2011 | 1 | 10 |  |
| 2011 | 2 | 20 |  |
| 2011 | 3 | 30 |  |
| **2011** | **4** | **40** | **10** |
| 2011 | 5 | 50 | 20 |

In this table, the bolded row is browsing at a month-level, for the month of April 2011. Thus, all measures in this row will be evaluated under the filter context of **[Year] == 2011 and [MonthOfYear] == 4**.  
As expected, **TotalSales** here's computed as the total sales for April 2011.

**LastQuarterSales** similarly computes **TotalSales**, but given an extra filter provided by the `DATEADD` calendar-based function.
For this row, `DATEADD` would have an initial starting point in time of April 2011, and would yield the point in time that is exactly one quarter ago: January 2011. As a result, one may expect this **TotalSales** to be computed under the following two filter contexts:

- Provided by the current row's browsing columns:
`{ [Year] == 2011, [MonthOfYear] == 4 }` (Equivalently, April 2011)
- Provided by the DATEADD filter:
`{ [Year] == 2011, [MonthOfYear] == 1 }` (Equivalently, January 2011)

Clearly, these two filter contexts would conflict - we can't evaluate the total sales given the current month as both January 2011 **and** April 2011. Such an intersection would yield no results.
However, this isn't what occurs. Instead, based on the calendar definition, calendar-based time intelligence functions identify which categories' columns may result in conflicts, following the time operation that the function performs. In this case, `DATEADD` performs a shift at the **Quarter** level. The function identifies that both the **Year** and **Month of Year** categories may change as a result of a change in the **Quarter** category's columns. Thus, the function clears filter context on **all** (both primary and associated) columns that are tagged to those categories. 

In other words, we can say that the **Year** and **Month of Year** categories are dependencies of the **Quarter** category. Conversely, we can say that the **Quarter** category is a dependent of the **Year** and **Month of Year** categories.

#### How context clearing works

:::image type="content" source="media/desktop-time-intelligence/time-lattice.png" alt-text="Lattice structure diagram of all calendar categories." lightbox="media/desktop-time-intelligence/time-lattice.png":::

This diagram is provided to better visualize the dependencies between the different time categories. Each category in this lattice represents all columns (primary and associated) tagged to that category.
Categories are connected to their dependencies via arrows. For example, "Month" is dependent on "Year", "Quarter of Year", "Month Of Quarter", "Quarter", and "Month of Year".

When context is set on a column or its associated [sort by column](../create-reports/desktop-sort-by-column.md) that is tagged in a calendar, prior filter context is cleared on:

1. All category **dependencies** of X. This can be thought of as all categories above X.
2. All category **dependents** of both X and its dependencies (that is, from 1. above). This can be thought of as all categories below X and all categories in 1 above.

> [!NOTE]
> Context clearing happens on columns tagged in a calendar or associated [sort-by columns](../create-reports/desktop-sort-by-column.md) regardless if the context is set using time intelligence functions or otherwise.

##### Time-related columns

Most time intelligence functions, except for [DATEADD](/dax/dateadd-function-dax) and [SAMEPERIODLASTYEAR](/dax/sameperiodlastyear-function-dax), will clear context on all time-related columns and associated [sort-by columns](../create-reports/desktop-sort-by-column.md).

##### Cross-calendar behavior

If there are multiple calendars defined on the same table, these processes are completed for **every** calendar defined on the table. This includes the remark regarding the context clearing of time-related columns.
In other words, assume a table defines three calendars: Calendar1, Calendar2, and Calendar3. If filter context is set on category "X" in Calendar1, the above processes are performed on all three calendars.

#### Example: Filter set on "Quarter"

If filter context were set on the category "Quarter", the process would be as follows.

1. First, all dependencies of the "Quarter" category would be considered.

    :::image type="content" source="media/desktop-time-intelligence/context-clearing-on-quarter-1.png" alt-text="Filter context clearing behavior example starting from category Quarter: Dependencies." lightbox="media/desktop-time-intelligence/context-clearing-on-quarter-1.png":::

1. Next, all dependents of "Quarter" and its dependencies would be considered.

    :::image type="content" source="media/desktop-time-intelligence/context-clearing-on-quarter-2.png" alt-text="Filter context clearing behavior example starting from category Quarter: Dependents." lightbox="media/desktop-time-intelligence/context-clearing-on-quarter-2.png":::

1. Finally, the end result would be the following. All red colored categories would have their prior filter context removed and new context is set on Quarter. 

    :::image type="content" source="media/desktop-time-intelligence/context-clearing-on-quarter-3.png" alt-text="Filter context clearing behavior example starting from category Quarter: Results" lightbox="media/desktop-time-intelligence/context-clearing-on-quarter-3.png":::

### TMDL script for calendars

```tmdl
createOrReplace

	table Date
		lineageTag: xyz

		column Date
			dataType: dateTime
			formatString: Long Date
			lineageTag: abc
			summarizeBy: none
			sourceColumn: Date

        column Year
			dataType: string
			lineageTag: abc
			summarizeBy: none
			sourceColumn: Year

			annotation SummarizationSetBy = Automatic
        
        column Month
			dataType: string
			lineageTag: def
			summarizeBy: none
			sourceColumn: Month

			annotation SummarizationSetBy = Automatic

        column MonthName
			dataType: string
			lineageTag: ghi
			summarizeBy: none
			sourceColumn: MonthName
			sortByColumn: SortByMonth

			changedProperty = SortByColumn

			annotation SummarizationSetBy = Automatic

        column DutchMonthName
			dataType: string
			lineageTag: jkl
			summarizeBy: none
			sourceColumn: DutchMonthName

			annotation SummarizationSetBy = Automatic

        column 'Holiday Name'
			dataType: string
			lineageTag: mno
			summarizeBy: none
			sourceColumn: Holiday Name

			annotation SummarizationSetBy = Automatic
        
        column IsWorkingDay
			dataType: string
			lineageTag: pqr
			summarizeBy: none
			sourceColumn: IsWorkingDay

			annotation SummarizationSetBy = Automatic
		...	
		
		calendar 'Demo Calendar'
			lineageTag: def

			calendarColumnGroup = year
				primaryColumn: Year

			calendarColumnGroup = month
				primaryColumn: Month
				associatedColumn: DutchMonthName
				associatedColumn: MonthName
			
			calendarColumnGroup
                column: 'Holiday Name'
                column: isWorkingDay
```

> [!NOTE]
> Notice that if you don't specify any category for the `calendarColumnGroup` in TMDL, the columns are tagged as [time-related](#time-related-columns). In this example, **Holiday Name** and **isWorkingDay** are time-related columns on the **Demo Calendar**.

### Put it all together: Examples of time shifting

Some [time intelligence functions](/dax/time-intelligence-functions-dax) shift context only laterally, considering all columns, while others perform hierarchical shifts—keeping or clearing context based on whether columns are tagged in the calendar. The time intelligence functions can be divided into two groups based on whether they allow for hierarchical shifts:

- **Fixed**. Functions in this group are [DATEADD](/dax/dateadd-function-dax) and [SAMEPERIODLASTYEAR](/dax/sameperiodlastyear-function-dax). These functions only allow lateral time shifts and don't return values from a different level of detail.
- **Flexible**. This group contains all other time intelligence functions. These functions do allow hierarchical time shifts and depending on the calendar setup can return results from a different level of detail.

To show these behaviors, let's walk through an example using a simple data model consisting of two tables, two calendars and five measures.

#### Tables and relationships

For this example, we have the following simple data model:

|Table|Columns|
|--|--|
|Date|Year, IsWorkingDay, Date|
|Sales|OrderKey, Quantity, OrderDate|

Here are some examples rows in the **Date** table:
:::image type="content" source="media/desktop-time-intelligence/calendars-example-date-table-rows.png" alt-text="Screenshot showing the first 14 rows of the example Date table. The table defines Date, Year, and IsWorkingDay. The Date column contains a date, the Year column the year value, and the IsWorkingDay column is a boolean (True/False) column that indicates if the date is a working day or not." lightbox="media/desktop-time-intelligence/calendars-example-date-table-rows.png":::

Here are some example rows in the **Sales** table:
:::image type="content" source="media/desktop-time-intelligence/calendars-example-sales-table-rows.png" alt-text="Screenshot showing the first nine rows of the example Sales table. The table defines OrderKey, OrderDate, and Order Quantity. The OrderKey column contains a unique number for each sales order, the OrderDate is a date that relates Sales to Date and the Order Quantity is a numerical column that represents the number of products for each order." lightbox="media/desktop-time-intelligence/calendars-example-sales-table-rows.png":::

The Sales and Date tables are related on OrderDate and Date.

:::image type="content" source="media/desktop-time-intelligence/calendars-example-data-model.png" alt-text="Screenshot showing the model view for the example model. It shows the Sales and Date table and a one-to-many relationship between them on OrderDate and Date." lightbox="media/desktop-time-intelligence/calendars-example-data-model.png":::

#### Calendars

On the **Date** table, we defined calendars with these mappings:

|CalendarName|Category|Primary Column|
|--|--|--|
|**Gregorian**|Year|Year|
||Date|Date|
|**GregorianWithWorkingDay**|Year|Year|
||Date|Date|
||Time-related|IsWorkingDay|

The equivalent TMDL definition of these two calendars is:

```tmdl
ref table Date
    calendar 'Gregorian'
        lineageTag: xyz
    
        calendarColumnGroup = year
    	    primaryColumn: Year
    
    	calendarColumnGroup = date
    		primaryColumn: Date
    
    calendar 'GregorianWithWorkingDay'
    	lineageTag: dc4fc383-1661-4112-8afb-930d324fbb6e
    
    	calendarColumnGroup = year
    		primaryColumn: Year
    
    	calendarColumnGroup = date
    		primaryColumn: Date
    
    	calendarColumnGroup
    		column: IsWorkingDay   
```

#### Measures

On the **Sales** table, we define the following measures:

```dax
Total Quantity = SUM ( 'Sales'[Order Quantity] )

OneYearAgoQuantity =
CALCULATE ( [Total Quantity], DATEADD ( 'Gregorian', -1, YEAR ) )

OneYearAgoQuantityTimeRelated =
CALCULATE ( [Total Quantity], DATEADD ( 'GregorianWithWorkingDay', -1, YEAR ) )

FullLastYearQuantity =
CALCULATE ( [Total Quantity], PARALLELPERIOD ( 'Gregorian', -1, YEAR ) )

FullLastYearQuantityTimeRelated =
CALCULATE ( [Total Quantity], PARALLELPERIOD ( 'GregorianWithWorkingDay', -1, YEAR )
)
```

#### Lateral shift example

Let's create a visual that shows Year, MonthOfYear, IsWorkingDay, Total Quantity, OneYearAgoQuantity and OneYearAgoQuantityTimeRelated for 2024 and 2025:

:::image type="content" source="media/desktop-time-intelligence/calendars-example-lateral-shift.png" alt-text="Screenshot showing a table visual that shows Year, IsWorkingDay, Total Quantity, OneYearAgoQuantity and OneYearAgoQuantityTimeRelated. The values for OneYearAgoQuantity and OneYearAgoQuantityTimeRelated for 2025 match the values for 2024 for the same IsWorkingDay values." lightbox="media/desktop-time-intelligence/calendars-example-lateral-shift.png":::

All values for **OneYearAgoQuantity** and **OneYearAgoQuantityTimeRelated** for 2025 match the **Total Quantity** from exactly one year before (2024), for the same **IsWorkingDay** value.

This shows that [DATEADD](/dax/dateadd-function-dax) maintains the context on any column on the Date table that contains the calendar used regardless of if it isn't tagged or if it's tagged as time-related on that calendar. Since in our [measure definitions](#measures) we instructed DATEADD to shift back by one **Year**, the only column whose context was shifted was the column associated with the Year category. Whether the **IsWorkingDay** column was tagged in the calendar as time-related or not tagged at all didn't change the result. The only other function that exhibits this behavior is [SAMEPERIODLASTYEAR](/dax/sameperiodlastyear-function-dax).

#### Hierarchical shift example

Now, let's look at an example in which whether a column is tagged as time-related or not does indeed change the result.

For this, we're going to recreate the same visual as in the previous example, but this time we're going to use the FullLastYearQuantity and FullLastYearQuantityTimeRelated measures:
:::image type="content" source="media/desktop-time-intelligence/calendars-example-hierarchical-shift.png" alt-text="Screenshot showing a table visual that shows Year, IsWorkingDay, Total Quantity, FullLastYearQuantity and FullLastYearQuantityTimeRelated. The values for FullLastYearQuantity 2025 match the values for 2024 for the same IsWorkingDay values, but the values for FullLastYearQuantityTimeRelated are equal to the total quantity value regardless of the IsWorkingDay values." lightbox="media/desktop-time-intelligence/calendars-example-hierarchical-shift.png":::

This shows that [PARALLELPERIOD](/dax/parallelperiod-function-dax) preserves context for columns not tagged in the calendar but clears the context for those tagged as time-related. **FullLastYearQuantity** used the **Gregorian** calendar where IsWorkingDay wasn't tagged in the calendar, while **FullLastYearQuantityTimeRelated** used the **GregorianWithWorkingDay** calendar where IsWorkingDay was tagged as time-related. All time intelligence functions except DATEADD and SAMEPERIODLASTYEAR behave this way.

Bonus: If you really wanted to force these functions to preserve context for time-related columns as well, you can use [:::no-loc text="VALUES":::](/dax/values-function-dax):

```dax
FullLastYearQuantityTimeRelatedOverride =
CALCULATE ( [Total Quantity], PARALLELPERIOD ( 'GregorianWithWorkingDay', -1, YEAR ), VALUES('Date'[IsWorkingDay]) )
```

In this case, `FullLastYearQuantityTimeRelatedOverride` returns the same results as `FullLastYearQuantity`.

#### Conclusion

The elaborate example above shows that different time intelligence functions behave differently depending on whether columns are tagged as time-related in the calendar. [DATEADD](/dax/dateadd-function-dax) and [SAMEPERIODLASTYEAR](/dax/sameperiodlastyear-function-dax) only perform lateral time shifts. All other [time intelligence functions](/dax/time-intelligence-functions-dax) allow hierarchical time shifts.

### Use DATEADD and DATESINPERIOD with calendars

The [DATEADD](/dax/dateadd-function-dax) and [DATESINPERIOD](/dax/datesinperiod-function-dax) functions have specific parameters that allow fine-grained control over how shifts are performed when the selection is on a more granular level than the shift level indicated by `interval` parameter. This happens, for example,  if you're showing data on the date level but set the `interval` parameter to these functions to **MONTH**. For example, in a Gregorian calendar, when shifting a period that spans March 3 to 10 by a month will result in April 3 to 10. However, since months in Gregorian calendars vary in length, this can lead to ambiguities when shifting. Below are example scenarios based on a Gregorian calendar:

#### Shift from a shorter to a longer period

For example, shifting forward one month with a selection in February, so the target month is March.
You can use the `extension` parameter on DATEADD to influence how the shift is performed:

|Extension parameter value|Description|Result|
|--|--|--|
|`precise`|This keeps the original date range strictly.|February 25-28 is shifted to March 25-28.|
|`extended`|Allows the window to expand toward the end of the month.|February 25-28 is shifted to March 25-31.|
|`endaligned`|Aligns the end date with the end of the destination month when the selection reaches the end of its month; otherwise preserves relative positions.|February 28 is shifted to March 31, while February 27 is shifted to March 27.|

> [!NOTE]
> DATESINPERIOD provides a `endbehavior` parameter which offers the `precise` and `endaligned` options.

#### Shift from a longer to a shorter period

For example, shifting backward one month with a selection in March, so the target month is February.

You can use the `truncation` parameter on DATEADD to influence how the shift is performed:

|Truncation parameter value|Description|Result|
|--|--|--|
|`anchored`|Anchors the result to the last valid date of the smaller month.|March 31 is shifted to February 28 (or 29 in  leap year).|
|`blank`|When a shifted date doesn't exist, return *blank*.|Shifting March 31 back one month returns *blank* (since February 31 doesn't exist).|

> [!NOTE]
> This parameter is not available for DATEINPERIOD.

### Considerations for working with calendar-based time-intelligence

- Performing a time intelligence calculation on a fact table that defines a calendar and is subject to [Row-level security (RLS)](/fabric/security/service-admin-row-level-security) rules and can lead to unexpected results.
- Performance of this preview feature isn't representative of the end product.
- You can't author calendars in the Power BI Service yet.
- You shouldn't use [auto date/time](desktop-auto-date-time.md) tables with custom calendars.
- You can't use calendars with live connected or composite models.
- We recommend you associate only the columns in your calendar that you want to use in time intelligence calculations.
- Calendars are subject to both [real-time](#real-time-validations) and [offline](#offline-validations) validations. You can save your calendar despite offline validation errors, but resolving them first is recommended. Real-time validation failures must be fixed to save.
- Each calendar must have a unique name within the data model
- A single table can contain multiple calendars
- The table that contains the calendar must have fewer than 200 columns. If the table contains more than 20,000 rows the validations won't be available but you can still add a calendar.
- A calendar must at least assign one primary column to a category
- A calendar can only assign columns from its own table to categories
- Each category should have a primary column and can have zero or more associated columns assigned
- [DATEADD has new parameters to control extension and extension behavior](/dax/dateadd-function-dax), which aren't recognized in IntelliSense.
- Any given column can be mapped to only one category
- You can't nest time intelligence functions that use calendars. For example, the following DAX statement isn't supported:

 ```dax
 ThisIsNotSupported = PREVIOUSDAY ( PREVIOUSMONTH( 'Calendar' ) )
 ```

Instead, you can do:
 
```dax
ThisWorks = CALCULATETABLE ( PREVIOUSDAY ( 'Calendar' ), PREVIOUSMONTH( 'Calendar' ) )
```

## Create a date table using built-in tools

The following examples create a date table from January 1, 2010 to December 31, 2030 using either Power Query M or DAX. It includes the following columns: Year, Month Number, Month Name, Month Year, Quarter, Year Quarter, Day, and Date.

### Power Query M

```powerquery-m
let
    StartDate = #date(2010, 1, 1),
    EndDate = #date(2030, 12, 31),
    NumberOfDays = Duration.Days(EndDate - StartDate) + 1,
    DateList = List.Dates(StartDate, NumberOfDays, #duration(1,0,0,0)),
    DateTable = Table.FromList(DateList, Splitter.SplitByNothing(), {"Date"}),
    AddYear = Table.AddColumn(DateTable, "Year", each Date.Year([Date]), Int64.Type),
    AddMonthNumber = Table.AddColumn(AddYear, "Month Number", each Date.Month([Date]), Int64.Type),
    AddMonthName = Table.AddColumn(AddMonthNumber, "Month Name", each Date.ToText([Date], "MMMM"), type text),
    AddMonthYear = Table.AddColumn(AddMonthName, "Month Year", each Date.ToText([Date], "MMM yyyy"), type text),
    AddQuarter = Table.AddColumn(AddMonthYear, "Quarter", each "Q" & Text.From(Date.QuarterOfYear([Date])), type text),
    AddYearQuarter = Table.AddColumn(AddQuarter, "Year Quarter", each Text.From(Date.Year([Date])) & " Q" & Text.From(Date.QuarterOfYear([Date])), type text),
    AddDay = Table.AddColumn(AddYearQuarter, "Day", each Date.Day([Date]), Int64.Type)
in
    AddDay
```

### DAX

```dax
DateTable =
ADDCOLUMNS (
    CALENDAR ( DATE ( 2010, 1, 1 ), DATE ( 2030, 12, 31 ) ),
    "Year", YEAR ( [Date] ),
    "Month Number", MONTH ( [Date] ),
    "Month Name", FORMAT ( [Date], "MMMM" ),
    "Month Year", FORMAT ( [Date], "MMM YYYY" ),
    "Quarter", "Q" & FORMAT ( [Date], "Q" ),
    "Year Quarter",
        FORMAT ( [Date], "YYYY" ) & " Q"
            & FORMAT ( [Date], "Q" ),
    "Day", DAY ( [Date] ),
    "Date", [Date]
)
```

For more information and more options see [Date tables](../guidance/model-date-tables.md).

## Related content

For more information related to this article, see the following resources:

- [Apply auto date/time in Power BI Desktop](desktop-auto-date-time.md)
- [Design guidance for date tables in Power BI Desktop](../guidance/model-date-tables.md)
- [Data types in Power BI Desktop](../connect-data/desktop-data-types.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
