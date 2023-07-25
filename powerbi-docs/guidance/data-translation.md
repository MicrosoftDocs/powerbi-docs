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
# Implement a data translations strategy

While all multiple-language reports require metadata translations and report label translations, you can't assume the same for data translations. Some projects require data translations and others don't. In order to determine whether your project requires data translations, think through the use cases that you plan to support with your reporting solution. Adding support for data translations can involve a good deal of planning and effort. You might decide to only support data translations if they're a hard requirement for your project.

Implementing data translations is different from implementing metadata translations or report label translations. They're different because Power BI doesn't offer any localization features to assist you with data translations. Instead, you must implement a data translation strategy. Such a strategy involves extending the underlying data source with extra columns to track translations for text in rows of data such as the names of products, categories, and countries.

## Determine whether your solution really requires data translations

To determine whether you need to implement data translations, start by thinking about how to deploy your reporting solution and think about the use case for its intended audience. That leads to a key question. **Do you have people who speak different languages looking at the same database instance?**

Imagine a scenario where you're developing a report template for a SaaS application with a well-known database schema. Now let's say some customers maintain their database instance in English while others maintain their database instances in other languages such as Spanish or German. There's no need to implement data translations in this use case because the data from any database instance. Users view the data each in a single language.

:::image type="content" source="./media/data-translation/customer-deployment.png" alt-text="Image alt text." lightbox="./media/data-translation/customer-deployment.png":::

The important observation is that each customer deployment uses a single language for its database and all its users. Both metadata translations and report label translations must be implemented in this use case so you can deploy a single version of the .pbix file across all customer deployments. However, there's no need to implement data translations when no database instance ever needs to be viewed in multiple-languages.

Now let's examine a different use case that introduces the requirement of data translations. The use case is for the [**ProductSalesMultiLanguage.pbix**](https://github.com/PowerBiDevCamp/TranslationsBuilder/raw/main/LiveDemo/ProductSalesMultiLanguage.pbix) live demo, which involves a single database instance containing sales performance data across several European countries. This reporting solution has the requirement to display its report in different languages while the data being analyzed is coming from a single database instance.

:::image type="content" source="./media/data-translation/customer-deployment-import.png" alt-text="Image alt text." lightbox="./media/data-translation/customer-deployment-import.png":::

Once again, the key question to ask is whether you have people who speak different languages looking at the same database instance. If the answer to that question is ***NO***, then you aren't required to implement data translations. If the answer to that question is ***YES***, then you should ask more questions because there are other consideration you should think through before deciding whether it makes sense to implement data translations.

When you're considering whether to implement data translations, examine the text-based columns that are candidates for translation. Determine how hard translating those text values is. Columns with short text values for things like product names, product categories and country names are good candidates for data translations because the values are short and easy to translate. What if you have a column for product descriptions where each row has two to three sentences of text. While you can provide translations for product descriptions, they require more effort to generate high quality translations. In general, columns with longer text values are less ideal as candidates for data translations.

You should also consider the number of distinct column values that require translation. You can easily translate product names in a database that holds 100 products. You can probably translate product names when the number gets up to 1000. However, what happens if the number of translated values reaches 10,000 or 100,000. If you can't rely on machine-generate translations, your translation team might have trouble scaling up to handle that volume of human translations.

You also have to consider that your commitment to implement data translations might require on-going maintenance. Every time someone adds a new record to the underlying database, there's the potential to introduce new text values that require translation. This approach is different from implementing metadata translations or report label translations. In those situations, you create a finite number of translations and then your work is done. Metadata translations and report label translations don't require on-going maintenance as long as the underlying dataset schema and the report layout remain the same.

In summary, there are many factors that go into deciding whether you should implement data translations. You must decide whether it's worth the time and effort required to implement data translations properly. In certain scenarios, you might decide that implementing metadata translations and report label translations goes far enough. If your primary goal is to make your reporting solution compliant with laws or regulations, you might also find that implementing data translations isn't a requirement.

## Next steps
