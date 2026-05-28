---
title: "Copilot in Power BI Tutorial: Discover Data and Ask Questions"
description: This article provides an overview of using Copilot in Power BI to ask questions and get insights using natural language inputs.
author: julcsc
ms.author: juliacawthra
ms.reviewer: alpowers
ms.topic: tutorial
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
ms.custom: azure-data-cat
ms.date: 05/26/2026
ms.update-cycle: 180-days
ai-usage: ai-assisted
---

# Copilot in Power BI tutorial: Discover data and ask questions

> [!NOTE]
> You can author **Prep data for AI** features in both Power BI Desktop and the Power BI service. Users can consume these features anywhere Copilot in Power BI is available.

In this tutorial, you use natural language inputs to get insights. You learn to:

> [!div class="checklist"]
>
> - Add items
> - Ask questions
> - Get answers

> [!NOTE]
> Copilot outputs are nondeterministic, meaning that it's possible for a user to receive a different output from a Copilot experience, despite using the same prompt and grounding data. Set expectations with users so they know what kinds of outputs to expect from Copilot, and how they can evaluate or validate these outputs, for themselves.
>
> Learn more about the [Responsible use of Copilot in Power BI](copilot-integration.md#responsible-use-of-copilot-in-power-bi).

## Copilot

Open the Power BI service ([app.powerbi.com](https://app.powerbi.com/)), and select Copilot in the left navigation.

:::image type="content" source="media/tutorial-copilot-power-bi/left-navigation-copilot.png" alt-text="Screenshot of the left-navigation menu and the Copilot button.":::

## Discover data

Discovering your data is easy with Copilot. It helps you quickly locate reports, semantic models, reports in apps, and data agents that you have access to, even when you can't remember the exact name or workspace. Copilot uses metadata such as item names, descriptions, visual titles, textboxes, and workspace names, along with attributes like recent views, endorsements, favorites, and popularity within your tenant, to match and retrieve the most relevant items.

1. Ask Copilot to help find an item by using the following example input and select **Send** or **Enter** to confirm.
    - Where can I find data about the sales funnel including opportunities, stages, and goals

    :::image type="content" source="media/tutorial-copilot-power-bi/copilot-ask-about-data.png" alt-text="Screenshot of the search input for Copilot to ask a question.":::

1. Interactions with Copilot are specific to each user and include only content that the user has permission to access. When you do a search, you see a list of items that match your query from content that you’re authorized to view. This list includes content from semantic models, reports, and reports contained within apps. The matching process is based on multiple criteria, including the title, description, detailed content, verified answers, and your recently used and favorite items. To get a written overview of one of the items, ask Copilot for a summary. Use the following example input and select **Send** or **Enter** to confirm.
    - **Important:** The Revenue Opportunities report might appear in a different order in your session. If needed, adjust the item number in your example input accordingly.

    - Provide a detailed summary of the contents of the *second* item. I need to understand what it contains so I can ask questions.

    :::image type="content" source="media/tutorial-copilot-power-bi/copilot-matched-on-item.png" alt-text="Screenshot of the left-navigation menu and the Copilot icon.":::

1. When a summary is generated, it provides insights and details across multiple pages and visuals of the selected report. Reference footnotes in the summary highlight the visual from which each insight is derived. You can go directly to the report by selecting **Open in report** or use **Explore answer** to add new data or save it as a new item in a workspace. To continue, select **Clear chat** to remove the current report from the chat history.

    :::image type="content" source="media/tutorial-copilot-power-bi/copilot-clear-chat.png" alt-text="Screenshot of the Copilot returned summary and how to clear chat.":::

## Ask questions and get answers

Tell Copilot what you're looking for. If the answer isn't already visualized in your report, Copilot queries your model and returns the answer as a new visual, applying filters for relative dates and data-related criteria. Additionally, Copilot can generate data analysis expression (DAX) queries to answer questions that require ad hoc calculations, such as creating new measures that aren't contained in the model.

1. Select **Add items for better results** and select the **Reports** option.

    :::image type="content" source="media/tutorial-copilot-power-bi/add-report-item.png" alt-text="Screenshot of the Add items for better results option with Reports selected.":::

1. From the OneLake catalog, you can attach one or multiple items as extra context. Check the box next to the **Revenue Opportunities** report and select **Confirm**.

    :::image type="content" source="media/tutorial-copilot-power-bi/add-a-report-to-request.png" alt-text="Screenshot of the OneLake catalog with the Revenue Opportunities report selected.":::

1. With the report now attached to your question as added context, ask Copilot the following example question, and select **Send** or **Enter** to confirm.
    - What was the revenue for each state in the last year?

    :::image type="content" source="media/tutorial-copilot-power-bi/copilot-ask-about-report-data.png" alt-text="Screenshot of Copilot showing a question about revenue for each state in the last year.":::

1. An insight summary and a visual are returned as an answer to your question. You can expand the **How Copilot arrived at this** option to review the data used and understand any filters applied. In this example, relative date filters are applied based on the "*in the last year*" condition. To view the full report, select the **Revenue Opportunities** option.

    :::image type="content" source="media/tutorial-copilot-power-bi/copilot-filter-applied-to-answer.png" alt-text="Screenshot of Copilot's returned insight summary and visual with filters applied.":::

## Next step

> [!div class="nextstepaction"]
> [Explore data and get insights](tutorial-copilot-power-bi-explore-data.md)
