---
title: Create and Edit Power BI Reports with Copilot
description: "Learn how to use Copilot in Power BI to quickly create and edit reports with natural language prompts. Save hours building report pages with AI assistance."
author: julcsc
ms.author: juliacawthra
ms.reviewer: bczulauf
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 11/13/2025
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
#customer intent: As a report creator, I want to learn how to use Copilot in Power BI to create and edit Power BI reports quickly.
---

# Create and edit Power BI reports with Copilot

Copilot in Power BI enables you to quickly create and edit report pages using natural language prompts. This AI-powered tool can save you hours of effort when building and refining Power BI reports, helping you generate professional visualizations without manual configuration.

:::image type="content" source="media/copilot-create-desktop-report/copilot-create-sales-performance-desktop.png" alt-text="Screenshot of Copilot pane in Power BI creating a sales performance report page with multiple visualizations." lightbox="media/copilot-create-desktop-report/copilot-create-sales-performance-desktop.png":::

## Get started using Copilot

If this is your first time using Copilot in Power BI, see [Overview of Copilot for Power BI](copilot-introduction.md).

1. Make sure you have a report selected.
1. If you are in the Power BI service, select the **Edit** button to enter Edit view.
1. In the ribbon, select the **Copilot** icon.

    > [!TIP]
    > If you don't see **Copilot**, it's possible your admins haven't enabled it in Microsoft Fabric, or you might not have selected a semantic model. Select a semantic model to see it.

1. In the Copilot pane, you can either select **Suggest content for this report** to have Copilot evaluate your data and makes suggestions, or enter a prompt directly to describe the report or visuals you want Copilot to create.

   :::image type="content" source="media/copilot-create-report/copilot-create-start.png" alt-text="Screenshot of the Copilot pane in Power BI with prompt input field and suggest content button.":::

1. Copilot generates a report page based on your request.

   :::image type="content" source="media/copilot-create-report/copilot-create-new-page.png" alt-text="Screenshot of Copilot pane displaying a generated Power BI report page with visualizations.":::

1. You can further edit the report by prompting Copilot to add, delete, or change visuals.

   :::image type="content" source="media/copilot-create-report/copilot-create-page-edits.png" alt-text="Screenshot of Copilot pane in Power BI showing options to add, change, or delete report visuals.":::

1. If you need help with writing prompts, see [Write Copilot prompts that produce results in Power BI](copilot-prompts-report-pages.md) for guidance.

## Create and edit reports

With updates to report creation in Power BI, you can now work with Copilot to both create and edit report pages. These improvements provide more control, flexibility, and visual intelligence when building reports.

- **Smarter report creation**: Copilot now delivers more accurate and relevant visuals, automatically selecting the best way to represent your data. It also supports a wider range of visual types, helping you present insights in the format that best fits your needs.
- **Flexible editing**: In addition to creating new pages, you can now:
  - **Add visuals** to existing report pages.
  - **Change visuals** by selecting new visual types or adjusting the fields used.
  - **Delete visuals** that are no longer needed.
  - **Use undo and redo** to easily reverse recent Copilot actions.

## Create a narrative summary

You can also use Copilot for Power BI to create a narrative summary with just a few clicks. This narrative can summarize the entire report, specific pages, or even specific visuals. The summary can help you plan what visualizations you want to include in your report. See [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md) to learn how.

## Save the report

If you are in the Power BI service, when you're satisfied with the report, you save the report just like any other report. If you close and reopen the report that Copilot generated in the Power BI service, the report is in Reading view and you don't see Copilot.

- Select **Edit** to see the Copilot button again.

## Considerations and limitations

There are limitations related to creating pages in specific semantic model scenarios.

- **Q&A feature switch**: The Q&A feature switch for your model must be turned on to use Copilot for report creation and editing.
- **Real-time streaming models**: Copilot can't create report pages for semantic models utilizing real-time streaming.
- **Live connection to Analysis Services**: Page creation doesn't support semantic models connected live to Analysis Services.
- **Semantic models with implicit measures disabled**: In scenarios where implicit measures are disabled in your semantic model, Copilot can't create report pages.
- **Custom visuals**: Custom visuals aren't currently supported.
- **Styling changes**: Styling or formatting changes aren't supported through Copilot.
- **Complex visuals**: Changing complex visuals might result in some loss of detail or formatting.

## Related content

- [Overview of Copilot for Power BI](copilot-introduction.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)
- [Privacy, security, and responsible use for Copilot for Fabric and Power BI](/fabric/get-started/copilot-power-bi-privacy-security)
- [Update your data model to work well with Copilot](copilot-evaluate-data.md)
