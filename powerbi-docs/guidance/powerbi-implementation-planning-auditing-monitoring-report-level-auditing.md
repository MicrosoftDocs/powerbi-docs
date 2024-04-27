---
title: "Power BI implementation planning: Report-level auditing"
description: "Learn about report-level auditing planning for Power BI."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 04/25/2023
---

# Power BI implementation planning: Report-level auditing

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This report-level auditing article is targeted at multiple audiences:

- **Report creators:** Users who need to understand usage, adoption, and performance of the reports that they've created, published, and shared.
- **Power BI administrators:** The administrators who are responsible for overseeing Power BI in the organization. Power BI administrators might need to collaborate with IT, security, internal audit, and other relevant teams.
- **Center of Excellence, IT, and BI team:** The teams that are also responsible for overseeing Power BI. They might need to collaborate with Power BI administrators and other relevant teams.

The concepts covered in this article apply primarily to solutions created for three [content delivery scopes](fabric-adoption-roadmap-content-delivery-scope.md), specifically enterprise BI, departmental BI, and team BI. Creators of personal BI solutions might find the information in this article useful as well; however, they're not the primary target.

This article focuses on auditing and monitoring of reports and visuals. However, achieving good performance for a report and its visuals isn't possible when the underlying semantic model ([previously known as a dataset](../connect-data/service-datasets-rename.md)) and/or data source doesn't perform well. For information about auditing and monitoring of semantic models, dataflows, and datamarts, see [Data-level auditing](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md).

This article is the first article in the auditing and monitoring series because it describes built-in tools that content creators are likely to discover first. Ideally, you create shared semantic models (intended for reuse among many reports) before users create reports. Therefore, we recommend that you read this article together with the [Data-level auditing](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md) article.

> [!TIP]
> Whether you're conversing with colleagues or reading online, you'll need to discern whether the term _report_ is used literally or more generally. Often, it's used in a general way to refer to a single Power BI Desktop file (.pbix). The file might contain a data model (which when published becomes a semantic model), a report, or both. The term can be used literally to refer to a report only (for example, a report with a Live Connection to a semantic model). In this article, the term is used literally.

## Report performance targets

To effectively monitor reports, we recommend that you define what report performance targets, like _excellent performance, good performance,_ and _poor performance_, mean to your organization. There aren't any universal definitions. You should always consider these targets from the consumer's perspective.

Ideally, performance is a primary concern during the report design process. Here are several situations when you might choose to set performance targets.

- When validating or reviewing a new report (especially when you expect it to have a [content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md) to a large number of users).
- Before [endorsing](/power-bi/collaborate-share/service-endorse-content) a report (particularly when it's to be certified).
- Prior to [publishing](/power-bi/create-reports/desktop-upload-desktop-files) a report to a production workspace.
- When including a report in a [Power BI app](/power-bi/collaborate-share/service-create-distribute-apps).

You might choose to create a standard performance target that's intended to apply to all reports throughout the organization. For example, the first report page should render within five seconds. However, because there are so many different considerations, it's not typically realistic to expect that every solution should meet the same target. Consider ranges for your performance targets that factor in the complexity level of the solution.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering how report creators should verify report performance, key decisions and actions include:

> [!div class="checklist"]
> - **Identify report performance targets:** Ensure that you have a good understanding of what acceptable report performance means from the consumer's perspective.
> - **Document and communicate performance targets:** If there are specific targets, make sure they are communicated to the report creators in your organization. Provide helpful information so that report creators understand how to measure performance, and how to apply design techniques that improve performance.

The remainder of this article describes techniques that you can use to audit and monitor report performance.

## Report usage metrics

The main auditing resource available to report creators are the [usage metrics](/power-bi/collaborate-share/service-modern-usage-metrics) reports, which are built into the Power BI service.

The primary objective of the usage metrics reports is to assess the impact of one report, or all reports in a workspace. Because it's focused on report views and performance of reports and dashboards (rather than other items, such as semantic models and dataflows), it's targeted at report creators.

Use the usage metrics reports to:

- Determine which users are most actively viewing reports.
- Understand how often reports are viewed and rank those reports by popularity (based on usage).
- Determine which report pages users access most frequently.
- Find reports that haven't been viewed recently.
- View high-level report performance statistics. These statistics can help guide report design optimization efforts, and identify reports that could have intermittent or consistent performance issues.
- Understand which consumption methods (for example, browser or [Power BI mobile app](/power-bi/consumer/mobile/mobile-apps-for-mobile-devices)) report consumers use. This information can help report creators decide how much effort to put into [optimizing reports for mobile use](/power-bi/create-reports/power-bi-create-mobile-optimized-report-about).

> [!TIP]
> Power BI captures usage metrics for activity that occurs for content that's been published to the Power BI service (including when it's rendered by using [Power BI Embedded](/power-bi/developer/embedded/embedded-analytics-power-bi)). Access to usage metrics is just one reason to encourage report creators to publish their reports to the Power BI service, rather than sharing Power BI Desktop files.

