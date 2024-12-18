---
title: Implement data translation using field parameters
description: Learn how to create a field parameter as part of a data translation approach to multiple-language reports in Power BI.
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: how-to
ms.date: 07/26/2023
---
# Implement data translation using field parameters

This article shows you how to implement data translation by using a field parameter. The process has the following steps:

- Create a field parameter
- Use a slicer and data table
- Edit translated names
- Add a language ID column

## Create a field parameter

1. To create a field parameter in Power BI Desktop, in **Modeling**, select **New parameter** > **Fields**.

   :::image type="content" source="./media/data-translation-implement-field/new-parameter-field.png" alt-text="Screenshot shows the Modeling ribbon with the New parameter button selected and Fields highlighted.":::

1. In the **Parameters** dialog box, enter a name *Translated Product Names*.
1. Populate the fields connection of this field parameter with the columns from the **Products** table with the translated product names.

   :::image type="content" source="./media/data-translation-implement-field/parameter-field-add.png" alt-text="Screenshot shows the Parameters dialog box with a name added and several fields selected.":::

1. Be sure that **Add slicer to this page** is enabled.
1. Select **Create**.

After you create a field parameter, it appears in the **Fields** list on the right as a new table. Under **Data**, select **Translated Product Names** to see the Data Analysis Expressions (DAX) code that defines the field parameter, as shown in the following screenshot.

:::image type="content" source="./media/data-translation-implement-field/field-parameter-definition.png" alt-text="Screenshot shows DAX code for the field parameter." lightbox="./media/data-translation-implement-field/field-parameter-definition.png":::

## Use a slicer and data table

1. Under **Data**, expand the **Translated Product Names** node. Then select the **Translated Product Names** item. A table appears in the canvas.

   :::image type="content" source="./media/data-translation-implement-field/product-table.png" alt-text="Screenshot shows the translated product names table." lightbox="./media/data-translation-implement-field/product-table.png":::

   You can see the table type under **Visualizations** and **Translated Product Names** as the **Columns** value. Position both the slicer and the data table anywhere on the canvas.

1. Select one item in the slicer, such as **ProductTranslationSpanish**. The table now shows a single corresponding column.

   :::image type="content" source="./media/data-translation-implement-field/table-slicer.png" alt-text="Screenshot shows a slicer with one value selected and a table that displays that value." lightbox="./media/data-translation-implement-field/table-slicer.png":::

## Edit translated names

The column values for product names have been translated into Spanish. The column header still displays the column name from the underlying data source, which is **ProductTranslationSpanish**. This fact is because those column header values are hard-coded into the DAX expression when Power BI Desktop creates the field parameter.

:::image type="content" source="./media/data-translation-implement-field/hard-code-field-parameter.png" alt-text="Screenshot shows DAX values, which include hard-coded column names." lightbox="./media/data-translation-implement-field/hard-code-field-parameter.png":::

If you examine the DAX expression, the hard-coded column names from the underlying data source appear, such as **ProductTranslationEnglish** and **ProductTranslationSpanish**.

```dax
Translated Product Names = {
  ("ProductTranslationEnglish", NAMEOF('Products'[ProductTranslationEnglish]), 0),
  ("ProductTranslationSpanish", NAMEOF('Products'[ProductTranslationSpanish]), 1),
  ("ProductTranslationFrench", NAMEOF('Products'[ProductTranslationFrench]), 2),
  ("ProductTranslationGerman", NAMEOF('Products'[ProductTranslationGerman]), 3)
}
```

Update the DAX expression to replace the column names with localized translations for the word **Product** as shown in the following code.

```dax
Translated Product Names = {
  ("Product", NAMEOF('Products'[ProductTranslationEnglish]), 0),
  ("Producto", NAMEOF('Products'[ProductTranslationSpanish]), 1),
  ("Produit", NAMEOF('Products'[ProductTranslationFrench]), 2),
  ("Produkt", NAMEOF('Products'[ProductTranslationGerman]), 3)
}
```

