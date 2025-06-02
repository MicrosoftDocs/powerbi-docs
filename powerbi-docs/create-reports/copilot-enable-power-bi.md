---
title: Enable Fabric Copilot for Power BI
description: Enable Fabric Copilot for Power BI in your organizational tenant.
author: shannonlindsay
ms.author: shlindsay
ms.reviewer: juliacawthra
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/07/2025
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
#customer intent: As a Power BI user, I want to learn how to enable Fabric Copilot for Power BI to use Copilot in the service and desktop.
---

# Enable Fabric Copilot for Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This article is for organizations who would like to enable and start using Copilot in Microsoft Fabric, specifically in Power BI. We present how to enable Copilot in your tenant, start using Copilot in the Power BI service, and start using Copilot in Power BI Desktop.

For more information on other Fabric workloads, see the [Copilot in Fabric overview](/fabric/get-started/copilot-fabric-overview). Note, you must have Fabric admin privileges to enable Copilot.

## Enable Fabric Copilot for Power BI in your tenant

Copilot for Microsoft Fabric is now enabled by default in the Fabric Admin portal. Admins can disable Copilot if your organization isn't ready to use it.

There are three main settings related to Copilot that admins need to be aware of:

- [Enable Copilot setting](#enable-copilot-setting)
- [Enable sharing data across geographic boundaries](#enable-sharing-data-across-geographic-boundaries)
- [Enable the standalone Power BI Copilot experience (preview)](#enable-the-standalone-power-bi-copilot-experience-preview)

If the admins disabled Copilot, see the following instructions to turn Copilot on.

## Enable Copilot setting

Within the Fabric Admin portal, the **Copilot and Azure OpenAI Service** settings control whether Copilot is enabled for your organization and who can access it. Enabling Copilot in Fabric means that users can access Copilot across workloads. This means Copilot access isn't limited to a specific workload, like Power BI.

:::image type="content" source="media/copilot-enable-power-bi/copilot-settings-admin-portal.png" lightbox="media/copilot-enable-power-bi/copilot-settings-admin-portal.png" alt-text="Screenshot of Copilot settings in the Fabric Admin portal.":::

To enable Copilot in Fabric, follow these steps:

1. From the Admin portal for Fabric, select **Tenant settings**.
1. Within the **Users can use Copilot and other features powered by Azure OpenAI** setting, toggle the **Enabled** switch on. This setting is off by default.
1. Specify who can access Copilot in Fabric in the **Applies to** section.
1. Select **Apply** to save your changes.

## Enable sharing data across geographic boundaries

Enabling this setting only applies if Azure OpenAI isn't available in your geographic region.

- If Azure OpenAI isn't available in your geographic region, you need to adjust one more setting. This means that your data might be handled outside of your area.
- If you're okay with your data being handled outside of your area, switch on the setting **Data sent to Azure OpenAI can be processed outside your capacity's geographic region, compliance boundary, or national cloud instance**, and select **Apply**.

:::image type="content" source="media/copilot-enable-power-bi/copilot-geographic-settings.png" alt-text="Screenshot of the Copilot setting in the Fabric admin portal that asks admins to enable if OpenAI isn't available in the capacity's home region." lightbox="media/copilot-enable-power-bi/copilot-geographic-settings.png":::

> [!IMPORTANT]
> If you have Fabric enabled, enabling Copilot in Fabric means that users can access Copilot across workloads. Copilot access isn't limited to a specific workload, like Power BI.

## Enable the standalone Power BI Copilot experience (preview)

Enabling this setting allows users to access the standalone, cross-item Power BI Copilot experience.

:::image type="content" source="media/copilot-enable-power-bi/enable-copilot-standalone-copilot-setting.png" alt-text="Screenshot of the standalone Power BI Copilot setting in the Fabric Admin portal." lightbox="media/copilot-enable-power-bi/enable-copilot-standalone-copilot-setting.png":::

> [!IMPORTANT]
> The **Users can use Copilot and other features powered by Azure OpenAI** setting must be enabled at the tenant level to use the standalone Copilot experience. It's not sufficient to enable it at the capacity level (that is, if it's been delegated).

## Use Copilot for Power BI in the service

To use Copilot in the Power BI service, you need to ensure that reports are located in a workspace in the right capacity. The workspace must be in either [Premium Power BI (P1 and above)](../enterprise/service-premium-features.md) or paid [Fabric (F2 and above)](/fabric/enterprise/licenses) capacity. Alternatively, you could use a [Fabric Copilot capacity](/fabric/enterprise/fabric-copilot-capacity).

> [!NOTE]
> For a refresher on workspace access and permissions, see [Roles in workspaces in Power BI](/power-bi/collaborate-share/service-roles-new-workspaces).

Check your license type in the **Workspace settings**.

1. Select **More** to navigate to the **Workspace settings**.

    :::image type="content" source="media/copilot-enable-power-bi/workspace-settings.png" alt-text="Screenshot of the more menu a workspace in the Power BI service with a red box around workspace settings.":::

1. Apply either **Premium capacity** or **Fabric capacity** to the workspace and use the x to exit workspace settings.

    :::image type="content" source="media/copilot-enable-power-bi/workspace-settings-license.png" alt-text="Screenshot of the Premium section of the workspace settings, with arrows pointing to Premium capacity and Fabric capacity.":::

    You can see which license mode is applied to your workspace under **Premium**. If license modes are grayed out, this workspace doesn't have access to the appropriate capacity.

When you're using the standalone Copilot experience and don't have access to a Fabric Copilot capacity, you need to select a workspace that has the required capacity for Copilot.

:::image type="content" source="media/copilot-enable-power-bi/enable-copilot-select-workspace.png" alt-text="Screenshot showing the option to select a workspace for enabling Copilot in Power BI." lightbox="media/copilot-enable-power-bi/enable-copilot-select-workspace.png":::

Selecting the **Select a workspace** button lists workspaces you have access to that are capable of using Copilot. Once you select a workspace, we check if Copilot is enabled, and if so, use that workspace for monitoring usage.

:::image type="content" source="media/copilot-enable-power-bi/enable-copilot-workspace-picker.png" alt-text="Screenshot of the workspace picker for enabling Copilot in Power BI." lightbox="media/copilot-enable-power-bi/enable-copilot-workspace-picker.png":::

## Use Copilot in Power BI Desktop

To use Copilot in Power BI Desktop, if you don't have access to a Fabric Copilot capacity, you need admin, member, or contributor access to at least a single workspace that is assigned to a paid Fabric capacity (F2 or higher) or Power BI Premium capacity (P1 or higher) that has Copilot enabled.

> [!NOTE]
> The Copilot button always appears in the ribbon in Power BI Desktop. To be able to use Copilot, you must be signed in and have access to a workspace that is in Premium or Fabric capacity.

When you use Copilot in Power BI Desktop for the first time, you're asked to pick a Copilot compatible workspace when you select the Copilot button in the ribbon. The workspace you select doesn't need to be the same as the workspace where you plan to publish your report.

1. Open a Power BI report and select **Copilot** in the ribbon. The Copilot pane appears and prompts you to select a **workspace**.

    :::image type="content" source="media/copilot-enable-power-bi/copilot-button-ribbon.png" alt-text="Screenshot of the Copilot pane in Power BI desktop.":::

2. Select the **workspace** you'd like to associate this report with for Copilot use. Only workspaces that support Copilot appear.

    :::image type="content" source="media/copilot-enable-power-bi/copilot-workspace-selection.png" alt-text="Screenshot of the workspace picker in Power BI desktop that will appear to enable you to select a Copilot supported workspace.":::

    Use the **Settings** gear in the bottom right corner of Power BI to switch the associated workspace or check which workspace your report is associated with.

    :::image type="content" source="media/copilot-enable-power-bi/report-settings-gear.png" alt-text="Screenshot of the workspace settings in Power BI desktop.":::

    This opens the **Options** window, where you can navigate to the **Copilot (preview)** settings to see which workspace you're currently working with and select a new workspace.

    :::image type="content" source="media/copilot-enable-power-bi/copilot-settings.png" alt-text="Screenshot of the Power BI desktop options window, Copilot settings.":::

    If you don't have access to any workspaces that are in the correct capacity to use Copilot, you see the following message in the **Copilot (preview)** settings: *Either none of your workspaces have the right capacity to use Copilot, or you don't have the right permission to use them.*

    :::image type="content" source="media/copilot-enable-power-bi/copilot-settings-error.png" alt-text="Screenshot of the Copilot settings with the error message: Either none of your workspaces have the right capacity to use Copilot, or you don't have the right permission to use them.":::

## Fabric Copilot capacity

As an alternative to using a specific workspace capacity, you can use a [Fabric Copilot capacity](/fabric/enterprise/fabric-copilot-capacity). Fabric Copilot capacity enables users to charge Copilot usage from Power BI Desktop, Pro, and Premium per-user workspaces to a single capacity. Learn more about setting up a Fabric Copilot capacity.

Once a user is assigned to a Fabric Copilot capacity, no other steps are required to use any of the Copilot experiences.

## Licensing requirements

To use Copilot for Power BI, you must have access to a Premium Power BI capacity or paid Fabric capacity. Your capacity (either Premium or Fabric) needs to be in one of the regions listed in this article, [Fabric region availability](/fabric/admin/region-availability).

> [!NOTE]
> Copilot in Microsoft Fabric isn't supported on trial stock-keeping units (SKUs). Only paid SKUs are supported.

## Considerations and limitations

The standalone Copilot experience isn't yet available in the following regions: Spain Central, Qatar, India-West, and Mexico.

## Send feedback

We always welcome your feedback about our products. Especially during public preview, your feedback helps us improve the product faster.

## Related content

- [Update your data model to work well with Copilot](copilot-evaluate-data.md)
- [Create a report with Copilot in the Power BI service](copilot-create-report-service.md)
- [Create a report with Copilot in Power BI Desktop](copilot-create-desktop-report.md)
- [Write Copilot prompts for creating report pages in Power BI](copilot-prompts-report-pages.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)
- [Write Copilot prompts for creating narrative visuals in Power BI](copilot-prompts-narratives.md)
- [Overview of Copilot for Fabric (preview)](/fabric/get-started/copilot-fabric-overview)
- [Frequently asked questions about Copilot for Power BI and Fabric](/fabric/get-started/copilot-faq-fabric)
- [Privacy, security, and responsible use for Copilot](/fabric/get-started/copilot-privacy-security) article in the Fabric documentation
- [Copilot tenant settings (preview)](/fabric/admin/service-admin-portal-copilot) article in the Fabric documentation
- [Enhance Q&A with Copilot for Power BI](../natural-language/q-and-a-copilot-enhancements.md)