---
title: Create report pages with Copilot for the Power BI service
description: Using Copilot, you can quickly create a Power BI report.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: guptamaya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 11/09/2023
LocalizationGroup: Create reports
---

# Create report pages with Copilot for the Power BI service

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Before your business can start using Copilot capabilities in Power BI, you need to enable Copilot in Microsoft Fabric.

> [!NOTE]
>
> - Your F64 or P1 capacity needs to be in one of the regions listed in this article, [Fabric region availability](../admin/region-availability.md). If it isn't, you can't use Copilot.
> - Your administrator needs to enable the tenant switch before you start using Copilot. See the article [Copilot tenant settings](../admin/service-admin-portal-copilot.md) for details.
> - If your tenant or capacity is outside the US or France, Copilot is disabled by default unless your Fabric tenant admin enables the [Data sent to Azure OpenAI can be processed outside your tenant's geographic region, compliance boundary, or national cloud instance](../admin/service-admin-portal-copilot.md) tenant setting in the Fabric Admin portal.
> - Copilot in Microsoft Fabric isn't supported on trial SKUs. Only paid SKUs (F64 or higher, or P1 or higher) are supported.

When you use Copilot for Power BI, you can quickly create report pages with just a few clicks. Copilot can save you hours of effort building your report pages.

:::image type="content" source="media/copilot-create-report/copilot-create-internet-sales-trends.png" alt-text="Screenshot showing Copilot creating internet sales trend report page." lightbox="media/copilot-create-report/copilot-create-internet-sales-trends.png":::

## Before you start

You may need to do some clean-up work on your dataset. Read the article [Update your data model to work well with Copilot](copilot-evaluate-data.md) to see if you need to modify your semantic model so that Copilot will get insights from it.

## Get started

To see the **Copilot** button in your report, you first need to select a semantic model.

1. Select the Data hub, then select **More options (...)** for the dataset you want to explore > **Create report**.

1. In the ribbon, select the **Copilot** icon.

    > [!TIP]
    > If you don't see **Copilot**, your admins may not have enabled it, or you may not have selected a semantic model. Select a semantic model to see it.

1. In the Copilot pane, select **Suggest content for this report**. Copilot evaluates the data and makes suggestions.

    :::image type="content" source="media/copilot-create-report/copilot-suggest-content-this-report.png" alt-text="Screenshot showing Copilot pane, suggest content.":::

    Copilot suggests possible pages for your report.

    :::image type="content" source="media/copilot-create-report/copilot-suggest-content-outline.png" alt-text="Screenshot showing Copilot suggesting pages.":::

1. Select **Create** next to the first page you want Copilot to create.

    :::image type="content" source="media/copilot-create-report/copilot-create-page.png" alt-text="Screenshot showing selecting the Create page button.":::

    Copilot creates that page. 

    :::image type="content" source="media/copilot-create-report/copilot-create-sales-comparison-page-2.png" alt-text="Screenshot of Copilot creating the Sales Comparison page." lightbox="media/copilot-create-report/copilot-create-sales-comparison-page-2.png":::

    Continue creating the pages that Copilot suggests. Otherwise select **Create a report that shows** and provide guidance on what you want in the report.

1. If you need help with writing prompts that get you the report page you want, see [Write Copilot prompts that produce results in Power BI](copilot-prompts-report-pages.md) for guidance.

## Create a summary

You can also use Copilot for Power BI to create a narrative summary with just a few clicks. This narrative can summarize the entire report, specific pages, or even specific visuals. See [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md) to learn how.

## Undo a page  

After Copilot has generated the report, then you can review the page. You have the option to start over by selecting the **Undo** button.  After you select the **Undo** button, Copilot starts over. The content on the page is removed and you start over with topic selection by either generating new topics or selecting the one from the top, when you first started.

## Save the report

When you're satisfied with the report, you save the report just like any other report. If you close and reopen the report that Copilot generated in the Power BI service, the report is in Reading view and you don't see Copilot.

- Select **Edit** to see the **Copilot** button again. 

## Considerations and limitations

We're continuously working to improve the quality of the report pages, including visuals and summaries generated by Copilot. Here are the current limitations. 

- You can't tell it which kind of visual to create.
- Copilot can't modify the visuals after it has generated them.
- Copilot can't add filters or set slicers if you specify them in the prompts. For example, if you say: "Create a sales report for the last 30 days." Copilot can't interpret 30 days as a date filter.
- Copilot can't make layout changes. For example, if you tell Copilot to resize the visuals, or to align all the visuals perfectly, it won't work.
- Copilot can't understand complex intent. For example, suppose you frame a prompt like: "Generate a report to show incidents by team, incident type, owner of the incident, and do this for only 30 days." This prompt is complex, and Copilot will probably generate irrelevant visuals.
- Copilot doesn't produce a message for the skills that it doesn't support. For example, if you ask Copilot to edit or add a slicer, it won't complete the instruction successfully as mentioned above. Unfortunately, it will *not* give an error message either. 

## Next steps

- [Overview of Copilot for Power BI](copilot-introduction.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)