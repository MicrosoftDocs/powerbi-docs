---
title: Standalone Copilot in Power BI Mobile Apps (Preview)
description: Learn how to use standalone Copilot in Power BI mobile apps to ask questions about your data and get instant insights. Access reports, semantic models, and data agents.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: michalfo
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 11/12/2025
ms.collection: ce-skilling-ai-copilot
ai-usage: ai-assisted
#customer intent: As a Power BI mobile user, I want to use a full-screen Copilot experience to ask questions about my data from anywhere in the app without needing to open specific reports first.
---

# Standalone Copilot in Power BI mobile apps (preview)

> [!IMPORTANT]
> This feature is in preview.

| :::image type="icon" source="./media/mobile-apps-logo-images/ios-logo-40-px.png" border="false"::: | :::image type="icon" source="./media/mobile-apps-logo-images/ios-logo-40-px.png" border="false"::: | :::image type="icon" source="./media/mobile-apps-logo-images/android-logo-40-px.png" border="false"::: | :::image type="icon" source="./media/mobile-apps-logo-images/android-logo-40-px.png" border="false"::: |
|:---:|:---:|:---:|:---:|
| iPhones | iPads | Android phones | Android tablets |

The standalone Copilot in Power BI mobile apps provides a full-screen chat experience that you can use to ask questions about your data directly from the app's home page. Unlike the in-report Copilot button, this standalone experience enables you to query any report, semantic model, or data agent in your organization without first opening a specific item. Copilot analyzes your question, suggests relevant data sources, and generates instant insights with both textual summaries and interactive visuals. This mobile experience is based on the [standalone Copilot available in the Power BI service](../../create-reports/copilot-chat-with-data-standalone.md).

> [!TIP]
> Looking for Copilot within a specific report? See [Copilot in the Power BI mobile apps](mobile-apps-copilot.md) to learn about the in-report Copilot experience that provides summaries and insights for the report you're currently viewing.

## Access the standalone Copilot

To start using the standalone Copilot:

1. Open the Power BI mobile app on your device to view the home page.
1. Select the **Copilot** button in the bottom navigation bar.

   :::image type="content" source="./media/mobile-standalone-copilot/copilot-button-nav.png" alt-text="Screenshot of Power BI mobile app showing the Copilot button in the bottom navigation bar." border="false":::

The full-screen Copilot chat interface opens, ready to accept your questions.

> [!NOTE]
> **Admins need to turn on the tenant setting:** To try it out, admins need to [enable Copilot in Power BI](../../create-reports/copilot-enable-power-bi.md), and additionally enable the following new tenant setting: Users can access a standalone, cross-item Power BI Copilot experience.
>
> **Data must be prepped for Copilot:** Copilot works best when the report author has prepared the data specifically for Copilot. If that setup hasn't been done, answers may be limited or inaccurate. For more information, see [Prepare your data for AI](../../create-reports/copilot-prepare-data-ai.md).
>
> **Approve your data for Copilot:** Semantic model authors have the ability to approve a model for use with Copilot in model settings. This impacts the appearance of content warnings for end users. For more information, see [Approve your model for use with AI](../../create-reports/copilot-prepare-data-ai.md#mark-your-model-as-prepped-for-ai).
>
> **Warnings on unprepped data:** Models that aren't approved for Copilot will appear with warnings that the answer quality could be low.

## Ask questions about your data

You can ask Copilot questions about any accessible report, semantic model, or data agent. Copilot processes your query and identifies relevant data sources.

### Voice input (iPhone and iPad)

On iPhone and iPad devices, you can dictate questions by using voice input. Tap the **microphone icon** in the Copilot chat box, speak your question clearly, and Copilot transcribes and processes it the same as typed input.

### Ask a question about your data

When you ask questions about your data, Copilot works with you to understand your topic of interest and use that context to identify the right report, semantic model, or data agent to use as its source. If it finds an item that's a strong match for your question, it selects it in the background and delivers you an answer right away. When more context is needed, Copilot asks simple clarifying questions to narrow it down.

For best results, instead of typing a few keywords like you might with search engines, communicate like you would with a colleague—use full sentences, include contextual details to help Copilot find the right source, and respond thoughtfully to follow-up questions.

:::image type="content" source="./media/mobile-standalone-copilot/copilot-search-results.png" alt-text="Screenshot of Copilot search results displaying relevant data sources with verified answer labels." border="false":::

### Get Copilot responses

When you ask questions about metrics or key performance indicators (KPIs), Copilot typically generates a visual in addition to a textual answer. Copilot responses can include:

- **Textual summary**: A written answer to your question
- **Interactive visual**: A screenshot of a chart or graph representing the data
  - Tap the **visual** to open it in a drawer where you can interact with it in live mode, select elements, use tooltips, and drill down into the data.
  - From the drawer, you can also share the visual as a screenshot or open it in its source report for deeper analysis.
- **Copy option**: An icon to copy the response to your clipboard for sharing
- **References**: Items such as reports, apps, data agents, or semantic models that the answer is based on
  - Tap the **References** button to open a drawer with the referenced items and related information
- **Feedback**: Thumbs up or thumbs down icons to provide feedback on the response
- **How Copilot arrived at this**: Details about how Copilot generated the response
- **DAX query**: The query used to generate the answer (when applicable)

:::image type="content" source="./media/mobile-standalone-copilot/copilot-response-visual.png" alt-text="Screenshot of Copilot response with textual summary and interactive chart visualization." border="false":::

## Share Copilot results

You can share Copilot responses and visuals with colleagues:

- **Copy responses**: Select the **Copy** icon at the top of any Copilot response to copy the text to your clipboard. You can then paste it into email, Teams, or other platforms.
- **Share visuals**: Open a visual in the drawer view and select the **Share** option to send it as a screenshot via email, Teams, messaging apps, or other sharing methods.

## Understand data verification warnings

Great answers start with great data. The clearer and more structured your data is, the better Copilot can help. Semantic model authors have tooling features to help [prepare your data for AI](../../create-reports/copilot-prepare-data-ai.md).

When querying semantic models or reports that haven't been prepped for AI, Copilot displays a warning message indicating the results should be carefully checked for accuracy.

:::image type="content" source="./media/mobile-standalone-copilot/review-warning.png" alt-text="Screenshot of Copilot data verification warning message for nonendorsed semantic models." border="false":::

Answers from models that haven't been prepped are clearly marked with this message to ensure you're aware of potential limitations before proceeding. You can still view and interact with the answer by tapping **View answer**, and the response will appear inline. However, you should review the results carefully to ensure accuracy.

## Limitations and considerations

- Voice dictation is available only on iPhone and iPad devices.
- Conversation context is maintained only during the current session and is cleared when you close the app or refresh content.
- The standalone Copilot experience is only available to customers with home tenants in geographical regions that support Fabric—so **it's only available** for customers with home tenants in [this list](/fabric/admin/region-availability#all-workloads). You don't need to have Fabric enabled to use Copilot, they just need to have home tenants in one of the listed regions.

## Related content

- [Copilot in the Power BI mobile apps](mobile-apps-copilot.md)
- [Overview of Copilot for Power BI](../../create-reports/copilot-introduction.md)
- [Endorse your content](../../collaborate-share/service-endorse-content.md)
