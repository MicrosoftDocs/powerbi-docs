---
title: Use Copilot in Power BI Desktop
description: Fabric Copilot in Power BI Desktop helps you create reports faster and easier.
author: julcsc
ms.author: juliacawthra
ms.reviewer: shlindsay
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 01/12/2026
ai-usage: ai-assisted
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
#customer intent: As a Power BI user, I want to learn how to enable Fabric Copilot for Power BI to use Copilot in the service and desktop.
---

# Use Copilot in Power BI Desktop

To use Copilot in Power BI Desktop, you need admin, member, or contributor access to at least one workspace that's assigned to a paid Fabric capacity (F2 or higher) or Power BI Premium capacity (P1 or higher) that has Copilot enabled. For information about enabling Copilot for your organization, see [Enable Fabric Copilot for Power BI](copilot-enable-power-bi.md). 

> [!IMPORTANT]
> In addition to capacity-level enablement, Copilot in **Power BI Desktop** also requires that the **tenant-level Fabric Copilot setting is enabled**. If the tenant-level setting is off, the Copilot button appears in the ribbon but remains disabled.
> This behavior differs from **Power BI Service**, which checks Copilot availability at the **workspace level**.

## Start Copilot in Power BI Desktop for the first time

To use Copilot in Power BI Desktop, you need admin, member, or contributor access to at least a single workspace that is assigned to a paid Fabric capacity or Power BI Premium capacity (P1 or higher) that has Copilot enabled.

> [!NOTE]
> The Copilot button in Desktop always appears in the ribbon. To use Copilot, you must be signed in and have access to a workspace that is in Premium or Fabric capacity.

When you use Copilot in Power BI Desktop for the first time, you're asked to pick a Copilot compatible workspace when you select the Copilot button in the ribbon. The workspace you select doesn't need to be the same as the workspace where you plan to publish your report.

1. Open a Power BI report and select **Copilot** in the ribbon. The Copilot pane appears and prompts you to select a **workspace**.

    :::image type="content" source="media/copilot-enable-power-bi/copilot-button-ribbon.png" alt-text="Screenshot of the Copilot pane in Power BI desktop." lightbox="media/copilot-enable-power-bi/copilot-button-ribbon.png":::

1. Select the **workspace** you'd like to associate this report with for Copilot use. Only workspaces that support Copilot appear.

    :::image type="content" source="media/copilot-enable-power-bi/copilot-workspace-selection.png" alt-text="Screenshot of the workspace picker in Power BI desktop that appears to enable you to select a Copilot supported workspace.":::

    Use the **Settings** gear in the bottom-right corner of Power BI to switch the associated workspace or check which workspace your report is associated with.

    :::image type="content" source="media/copilot-enable-power-bi/report-settings-gear.png" alt-text="Screenshot of the workspace settings in Power BI desktop.":::

    This opens the **Options** window, where you can navigate to the **Copilot (preview)** settings to see which workspace you're currently working with and select a new workspace.

    :::image type="content" source="media/copilot-enable-power-bi/copilot-settings.png" alt-text="Screenshot of the Power BI desktop options window, Copilot settings." lightbox="media/copilot-enable-power-bi/copilot-settings.png":::

    If you don't have access to any workspaces that are in the correct capacity to use Copilot, you see the following message in the **Copilot (preview)** settings: *Either none of your workspaces have the right capacity to use Copilot, or you don't have the right permission to use them.*

    :::image type="content" source="media/copilot-enable-power-bi/copilot-settings-error.png" alt-text="Screenshot of the Copilot settings with the error message." lightbox="media/copilot-enable-power-bi/copilot-settings-error.png":::

1. Now you're ready to [create a report with Copilot in Power BI](copilot-create-reports.md).

## Limitations

- Copilot doesn't support workspaces backed by [Power BI Premium Per User (PPU)](/fabric/enterprise/powerbi/service-premium-per-user-faq).
- Power BI Desktop versions dated January 2025 and earlier don't support the report view Copilot pane. Update to the latest version to access this feature.

## Send feedback

We always welcome your feedback about our products. Especially during public preview, your feedback helps us improve the product faster.

## Related content

- [Enable Fabric Copilot for Power BI](copilot-enable-power-bi.md)
- [Update your data model to work well with Copilot](copilot-evaluate-data.md)
- [Create a report with Copilot in Power BI](copilot-create-reports.md)
- [Write Copilot prompts for creating report pages in Power BI](copilot-prompts-report-pages.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)
- [Write Copilot prompts for creating narrative visuals in Power BI](copilot-prompts-narratives.md)
- [Overview of Copilot for Fabric (preview)](/fabric/get-started/copilot-fabric-overview)
- [Frequently asked questions about Copilot for Power BI and Fabric](/fabric/get-started/copilot-faq-fabric)
- [Privacy, security, and responsible use for Copilot](/fabric/get-started/copilot-privacy-security) article in the Fabric documentation 
- [Copilot tenant settings (preview)](/fabric/admin/service-admin-portal-copilot) article in the Fabric documentation 
- [Enhance Q&A with Copilot for Power BI](../natural-language/q-and-a-copilot-enhancements.md)
