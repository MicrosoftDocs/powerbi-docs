---
title: "Copilot for Power BI Apps: Report and App-Scoped AI Features"
description: Discover how Copilot for Power BI apps uses AI to summarize reports, find items, and answer data questions. Learn about report-scoped and app-scoped features.
author: julcsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: overview
ms.date: 02/04/2026
ai-usage: ai-assisted
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
---

# Copilot for Power BI apps: Report and app-scoped AI features

Copilot for Power BI apps helps you interact with your data more efficiently by using AI-powered features. Copilot is available in apps in two ways:

* A report-scoped Copilot that helps users by providing summaries of the report in view or answers questions based on that report in view.
* An app-scoped Copilot (preview) that can summarize the app based on items within, help users find items in the app based on their interests, summarize an item in the app, or answer questions based on items in the app.

:::image type="content" source="media/copilot-apps-overview/app-copilot-and-report-copilot.png" alt-text="Screenshot of app-scoped Copilot and report-scoped Copilot." lightbox="media/copilot-apps-overview/app-copilot-and-report-copilot.png":::

## Report-scoped Copilot in apps

Report Copilot is available in workspace apps and org apps (the new version of apps in preview). When opened, report Copilot scopes to the report in view only. For more information, see [Copilot for Power BI reports](copilot-reports-overview.md).

:::image type="content" source="media/copilot-apps-overview/report-copilot-in-app.png" alt-text="Screenshot of report-scoped Copilot open within an app." lightbox="media/copilot-apps-overview/report-copilot-in-app.png":::

## App-scoped Copilot (preview)

App-scoped Copilot is available in workspace apps. Copilot for apps is similar to standalone Copilot for Power BI. While standalone Copilot scopes to all Copilot-supported item types a user has access to in Power BI, app-scoped Copilot scopes to only the Copilot-supported item types in the app. For more information, see [standalone Copilot for Power BI](copilot-chat-with-data-standalone.md). This article provides more information on how app-scoped Copilot works similarly for an app.

:::image type="content" source="media/copilot-apps-overview/app-scoped-copilot-open-in-app.png" alt-text="Screenshot of app-scoped Copilot open within an app." lightbox="media/copilot-apps-overview/app-scoped-copilot-open-in-app.png":::

### Supported item types

App-scoped Copilot supports the following item types included in an app:

* Power BI reports
* Semantic models

> [!NOTE]
> App authors, consider the following specifics for Copilot in apps:
>
> * Power BI apps version the report items included in an app. To ensure Copilot uses the latest changes to a report, update the app.
> * Copilot can only use the items a user has access to. Power BI workspace apps manage access to reports and semantic models in the workspace associated with the app. For reports that use semantic models in a separate workspace, manage access separately.
>
> For more information about access considerations, see [publishing and updating apps](../collaborate-share/service-create-distribute-apps.md).

Some item types supported by apps aren't supported by app-scoped Copilot:

* Paginated reports
* Dashboards
* Workbooks
* Linked content, including link-embedded Power BI items such as reports.
  
Additionally, app‑scoped Copilot doesn't recognize app navigation sections and doesn't refer to sections in its responses.

### Availability and access

App-scoped Copilot is available in tenants where Copilot is enabled and the app author enabled app-scoped Copilot. The **Copilot** option appears in the app navigation.

> [!NOTE]
> **Copilot in apps is on by default** and you can manage it per app.
>
> For more information on Copilot availability, see the [Copilot in Fabric overview](/fabric/get-started/copilot-fabric-overview).
> To learn more about turning Copilot on and off generally for Power BI, or specifically for Copilot on reports (also shown on reports in apps), see [Enable Fabric Copilot for Power BI](/fabric/get-started/copilot-enable-fabric).

:::image type="content" source="media/copilot-apps-overview/workspace-app-copilot-in-app-nav.png" alt-text="Screenshot of app-scoped Copilot in the app nav." lightbox="media/copilot-apps-overview/workspace-app-copilot-in-app-nav.png":::

If the app author configures a collapsed app navigation by default, users expand the app navigation to access **Copilot**.

:::image type="content" source="media/copilot-apps-overview/expand-app-nav.png" alt-text="Screenshot of button to select for expanding app nav with app nav then expanded.":::

App users' Copilot activity must be linked to a capacity. Learn more about the [general requirements for Copilot use](copilot-introduction.md#general-requirements) and how [capacity assignment and autoselection works](copilot-introduction.md#access-to-a-copilot-supported-capacity).

### Summarize the app

Copilot helps users understand what reporting is available in the app. Prompts like the following examples generate app summaries:

* "Summarize the reporting in this app."
* "What's this app about?"
* "What does this app cover?"

:::image type="content" source="media/copilot-apps-overview/app-copilot-summary.png" alt-text="Screenshot of app summary response from app-scoped Copilot." lightbox="media/copilot-apps-overview/app-copilot-summary.png":::

