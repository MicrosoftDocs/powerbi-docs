---
title: Prepare to migrate to Power BI
description: Guidance on pre-migration steps when migrating to Power BI.
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 02/27/2022
---

# Prepare to migrate to Power BI

This article describes actions you can consider prior to migrating to Power BI.

:::image type="content" source="media/powerbi-migration-pre-migration-steps/migrate-to-power-bi-preparation.svg" alt-text="Diagram shows the stages of a Power BI migration. The pre-migration steps are emphasized for this article." border="false":::

> [!NOTE]
> For a complete explanation of the above graphic, see [Power BI migration overview](powerbi-migration-overview.md).

The pre-migration steps emphasize up-front planning, which is important preparation before moving through the five migration stages. Most of the pre-migration steps will occur once, though for larger organizations some portions might be iterative for each business unit or departmental area.

The output from the pre-migration steps includes an initial [governance](fabric-adoption-roadmap-governance.md) model, initial high-level deployment planning, in addition to an inventory of the reports and data to be migrated. Additional information from activities in Stages 1, 2, and 3 will be necessary to fully estimate the level of effort for migrating individual solutions.

> [!TIP]
> Most of the topics discussed in this article also apply to a standard Power BI implementation project.

## Create cost/benefit analysis and evaluation

Several top considerations during the initial evaluation include obtaining:

- Clarity on the business case and BI strategy to reach a specific desired future state.
- Clarity on what success means, and how to measure progress and success for the migration initiative.
- Cost estimates and return on investment (ROI) calculation results.
- Successful results for several productive Power BI initiatives that are smaller in scope and complexity level.

## Identify stakeholders and executive support

Several considerations for identifying stakeholders include:

- Ensure [executive sponsorship](fabric-adoption-roadmap-executive-sponsorship.md) is in place.
- Ensure alignment with stakeholders on the business case and BI strategy.
- Include representatives from throughout the business units—even if their content is slated for migration on a later timetable—to understand their motivations and concerns.
- Involve Power BI champions early.
- Create, and follow, a communication plan with stakeholders.

> [!TIP]
> If you fear you're starting to overcommunicate, then it's probably just about right.

## Generate initial governance model

Several key items to address early in a Power BI implementation include:

- Specific goals for [adoption](fabric-adoption-roadmap.md) and where Microsoft Fabric and Power BI fit into the overall BI strategy for the organization.
- How the Fabric administrator role will be handled, particularly in decentralized organizations.
- Policies related to achieving trusted data: use of authoritative data sources, addressing data quality issues, and use of consistent terminology and common definitions.
- Security and data privacy strategy for data sources, data models, reports, and content delivery to internal and external users.
- How internal and external compliance, regulatory, and audit requirements will be met.

