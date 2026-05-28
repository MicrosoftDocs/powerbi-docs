---
title: "Copilot in Power BI Tutorial: Explore Data and Gain Insights"
description: Learn how to use Copilot in Power BI to explore report data, uncover insights, and create summaries in the Power BI service. Start now.
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

# Copilot in Power BI tutorial: Explore data and gain insights

> [!NOTE]
> You can author **Prep data for AI** features in both Power BI Desktop and the Power BI service. Users can consume these features anywhere Copilot in Power BI is available.

In this tutorial, you use Copilot in Power BI to explore report data and uncover more insights. You learn to:

> [!div class="checklist"]
>
> - Understand the data
> - Dig deeper
> - Write a summary

> [!NOTE]
> Copilot outputs are nondeterministic, meaning that it's possible for a user to receive a different output from a Copilot experience, despite using the same prompt and grounding data. Set expectations with users so they know what kinds of outputs to expect from Copilot, and how they can evaluate or validate these outputs, for themselves.
>
> Learn more about the [Responsible use of Copilot in Power BI](copilot-integration.md#responsible-use-of-copilot-in-power-bi).

## Open Copilot

From the action bar, select the **Copilot** button on the right-hand side.

:::image type="content" source="media/tutorial-copilot-power-bi/action-bar-copilot.png" alt-text="Screenshot of the action bar menu and the Copilot button.":::

## Understand the data

1. In the Copilot pane, expand the **Understand the data** group and select the **What is this report page about?** prompt.

    :::image type="content" source="media/tutorial-copilot-power-bi/understand-the-data.png" alt-text="Screenshot of the Copilot pane showing the Understand the data group." lightbox="media/tutorial-copilot-power-bi/understand-the-data.png":::

1. Copilot creates a report summary, including reference footnotes. When you select the summary, the visuals are spotlighted on the page to help you cross-check the summary output.

    :::image type="content" source="media/tutorial-copilot-power-bi/copilot-pane-summary.png" alt-text="Screenshot of the Copilot pane and spotlighted reference footnotes.":::

## Dig deeper

To understand how Copilot interpreted your question and ensure it chose the correct fields, measures, or filters from your model, expand the **How Copilot arrived at this** dropdown. By reviewing more details about the data used and filters applied, you can view or customize these details by selecting the **Explore** option. This approach allows you to quickly get the answers you need by dragging and dropping or selecting fields.

1. Provide Copilot with the following example instruction to continue exploring your data, and select **Send** or **Enter** to confirm:
    - Generate a funnel chart showing the total opportunities and their sales stages for Aqua products over the last three months

    :::image type="content" source="media/tutorial-copilot-power-bi/ask-for-a-funnel-chart.png" alt-text="Screenshot of the Copilot text input for generating a visual from a question.":::

1. Copilot returns a summarization of the data and a visual as an answer to your instructions. You can expand the **How Copilot arrived at this** option to review the data used and understand any filters applied. In this example, relative date filters are applied based on the "last three months" condition. To explore and further customize the visual, select the **Explore answer** option.

    :::image type="content" source="media/tutorial-copilot-power-bi/explore-funnel-chart-answer.png" alt-text="Screenshot of the Copilot response and generated visual.":::

1. **Explore** allows you to interact with the visual, add or customize filters, rearrange the data, and more. You can also save the exploration to a workspace for continued use. To exit, select **Close** (X) in the top-right corner.

    :::image type="content" source="media/tutorial-copilot-power-bi/explore-funnel-chart.png" alt-text="Screenshot of a Copilot response and how it arrived at this answer.":::

## Write a summary

When you generate a summary in Copilot, you can create detailed summaries for broad topics or specific inquiries in seconds. This feature saves you the time it would take to manually interpret the data. Copilot responds with a comprehensive summary tailored to your question. It includes the most relevant information directly in the response, along with reference footnotes. This process ensures you receive insightful information that's supported by your data.

1. Provide Copilot with the following example instruction to write a summary about your data, and select **Send** or **Enter** to confirm:
    - Write an executive summary for the senior management team, focusing on the distribution of operational results across regions

    :::image type="content" source="media/tutorial-copilot-power-bi/ask-for-a-written-summary.png" alt-text="Screenshot of the Copilot text input and requesting a summary.":::

1. You receive a summarization of the data and a visual as an answer to your instructions. The response includes reference footnotes to highlight visuals from the report page. As you hover over the response, an option appears for you to easily copy the written summary and share it with other people in your organization.

    :::image type="content" source="media/tutorial-copilot-power-bi/copilot-written-summary.png" alt-text="Screenshot of a Copilot response and summary.":::

## Related content

- [Overview of Copilot for Power BI](copilot-introduction.md)
- [Prepare your data for AI](copilot-prepare-data-ai.md)
- [Ask Copilot for data from your model (preview)](copilot-ask-data-question.md)
