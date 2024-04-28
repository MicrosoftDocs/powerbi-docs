---
title: "Power BI implementation planning: Tenant-level monitoring"
description: "Learn about tenant-level monitoring planning for Power BI."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 04/25/2023
---

# Power BI implementation planning: Tenant-level monitoring

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This tenant-level monitoring article is primarily targeted at:

- **Power BI administrators:** The administrators who are responsible for overseeing Power BI in the organization. Power BI administrators might need to collaborate with IT, information security, internal audit, and other relevant teams.
- **Center of Excellence, IT, and BI team:** The teams that are also responsible for overseeing Power BI. They might need to collaborate with Power BI administrators, information security, and other relevant teams.

The terms _auditing_ and _monitoring_ are closely related.

- **Auditing:** Actions you take to understand a system, its user activities, and related processes. Auditing activities can be manual, automated, or a combination of both. An auditing process might focus on one specific aspect (for example, auditing security for a workspace), or it can refer to an end-to-end auditing solution. An auditing solution consists of extracting, storing, and transforming data so that it can be analyzed and acted upon.
- **Monitoring:** Ongoing activities that inform you about what's occurring. Monitoring usually involves alerting and automation, though sometimes monitoring is done manually. Monitoring can be set up for a process you've selected to audit (for example, notifications that appear when a specific tenant setting changes).

This article describes the different ways you can monitor a Power BI tenant.

> [!NOTE]
> For more information about tracking activities that users perform, see [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md).

## Monitor and protect content

There are several monitoring aspects related to information protection and data loss prevention.

### Information protection for Power BI

Information protection focuses on safeguarding organizational data, reducing the risk of sharing sensitive information, and strengthening compliance status for regulatory requirements. Information protection begins with the use of sensitivity labels.

When you classify and label content, it helps the organization to:

- Understand where sensitive data resides.
- Track external and internal compliance requirements.
- Protect content from unauthorized users.
- Educate users on how to responsibly handle data.
- Implement real-time controls to reduce the risk of data leakage.

> [!TIP]
> For information about implementing sensitivity labels, see [Information protection for Power BI](powerbi-implementation-planning-info-protection-data-loss-prevention-overview.md).

### Data loss prevention for Power BI

Data loss prevention (DLP) refers to activities and practices that safeguard data in the organization. The goal for DLP is to reduce the risk of data leakage, which can happen when unauthorized people share sensitive data. While responsible user behavior is a critical part of safeguarding data, DLP usually refers to policies that are automated.

DLP allows you to:

- Detect and inform administrators when risky, inadvertent, or inappropriate sharing of sensitive data occurs. Specifically, it allows them to:
  - Improve the overall security setup of your Power BI tenant, with automation and information.
  - Enable analytical use cases that involve sensitive data.
  - Provide auditing information to security administrators.
