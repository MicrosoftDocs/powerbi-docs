---
title: Plan for deployment to migrate to Power BI
description: Guidance on planning for deployment when migrating to Power BI.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 08/06/2020
ms.author: v-pemyer
---

# Plan for deployment to migrate to Power BI

This article discusses **stage two** for migration of BI assets from another platform to Power BI.

:::image type="content" source="media/whitepaper-powerbi-migration-planning/migrate-to-powerbi-stage-2.png" alt-text="Image showing the stages of a Power BI migration. Stage 2 is emphasized for this article.":::

For a complete explanation of the above graphic, see [Power BI migration overview](whitepaper-powerbi-migration-overview.md).

The focus of stage two is on defining how the requirements that were defined in stage one may be fulfilled for the solution that is being migrated to Power BI.

The output from stage two includes as many specific decisions as possible to guide the deployment process.

Decision-making of this nature is an iterative, non-linear, process. Some planning will have already occurred in the [pre-migration steps](whitepaper-powerbi-migration-pre-migration-steps.md). Learnings from a proof of concept (discussed in [stage three](whitepaper-powerbi-migration-proof-of-concept.md)) may occur in parallel with deployment planning for the solution. Even while creating the solution (discussed in [stage four](whitepaper-powerbi-migration-create-and-validate-content.md)), additional information may come up which influences deployment decisions.

> [!IMPORTANT]
> Stages one through five represent activities related to **one** specific solution. There are decisions and activities at the organizational/tenant level which impact the process at the solution level. Some of those higher-level planning activities were discussed in the [Power BI migration overview](whitepaper-powerbi-migration-overview.md) article. When appropriate, defer to the organizational-level decisions for efficiency and consistency.

> [!TIP]
> The topics discussed in this article also apply to a standard Power BI implementation project.

## Decide where the content will be published

One of your first considerations is related to the publishing target. Generally, it's a decision between the [Power BI service](../power-bi/fundamentals/power-bi-service-overview.md) or [Power BI Report Server](../report-server/get-started.md). Once content has been published to the Power BI service, many additional options become available such as embedding, mobile application, and email subscriptions. For more information about architectural considerations, see section three of the [Planning a Power BI Enterprise Deployment](https://aka.ms/PBIEnterpriseDeploymentWP) whitepaper.

> [!CAUTION]
> If you are tempted to solely use Power BI Desktop files on a file system, that is not an optimal approach. Using the Power BI service has significant advantages for content distribution and collaboration. The ability to audit and monitor activities is also enabled by the Power BI service.

## Decide on workspace management approach

[Workspaces](../collaborate-share/service-new-workspaces.md) are the backbone of the Power BI service, which makes workspace management an  important aspect of planning. A few questions to ask include:

