---
title: Teach Q&A to understand questions and terms in Power BI Q&A
description: Learn how to manage terms and define nouns or adjectives to teach Q&A about your data and optimize search results.
author: JulCsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 07/11/2024
LocalizationGroup: Ask questions of your datadefintion
---
# Teach Q&A to understand questions and terms in Power BI Q&A

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

In the **Teach Q&A** section of Q&A setup, you train Q&A to understand natural-language questions and terms that it doesn't recognize. To begin, you submit a question that contains a word or words that Q&A didn't recognize. Q&A then prompts you to define that term. You enter either a filter or a field name that corresponds to what that word represents. Q&A then reinterprets the original question. If you're happy with the results, you save them.

> [!NOTE]
> The Teach Q&A functionality only supports import mode. It also doesn't yet support connecting to an on-premises or Azure Analysis Services data source. This limitation should be removed in subsequent releases of Power BI.

## Start to teach Q&A

1. In Power BI Desktop, on the **Modeling** ribbon, select **Q&A Setup** > **Teach Q&A**.

1. Type a sentence with a term that Q&A doesn't recognize and select **Submit**.

1. Select the red double-underlined word.

    :::image type="content" source="media/q-and-a-tooling-teach-q-and-a/qna-tooling-teach-synonym-red.png" alt-text="Screenshot of the Teach Q and A page with a question entered in the search box." lightbox="media/q-and-a-tooling-teach-q-and-a/qna-tooling-teach-synonym-red.png":::

    Q&A offers suggestions and prompts you to provide the correct definition of the term.

1. After **Define the terms Q&A didn't understand**, provide a definition.

    :::image type="content" source="media/q-and-a-tooling-teach-q-and-a/qna-tooling-teach-fixpreview.png" alt-text="Screenshot of the Teach Q and A page with a term selected and defined." lightbox="media/q-and-a-tooling-teach-q-and-a/qna-tooling-teach-fix-preview.png":::

1. Select **Save** to preview the updated visual.

1. Enter the next question, or select the **X** to close.

Your report consumers don't see this change until you publish the report back to the service.

## Define nouns and adjectives

You can teach Q&A two types of terms:

- [Nouns](#define-a-noun-synonym)
- [Adjectives](#define-an-adjective-filter-condition)

### Define a noun synonym

When working with data, you might have names of fields that you could refer to by alternative names. An example could be 'Sales.' Numerous words or phrases could refer to sales, such as 'revenue.' If a column is named 'Sales' and report consumers type 'revenue,' Q&A might fail to pick the correct column to answer the question appropriately. In that case, you want to tell Q&A that 'Sales' and 'Revenue' refer to the same thing.

Q&A automatically detects when an unrecognized word is a noun by using knowledge from Microsoft Office. If Q&A detects a noun, it prompts you by using the phrase:

- **refers to**

You fill in the box with the term from your data.

:::image type="content" source="media/q-and-a-tooling-teach-q-and-a/qna-tooling-synonym-prompt.png" alt-text="Screenshot of the section that defines the term named Revenue.":::

If you provide something other than a field from the data model, you might get undesirable results.

### Define an adjective filter condition

Sometimes, you might want to define terms that act as a condition on the underlying data. An example could be 'Awesome Publishers.' 'Awesome' could be a condition that only selects publishers that have published X number of products. Q&A tries to detect adjectives and then provides the prompt:

- **that have**  

You fill in the box with the condition.

:::image type="content" source="media/q-and-a-tooling-teach-q-and-a/qna-tooling-adjectives.png" alt-text="Screenshot of the section that defines the term named Awesome publishers.":::

Some example conditions that you can define are:

- Country/region which is USA
- Country/region which is not USA
- Products > 100
- Products greater than 100
- Products = 100
- Products is 100
- Products < 100
- Products smaller than 100

In these examples, 'Products' could be either a column name or a measure. 

You can also specify an aggregation in the Q&A expression itself. For example, if 'popular products' are products with at least 100 units sold, you can define products with 'sum of units sold > 100' as popular.  

:::image type="content" source="media/q-and-a-tooling-teach-q-and-a/power-bi-qna-popular-products.png" alt-text="Screenshot of the section that defines the term named Popular products.":::

You can only define a single condition in tooling. To define more complex conditions, use Data Analysis Expressions (DAX) to create a calculated column or measure and then use the tooling section to create a single condition for that column or measure.

## Manage synonyms and relationships

After you provide definitions, you can go back to see all the fixes you made and edit or delete them. 

1. In **Q&A setup**, go to the **Synonyms** section to manage nouns.

    :::image type="content" source="media/q-and-a-tooling-teach-q-and-a/qna-manage-terms.png" alt-text="Screenshot of the Manage terms page with the term named factory defined." lightbox="media/q-and-a-tooling-teach-q-and-a/qna-manage-terms.png":::

1. Delete any terms that you no longer want. Currently, you can't edit terms. To redefine a term, delete the term and define it. You can use the new Copilot suggestions feature for help with adding more synonyms. For more information, see [Enhance Q&A with Copilot for Power B](q-and-a-copilot-enhancements.md).
   
1. In **Q&A setup**, go to the **Relationships** section to manage adjectives and other relationship types.

   :::image type="content" source="media/q-and-a-tooling-teach-q-and-a/qna-tooling-teach-relationships.png" alt-text="Screenshot of the Linguistic relationships page of Q&A setup." lightbox="media/q-and-a-tooling-teach-q-and-a/qna-tooling-teach-relationships.png":::

1. Delete any terms that you no longer want. Currently, you can't edit terms. To redefine a term, delete the term and define it.

## Related content

There are several best practices for improving the natural language engine. For more information, see [Best practices to optimize Q&A](q-and-a-best-practices.md).