Usage metrics are built into the Power BI service, which is a key advantage because report creators don't need to set up a process to extract and store the usage data. It's fast and simple for them to get started.

Another advantage of the usage metrics is that the internal semantic model (that contains the usage metrics data) includes information that's not easily found elsewhere. For example, it includes views per report page and report opening time duration. The report page views are obtained by using [client telemetry](/power-bi/collaborate-share/service-modern-usage-metrics#considerations-and-limitations), which has limitations. Client telemetry (used by report usage metrics) is different from server-side telemetry data (used by the [activity log](/power-bi/enterprise/service-admin-auditing)).

Usage metrics include an internal semantic model and a report. While the internal semantic model can't be edited or customized, you can [customize the usage metrics report](/power-bi/collaborate-share/service-modern-usage-metrics#customize-the-usage-metrics-report). You can also update the report filters to learn about usage for all reports in a workspace (rather than just one report). By using this approach, the broadest range available is one workspace. You can view up to 30 days of history, including the most recent fully completed day.

> [!IMPORTANT]
> The Power BI activity log is a better alternative when you want to:
>
> - Retrieve user activities for more than one workspace.
> - Extract and retain activity data for more than 30 days.
> - Analyze all activities that users perform in the Power BI service.
>
> For more information about the activity log, see [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md).

