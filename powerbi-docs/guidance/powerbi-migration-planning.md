---
title: "Plan deployment to migrate to Power BI"
description: "Guidance on planning for deployment when migrating to Power BI."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Plan deployment to migrate to Power BI

This article describes **Stage 2**, which is concerned with planning the migration for a single Power BI solution.

:::image type="content" source="media/powerbi-migration-planning/migrate-to-power-bi-stage-2.svg" alt-text="Diagram shows the stages of a Power BI migration. Stage 2 is emphasized for this article." border="false":::

> [!NOTE]
> For a complete explanation of the above graphic, see [Power BI migration overview](powerbi-migration-overview.md).

The focus of Stage 2 is on defining how the requirements that were defined in Stage 1 are used to migrate a solution to Power BI.

The output from Stage 2 includes as many specific decisions as possible to guide the deployment process.

Decision-making of this nature is an iterative and non-linear process. Some planning will have already occurred in the [pre-migration steps](powerbi-migration-pre-migration-steps.md). Learnings from a proof of concept (described in [Stage 3](powerbi-migration-proof-of-concept.md)) can occur in parallel with deployment planning. Even while creating the solution (described in [Stage 4](powerbi-migration-create-validate-content.md)), additional information might arise that influences deployment decisions.

> [!IMPORTANT]
> Stages 1-5 represent activities related to one specific solution. There are decisions and activities at the organizational/tenant level which impact the process at the solution level. Some of those higher-level planning activities are discussed in the [Power BI migration overview](powerbi-migration-overview.md) article. When appropriate, defer to the organizational-level decisions for efficiency and consistency.

> [!TIP]
> The topics discussed in this article also apply to a standard Power BI implementation project.

## Choose Power BI product

One of the first decisions is to choose the Power BI product. It's a decision between the [Power BI service](../fundamentals/power-bi-service-overview.md) or [Power BI Report Server](../report-server/get-started.md). Once content has been published, many additional options become available, such as embedding, mobile delivery, and email subscriptions.

> [!CAUTION]
> If you're tempted to rely on using Power BI Desktop files stored in a file system, be aware that it's not an optimal approach. Using the Power BI service (or Power BI Report Server) has significant advantages for security, content distribution, and collaboration. The ability to audit and monitor activities is also enabled by the Power BI service.

## Decide on workspace management approach

[Workspaces](../collaborate-share/service-new-workspaces.md) are a core concept of the Power BI service, which makes workspace management an important aspect of planning. Questions to ask include:

