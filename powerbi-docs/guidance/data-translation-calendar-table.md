---
title: 
description: 
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: how-to
ms.date: 07/26/2023
---
# Implement data translations for a calendar table

If you're implementing data translations, you can make your users happy by adding translation support for text-based columns in a **Calendar** table such as the names of months and days of the week. For example, you might have added a custom **Calendar** table to your data model, which makes it possible to visualize a breakdown of sales by the month or by the day.

:::image type="content" source="./media/data-translation-calendar-table/calendar-table.png" alt-text="Image alt text." lightbox="./media/data-translation-calendar-table/calendar-table.png":::

To properly implement data translations for columns in a calendar table, you need a strategy to translate month names and day of the week names into the secondary languages you plan to support.

:::image type="content" source="./media/data-translation-calendar-table/calendar-table-translate.png" alt-text="Image alt text." lightbox="./media/data-translation-calendar-table/calendar-table-translate.png":::

The strategy presented in this article for implementing **Calendar** table column translations is based on Power Query and the power of the M query language. Power Query provides several built-in functions such as **Date.MonthName** which accept a **Date** parameter and return a text-based calendar name. If your .pbix project has **en-US** as its default language and locale, the following Power Query function call evaluates to a text-based value of **January**.

```powerquery-m
Date.MonthName( #date(2023, 1, 1) )
```

The **Date.MonthName** function accepts an second, optional string parameter to pass a specific language and locale.

```powerquery-m
Date.MonthName( #date(2023, 1, 1), "en-US")
```

If you want to translate the month name into French, you can pass a text value of **fr-FR**.

```powerquery-m
Date.MonthName( #date(2022, 12, 1), "fr-FR")
```

Now, let's revisit the **Languages** table you saw earlier. Now we can reveal why it includes the **DefaultCulture** column.

:::image type="content" source="./media/data-translation-calendar-table/language-table.png" alt-text="Image alt text." lightbox="./media/data-translation-calendar-table/language-table.png":::

Power Query is built on a functional query language named M that makes it possible to enumerate through the rows of the **Languages** table to discover what languages and what default cultures are supported in the current project. This approach makes it possible to write a query that uses the **Languages** table as its source to generate a calendar translation table with the names of months or weekdays.

<img src="./images/BuildingMultiLanguageReportsInPowerBI/media/lanaguage-month-day-table.png"    />

Here's the code listing for the M code used to generate the **Translated Month Names Table**.

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

> OK, so maybe this M code is a bit complicated. Don't worry. You're not Chris Webb after all, so  don't feel you need to be able to understand or explain this industrial-strength M code to others. You can simply copy and paste the M code from [**ProductSalesMultiLanguage.pbix**](https://github.com/PowerBiDevCamp/TranslationsBuilder/raw/main/LiveDemo/ProductSalesMultiLanguage.pbix) whenever you need to add calendar translation tables to your project.

If the **Languages** table contains four rows for English, Spanish, French and German, the **Translated Month Names Table** query generates a table with four translation columns as shown in the following screenshot.

<img src="./images/BuildingMultiLanguageReportsInPowerBI/media/lanaguage-month-table.png"   />

Likewise, the query named **Translated Day Names Table** generates a table with weekday name translations.

<img src="./images/BuildingMultiLanguageReportsInPowerBI/media/lanaguage-day-table.png"    />

There's an important observation about the two queries named **Translated Month Names Table** and **Translated Day Names Table**. These queries have been written to be generic. In other words, they don't contains any hard-coded column names. This approach lowers ongoing maintenance because these queries don't require any modifications in the future when you add or remove languages from the project. All you need to do is to update the data rows in the query, which generates the **Languages** table and the other two queries named **Translated Month Names Table** and **Translated Day Names Table** automatically adapt to those changes.

:::image type="content" source="./media/data-translation-calendar-table/advanced-editor-language.png" alt-text="Image alt text." lightbox="./media/data-translation-calendar-table/advanced-editor-language.png":::

> Once again, always strive to use localize techniques that lower the overhead of adding new languages in the future.

When you run these two queries for the first time, they create two new tables in the dataset with the names **Translated Month Names Table** and **Translated Day Names Table** with a translation column for each language. One more task you have is to configure the sort column for each of the translation columns. For example, all the translation columns in **Translated Month Names Table** should be configured to use the sort column  **MonthNumber**  while all the translations columns in **Translated Day Names Table** should be configured to use the sort column **DayNumber**.

:::image type="content" source="./media/data-translation-calendar-table/sort-column-month-number.png" alt-text="Image alt text." lightbox="./media/data-translation-calendar-table/sort-column-month-number.png":::

You've now seen how to generate the two translation tables named **Translated Month Names Table** and **Translated Day Names Table**. The next step is to integrate these two tables into the data model with a **Calendar** table. The **Calendar** table can be defined as a calculated table based on the following DAX expression.

:::image type="content" source="./media/data-translation-calendar-table/dax-expression-table.png" alt-text="Image alt text." lightbox="./media/data-translation-calendar-table/dax-expression-table.png":::

With a **Calendar** table like this, you typically create a relationship between the **Calendar** table and other fact tables such as **Sales** using the **Date** column to create a one-to-many relationship. The relationships created between the **Calendar** table and the two translations tables are based on the **MonthNumber** column and the **DayNumber** column.

<img src="./images/BuildingMultiLanguageReportsInPowerBI/media/calendar-month-associate.png"  />

Once you have created the required relationships with the **Calendar** table, the next step is to create a new Field Parameter for each of the two calendar translations tables. Fortunately, creating a Field Parameter for a calendar translation table is just like creating the Field Parameters for product names and category names shown earlier.

<img src="./images/BuildingMultiLanguageReportsInPowerBI/media/image111.png"   />

Don't forget that you need to add a relationship between these new Field Parameter tables and the **Languages** table to ensure the language filtering strategy works as expected.

:::image type="content" source="./media/data-translation-calendar-table/image112.png" alt-text="Image alt text." lightbox="./media/data-translation-calendar-table/image112.png":::

Once you have created the Field Parameters for **Translated Month Names** and **Translated Day Names**, you can begin to surface them in a report using cartesian visuals, tables and matrices.

:::image type="content" source="./media/data-translation-calendar-table/image113.png" alt-text="Image alt text." lightbox="./media/data-translation-calendar-table/image113.png":::

Once everything is set up correctly, you should be able test your work using a report-level filter on the **Languages** table to switch between languages and to verify translations for names of months and days of the week work as expected.

:::image type="content" source="./media/data-translation-calendar-table/image114.png" alt-text="Image alt text." lightbox="./media/data-translation-calendar-table/image114.png":::

## Next steps