When you make this change, the column header is translated along with product names.

:::image type="content" source="./media/data-translation-implement-field/translate-header.png" alt-text="Screenshot shows a slicer set to a translated product name and that column displayed in a table." lightbox="./media/data-translation-implement-field/translate-header.png":::

## Edit column names in the Table view

Up to this point, you've looked at the field parameter in Report view. Now open the Table view. There you can see two more fields in the field parameter that are hidden in Report view.

:::image type="content" source="./media/data-translation-implement-field/field-report-view.png" alt-text="Screenshot shows the Table view of a field parameter with the DAX code displayed." lightbox="./media/data-translation-implement-field/field-report-view.png":::

The names of the columns in a field parameter are generated based on the name you give to the top-level field parameter. You should rename the columns to simplify the data model and to improve readability.

1. To rename a column label, double-click the field. Rename **Translated Product Names** to *Product*.

   :::image type="content" source="./media/data-translation-implement-field/report-view-product.png" alt-text="Screenshot shows a table in the Table view with the column name changed to Product." lightbox="./media/data-translation-implement-field/report-view-product.png":::

1. Rename the two hidden fields with shorter names, such as *Fields* and *Sort Order*.

   :::image type="content" source="./media/data-translation-implement-field/report-view-rename-hidden-field.png" alt-text="Screenshot shows a table in the Table view with the column names changed to Fields and Sort Order.":::

## Add a language ID column

The field parameter is a table with three columns named **Product**, **Fields**, and **Sort Order**. The next step is to add a fourth column with a language identifier to enable filtering by language. You can add the column by modifying the DAX expression for the field parameter.

1. Add a fourth string parameter to the row for each language with the lower-case two character language identifier.

   ```dax
   Translated Product Names = {
     ("Product", NAMEOF('Products'[ProductTranslationEnglish]), 0, "en" ),
     ("Producto", NAMEOF('Products'[ProductTranslationSpanish]), 1, "es" ),
     ("Produit", NAMEOF('Products'[ProductTranslationFrench]), 2, "fr" ),
     ("Produkt", NAMEOF('Products'[ProductTranslationGerman]), 3, "de" )
   }
   ```

   After you update the DAX expression with a language identifier for each language, a new column appears in the **Table** view of the **Products** table named **Value4**.

   :::image type="content" source="./media/data-translation-implement-field/report-view-data-column.png" alt-text="Screenshot shows a table in the Table view with a new column called Value4." lightbox="./media/data-translation-implement-field/report-view-data-column.png":::

1. Double-click the name **Value4** and rename it to *LanguageId*.

   :::image type="content" source="./media/data-translation-implement-field/report-view-rename-value.png" alt-text="Screenshot shows a table in the Table view with a new column renamed to LaguageId." lightbox="./media/data-translation-implement-field/report-view-rename-value.png":::

1. Select **LanguageId** to highlight it. From the control ribbon, select **Sort by column** > **Sort Order**.

   :::image type="content" source="./media/data-translation-implement-field/report-view-sort-column.png" alt-text="Screenshot shows a table in the Table view with the Language ID column selected and SortOrder selected as its sort order." lightbox="./media/data-translation-implement-field/report-view-sort-column.png":::

   You don't need to configure the sort column for the two pre-existing fields. Power BI Desktop configured them when you set up the field parameter.

1. Open the Model view and, next to **LanguageId** select **More options** (three dots). Select **Hide in report view**.

:::image type="content" source="./media/data-translation-implement-field/hidden-table.png" alt-text="Screenshot shows a table in the Model view with the LanguageId marked as hidden.":::

   Report authors never need to see this column because it's used to select a language by filtering behind the scenes.

In this article, you created a field parameter named **Translated Product Names** and extended it with a column named **LanguageId**. The **LanguageId** column is used to filter which source column is used. That action determines which language is displayed to report consumers.

## Related content

- [Add the languages table to filter field parameters](data-translation-add-language-table.md)