- Provide users with contextual notifications. Specifically, it supports them to:
  - Make the right decisions during their normal workflow.
  - Adhere to your [data classification and protection policy](powerbi-implementation-planning-info-protection.md#data-classification-and-protection-policy), without negatively affecting their productivity.

> [!TIP]
> For information about implementing DLP, see [Data loss prevention for Power BI](powerbi-implementation-planning-data-loss-prevention.md).

## Monitor security and threats

There are several monitoring aspects related to security and threats.

### Defender for Cloud Apps for Power BI

[Microsoft Defender for Cloud Apps](https://powerbi.microsoft.com/blog/get-up-to-speed-with-power-bi-and-microsoft-cloud-app-security/) is a cloud access security broker (CASB) that allows administrators to:

- Monitor and raise alerts based on specific activities.
- Create DLP policies.
- Detect unusual behaviors and risky sessions.
- Limit activities performed by applications (with [Microsoft Entra Conditional Access app control](/cloud-app-security/proxy-intro-aad)).

Some powerful [Power BI monitoring and protection](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/protect-your-power-bi-instance-using-microsoft-cloud-app/ba-p/2166872) capabilities are available with Defender for Cloud Apps. For example, you can:

- Prohibit all—or certain users—from downloading a file from the Power BI service when a specific sensitivity label is assigned.
- Receive an alert when an administrative activity is detected, such as when a tenant setting is updated in the Power BI service.
- Detect when suspicious or unusual behaviors occur, such as large file downloads or an unusual number of sharing operations in the Power BI service.
- Search the activity log for specific activities relating to content with a specific sensitivity label, such as data exports from the Power BI service.
- Receive notifications as risky sessions occur, such as when the same user account connects from different geographical areas in a short time period.
- Determine when someone outside of a predefined security group views specific content in the Power BI service.

For more information, see [Defender for Cloud Apps for Power BI](powerbi-implementation-planning-defender-for-cloud-apps.md).

### Microsoft Sentinel

[Microsoft Sentinel](/azure/sentinel/overview) is a security information and event management (SIEM) service. It's an Azure service that allows you to:

- Collect logs and security data for users, devices, applications, and infrastructure. You can capture logs and user activities from the Power BI service and many other areas across the enterprise.
- Detect potential threats. You can create rules and alerts to refine what's important to track. Automated threat intelligence exists as well, which can help reduce the manual effort.
- Analyze data and investigate the scope and root cause of incidents. You can use built-in visualization tools or Kusto Query Language (KQL) queries. You can also use Power BI to visualize and analyze the data that you collect.
- Respond to security incidents and threats. You can handle responses directly. Or, you can automate responses and remediations by using playbooks, which are workflows based on Azure Logic Apps.

Microsoft Sentinel stores its data in Azure Log Analytics (a component of Azure Monitor). It's based on the same architecture as the [semantic model event logs](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md#semantic-model-event-logs), which capture user-generated and system-generated activities that occur for a semantic model—[previously known as a dataset](../connect-data/service-datasets-rename.md).

You can use Microsoft Sentinel with Power BI in two different ways.

- **Use the Power BI data connector in Sentinel:** A subset of the attributes from the Power BI audit logs are streamed into Azure Log Analytics (Azure Monitor). It's one way to obtain audit logs for tracking user activities in your Power BI environment. For more information, see [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md).
- **Use Power BI as an analytical tool:** Power BI connects to the data that Microsoft Sentinel (and, accordingly, Azure Monitor and Azure Log Analytics) collects from a wide variety of data connectors. You can then use standard Power BI functionality to model, analyze, and visualize data. For more information, see [Create a Power BI report from Microsoft Sentinel data](/azure/sentinel/powerbi).

> [!IMPORTANT]
> Microsoft Sentinel, Azure Monitor, Azure Log Analytics, and Defender for Cloud Apps are separate services. They have their own pricing models and security models, which are separate from Power BI. Power BI administrators don't automatically have access to these services. We recommend that you work with your infrastructure team to plan which services are best to use.

For more information about the different options for capturing user activities, see [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md).

## Monitor Power BI service health

There are several ways to obtain information about service health, incidents, and issues.

> [!TIP]
> Before you submit a Power BI support request to Microsoft, we recommend that you first check with the resources listed in this section.

### Power BI support site

When there's an apparent service outage or degradation, Power BI administrators and users should refer to the [Power BI support](https://support.powerbi.com/) site. It's a publicly available site that displays information about high-priority issues concerning Power BI. This site shows:

- The status for the Power BI service.
- Service level outages or degradation notifications.
- Informational messages for broad awareness.

:::image type="content" source="media/powerbi-implementation-planning-auditing-monitoring-tenant-level-monitoring/power-bi-support-service-status.png" alt-text="Screenshot of the Power BI support service status page." border="false":::

> [!NOTE]
> Microsoft typically communicates issues related to the [national/regional clouds](/azure/active-directory/develop/authentication-national-cloud#Overview) in the Microsoft 365 admin center rather than the Power BI support site. If you work with national/regional clouds, work with your Microsoft 365 administrator to monitor Power BI issues.

For more information about Power BI support, see [How to contact support](/power-bi/support/service-support-options).

For more information about how to support users in your organization, see [User support](fabric-adoption-roadmap-user-support.md).

### Power BI email notifications

You can receive alert notifications by email to inform you when there's a service outage, interruption, or degradation occurring in your Power BI tenant. These notifications are available only for Premium workspaces.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

To set up email alerts, enable the _Receive email notifications for service outages or incidents_ [tenant setting](/fabric/admin/service-admin-portal-help-support#receive-email-notifications-for-service-outages-or-incidents). Because its purpose is to send email, you must assign a mail-enabled security group to this setting. We recommend that you use a group name like _Power BI System Support_. You should add your Power BI administrators, key personnel from your [Center of Excellence](fabric-adoption-roadmap-center-of-excellence.md) (COE), and your [help desk](fabric-adoption-roadmap-user-support.md#help-desk-support) that handles user support to this group.

> [!TIP]
> When you need to notify your internal users, we recommend that your COE sends a customized message that uses non-technical language. That way, the message can include additional context, and use the preferred communication platform, like a Teams channel.

For more information, see [Enable service interruption notifications](/power-bi/support/service-interruption-notifications).

### Power BI known issues

Power BI administrators and users can also monitor the [Power BI known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues) page. This page includes information about currently active known issues and recently closed known issues.

Known issues can include software bugs that have been reported to Microsoft support by other customers. An issue might also include functionality that's by design, but because Microsoft Support has received a significant number of tickets, an explanation is warranted.

### Microsoft 365 admin center

The [Microsoft 365 admin center](https://admin.microsoft.com/) displays service health information, incident summaries, and advisory messages for Microsoft 365 services. Also, [service incidents](/power-platform/admin/policies-communications#service-incidents) and certain types of major updates for the Power BI service are posted in the Microsoft 365 admin center.

> [!TIP]
> Access to M365 is available to administrators who have sufficient [permissions](/microsoft-365/admin/add-users/about-admin-roles?view=o365-worldwide&preserve-view=true#commonly-used-microsoft-365-admin-center-roles). Power BI administrators have a limited view to the M365 service health and the M365 message center.

There are two types of message.

- **Advisory message:** An issue is affecting only some customers. The service is available, however the issue could be intermittent or limited in scope and user impact.
- **Active incident:** An issue is presently causing the service, or a major function, to be unavailable or severely degraded for multiple customers.

#### Microsoft 365 Service health

The [Microsoft 365 service health](https://admin.microsoft.com/adminportal/home#/servicehealth) page shows notifications about advisories and incidents. It also has information about active incidents, including:

- Description
- User impact
- Status
- Duration (if closed) or estimated time to resolve (if open)
- Next status update (if open)
- Root cause (if closed)

The issue history page shows incidents and advisories that were resolved in the past 30 days.

#### Microsoft 365 message center

The [Microsoft 365 message center](https://admin.microsoft.com/adminportal/home#/messagecenter) publishes planned changes to Microsoft 365 services, allowing administrators to prepare in advance. For active incidents, each message links to more details in the Microsoft 365 service health page, as [previously described](#microsoft-365-service-health).

Sometimes, a message is based on telemetry gathered by Microsoft. For example, Microsoft's telemetry knows which type of browser users are using to connect to the Power BI service. If Internet Explorer use is detected, you might receive a message reminding you that Power BI no longer supports that browser.

:::image type="content" source="media/powerbi-implementation-planning-auditing-monitoring-tenant-level-monitoring/m365-message-center-reminder.png" alt-text="Screenshot of a Microsoft 365 message center notification that explains that Internet Explorer is no longer supported by Power BI." border="false":::

### Power BI issues site

You can check the publicly available [Power BI issues](https://community.powerbi.com/t5/Issues/idb-p/issues) site. It's a place for users to publicly report issues they've encountered.

## Monitor updates and fixes

By managing how Power BI Desktop is installed on user machines, you can control when updates and fixes are installed. However, you can't control when changes to the Power BI service are released in your tenant.

We recommend that you closely monitor releases for the Power BI service and Power BI Desktop. Monitoring releases ensures that you can be prepared, test key feature changes, and announce important changes to your users.

### Updates

The Power BI service is a cloud service that's updated continually and frequently. Power BI Desktop, which must be installed on a Windows machine, is usually updated monthly (except for fixes, which are described next). Microsoft posts release announcements on the [Power BI blog](https://powerbi.microsoft.com/blog/).

For information about version numbers and links to more information for the current release, see [What's new in Power BI](/power-bi/fundamentals/desktop-latest-update).

For information about previous releases, see [Power BI updates archive](/power-bi/fundamentals/desktop-latest-update-archive).

### QFE releases

Depending on the severity, Microsoft might do a quick-fix engineering (QFE) release, which is commonly known as a _bug fix_ or _hotfix_. QFE releases occur when Power BI Desktop updates are made outside of the normal monthly release cadence.

For history of previous QFE releases, see [Change log for Power BI Desktop](/power-bi/fundamentals/desktop-change-log).

## Monitor Power BI announcements

To effectively support Power BI in your organization, you should continually watch for announcements and new features.

### Power BI release plan

You can find the public roadmap for future features including estimated dates in the [release plan](https://powerbi.microsoft.com/roadmap/).

Sometimes a change that's coming is so important that you'll want to plan for it in advance. The planning cycle is divided into two semesters each year: April through September, and October through March.

### Power BI blog

Subscribe to the [Power BI blog](https://powerbi.microsoft.com/blog/) to follow posts about important public announcements and new releases. Some blog posts also provide information about upcoming features that can help you to plan ahead.

> [!TIP]
> It's particularly important to read the monthly blog post announcement. It includes a summary of new features and planned changes to the Power BI service, Power BI Desktop, and the Power BI mobile apps.

### Power BI ideas

Consider routinely monitoring the [Power BI ideas site](https://ideas.powerbi.com/). This site informs you about top ideas that other customers have requested. You can also influence the future direction of Power BI by submitting new ideas and voting for posted ideas that you want to support.

## Monitor related Azure services

The [Azure status](https://azure.status.microsoft/) page shows the status for Azure services. There are many Azure services that might potentially integrate with your Power BI tenant.

Common Azure services that integrate with Power BI include:

- **Microsoft Entra ID:** Your [Power BI tenant](powerbi-implementation-planning-tenant-setup.md) relies on Microsoft Entra ID ([previously known as Azure Active Directory](/azure/active-directory/fundamentals/new-name)) for identity and access management.
- **Azure Power BI Embedded:** Azure Power BI Embedded supports programmatic [embedding](/power-bi/developer/embedded/embedded-analytics-power-bi) of Power BI content in apps for your customers. Power BI Embedded is also applicable for customers who have enabled [autoscale](/power-bi/enterprise/service-premium-auto-scale) for their Power BI Premium capacity. For more information about when to use Power BI Embedded, see the [embed for your customers](powerbi-implementation-planning-usage-scenario-embed-for-your-customers.md) usage scenario.
- **Azure storage accounts:** Azure Data Lake Storage Gen2 (ADLS Gen2) can be used for workspace-level [data storage](/power-bi/admin/service-admin-portal-azure-connections), including dataflows storage and semantic model backups. For more information about dataflow storage, see the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) usage scenario.
- **Azure Log Analytics:** You can enable [workspace auditing](/power-bi/transform-model/log-analytics/desktop-log-analytics-overview) to capture semantic model event logs. For more information, see [Data-level auditing](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md).
- **Azure Files:** When the [large semantic model](/power-bi/enterprise/service-premium-large-models) format is enabled for a workspace, the data is stored in Azure Files.
- **Data sources:** It's likely that you have many types of [data sources](/power-bi/connect-data/power-bi-data-sources) that Power BI connects to. Data sources could be Azure Analysis Services, Azure SQL Database, Azure Synapse Analytics, Azure storage, and others.
- **Virtual machines:** A [data gateway](/power-bi/connect-data/service-gateway-onprem) for Power BI could run on a virtual machine (VM) in Azure. Or, a database containing data that's used as a data source for Power BI might run on a VM in Azure.
- **Virtual network data gateway:** A [virtual network (VNet) data gateway](/data-integration/vnet/overview) could be implemented to securely access data sources in a private network.
- **Azure Key Vault:** One common way to use Azure Key Vault is for customer management of the encryption keys for data at-rest in the Power BI service. For more information, see [bring your own key](/power-bi/enterprise/service-encryption-byok) (BYOK) and [customer-managed keys](/power-bi/enterprise/service-encryption-customer-managed-keys) (CMK).
- **Microsoft Purview:** Used by [Microsoft Purview Information Protection](powerbi-implementation-planning-info-protection-data-loss-prevention-overview.md), or by Microsoft Purview Data Catalog to [scan your Power BI tenant](/azure/purview/register-scan-power-bi-tenant?tabs=Scenario1&preserve-view=true), to extract metadata.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for tenant-level monitoring, key decisions and actions include:

> [!div class="checklist"]
> - **Educate administrators and key personnel:** Make sure that Power BI administrators and key personnel in the COE are aware of the resources available for monitoring service health, updates, and announcements.
> - **Create a monitoring plan:** Determine how, and who will monitor service health, updates, and announcements. Ensure that expectations are clear for how to gather, communicate, plan, and act on the information.
> - **Create a user communication plan:** Clarify which situations warrant communicating to others in the organization. Determine how, and who will be responsible for communicating to users in the organization, and in which circumstances.
> - **Decide who should receive email notifications:** Determine who should receive email notifications from Microsoft when there's a Power BI issue. Update the _Receive email notifications for service outages or incidents_ tenant setting to align with your decision.
> - **Review administrator roles:** Review roles and permissions necessary for viewing service health in the M365 admin center.
> - **Investigate information protection and DLP requirements:** Explore requirements for using sensitivity labels in Microsoft Purview Information Protection to classify data (the first building block of information protection). Consider requirements for implementing DLP for Power BI, and the associated monitoring processes.
> - **Investigate Defender for Cloud Apps capabilities:** Explore requirements for using Microsoft Defender for Cloud Apps to monitor user behavior and activities.

## Related content

For more considerations, actions, decision-making criteria, and recommendations to help you with Power BI implementation decisions, see [Power BI implementation planning](powerbi-implementation-planning-introduction.md#subject-areas).
