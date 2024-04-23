---
title: "Power BI implementation planning: Retire and archive content"
description: "This article helps you to retire and archive content at the end of its lifecycle."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 04/24/2024
---

# Power BI implementation planning: Retire and archive content

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article helps you to retire and archive content at the end of its lifecycle. This article is primarily targeted at:

- **Fabric administrators:** The administrators who are responsible for overseeing Fabric in the organization. Fabric administrators might need to collaborate with other administrators, like those who oversee Microsoft 365 or Azure DevOps.
- **Center of Excellence (COE) and BI teams:** The teams that are responsible for overseeing Power BI in the organization. These teams include decision makers who decide how to manage the lifecycle of Power BI content.
- **Data operations teams:** The teams that are responsible for overseeing the lifecycle management of enterprise data solutions. These teams can include release managers, who handle the lifecycle of content releases, and engineers who create and manage the components needed to effectively use and support lifecycle management.
- **Content creators and content owners:** Users who create content that they want to publish to the Fabric portal to share with others. These individuals are responsible for managing the lifecycle of the Power BI content that they create.

Lifecycle management consists of the processes and practices that you use to handle content from its creation to its eventual retirement. In the [fifth stage of lifecycle management](powerbi-implementation-planning-content-lifecycle-management-support-monitor.md), you support and monitor content, which involves supporting users and published content to facilitate adoption and address issues. Eventually, you'll come to the sixth and final stage of the content lifecycle, where you might identify content that's no longer used or needed. At this last stage, you retire and archive the content.

Retiring and archiving content is important once the content has fulfilled its purpose. It ensures that resources aren't wasted supporting content that isn't needed, and it makes it easier for content creators and administrators to oversee the content that is needed. When you retire and archive content at the end of its lifecycle, it helps you to improve governance and efficiency, because you focus effort and resources on relevant content and active areas of your tenant.

The following image depicts the lifecycle of Power BI content, highlighting stage six, where you retire and archive content.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-retire-archive/content-lifecycle-management-stage-6.svg" alt-text="Diagram shows the Power BI content lifecycle. Stage 6, which is about content retirement and archiving, is highlighted." border="false":::

> [!NOTE]
> For an overview of content lifecycle management, see the [first article in this series](powerbi-implementation-planning-content-lifecycle-management-overview.md).

Eventually, consumers might no longer need or use content. There might be many reasons, such as replacement content being deployed, different business objectives, or changing priorities.

Retiring content helps you govern Power BI in different ways.

- Fewer items reduces clutter and keeps your environment more manageable. Fewer items also helps users to navigate active content, and it's easier to maintain.
- Removing unused items reduces confusion for consumers about what content they should use.
- Auditing becomes easier when it's focused on active content. That's especially true when you audit security roles and permissions.
- Having fewer items can potentially optimize capacity usage because resources won't be used accidentally.

## Decide when and how you'll retire content

