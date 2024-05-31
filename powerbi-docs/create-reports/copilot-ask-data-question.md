---
title: Ask Copilot for data from your model
description: Learn how to use Copilot to visualize data from your semantic model.
author: msftrien
ms.author: rien
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: conceptual
ms.date: 06/03/2024
---

# Ask Copilot for data from your model

[!INCLUDE applies-no-desktop-yes-service]

Copilot can help answer questions using visuals built from data in your semantic model. Just tell Copilot what you're looking for, and if the answer isn't already on your report, Copilot will then query your model for the data instead and return the answer to your question in the form of a visual.

:::image type="content" source="media/copilot-ask-data-questions/data-question-skill.png" alt-text="Screenshot showing Copilot answer a question about data using a visual." lightbox="media/copilot-ask-data-questions/data-question-skill.png":::

## Before you start

Before you can use this feature, you will need to make sure you satisfy the [requirements for the use of Copilot](../create-reports/copilot-introduction.md#copilot-requirements).

[!INCLUDE [copilot-notes](../includes/copilot-notes.md)]

Since this is a preview feature, you will also need to enable it via the preview toggle in the Copilot pane. You can find it in the top right corner of the Copilot pane. Switch the toggle on to access all of the Copilot capabilities currently in public preview.

:::image type="content" source="media/copilot-ask-data-questions/data-question-preview-toggle.png" alt-text="Screenshot showing the preview toggle in the Copilot pane." lightbox="media/copilot-ask-data-questions/data-question-preview-toggle.png":::

You can learn more about enabling preview features in the Copilot pane [here](copilot-preview-toggle).

You will also want to ensure that Q&A is enabled for your report, since Copilot uses the same underlying engine to build queries for data from your inputs. For most data sources, Q&A will be enabled by default. However, for some sources, like DirectQuery or Direct Lake models, you may have to manually enable Q&A, either in your semantic model settings in the Service or in your Data Load settings in Power BI Desktop. You can learn more about the types of data sources Q&A supports [here](../natural-language/q-and-a-data-sources.md).

## Use the feature

This capability allows Copilot to generate queries and return visuals based on data in your semantic model. It is available in both view and edit modes in Power BI. Both report authors and viewers can access this feature by asking Copilot for data related to their dataset or report.

## Supported question types

Copilot is best at answering questions using the existing measures and columns in your semantic model. These questions may include asking for existing measures filtered to a different region or span of time than they are on the report, a metric split into categories, or how a measure changes with time.

While the exact questions which Copilot can answer will depend on the specifics of your model, here are some examples:

- **“Can you show me sales amount by region?”**  where both sales amount and region are already columns in the data.
- **“What were the top 5 selling products in North America last month?”** where product, region, and date are already columns in the data, and Copilot helps with top N filtering to produce the visual.
- **“Tell me the average price of gasoline per gallon over the last 30 days.”** where price per gallon is a measure already contained in the model, and Copilot helps by taking the average and filtering by relative date to produce the visual.

Copilot will also respond to follow up requests based on what you have already asked in your current session.

:::image type="content" source="media/copilot-ask-data-questions/data-question-follow-up.png" alt-text="Screenshot showing the preview toggle in the Copilot pane." lightbox="media/copilot-ask-data-questions/data-question-follow-up.png":::

## Unsupported question types

Copilot cannot currently answer questions that involve creating calculations on-the-fly or generating new insights like anomaly detection, forecasting, or finding key influencers. Again, exact questions will depend on the specifics of your model and report visuals. However, here are some examples of questions not currently supported:

- **"Show me the difference in performance between sales in Europe and in America over time"**

This question would require calculating both sales amount for each region and taking the difference which, in this example, is not a measure currently in the model.

- **"Why do our sales go down every July?”**

This question involves generating deeper insights from the provided data.

- **"How many books do you think we will sell next year?"**

This question asks for forecasting, which is not currently supported.

## Reading the answer

Copilot will provide an answer for you in the form of a visual. In text, it will describe the visual it produced, including the fields it used to build or filter the visual.

You can expand the "show reasoning" dropdown to learn more about how Copilot understood your question, and to ensure that the phrases you used were matched against the right data in your model. 

:::image type="content" source="media/copilot-ask-data-questions/data-question-show-reasoning.png" alt-text="Screenshot showing the show reasoning section of a visual answer." lightbox="media/copilot-ask-data-questions/data-question-show-reasoning.png":::

You can also expand the visual to see it in more detail, and as a report author, you can even add these visuals directly to your report page – just click the "add to page" button underneath the visual. 

:::image type="content" source="media/copilot-ask-data-questions/data-question-expand.png" alt-text="Screenshot showing the expand and add to page buttons of a visual answer." lightbox="media/copilot-ask-data-questions/data-question-expand.png":::

## Improve answer quality with linguistic modeling

When Copilot builds visuals from data in your semantic model, it references the names of the fields in your model to understand which data might be able to answer your question. To improve Copilot's ability to understand the various questions report viewers might ask, Power BI authors can use linguistic modeling.

These are ways authors can help guide Copilot to better understand the terms report users are likely to use, including:

- using unique and descriptive column and measure names so Copilot understands what to expect about the data within,
- structuring your model following Power BI's best practices,
- adding synonyms to the names of data fields in your model to explicitly tell Copilot what users mean when they use language specific to your business domain,
- and others.

You can learn more about linguistic modeling [here](../natural-language/q-and-a-tooling-intro.md), and learn about ways to [streamline the process of improving your linguistic schema with Copilot here](../natural-language/q-and-a-tooling-intro.md).

## Limitations and considerations

In addition to the types of questions Copilot currently does not support, there are a few other factors to consider when using the feature:

- This capability does not currently support languages other than English.
- This capability does not apply filters or slicers currently affecting visuals on the report page to the answers it generates inside the Copilot pane.
- Currently, the requirement to enable Q&A is unique to this Copilot feature. You can still use Copilot for other tasks, like [asking questions about content present in your report.](copilot-pane-summarize-content.md#answer-questions-about-your-report-content-in-the-copilot-pane)

## Next steps

Copilot offers many more capabilities for you to take advantage of, from helping report authors to get started creating reports to helping report viewers parse and explore their data. See the [overview of Copilot for Power BI](copilot-introduction.md) to learn more about everything Copilot can do.