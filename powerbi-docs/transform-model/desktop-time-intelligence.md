---
title: Implementing time-based calculations in Power BI
description: Learn how to use time intelligence to implement time-based calculations
author: jeroenterheerdt
ms.author: jterh
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 06/13/2025
LocalizationGroup: Model your data
---
# Implementing time-based calculations in Power BI

Power BI offers multiple tools to perform time-based calculations, which either rely on automatic date tables or date tables you add.

We recommend using [calendar-based time intelligence (preview)](#calendar-based-time-intelligence-preview) because it provides the best performance and highest range of flexibility to meet any calendar.

This table compares the three tools provided:

|Tool|Set up effort required|Ease of management|Flexiblity|Notes|
|--|--|--|--|--|
|[Auto-date/time](desktop-auto-date-time.md)|virtually zero|hard|low|Increases model size due to multiple hidden date tables between created|
|[Classic time intelligence](#classic-time-intelligence)|medium|easy|low|Requires creation of a date table, assumes Gregorian or shifted Gregorian calendar, suffers from performance issues in some specific scenarios|
|[Calendar-based time intelligence](#calendar-based-time-intelligence-preview)|high|medium|high|Recommended to create a date table, highest flexibility, best performance, but increase setup cost|

## Auto-date/time
The auto-date/time feature automatically creates hidden date tables for each date field in your data model. For more information about this automatic behavior, see [Apply auto date/time in Power BI Desktop](desktop-auto-date-time.md).

> [!NOTE]
> While auto-date/time is a convenient option for simple models, it isn't recommended for more complex scenarios and larger models. For those models, it's preferable to create a dedicated table for more flexibility.

## Adding a date table

For most models, it's recommended to add a date table (or more in some scenarios). Many data analysts prefer to create their own date tables, which is fine.

There are multiple ways of creating such a table, including:

- **Power Query M**. You can use the [List.Dates](/powerquery-m/list-dates) function. [An example is provided later in this document](#creating-a-date-table-using-built-in-tools).
- **DAX**. You can use the [CALENDAR](/dax/calendar-function-dax) or [CALENDARAUTO](/dax/calendarauto-function-dax) functions to generate a basic calculated date table. You can also use a more advanced DAX statement to create a date table. [An example is provided later in this document](#creating-a-date-table-using-built-in-tools).
- **External tools**.
- **Loading from a source**, such as a source system, a file, or another Power BI semantic model.
Which option is best for you depends on various factors and is beyond the scope of this tutorial.

## Working with time-based calculations

Assuming you aren't using [auto date/time](desktop-auto-date-time.md), there are two alternative ways of working with [Time intelligence functions in Power BI](/dax/time-intelligence-functions-dax) to perform time-based calculations:

- [**Classic time intelligence**](#classic-time-intelligence). The easiest option and works great for Gregorian or shifted Gregorian calendars but has limited flexibility for calendars that are structured differently or for week-based calculations. Requires you to [set the date table](desktop-date-tables.md).

- [**Calendar based time-intelligence (preview)**](#calendar-based-time-intelligence-preview). Newer option, but requires a bit more work to set up. However, it also gives you better performance, more flexibility to work with non-Gregorian calendars and the ability to perform week-based calculations. This option doesn't require you to [set the table as a date table](desktop-date-tables.md), except if you're planning to [connect Excel Pivot Tables to your semantic model](https://support.microsoft.com/office/create-a-pivottable-from-power-bi-datasets-31444a04-9c38-4dd7-9a45-22848c666884).

## Classic time intelligence

This option requires you to have a date table in your model and [set it accordingly](desktop-date-tables.md). Afterwards, you can use the [time intelligence functions](/dax/time-intelligence-functions-dax) and refer to your date table. For example, if you have a date table called **Date** in your model that you set as your date table, which contains a Date column then you can use:

```dax
SAMEPERIODLASTYEAR ( 'Date'[Date] )
```

While this is a fast and easy approach, there are many downsides compared to the [calendar-based approach](#calendar-based-time-intelligence-preview):

- it requires you set the date table
- it only works with models that have at least one dedicated date table
- it's less flexible as it's optimized for Gregorian or shifted Gregorian calendars, such as fiscal years that start on July 1 but still follow a Gregorian calendar
- it doesn't provide week-based calculations
- in specific scenarios, time-based calculations don't perform well.

> [!NOTE]
> We recommend you use the [enhanced, calendar-based](#calendar-based-time-intelligence-preview) approach.

## Calendar-based time-intelligence (preview)

Calendars are metadata definitions added to a table to indicate which columns from that table represent what attributes of time. Calendars give you full flexibility to decide how to divide up time in years, quarters, months, and weeks. You can, for example, define the calendars that follow these patterns:

- Gregorian
- Shifted Gregorian
- Retail (445, 454, 544 patterns)
- 13-month
- Lunar

The possibilities are endless as there's no built-in assumption from Power BI on how your calendar is structured.

You can define one or more calendars on any table in your model. After you defined the calendar in your model, you can refer to it in your time-intelligence functions. For example, here's how to calculate a total year to date of Sales using a defined **Fiscal calendar**:

```dax
TOTALYTD ( [Sales], 'Fiscal Calendar' )
```

> [!NOTE]
> When working with Calendars you don't need to set your date table, unless in [specific scenarios](desktop-date-tables.md).

### Enabling the enhanced DAX Time Intelligence preview

To get started, you first need to enable the **Enhanced DAX Time Intelligence** preview feature.

1. In Power BI Desktop, go to File > Options and settings > Options > Preview features.

2. Select the **Enhanced DAX Time Intelligence** preview.
3. Select **OK**
4. Restart Power BI Desktop

### Managing calendars

To manage a calendar, right-click the table that contains the calendar or on which you want to define the calendar and choose **Calendar options** or select **Calendar options** in the Table tools ribbon after selecting the table:

:::image type="content" source="media/desktop-time-intelligence/calendar-options-entrypoints.png" alt-text="Screenshot showing the entry points to open the Calendar Options on a table." lightbox="media/desktop-time-intelligence/calendar-options-entrypoints.png":::

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

#### Considerations

When creating or editing a calendar, keep in mind that:

- Each calendar must have a unique name within the data model
- A single table can contain multiple calendars
- A calendar must at least assign one primary column to a category
- A calendar can only assign columns from its own table to categories
- Each category should have a primary column and can have zero or more associated columns assigned
- Any given column can be mapped to only one category per calendar
- However, a column can be mapped to different categories across different calendars within the same table

### Assigning column categories

Defining a calendar involves giving it a name and assigning columns to categories. Each category represents a unit of time and specific [column categories](#available-column-categories) are available. You need to at least assign one primary column to a category to save your calendar. Each category should have a [primary column and can have zero or more associated columns](#primary-vs-associated-columns). Whenever any columns associated to a category are in context Power BI knows what unit of time they present. Additionally, for some functions such as [TOTALMTD](/dax/totalmtd-function-dax.md) Power BI uses the primary column mapped to the relevant category in the referenced calendar to perform the requested calculation.
To assign a column to a category, select the category from the **Add category** menu and then select the primary and optional associated columns.

:::image type="content" source="media/desktop-time-intelligence/calendar-select-category.png" alt-text="Screenshot showing the calendar creation and edit screen." lightbox="media/desktop-time-intelligence/calendar-select-category.png":::

### Available column categories

The following table shows the categories that are available and provides the expected cardinality in a Gregorian calendar. It also gives example values for Gregorian calendars.

|Category|Description|Cardinality in a Gregorian calendar|Example column values in a Gregorian calendar|
|--|--|--|--|
|Year|The year|`Y` = number of years|2024, 2025|
|Quarter|The quarter including the year|`4*Y`|Q1 2024, Q2 2025|
|Quarter of Year|The quarter of the year|`4`|Year Quarter 1, YQ1, Q1, Quarter 2|
|Month|The month including the year|`12*Y ≤ value ≤ 13*Y`|January 2023, 2024 Feb|
|Month of Year|The month of the year|`12`|January, Year Month 11, YM11, M11, 11|
|Month of Quarter|The month of the quarter|`3`|1, QM2|
|Week|The week including the year|`52 ≤ value ≤ 53`|Week 50 2023, W50-2023, 2023-W50|
|Week of Year|The week of the year|`52`|Week 50, W50, 50|
|Week of Quarter|The week of the quarter|`13`|Quarter Week 10, QW10, 10|
|Week of Month|The week of the month|`5`|Month Week 2, MW2, 2|
|Day of Year|The day of the year|`365 ≤ value ≤366`|365, D1|
|Day of Quarter|The day of the quarter|`92`|Quarter Day 10, QD2, 50|
|Day of Month|The day of the month|`31`|Month Day 30, MD10, 30|
|Day of Week|The day of the week|`7`|Week Day 5, WD5, 5|
|Date|The date|`365*Y ≤ value ≤ 366*Y`|12/31/2025|

In addition these categories, you can associate any number of columns on your table with the **Time-related** category. This isn't currently possible in the calendar options, but can instead only be done using external tools or [TMDL](#tmdl-script-for-calendars).

> [!NOTE]
> Context on any columns that are assigned to this category is removed when performing calculations. Any context on columns that are part of the table on which the calendar is defined but aren't tagged in that calendar is kept.

**TODO: this needs an example - but need help creating the example**

### Primary vs associated columns

The primary column is required for each category. Whenever that column or any associated columns assigned to the same category on the referenced calendar are in context or the category is required to perform a calculation, Power BI uses the primary column.
You can have zero or more associated columns assigned to a category.

### Validation

It's important to validate and test your calendar so you're certain it meets your needs. The validations offered in Power BI include both [real-time validations](#real-time-validations) and [offline validations](#offline-validations).

> [!NOTE]
> You can still save your calendar even if the validations fail, but it's recommended to perform the validations and resolve any issues before saving your calendar.

### Real-time validations

Whenever you add a category that has a **X of Y** name, such as **Day of Year** Power BI validates that the **"Y"** (**Year** in this example) category is also tagged in the same calendar. If that isn't the case, a warning is shown.

:::image type="content" source="media/desktop-time-intelligence/calendar-realtime-validation-error.png" alt-text="Screenshot showing the calendar creation and edit screen with a real-time validation error." lightbox="media/desktop-time-intelligence/calendar-realtime-validation-error.png":::

### Offline validations

Offline validations can potentially be time consuming as they access table data. Therefore, they don't run automatically in contrast with the [real-time validations](#real-time-validations). To run the validations, select **Validate data**:

:::image type="content" source="media/desktop-time-intelligence/calendar-run-offline-validations.png" alt-text="Screenshot showing the calendar creation and edit screen. The Validate data button is highlighted." lightbox="media/desktop-time-intelligence/calendar-run-offline-validations.png":::

The offline validations check the following rules and  returns a warning if any rules are invalidated in your calendar:

- a column associated with a category doesn't have blank values.
- higher level and lower level categories have a one-to-many cardinality ratio. For example, columns associated with the Year category should have a one-to-many cardinality with columns associated with the Month category.
- columns associated with categories on the same level have a one-to-one cardinality ratio. For example, columns associated with the Month category should have a one-to-one cardinality with columns associated with the Month of Year and Year categories.
- primary and associated columns assigned to the same category have a one-to-one cardinality ratio. For example, when assigned to the Month category, a primary column Month and an associated column EnglishMonthName should have a one-to-one cardinality.

### Working with calendars

Once a calendar is defined, you can refer to it in [Time intelligence functions](/dax/time-intelligence-functions-dax) using the second parameter. For example, the following measure calculates a total month to date value of Total Quantity against the **ISO-454** calendar:

```dax
Total Quantity MTD ISO-454 = TOTALMTD ( [Total Quantity], 'ISO-454' )
```

If the calendar isn't defined and error is returned:

:::image type="content" source="media/desktop-time-intelligence/calendar-time-intelligence-non-existing-calendar.png" alt-text="Screenshot showing a measure using the TOTALMTD function with a calendar parameter to a nonexisting calendar." lightbox="media/desktop-time-intelligence/calendar-time-intelligence-non-existing-calendar.png":::

Even if the calendar is defined, however, a measure might still return an error. This happens if the function used expects a category to be present in the calendar and the calendar doesn't have that category. For example, [TOTALWTD](/dax/totalwtd-function-dax.md) expects specific categories to be present in the calendar. If they aren't, an error is returned:

:::image type="content" source="media/desktop-time-intelligence/calendar-time-intelligence-missing-category-calendar.png" alt-text="Screenshot showing a measure using the TOTALWTD function with a valid calendar reference that doesn't define the required categories." lightbox="media/desktop-time-intelligence/calendar-time-intelligence-missing-category-calendar.png":::

### Time intelligence functions and required categories

Many [Time intelligence functions](/dax/time-intelligence-functions-dax) require sufficient categories to be included on the calendar that is referenced in the function call so Power BI can identify a uniquely particular unit of time.In other words, Power BI needs to be able to "walk-up" from the level the calculation is performed on all the way to a individual year. For example, when performing a calculation on quarters, for example using [TOTALQTD](/dax/totalqtd-function-dax.md) either assign  **Quarter** category, or assign both **Quarter of Year** and **Year** in the calendar.
Similarly, when performing a week-based calculation the calendar should at least assign a primary column to one of the following sets of categories:

- Week
- Week of Year, Year
- Week of Quarter, Quarter
- Week of Quarter, Quarter of Year, Year
- Week of Month, Month
- Week of Month, Month of Year, Year
- Week of Month, Month of Quarter, Quarter
- Week of Month, Month of Quarter, Quarter of Year, Year

> [!NOTE]
> For some functions their name is indicative for on which level the calculation operates (i.e.,[TOTALYTD](/dax/totalytd-function-dax.md)), while for others it is dependent on the parameters ([DATEADD](/dax/dateadd-function-dax.md)) or the context ([SAMEPERIODLASTYEAR](/dax/sameperiodlastyear-function-dax.md))

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
			lineageTag: 6a50619c-c3ab-43d4-88fb-f5099f189d17
			summarizeBy: none
			sourceColumn: Year

			annotation SummarizationSetBy = Automatic
        
        column Month
			dataType: string
			lineageTag: 148d98d9-511b-4e80-bcb0-453c44a47779
			summarizeBy: none
			sourceColumn: Month

			annotation SummarizationSetBy = Automatic

        column MonthName
			dataType: string
			lineageTag: 31366904-e84e-4c74-9662-468fa868417a
			summarizeBy: none
			sourceColumn: MonthName
			sortByColumn: SortByMonth

			changedProperty = SortByColumn

			annotation SummarizationSetBy = Automatic

        column DutchMonthName
			dataType: string
			lineageTag: 076ad25d-60aa-47b2-bd7a-3115b6729b7c
			summarizeBy: none
			sourceColumn: DutchMonthName

			annotation SummarizationSetBy = Automatic

        column 'Holiday Name'
			dataType: string
			lineageTag: ab100b31-bbe4-460d-b0c1-a5e46f93c1e5
			summarizeBy: none
			sourceColumn: Holiday Name

			annotation SummarizationSetBy = Automatic
        
        column IsWorkingDay
			dataType: string
			lineageTag: 40fc5f7a-8295-49b8-aef7-a9d6c3af97e1
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

		annotation PBI_ResultType = Table

		annotation PBI_NavigationStepName = Navigation
```

## Creating a date table using built-in tools

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

## Related content

For more information related to this article, see the following resources:

- [Apply auto date/time in Power BI Desktop](desktop-auto-date-time.md)
- [Design guidance for date tables in Power BI Desktop](../guidance/model-date-tables.md)
- [Data types in Power BI Desktop](../connect-data/desktop-data-types.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
