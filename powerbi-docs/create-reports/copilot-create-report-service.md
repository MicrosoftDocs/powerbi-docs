---
title: Create reports in the Power BI service with Copilot
description: Using Copilot, you can quickly create a Power BI report.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: guptamaya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/10/2024
LocalizationGroup: Create reports
no-loc: [Copilot]
#customer intent: As a report creator, I want to learn how to use Copilot in the Power BI service to create a Power BI report quickly.
---

# Create reports in the Power BI service with Copilot

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

When you use Copilot for Power BI, you can quickly create report pages with just a few clicks. Copilot can save you hours of effort building your report pages. You can also [create reports with Copilot in Power BI Desktop](copilot-create-desktop-report.md).

:::image type="content" source="media/copilot-create-report/copilot-create-internet-sales-trends.png" alt-text="Screenshot showing Copilot creating internet sales trend report page." lightbox="media/copilot-create-report/copilot-create-internet-sales-trends.png":::

## Before you start

Read about all the ways Copilot can help you in the [overview of Copilot for Power BI](copilot-introduction.md) for more guidance before you start.

- You need to select a compatible workspace that you have write access to. It needs to be a workspace that's assigned to a Copilot-enabled capacity, in other words, a paid Fabric capacity (F64 or higher) or a Power BI Premium capacity (P1 or higher).

    Learn more about [Copilot for Power BI capacity requirements](copilot-introduction.md#access-copilot-in-the-power-bi-service).

[!INCLUDE [copilot-notes](../includes/copilot-notes.md)]

## Use Copilot in the Power BI service for the first time

To use Copilot in the Power BI service, you need to ensure that reports are located in a workspace in the right capacity. The workspace must be in either [Premium Power BI (P1 and above)](../enterprise/service-premium-features.md) or paid [Fabric (F64 and above)](/fabric/enterprise/licenses) capacity.

> [!NOTE]
> For a refresher on workspace access and permissions, see [Roles in workspaces in Power BI](/power-bi/collaborate-share/service-roles-new-workspaces).

Check your license type in the **Workspace settings**.

1. Select **More** to navigate to the **Workspace settings**.

    :::image type="content" source="media/copilot-enable-power-bi/workspace-settings.png" alt-text="Screenshot of the more menu a workspace in the Power BI service with a red box around workspace settings." lightbox="media/copilot-enable-power-bi/workspace-settings.png":::

1. Apply either **Premium capacity** or **Fabric capacity** to the workspace and use the **X** to exit workspace settings.

    :::image type="content" source="media/copilot-enable-power-bi/workspace-settings-license.png" alt-text="Screenshot of the Premium section of the workspace settings, with arrows pointing to Premium capacity and Fabric capacity." lightbox="media/copilot-enable-power-bi/workspace-settings-license.png":::

    You can see which license mode is applied to your workspace under Premium. If License modes are grayed out, this workspace doesn't have access to the appropriate capacity.

1. Now you're ready to create a report with Copilot in the Power BI service.

## Get started

To see the **Copilot** button in your report, you first need to select a semantic model.

1. If this is your first time using Copilot in the Power BI service, see [Use Fabric Copilot for Power BI in the service the first time](copilot-enable-power-bi.md#use-copilot-for-power-bi-in-the-service).

1. Select the Data hub, then select **More options (...)** for the dataset you want to explore > **Create report**.

1. In the ribbon, select the **Copilot** icon.

    > [!TIP]
    > If you don't see **Copilot**, your [admins may not have enabled it in Microsoft Fabric](/fabric/get-started/copilot-fabric-overview), or you may not have selected a semantic model. Select a semantic model to see it.

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

## Create a narrative summary

You can also use Copilot for Power BI to create a narrative summary with just a few clicks. This narrative can summarize the entire report, specific pages, or even specific visuals. See [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md) to learn how.

## Undo a page  

After Copilot generates the page, then you can review it. You have the option to start over by selecting the **Undo** button.  If you select the **Undo** button, Copilot starts over. The content on the page is removed and you start over with topic selection by either generating new topics or selecting the one from the top, when you first started.

## Save the report

When you're satisfied with the report, you save the report just like any other report. If you close and reopen the report that Copilot generated in the Power BI service, the report is in Reading view and you don't see Copilot.

- Select **Edit** to see the **Copilot** button again. 

## Considerations and limitations

There are limitations related to creating pages in specific semantic model scenarios.

- **Real-Time Streaming Models**: Report pages can't be created by Copilot for semantic models utilizing real-time streaming.
- **Live Connection to Analysis Services**: Semantic models connected live to Analysis Services aren't supported by page creation.
  
## Next steps

- [Overview of Copilot for Power BI](copilot-introduction.md)
- [Create reports in Power BI Desktop with Copilot](copilot-create-desktop-report.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)
- [Privacy, security, and responsible use for Copilot for Fabric and Power BI](/fabric/get-started/copilot-power-bi-privacy-security)
- [Update your data model to work well with Copilot](copilot-evaluate-data.md)
