---
title: Implement data translations for a calendar table
description: Learn how to add translation support in multiple-language reports for text-based columns in calendar tables in Power BI.
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: how-to
ms.date: 07/26/2023
---
# Implement data translations for a calendar table

If you're implementing data translations, you can add translation support for text-based columns in calendar tables. These tables include translations for the names of months or the days of the week. This approach allows you to create visuals that mention days or months.

:::image type="content" source="./media/data-translation-calendar-table/calendar-table.png" alt-text="Screenshot shows report visuals that display the names of months and days." lightbox="./media/data-translation-calendar-table/calendar-table.png":::

Translated versions make the visual easy to read in your supported languages.

:::image type="content" source="./media/data-translation-calendar-table/calendar-table-translate.png" alt-text="Screenshot shows report visuals that display the names of months and days localized." lightbox="./media/data-translation-calendar-table/calendar-table-translate.png":::

The strategy in this article for calendar table column translations uses Power Query and the M query language. Power Query provides built-in functions, such as `Date.MonthName`, which accept a `Date` parameter and return a text-based calendar name. If your .pbix project has **en-US** as its default language and locale, the following Power Query function call evaluates to a text-based value of *January*.

```powerquery-m
Date.MonthName( #date(2023, 1, 1) )
```

The `Date.MonthName` function accepts an second, optional string parameter to pass a specific language and locale.

```powerquery-m
Date.MonthName( #date(2023, 1, 1), "en-US")
```

If you want to translate the month name into French, you can pass a text value of **fr-FR**.

```powerquery-m
Date.MonthName( #date(2022, 12, 1), "fr-FR")
```

## Generate calendar translation table

Look at the **Languages** table used in previous examples. It includes a **DefaultCulture** column.

:::image type="content" source="./media/data-translation-calendar-table/language-table.png" alt-text="Screenshot shows the Languages table, which as a default culture column." lightbox="./media/data-translation-calendar-table/language-table.png":::

Power Query is built on a functional query language named M. With that language, you can iterate through the rows of the **Languages** table to discover what languages and what default cultures the project supports. You can write a query that uses the **Languages** table as its source to generate a calendar translation table with the names of months or weekdays.

:::image type="content" source="./media/data-translation-calendar-table/lanaguage-month-day-table.png" alt-text="Diagram shows the Languages table used as the source of a Power Query transform to create month and day name tables." lightbox="./media/data-translation-calendar-table/lanaguage-month-day-table.png":::

Here's the M code that generates the **Translated Month Names Table**.

```powerquery-m
let
  Source = #table( type table [ MonthNumber = Int64.Type ], List.Split({1..12},1)),
  Translations = Table.AddColumn( Source, "Translations",
    each
      [ MonthDate = #date( 2022, [ MonthNumber ], 1 ),
        Translations = List.Transform(Languages[DefaultCulture], each Date.MonthName( MonthDate, _ ) ),
        TranslationTable = Table.FromList( Translations, null ),
        TranslationsTranspose = Table.Transpose(TranslationTable),
        TranslationsColumns = Table.RenameColumns(
          TranslationsTranspose,
          List.Zip({ Table.ColumnNames( TranslationsTranspose ),
            List.Transform(Languages[Language],
            each "MonthNameTranslations" & _ ) })
          )
      ]
  ),
  ExpandedTranslations = Table.ExpandRecordColumn(Translations,
                                                  "Translations",
                                                  { "TranslationsColumns" },
                                                  { "TranslationsColumns" }),
  ColumnsCollection = List.Transform(Languages[Language], each "MonthNameTranslations" & _ ),
  ExpandedTranslationsColumns = Table.ExpandTableColumn(ExpandedTranslations,
                                                        "TranslationsColumns",
                                                        ColumnsCollection,
                                                        ColumnsCollection ),
  TypedColumnsCollection = List.Transform(ColumnsCollection, each {_, type text}),
  QueryOutput = Table.TransformColumnTypes(ExpandedTranslationsColumns, TypedColumnsCollection)
in
  QueryOutput
```

> [!TIP]
> You can simply copy and paste the M code from the *ProductSalesMultiLanguage.pbix* sample whenever you need to add calendar translation tables to your project.

