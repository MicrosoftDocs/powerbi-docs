---
title: "Power BI implementation planning: Auditing of information protection and data loss prevention for Power BI"
description: "Learn about auditing for information protection and data loss prevention for Power BI."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 09/15/2022
---

# Power BI implementation planning: Auditing of information protection and data loss prevention for Power BI

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article describes the type of auditing you can do after implementing information protection and data loss prevention (DLP). It's targeted at:

- **Power BI administrators:** The administrators who are responsible for overseeing Power BI in the organization. Power BI administrators need to collaborate with information security and other relevant teams.
- **Center of Excellence, IT, and BI teams:** Others who are responsible for overseeing Power BI in the organization. They might need to collaborate with Power BI administrators, information security teams, and other relevant teams.

It's important to understand how [information protection and data loss prevention](powerbi-implementation-planning-info-protection-data-loss-prevention-overview.md) is used in your organization. You can achieve that by performing auditing, which can:

- Track usage patterns, activities, and adoption
- Support governance and security requirements
- Find non-compliance issues with specific requirements
- Document the current setup
- Identify user education and training opportunities

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering auditing for information protection and DLP, key decisions and actions include:

> [!div class="checklist"]
> - **Decide what's most important to audit:** Consider what's most important from an auditing perspective. Prioritize areas of risk, major inefficiencies, or non-compliance with regulatory requirements. When a situation arises that could be improved, educate users on appropriate ways to do things.
> - **Implement relevant auditing processes:** Put processes in place to extract, integrate, model, and create reports so that auditing can be done.
> - **Take appropriate action:** Using the information obtained from the auditing processes, make sure that someone has the authority and time to take appropriate action. Depending on the situation, it could involve adjusting which sensitivity labels are assigned to content. Other situations might involve user education or training.

The remainder of this article describes useful auditing processes and suggestions.

## Power BI activity log

To help with [information protection](powerbi-implementation-planning-info-protection.md), you can use the Power BI activity log to track [activities related to sensitivity labels](/power-bi/enterprise/service-security-sensitivity-label-audit-schema).

When you've implemented [DLP for Power BI](powerbi-implementation-planning-data-loss-prevention.md), the activity log tracks when there's a DLP rule match.

- **What to look for:** You can determine when specific activities occur, such as:
  - Sensitivity labels were applied, changed, deleted, and by which users
  - Whether labels were applied manually
  - Whether labels were applied automatically (for example, by inheritance or a deployment pipeline)
  - Whether a changed label was upgraded (to a more sensitive label) or downgraded (to a less sensitive label)
  - How frequently DLP events are triggered, where, and by which users
