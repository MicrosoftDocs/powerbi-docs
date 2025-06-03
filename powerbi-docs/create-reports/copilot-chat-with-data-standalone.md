---
title: Standalone Copilot experience in Power BI (preview)
description: Learn how business users can chat with data using the standalone Copilot experience in Power BI (preview).
author: julcsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 05/06/2025
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
---

# Standalone Copilot experience in Power BI (preview)

> [!IMPORTANT]
> This feature is in preview.

Copilot in Power BI is available as a full-screen, standalone Copilot experience that finds and answers questions about any report, semantic model, and Fabric data agent they have access to. This experience is different from the Copilot pane, which only answers questions about the report you currently have open.

:::image type="content" source="media/copilot-introduction/copilot-standalone-screen.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing a chat interface for interacting with data." lightbox="media/copilot-introduction/copilot-standalone-screen.png":::

> [!NOTE]
> **Admins need to turn on the tenant setting:** To try it out, admins need to [enable Copilot in Power BI](copilot-enable-power-bi.md), and additionally enable the following new tenant setting: Users can access a standalone, cross-item Power BI Copilot experience.
>
> **Prep your data for good results:** You must prep your data for it to work well with Copilot. Read on to learn what that entails. For more information, see [Prepare your data for AI](copilot-prepare-data-ai.md).
>
> **Mark your data as prepped:** Semantic model authors have the ability to mark a semantic model as prepped in model settings. This impacts the appearance of *Needs AI prep* warnings. For more information, see [Mark your model as prepped for AI](copilot-prepare-data-ai.md#mark-your-model-as-prepped-for-ai).
>
> **Warnings on unprepped data:** Models not marked as prepped result in warnings that the answer quality could be low. At the beginning of the preview, you only see a warning experience on answers.

## Capabilities

The standalone Copilot experience in Power BI offers a range of powerful capabilities to help you interact with your data more effectively. Copilot provides a conversational interface that simplifies data exploration and analysis. Here are some key features available in this experience.

### Search

You can ask Copilot to find reports, semantic models, apps, and data agents that you have access to. In response, you get a hyperlinked list of relevant items, with helpful details to make it easy for you to find the right thing. Learn more about [searching for items](copilot-search-new-content.md)

:::image type="content" source="media/copilot-introduction/copilot-standalone-search-results.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing a list of search results for reports, semantic models, and data agents." lightbox="media/copilot-introduction/copilot-standalone-search-results.png":::

### Summarize a report or topic

Copilot can provide summaries about an entire report or a specific topic within that report. You can use prompts like:

- "Summarize the relationship between weather and visits to Hawaii."
- "Summarize trends in sales last year."

Summaries in the standalone Copilot experience include both textual insights and relevant visuals within the narrative. Currently, summaries are only available for reports, not for semantic models. Learn more about [summarizing a report or topic](copilot-pane-summarize-content.md).

:::image type="content" source="media/copilot-introduction/copilot-standalone-summary-result.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing a summary of a report with text and visuals." lightbox="media/copilot-introduction/copilot-standalone-summary-result.png":::

### Ask questions about your data

Copilot can answer questions and create visuals using the measures and other data fields in your model. It can also create new data analysis expression (DAX) calculations if needed.

Unlike the Copilot pane within a report, the standalone Copilot experience doesn't reference report content when answering questions. Answers are always generated directly from the underlying model.
Learn more about [asking questions about your data](copilot-ask-data-question.md).

:::image type="content" source="media/copilot-introduction/copilot-standalone-data-question-result.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing a question and answer about data." lightbox="media/copilot-introduction/copilot-standalone-data-question-result.png":::

### Use a Fabric data agent

You can use [Fabric data agents](/fabric/data-science/concept-data-agent) to get answers without leaving the standalone Copilot experience. Fabric data agents are custom-built experts in specific topics, trained by a developer within your organization.

:::image type="content" source="media/copilot-introduction/copilot-standalone-fabric-data-agent.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing the use of a Fabric data agent to answer a question." lightbox="media/copilot-introduction/copilot-standalone-fabric-data-agent.png":::

### Choose the right data

When you ask a question about your data, whether you're looking for a summary or have a specific query, the first step is selecting the appropriate data to answer it. In the standalone Copilot experience, you can choose the right data in two ways:

- **Attach a report or semantic model**: If you know exactly which report or semantic model you want to reference, you can attach it to your chat using the **Add items for better results** option.

   :::image type="content" source="media/copilot-introduction/copilot-standalone-item-picker.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing the item picker for selecting reports and semantic models." lightbox="media/copilot-introduction/copilot-standalone-item-picker.png":::

   Then it appears in the Copilot conversation and is used to answer your questions.

   :::image type="content" source="media/copilot-introduction/copilot-standalone-item-name-prompt.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing a prompt to name the selected item." lightbox="media/copilot-introduction/copilot-standalone-item-name-prompt.png":::

- **Let Copilot find the right data to answer your question**: Copilot looks through the data you have access to, give you a few suggestions, and ask you to confirm which you'd like to use. It also presents some metadata about these suggestions, such as their workspace, if you opened them recently, and why they were suggested.

   :::image type="content" source="media/copilot-introduction/copilot-standalone-finding-report-answer-question.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing a prompt to select a report to answer a question." lightbox="media/copilot-introduction/copilot-standalone-finding-report-answer-question.png":::

### Prep data for AI

You must [prepare your data for it to work well with Copilot](copilot-prepare-data-ai.md). Preparing your data for AI creates the foundation for high-quality, grounded, and context-aware AI experiences. When data is unstructured or ambiguous, AI systems can struggle to interpret it correctly - leading to generic, inaccurate, or even misleading outputs.

If your data isn't prepared for Copilot, you get a warning that the answer might be low quality. You can choose to explore the data or view the answer anyway.

:::image type="content" source="media/copilot-introduction/copilot-standalone-answer-quality-warning.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing a warning about low quality answers." lightbox="media/copilot-introduction/copilot-standalone-answer-quality-warning.png":::

If you select the **View answer** button, the response appears in chat.

:::image type="content" source="media/copilot-introduction/copilot-standalone-visual-answer-quality-warning.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing a warning about low quality answers for a visual." lightbox="media/copilot-introduction/copilot-standalone-visual-answer-quality-warning.png":::

Once your data is [marked as prepped for AI](copilot-prepare-data-ai.md#mark-your-model-as-prepped-for-ai), responses appear in the chat without the warning.

## Copilot requirements

Read about [requirements to use the standalone Copilot experience](copilot-introduction.md#requirements-for-the-standalone-copilot).

## Considerations and limitations

The standalone Copilot experience isn't yet available in the following regions: Spain Central, Qatar, India-West, and Mexico.

