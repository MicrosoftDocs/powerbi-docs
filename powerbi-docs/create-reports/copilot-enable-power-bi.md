---
title: Enable Fabric Copilot for Power BI
description: Enable Fabric Copilot for Power BI in your organizational tenant.
author: shannonlindsay
ms.author: shlindsay
ms.reviewer: maggies
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 04/25/2024
LocalizationGroup: Create reports
no-loc: [Copilot]
#customer intent: As a Power BI user, I want to learn how to enable Fabric Copilot for Power BI to use Copilot in the service and desktop.
---

# Enable Fabric Copilot for Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This article is for organizations who would like to enable Copilot in Microsoft Fabric, specifically for use within Power BI. We present how to enable Copilot in your tenant, enable and use Copilot in the Power BI service, and enable and use Copilot in Power BI Desktop.

For more information on other Fabric workloads, see the [Copilot in Fabric overview](/fabric/get-started/copilot-fabric-overview). Note, you must have Fabric admin privileges to enable Copilot.

## Enable Fabric Copilot for Power BI in your tenant

Before your business can start using Copilot for Power BI, you need to enable it in the Microsoft Fabric Admin Portal. There are two main settings related to Copilot that admins need to be aware of

- [Enable Copilot setting](#enable-copilot-setting)
- [Enable sharing data across geographic boundaries](#enable-sharing-data-across-geographic-boundaries)
- [Enable Fabric Copilot for Power BI in the service](#enable-fabric-copilot-for-power-bi-in-the-service)

###	Enable Copilot setting

1. Navigate to the [Tenant settings](/fabric/admin/service-admin-portal-copilot) in the Fabric Admin portal and use the **Search** feature to locate the Copilot settings.

1. **Toggle the switch on** to Enable Copilot in Fabric.

    Enabling Copilot in Fabric means that users can access Copilot across workloads. This means Copilot access isn't limited to a specific workload, like Power BI.

    :::image type="content" source="media/copilot-enable-power-bi/copilot-settings-admin-portal.png" alt-text="Screenshot of Copilot settings in the Fabric Admin portal." lightbox="media/copilot-enable-power-bi/copilot-settings-admin-portal.png":::
 
    1. Use the search bar (or scroll) to find the **Copilot and Azure OpenAI Service (preview)** settings.
    1. Toggle the switch to the on position.
    1. Specify who can access Copilot in Fabric. Select **Apply** to save your changes.

### Enable sharing data across geographic boundaries

Enabling this setting only applies if Azure OpenAI isn't available in your geographic region.

- If Azure OpenAI isn't available in your geographic region, you need to adjust one additional setting. This means that your data may be handled outside of your area.
- If you’re okay with your data being handled outside of your area, switch on the setting **Data sent to Azure OpenAI can be processed outside your capacity's geographic region, compliance boundary, or national cloud instance**, and select **Apply**.

    :::image type="content" source="media/copilot-enable-power-bi/copilot-geographic-settings.png" alt-text="Screenshot of the Copilot setting in the Fabric admin portal that asks admins to enable if OpenAI isn't available in the capacity's home region." lightbox="media/copilot-enable-power-bi/copilot-geographic-settings.png":::

### Enable Fabric Copilot for Power BI in the service

To use Copilot in the Power BI service, you need to ensure that reports are located in a workspace in the right capacity. The workspace must be in either [Premium Power BI (P1 and above)](../enterprise/service-premium-features.md) or paid [Fabric (F64 and above)](/fabric/enterprise/licenses) capacity.

> [!NOTE]
> For a refresher on workspace access and permissions, see [Roles in workspaces in Power BI](/power-bi/collaborate-share/service-roles-new-workspaces).

Check your license type in the **Workspace settings**.

1. Select **More** to navigate to the **Workspace settings**.

    :::image type="content" source="media/copilot-enable-power-bi/workspace-settings.png" alt-text="Screenshot of the more menu a workspace in the Power BI service with a red box around workspace settings." lightbox="media/copilot-enable-power-bi/workspace-settings.png":::

1. Apply either **Premium capacity** or **Fabric capacity** to the workspace and use the x to exit workspace settings.

    :::image type="content" source="media/copilot-enable-power-bi/workspace-settings-license.png" alt-text="Screenshot of the Premium section of the workspace settings, with arrows pointing to Premium capacity and Fabric capacity." lightbox="media/copilot-enable-power-bi/workspace-settings-license.png":::

    You can see which license mode is applied to your workspace under Premium. If License modes are grayed out, this workspace doesn't have access to the appropriate capacity.

## Licensing requirements

To use Copilot for Power BI, you must have access to a Premium Power BI capacity (P1 and above) or paid Fabric capacity (F64 and above). Your capacity (either Premium or Fabric) needs to be in one of the regions listed in this article, [Fabric region availability](/fabric/admin/region-availability).

> [!NOTE]
> Copilot in Microsoft Fabric isn't supported on trial SKUs. Only paid SKUs (F64 or higher, or P1 or higher) are supported.

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
