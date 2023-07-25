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
# Synchronize multiple field parameters

At this point, we have added a Field Parameter to translate product names. However, most real-world reports contain more than just one column that requires data translations. Therefore, you must ensure the mechanism you use to select a language can be synchronized across multiple field parameters. To test this approach, let's create a second Field Parameter to translate product category names from the **Products** table.

Let's assume the **Products** table contains four columns with translated category names similar to the translated product name columns. You can create a new Field Parameter named **Translated Category Names** using this DAX expression.

```
Translated Category Names = {
  ("Category", NAMEOF('Products'[CategoryTranslationEnglish]), 0, "en"),
  ("Categoría", NAMEOF('Products'[CategoryTranslationSpanish]), 1, "es"),
  ("Catégorie", NAMEOF('Products'[CategoryTranslationFrench]), 2, "fr"),
  ("Kategorie", NAMEOF('Products'[CategoryTranslationGerman]), 3, "de")
}
```

After creating the Field Parameter named **Translated Category Names**, let's update the field names and configure the sort column as we did earlier for the Field parameter named **Translated Product Names**.

:::image type="content" source="./media/data-translation-synchronize-field/translate-category-name.png" alt-text="Image alt text." lightbox="./media/data-translation-synchronize-field/translate-category-name.png":::

The next step is to move to **Model** view where you can create a relationship based on the **LanguageId** column between **Languages** table and the **Translated Category Names** Field Parameter.

:::image type="content" source="./media/data-translation-synchronize-field/language-relationship.png" alt-text="Image alt text." lightbox="./media/data-translation-synchronize-field/language-relationship.png":::

Now you should be able to add the **Category** column to the **Table** visual along with the **Product** column. As you change the **Language** selection in the **Filter** pane, the two Field Parameters are now synchronized to display the same language.

:::image type="content" source="./media/data-translation-synchronize-field/synchronize-parameter.png" alt-text="Image alt text." lightbox="./media/data-translation-synchronize-field/synchronize-parameter.png":::

You have now learned how to synchronize the selection of language across multiple Field Parameters. This example involves two Field Parameters. If your project involves a greater number of columns requiring data translations such as 10, 20 or even 50, you have now learned a repeatable approach that can scale as high as you need.

One thing that can be confusing is trying to distinguish between the three different types of translations while testing. You can quickly test out your implementation of data translations in Power BI Desktop by changing the filter on the **Languages** table. However, the other two types of translations don't work correctly in Power BI Desktop. The metadata translations and report label translations you've added must always be tested in the Power BI service.

## Next steps
