---
title: Find content using Power BI Copilot search
description: Learn how to find content using Power BI Copilot search.
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

# Find content with Power BI Copilot search

As colleagues share Power BI content with you, you might find yourself having access to a long list of content. It can be difficult to recall specific items that you want to navigate back to in order to get an answer to your data question.

Through the [standalone Copilot experience](copilot-chat-with-data-standalone.md), you can easily find Power BI content and chat with your data. In Power BI’s Copilot search, the term content and items refer to reports, semantic models, apps, organizational apps, and data agents. This page explains the metadata Copilot can look at to find your content, the signals used to boost and increase the relevancy of certain items, and what you can do to make items more discoverable for your end users.

:::image type="content" source="media/copilot-introduction/copilot-standalone-screen.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing a chat interface for interacting with data." lightbox="media/copilot-introduction/copilot-standalone-screen.png":::

## Enable Power BI Copilot search

To use Power BI’s Copilot search, [Copilot must be enabled for your tenant](copilot-enable-power-bi.md). You can search and find your content through the [standalone Copilot experience](copilot-chat-with-data-standalone.md).

For an improved search experience, enable the setting to [share data across geographic boundaries](copilot-enable-power-bi.md#enable-sharing-data-across-geographic-boundaries), which allows Copilot to semantically search on similar terms if Azure OpenAI isn't available in your geographic region.

## Find content through metadata

Copilot looks at a breadth of metadata to find content. Power BI Copilot search can find reports, semantic models, data agents, apps, and organizational apps.

:::image type="content" source="media/copilot-introduction/copilot-standalone-search-results.png" alt-text="Screenshot of the standalone Copilot experience in Power BI, showing a list of search results for reports, semantic models, and data agents." lightbox="media/copilot-introduction/copilot-standalone-search-results.png":::

To determine the most relevant items, Copilot looks through metadata, such as the following:

- Title of an item
- Description of an item
- Workspace name that an item belongs to
- Contents within an item, which is explained in the next section

### Content types Copilot looks at

Copilot can search through metadata to find the most relevant item. The following are the types of content that Copilot looks at:

- **For reports**:
  - Report page name
  - Titles of visuals
  - Filter metadata
  - Text boxes on the report canvas
- **For semantic models**:
  - Table names  
  - Table description  
  - Column name  
  - Column description  
  - Measure name  
  - Measure description  
  - Verified answers
- **For data agents**:
  - Published description
  - Agent instructions
  - Example questions given to the agent
  - Schema information
- **For apps and org apps**:
  - Reports that are included within the app. Copilot will respect app audiences, if defined, and only search over reports that you have access to within an app.

> [!NOTE]
> Copilot only finds content that you have access to.

Copilot only searches through attributes you have access to and doesn't provide search results containing items you can't access. This means Copilot doesn't find semantic models [marked as discoverable](../collaborate-share/service-discovery.md#how-to-mark-a-semantic-model-as-discoverable). Copilot respects hidden elements such as hidden table and column names, and doesn't search over these fields.

## Use signals to boost content in search results

You might have an abundance of content. When multiple items are found, Copilot ranks items with the following attributes higher than items without these attributes:

- If you marked the item as a *favorite*
- If you recently opened the item
- If the item is endorsed
- If the item is popular or frequently viewed in your tenant
- If a report is part of an app

## Make items more discoverable to Copilot

Here are some best practices to make your items more discoverable in the standalone Copilot experience:

- **Add item descriptions**: Give context to your business users by adding a description. Use natural language when writing item descriptions to help Copilot and your business users to understand what an item is about.  
- **Use unique keywords**: Many items are named similarly, and it can be hard to distinguish one from the other. Use unique keywords to help your business users better recall and navigate to an item.  
- **Apply an endorsement label**: Endorsement labels are a sign that content is trustworthy. Any creator with *edit access* can add a [**Promoted** label](../collaborate-share/service-endorsement-overview.md).  
- ***Favorite*** **an item**: Marking an item as a *Favorite* is an explicit signal to Copilot that it's important to you. By marking an item as a *Favorite*, you're more likely to see it in your search results.

## Considerations

Copilot best understands natural language. When you're searching for items through the standalone Copilot, adding more context can help with finding more relevant content. For example, searching for "Find reports about Q4 revenue over time" yields better results than a search for the keyword "Q4."

If edits are made directly to an item (for example, updating a visual, renaming titles), these changes are reflected in search results within five minutes. If edits are made indirectly to an item (such as renaming the workspace), the changes might take up to 24 hours to reflect in the search results.
