---
title: Extend the data source schema to support data translations
description: Learn how to use the strategy for implementing multiple-language data translations made possible by the Power BI Desktop feature called field parameters.
author: kfollis
ms.author: kfollis
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/26/2023
---
# Extend the data source schema to support data translations

There are multiple ways to implement data translations in Power BI. Some data translation strategies are better than others. Whatever approach you choose, make sure that it scales in terms of performance. You should also ensure your strategy scales in terms of the overhead required to add support for new secondary languages as part of the on-going maintenance.

The current series of articles describes a strategy for implementing data translations made possible by the Power BI Desktop feature called *field parameters*.

## Modify the data source

Start by modifying the underlying data source. For example, the **Products** table can be extended with extra columns with translated product names to support data translations. In this case, the **Products** table has been extended with a separate column with product name translations in English, Spanish, French, and German.

:::image type="content" source="./media/data-translation-extend-schema/translate-product-name.png" alt-text="Screenshot shows an Excel spreadsheet with translated data in columns." lightbox="./media/data-translation-extend-schema/translate-product-name.png":::

The design approach shown here uses a three-part naming convention for table column names used to hold data translations. A name consists of the following parts:

- The entity name, for instance, **Product**
- The word **Translation**
- The language name, for instance, **Spanish**

For example, the column that contains product names translated into Spanish is **ProductTranslationSpanish**. Using this three-part naming convention isn't required for implementing data translation, but Translations Builder gives these columns special treatment.

## Understand field parameters

A *field parameter* is a table in which each row represents a field and where each these fields must be defined as either a column or a measure. In one sense, a field parameter is just a predefined set of fields. Given that rows in a table represent these fields, the set of fields of a field parameter supports filtering. You can think of a field parameter as a filterable set of fields.

When you create a field parameter, you can populate the fields collection using either measures or columns.

:::image type="content" source="./media/data-translation-extend-schema/product-data-source.png" alt-text="Diagram shows how the Product data field is related to a translated product value." lightbox="./media/data-translation-extend-schema/product-data-source.png":::

When you use field parameters to implement data translations, use columns instead of measures. The primary role that field parameters play in implementing data translations is providing a single, unified field use in report authoring that can be dynamically switched between source columns.

## Related content

- [Implement data translation using field parameters](data-translation-implement-field.md)