If the **Languages** table contains four rows for English, Spanish, French, and German, the **Translated Month Names Table** query generates a table with four translation columns as shown in the following screenshot.

:::image type="content" source="./media/data-translation-calendar-table/lanaguage-month-table.png" alt-text="Screenshot shows Translated Month Names Table query and the table it creates." lightbox="./media/data-translation-calendar-table/lanaguage-month-table.png":::

Likewise, the query named **Translated Day Names Table** generates a table with weekday name translations.

:::image type="content" source="./media/data-translation-calendar-table/lanaguage-day-table.png" alt-text="Screenshot shows Translated Day Names Table query and the table it creates." lightbox="./media/data-translation-calendar-table/lanaguage-day-table.png":::

The two queries named **Translated Month Names Table** and **Translated Day Names Table** have been written to be generic. They don't contains any hard-coded column names. These queries don't require any modifications in the future when you add or remove languages from the project. All you need to do is to update the data rows in the query.

:::image type="content" source="./media/data-translation-calendar-table/advanced-editor-language.png" alt-text="Screenshot shows the Advanced Editor with languages selected in the Sort Order block." lightbox="./media/data-translation-calendar-table/advanced-editor-language.png":::

## Configure sort values

When you run these two queries for the first time, they create two tables in the semantic model with the names **Translated Month Names Table** and **Translated Day Names Table**. There's a translation column for each language. You need to configure the sort column for each of the translation columns:

- Configure the translation columns in **Translated Month Names Table** to use the sort column  **MonthNumber**
- Configure the translations columns in **Translated Day Names Table** to use the sort column **DayNumber**

:::image type="content" source="./media/data-translation-calendar-table/sort-column-month-number.png" alt-text="Screenshot shows a column of month names being set to sort by month number." lightbox="./media/data-translation-calendar-table/sort-column-month-number.png":::

## Integrate translation tables

The next step is to integrate the two tables into the data model with a **Calendar** table. The **Calendar** table is a calculated table based on the following Data Analysis Expressions (DAX) expression.

:::image type="content" source="./media/data-translation-calendar-table/dax-expression-table.png" alt-text="Screenshot shows the table with its DAX code." lightbox="./media/data-translation-calendar-table/dax-expression-table.png":::

Create a relationship between the **Calendar** table and the [fact tables](star-schema.md#fact-tables), such as **Sales**, using the **Date** column to create a one-to-many relationship. The relationships created between the **Calendar** table and the two translations tables are based on the **MonthNumber** column and the **DayNumber** column.

:::image type="content" source="./media/data-translation-calendar-table/calendar-month-associate.png" alt-text="Screenshot shows the Model view with the Translated Month Names table in a relationship with the Calendar table." lightbox="./media/data-translation-calendar-table/calendar-month-associate.png":::

After you create the required relationships with the **Calendar** table, create a new field parameter for each of the two calendar translations tables. Creating a field parameter for a calendar translation table is just like creating the field parameters for product names and category names shown earlier.

:::image type="content" source="./media/data-translation-calendar-table/translate-month-name.png" alt-text="Screenshot shows Table view of the Translated Month Names table." lightbox="./media/data-translation-calendar-table/translate-month-name.png":::

Add a relationship between these new field parameter tables and the **Languages** table to ensure the language filtering strategy works as expected.

:::image type="content" source="./media/data-translation-calendar-table/translate-table-relationship.png" alt-text="Screenshot shows the Languages table in relationship to several translated tables.":::

After you create the field parameters for **Translated Month Names** and **Translated Day Names**, you can begin to surface them in a report using cartesian visuals, tables, and matrices.

:::image type="content" source="./media/data-translation-calendar-table/surface-translate-date.png" alt-text="Screenshot shows the Day value for x-axis in a visual." lightbox="./media/data-translation-calendar-table/surface-translate-date.png":::

After you set up everything, you can test your work using a report-level filter on the **Languages** table to switch between languages and to verify translations for names of months and days of the week work as expected.

:::image type="content" source="./media/data-translation-calendar-table/report-level-filter.png" alt-text="Screenshot shows a filter with a language selected and the visuals reflecting the selection." lightbox="./media/data-translation-calendar-table/report-level-filter.png":::

## Related content

- [Load multiple-language reports](data-translation-load-report-bookmark.md)
