---
title: Overview of Copilot for Power BI apps
description: Read all about how Copilot works in Power BI apps.
author: julcsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 10/27/2025
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
---

# Overview of Copilot for Power BI apps

Copilot is available in apps two ways: 
1. A report-scoped Copilot that can help users with summaries of the report in view or answer questions based on that report in view
2. An app-scoped Copilot (preview) that can help users find items in the app based on their interests, summarize an item in the app, or answer questions based on items in the app.

:::image type="content" source="media/copilot-apps-overview/app-copilot-and-report-copilot.png" alt-text="Screenshot of app-scoped Copilot and report-scoped Copilot" lightbox="media/copilot-apps-overview/app-copilot-and-report-copilot.png":::

## Report-scoped Copilot in apps
Report Copilot is available in workspace apps and org apps (the new version of apps in preview). Report Copilot, when opened, is scoped to the report in view only. See [Copilot for Power BI reports](copilot-reports-overview.md) for information on how report Copilot works.

:::image type="content" source="media/copilot-apps-overview/report-copilot-in-app.png" alt-text="Screenshot of report-scoped Copilot open within an app" lightbox="media/copilot-apps-overview/report-copilot-in-app.png":::

## App-scoped Copilot (preview)

App-scoped Copilot is available in workspace apps. Copilot for apps is similar to standalone Copilot for Power BI. While standalone Copilot is scoped to all Copilot-supported items types a user has access to in Power BI, app-scoped Copilot scoped to only the Copilot-supported item types in the app. See [standalone Copilot for Power BI](copilot-chat-with-data-standalone.md) for information on how standalone Copilot works. Continue to read this article for more information on how app-scoped Copilot works similarly for an app.

:::image type="content" source="media/copilot-apps-overview/app-scoped-copilot-open-in-app.png" alt-text="Screenshot of app-scoped Copilot open within an app" lightbox="media/copilot-apps-overview/app-scoped-copilot-open-in-app.png":::

### Item types supported by app-scoped Copilot (preview) 

App-scoped Copilot supports the following item types included in an app: 
* Power BI reports
* Semantic models

> [!NOTE]
> App authors, consider the following specifics for Copilot in apps:
> * Power BI apps version the report items included in an app. App authors, to ensure Copilot uses the latest changes to a report, update the app.
> * Copilot can only use the items a user has access to. Power BI workspace apps manage access to reports and semantic models in the workspace associated with the app. For reports that use semantic models in a separate workspace, manage access separately.
> 
> See more about [publishing and updating apps](../collaborate-share/service-create-distribute-apps.md) for access considerations.

There are item types support by apps that app-scoped Copilot doesn't support:
* Paginated reports
* Dashboards
* Workbooks
* Linked or link-embedded content
* * Including link embedded Power BI items, like reports
 
### How to use app-scoped Copilot (preview)
App-scoped Copilot is available in tenants where Copilot is enabled and the app author enabled app-scoped Copilot and visible in the app navigation.

> [!NOTE]
> **Copilot in apps is on by default** and can be managed per app.
>
> For more information on Copilot availability, see the [Copilot in Fabric overview](/fabric/get-started/copilot-fabric-overview).
> Learn more about turning Copilot on and off generally for Power BI, or specifically for Copilot on reports (also shown on reports in apps), see [Enable Fabric Copilot for Power BI](/fabric/get-started/copilot-enable-fabric).

To open app-scoped Copilot, click Copilot in the app navigation:
:::image type="content" source="media/copilot-apps-overview/workspace-app-copilot-in-app-nav.png" alt-text="Screenshot of app-scoped Copilot in the app nav." lightbox="media/copilot-apps-overview/workspace-app-copilot-in-app-nav.png":::

If the app author chose for the app navigation to be collapsed by default, users need to expand the app navigation to view the app navigation and see Copilot:
:::image type="content" source="media/copilot-apps-overview/expand-app-nav.png" alt-text="Screenshot of button to select for expanding app nav with app nav then expanded.":::

