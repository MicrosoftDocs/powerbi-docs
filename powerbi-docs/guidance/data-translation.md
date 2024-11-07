---
title: Implement a data translation strategy 
description: Understand when to choose data translation for your multiple-language project in Power BI and what elements to consider.
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/26/2023
---
# Implement a data translation strategy

All multiple-language reports require metadata translation and report label translation, but not necessarily data translation. To determine whether your project requires data translation, think through the use cases that you plan to support. Using data translation involves planning and effort. You might decide not to support data translation unless it's a hard requirement for your project.

Implementing data translation is different from implementing metadata translation or report label translation. Power BI doesn't offer any localization features to assist you with data translation. Instead, you must implement a data translation strategy. Such a strategy involves extending the underlying data source with extra columns to track translations for text in rows of data, such as the names of products and categories.

## Determine whether your solution requires data translation

To determine whether you need to implement data translation, start by thinking about how to deploy your reporting solution. Think about the use case for its intended audience. That exercise leads to a key question: *Do you have people who use different languages looking at the same database instance?*

Suppose you're developing a report template for a software as a service (SaaS) application with a well-known database schema. Some customers maintain their database instance in English while others maintain their database instances in other languages, such as Spanish or German. There's no need to implement data translations in this use case because the data from any database instance because users view the data each in a single language.

:::image type="content" source="./media/data-translation/customer-deployment.png" alt-text="Diagram shows three customer deployments, each of which a different database in its own language." lightbox="./media/data-translation/customer-deployment.png":::

Each customer deployment uses a single language for its database and all its users. Both metadata translations and report label translations must be implemented in this use case. You deploy a single version of the .pbix file across all customer deployments. However, there's no need to implement data translations when no database instance ever needs to be viewed in multiple languages.

A different use case introduces the requirement of data translations. The example .pbix project file uses a single database instance that contains sales performance data across several European countries/regions. This solution must display its reports in different languages with data from a single database instance.

:::image type="content" source="./media/data-translation/customer-deployment-import.png" alt-text="Diagram shows a customer deployment with a single data source that serves multiple languages." lightbox="./media/data-translation/customer-deployment-import.png":::

If you have people that use different languages and locales to interact with the same database instance, you still need to address other considerations.

- Examine the text-based columns that are candidates for translation. Determine how hard translating those text values is. Columns with short text values, like product names and product categories, are good candidates for data translations. Columns that hold longer text values, such as product descriptions, require more effort to generate high quality translations.

- Consider the number of distinct values that require translation. You can easily translate product names in a database that holds 100 products. You can probably translate product names when the number gets up to 1000. What happens if the number of translated values reaches 10,000 or 100,000? If you can't rely on machine-generate translations, your translation team might have trouble scaling up to handle that volume of human translations.

- Consider whether there's on-going maintenance. Every time someone adds a new record to the underlying database, there's the potential to introduce new text values that require translation. This consideration doesn't apply to metadata translation or report label translation. In those situations, you create a finite number of translations and then your work is done. Metadata translation and report label translation don't require on-going maintenance as long as the underlying semantic model schema and the report layout remain the same.

There are several factors that go into deciding whether to use data translation. You must decide whether it's worth the time and effort required to implement data translation properly. You might decide that implementing metadata translations and report label translations goes far enough. If your primary goal is to make your reporting solution compliant with laws or regulations, you might also find that implementing data translations isn't a requirement.

## Related content

- [Extend the data source schema to support data translations](data-translation-extend-schema.md)
