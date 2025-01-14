---
title: Create a narrative visual with Copilot for Power BI
description: When you're using Copilot, you can quickly create a narrative of your report.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: cnews
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 11/20/2024
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
---

# Create a narrative Visual with Copilot for Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In Power BI Desktop and the Power BI service, you can use Copilot for Power BI to quickly create a narrative about a report page with just a few clicks. This narrative can summarize the entire report, specific pages, or even specific visuals that you select. You can curate the tone and specificity of the narrative with suggested and custom prompts.

If you don't have write permissions for a report, you can still [create a report summary in the Copilot pane](copilot-pane-summarize-content.md).

[!INCLUDE [copilot-notes](../includes/copilot-notes.md)]

## Before you start

You may need to do some clean-up work on your report. The narrative visual pulls information from what is on the report canvas, not the underlying semantic model, so clearly named visuals and axes are important for the visual to glean highlights, lowlights, and insights from the report. Read the article [Update your data model to work well with Copilot](copilot-evaluate-data.md) to see if you need to modify your semantic model.

## Get started

To see the **Copilot** button in your report, you first need to select a semantic model.

### [Power BI service](#tab/powerbi-service)

In the Power BI service, you need to be in an appropriate workspace to see the Narratives with Copilot visual button in the Visualizations pane. The Copilot visual button is the same as the old narratives visual button. For details on what makes an appropriate workspace, see [Considerations and limitations](#considerations-and-limitations) in this article.

1. The **Narrative** visual needs content to summarize, so in the Power BI service, select the **OneLake data hub**, select **More options** next to a semantic model.
1. Select **Create report**.

### [Power BI Desktop](#tab/powerbi-desktop)

If you're not signed in to Power BI Desktop, you still see the Copilot entry points. When you select Copilot, you're asked to sign in.  If your tenant admin has disabled it, you see that it's disabled.  If your tenant admin has enabled it and you have access to an appropriate workspace capacity, you can use Copilot.

1. In Power BI Desktop, select **Get data**, then select a data source. See [Data sources in Power BI Desktop](../connect-data/desktop-data-sources.md) for more info.
1. Create a page with visualizations of the data that you want the Copilot narrative to summarize.
---

3. In the **Visualizations** pane, select the **Narrative** icon. 
1. In **Choose a narrative type**, select the **Copilot** button to use the new narrative visual.

    :::image type="content" source="media/copilot-create-narrative/copilot-fork-option.png" alt-text="Screenshot showing Choose a narrative type, select Copilot." lightbox="media/copilot-create-narrative/copilot-fork-option.png":::

1. Select an option in the **Create a narrative with Copilot** dialog, and select **Create**. 

     :::image type="content" source="media/copilot-create-narrative/create-narrative-dialog.png" alt-text="Screenshot showing select an option in the Create a narrative with Copilot dialog." lightbox="media/copilot-create-narrative/create-narrative-dialog.png":::

1. You can include or exclude individual visuals or pages, or summarize the entire report.

    :::image type="content" source="media/copilot-create-narrative/copilot-narrative-select-content.png" alt-text="Screenshot showing selecting content for the narrative." lightbox="media/copilot-create-narrative/copilot-narrative-select-content.png":::

1. Read through the summary to make sure it's accurate.

    :::image type="content" source="media/copilot-create-narrative/check-summary.png" alt-text="Screenshot showing Read the summary to make sure it's accurate." lightbox="media/copilot-create-narrative/check-summary.png" :::

1. To change the narrative, in the **Adjust your summary with Copilot**, give instructions to change it, or use one of the suggested prompts.

1. Select the footnotes to view references to specific visuals in the summary.

    :::image type="content" source="media/copilot-create-narrative/reference-hover.png" alt-text="Screenshot showing hover over a footnote to see the reference.":::

    Power BI highlights the visual that the footnote refers to.

    :::image type="content" source="media/copilot-create-narrative/highlighted-referenced-visual.png" alt-text="Screenshot showing highlighted visual." lightbox="media/copilot-create-narrative/highlighted-referenced-visual.png":::

    You can switch back and forth between the previous "smart narrative" visual and the new narrative visual with Copilot by selecting the icon next to the title. The summary content isn't lost when you switch back and forth. Switching may help, as you can't yet edit the body of the Copilot summary. For control over the generated summary, use custom prompts to specify tone or formatting, direct the summary to specific portions of the report, or clarify requests. You can copy and paste it into the smart narrative body for more involved editing.

## Save the report

When you're satisfied with the narrative, you save the report just like any other report. If you close and reopen the report that Copilot generated in the Power BI service, the report opens in Reading view and you don't see Copilot.

- Select **Edit** to see the **Copilot** button again.

## Considerations and limitations

We're continuously working to improve the quality of the report pages, including visuals, summaries, and synonyms generated by Copilot. Here are the current limitations. 

- Copilot will store the selected prompt with report metadata (e.g., summarize sales data) so that the summary can be generated each time a report is loaded.
- Authors: To author a copilot narratives visual in the Power BI service, the workspace needs to have a paid dedicated capacity. The workspace needs to be a paid Premium or F64 or higher.
- You can't edit the visual after Power BI generates it. However, you can change it by using prompts. The summary only takes into account the data that's visualized on the selected page.
- The summary only takes into account the data that's visualized on the page.
- The accuracy of the public preview may be limited.
- Users need to refresh the summary visual when they update or filter a page, report, or data, to see an updated summary.
- Filtering and slicing affect the visual, but cross-highlighting (selecting visuals) doesn't impact the summary.
- Report creation with Copilot is only enabled for Power BI and not for any other sections of Fabric, such as Data Factory.
- The public preview narrative doesn't yet support all visual types.  For example, it doesn't yet support key influencers.

## Related content

- [Overview of Copilot for Power BI](copilot-introduction.md)
