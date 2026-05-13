---
title: Enable Fabric Copilot for Power BI
description: Learn how to enable Fabric Copilot for Power BI in your tenant. Follow step-by-step instructions to configure admin settings and start using Copilot in Power BI service and Desktop.
author: julcsc
ms.author: juliacawthra
ms.reviewer: shlindsay
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 02/18/2026
ai-usage: ai-assisted
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
ms.update-cycle: 180-days
#customer intent: As a Power BI user, I want to learn how to enable Fabric Copilot for Power BI to use Copilot in the service and desktop.
---

# Enable Fabric Copilot for Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Learn how to enable Fabric Copilot for Power BI in your organizational tenant. This article explains how to enable Copilot in your tenant, start using Copilot in the Power BI service, and start using Copilot in Power BI Desktop—helping your organization take advantage of AI-powered features.

For more information on other Fabric workloads, see the [Copilot in Fabric overview](/fabric/get-started/copilot-fabric-overview). You must have Fabric admin privileges to enable Copilot.

## Enable Fabric Copilot for Power BI in your tenant

Copilot for Microsoft Fabric is now enabled by default in the Fabric Admin portal. Admins can disable Copilot if their organization isn't ready to use it.

There are four main settings related to Copilot that admins need to be aware of:

- [Enable Copilot setting](#enable-copilot-setting)
- [Enable sharing data across geographic boundaries](#enable-sharing-data-across-geographic-boundaries)
- [Enable the standalone Power BI Copilot experience (preview)](#enable-the-standalone-power-bi-copilot-experience-preview)
- [Enable Copilot at the capacity level](#enable-copilot-at-the-capacity-level)

If the admins disabled Copilot, see the following instructions to turn Copilot on.

## Enable Copilot setting

Within the Fabric Admin portal, the **Copilot and Azure OpenAI Service** settings control whether Copilot is enabled for your organization and who can access it. When you enable Copilot in Fabric, users can access Copilot across workloads. This access means Copilot isn't limited to a specific workload, like Power BI.

To open the Fabric Admin portal:

1. Go to [https://app.fabric.microsoft.com/admin-portal](https://app.fabric.microsoft.com/admin-portal), or
1. In Power BI service, select the **Settings** gear icon in the upper right, and then select **Admin portal**.

:::image type="content" source="media/copilot-enable-power-bi/copilot-settings-admin-portal.png" lightbox="media/copilot-enable-power-bi/copilot-settings-admin-portal.png" alt-text="Screenshot of Copilot settings in the Fabric Admin portal.":::

To enable Copilot in Fabric, follow these steps:

1. From the Admin portal for Fabric, select **Tenant settings**.
1. Within the **Users can use Copilot and other features powered by Azure OpenAI** setting, toggle the **Enabled** switch on. This setting is off by default.
1. Specify who can access Copilot in Fabric in the **Applies to** section.
1. Select **Apply** to save your changes.

## Enable sharing data across geographic boundaries

Enabling this setting only applies if Azure OpenAI isn't available in your geographic region.

- If Azure OpenAI isn't available in your geographic region, you need to adjust one more setting. This adjustment means that your data might be handled outside of your area.
- If you're okay with your data being handled outside of your area, switch on the setting **Data sent to Azure OpenAI can be processed outside your capacity's geographic region, compliance boundary, or national cloud instance**, and select **Apply**.

:::image type="content" source="media/copilot-enable-power-bi/copilot-geographic-settings.png" lightbox="media/copilot-enable-power-bi/copilot-geographic-settings.png" alt-text="Screenshot of the Copilot setting in the Fabric admin portal that asks admins to enable if OpenAI isn't available in the capacity's home region.":::

> [!IMPORTANT]
> If you enable Copilot in Fabric, users can access Copilot across workloads. Copilot access isn't limited to a specific workload, like Power BI.

## Enable Copilot at the capacity level

In the tenant admin portal, admins can delegate the enablement of AI and Copilot features to capacity administrators.  **This AI and Copilot setting is automatically delegated to capacity administrators;  tenant administrators can't turn off the delegation.**

:::image type="content" source="media/copilot-enable-power-bi/capacity-delegation-toggle.png" alt-text="Screenshot of the Copilot setting in the Fabric admin portal that asks admins to enable delegation to capacity admins." lightbox="media/copilot-enable-power-bi/capacity-delegation-toggle.png":::

The cross-geo setting stays disabled and doesn't autodelegate to capacity administrators. Capacity administrators see the **Copilot and Azure OpenAI Service (preview)** settings under **Capacity settings** > **Fabric capacity** > **Capacity name** > **Delegated tenant settings**. By default, the capacity setting inherits tenant-level settings. Capacity administrators can decide whether to override the tenant administrator’s selection. This means that even if Copilot isn't enabled on a tenant level, a capacity administrator can choose to enable Copilot for their capacity. With this level of control, it's easier to control which Fabric workspaces can use AI features like Copilot in Microsoft Fabric.

:::image type="content" source="media/copilot-enable-power-bi/capacity-delegation-capacity-settings.png" alt-text="Screenshot of the Copilot setting in the Fabric admin portal that lets admins set cross-geo and delegated cross-geo." lightbox="media/copilot-enable-power-bi/capacity-delegation-capacity-settings.png":::

Capacity admins can find delegated settings under **Capacity settings.**

:::image type="content" source="media/copilot-enable-power-bi/capacity-delegation-delegated-settings.png" alt-text="Screenshot of the Copilot setting in the Fabric admin portal that lets capacity admins set Copilot." lightbox="media/copilot-enable-power-bi/capacity-delegation-delegated-settings.png":::

## Enable the standalone Power BI Copilot experience (preview)

When you enable this setting, users can access the standalone, cross-item Power BI Copilot experience.

:::image type="content" source="media/copilot-enable-power-bi/enable-copilot-standalone-copilot-setting.png" alt-text="Screenshot of the standalone Power BI Copilot setting in the Fabric Admin portal." lightbox="media/copilot-enable-power-bi/enable-copilot-standalone-copilot-setting.png":::

> [!IMPORTANT]
>
> - **Standalone Copilot is enabled by default:** As of September 2025, this setting (and therefore the Standalone Copilot experience) is enabled by default for all tenants where Copilot is already turned on. To opt out of the default activation for your tenant and hide the Copilot icon from the left navigation bar, an admin can turn this setting off manually.
> - **Copilot must be enabled at the tenant level:** *"Users can use Copilot and other features powered by Azure OpenAI"* must be enabled at the **tenant level** to use the standalone Copilot experience. It's not sufficient to enable it at the capacity level (that is, if it's been delegated).
> - **Not all regions are supported:** The standalone Copilot experience is only available to customers with home tenants in geos that support Fabric—so it's only available for customers with home tenants in [this list](/fabric/admin/region-availability#all-workloads).

## Only show approved items in the standalone Copilot in Power BI experience (preview)

When you enable this setting, it limits the standalone Power BI Copilot experience to only [searching](/power-bi/create-reports/copilot-search-new-content) for content that you mark as **Approved for Copilot**.

:::image type="content" source="media/copilot-enable-power-bi/admin-setting-only-show-approved-items.png" alt-text="Screenshot of the tenant setting to limit the standalone Power BI Copilot to items approved for Copilot.":::

> [!IMPORTANT]
> Workspace admins use this setting to decide when workspaces have enough high-value content for Copilot to search.

## Use Copilot for Power BI in the service

To use Copilot in the Power BI service, ensure that reports are in a workspace with the right capacity. The workspace must be in either [Premium Power BI (P1 and above)](../enterprise/service-premium-features.md) or paid [Fabric (F2 and above)](/fabric/enterprise/licenses) capacity. Alternatively, you can use a [Fabric Copilot capacity](/fabric/enterprise/fabric-copilot-capacity).

> [!NOTE]
> For a refresher on workspace access and permissions, see [Roles in workspaces in Power BI](/power-bi/collaborate-share/service-roles-new-workspaces).

Check your license type in the **Workspace settings**.

1. Select **More** to go to the **Workspace settings**.

    :::image type="content" source="media/copilot-enable-power-bi/workspace-settings.png" alt-text="Screenshot of the more menu a workspace in the Power BI service with a red box around workspace settings.":::

1. Apply either **Premium capacity** or **Fabric capacity** to the workspace and use the x to exit workspace settings.

    :::image type="content" source="media/copilot-enable-power-bi/workspace-settings-license.png" alt-text="Screenshot of the Premium section of the workspace settings, with arrows pointing to Premium capacity and Fabric capacity.":::

    You can see which workspace type is applied to your workspace under **Premium**. If workspace types are grayed out, this workspace doesn't have access to the appropriate capacity.

When you use the standalone Copilot experience and don't have access to a [Fabric Copilot capacity](/fabric/enterprise/fabric-copilot-capacity), select a workspace that has the required capacity for Copilot.

:::image type="content" source="media/copilot-enable-power-bi/enable-copilot-select-workspace.png" alt-text="Screenshot showing the option to select a workspace for enabling Copilot in Power BI." lightbox="media/copilot-enable-power-bi/enable-copilot-select-workspace.png":::

Selecting the **Select a workspace** button lists workspaces you have access to that can use Copilot. After you select a workspace, Power BI checks if Copilot is enabled. If it is, Power BI uses that workspace for monitoring usage.

:::image type="content" source="media/copilot-enable-power-bi/enable-copilot-workspace-picker.png" alt-text="Screenshot of the workspace picker for enabling Copilot in Power BI." lightbox="media/copilot-enable-power-bi/enable-copilot-workspace-picker.png":::

## Use Copilot in Power BI Desktop

To use Copilot in Power BI Desktop, if you don't have access to a [Fabric Copilot capacity](/fabric/enterprise/fabric-copilot-capacity), you need admin, member, or contributor access to at least one workspace that is assigned to a paid Fabric capacity (F2 or higher) or Power BI Premium capacity (P1 or higher) that has Copilot enabled.

When you use Copilot in Power BI Desktop for the first time, you're asked to pick a Copilot-compatible workspace. You can change the associated workspace at any time through the **Settings** gear in Power BI Desktop.

For detailed setup instructions, screenshots, and troubleshooting tips, see [Use Copilot in Power BI Desktop](copilot-power-bi-desktop.md).

## Fabric Copilot capacity

Instead of using a specific workspace capacity, you can use a [Fabric Copilot capacity](/fabric/enterprise/fabric-copilot-capacity). By using Fabric Copilot capacity, users can charge Copilot usage from Power BI Desktop, Pro, and Premium per-user workspaces to a single capacity. Learn more about setting up a [Fabric Copilot capacity](/fabric/enterprise/fabric-copilot-capacity).

When you assign a user to a Fabric Copilot capacity, they don't need to take any other steps to use any of the Copilot experiences.

## Licensing requirements

To use Copilot for Power BI, you must have access to a Premium Power BI capacity or paid Fabric capacity. Your capacity (either Premium or Fabric) needs to be in one of the regions listed in this article, [Fabric region availability](/fabric/admin/region-availability).

> [!NOTE]
> Copilot in Microsoft Fabric isn't supported on trial stock-keeping units (SKUs) or trial capacities. Only paid SKUs are supported.

## Considerations and limitations

- The standalone Copilot experience is only available to customers with home tenants in geos that support Fabric. It's available for customers with home tenants in [this list](/fabric/admin/region-availability#all-workloads). To use Copilot, customers don't need to have Fabric enabled, they just need to have home tenants in one of the listed regions.
- Copilot isn't currently supported for Private Link or closed network environments.

## Send feedback

We always welcome your feedback about our products. Especially during public preview, your feedback helps us improve the product faster.

## Related content

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
