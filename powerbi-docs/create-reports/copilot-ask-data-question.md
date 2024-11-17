---
title: Ask Copilot for data from your model
description: Learn how to use Copilot to visualize data from your semantic model.
author: msftrien
ms.author: rien
ms.reviewer: shlindsay
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: conceptual
ms.date: 07/09/2024
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
#customer intent: As a report creator, I want to learn how to use Copilot in Power BI to visualize data from my semantic model.
---

# Ask Copilot for data from your model (preview)

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Copilot can answer questions with visuals created from your semantic model's data. Tell Copilot what you're looking for, and if the answer isn't already visualized on your report, Copilot will query your model and return the answer to your question in the form of a visual.

:::image type="content" source="media/copilot-ask-data-questions/data-question-skill.png" alt-text="Screenshot showing Copilot answer a question about data using a visual." lightbox="media/copilot-ask-data-questions/data-question-skill.png":::

## Before you start

Before you can use this feature, make sure you satisfy the [requirements for the use of Copilot](../create-reports/copilot-introduction.md#copilot-requirements).

[!INCLUDE [copilot-notes](../includes/copilot-notes.md)]

Asking Copilot for data from your model is a preview feature.

Since this is a preview feature, you'll need to enable it via the preview toggle in the Copilot pane. Find the preview toggle in the top right corner of the Copilot pane. Switch the toggle on to access all of the Copilot capabilities currently in public preview.

:::image type="content" source="media/copilot-ask-data-questions/data-question-preview-toggle.png" alt-text="Screenshot displaying the preview toggle in the Copilot pane." lightbox="media/copilot-ask-data-questions/data-question-preview-toggle.png":::

To learn more about enabling preview features in the Copilot pane, see [Use Copilot preview features in Power BI](copilot-preview-toggle.md).

Q&A also needs to be enabled for your model because Copilot uses the same underlying engine to build queries from your inputs. For most data sources, Q&A is enabled by default.

For some sources, like DirectQuery or Direct Lake models, you might need to enable Q&A manually, either in your semantic model settings in the Service or in your Data Load settings in Power BI Desktop. To learn more about the types of data sources Q&A supports, see [Data sources for natural language Q&A](../natural-language/q-and-a-data-sources.md).

## Use the feature

This capability allows Copilot to generate queries and return visuals based on data in your semantic model. It's available in both view and edit modes in Power BI. Both report authors and viewers can access this feature by asking Copilot for data related to their dataset or report.

## Supported question types

Copilot is best at answering questions using existing measures and columns in your semantic model. Questions may include asking for existing measures filtered to a different region or span of time than they are on the report, a metric split into categories, or how a measure changes with time.

While the exact questions that Copilot can answer depends on the specifics of your model, here are some examples:

- **“Can you show me sales amount by region?”**  where both sales amount and region are already columns in the data.
- **“What were the top 5 selling products in North America last month?”** where product, region, and date are already columns in the data, and Copilot helps with top N filtering to produce the visual.
- **“Tell me the average price of gasoline per gallon over the last 30 days.”** where price per gallon is a measure already contained in the model, and Copilot helps by taking the average and filtering by relative date to produce the visual.
- **"Which customers bought cheese and wine?"** where cheese and wine are multiple instances from the same Product entity in the model.

Copilot also responds to follow up requests based on what you have already asked in your current session.

:::image type="content" source="media/copilot-ask-data-questions/data-question-follow-up.png" alt-text="Screenshot showing a follow-up question in the Copilot pane." lightbox="media/copilot-ask-data-questions/data-question-follow-up.png":::

## Unsupported question types

Copilot can't currently answer questions that require on-the-fly calculations. It also can't generate new insights like anomaly detection, forecasting, or finding key influencers. The specific questions it can handle depend on your model and report visuals. However, here are some examples of unsupported questions:

- **"Show me the difference in performance between sales in Europe and in America over time"**

     This question requires calculating sales for each region and finding the difference which isn't a current measure in the model.

- **"Why do our sales go down every July?”**

     This question involves generating deeper insights from the provided data.

- **"How many books do you think we will sell next year?"**

     This question asks for forecasting, which isn't currently supported.

## Reading the answer

Copilot provides an answer for you in the form of a visual. In text, it describes the visual it produced, including the fields it used to build or filter the visual.

You can expand the "show reasoning" dropdown to learn more about how Copilot understood your question, and to ensure that the phrases you used were matched against the right data in your model. 

:::image type="content" source="media/copilot-ask-data-questions/data-question-show-reasoning.png" alt-text="Screenshot showing the show reasoning section of a visual answer." lightbox="media/copilot-ask-data-questions/data-question-show-reasoning.png":::

You can also expand the visual to see it in more detail, and as a report author, you can even add these visuals directly to your report page – just select the "add to page" button underneath the visual.

:::image type="content" source="media/copilot-ask-data-questions/data-question-expand.png" alt-text="Screenshot showing the expand and add to page buttons of a visual answer." lightbox="media/copilot-ask-data-questions/data-question-expand.png":::

## Improve answer quality with linguistic modeling

When Copilot builds visuals from data in your semantic model, it references field names to determine which data might answer your question. Power BI authors can use linguistic modeling to improve Copilot's understanding of the questions report viewers might ask.

Authors can guide Copilot by:

- using unique and descriptive column and measure names so Copilot understands the data
- structuring the model according to Power BI's best practices
- adding synonyms to data field names to clarify business-specific terms for Copilot

To learn more about linguistic modeling and ways to streamline the process of improving your linguistic schema with Copilot, see [Intro to Q&A tooling to train Power BI Q&A](/power-bi/natural-language/q-and-a-tooling-intro).

## Limitations and considerations

There are a few other factors to consider at this time when using this capability:

- This capability is only available in the Power BI service. Support for Power BI Desktop is coming soon.
- The only supported language is English.
- This capability doesn't apply filters or slicers currently affecting visuals on the report page to the answers it generates inside the Copilot pane.
- The requirement to enable Q&A is unique to this Copilot capability. You can still use Copilot for other tasks, like [asking questions about content present in your report.](copilot-pane-summarize-content.md#answer-questions-about-your-report-content-in-the-copilot-pane)
- For additional limitations on data sources, see [Limitations of Power BI Q&A](../natural-language/q-and-a-limitations.md).

## Next steps

Copilot offers many more capabilities for you to take advantage of, from helping report authors to get started creating reports to helping report viewers parse and explore their data. See the [Overview of Copilot for Power BI](copilot-introduction.md) to learn more about everything Copilot can do.
