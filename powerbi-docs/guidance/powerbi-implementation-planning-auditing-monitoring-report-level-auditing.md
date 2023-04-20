---
title: "Power BI implementation planning: Report-level auditing"
description: "Learn about report-level auditing planning for Power BI."
author: data-goblin
ms.author: v-kurtbuhler
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 04/20/2023
---

# Power BI implementation planning: Report-level auditing

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This report-level auditing article is targeted at multiple audiences:

- **Report creators:** Users who need to understand usage, adoption, and performance of the reports that they've created, published, and shared.
- **Power BI administrators:** The administrators who are responsible for overseeing Power BI in the organization. Power BI administrators may need to collaborate with IT, security, internal audit, and other relevant teams.
- **Center of Excellence, IT, and BI team:** The teams that are also responsible for overseeing Power BI. They may need to collaborate with Power BI administrators and other relevant teams.

The concepts covered in this article apply primarily to solutions created for enterprise BI, departmental BI, and team BI [content delivery scope](powerbi-adoption-roadmap-content-delivery-scope.md). Creators of personal BI solutions may find the information in this article useful as well; however, they're not the primary target.

This article focuses on auditing and monitoring of reports and visuals. However, achieving good performance for a report and its visuals isn't possible when the underlying dataset and/or data source doesn't perform well. For information about auditing and monitoring of datasets, dataflows, and datamarts, see [Data-level auditing](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md).

This article is the first article in the auditing and monitoring series because it includes built-in tools that content creators are likely to discover first. Ideally, you create shared datasets (intended for reuse among many reports) before users create reports. Therefore, we recommend that you read this article together with the [Data-level auditing](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md) article.

> [!TIP]
> Whether you're conversing with colleagues or reading online, you'll need to discern whether the term _report_ is used literally or more generally. Often, it's used in a general way to refer to a single Power BI Desktop file (.pbix). The file might contain a data model (which when published becomes a dataset), a report, or both. The term can be used literally to refer to a report only (for example, a report with a Live Connection to a dataset). In this article, the term is used literally.

## Report performance targets

When you get started with report monitoring, we suggest that you define what report performance targets, like _excellent performance, good performance,_ and _poor performance_, mean to the organization. There aren't any universal definitions. You should always consider these targets from the consumer's perspective.

Ideally, performance is a primary concern during the report design process. Here are several situations when you might choose to set performance targets.

- When validating or reviewing a new report (especially when you expect it to have a [content delivery scope](powerbi-adoption-roadmap-content-delivery-scope.md) to a large number of users).
- Before [endorsing](/power-bi/collaborate-share/service-endorse-content) a report (particularly when it's certified).
- Prior to [publishing](/power-bi/create-reports/desktop-upload-desktop-files) a report to a production workspace.
- When including a report in a [Power BI app](/power-bi/collaborate-share/service-create-distribute-apps).

You might choose to create a standard performance target that's intended to apply to all reports throughout the organization. For example: the first report page should render within five seconds. However, because there are so many different considerations, it's not typically realistic to expect that every solution should meet the same target. Consider ranges for your performance targets that factor in the complexity level of the solution.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering how report creators should verify report performance, key decisions and actions include:

> [!div class="checklist"]
> - **Identify report performance targets:** Ensure that you have a good understanding of what acceptable report performance means from the consumer's perspective.
> - **Document and communicate performance targets:** If there are specific targets, make sure they are communicated to the report creators in your organization. Provide helpful information so that report creators understand how to measure performance, and design techniques they can use to improve performance.

The remainder of this article describes techniques that you can use to audit and monitor report performance.

## Report usage metrics

The main auditing resource available to report creators is the [usage metrics](/power-bi/collaborate-share/service-modern-usage-metrics) report. The primary objective of the usage metrics report is to analyze one report, or all reports in a workspace.

The usage metrics report is built into the Power BI service, making it simple for a report creator to understand recent usage patterns. Because it's focused on report views and performance of reports and dashboards (rather than other items, such as datasets and dataflows), it's targeted at report creators.

The usage metrics report helps report creators assess the impact of a published report. Report creators can:

- Determine which users are most actively viewing reports.
- Understand how often reports are viewed and rank those reports by popularity (based on usage).
- Determine which report pages users access most frequently.
- Find reports that haven't been viewed recently.
- View high-level report performance statistics. These statistics can help report guide design optimization efforts, and identify reports that may have intermittent or consistent performance issues.
- Understand which consumption methods (for example, browser or [Power BI mobile app](/power-bi/consumer/mobile/mobile-apps-for-mobile-devices)) viewers use to view reports. This information can help a report creator decide how much effort to put into [optimizing reports for mobile use](/power-bi/create-reports/power-bi-create-mobile-optimized-report-about).

> [!TIP]
> Usage metrics are captured for activity that occurs for content that's been published to the Power BI service (including when it's rendered by using [Power BI Embedded](/power-bi/developer/embedded/embedded-analytics-power-bi)). Access to usage metrics is just one reason to encourage report creators to publish their reports to the Power BI service, rather than sharing Power BI Desktop files.

