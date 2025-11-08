---
title: Standalone Copilot experience in Power BI (preview)
description: Learn how business users can chat with data using the standalone Copilot experience in Power BI (preview).
author: julcsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 11/08/2025
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
> **Data must be prepped for Copilot:** Copilot works best when the report author has prepared the data specifically for Copilot. If that setup hasn’t been done, answers may be limited or inaccurate. For more information, see [Prepare your data for AI](copilot-prepare-data-ai.md).
>
> **Approve your data for Copilot:** Semantic model authors have the ability to approve a model for use with Copilot in model settings. This impacts the appearance of content warnings for end users. For more information, see [Approve your model for use with AI](copilot-prepare-data-ai.md#mark-your-model-as-prepped-for-ai).
>
> **Warnings on unprepped data:** Models that aren't approved for Copilot will appear with warnings that the answer quality could be low.

## Capabilities

The standalone Copilot experience in Power BI offers a range of powerful capabilities to help you interact with your data more effectively. Copilot provides a conversational interface that simplifies data exploration and analysis. Here are some key features available in this experience.

### Finding the right data to answer your question

When you ask questions about your data, Copilot will work with you to understand your topic of interest and use that context to identify the right report, semantic model, or data agent to use as its source. If it finds an item that's a strong match for your question, it will select it in the background and deliver you an answer right away. When more context is needed, Copilot will ask simple clarifying questions to narrow it down. For best results, instead of typing a few keywords like we do with search engines, communicate like you would with a colleague:

 - Use full sentences.
 - Include contextual details to help Copilot find the right source.
 - Respond thoughtfully to follow-up questions.

:::image type="content" source="media/copilot-introduction/copilot-communication-tips.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing output of the request for a visual of monthly trends." lightbox="media/copilot-introduction/copilot-communication-tips.png":::
 
Although the additional reasoning may require a short wait, getting an your answer from a reliable source is worth the pause. Alternately, if you know exactly which report or semantic model you want to reference, you can attach it to your chat using the **+** option. Then it appears in the Copilot conversation and is used to answer your questions.

:::image type="content" source="media/copilot-introduction/copilot-ask-questions-about-data.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing the prompt and suggested results for asking questions about your data." lightbox="media/copilot-introduction/copilot-ask-questions-about-data.png":::

### Delivering answers, visuals, and summaries

The standalone Copilot experience can summarize data from reports (learn more about  [summarizing a report or topic](copilot-pane-summarize-content.md) here), and use the report visuals to answer specific questions. If the answer can't be found in the report, Copilot will then use the measures and other data fields in your semantic model (or even create new DAX calculations) to generate the answer for you. Learn more about [asking questions about your data](copilot-ask-data-question.md). 

### Searching for items

You can ask Copilot to find reports, semantic models, apps, and data agents that you have access to. In response, you get a hyperlinked list of relevant items, with helpful descriptions to make it easy for you to find the right thing. Learn more about [searching for items](copilot-search-new-content.md)

:::image type="content" source="media/copilot-introduction/copilot-find-reports-sales.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing output of the request for finding reports about sales." lightbox="media/copilot-introduction/copilot-find-reports-sales.png":::

### Use a Fabric data agent

You can use [Fabric data agents](/fabric/data-science/concept-data-agent) to get answers without leaving the standalone Copilot experience. Fabric data agents are custom-built experts in specific topics, trained by a developer within your organization.

:::image type="content" source="media/copilot-introduction/copilot-standalone-fabric-data-agent.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing the use of a Fabric data agent to answer a question." lightbox="media/copilot-introduction/copilot-standalone-fabric-data-agent.png":::

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

The standalone Copilot experience is only available to customers with home tenants in geos that support Fabric—so **it's only available** for customers with home tenants in [this list](/fabric/admin/region-availability#all-workloads). You don’t need to have Fabric enabled to use Copilot, they just need to have home tenants in one of the listed regions.