- Is a new workspace needed for this new solution?
- Will separate workspaces be needed to accommodate development, test, and production?
- Will separate workspaces be used for data and reports, or will a single workspace be sufficient? Separate workspaces have numerous advantages, especially for securing semantic models. When necessary, they can be managed separately from those users who publish reports.
- What are the security requirements for the workspace? It influences planning for [workspace roles](../collaborate-share/service-roles-new-workspaces.md). If an app will be used by content consumers, [audience permissions for the app](../collaborate-share/service-create-distribute-apps.md#create-and-manage-multiple-audiences) are managed separately from the workspace. Distinct permissions for app viewers allow additional flexibility in meeting security requirements for read-only consumers of reports or dashboards.
- Can existing groups be used for securing the new content? Both groups in Microsoft Entra ID and Microsoft 365 are supported. When aligned with existing processes, using groups makes permissions management easier than assignments to individual users.
- Are there any security considerations related to external guest users? You might need to work with your Microsoft Entra administrator and your Power BI administrator to set up [guest user access](../enterprise/service-admin-azure-ad-b2b.md).

> [!TIP]
> Consider creating a workspace for a specific business activity or project. You might be tempted to start off structuring workspaces based on your organizational structure (such as a workspace per department), but this approach frequently ends up being too broad.

## Determine how content will be consumed

It's helpful to understand how consumers of a solution prefer to view reports and dashboards. Questions to ask include:

- Will a [Power BI app](../consumer/end-user-apps.md) (which comprises reports and dashboards from a single workspace) be the best way to deliver content to consumers, or will direct access to a workspace be sufficient for content viewers?
- Will certain reports and dashboards be embedded elsewhere, such as [Teams](../collaborate-share/service-embed-report-microsoft-teams.md), [SharePoint Online](../collaborate-share/service-embed-report-spo.md), or a [secure portal or website](../collaborate-share/service-embed-secure.md)?
- Will consumers access content using [mobile devices](../consumer/mobile/mobile-apps-for-mobile-devices.md)? Requirements to deliver reports to small form factor devices will influence some [report design decisions](../create-reports/power-bi-create-mobile-optimized-report-about.md).

## Decide whether other content can be created

There are several key decisions to be made related to allowing consumers to create new content, such as:

- Will consumers be allowed to create new reports from the published semantic model? This capability can be enabled by assigning semantic model [Build permission](../connect-data/service-datasets-build-permissions.md) to a user.
- If consumers want to customize a report, can they [save a copy](../connect-data/service-datasets-copy-reports.md) of it and personalize it to meet their needs?

> [!CAUTION]
> Although the *Save a copy* capability is a nice feature, it should be used with caution when the report includes certain graphics or header/footer messages. Since logos, icons, and textual messages often relate to branding requirements or regulatory compliance, it's important to carefully control how they're delivered and distributed. If *Save a copy* is used, but the original graphics or header/footer messages remain unchanged by the new author, it can result in confusion about who actually produced the report. It can also reduce the meaningfulness of the branding.

## Evaluate needs for Premium capacity

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

Additional capabilities are available when a workspace is stored on a [Premium capacity](../enterprise/service-premium-what-is.md). Here are several reasons why workspaces on Premium capacity can be advantageous:

- Content can be accessed by consumers who don't have a Power BI Pro or Premium Per User (PPU) license.
- Support for large semantic models.
- Support for more frequent data refreshes.
- Support for using the full feature set of dataflows.
- Enterprise features, including deployment pipelines and the XMLA endpoint.

## Determine data acquisition method

The data required by a report might influence several decisions. Questions to ask include:

- Can an existing Power BI [shared semantic models](../connect-data/service-datasets-share.md) be used, or is the creation of a new Power BI semantic model appropriate for this solution?
- Does an existing shared semantic model need to be augmented with new data or measures to meet additional needs?
- Which [data storage mode](../transform-model/desktop-storage-mode.md) will be most appropriate? Options include Import, DirectQuery, Composite, or Live Connection.
- Should [aggregations](../enterprise/aggregations-auto.md) be used to enhance query performance?
- Will creation of a [dataflow](../transform-model/dataflows/dataflows-introduction-self-service.md) be useful and can it serve as a source for numerous semantic models?
- Will a new [gateway data source](../connect-data/service-gateway-data-sources.md) need to be registered?

## Decide where original content will be stored

In addition to planning the target deployment destination, it's also important to plan where the original—or source—content will be stored, such as:

- Specify an approved location for storing the original Power BI Desktop (.pbix) files. Ideally, this location is available only to people who edit the content. It should align with how security is set up in the Power BI service.
- Use a location for original Power BI Desktop files that includes versioning history or source control. Versioning permits the content author to revert to a previous file version, if necessary. OneDrive for work or school or SharePoint work well for this purpose.
- Specify an approved location for storing non-centralized source data, such as flat files or Excel files. It should be a path that any of the semantic model creators can reach without error and is backed up regularly.
- Specify an approved location for content exported from the Power BI service. The goal is to ensure that security defined in the Power BI service isn't inadvertently circumvented.

> [!IMPORTANT]
> Specifying a protected location for original Power BI Desktop files is particularly important when they contain imported data.

## Assess the level of effort

Once sufficient information is available from the requirements (which were described in [Stage 1](powerbi-migration-requirements.md)) and the solution deployment planning process, it's now possible to assess the level of effort. It's then possible to formulate a project plan with tasks, timeline, and responsibility.

> [!TIP]
> Labor costs—salaries and wages—are usually among the highest expenses in most organizations. Although it can be difficult to accurately estimate, productivity enhancements have an excellent return on investment (ROI).

## Related content

In the [next article in this Power BI migration series](powerbi-migration-proof-of-concept.md), learn about Stage 3, which is concerned with conducting a proof of concept to mitigate risk and address unknowns as early as possible when migrating to Power BI.

Other helpful resources include:

- [Microsoft's BI transformation](center-of-excellence-microsoft-business-intelligence-transformation.md)
- [Power BI implementation planning](powerbi-implementation-planning-introduction.md)
- Questions? [Try asking the Fabric Community](https://community.fabric.microsoft.com/)
- Suggestions? [Contribute ideas to improve Fabric](https://ideas.fabric.microsoft.com/)

Experienced Power BI partners are available to help your organization succeed with the migration process. To find a Power BI partner, visit the [Microsoft Power BI partners portal](https://www.microsoft.com/power-platform/products/power-bi/partners).
