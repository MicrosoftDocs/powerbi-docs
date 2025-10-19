---
title: Create reports in the Power BI service with Copilot
description: Using Copilot, you can quickly create a Power BI report.
author: bezulau
ms.author: juliacawthra
ms.reviewer: guptamaya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 10/17/2025
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
#customer intent: As a report creator, I want to learn how to use Copilot in the Power BI service to create a Power BI report quickly.
---

# Create and edit reports in the Power BI service with Copilot

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

When you use Copilot for Power BI, you can quickly create and edit report pages using natural language prompts. Copilot can save you hours of effort building and refining your report pages. 

You can also [create reports with Copilot in Power BI Desktop](copilot-create-desktop-report.md).

:::image type="content" source="media/copilot-create-report/copilot-create-page-update.png" alt-text="Screenshot showing Copilot creating travel analysis." lightbox="media/copilot-create-report/copilot-create-page-update.png":::

## Before you start

Read about all the ways Copilot can help you in the [overview of Copilot for Power BI](copilot-introduction.md) for more guidance before you start.

- You need to select a compatible workspace that you have write access to. It needs to be a workspace that's assigned to a Copilot-enabled capacity, in other words, a paid Fabric capacity or a Power BI Premium capacity (P1 or higher).

[!INCLUDE [copilot-notes](../includes/copilot-notes.md)]

## Use Copilot in the Power BI service for the first time

To use Copilot in the Power BI service, you need to ensure that reports are located in a workspace in the right capacity. The workspace must be in either [Premium Power BI (P1 and above)](../enterprise/service-premium-features.md) or paid [Fabric](/fabric/enterprise/licenses) capacity.

> [!NOTE]
> For a refresher on workspace access and permissions, see [Roles in workspaces in Power BI](/power-bi/collaborate-share/service-roles-new-workspaces).

Check your license type in the **Workspace settings**.

1. Select **More** to navigate to the **Workspace settings**.

    :::image type="content" source="media/copilot-enable-power-bi/workspace-settings.png" alt-text="Screenshot of the more menu a workspace in the Power BI service with a red box around workspace settings." lightbox="media/copilot-enable-power-bi/workspace-settings.png":::

1. Apply either **Premium capacity** or **Fabric capacity** to the workspace and use the **X** to exit workspace settings.

    :::image type="content" source="media/copilot-enable-power-bi/workspace-settings-license.png" alt-text="Screenshot of the Premium section of the workspace settings, with arrows pointing to Premium capacity and Fabric capacity." lightbox="media/copilot-enable-power-bi/workspace-settings-license.png":::

    You can see which license mode is applied to your workspace under Premium. If License modes are grayed out, this workspace doesn't have access to the appropriate capacity.

1. Now you're ready to create a report with Copilot in the Power BI service.

## Get started using Copilot

To see the **Copilot** button in your report, you first need to select a semantic model.

1. If this is your first time using Copilot in the Power BI service, see [Use Fabric Copilot for Power BI in the service the first time](copilot-enable-power-bi.md#use-copilot-for-power-bi-in-the-service).

1. Select the Data hub, then select **More options (...)** for the dataset you want to explore > **Create report**.
1. In the ribbon, select the **Copilot** icon.

    > [!TIP]
    > If you don't see **Copilot**, your [admins may not have enabled it in Microsoft Fabric](/fabric/get-started/copilot-fabric-overview), or you may not have selected a semantic model. Select a semantic model to see it.

1. In the Copilot pane, you can either select **Suggest content for this report** to have Copilot evaluate your data and makes suggestions, or enter a prompt directly to describe the report or visuals you want Copilot to create.

    :::image type="content" source="media/copilot-create-report/copilot-create-start.png" alt-text="Screenshot showing Copilot pane.":::

1. Copilot generates a report page based on your request.
    
    :::image type="content" source="media/copilot-create-report/copilot-create-page-step2.png" alt-text="Screenshot showing Copilot pane.":::

1. You can further edit the report by prompting Copilot to add, delete, or change visuals.

    :::image type="content" source="media/copilot-create-report/copilot-create-page-step3.png" alt-text="Screenshot showing Copilot pane.":::

1. If you need help with writing prompts, see [Write Copilot prompts that produce results in Power BI](copilot-prompts-report-pages.md) for guidance.

## Improved report creation and edits

With updates to report creation in the Power BI service, you can now work with Copilot to both create and edit report pages. These improvements provide more control, flexibility, and visual intelligence when building reports.

### Smarter report creation

Copilot now delivers more accurate and relevant visuals, automatically selecting the best way to represent your data. It also supports a wider range of visual types, helping you present insights in the format that best fits your needs.

### Flexible editing with Copilot

In addition to creating new pages, you can now:

- **Add visuals** to existing report pages.  
- **Change visuals** by selecting new visual types or adjusting the fields used.  
- **Delete visuals** that are no longer needed.  
- **Use undo and redo** to easily reverse recent Copilot actions.

## Save the report

When you're satisfied with the report, you save the report just like any other report. If you close and reopen the report that Copilot generated in the Power BI service, the report is in Reading view and you don't see Copilot.

- Select **Edit** to see the **Copilot** button again. 

## Considerations and limitations

There are limitations related to creating pages in specific semantic model scenarios.

- **Q&A feature switch**: The Q&A feature switch for your model must be turned on to use Copilot for report creation and editing.
- **Real-Time Streaming Models**: Report pages can't be created by Copilot for semantic models utilizing real-time streaming.
- **Live Connection to Analysis Services**: Semantic models connected live to Analysis Services aren't supported by page creation.
- **Semantic models with implicit measures disabled**: In scenarios where implicit measures are disabled in your semantic model, Copilot cannot create report pages.
- **Custom visuals**: Custom visuals aren't currently supported.
- **Styling changes**: Styling or formatting changes aren't supported through Copilot.
- **Complex visuals**: Changing complex visuals may result in some loss of detail or formatting.
  
## Next steps

- [Overview of Copilot for Power BI](copilot-introduction.md)
- [Create reports in Power BI Desktop with Copilot](copilot-create-desktop-report.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)
- [Privacy, security, and responsible use for Copilot for Fabric and Power BI](/fabric/get-started/copilot-power-bi-privacy-security)
- [Update your data model to work well with Copilot](copilot-evaluate-data.md)
