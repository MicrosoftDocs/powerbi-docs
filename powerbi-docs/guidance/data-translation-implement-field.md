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
# Implement data translation using field parameters

> Let's start with a simple question and a somewhat complicated answer. **What is a Field Parameter?**

A Field Parameter is a table in which each row represents a field and where each these fields must be defined as either a column or a measure. In one sense, a Field Parameter is just a predefined set of fields. Given that rows in a table represent these fields, the set of fields of a Field Parameter supports filtering. Therefore, you can think of a Field Parameter as a filterable set of fields.

When you create a Field Parameter, you have the option of populating the fields collection using either measures or columns. Most of the good examples out there on the Internet from popular Power BI bloggers involve creating Field Parameters using measures. However, when using Field Parameters to implement data translations, use columns instead of measures. The primary role that Field Parameters play in implementing data translations is providing a single, unified field to be used in report authoring that can be dynamically switched between source columns behind the scenes.

Before the introduction of Field Parameters, it was challenging to implement data translations efficiently in Power BI. Power BI didn't provide any way to evaluate a calculated column dynamically after the dataset loading process has completed. The advantage of using Field Parameters is that they provide a column selector mechanism that can be used to dynamically switch back and forth between multiple source columns in the underlying datasource.

:::image type="content" source="./media/data-translation-implement-field/product-data-source.png" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/product-data-source.png":::

To create a Field Parameter in Power BI Desktop, navigate to the **Modeling** tab and select **New parameter > Fields**.

:::image type="content" source="./media/data-translation-implement-field/new-parameter-field.png" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/new-parameter-field.png":::

When you're prompted by the **Parameters** dialog, you can supply a **Name** for the new Field Parameter. You can also add the set of translated name columns from the **Products** table using the **Fields** pane.

:::image type="content" source="./media/data-translation-implement-field/parameter-field.png" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/parameter-field.png":::

For our scenario, let's create a new Field Parameter named **Translated Product Names**. Let's also populate the fields connection of this Field Parameter with the four columns from the **Products** table with the translated product names. When you're just starting to experiment with Field Parameters, you should leave the **Add slicer to page** option enabled as it helps in running a few tests to build your understanding.

:::image type="content" source="./media/data-translation-implement-field/parameter-field-add.png" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/parameter-field-add.png":::

After you have created a new Field Parameter, it appears in the **Fields** list on the right as a new table. If you select a Field Parameter such **Translated Product Names** while in **Report** view, you should see the Field Parameter definition is based on a DAX expression as shown in the following screenshot.

:::image type="content" source="./media/data-translation-implement-field/field-parameter-definition.png" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/field-parameter-definition.png":::

If you expand the **Fields** list while in **Report** view, you see a single field with the same name as the parent table.

:::image type="content" source="./media/data-translation-implement-field/product-table.png" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/product-table.png":::

> From a data modeling perspective, you can see that a Field Parameter is created as a table with a set of fields.

Let's conduct a quick experiment so you can better understand how Field Parameters work. Let's add a **Table** visual to the report page to the right of the slicer. Next, add the field inside the Field Parameter into the **Columns** data role of the **Table** visual. As long as nothing is selected in the slicer, the table visual displays all four source columns.

:::image type="content" source="./media/data-translation-implement-field/product-table.png" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/product-table.png":::

Now, let's select a specific column in the slicer. When you do, the slicer applies filtering that reduces the number of columns displayed in the table visual from four columns to a single column.

:::image type="content" source="./media/data-translation-implement-field/table-slicer.png" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/table-slicer.png":::

In the previous screenshot, you can see that the column values for product names have been translated into Spanish. However, there's still an issue with the column header. The column header still displays the column name from the underlying datasource, which is **ProductTranslationSpanish**. The reason for this is that those column header values were hard-coded into the DAX expression when Power BI Desktop created the new Field Parameter.

:::image type="content" source="./media/data-translation-implement-field/hard-code-field-parameter.png" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/hard-code-field-parameter.png":::

If you examine the DAX expression generated by Power BI Desktop, you see the hard-coded column names from the underlying datasource such as **ProductTranslationEnglish** and **ProductTranslationSpanish**.

``` dax
Translated Product Names = {
  ("ProductTranslationEnglish", NAMEOF('Products'[ProductTranslationEnglish]), 0),
  ("ProductTranslationSpanish", NAMEOF('Products'[ProductTranslationSpanish]), 1),
  ("ProductTranslationFrench", NAMEOF('Products'[ProductTranslationFrench]), 2),
  ("ProductTranslationGerman", NAMEOF('Products'[ProductTranslationGerman]), 3)
}
```

The way to resolve this issue is to update the DAX expression to replace the column names with localized translations for the word **Product** as shown in the following code listing.

