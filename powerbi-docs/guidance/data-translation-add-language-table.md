---
title: Add the languages table to filter field parameters
description: Learn how to use Power Query to create a languages table for multiple-language reports in Power BI.
author: kfollis   
ms.author: kfollis
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: how-to
ms.date: 07/26/2023
---
# Add the languages table to filter field parameters

As a content creator working with Power BI Desktop, there are many different ways to add a new table to a data model. In this article, you use Power Query to create a table named **Languages**.

## Add the table

1. In Power BI Desktop, from the **Home** ribbon, select **Transform data** > **Transform data** to open the Power Query Editor.

1. Under **Queries**, right-click and select **New Query** > **Blank Query** from the context menu.

1. Select the new query. Under **Query Settings** > **Properties** > **Name**, enter *Languages* as the name of the query.

1. From the **Home** ribbon, select **Advanced Editor**.

1. Copy the following M code into the editor, then select **Done**.

   ```powerquery-m
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

   :::image type="content" source="./media/data-translation-add-language-table/query-editor-language.png" alt-text="Screenshot shows the Advanced Editor M code ready to be saved." lightbox="./media/data-translation-add-language-table/query-editor-language.png":::

   When this query runs, it generates the **Languages** table with a row for each of the four supported languages.

   :::image type="content" source="./media/data-translation-add-language-table/query-result.png" alt-text="Screenshot shows the contents of a table created by the M code." lightbox="./media/data-translation-add-language-table/query-result.png":::

1. In the **Home** ribbon, select **Close & Apply**.

## Create a relationship

Next, create a relationship between the **Languages** table and the **Translated Product Names** table created in [Implement data translation using field parameters](data-translation-implement-field.md).

1. In Power BI Desktop, open the Model view.
1. Find the **Languages** table and the **Translated Product Names** table.
1. Drag the **LanguageId** column from one table to the **LanguageId** entry in the other table.

   :::image type="content" source="./media/data-translation-add-language-table/language-name-relationship.png" alt-text="Screenshot shows the Model view with two tables in a one-to-one relationship." lightbox="./media/data-translation-add-language-table/language-name-relationship.png":::

After you establish the relationship between **Languages** and **Translated Product Names**, it serves as the foundation for filtering the field parameter on a report-wide basis. For example, you can open the **Filter** pane and add the **Language** column from the **Languages** table to the **Filters on all pages** section. If you configure this filter with the **Require single selection** option, you can switch between languages using the **Filter** pane.

:::image type="content" source="./media/data-translation-add-language-table/filter-pane.png" alt-text="Screenshot shows a filter for all pages with four languages, with one language selected." lightbox="./media/data-translation-add-language-table/filter-pane.png":::

## Related content

- [Synchronize multiple field parameters](data-translation-synchronize-field.md)