- **Actions to take:** Ensure that data from the activity log data is extracted regularly by an administrator who has permission to extract tenant-level metadata. Determine how to classify activities to support your auditing needs. Some activities might justify review by an administrator or content owner (for example, when a label is deleted). Other activities might justify being included in regular audit reviews (for example, when labels are downgraded, or when DLP rule matches occur).
- **Where to find this data:** Power BI administrators can use the [Power BI activity log](/power-bi/enterprise/service-admin-auditing) to view activities related to Power BI content. Alternatively, in Defender for Cloud Apps, you can grant your Power BI administrators a [limited view](/fabric/governance/service-security-using-defender-for-cloud-apps-controls#power-bi-admin-role-in-defender-for-cloud-apps) so they can see activity log events, sign-in events, and other events related to the Power BI service.

## Power BI protection metrics

The [data protection metrics report](/fabric/governance/use-microsoft-purview-hub) is a dedicated report in the Power BI admin portal. It summarizes how sensitivity labels are assigned to content in your Power BI tenant.

- **What to look for:** You can gain a quick sense for how frequently sensitivity labels are applied to each type of item (for example, semantic model or report) in the Power BI service.
- **Actions to take:** Review this report to become familiar with how much content doesn't have a label applied.
- **Where to find this data:** Power BI administrators can find the data protection metrics report in the Power BI admin portal.

> [!TIP]
> The data protection metrics report is a summary report. You can also use the scanner APIs, which are described in the next section, to perform deeper analysis.

## Power BI scanner APIs

The [Power BI scanner APIs](/fabric/governance/metadata-scanning-overview) allow you to scan the metadata in your Power BI tenant. The metadata of Power BI items, like semantic models and reports, can help you to monitor and review self-service user activity.

For example, you might discover that content in a financial workspace has been assigned to three different sensitivity labels. If any of these labels aren't appropriate for financial data, you can apply more suitable labels.

- **What to look for:** You can create an inventory of Power BI items in your tenant, including the sensitivity label of each item.
- **Actions to take:** Create a process to scan your tenant on a weekly or monthly basis. Use the metadata retrieved by the scanner APIs to understand how Power BI content has been labeled. Investigate further if you find that some labels don't meet expectations for the workspace. Correlate metadata from the scanner APIs with events from the Power BI activity log to determine when a sensitivity label was applied, changed, deleted, and by which user.
- **Where to find this data:** Power BI administrators can use the [Power BI scanner APIs](/fabric/governance/metadata-scanning-overview) to retrieve a snapshot of the sensitivity labels applied to all Power BI content. If you prefer to build your own inventory reports, you can use the APIs directly by writing scripts. Alternatively, you can use the APIs indirectly by [registering Power BI in the Microsoft Purview Data Map](/azure/purview/register-scan-power-bi-tenant) (which uses the Power BI scanner APIs to scan the Power BI tenant).

## Microsoft Purview activity explorer

[Activity explorer](/microsoft-365/compliance/data-classification-activity-explorer) in the Microsoft Purview compliance portal aggregates useful auditing data. This data can help you to understand the activities across applications and services.

> [!TIP]
> Activity explorer exposes only certain types of Power BI events. Plan to use both the Power BI activity log and the activity explorer to see view events.

- **What to look for:** You can use activity explorer to view sensitivity label activity from various applications, including Teams, SharePoint Online, OneDrive, Exchange Online, and Power BI. It's also possible to see when a file was read, where, and by which user. Certain types of DLP policy events are also shown in the activity explorer. When a justification is provided to explain a change of sensitivity label, you can view the reason in activity explorer.
- **Actions to take:** Regularly review [activity explorer events](/microsoft-365/compliance/data-classification-activity-explorer-available-events) to identify whether there are areas of concern or events that warrant further investigation. Some events might justify review by an administrator or content owner (for example, when a label is removed). Other events might justify being included in regular audit reviews (for example, when labels are downgraded).
- **Where to find this data:** Microsoft 365 administrators can use [activity explorer](/microsoft-365/compliance/data-classification-activity-explorer) in the Microsoft Purview compliance portal to view all sensitivity label activities.

## Microsoft Purview content explorer

[Content explorer](/microsoft-365/compliance/data-classification-content-explorer) in the Microsoft Purview compliance portal provides a snapshot of where sensitive information is located across a broad spectrum of applications and services.

> [!TIP]
> It's not possible to see Power BI Desktop (.pbix) files in content explorer. However, you can use content explorer to see certain types of supported files that were exported from the Power BI service, such as Excel files.

- **What to look for:** You can use content explorer to determine what sensitive data is found in various locations such as Teams, SharePoint Online, OneDrive, and Exchange Online.
- **Actions to take:** Review content explorer when you need to gain an understanding of what content exists and where it resides. Use this information to assess the decisions you've made, and whether other actions should be taken.
- **Where to find this data:** Microsoft 365 administrators can use [content explorer](/microsoft-365/compliance/data-classification-content-explorer) in the Microsoft Purview compliance portal to locate where sensitive data currently resides.

## Related content

For more considerations, actions, decision-making criteria, and recommendations to help you with Power BI implementation decisions, see the Power BI implementation planning [subject areas](powerbi-implementation-planning-introduction.md#subject-areas).