```
Translated Product Names = {
  ("Product", NAMEOF('Products'[ProductTranslationEnglish]), 0),
  ("Producto", NAMEOF('Products'[ProductTranslationSpanish]), 1),
  ("Produit", NAMEOF('Products'[ProductTranslationFrench]), 2),
  ("Produkt", NAMEOF('Products'[ProductTranslationGerman]), 3)
}
```

Once you make this change, the column header is now translated properly along with product names.

:::image type="content" source="./media/data-translation-implement-field/translate-header.png" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/translate-header.png":::

Up to this point we have only examined the Field Parameter in **Report** view. Now it's time to navigate to **Data** view where you can see two addition fields inside the Field Parameter that are hidden from **Report** view. If you expand the node for a Field Parameter such as **Translated Product Names**, there are two more hidden fields in addition to the field you can see in **Report** view.

:::image type="content" source="./media/data-translation-implement-field/field-report-view.png" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/field-report-view.png":::

The names of the columns inside a Field Parameter are automatically generated based on the name you gave to the top-level Field Parameter. The columns inside a Field Parameter can (and should) be renamed to simplify the data model and to improve readability. You can just double-click a field inside the Field Parameter node to rename it. For example, you can rename the one field that is visible in **Report** view to **Product**.

:::image type="content" source="./media/data-translation-implement-field/report-view-product.png" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/report-view-product.png":::

Likewise, you can rename the two other hidden fields with shorter names such as **Fields** and **SortOrder**.

:::image type="content" source="./media/data-translation-implement-field/report-view-rename-hidden-field.png" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/report-view-rename-hidden-field.png":::

Now, here's where things get interesting. The Field Parameter that has been created is a table with three columns named **Product**, **Fields** and **SortOrder**. The next step in configuring a Field Parameter to support data translations is to add a fourth column with a language identifier to enable filtering by language. You can add the column by modifying the DAX expression for the Field Parameter. Add a fourth string parameter to the row for each language with the lower-case two character language identifier.

```
Translated Product Names = {
  ("Product", NAMEOF('Products'[ProductTranslationEnglish]), 0, "en" ),
  ("Producto", NAMEOF('Products'[ProductTranslationSpanish]), 1, "es" ),
  ("Produit", NAMEOF('Products'[ProductTranslationFrench]), 2, "fr" ),
  ("Produkt", NAMEOF('Products'[ProductTranslationGerman]), 3, "de" )
}
```

Once you have updated the DAX expression with a language identifier for each language, a new column appears in the **Data** view of the **Products** table named **Value4**.

:::image type="content" source="./media/data-translation-implement-field/report-view-data-column.png" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/report-view-data-column.png":::

The name **Value4** isn't specific enough for our needs. Let's rename the fourth column to **LanguageId**.

:::image type="content" source="./media/data-translation-implement-field/report-view-rename-value.png" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/report-view-rename-value.png":::

Finally, let's not forget to configure the sort column for the new column named **LanguageId**.

:::image type="content" source="./media/data-translation-implement-field/report-view-sort-column" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/report-view-sort-column":::

You don't have to worry about configuring the sort column for the two pre-existing fields named **Fields** and **Product**. That configuration is done automatically by Power BI Desktop when you create a new Field Parameter. However, you need to explicitly configure the sort column when you add other columns such as **LanguageId**.

> The authors would like to thank **[Gerhard Brueckl](http://wordpress.gbrueckl.at/)** for his **[great blog post](https://blog.gbrueckl.at/2022/06/using-power-bi-field-parameters-to-translate-data-and-values/)** where we first learned about this technique.

There's just one more thing to do with the new Field Parameter. Let's move to **Model** view to inspect the Field Parameter named **Translated Product Names**. As a final step, let's hide the **LanguageId** column from **Report** view. Report authors never need to see this column because it's used to select a language by filtering behind the scenes.

:::image type="content" source="./media/data-translation-implement-field/hidden-table.png" alt-text="Image alt text." lightbox="./media/data-translation-implement-field/hidden-table.png":::

> At this point, we no longer need the slicer that can be automatically added by Power BI Desktop when creating the Field Parameter. While the slicer automatically added by Power BI Desktop is great for simple demos, it can only control a single Field Parameter at a time. You need a more scalable, report-wide strategy for switching back and forth between languages that works across multiple Field Parameters.

Let's summarize what we have done so far. We have created a Field Parameter named **Translated Product Names** and extended it with an extra column named **LanguageId**. The **LanguageId** column is used to filter which source column is used, and therefore, which language is displayed to report consumers. In the next section, continue building out the strategy for data translations by adding a new table named **Languages** which is used to filter multiple Field Parameters at once in order to synchronize them as you switch between languages

## Next steps