> [!IMPORTANT]
> The most effective governance model strives to balance user empowerment with the necessary level of control. See more information, read about [discipline at the core](center-of-excellence-microsoft-business-intelligence-transformation.md#discipline-at-the-core) and [flexibility at the edge](center-of-excellence-microsoft-business-intelligence-transformation.md#flexibility-at-the-edge).

## Conduct initial deployment planning

Initial deployment planning involves defining standards, policies, and preferences for the organization's Power BI implementation.

Note that [Stage 2](powerbi-migration-planning.md) references solution-level deployment planning. The Stage 2 activities should respect the organizational-level decisions whenever possible.

Some critical items to address early in a Power BI implementation include:

- [Power BI tenant setting](/power-bi/admin/service-admin-portal-about-tenant-settings) decisions, which should be documented.
- [Workspace management](../collaborate-share/service-new-workspaces.md) decisions, which should be documented.
- Considerations and preferences related to data and [content distribution methods](../collaborate-share/service-how-to-collaborate-distribute-dashboards-reports.md), such as apps, workspaces, sharing, subscriptions, and embedding of content.
- Preferences related to [semantic model modes](../connect-data/service-dataset-modes-understand.md)—[previously known as dataset modes](../connect-data/service-datasets-rename.md), such as use of Import mode, DirectQuery mode, or combining the two modes in a [composite model](composite-model-guidance.md).
- [Securing data and access](../enterprise/service-admin-power-bi-security.md).
- Working with [shared semantic models](../connect-data/service-datasets-share.md) for reusability.
- Applying [data certification](../collaborate-share/service-endorsement-overview.md) to promote the use of authoritative and trustworthy data.
- Use of different [report types](../create-reports/index.yml), including Power BI reports, Excel reports, or paginated reports for different use cases or business units.
- Change management approaches for managing centralized BI items and business-managed BI items.
- Training plans for consumers, data modelers, report authors, and administrators.
- Support for content authors by using [Power BI Desktop templates](../create-reports/desktop-templates.md), [custom visuals](https://powerbi.microsoft.com/blog/how-to-govern-power-bi-visuals-inside-your-organization/), and documented report design standards.
- Procedures and processes for managing user requirements, such as requesting new licenses, adding new gateway data sources, gaining permission to gateway data sources, requesting new workspaces, workspace permissions changes, and other common requirements that might be encountered on a regular basis.

> [!IMPORTANT]
> Deployment planning is an iterative process. Deployment decisions will be refined and augmented many times as your organization's experience with Power BI grows, and as Power BI evolves. The decisions made during this process will be used during the solution-level deployment planning discussed in [Stage 2](powerbi-migration-planning.md) of the migration process.

## Establish initial architecture

Your [BI solution architecture](powerbi-implementation-planning-usage-scenario-overview.md) will evolve and mature over time. Power BI setup tasks to handle right away include:

- Power BI tenant setup and integration with Microsoft Entra ID ([previously known as Azure Active Directory](/azure/active-directory/fundamentals/new-name)).
- Define [Power BI administrators](../admin/service-admin-role.md).
- Procure and assign initial [user licenses](../enterprise/service-admin-licensing-organization.md).
- Configure and review [Power BI tenant settings](/power-bi/admin/service-admin-portal-about-tenant-settings).
- Setup [workspace roles](../collaborate-share/service-roles-new-workspaces.md) and assign access to Microsoft Entra security groups and users.
- Configure an initial [data gateway](../connect-data/service-gateway-deployment-guidance.md) cluster—with a plan to update regularly.
- Procure initial [Premium capacity license](../enterprise/service-admin-premium-purchase.md) (if applicable).
- Configure [Premium capacity workloads](../enterprise/service-admin-premium-workloads.md)—with a plan to manage on an ongoing basis.

## Define success criteria for migration

The first task is to understand what success looks like for migrating an individual solution. Questions you might ask include:

- **What are the specific motivations and objectives for this migration?** For more information, see [Power BI migration overview (Consider migration reasons)](powerbi-migration-overview.md#consider-migration-reasons). This article describes the most common reasons for migrating to Power BI. Certainly, your objectives should be specified at the organizational level. Beyond that, migrating one legacy BI solution could benefit significantly from cost savings, whereas migrating a different legacy BI solution could focus on gaining workflow optimization benefits.
- **What's the expected cost/benefit or ROI for this migration?** Having a clear understanding of expectations related to cost, increased capabilities, decreased complexity, or increased agility, is helpful in measuring success. It can provide guiding principles to help with decision-making during the migration process.
- **What key performance indicators (KPIs) will be used to measure success?** The following list presents some example KPIs:
  - Number of reports rendered from legacy BI platform, decreasing month over month.
  - Number of reports rendered from Power BI, increasing month over month.
  - Number of Power BI report consumers, increasing quarter over quarter.
  - Percentage of reports migrated to production by target date.
  - Cost reduction in licensing cost year over year.

> [!TIP]
> The [Power BI activity log](../enterprise/service-admin-auditing.md) can be used as a source for measuring KPI progress.

## Prepare inventory of existing reports

Preparing an inventory of existing reports in the legacy BI platform is a critical step towards understanding what already exists. The outcome of this step is an input to assessing the migration effort level. Activities related to preparing an inventory can include:

1. **Inventory of reports:** Compile a list of reports and dashboards that are migration candidates.
2. **Inventory of data sources:** Compile a list of all data sources accessed by existing reports. It should include both enterprise data sources as well as departmental and personal data sources. This process could unearth data sources not previously known to the IT department, often referred to as *shadow IT*.
3. **Audit log:** Obtain data from the legacy BI platform audit log to understand usage patterns and assist with prioritization. Important information to obtain from the audit log includes:
    - Average number of times each report was executed per week/month/quarter.
    - Average number of consumers per report per week/month/quarter.
    - The consumers for each report, particularly reports used by executives.
    - Most recent date each report was executed.

> [!NOTE]
> In many cases, the content isn't migrated to Power BI exactly as is. The migration represents an opportunity to redesign the data architecture and/or improve report delivery. Compiling an inventory of reports is crucial to understanding what currently exists so you can begin to assess what refactoring needs to occur. The remaining articles in this series describe possible improvements in more detail.

## Explore automation options

It isn't possible to completely automate a Power BI conversion process end-to-end.

Compiling the existing inventory of data and reports is a possible candidate for automation when you have an existing tool that can do it for you. The extent to which automation can be used for some portions of the migration process—such as compiling the existing inventory—highly depends upon the tools you have.

## Next steps

In the [next article in this Power BI migration series](powerbi-migration-requirements.md), learn about Stage 1, which is concerned with gathering and prioritizing requirements when migrating to Power BI.

Other helpful resources include:

- [Microsoft's BI transformation](center-of-excellence-microsoft-business-intelligence-transformation.md)
- [Planning a Power BI enterprise deployment whitepaper](https://aka.ms/PBIEnterpriseDeploymentWP)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)

Experienced Power BI partners are available to help your organization succeed with the migration process. To engage a Power BI partner, visit the [Power BI partner portal](https://powerbi.microsoft.com/partners/).