Copilot reviews the report descriptions and provides a topical summary of the app’s reporting. This topical summary helps you find items of interest and ask Copilot focused questions. Copilot answers these questions using the context available in the app’s reporting.

### Find items in the app

Copilot can find reports that users have access to in the app. Responses include a hyperlinked list of relevant items with helpful descriptions to guide users to the right content. Learn more about [searching for items](copilot-search-new-content.md). Selecting an item in the results opens it in a new tab within the app.

:::image type="content" source="media/copilot-apps-overview/app-copilot-find-item-then-open-item.png" alt-text="Screenshot of item search results from app-scoped Copilot with an item opened after selection." lightbox="media/copilot-apps-overview/app-copilot-find-item-then-open-item.png":::

> [!TIP]
> After search results appear, users can continue the conversation by asking Copilot to "Summarize [report name]" or "What is revenue for the month to date using [report name]?"

### Summarize an item in the app

Copilot can provide summaries about an entire report or a specific topic within that report. Prompts like the following examples generate item summaries:

* "Give me a summary about customer sentiment on smart materials."
* "Summarize trends in sales last year."

:::image type="content" source="media/copilot-apps-overview/app-copilot-summary-close-up.png" alt-text="Screenshot of request to summarize customer sentiment, selecting a report, and summary returned by app-scoped Copilot." lightbox="media/copilot-apps-overview/app-copilot-summary-close-up.png":::

Summaries in the app-scoped Copilot experience include both textual insights and relevant visuals within the narrative. Currently, summaries are only available for reports, not for semantic models. Learn more about [summarizing a report or topic](copilot-pane-summarize-content.md).

### Ask questions and get answers based on an item in the app

The app-scoped Copilot experience can summarize data from reports and use the report visuals to answer specific questions. Copilot works with you to understand your topic of interest and use that context to identify the right report to use as its source. When Copilot identifies a strong match, it selects the item in the background and answers immediately. When more context is needed, Copilot asks simple clarifying questions to narrow it down.

If the answer can't be found in the selected report, Copilot defaults to using the semantic model to generate rich answers for users.
Learn more about [asking questions about your data](copilot-ask-data-question.md).

:::image type="content" source="media/copilot-apps-overview/app-copilot-question-close-up.png" alt-text="Screenshot of data question in app-scoped Copilot with item selected and answer returned." lightbox="media/copilot-apps-overview/app-copilot-question-close-up.png":::

### Attach an item from the app to summarize or ask questions

App-scoped Copilot supports attaching a specific report as a reference when you ask questions about data. Use the **Add content for Copilot to reference** option to specify exactly which report Copilot should use.

:::image type="content" source="media/copilot-apps-overview/app-copilot-attach-item.png" alt-text="Screenshot of button to attach item for Copilot to reference." lightbox="media/copilot-apps-overview/app-copilot-attach-item.png":::

The selected report appears in the Copilot conversation and serves as the source for answering questions.

## Clear chat

The **clear chat** button removes the contents of the current conversation and any previous context set throughout the conversation. Clearing the chat is essentially the same as starting a new chat. Users also clear chats when they navigate away from app-scoped Copilot.

For more information about how clear chat works for Copilot in Power BI, see [Clear the Copilot chat](copilot-introduction.md#clear-the-copilot-chat).

## Share feedback

User feedback is important for continued Copilot improvements. Feedback buttons appear after each Copilot response, so users can indicate their sentiment about the response.

:::image type="content" source="media/copilot-apps-overview/copilot-feedback.png" alt-text="Screenshot of button to provide feedback on Copilot.":::

## Limitations and considerations

* **For app users**:

  * In select cases, app-scoped Copilot uses item names that app authors configure. The original item name might differ from the name shown in the app and used in app-scoped Copilot responses.
  * App‑scoped Copilot doesn't recognize app navigation sections and doesn't refer to sections in its responses.
  * Clicking an item link opens the item in a new browser tab.
  * Clicking a citation link opens the item in a new browser tab outside the app.
  * Conversations are cleared when you navigate away from or close Copilot in apps.
  * App-scoped Copilot and report-scoped Copilot in apps are separate functionality. Prompts and responses in each Copilot might differ and aren't shared between each Copilot.
  * App-scoped Copilot is available for workspace apps only, not org apps (preview).
  * Report-scoped Copilot in apps is available in both workspace apps and org apps (preview).
* **For app authors**:
  * Items in apps are versioned upon app update. Copilot uses the version of the item in the app. Update the app to ensure Copilot is reasoning over the latest changes to items in the app.
  * [Verified answers](copilot-prepare-data-ai-verified-answers.md) are supported in Copilot for apps. To ensure verified answers are available to app users, update the app after verified answers are configured.
  * Copilot only uses items in the app that users have access to. Copilot doesn't use items a user doesn't have access to. For example, if a report is built on a semantic model in a workspace not associated with the app, the app doesn't manage user access for that semantic model. Manage user access on the semantic model separately so Copilot can use that item.

For more considerations and limitations, see [publishing and updating apps](../collaborate-share/service-create-distribute-apps.md).