You should regularly evaluate [usage patterns](powerbi-implementation-planning-auditing-monitoring-overview.md#understand-usage-patterns) in your organization as you perform auditing and monitoring activities to identify candidate content you can retire. The steps are known as _content clean-up activities_. Content clean-up activities are the regularly scheduled actions you take to survey content, whereas content retirement is what happens when you decide to decommission content at the end of its lifecycle. Depending on the volume of items published in your tenant, you might conduct these activities more regularly, such as quarterly or monthly.

> [!TIP]
> [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md) and [tenant-level monitoring](powerbi-implementation-planning-auditing-monitoring-tenant-level-monitoring.md) are key activities to help you decide when content should be retired.

### Plan content cleanup activities

The following key considerations and decisions should be made when you want to analyze your content to identify what could be retired and archived.

- **Select the scope of analysis:** Content clean-up activities can be done at the tenant level. However, it's also common to conduct an analysis at the workspace, capacity, or domain level. That way, you can make decisions and take action based on specific needs or user populations. For instance, workspace administrators can be responsible for regular content clean-up activities of the workspaces that they manage.
- **Decide on a time window for the specific content:** Consider what time window is relevant for the content you're analyzing. Although you might have a standard time window (such as no usage within three months), it can be difficult to use the same guidelines in every situation. Consider the following examples.
  - **Standard 3-month time window:** A workspace for the sales team exists to track quarterly bonuses. If there's been no usage within the past three months, the entire workspace is a candidate for retirement.
  - **Shorter 1-month time window:** An operational report with daily sales figures is intended for frequent daily or weekly use. If it hasn't been used within the past month, the report is a candidate for retirement.
  - **Longer 1-year time window:** A semantic model is produced by IT once a year to provide reports for external auditors. Although it doesn't have any usage in the most recent few months, it's critical to keep the semantic model. In this situation, a time window of more than one year is justified before making it a candidate for retirement.
  - **Exception with no time window:** A scorecard containing key organizational key performance indicators (KPIs) is used intermittently by executives. Even though the usage isn't consistent and it has a few viewers, this specific content won't be considered for retirement based solely on low usage.
- **Create classifications:** Decide what terminology you'll use consistently. Create _common definitions_ to classify terms such as frequently used, actively used, occasionally used, and unused. Consider how you'll apply these terms for analyzing content usage and user activity levels. For more information, see [Create classifications](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#create-classifications).
- **Select relevant usage metrics:** In most situations you'll need to consider multiple metrics, including total actual views for content and total actual users (viewers) of content. Consider the following examples.
  - **High number of views:** One report might consistently have a high number of views from a small number of users. This activity might reflect [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md) and [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) usage scenarios.
  - **Large number of users:** A report might have many viewers from various areas throughout the organization. Although the content is used broadly, the actual views might be sporadic and inconsistent. This activity might reflect an [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) usage scenario.
  - **Potential vs. actual viewers:** A Power BI app or a report might have permissions assigned so that there are many potential viewers. However, you might see actual usage from only a small percentage of potential viewers.
- **Determine who will conduct usage analysis and cleanup:** Based on how [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) is handled in your organization, consider who should be responsible for content clean-up activities.

Once you plan how you'll perform a content clean-up analysis, you should next identify what content you'll retire.

## Identify the content you'll retire

At this point, you've planned regular content clean-up activities, and made some key choices and decisions about how to analyze the content in your tenant. It's now time to analyze [usage patterns](powerbi-implementation-planning-auditing-monitoring-overview.md#understand-usage-patterns) and identify candidate content to retire. Typically, you want to find content with low usage and maintenance to investigate.

Consider the following actions for finding content that's sparsely used and no longer maintained.

- **Analyze views:** You should focus on the number of views for visual items, such as reports and apps.
  - Sort the items by the total views in your time window (described in the previous section). Focus on finding items that are unused or only occasionally used.
  - Analyze the recent usage based on your time window.
  - Check for a downward trend compared to past time periods.
- **Analyze queries:** You should focus on queries submitted for data items, such as semantic models.
  - Sort the items by the total queries in your time window. Focus on finding content that's unused or only occasionally used.
  - Analyze the recent usage based on your time window.
  - Check for a downward trend compared to past time periods.
- **Analyze the viewers:** Sometimes, the total number of viewers of the content in your time window can be relevant when it's also compared to the views and queries.
  - Sort the items by the total number of viewers in your time window.
  - Filter out viewers who are content creators, owners, or support team members so you can focus on consumers with view-only activity.
  - Filter out viewers who have used the report only once or twice to see the effect on the usage trend. It's possible that these users accidentally opened a report.
- **Analyze refresh dates:** For data items (such as semantic models or dataflows), check the last time the content was refreshed. If it wasn't refreshed recently, it probably supports the conclusion that the data items aren't used anymore.
- **Check content update dates:** It might be helpful to check the last time the content was updated or republished. Content that hasn't been updated recently supports the possibility that it might be ready for retirement.
- **Check for documentation:** Before exclusively relying on the usage statistics data, review any documentation or metadata that's available.
  - Locate documentation that exists for the content. Ideally, a report would include an introduction page to document its target usage and target audience. That type of information helps viewers, and it's especially useful when the content is used on an irregular basis.
  - Review available metadata. A [workspace description](powerbi-implementation-planning-workspaces-workspace-level-planning.md#other-workspace-properties) could contain relevant information about its intended usage patterns. A [workspace name](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-naming-conventions) might include _\[Dev\]_ or _\[Test\]_ suffixes that would clarify why usage varies considerably.
- **Communicate with the owner of the content:** When you find a candidate item to retire, enquire about the content with the [contact](../create-reports/service-item-contact.md) or its owner. They might have other insight into expected usage patterns that's not readily apparent from the usage statistics data. Sometimes you might also need to speak with subject matter experts or consumers of the content to understand their future needs.

> [!TIP]
> The [Get Unused Artifacts as Admin](/rest/api/power-bi/admin/groups-get-unused-artifacts-as-admin) REST API is one way to find unused items. However, be aware that the API searches the past 30 days of history. In most situations you'll want a larger time window so you can analyze trends over time. For more information, see [User activity data](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#user-activity-data) and [Tenant inventory](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#tenant-inventory).

## Prepare to retire unused content

At this point, you've identified content that's a good candidate to retire. Next, you should perform some preparatory steps before archiving and deleting it.

- **Confirm scope of items to be deleted:** Before proceeding, ensure that you're clear on exactly what should be deleted. Usually, it's an entire workspace or specific individual items (such as a semantic model and the reports that use it).
- **Verify dependencies:** Analyze the [data lineage](../collaborate-share/service-data-lineage.md) and perform an [impact analysis](../collaborate-share/service-dataset-impact-analysis.md) to confirm that you've accounted for all dependencies. For example, if a semantic model is going to be retired, all reports that depend on it will be retired as well.
- **Identify where content will be archived:** It's critical to have a backup, or an _archive_, of content before it's deleted. That way, you can recover it later should the need arise. The archive store should be a secure location with the minimum level of permissions to ensure that users don't accidentally find and use the archived content. There are several options for creating an archive. You might have source control in place (such as [Git integration](/fabric/cicd/git-integration/intro-to-git-integration)). Or you might choose to [download](../create-reports/service-export-to-pbix.md) the latest file from the Power BI service prior to deleting it. You might also have a [semantic model backup](../enterprise/service-premium-backup-restore-dataset.md) in place. Generally, you should consider archiving content in [the central repository](powerbi-implementation-planning-content-lifecycle-management-plan-design.md#decide-where-to-store-files) where it's been stored during its lifecycle (such as a OneDrive or SharePoint document library, or a Git repository).
- **Confirm the recovery plan:** Once you've identified where the content will be archived (described in the previous point), consider what your process will be if you discover that you need to recover content or roll back. For example, you might ask your Fabric administrator to restore a deleted workspace, providing it's done during the [retention period](/fabric/admin/portal-workspaces#workspace-retention). Or you might choose to republish a specific item from the archive you created. Conduct a test of your recovery plan so that you're certain you can rely on the process.
- **Clarify whether approval is required:** Depending on the content and your processes, you might need to get approval prior to deleting content.
- **Create a change log:** If questions come up later, it's helpful to have documentation to refer to that includes what was deleted, when, why, and by whom.
- **Confirm who will handle the deletions:** Sometimes the person who decided to retire the content isn't the same person who will do the deletions. Verify that all required permissions are granted.
  - **Delete a workspace:** There are two ways to delete an entire workspace. Each way requires different permissions.
    - The [workspace administrator role](/fabric/get-started/roles-workspaces#-workspace-roles) is appropriate when the user handling the deletion is permitted to access all content in the workspace.
    - The [Fabric administrator](powerbi-implementation-planning-tenant-administration.md#govern-workspaces) role is well-suited to tenant administrators who don't require direct access to the content. In this case, they'll perform the deletion from within the admin portal.
  - **Delete one item:** A [workspace role](/fabric/get-started/roles-workspaces#-workspace-roles) of contributor or above is required to delete an individual item from within a workspace.
- **Confirm when to perform the deletions:** Because the content isn't being actively used, the date and time to delete it shouldn't matter. However, to minimize risk, some organizations have an approved change window.
- **Communicate with the owner of the content:** Let the contacts or the owner know that the content is going to be archived and deleted. Usually, the consumers of the content don't need to be notified about inactive content. Although user communication might occasionally be appropriate, watch out for situations when users will be highly resistant to losing unused content because they aren't sure if they'll need it in the future.

> [!NOTE]
> The retention period for restoring a collaborative workspace might be different from a personal workspace. The _Define workspace retention period_ tenant setting controls how long content can be recovered after it's been deleted. For more information, see [Workspace retention](/fabric/admin/portal-workspaces#workspace-retention).

## Archive and delete unused content

At this point, you've identified content that can be retired, and taken the appropriate preparatory steps to remove and archive it. In this final step, you remove the content. This involves following through on the decisions and plans described in the previous section.

- **Archive the content to a secure location:** There are several ways you can back up the content, and allow you to recover it if necessary (described further in the previous section).
- **Delete the content:** The final step is to delete the entire workspace or individual items, as appropriate (described further in the previous section).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning to retire and archive content, key decisions and actions include:

[!div class="checklist"]
> - **Plan for content clean-up activities:** Determine whether the scope of the analysis will be at the tenant level, domain level, or workspace level. Also consider who'll perform the usage analysis.
> - **Decide on a time window:** Based on the characteristics of the specific content, determine the best time window for identifying candidates for retirement.
> - **Select usage metrics:** Consider what usage metrics related to content views and viewers are most important for the content.
> - **Create classifications:** Decide what classifications you'll use to consistently label content when you analyze usage patterns.
> - **Analyze usage statistics:** Examine views, queries, viewers, refresh, and update activities. Sort, filter, and analyze the data to discover items that are candidates for retirement.
> - **Communicate with the owner:** Contact the owner of the content to confirm your findings or to get additional insight into expected usage patterns. Be sure to coordinate archival and deletion activities with them.
> - **Analyze data lineage and perform impact analysis:** Investigate dependencies. Confirm the scope of content to be deleted.
> - **Determine how and where to archive content:** Decide what method will be used for backing up content.
> - **Verify the workspace retention period:** View the _Define workspace retention period_ tenant setting to understand what the retention period for deleted workspaces is set to in your organization.
> - **Confirm and test the recovery plan:** Plan for how you'll recover content from the archive, should it becomes necessary. Test your recovery plan to ensure it's reliable.
> - **Verify permissions:** Confirm that the necessary permissions are assigned to the user or administrator that'll do the deletions.
> - **Archive the content:** Store a backup of the content in a secure location that's not accessible to consumers.
> - **Delete the content:** Delete the entire workspace or individual items, as appropriate.

## Related content

For more considerations, actions, decision-making criteria, and recommendations to help you with your Power BI implementation, see [Power BI implementation planning](powerbi-implementation-planning-introduction.md).