App users Copilot activity must be linked to a capacity. Learn more about the [general requirements for Copilot use](copilot-introduction.md#general-requirements) and how [capacity assignment and autoselection works](copilot-introduction.md#link-to-a-fabric-copilot-capacity).

#### Find items in the app
You can ask Copilot to find reports you have access to in the app. In response, you get a hyperlinked list of relevant items, with helpful details to make it easy for you to find the right thing. Learn more about [searching for items](copilot-search-new-content.md) Selecting an item listed in the results opens that item in a new tab within the app.

:::image type="content" source="media/copilot-apps-overview/app-copilot-find-item-then-open-item.png" alt-text="Screenshot of item search results from app-scoped Copilot with an item opened after selection." lightbox="media/copilot-apps-overview/app-copilot-find-item-then-open-item.png":::

> [!TIP]
> After getting back search results, continue the conversation by asking Copilot to "Summarize report 1" or ask Copilot, "What is revenue for the month to date using 2?"

#### Summarize an item in the app
Copilot can provide summaries about an entire report or a specific topic within that report. You can use prompts like:
* "Give me a summary about customer sentiment on smart materials."
* "Summarize trends in sales last year."

:::image type="content" source="media/copilot-apps-overview/app-copilot-summary-close-up.png" alt-text="Screenshot of request to summarize customer sentiment, selecting a report, and summary returned by app-scoped Copilot" lightbox="media/copilot-apps-overview/app-copilot-summary-close-up.png":::

Summaries in the app-scoped Copilot experience include both textual insights and relevant visuals within the narrative. Currently, summaries are only available for reports, not for semantic models. Learn more about [summarizing a report or topic](copilot-pane-summarize-content.md).

#### Asks questions and get answers based on an item in the app
The app-scoped Copilot experience can summarize data from reports and use the report visuals to answer specific questions. If the answer can't be found in the report, Copilot defaults to using the semantic model to generate rich answers for users.
Learn more about [asking questions about your data](copilot-ask-data-question.md).

:::image type="content" source="media/copilot-apps-overview/app-copilot-question-close-up.png" alt-text="Screenshot of data question in app-scoped Copilot with item selected and answer returned." lightbox="media/copilot-apps-overview/app-copilot-question-close-up.png":::

#### Attach an item from the app to summarize or ask questions
At times, you may want to ask questions about your data based on a specific item. In app-scoped Copilot, you can attach a specific report for Copilot to reference.

If you know exactly which report, attach it to your chat using the **Add content for Copilot to reference** option.
:::image type="content" source="media/copilot-apps-overview/app-copilot-attach-item.png" alt-text="Screenshot of button to attach item for Copilot to reference." lightbox="media/copilot-apps-overview/app-copilot-attach-item.png":::

Then it appears in the Copilot conversation and is used to answer your questions.

## Clear chat
The "clear chat" button removes the contents of the current conversation and any previous context set throughout the conversation. Clearing the chat is essentially the same as starting a new chat. Chats are also cleared when navigating away from app-scoped Copilot.

See more how [clear chat](copilot-introduction.md#copilot-clear-chat) works for Copilot in Power BI.

## Share feedback
User feedback is important for continued Copilot improvements. After each Copilot response, users can provide feedback on the response by selecting the feedback buttons corresponding with their sentiment.

:::image type="content" source="media/copilot-apps-overview/copilot-feedback.png" alt-text="Screenshot of button to provide feedback on Copilot." :::

## Limitations and considerations for app users
* In select cases app-scoped Copilot uses item names that app authors configure. The original item name may differ from the name shown in the app and used in app-scoped Copilot responses.
* Clicking an item link opens the item in a new browser tab.
* Clicking a citation link opens the item in a new browser tab outside the app.
* Conversations are cleared when navigating away from or closing Copilot in apps.
* App-scoped Copilot and report-scoped Copilot in apps are separate functionality. Prompts and responses in each Copilot may differ and aren't shared between each Copilot.
* App-scoped Copilot is available for workspace apps only, not org apps (preview).
* Report-scoped Copilot in apps is available in both workspace apps and org apps (preview).

## Limitations and considerations for app authors
* Items in apps are versioned upon app update. Copilot uses the version of the item in the app. Update the app to ensure Copilot is reasoning over the latest changes to items in the app.
* [Verified answers][copilot-prepare-data-ai-verified-answers.md] are supported in Copilot for apps. To ensure verified answers are available to app users, update the app after verified answers s are configured.
* Copilot only uses items in the app users have access to. Copilot doesn't use items a user doesn't have access to. For example: If a report is built on a semantic model in a workspace not associated with the app, the app doesn't manage user access for that semantic model. Manage user access on the semantic model separately so Copilot can use that item.

Learn more about [publishing and updating apps](../collaborate-share/service-create-distribute-apps.md) for more considerations and limitations.
