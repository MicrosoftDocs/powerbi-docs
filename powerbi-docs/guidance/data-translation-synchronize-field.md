---
title: Synchronize multiple field parameters
description: Learn how to synchronize a selected language can be synchronized across multiple field parameters in a multiple-language report in Power BI. 
author: kfollis   
ms.author: kfollis
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: how-to
ms.date: 07/26/2023
---
# Synchronize multiple field parameters

A field parameter can support translations for a column in a multiple-language report in Power BI. Most reports contain more than just one column that requires data translations. You must ensure the mechanism you use to select a language can be synchronized across multiple field parameters. To test this approach working with the project in this series of articles, create a second field parameter to translate product category names from the **Products** table.

## Create a field parameter

1. In Power BI Desktop, in the **Modeling** ribbon, select **New parameter** > **Fields**.

1. In the **Parameters** dialog box, enter the name *Translated Category Names*.
1. Populate the fields with the columns from the **Products** table for the desired languages.

   :::image type="content" source="./media/data-translation-synchronize-field/parameter-field-category.png" alt-text="Screenshot shows the Parameters dialog box with a name added and several fields selected." lightbox="./media/data-translation-synchronize-field/parameter-field-category.png":::

1. Select **Create**.

1. Open the Table view. Select the table to view the Data Analysis Expressions (DAX) code. Update the code to match the following code.

   ```dax
   Translated Category Names = {
     ("Category", NAMEOF('Products'[CategoryTranslationEnglish]), 0, "en"),
     ("Categoría", NAMEOF('Products'[CategoryTranslationSpanish]), 1, "es"),
     ("Catégorie", NAMEOF('Products'[CategoryTranslationFrench]), 2, "fr"),
     ("Kategorie", NAMEOF('Products'[CategoryTranslationGerman]), 3, "de")
   }
   ```

   After you make your changes, the **Category** value is localized and there's a new column.

1. Double-click **Value4** and change the name to *LanguageId*.

   :::image type="content" source="./media/data-translation-synchronize-field/translate-category-name.png" alt-text="Screenshot shows the column with the new name, LanguageId." lightbox="./media/data-translation-synchronize-field/translate-category-name.png":::

## Update the model

After you create the new field parameter, you need to update the model to use it.

1. In Power BI Desktop, open the Model view.
1. Locate the **Translated Category Names** table and the **Languages** table. 
1. Drag **LanguageId** from **Translated Category Names** to the **Languages** table to create a one-to-one relationship.

   :::image type="content" source="./media/data-translation-synchronize-field/language-relationship.png" alt-text="Screenshot shows the Model view with three tables, including the newly added Translated Category Name, in a one-to-one relationship to Languages.":::

The language filter now affects categories.

:::image type="content" source="./media/data-translation-synchronize-field/synchronize-parameter.png" alt-text="Screenshot shows the Filters on all pages Language filter with German selected and product and category values translated in a table." lightbox="./media/data-translation-synchronize-field/synchronize-parameter.png":::

You have now learned how to synchronize the selection of language across multiple field parameters. This example involves two field parameters. If your project involves a greater number of columns requiring data translations such as 10, 20 or even 50, you can repeat this approach and scale up as much as you need.

> [!NOTE]
> You can test your implementation of data translations in Power BI Desktop by changing the filter on the **Languages** table. However, the other two types of translations don't work correctly in Power BI Desktop. You have to test metadata and report label translations in the Power BI service.

## Related content

- [Implement data translations for a calendar table](data-translation-calendar-table.md)
