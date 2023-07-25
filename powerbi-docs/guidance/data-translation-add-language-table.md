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
# Add the languages table to filter field parameters

As a content creator working with Power BI Desktop, there are many different ways to add a new table to a data model. For this scenario, let's use Power Query to create a new table named **Languages**. In Power BI Desktop, you can create a Blank Query and name it **Languages**. After that, open the Advanced Editor window where you can type in M code or copy it from somewhere else and paste it in.

:::image type="content" source="./media/data-translation-add-language-table/query-editor-language.png" alt-text="Image alt text." lightbox="./media/data-translation-add-language-table/query-editor-language.png":::

Examine the following M code for the query that is being used to generate the **Languages** table.

```
let
  LanguagesTable = #table(type table [
    Language = text,
    LanguageId = text,
    DefaultCulture = text,
    SortOrder = number
  ], {
    {"English", "en", "en-US", 1 },
    {"Spanish", "es", "es-ES", 2 },
    {"French", "fr", "fr-FR", 3 },
    {"German", "de", "de-DE", 4 }
  }),
  SortedRows = Table.Sort(LanguagesTable,{{"SortOrder", Order.Ascending}}),
  QueryOutput = Table.TransformColumnTypes(SortedRows,{{"SortOrder", Int64.Type}})
in
  QueryOutput
```

When this query runs, it generates the **Languages** table with a row for each of the four supported languages.

:::image type="content" source="./media/data-translation-add-language-table/query-result.png" alt-text="Image alt text." lightbox="./media/data-translation-add-language-table/query-result.png":::

Once you have created the **Languages** table, you can move to **Model** view to set up the filtering by creating a relationship. More specifically, you can create a one-to-one relationship between the **Languages** table and the **Translated Product Names** Field Parameter using the **LanguageId** column as shown in the following screenshot.

:::image type="content" source="./media/data-translation-add-language-table/language-name-relationship.png" alt-text="Image alt text." lightbox="./media/data-translation-add-language-table/language-name-relationship.png":::

Once you have established the relationship between **Languages** and **Translated Product Names**, you have created the foundation for filtering the Field Parameter on a report-wide basis. For example, you can open the **Filter** pane and add the **Language** column from the **Languages** table to the **Filters on all pages** section. If you configure this filter with the **Require single selection** option, you can then test out switching between languages using the **Filter** pane.

:::image type="content" source="./media/data-translation-add-language-table/filter-pane.png" alt-text="Image alt text." lightbox="./media/data-translation-add-language-table/filter-pane.png":::

## Next steps
