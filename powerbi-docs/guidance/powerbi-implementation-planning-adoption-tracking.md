---
title: "Power BI implementation planning: Adoption tracking"
description: "This article helps you to plan for tracking adoption of Power BI and Microsoft Fabric."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 05/31/2024
---

# Power BI implementation planning: Adoption tracking

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article helps you to plan how to track adoption of Power BI and Microsoft Fabric. This article is primarily targeted at:

- **BI and analytics directors and managers:** Decision makers who are responsible for overseeing the BI program and strategy. Successful adoption of Fabric and Power BI is essential for these decision makers to make progress towards the BI strategy.
- **Fabric administrators:** The administrators who are responsible for overseeing Fabric in the organization. Fabric administrators use the [admin monitoring workspace](/fabric/admin/monitoring-workspace) and [capacity metrics app](/fabric/enterprise/metrics-app) to aid in adoption tracking and capacity management. Fabric administrators might need to collaborate with other administrators, like those who oversee Microsoft 365.
- **Center of Excellence (COE), IT, and BI teams:** The teams that are responsible for overseeing Power BI in the organization. These teams are responsible for promoting a healthy [data culture](fabric-adoption-roadmap-data-culture.md) and improving [organizational adoption](fabric-adoption-roadmap-maturity-levels.md#organizational-adoption-maturity-levels).
- **Subject matter experts (SMEs), content owners and content creators:** The teams and individuals that champion analytics in a team or department and who create and consume Power BI or Fabric content.

> [!TIP]
> We recommend that you familiarize yourself with the [Microsoft Fabric adoption roadmap](fabric-adoption-roadmap-maturity-levels.md) series before you read this article about adoption tracking. The adoption roadmap introduces concepts that are important to adoption and explains how to define your organization's adoption [maturity levels](fabric-adoption-roadmap-maturity-levels.md). After you've read the adoption roadmap, you can then use this article to plan how you'll track progress towards incrementally improving these maturity levels.

Adoption is essential to achieve successful implementation of Fabric and Power BI. Adoption isn't about whether people are using Fabric and Power BI, but instead whether they're using these tools _effectively_. You can think about adoption as empowering _more people_ to use the _right data and tools_ the _right way_ at the _right time_.

Adoption isn't a state that you achieve. Rather, adoption is a continuous journey where you deliver sustainable and incremental progress in different areas that together empower people to work effectively with data. The result of adoption is that more people realize increased value from their data by using Fabric and Power BI. When empowered in this way, people work to achieve their key results and help the organization to accomplish its strategic business objectives.

To identify whether you're improving adoption, you perform _adoption tracking_. Like adoption itself, adoption tracking isn't only about tracking usage. Rather, adoption tracking consists of the activities and mechanisms that you use to identify and understand how people use data and tools, and whether they're using them effectively. To perform adoption tracking activities, you should identify and understand both negative user behaviors that you want to discourage and positive user behaviors that you want to replicate. You next define ways to reliably measure these behaviors and track them over time. You improve the maturity levels of your data culture and organizational adoption when you experience more positive behaviors and less negative behaviors. As you observe and measure this evolution in user behavior, you're achieving incremental progress toward your adoption goals.

The first part of this article helps you to understand the benefits and approaches to track adoption. The second part then explains how to track adoption of Fabric and Power BI.

> [!IMPORTANT]
> Adoption tracking is essential to enable the success of both [self-service](powerbi-implementation-planning-usage-scenario-customizable-managed-self-service-bi.md) and [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md).

## Understand why adoption tracking is important

Adoption tracking is a fundamental capability to advance [organizational](fabric-adoption-roadmap-maturity-levels.md#organizational-adoption-maturity-levels), [user](fabric-adoption-roadmap-maturity-levels.md#user-adoption-stages), and [solution adoption](fabric-adoption-roadmap-maturity-levels.md#solution-adoption-phases).

- _Organizational adoption_ tracks the state of analytics governance and data management practices.
- _User adoption_ tracks the extent to which content consumers and self-service content creators are actively and effectively using analytics tools such as Fabric.
- _Solution adoption_ tracks the impact of content that's been deployed. It's also concerned with measuring the level of value solutions provide.

By tracking adoption, you can identify strategic areas of improvement that you should prioritize. These priorities inform the work of your Fabric and Power BI teams, other data teams, and the business teams that they support. For this reason, it's important that you perform adoption tracking effectively. Effective adoption tracking means that you:

- Define and maintain a shared understanding for what adoption means in your organization, including the current state of adoption and the desired future state.
- Identify strategic adoption objectives and priorities, which inform the behaviors that you want to promote or encourage (or behaviors that you want to prevent and discourage).
- Define a mechanism to reliably track and measure these important behaviors and their evolution over time.
- Assign ownership of the tracking to an individual or team.
- Act upon what you learn from the tracking to steer improvement over time.

Effective adoption tracking provides both strategic and tactical perspectives of the current state of the organization and its use of data and analytics. As such, adoption tracking is closely tied to both your [strategic](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md) and [tactical planning](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md).

- **Strategic:** Your [strategic focus areas and objectives](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#step-4-decide-on-the-bi-focus-areas-and-objectives) typically define what you want to achieve with your adoption, and which behaviors are important to make progress toward those objectives. What you learn from adoption tracking helps inform long-term strategic decisions.
- **Tactical:** Your [key results](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md#step-2-define-key-results) often require measures that you obtain and monitor by performing adoption tracking. What you learn from adoption tracking helps inform short-term tactical actions to help you achieve your strategic objectives.

> [!TIP]
> Adoption and adoption tracking are important for your BI strategy. For more information about what a BI strategy is, how it relates to your business strategy, and the steps you can take to define a BI strategy, see [BI strategy overview](powerbi-implementation-planning-bi-strategy-overview.md).

### The benefits of adoption tracking

Adoption tracking yields benefits for many different teams in your organization. To summarize, adoption tracking aids in:

- Visibility and understanding of how people in the organization use Fabric and Power BI. This visibility helps you to preemptively mitigate risk and identify opportunities to help people use data and tools more effectively.
- Clarity about which activities should be prioritized to make progress toward your objectives. This prioritization also helps you to plan and allocate resources.
- Measurements that inform feedback loops and demonstrate a return on investment (ROI) in your implemented analytics solutions and initiatives. This return on investment can help you to obtain executive sponsorship and secure more budget for future data and analytics projects.

> [!NOTE]
> To help you understand the importance and benefits of effective adoption tracking, consider the following analogy.
>
> _If your BI strategy is a moving vehicle that your organization drives, then adoption tracking is the windshield of that vehicle._
>
> - A _clean windshield_ is what you get with effective adoption tracking. A clean windshield allows you to see where you are and where you're going. You see through this windshield to understand your motion in relation to what's around you. With a clean windshield, you can avoid obstacles and steer toward opportunities.
> - A _dirty windshield_ is what you get when you neglect or improperly perform adoption tracking. A dirty windshield prevents you from seeing where you are and where you're going, and you're a danger to yourself and to others. With a dirty windshield, you're less likely to safely reach your desired destination.

### Different approaches to perform adoption tracking

Adoption tracking requires that you gather data to measure and track indicators over time by using different solutions. You can perform adoption tracking by using either custom or ready-made solutions, or a combination of the two to meet the needs of your organization.

#### Custom solutions

You can build your own custom solution for adoption tracking. Custom solutions are similar to a [tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md) solution. A custom adoption tracking solution requires the highest effort to create and maintain. That's because you must gather the data and pass it through an end-to-end analytics pipeline before you can effectively use it. However, once completed, a custom solution has the greatest potential to address your specific needs and questions.

> [!IMPORTANT]
> Building a custom adoption tracking solution can involve significant effort because it's an end-to-end BI project. Ensure that you first evaluate the available ready-made solutions before you decide to develop your own solution.

When you build a custom solution, you gather data from various sources such as the following.

- **Audit log:** Provides a detailed view of all of the Microsoft Fabric [user activities](/fabric/admin/operation-list) from the Microsoft 365 admin portal in an [audit log](/purview/audit-log-activities). You can also use the Power BI [activity log](../enterprise/service-admin-auditing.md), which shows only the Power BI activities, and is based on the Power BI REST APIs. For information about how to get access to this activity log, see [Access the Power BI activity log](admin-activity-log.md). You can access the activity log programmatically by using the [ActivityEvents REST API](../enterprise/service-admin-auditing.md#activityevents-rest-api).
- **Gateway logs:** Provide detailed information about data gateway configuration and operations. You can gather the logs from the [on-premises data gateway app](/data-integration/gateway/service-gateway-tshoot#collect-logs-from-the-on-premises-data-gateway-app) for on-premises data gateways, and the [Fabric portal](/data-integration/vnet/data-gateway-download-diagnostics#how-to-download-logs) for virtual network (VNet) data gateways.
- **Azure Log Analytics:** Provides detailed information about telemetry, such as query performance, refresh operations, high levels of activity, or unusual activity. Workspace administrators can work with an Azure administrator to integrate [Azure Log Analytics](../transform-model/log-analytics/desktop-log-analytics-overview.md) with a Fabric workspace to gather this detailed information.
- **REST APIs:** You can gather information by using various Power BI and Fabric REST APIs.
  - **[Power BI REST APIs](/rest/api/power-bi/):** Get information about Power BI items (such as [Dataflow refresh history](/rest/api/power-bi/dataflows/get-dataflow-transactions)), [capacities](/rest/api/power-bi/capacities), [gateways](/rest/api/power-bi/gateways), and more. The [ActivityEvents REST API](../enterprise/service-admin-auditing.md#activityevents-rest-api) is particularly important to get user activities from the activity log. Activities are often an excellent data source to view and measure behaviors in your tenant.
  - **[Fabric REST APIs](/rest/api/fabric/articles/):** Get information about [Fabric items](/rest/api/fabric/articles/item-management/item-management-overview) (such as [Notebooks](/rest/api/fabric/articles/item-management/definitions/notebook-definition)), [domains](/rest/api/fabric/admin/domains), [tenant settings](/rest/api/fabric/admin/tenants/get-tenant-settings), and more.
  - **[Metadata scanning APIs](/fabric/governance/metadata-scanning-overview):** Get detailed information about [workspaces and their items](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#metadata-scanning-apis). There are separate metadata scanning APIs for both [Power BI](/fabric/governance/metadata-scanning-overview) and [Fabric](/fabric/governance/metadata-scanning-overview).
  - **[Microsoft Graph API](/graph/use-the-api):** Get [user and group data](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-and-group-data), such as user attributes and licenses.

> [!NOTE]
> For more detailed guidance about how to gather this type of data for a custom solution, see [data source decisions](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#data-source-decisions) from the [tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md) article.

> [!TIP]
> You can also enrich the [admin monitoring workspace](/fabric/admin/monitoring-workspace) ready-made solution (described in the following section) with this information to extend its usefulness. For example, you can create a composite model by combining the activity information in the admin monitoring workspace shared semantic model with user and group data from Microsoft Graph.

#### Ready-made solutions

You can benefit from ready-made solutions for adoption tracking. These solutions are provided by Microsoft in your Fabric tenant, and you can use them with minimal effort and set up time. However, except for the content in the admin monitoring workspace, you have limited ability to customize and adapt ready-made solutions for your specific needs. For instance, most of these ready-made solutions provide a limited data history, such as the last 30 days.

> [!TIP]
> Except for the capacity metrics app, all ready-made solutions are available for any tenant. The capacity metrics app is available only when your organization uses Fabric capacity.

Here are the ready-made solutions that you can use to support adoption tracking activities.

- **[Monitoring hub](/fabric/admin/monitoring-hub):** Track information about data items that you have access to in your tenant. For example, this ready-made solution is one way to track average (or longest) refresh times, refresh failures, and refresh frequency by data item. You could use the Monitoring hub to identify the longest data item refresh and then work with the owner of that content to optimize and reduce Fabric capacity usage.
- **[Power Platform admin center](https://admin.powerplatform.microsoft.com/ext/DataGateways):** Track information about [on-premises data gateway management](/power-platform/admin/onpremises-data-gateway-management). For example, this ready-made solution is one way to track how many gateways are installed, and who installed them. You could use the Power Platform admin center to identify unauthorized gateways, or gateways without an owner, so that they can be [retired and archived](powerbi-implementation-planning-content-lifecycle-management-retire-archive.md).
- **[Usage metrics reports](../collaborate-share/service-usage-metrics.md):** Track information about report usage and [workspace activities](../collaborate-share/service-modern-usage-metrics.md). For example, this ready-made solution is one way to track how many people are using your report, whether usage is rising or falling, and who the top users are. You could use the usage metrics report to identify whether usage of a critical report is falling so that you can plan [office hours](fabric-adoption-roadmap-mentoring-and-user-enablement.md#office-hours) to support its users and drive better solution adoption.
- **[Capacity metrics app](/fabric/enterprise/metrics-app):** Track information about resource usage in your capacity to optimize and reduce the [Capacity Units (CUs)](/fabric/enterprise/licenses) used by different operations. The capacity metrics app is an essential tool not only to ensure the health of your capacity, but also for adoption tracking. When people use Power BI effectively, they avoid over-utilization of available capacity resources. You could use the capacity metrics app to identify resource-intensive items and operations and then work with the content owners to educate them about how to work toward more efficient solutions.
- **[Admin monitoring workspace](/fabric/admin/monitoring-workspace):** Track detailed information about user activities and inventories of the Fabric and Power BI items in your tenant. The admin monitoring workspace tracks a broader range of metrics and items than other ready-made solutions. Fabric administrators can also share this content with other users who aren't administrators. Furthermore, these administrators can grant [Build permission](../connect-data/service-datasets-build-permissions.md) to the underlying semantic models to allow others users to perform _ad hoc_ analysis and to create new reports or [composite semantic models](../transform-model/desktop-composite-models.md#composite-models-on-power-bi-semantic-models-and-analysis-services) that add new data or calculations.

> [!TIP]
> This article includes the various ready-made solutions for completeness. To benefit most from this article, we recommend that you focus your time and effort on the admin monitoring workspace.

In this article, we focus on how to use the admin monitoring workspace to perform adoption tracking. With the admin monitoring workspace, organizations have a ready-to-use solution that they can also extend with other data. By using the admin monitoring workspace, teams and organizations of any size can immediately begin to conduct adoption tracking.

The following diagram and table provide an overview of the content in the admin monitoring workspace.

:::image type="content" source="media/powerbi-implementation-planning-adoption-tracking/admin-monitoring-workspace-content.svg" alt-text="Diagram shows the content in the admin monitoring workspace, which comprises semantic models and reports. Each report in the diagram is described in the table below." border="false":::

| **Content** | **Description** | **Examples of questions that you can answer with this content** |
|---|---|---|
| **[Feature usage and adoption](/fabric/admin/feature-usage-adoption)** | Provides insight into user activities from the activity log, and an inventory of the items in your tenant. | &bull;&nbsp;How many items are there in a tenant or workspace, and which workspace has the most content? <br/>&bull;&nbsp;How many data versus reporting items are there in a tenant or workspace, or how many items of a specific type (like dataflows)? <br/>&bull;&nbsp;Which user is most frequently exporting reports to Excel? <br/>&bull;&nbsp;Which items (or users) are inactive (they have no activity in the last 30 days)? <br/>&bull;&nbsp;Which items are redundant across or within workspaces? <br/>&bull;&nbsp;To what extent are Fabric items and features being used throughout the organization? Who's using these items, and where do they reside? <br/>&bull;&nbsp;What items do external guest users have access to (from [B2B sharing](../enterprise/service-admin-azure-ad-b2b.md))? |
| **[Preview hub](/fabric/governance/use-microsoft-purview-hub?tabs=admin-view&preserve-view=true)** | Provides insight into content endorsement and sensitivity labels that have been applied. | &bull;&nbsp;How many items are endorsed as Promoted or Certified? <br/>&bull;&nbsp;Which workspaces contain endorsed or labeled content? <br/>&bull;&nbsp;Which sensitivity labels are used for content, and how frequently? |

The following diagram depicts how you can use the admin monitoring workspace to perform adoption tracking.

:::image type="content" source="media/powerbi-implementation-planning-adoption-tracking/admin-monitoring-workspace-flow.svg" alt-text="Diagram shows how to use the admin monitoring. Each step in the process is described in the table below." border="false":::

The diagram depicts the following components and processes.

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | The admin monitoring workspace contains ready-made content available for all tenants to help with tracking and monitoring activities. Fabric administrators have access to this workspace and can grant workspace or item access to other content owners and creators, where necessary. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | The admin monitoring workspace has reports that Fabric administrators and content owners and creators use for adoption tracking. These reports contain ready-made visualizations for overviews, filters, and breakdowns of different areas. The reports also support drillthrough to other pages to reveal details for a particular area-of-interest. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Reports have an underlying semantic model that Fabric administrators can connect to. These semantic models contain ready-made data and calculations. Fabric administrators can grant Build permission to content owners and creators so that they can also create new or custom tracking and monitoring content. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | New reports created from the admin monitoring workspace semantic models are published to other workspaces that contain custom content for adoption tracking. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | Composite semantic models integrate with other data to extend the usefulness of the original semantic models. They can also enrich the data with new calculation logic. The composite semantic models inform deeper, tailored insights into tracking and monitoring. Fabric administrators or content owners and creators can also create and publish new reports from these composite models. |

To summarize, when you use the admin monitoring workspace to perform adoption tracking and monitoring of your tenant, you typically follow a stepwise process.

1. Get an overview of the situation from the reports.
1. Use filters and breakdowns to narrow the focus to important areas.
1. Drillthrough on categories of interest to investigate specific details.
1. Connect to the underlying semantic models to create your own reports.
1. Create composite models to extend the original semantic models with other data or calculation logic to meet your needs.

> [!TIP]
> Consider your use of the admin monitoring workspace content analogous to how a user typically conducts self-service analytics. Use this content to better understand the user experience and flow from the perspective of a self-service user in your organization. In this scenario, _you_ are the self-service user who consumes centralized reports and semantic models distributed by Microsoft.

The following section describes steps that you can take to track adoption in Fabric and Power BI.

## Track adoption of Fabric and Power BI

To successfully track adoption, you first define your long-term objectives and the behaviors that reinforce them. You next identify indicators that can reliably measure these behaviors and can inform your short-term actions and activities. Importantly, you perform this tracking at a consistent cadence, regularly reevaluating your objectives and targets as behaviors change over time.

The following sections elaborate on the steps you take to track adoption of Fabric.

### Step 1: Evaluate maturity to define your adoption objectives

To begin adoption tracking, you should first have clearly defined objectives that you want to achieve. That way, you can track progress towards them. One way to identify your adoption objectives is by performing a [maturity assessment](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#contents-of-an-assessment). In a maturity assessment, you evaluate your organization's current [maturity level](fabric-adoption-roadmap-maturity-levels.md) for different capability areas that are important to adoption (such as [executive sponsorship](fabric-adoption-roadmap-executive-sponsorship.md#maturity-levels) or [change management](fabric-adoption-roadmap-change-management.md#maturity-levels)). Your maturity levels should accurately reflect how the organization uses Fabric and Power BI today. Performing a maturity assessment helps you to identify your objectives and where you'll need to prioritize your efforts to improve adoption.

As you perform your maturity assessment, consider the following points.

- **Define what adoption means for your organization.** Consider how people in the organization should effectively use the data and tools available to them.
- **Define how you'll tie adoption to business metrics.** Consider how improving adoption will advance business strategic interests, and how improving adoption will lead to improvement in business metrics that decision makers use to evaluate progress.
- **Identify the biggest pain points and problems.** Consider which areas are most pressing and where improved adoption could have the biggest positive impact (or conversely, where poor adoption is having the biggest negative impact).

> [!TIP]
> Before you complete your maturity assessment, you can update the maturity level descriptions so that they are directly relevant to your organization. For example, you could include other considerations that are relevant for your success, or update descriptions to use language or terminology that's specific to your organization.
>
> Also, a maturity assessment is something you can do as part of your [strategic planning](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md). However, you don't need to work through a full strategic planning exercise to start adoption tracking. Like adoption itself, we recommend that you focus on how to achieve sustainable, incremental progress.

Based on your current maturity levels, you can identify your strengths and set targets for each area. Targets help you to define your priorities and which objectives you want to focus on within a specific period (such as the next quarter).

The following diagram depicts an example. It shows how you can visualize your adoption maturity levels after you've conducted an initial assessment and then defined your targets. This example depicts an assessment for each of the capability areas of the [Microsoft Fabric adoption roadmap](fabric-adoption-roadmap-change-management.md).

:::image type="content" source="media/powerbi-implementation-planning-adoption-tracking/maturity-assessment-example.svg" alt-text="Diagram shows an example of maturity assessment. It visualizes adoption maturity levels after an initial assessment and defines targets." border="false":::

In this example, the organization has a significant level of decentralized self-service analytics. They have identified many gaps, the largest of which is in their executive sponsorship. For this capability area, they aim for a 500 maturity level, yet they're currently achieving a 200 level. In this case, the organization might choose to prioritize executive sponsorship first.

Evaluating your maturity level and defining your adoption objectives is an iterative process. Ideally, you should repeat an evaluation each period, comparing your reassessment of the maturity levels to your targets (see [Step 6](#step-6-reassess-and-track-progress-over-time)).

### Step 2: Identify which behaviors are important

Once you understand your adoption objectives, you next define which behaviors you want to promote or discourage. These behaviors describe the way that people create, use, or manage content. Behaviors should have a clear link to your objectives. Positive behaviors should advance progress toward your objectives, while negative behaviors slow your progress or negate it.

When you define what behaviors are important to track, consider the following points.

- Describe why desired behaviors are correct or preferred, and how more of this behavior will benefit users and the organization.
- Consider whether some behaviors are standard for the tool or specific to your organizational context. For example, reducing exports to Excel is a commonly desired behavior for analytics tools. However, other organizations might require exports for auditing purposes and might seek to specifically reduce ad hoc exports.
- Survey the organization for individuals or teams that experience significantly more (or less) success with analytics than others. When observing these teams, identify key behaviors that contribute to their successes (or struggles).

> [!NOTE]
> The behaviors that you identify as important will likely be specific to your organization, its objectives, and its pattern for [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) and [content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md). For instance, enterprise teams that distribute reports and semantic models might be more concerned with usage of these centralized items. By contrast, in a self-service environment where users make their own semantic models and reports, Fabric administrators might be more interested in identifying refresh failures and over-sharing of items or item types.

Here are some examples of positive behaviors that you might want to encourage.

- Use of strategically important reports.
- Regular reuse of shared semantic models.
- Separation of development and production workspaces (instead of publishing directly to the workspace from which content is shared with consumers).
- Sharing reports and dashboards from apps instead of workspaces or items.
- Active engagement among a community of practice.
- Use of [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md#analyze-in-excel) or live connected tables in Excel.

Here are some examples of negative behaviors that you might want to discourage.

- Export to Excel from reports.
- Refresh failures of data items.
- Unowned or unused items and workspaces. An unowned item or workspace is also often referred to as _orphaned_, meaning that it's owned by someone who left the organization, such as when a [workspace has no admin](/fabric/admin/service-admin-portal-workspaces#workspace-states).
- Published redundant versions of the same item (duplication).
- Published semantic models that connect to local files.

### Step 3: Define how to measure the behaviors

After you identify the behaviors that are important, you must then define how you'll measure them. This task is an essential step that leads to adoption tracking. Without measurement, you're unable to quantify and track the behaviors to understand their frequency and trend. Understanding trends is especially critical because it allows you to identify improvement over time.

> [!TIP]
> The measures you use in adoption tracking can also be part of the key results that you use in tactical planning. For more information about how to define key results, and how you can effectively measure a target and use indicators, see [BI tactical planning](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md#define-and-measure-success).

> [!NOTE]
> Some behaviors are more difficult to monitor because they occur outside of your tenant. For instance, engagement and activity among a community of practice is important. They stimulate a healthy, self-sustaining data culture. However, gathering information to measure them might be difficult, for example, when individuals meet in person, or use private chats to communicate.
>
> Therefore, try to focus your adoption tracking on behaviors that occur within your tenant. They will be easier to measure with the [ready-made solutions](#ready-made-solutions) that you have available. For other behaviors and activities, consider alternative forms of measurement, like surveys.

Here are some examples of how you might measure the positive behaviors that you want to encourage.

- **Use of strategically important reports:** Use the [usage metrics report](../collaborate-share/service-modern-usage-metrics.md) to identify important reports within a workspace. Alternatively, you can also use the _ViewReport_ activity from the audit log by user and report to track report usage. Observe whether the frequency of their usage is consistent or increasing over time.
- **Regular reuse of shared semantic models:** Use the _Feature usage and adoption_ report to identify the ratio of semantic models to reports. Observe whether there are more reports than semantic models.
- **Separate development and production workspaces:** Use the _Feature usage and adoption_ report to filter to a single report to determine whether it exists in only one workspace. Or, identify workspaces that use proper [naming conventions](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-naming-conventions) to indicate [development, test, and production stages](powerbi-implementation-planning-content-lifecycle-management-develop-manage.md).

Here are some examples of how you might measure the negative behaviors that you want to discourage.

- **Reduction of export to Excel:** Use the _Feature usage and adoption_ report to filter to the _ExportArtifact_ activity. Then determine which users are exporting to Excel the most, and whether it's rising or falling in frequency over time.
- **Oversharing or inappropriate sharing of items:** Use the _Feature usage and adoption_ report to identify the most shared items, or which items external users have access to. Then evaluate whether specific items are being shared too frequently, or whether external users have access to items that they shouldn't.
- **Unowned or unused items:** Use the _Feature usage and adoption_ report to identify low user activity by item. These items can become candidates for retirement and archiving.

Once you can measure the behaviors important for your adoption tracking, you should use these measurements to evaluate and understand the current situation. The outcome of this task establishes a baseline for future improvement. During the initial exploration of the data, you should also critically review each measure to ensure that it reflects the behaviors and processes that you want to improve.

### Step 4: Determine whether you need other data

Depending on the measurements you'll track, you might require [other data](#custom-solutions) in addition to what's available from the content in the admin monitoring workspace. You can use this data to extend the semantic models in the admin monitoring workspace by creating a composite model. After you publish your composite model (to different workspace), you can create new, custom reports that address more questions. You can also enrich the semantic model with [calculations](/dax/dax-overview#calculations).

> [!TIP]
> For more information about other data that you can use to track adoption, see [Custom solutions](#custom-solutions) earlier in this article.

### Step 5: Assign ownership of the adoption tracking

Adoption tracking creates value only when you regularly act on the tracking you're doing. Therefore, you should assign ownership to the specific adoption tracking metric to a team or individual. This team or individual is then responsible for performing the tracking and taking (or motivating) an action based on the learnings from that information.

Consider the following points when you're ready to assign ownership.

- Clearly define the responsibilities of the ownership team or individual by describing what ownership means.
- Define possible actions that owners should take, and when they should take that action.
- Define the time period when the action should be taken (for instance, the following day, week, or month).
- Clarify the desired (or expected) outcome that the action should achieve.
- Plan recurring meetings with these teams and individuals to provide support and ensure accountability.

### Step 6: Reassess and track progress over time

You should perform adoption tracking regularly to identify whether there are measurable changes in the frequency of user behaviors, and to determine whether you're making progress toward your goals. For example, adoption tracking can be a valuable addition to your iterative planning processes, such as [tactical planning](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md). This planning activity is typically where you decide on your short-term priorities and activities. During planning, you should reevaluate your maturity levels for the different capability areas and compare them to the targets that you set in [Step 1](#step-1-evaluate-maturity-to-define-your-adoption-objectives).

> [!IMPORTANT]
> Adoption tracking isn't the result of an irregular or one-off audit of your environment, or how your organization uses Fabric. Instead, you should perform adoption tracking _consistently_. That way, you can identify improvement over time.

Here are some other reasons why you should perform adoption tracking over time.

- Measuring change over time is the best way to identify whether you're experiencing success and making progress toward your adoption objectives. For instance, you might seek to improve content ownership and management by reducing the number of unused or orphaned workspaces and items in a tenant. You'll only know whether you're successful when you continue measuring and observe this number decreasing over time.
- User behaviors will change over time as their business objectives and capabilities evolve. For instance, you might aim to improve system oversight by reducing the frequency of refresh failures of semantic models in a Fabric capacity. Over time, you might observe that more users are making [Direct Lake semantic models](/fabric/get-started/direct-lake-overview), where refresh failures less likely to occur (since data transformation doesn't occur in the semantic model refresh). You might then decide to focus on a different metric like Capacity Unit (CU) usage from each semantic model, instead of (or in addition to) refresh failures.
- You might take different actions as you get closer to your adoption objectives, or you might need to change what you're tracking, or how you track it. For instance, you might seek to improve governance by reducing export to Excel activity. At first, you focus on reducing the total exports over time. Then, over time, you observe a decrease in the total number of exports. You then decide to shift your focus to key users who export regularly, or exports from specific data items that contain sensitive or confidential information.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When conducting adoption tracking, key decisions and actions include:

- **Read the [Microsoft Fabric adoption roadmap](fabric-adoption-roadmap-maturity-levels.md):** Understand what adoption is, why it's important, and the different areas that constitute effective adoption in an organization. Also, understand the difference between [organizational adoption](fabric-adoption-roadmap-maturity-levels.md#organizational-adoption-maturity-levels), [user adoption](fabric-adoption-roadmap-maturity-levels.md#user-adoption-stages), and [solution adoption](fabric-adoption-roadmap-maturity-levels.md#solution-adoption-phases).
- **Understand what adoption means for your organization:** Consider meeting with key stakeholders in interactive meetings to hear their perspective.
- **Build a shared understanding of adoption within the organization:** Communicate what adoption means within your organization through channels like a [communication hub](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#create-a-communication-hub), your [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal), or the [community of practice](fabric-adoption-roadmap-community-of-practice.md).
- **Evaluate your maturity levels:** Conduct a [maturity level assessment](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#complete-the-data-culture-assessment) for each of the areas defined in the Microsoft Fabric adoption roadmap to understand the current state of adoption in your organization.
- **Define your objectives:** Identify the maturity levels that you want to attain. Ensure that you set realistic objectives. Then prioritize key areas that will help you achieve progress.
- **Identify behaviors that you want to discourage or replicate:** Survey the organization and identify any behaviors related to effectively working with data or performing analytics. Identified behaviors could lead to success or challenges.
- **Define how to measure these behaviors:** Determine how you'll measure these behaviors to identify improvement over time, which should lead to more positive behaviors and less negative behaviors.
- **Decide whether you'll use custom or ready-made solutions:** Evaluate what adoption tracking solution you'll use to measure behaviors. Explore the ready-made solutions available in your tenant before you commit to a custom solution. Remember that you can enrich the admin monitoring workspace models with other data and calculations.
- **Assign ownership and define actions:** Clarify who has ultimate responsibility for certain indicators, and what actions these indicators will motivate (and who's responsible for taking these actions).
- **Plan regular meetings to assess progress and ensure accountability:** Make sure that these meetings aren't about enforcing ownership. Instead, focus on the adoption tracking itself, and whether it's happening consistently and effectively, or not.

## Related content

For more considerations, actions, decision-making criteria, and recommendations to help you with Power BI implementation decisions, see [Power BI implementation planning](powerbi-implementation-planning-introduction.md).
