---
title: 
description: 
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/26/2023
---
# Extend the datasource schema to support data translations

There are multiple ways to implement data translations in Power BI. The strategy shown here in this article represents just one possible approach. There's no single right answer when designing a data translation strategy for Power BI. However, some data translation strategies are better than others. Whatever approach you choose, make sure it scales in terms of performance. You should also ensure your strategy scales in terms of the overhead required to add support for new secondary languages as part of the on-going maintenance.

An earlier version of this article demonstrated a solution for implementing data translations based on adding extra rows to tables containing text-based columns such as product names. This solution relied on filtering rows to select a language. However, this strategy is limited in terms of scalability because it requires many-to-many relationships between tables. Fortunately, the strategy demonstrated in this version of this article presents new and more scalable solution. This new strategy for implementing data translations is made possible by the new feature recently added to Power BI Desktop known as *Field Parameters*.

Let's start by making modifications to the underlying datasource. For example, the **Products** table can be extended with extra columns with translated product names to support data translations. In this case, the **Products** table has been extended with a separate column with product name translations in English, Spanish, French and German.

:::image type="content" source="./media/data-translation-extend-schema/translate-product-name.png" alt-text="Image alt text." lightbox="./media/data-translation-extend-schema/translate-product-name.png":::

The design approach shown here uses a three-part naming convention for table column names used to hold data translations. The naming convention parses together the entity name, for instance, **Product**, together with the word **Translation** and the language name, for instance, **Spanish**. For example, the column that contains product names translated into Spanish is **ProductTranslationSpanish**. While using this three-part naming convention isn't a hard requirement for implementing data translations, Translations Builder is able to give these columns special treatment.

## Next steps