The usage metrics reports are available to report creators and owners who are assigned to the Contributor, Member, or Admin [workspace role](/power-bi/collaborate-share/service-roles-new-workspaces). To make the usage metrics reports visible to workspace viewers (content consumers), you can [create a copy of the usage report](/power-bi/collaborate-share/service-modern-usage-metrics#create-a-copy-of-the-usage-report) and customize it.

> [!TIP]
> For more information about workspace roles, see the [Content creator security planning](powerbi-implementation-planning-security-content-creator-planning.md) article.

There are two tenant settings related to usage metrics.

- The _Usage metrics for content creators_ tenant setting controls which groups of report creators (who also have the necessary workspace role) can generate and view the usage metrics reports. Commonly, Power BI administrators leave this setting enabled for the entire organization. That way, all self-service report creators can view the usage patterns for their content.
- The _Per-user data in usage metrics for content creators_ tenant setting determines whether the names and email addresses of report consumers are displayed in the usage metrics reports. When this setting is disabled (for some or all report creators), Power BI suppresses names and email addresses in the usage metrics reports, which is referred to as _user masking_. Most often, Power BI administrators leave this setting enabled so that report creators can understand exactly who's using their reports. Also, the ability to contact other users directly for feedback about the content is valuable because it can help to improve the content. Occasionally, you might have a security need to mask user information for certain groups of report creators. When the setting is disabled, the report creator sees _unnamed user_ in place of the user details.

The _ViewUsageMetrics_ operation in the [Power BI activity log](/power-bi/enterprise/service-admin-auditing) allows Power BI administrators to monitor which content creators and owners are using the usage metrics reports. You can use that information to guide training and documentation efforts.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for using the usage metrics report, key decisions and actions include:

> [!div class="checklist"]
> - **Confirm usage metrics are enabled:** Decide whether any Power BI report creator (who has permission to edit the report) can view usage metrics. Set the _Usage metrics for content creators_ tenant setting to align with this decision.
> - **Decide whether per-user data is displayed in usage metrics:** Determine whether names and email can be shown to all or some users. Set the _Per-user data in usage metrics for content creators_ tenant setting to align with this decision.
> - **Verify workspace roles:** Validate the workspace role assignments. Ensure that appropriate report creators and owners have permission to edit content in the workspace (thereby making the usage metrics reports available).
> - **Create and customize the usage metrics reports:** For content you want to analyze, generate a usage metrics report. When appropriate, customize the usage metrics report to include all reports in the workspace.
> - **Include in documentation and training for report creators:** Include guidance for your report creators about how they can take advantage of the usage metrics reports. Ensure that report creators understand the use cases and key limitations. Include examples of key metrics they can track, and how they can use the information to continually improve the solutions they create and publish.
> - **Monitor who's using usage metrics:** Use the Power BI activity log to track which content creators and owners are using the usage metrics reports.
> - **Determine whether usage metrics is sufficient:** Consider the situations when the built-in usage metrics report would be sufficient. Determine whether data-level and tenant-level auditing solutions (described in other articles in this series) would be more appropriate.

## Performance Analyzer

[Performance Analyzer](/power-bi/create-reports/desktop-performance-analyzer) is a tool available in Power BI Desktop to help you investigate and monitor report performance. It can help report creators understand the performance of visuals and DAX formulas.

> [!TIP]
> In addition to Performance Analyzer, there are other tools that you can use to troubleshoot report performance issues. For example, you can troubleshoot specific report consumption issues that impact a Premium capacity by using the [Premium utilization and metrics app](/power-bi/enterprise/service-premium-metrics-app) or the semantic model event logs that are sent to Azure Log Analytics. For more information about these tools (and other tools), see [Data-level auditing](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md).

Performance Analyzer captures operations while a user interacts with a report in Power BI Desktop. It produces a log that records how each report element performs and for each interaction. For example, when you interact with a report slicer, cross-filter a visual, or select a page, the action and time duration are recorded in the log. Depending on the type of operation, other details are recorded too.

Summarized information is available in the **Performance Analyzer** pane. You can export log results to a JSON file, allowing you to follow through with more in-depth analysis. The export file contains more information about the logged operations. For more information about using the export file, see the [Performance Analyzer documentation](https://github.com/microsoft/powerbi-desktop-samples/tree/main/Performance%20Analyzer) on GitHub.

> [!IMPORTANT]
> Keep in mind that Performance Analyzer runs within Power BI Desktop. The environment of the report creator's machine might differ from the environment of the Power BI service.
>
> Some common differences that you should account for include:
>
> - Data volume in the underlying semantic model
> - The number of concurrent users viewing the report
> - Table [storage mode(s)](/power-bi/transform-model/desktop-storage-mode)
> - Whether a [data gateway](/power-bi/connect-data/service-gateway-deployment-guidance) is used
> - Whether a [Power BI Premium](/power-bi/enterprise/service-admin-premium-manage) capacity is involved
> - Whether [query caching](/power-bi/connect-data/power-bi-query-caching) is enabled
> - Whether [query parallelization](https://powerbi.microsoft.com/blog/query-parallelization-helps-to-boost-power-bi-dataset-performance-in-directquery-mode/) is used
> - The number of [active connections](/power-bi/connect-data/desktop-directquery-about#maximum-number-of-connections-option-for-directquery)
> - Whether [row-level security](/fabric/security/service-admin-row-level-security) (RLS) is enforced by the Power BI service.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

Data is logged when a user interacts with a report element. Logged data includes more than the visual display elements. It also includes:

- Visual display activity.
- DAX queries (when the visual retrieves data from the data model instead of the cache).
- DirectQuery activity (when applicable).
- Other activities performed by a visual, such as query preparation, background processing activities, and wait time.

Depending on their experience level, and how roles and responsibilities are divided, a report creator might need assistance to resolve performance issues. That's especially true when trying to understand why a query or calculation is slow. Assistance for a report creator could come in the form of:

- **Collaborating with a data creator:** The root cause of performance issues is often related to the design of the data model.
- **User support:** Assistance is often [intra-team support](fabric-adoption-roadmap-user-support.md#intra-team-support) from close colleagues or [internal community support](fabric-adoption-roadmap-user-support.md#internal-community-support) from other Power BI users in the organization. In some situations, it could also involve [help desk support](fabric-adoption-roadmap-user-support.md#help-desk-support).
- **Skills mentoring from the Center of Excellence:** Assistance could also be in the form of [skills mentoring](fabric-adoption-roadmap-mentoring-and-user-enablement.md#skills-mentoring) activities, such as [office hours](fabric-adoption-roadmap-mentoring-and-user-enablement.md#office-hours).

Some organizations have specific requirements for [endorsed](/power-bi/collaborate-share/service-endorse-content) (certified or promoted) reports. That's particularly true for reports that are widely used throughout the organization. In that case, you might be required (or encouraged) to verify Performance Analyzer results before publishing the report, or before it's certified.

> [!TIP]
> Well-performing reports have a positive impact on [solution adoption](fabric-adoption-roadmap-maturity-levels.md#solution-adoption-phases). We recommend that you encourage report creators to test report performance before publishing a new solution to the Power BI service. You should also encourage them to retest performance when significant changes are made to an existing solution (report or semantic model).
>
> For more information about optimization techniques, see [Optimization guide for Power BI](power-bi-optimization.md).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering how report creators should use Performance Analyzer, key decisions and actions include:

> [!div class="checklist"]
> - **Create documentation and training for report creators:** Include guidance for your report creators about what performance targets exist and how they can validate, measure, and test performance. Provide guidance to your report creators about how to create well-performing reports. Help new report creators adopt good design habits early.
> - **Ensure support and skills mentoring are available:** Ensure that your report creators know how to get assistance to resolve performance issues.
> - **Include in requirements to certify reports:** Decide whether you want to include Performance Analyzer results as a prerequisite to certifying (endorsing) reports. If so, ensure that this requirement is documented and communicated to report creators.

## Related content

In the [next article in this series](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md), learn about data-level auditing.
