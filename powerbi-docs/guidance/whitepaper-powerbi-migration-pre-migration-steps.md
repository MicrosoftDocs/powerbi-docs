---
title: Pre-migration steps to migrate to Power BI
description: Guidance on pre-migration steps when migrating to Power BI.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 08/06/2020
ms.author: v-pemyer
---

# Pre-migration steps to migrate to Power BI

This article discusses some actions you may consider prior to beginning a project to migrate content from a legacy platform to Power BI. Also, review the suggestions for Power BI migration success, which were discussed in the [Power BI migration overview](whitepaper-powerbi-migration-overview.md) article.

:::image type="content" source="media/whitepaper-powerbi-migration-pre-migration-steps/migrate-to-powerbi-pre-migration-steps.png" alt-text="Image showing the stages of a Power BI migration. The pre-migration steps are emphasized for this article.":::

For a complete explanation of the above graphic, see [Power BI migration overview](whitepaper-powerbi-migration-overview.md).

The pre-migration steps emphasize up-front planning, which will be important to the five stages of migration. Most of the pre-migration steps will occur once, though for larger organizations some portions may be iterative for each business unit or departmental area.

The output from the pre-migration steps includes an initial governance model, initial high-level deployment planning, as well as an inventory of the reports and data to be migrated. Additional information from activities in stages one, two, and three will be necessary to fully estimate the level of effort for migrating individual solutions.

> [!TIP]
> Most of the topics discussed in this article also apply to a standard Power BI implementation project.

## Create Power BI cost/benefit analysis and evaluation

A few of the top considerations during the initial evaluation include obtaining:

- Clarity on the business case and BI strategy to reach a specific desired future state
- Clarity on what success means and how to measure progress and success for the migration initiative
- Cost estimates and return on investment (ROI) calculations
- Successful results for several productive Power BI initiatives that are smaller in scope and complexity level

## Identify stakeholders and executive support

A few considerations for identifying stakeholders include:

- Ensure alignment with stakeholders on the business case and BI strategy
- Include representatives from throughout the business units, even if their content is slated to be migrated on a later timetable, to understand their motivations and concerns
- Involve Power BI champions early
- Create, and follow, a communication plan with stakeholders

> [!TIP]
> If you fear you are overcommunicating, then it is probably just about right.

## Generate initial Power BI governance model

Several key items to address early in a Power BI implementation include:

- Specific goals for adoption of Power BI and where Power BI fits into the overall BI strategy for the organization
- How the Power BI administrator role will be handled, particularly in decentralized organizations
- Policies related to achieving trusted data: use of authoritative data sources, addressing data quality issues, and use of consistent terminology and common definitions
- Security and data privacy strategy for data sources, data models, reports, and content delivery to internal and external users
- How internal and external compliance and regulatory and audit requirements will be met

