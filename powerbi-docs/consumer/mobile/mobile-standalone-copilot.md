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

| :::image type="icon" source="./media/mobile-apps-logo-images/ios-logo-40-px.png" border="false"::: | :::image type="icon" source="./media/mobile-apps-logo-images/ios-logo-40-px.png" border="false"::: | :::image type="icon" source="./media/mobile-apps-logo-images/android-logo-40-px.png" border="false"::: | :::image type="icon" source="./media/mobile-apps-logo-images/android-logo-40-px.png" border="false"::: |
|:---:|:---:|:---:|:---:|
| iPhones | iPads | Android phones | Android tablets |

The standalone Copilot in Power BI mobile apps provides a full-screen chat experience that you can use to ask questions about your data directly from the app's home page. Unlike the in-report Copilot button, this standalone experience enables you to query any report, semantic model, or data agent in your organization without first opening a specific item. Copilot analyzes your question, suggests relevant data sources, and generates instant insights with both textual summaries and interactive visuals.

## Access the standalone Copilot

To start using the standalone Copilot:

1. Open the Power BI mobile app on your device to view the home page.
1. Select the **Copilot** button in the bottom navigation bar.

   :::image type="content" source="./media/mobile-standalone-copilot/copilot-button-nav.png" alt-text="Screenshot of Power BI mobile app showing the Copilot button in the bottom navigation bar." border="false":::

The full-screen Copilot chat interface opens, ready to accept your questions.

## Ask questions about your data

You can ask Copilot questions about any accessible report, semantic model, or data agent. Copilot processes your query and identifies relevant data sources.

### Query reports and semantic models

To ask a question:

1. In the Copilot chat interface, type your question in the text box, or dictate using the microphone. For example, you can ask, "What is the total spending by island in tourism?"
1. Select **Send**.

   Copilot displays a list of relevant items that match your query.

   :::image type="content" source="./media/mobile-standalone-copilot/copilot-search-results.png" alt-text="Screenshot of Copilot search results displaying relevant data sources with verified answer labels." border="false":::

   Reports and semantic models that are verified (marked as endorsed for use with AI) are labeled as **Verified answer**.

1. Select an item from the list by tapping the suggestion pill.

Copilot generates a response based on the selected item.

#### Voice input (iPhone and iPad)

On iPhone and iPad devices, you can dictate questions by using voice input:

1. Tap the **microphone icon** in the Copilot chat box.
1. Speak your question clearly. For example, "Show me humidity trend for Glacier National Park."
1. Copilot transcribes your question and processes it the same as typed input.

:::image type="content" source="./media/mobile-standalone-copilot/voice-dictation.png" alt-text="Screenshot showing the microphone icon for voice dictation in the chat interface." border="false":::

### Review Copilot responses

When you ask questions about metrics or key performance indicators (KPIs), Copilot typically generates a visual in addition to a textual answer. Copilot responses can include:

- **Textual summary**: A written answer to your question
- **Interactive visual**: A chart or graph representing the data (commonly generated for metric and KPI queries)
- **Copy option**: An icon to copy the response to your clipboard for sharing
- **References**: Citations linking to the visuals used to formulate the answer

:::image type="content" source="./media/mobile-standalone-copilot/copilot-response-visual.png" alt-text="Screenshot of Copilot response with textual summary and interactive chart visualization." border="false":::

## Interact with visuals

Copilot responses often include interactive visuals that you can explore in detail.

### Open visual drawer

To view a visual in more detail, select it in the Copilot response. A drawer opens displaying a live, interactive version of the visual where you can select elements, use tooltips, and drill down into the data. From the drawer, you can also share the visual as a screenshot or open it in its source report for deeper analysis.

### View references

To see the visuals Copilot referenced when formulating its response, select the **References** link at the bottom of the response. A hyperlinked list of all cited visuals appears. Select any reference to open it in the interactive drawer.

## Share Copilot results

You can share Copilot responses and visuals with colleagues:

- **Copy responses**: Select the **Copy** icon at the top of any Copilot response to copy the text to your clipboard. You can then paste it into email, Teams, or other platforms.
- **Share visuals**: Open a visual in the drawer view and select the **Share** option to send it as a screenshot via email, Teams, messaging apps, or other sharing methods.

## Work with data agents

Standalone Copilot can query data agents configured in your organization, providing a unified experience across Power BI reports and Fabric data agents.

To ask a data agent a question:

1. In the Copilot chat, ask Copilot to find the data agent. For example, you can ask, "Find Movies Analysis data agent."
1. Copilot displays a numbered list of matching data agents.
1. Ask your question referencing the data agent number. For example, reply, "Use #2 - Which 5 movies have earned the highest gross revenue?"

Copilot queries the data agent and returns the response directly in the mobile app.

This integration enables seamless access to both Power BI and Fabric data from your mobile device.

## Understand data verification warnings

When querying semantic models or reports that aren't endorsed for AI use, Copilot displays a warning message.

:::image type="content" source="./media/mobile-standalone-copilot/review-warning.png" alt-text="Screenshot of Copilot data verification warning message for nonendorsed semantic models." border="false":::

The warning indicates that the model author didn't mark the data as prepared for use with AI. You can still view and interact with the answer by tapping **View answer**, but you should review the results carefully to ensure accuracy.

For information about endorsing content for AI, see [Endorse your content](../../collaborate-share/service-endorse-content.md).

## Keep your navigation and chat history

The standalone Copilot keeps your chat history during your session:

- **Active session**: You can access your conversation history as long as you stay in the Copilot interface.
- **Navigation**: Use the back button to return to the chat after exploring visuals or reports.
- **Multiple queries**: You can ask follow-up questions or start new queries without losing previous responses.

To return to the Power BI home screen, tap the **Home** button in the bottom navigation.

## Limitations and considerations

- Standalone Copilot is currently in preview and requires that Copilot features be enabled in your organization.
- Reports and semantic models must meet [Copilot for Power BI requirements](../../create-reports/copilot-introduction.md).
- Voice dictation is available only on iPhone and iPad devices.
- Chat history is maintained only during the current session and is cleared when you close the app or refresh content.
- Data agent access requires appropriate permissions configured in your organization.

## Related content

- [Copilot in the Power BI mobile apps](mobile-apps-copilot.md)
- [Overview of Copilot for Power BI](../../create-reports/copilot-introduction.md)
- [Endorse your content](../../collaborate-share/service-endorse-content.md)