Usage metrics are built into the Power BI service, which is a key advantage because report creators don't have to set up a process to extract and store the usage data. It's fast and simple for them to get started.

Another advantage of the usage metrics is that the internal dataset (that contains the usage metrics data) includes information that's not easily found elsewhere. For example, it includes views per report page and report opening time duration. The report page views are obtained by using [client telemetry](/power-bi/collaborate-share/service-modern-usage-metrics#considerations-and-limitations), which has limitations. Client telemetry (used by report usage metrics) is different from server-side telemetry data (used by the [activity log](/power-bi/admin/service-admin-auditing)).

Usage metrics include an internal dataset and a report. The internal dataset can't be edited or customized. However, you can (optionally) [customize the usage metrics report](/power-bi/collaborate-share/service-modern-usage-metrics#customize-the-usage-metrics-report). You can update the report filters to view usage for all reports in a workspace (rather than just one report). By using this approach, the broadest range available is one workspace. You can view up to 30 days of history, including the most recent fully completed day.

> [!IMPORTANT]
> The Power BI activity log is a better alternative when you want to:
>
> - Retrieve user activities for more than one workspace.
> - Extract and retain activity data for more than 30 days.
> - Analyze all activities that users perform in the Power BI service.

For more information about the activity log, see [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md).

The built-in usage metrics report is available to report creators and owners who are assigned the [workspace role](/power-bi/collaborate-share/service-roles-new-workspaces) of Contributor, Member, or Admin. To make the usage metrics report visible to workspace viewers (content consumers), you can [create a copy of the usage report](/power-bi/collaborate-share/service-modern-usage-metrics#create-a-copy-of-the-usage-report) and customize it. For more information about workspace roles, see the [Content creator security planning](powerbi-implementation-planning-security-content-creator-planning.md) article.

There are two tenant settings related to usage metrics.

- The _Usage metrics for content creators_ tenant setting controls which groups of report creators (who also have the necessary workspace role) may generate and view the usage metrics reports. Most commonly, this setting remains enabled for the entire organization. That way, all self-service report creators can see the usage patterns for their content.
- The _Per-user data in usage metrics for content creators_ tenant setting specifies whether the names and email addresses of users are displayed in the usage metrics reports. This capability is referred to as _user masking_. Disabling this setting (for some or all report creators) suppresses names and email addresses in the usage metrics reports. Most often, this setting is enabled so that report creators can understand exactly who's using their reports. The ability to contact other users directly for feedback about the content is valuable because it can help to improve the content. Occasionally, you might have a security need to limit the exposure of identifying user information that's shown to certain groups of report creators. When it's disabled, the report creator sees _unnamed user_ in the usage metrics report.

The _ViewUsageMetrics_ operation in the [Power BI activity log](/power-bi/admin/service-admin-auditing) allows Power BI administrators to monitor which content creators and owners are using the usage metrics reports throughout the tenant. You can use that information to inform training and documentation efforts.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When planning for using the usage metrics reports, key decisions and actions include:

> [!div class="checklist"]
> - **Confirm usage metrics are enabled:** Decide whether any Power BI report creator (who has permission to edit the report) can view usage metrics. Set the _Usage metrics for content creators_ tenant setting to align with this decision.
> - **Decide whether per-user data may be displayed in usage metrics:** Determine whether names and email can be shown to all or some users. Set the _Per-user data in usage metrics for content creators_ tenant setting to align with this decision.
> - **Verify workspace roles:** Validate the workspace roles that are assigned. Ensure that the right report creators and owners have access to edit content in the workspace (thereby making available the usage metrics reports).
> - **Create and customize the usage metrics reports:** For content you want to analyze, generate a usage metrics report. When appropriate, customize the usage metrics report to include all reports in the workspace.
> - **Include in documentation and training for report creators:** Include guidance for your report creators about how they can take advantage of the usage metrics reports. Ensure that report creators understand use cases and key limitations. Include examples of key metrics they can track, and how they can use the information to continually improve the solutions they create and publish.
> - **Monitor who is using usage metrics:** Use the Power BI activity log to track which content creators and owners are using the usage metrics reports.
> - **Determine whether usage metrics is sufficient:** Consider which situations the built-in usage metrics report will be sufficient. Determine when data-level and tenant-level auditing solutions (described in other articles in this series) will be more appropriate.

## Performance Analyzer

[Performance Analyzer](/power-bi/create-reports/desktop-performance-analyzer) is a tool available in Power BI Desktop to help you investigate and monitor report performance. It helps report creators understand the performance of visuals and DAX formulas.

> [!TIP]
> In addition to Performance Analyzer, other tools exist that can help troubleshoot report performance issues. For example, you can troubleshoot specific report consumption issues that impact a Premium capacity by using the [Premium utilization and metrics app](/power-bi/enterprise/service-premium-metrics-app) or the dataset event logs that are sent to Azure Log Analytics. These tools (and more) are covered in [Data-level auditing](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md).

Performance Analyzer captures operations while a user interacts with a report in Power BI Desktop. It produces a log that measures how each report element performs and for each interaction. For example, when you interact with a report slicer, cross-filter a visual, or select a page, the action and time duration are recorded in the log. Depending on the type of operation, other details are recorded too.

Summarized information is available in the **Performance Analyzer** pane. You can also export log results to a .json file, allowing you to perform more in-depth analysis. The export file contains more information about the logged operations. For more information about using the export file, see the [Performance Analyzer documentation](https://github.com/microsoft/powerbi-desktop-samples/tree/main/Performance%20Analyzer) on GitHub.

> [!IMPORTANT]
> Keep in mind that Performance Analyzer runs within Power BI Desktop. The environment of the report creator's machine may be different from the environment of the Power BI service. Some common differences that you should account for include: data volume in the underlying dataset, the number of concurrent users viewing the report, the table [storage mode(s)](/power-bi/transform-model/desktop-storage-mode), whether a [data gateway](/power-bi/connect-data/service-gateway-deployment-guidance) is used, whether a [Power BI Premium](/power-bi/enterprise/service-admin-premium-manage) capacity is involved, whether [query caching](/power-bi/connect-data/power-bi-query-caching) is enabled, whether [query parallelization](https://powerbi.microsoft.com/blog/query-parallelization-helps-to-boost-power-bi-dataset-performance-in-directquery-mode/) is used, the number of [active connections](/power-bi/connect-data/desktop-directquery-about#maximum-number-of-connections-option-for-directquery), and whether [row-level security](/power-bi/enterprise/service-admin-rls) is enforced by the Power BI service.

Data is logged when a user interacts with a report element. Logged data includes more than the visual display elements. It includes:

- Visual display activity.
- DAX queries (when the visual retrieves data from the data model instead of the cache).
- DirectQuery activity (when applicable).
- Other activities performed by a visual, such as query preparation, background processing activities, and wait time.

Depending on their experience level, and how roles and responsibilities are divided, a report creator may need assistance to resolve performance issues. That's especially true when trying to determine the reason why a query or calculation is slow. Assistance for a report creator could come in the form of:

- **Collaborating with a data creator:** The root cause of performance issues is often related to the design of the data model.
- **User support:** Assistance is often [intra-team support](powerbi-adoption-roadmap-user-support.md#intra-team-support) from close colleagues or [internal community support](powerbi-adoption-roadmap-user-support.md#internal-community-support) from other Power BI users in the organization. It could also involve [help desk support](powerbi-adoption-roadmap-user-support.md#help-desk-support) in some situations.
- **Skills mentoring from the Center of Excellence:** Assistance could also be in the form of [skills mentoring](powerbi-adoption-roadmap-mentoring-and-user-enablement.md#skills-mentoring) activities, such as office hours.

Some organizations have specific requirements for [endorsed](/power-bi/collaborate-share/service-endorse-content) (certified or promoted) reports. That's particularly true for reports that are widely used throughout the organization. In that case, you might be required (or encouraged) to verify Performance Analyzer results before publishing the report, or before it's certified.

> [!TIP]
> Well-performing reports have a positive impact on [solution adoption](powerbi-adoption-roadmap-maturity-levels.md#solution-adoption-phases). We recommend that you teach report creators to test performance before publishing any new solution to the Power BI service. Also, they should retest performance when significant changes are made to an existing solution (report or dataset).

For more information about optimization techniques, see [Optimization guide for Power BI](power-bi-optimization.md).

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering how report creators should use the Performance Analyzer, key decisions and actions include:

> [!div class="checklist"]
> - **Create documentation and training for report creators:** Include guidance for your report creators about what performance targets exist and how they can validate, measure, and test performance. Provide guidance to your report creators about how to create well-performing reports. Help new report creators learn good habits early.
> - **Ensure support and skills mentoring are available:** Ensure that your report creators know how to get assistance to resolve performance concerns.
> - **Include in requirements to certify reports:** Decide whether you want to include Performance Analyzer results as a prerequisite to certifying (endorsing) reports. If so, ensure this requirement is documented and communicated to report creators.

## Next steps

In the [next article in this series](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md), learn about data-level auditing.