> [!IMPORTANT]
> The most effective governance model strives to balance user empowerment with the necessary level of control. See the discussion about [discipline at the core](center-of-excellence-microsoft-business-intelligence-transformation.md#discipline-at-the-core) and [flexibility at the edge](center-of-excellence-microsoft-business-intelligence-transformation.md#flexibility-at-the-edge) for some ideas.

## Conduct initial Power BI deployment planning

The initial deployment planning includes defining standards, policies, and preferences for the organization's Power BI implementation.

Note that [stage two](whitepaper-powerbi-migration-planning.md) references solution-level deployment planning. The stage two activities should respect these organizational-level decisions whenever possible.

Some of the critical items to address early in a Power BI implementation consist of:

- [Tenant admin setting](admin-tenant-settings.md) decisions made and documented
- [Workspace management](../collaborate-share/service-new-workspaces.md) decisions made and documented
- Considerations and preferences related to data and [content distribution methods](../collaborate-share/service-how-to-collaborate-distribute-dashboards-reports.md) to be used (such as apps, workspaces, sharing, subscriptions, and embedding of content)
- Preferences related to [dataset modes](../connect-data/service-dataset-modes-understand.md) (such as use of import mode versus issuing queries to a data source)
- Plan for [securing data and access](../admin/service-admin-power-bi-security.md)
- Considerations for use of [shared datasets](../connect-data/service-datasets-share.md) for reusability
- Plan for the [data certification process that facilitates use of authoritative and trustworthy data
- Considerations related to different [report types](../create-reports/index.yml) (such as preferences for use of Power BI reports, Excel reports, or paginated reports for different use cases or business units)
- Change management approaches for managing centralized BI artifacts and business-managed BI artifacts
- Training plans for consumers, data modelers, report creators, and administrators
- Plan for providing resources to assist content creators such as [templates](../create-reports/desktop-templates.md), [custom visuals](https://powerbi.microsoft.com/blog/how-to-govern-power-bi-visuals-inside-your-organization/), and report design standards
- Plan for establishing user support and user documentation for key things such as requesting new licenses, adding a new gateway data source, gaining permission to a gateway data source, requesting a new workspace, workspace permissions change, and other common situations that will be encountered on a regular basis.

> [!IMPORTANT]
> Deployment planning is an iterative process. These types of decisions will be refined and augmented many times as your organization's experience with Power BI grows, and as the Power BI product evolves. The decisions made during this process will be used during the solution-level deployment planning discussed in [stage two](whitepaper-powerbi-migration-planning.md) of the migration process.

## Establish initial Power BI architecture

Your [BI solution architecture](center-of-excellence-business-intelligence-solution-architecture.md) will evolve and mature over time. The top setup tasks to handle right away include:

- Power BI tenant is active and integrated with Azure Active Directory
- [Power BI administrators](../admin/service-admin-role.md) are defined
- Initial [user licenses](../admin/service-admin-licensing-organization.md) are procured and assigned
- [Tenant admin settings](admin-tenant-settings.md) are all reviewed and configured correctly
- [Workspace roles](../collaborate-share/service-new-workspaces.md#roles-in-the-new-workspaces) are set up and aligned to Azure AD security groups and users
- Initial [data gateway](../connect-data/service-gateway-deployment-guidance.md) cluster is configured (with a plan to update regularly)
- Initial [Premium capacity license](../admin/service-admin-premium-purchase.md) is procured (if applicable)
- [Premium capacity workloads](../admin/service-admin-premium-workloads.md) are configured (with a plan to manage on an ongoing basis)

## Define success criteria for migration

The first task is understanding what success looks like for migrating this individual solution. The top questions you may ask include:

**What are the specific motivations and objectives for this migration**? See [Power BI migration overview](whitepaper-powerbi-migration-overview.md) for the most common reasons for migrating to Power BI. Certainly, objectives should have been specified at the organizational level. Beyond that, one solution being migrated may benefit significantly from cost savings, whereas another solution being migrated may focus on gaining workflow optimization benefits.

**What is the expected cost/benefit or return on investment for this migration**? Having a clear understanding of expectations related to cost, increased capabilities, decreased complexity, or increased agility, is helpful in measuring success. Secondarily, it can provide guiding principles to help with decision-making during the migration process.

**What key performance indicators (KPIs) will be used to measure success**? Example KPIs that may be useful:

- \# of reports rendered from legacy system decreasing month over month
- \# of reports rendered from Power BI increasing month over month
- \# of Power BI report consumers increasing quarter over quarter
- % of reports migrated to production by target date
- $ reduction in licensing cost year over year

> [!TIP]
> The [Power BI activity log](../admin/service-admin-auditing.md) can be used as a source for measuring KPI progress.

## Assemble inventory of existing reports

Preparing an inventory of existing reports in the legacy platform is a critical step towards understanding what already exists and beginning to assess the migration effort level. The top few activities related to preparing an inventory include:

1. **Inventory of reports.** Compile a list of reports and dashboards that are candidates to be migrated.
2. **Inventory of data sources.** Compile a list of all the data sources that are currently being accessed by the existing reports. It includes both enterprise data sources as well as departmental and personal sources. This process may unearth data sources not previously known to the IT department (often referred to as shadow IT).
3. **Audit log.** Obtain data from the legacy BI system audit log to understand usage patterns and assist with prioritization. The most important information to obtain from the audit log includes:
    - Average number of times each report was executed, per week/month/quarter
    - Average number of consumers per report, per week/month/quarter
    - Who the consumers are for each report, particularly those used by executives
    - Most recent date each report was executed

> [!NOTE]
> In many cases, the content is not migrated to Power BI exactly as-is. The migration represents an opportunity to redesign the data architecture and/or improve report delivery. Compiling an inventory is crucial for understanding what currently exists so you can begin to assess what refactoring should occur. The remaining sections of this series discuss possible improvements in further detail.

## Explore automation options

It is not possible to completely automate a Power BI conversion process end-to-end.

Compiling the existing inventory of data and reports is a possible candidate for automation if you have an existing tool that can do it for you. The extent to which automation can be used for some portions of the migration process (such as compiling the existing inventory) highly depends upon the tools you currently have.

## Next steps

In the [next article in this series](whitepaper-powerbi-migration-requirements.md), learn about stage one, which focuses on requirements gathering and prioritization for migrating each solution that is being migrated to Power BI.

Other helpful resources include:

- [Microsoft's BI transformation](center-of-excellence-microsoft-business-intelligence-transformation.md)
- [Planning a Power BI enterprise deployment](https://aka.ms/PBIEnterpriseDeploymentWP)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
