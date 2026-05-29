---
title: Ask Copilot questions about your data
description: Learn how to use Copilot in Power BI to ask questions about your semantic model data and get visual answers, including ad hoc DAX calculations.
author: julcsc
ms.author: juliacawthra
ms.reviewer: shlindsay, rien
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: concept-article
ms.date: 05/28/2026
ms.update-cycle: 180-days
ai-usage: ai-assisted
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
#customer intent: As a report creator, I want to learn how to use Copilot in Power BI to visualize data from my semantic model.
---

# Ask Copilot questions about your data

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

[Copilot for Power BI](copilot-introduction.md) answers natural-language questions about your data by querying your semantic model and returning the results as a visual. Instead of building visuals manually or searching through report pages for the right chart, describe what you're looking for and Copilot creates a visualization for you.

This article describes the types of questions Copilot can answer from your model, including ad hoc DAX calculations, and explains how to read and verify the results.

:::image type="content" source="media/copilot-ask-data-questions/data-question-skill-02.png" alt-text="Screenshot of Copilot answering a question about data using a visual." lightbox="media/copilot-ask-data-questions/data-question-skill-02.png":::

## Prerequisites

Before you can use this feature, make sure you satisfy the [requirements for the use of Copilot](copilot-introduction.md#copilot-requirements).

[!INCLUDE [copilot-notes](../includes/copilot-notes.md)]

You need to enable Q&A for your model because Copilot uses the same underlying engine to build queries from your inputs. For most data sources, Q&A is enabled by default.

For some sources, such as DirectQuery or Direct Lake models, you might need to enable Q&A manually, either in your semantic model settings in the Power BI service or in your Data Load settings in Power BI Desktop. To learn more about the types of data sources Q&A supports, see [Data sources for natural language Q&A](../natural-language/q-and-a-data-sources.md).

> [!NOTE]
> You can also configure these settings in the [semantic model settings pane](../connect-data/service-semantic-model-settings-pane.md), a side pane that opens on the right side of the page. **The settings pane is currently in preview** and features or behavior might change before general availability.

## Feature availability

You can use Copilot data questions in both view and edit modes in the Power BI service. Both report authors and report viewers can ask Copilot data questions related to their semantic model or report.

## Supported question types

Copilot can answer questions by using existing measures and columns in your semantic model. It can also generate DAX queries for ad hoc calculations, as described in the following section. Questions might include existing measures filtered to a different region or time period than what appears on the report, a metric split into categories, or how a measure changes over time.

Although the exact questions that Copilot can answer depend on the specifics of your model, here are some examples:

- **"Can you show me sales amount by region?"**

  Both sales amount and region are already columns in the data.

- **"What were the top 5 selling products in North America last month?"**

  Product, region, and date are already columns in the data. Copilot helps with top N filtering to produce the visual.

- **"Tell me the average price of gasoline per gallon over the last 30 days."**

  Price per gallon is a measure already contained in the model. Copilot takes the average and filters by relative date to produce the visual.

- **"Which customers bought cheese and wine?"**

  Cheese and wine are multiple instances from the same Product entity in the model.

Copilot also responds to follow-up requests based on what you already asked in your current session.

:::image type="content" source="media/copilot-ask-data-questions/data-question-follow-up-02.png" alt-text="Screenshot of a follow-up question in the Copilot pane." lightbox="media/copilot-ask-data-questions/data-question-follow-up-02.png":::

## Ad hoc calculations for data questions

Copilot can also generate DAX queries to answer questions that require ad hoc calculations, such as creating new measures that aren't contained in the model. Examples of questions that Copilot can answer by creating a DAX query include the following:

- What was the year-over-year growth for sales?
- How many employees were hired before 2020?
- Calculate the ratio of cosmetic product orders to all products.
- Which customers didn't buy any products?

You can also verify the DAX query directly from the expanded view or launch the DAX query view for further inspection.

:::image type="content" source="media/copilot-ask-data-questions/data-question-answers-01.png" alt-text="Screenshot of Copilot answering a question by creating a DAX query.":::

## Unsupported question types

Copilot can't currently answer questions that require generating new insights, such as anomaly detection, forecasting, or finding key influencers. The specific questions it can handle depend on your model and report visuals. However, here are some examples of unsupported questions:

- **"Why do our sales go down every July?"**

  This question involves generating deeper insights from the provided data.

- **"How many books do you think we will sell next year?"**

  This question asks for forecasting, which isn't currently supported.

## Read the Copilot answer

Copilot provides an answer in the form of a visual. A text summary describes the visual and lists the fields used to build or filter it.

Expand the **How Copilot arrived at this** section to learn more about how Copilot understood your question and to verify that the correct fields, measures, or filters were selected from your model.

:::image type="content" source="media/copilot-ask-data-questions/data-question-show-reasoning-02.png" alt-text="Screenshot of the show reasoning section of a visual answer." lightbox="media/copilot-ask-data-questions/data-question-show-reasoning-02.png":::

Select the link beside a **Data used** element to see more detail, as shown in the following image.

:::image type="content" source="media/copilot-ask-data-questions/data-question-show-reasoning-details.png" alt-text="Screenshot of the data details for a visual answer." lightbox="media/copilot-ask-data-questions/data-question-show-reasoning-details.png":::

You can also expand the visual to see it in more detail. As a report author, you can add these visuals directly to your report page by selecting **Add to page** below the visual.

:::image type="content" source="media/copilot-ask-data-questions/data-question-expand-02.png" alt-text="Screenshot of the expand and add to page buttons of a visual answer." lightbox="media/copilot-ask-data-questions/data-question-expand-02.png":::

## Improve answer quality with linguistic modeling

When Copilot builds visuals from data in your semantic model, it references field names to determine which data might answer your question. Power BI authors can use linguistic modeling to improve Copilot's understanding of the questions report viewers might ask.

Authors can guide Copilot in the following ways:

- Use unique and descriptive column and measure names so Copilot understands the data.
- Structure the model according to Power BI best practices.
- Add synonyms to data field names to clarify business-specific terms for Copilot.

To learn more about linguistic modeling and ways to streamline the process of improving your linguistic schema with Copilot, see [Intro to Q&A tooling to train Power BI Q&A](../natural-language/q-and-a-tooling-intro.md).

## Limitations and considerations

Consider the following factors when you use Copilot data questions:

- Copilot data questions are only available in the Power BI service. Support for Power BI Desktop is coming soon.
- The only supported language is English.
- Copilot data questions don't apply filters or slicers currently affecting visuals on the report page to the answers generated in the Copilot pane.
- The requirement to enable Q&A is unique to Copilot data questions. You can still use Copilot for other tasks, like [asking questions about content present in your report](../explore-reports/copilot-pane-summarize-content.md#answer-questions-about-your-report-content-in-the-copilot-pane).
- When a question is related to data in the semantic model, Copilot uses the semantic model to answer the question. Otherwise, it might answer from the [large language model's (LLM's) general knowledge](https://go.microsoft.com/fwlink/p/?linkid=2325401).
- For additional limitations on data sources, see [Limitations of Power BI Q&A](../natural-language/q-and-a-limitations.md).

## Next steps

- [Overview of Copilot for Power BI](copilot-introduction.md)
- [Create reports with Copilot](copilot-create-reports.md)
- [Summarize and ask questions about report content](../explore-reports/copilot-pane-summarize-content.md)
- [Intro to Q&A tooling to train Power BI Q&A](../natural-language/q-and-a-tooling-intro.md)
- [Limitations of Power BI Q&A](../natural-language/q-and-a-limitations.md)