- Is a new workspace needed for this new solution?
- Will separate workspaces be needed to accommodate development, test, and production?
- Will separate workspaces be used for data and reports, or will one single workspace be sufficient? Separate workspaces have numerous advantages, especially security when datasets are managed separately from who may publish reports.
- What are the security requirements for the workspace? It influences planning for [workspace roles](../collaborate-share/service-new-workspaces#roles-in-the-new-workspaces.md). If an app will be used for content consumers, [permissions for the app](../collaborate-share/service-create-distribute-apps.md#publish-your-app) are managed separately from the workspace. Distinct permissions for app viewers allow additional flexibility in meeting security requirements for read-only consumers of reports and dashboards.
- Can existing groups be used for securing the new content? Both Azure Active Directory and Microsoft 365 groups are supported. When it aligns with existing processes, using groups makes security maintenance easier than managing workspace security with individual users.
- Are there any security considerations related to external guest users? You may need to work with your Azure Active Directory administrator and/or your Power BI administrator to configure guest user access.

> [!TIP]
> Consider setting the scope for each workspace based on a specific business activity or project. You may be tempted to start off structuring workspaces based on your organizational structure (such as a workspace per department), but that frequently ends up being too broad.

## Determine how the content will be consumed

It is helpful to understand how consumers of this solution prefer to view reports and dashboards. A few questions to ask include:

- Will a [Power BI app](../consumer/end-user-apps.md) (which includes a collection of reports and dashboards from a workspace that's "packaged up" into a Power BI app) be the best way to deliver content to the consumers, or will a workspace be sufficient for content viewers?
- Will certain reports and dashboards be embedded elsewhere, such as [Teams](../collaborate-share/service-embed-report-microsoft-teams.md), [SharePoint Online](../collaborate-share/service-embed-report-spo.md), or a [secure portal or website](../collaborate-share/service-embed-secure.md)?
- Will the [mobile applications](../consumer/mobile/mobile-apps-for-mobile-devices.md) be particularly important for certain consumers? Significant use of mobile apps will influence some of the [report design decisions](../create-reports/desktop-create-phone-report.md).

## Decide if other content may be created

There are several key decisions to be made related to the new content, such as:

- Will users be allowed to create new reports from the published dataset? This capability is managed with the [build permission](../connect-data/service-datasets-build-permissions.md) on the dataset.
- If users like a report, will you allow them to [save a copy](../connect-data/service-datasets-copy-reports.md) of the report and personalize it to meet their needs?

> [!CAUTION]
> Although the _save a copy_ feature is a nice convenience, it should be used with caution when the report includes certain graphics or header/footer messages. Since logos, icons, and textual messages often relate to branding requirements or regulatory compliance, it is important to carefully control how they are used and by whom. If _save a copy_ is used, but the original graphics or header/footer messages remain unchanged by the new author, it can result in confusion about who produced the modified report and reduces the meaningfulness of the branding.

## Evaluate needs for Premium capacity

If [Premium capacity](../admin/service-premium-what-is.md) is available for the workspace where the solution will be deployed, that makes additional options available. A few of the top reasons why Premium capacity may be advantageous include:

- If there's a significant number of content viewers who don't have a Power BI Pro license
- If paginated reports are required, in addition to Power BI reports and Excel
- If large dataset support and/or more frequent data refreshes would be useful
- If dataflows are in use, and therefore using the full feature set of dataflows would be advantageous
- If enterprise features such deployment pipelines or the XMLA endpoint are desired

## Find out how data for the reports will be acquired

Depending on how data to support the reports is being acquired, that may influence several decisions. Questions to ask include:

- Can an existing Power BI [shared dataset](../connect-data/service-datasets-share.md) be used, or is creation of a new Power BI dataset appropriate for this solution?
- Does an existing shared dataset need to be augmented with new data or measures to meet additional needs?
- Which [data storage mode](../transform-model/desktop-storage-mode.md) will be most appropriate? It includes import mode, DirectQuery, Live Connection, or a composite model.
- Should [aggregations](../transform-model/desktop-aggregations.md) be used to improve performance?
- Will creation of a [dataflow](../transform-model/service-dataflows-overview.md) be useful so it can serve as a source for numerous datasets?
- Will a new [gateway data source](../connect-data/service-gateway-data-sources.md) need to be registered?

## Decide where original content will be stored

In addition to planning the target deployment destination, it is important to also plan where the original content will be stored, such as:

- Specify an approved location for storing the original .pbix files. Ideally, this location is available only to persons who edit the content and aligns with how security is defined in the Power BI service.
- Use a location for original .pbix files that includes versioning history or source control. It permits the content author to revert to a previous file if necessary. OneDrive for Business or SharePoint work well for this purpose.
- Specify an approved location for storing non-centralized source data, such as flat files or Excel files. It should be a path that any of the dataset authors can reach without error and is backed up regularly.
- Specify an approved location for content exported from the Power BI service. The goal is to ensure that security defined in the Power BI service isn't inadvertently circumvented.

> [!IMPORTANT]
> Specifying a protected location for the original .pbix files is particularly important for imported pbix files, or composite models, because data is stored within the file.

## Assess the level of effort

Once enough information is available from the requirements (which were discussed in [stage one](whitepaper-powerbi-migration-requirements.md)) and the solution deployment planning process, it is now possible to assess the level of effort and formulate a project plan with tasks, timeline, and responsibility.

> [!TIP]
> Labor costs (salaries and wages) are usually among the highest expenses in most companies. Although it can be difficult to accurately estimate, productivity enhancements have an excellent return on investment.

## Next steps

In the [next article in this series](whitepaper-powerbi-migration-proof-of-concept.md), learn about stage three of the Power BI migration, which discusses conducting a proof of concept to mitigate risk and address unknowns as early as possible.

Other helpful resources include:

- [Microsoft's BI transformation](center-of-excellence-microsoft-business-intelligence-transformation.md)
- [Planning a Power BI enterprise deployment](https://aka.ms/PBIEnterpriseDeploymentWP)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
