---
title: "Power BI implementation planning: Organization-level information protection"
description: "Learn about getting started with information protection with organization-level planning activities for Power BI."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Power BI implementation planning: Organization-level information protection

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article describes the initial assessment and preparatory activities for information protection in Power BI. It's targeted at:

- **Power BI administrators**: The administrators who are responsible for overseeing Power BI in the organization. Power BI administrators need to collaborate with information security and other relevant teams.
- **Center of Excellence, IT, and BI teams**: The teams that are responsible for overseeing Power BI in the organization. They might need to collaborate with Power BI administrator, information security teams, and other relevant teams.

> [!IMPORTANT]
> Information protection and data loss prevention (DLP) is a significant organization-wide undertaking. Its scope and impact are far greater than Power BI alone. This type of initiative requires funding, prioritization, and planning. Expect to involve several cross-functional teams in your planning, usage, and oversight efforts.

## Current state assessment

Before you get started with any setup activities, assess what's currently happening within your organization. It's critical to understand the extent to which information protection is currently implemented (or being planned).

Generally, there are two cases of sensitivity label use.

- **Sensitivity labels are currently in use**: In this case, sensitivity labels are set up and used to classify Microsoft Office files. In this situation, the amount of work that will be required to use sensitivity labels for Power BI will be significantly lower. The timeline will be shorter, and it will be more straightforward to set up quickly.
- **Sensitivity labels not yet in use**: In this case, sensitivity labels aren't used for Microsoft Office files. In this situation, an organization-wide project to implement sensitivity labels will be required. For some organizations, this project can represent a significant amount of work and a considerable time investment. That's because labels are intended to be used across the organization by various applications (rather than one application, such as Power BI).

The following diagram shows how sensitivity labels are used broadly across the organization.

:::image type="content" source="media/powerbi-implementation-planning-organization-level-info-protection/sensitivity-label-usage-across-the-organization.svg" alt-text="Diagram shows how sensitivity labels are used. Items in the diagram are described in the table below." border="false":::

The above diagram depicts the following items:

| Item | Description |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Sensitivity labels are set up in the Microsoft Purview compliance portal. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | Sensitivity labels can be applied to many types of items and files, such as Microsoft Office files, items in the Power BI service, Power BI Desktop files, and emails. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Sensitivity labels can be applied for Teams sites, SharePoint sites, and Microsoft 365 groups. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Sensitivity labels can be applied to schematized data assets that are registered in the Microsoft Purview Data Map. |

In the diagram, notice that items in the Power BI service, and Power BI Desktop files, are just some of many resources that allow assigning sensitivity labels. Sensitivity labels are defined centrally in Microsoft Purview Information Protection. Once defined, the same labels are used by all supported applications throughout the organization. It's not possible to define labels for use in only one application, such as Power BI. Therefore, your planning process needs to consider a broader set of usage scenarios to define labels that can be used in multiple contexts. Because information protection is intended to be used consistently across applications and services, it's critical to begin with assessing what sensitivity labels are currently in place.

The activities for implementing sensitivity labels are described in the [Information protection for Power BI](powerbi-implementation-planning-info-protection.md) article.

> [!NOTE]
> Sensitivity labels are the first building block towards implementing information protection. DLP occurs after information protection is set up.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When assessing the current state of information protection and DLP in your organization, key decisions and actions include:

> [!div class="checklist"]
> - **Determine whether information protection is currently in use**: Find out what capabilities are currently enabled, how they're being used, by which applications, and by whom.
> - **Identify who is currently responsible for information protection**: While assessing the current capabilities, determine who is currently responsible. Involve that team in all activities going forward.
> - **Consolidate information protection projects**: If applicable, combine the information protection methods currently in use. If possible, consolidate projects and teams to gain efficiency and consistency.

## Team staffing

As previously stated, many of the information protection and DLP capabilities that will be set up will have an impact across the entire organization (well beyond Power BI). That's why it's critical to assemble a team that includes all relevant people. The team will be crucial in defining the goals (described in the next section) and guiding the overall effort.

As you define roles and responsibilities for your team, we recommend that you include people who can capably translate requirements and communicate well with stakeholders.

Your team should include pertinent stakeholders involving different individuals and groups in the organization, including:

- Chief information security officer / data protection officer
- Information security / cyber security team
- Legal
- Compliance
- Risk management
- Enterprise data governance committee
- Chief data officer / chief analytics officer
- Internal audit team
- Analytics Center of Excellence (COE)
- Enterprise analytics / business intelligence (BI) team
- Data stewards and domain data owners from key business units

Your team should also include the following system administrators:

- Microsoft Purview administrator
- Microsoft 365 administrator
- Microsoft Entra ID administrator
- Defender for Cloud Apps administrator
- Power BI administrator

> [!TIP]
> Expect the planning and implementation of information protection to be a collaborative effort that will take time to get right.

The task of planning and implementing information protection is usually a part-time responsibility for most people. It's typically one of many pressing priorities. Therefore, having an executive sponsor will help to clarify priorities, set deadlines, and provide strategic guidance.

Clarity on roles and responsibilities is necessary to avoid misunderstandings and delays when working with cross-functional teams across organizational boundaries.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When putting together your information protection team, key decisions and actions include:

> [!div class="checklist"]
> - **Assemble the team**: Involve all pertinent technical and non-technical stakeholders.
> - **Determine who the executive sponsor is**: Ensure you're clear on who is the leader of the planning and implementation effort. Involve this person (or group) for prioritization, funding, reaching consensus, and decision-making.
> - **Clarify roles and responsibilities**: Make sure everyone involved is clear on their role and responsibilities.
> - **Create a communication plan**: Consider how and when you'll communicate with users throughout the organization.

## Goals and requirements

It's important to consider what your goals are for implementing information protection and DLP. Different stakeholders from the team you've assembled are likely to have different viewpoints and areas of concern.

At this point, we recommend that you focus on the strategic goals. If your team has started by defining implementation level details, we suggest that you step back and define the strategic goals. Well-defined strategic goals will help you to deliver a smoother implementation.

Your information protection and DLP requirements might include the following goals.

- **Self-service user enablement**: Allow self-service BI content creators and owners to collaborate, share, and be as productive as possible–all within the guardrails established by the governance team. The goal is to balance self-service BI with centralized BI and make it easy for self-service users to do the right thing, without negatively impacting their productivity.
- **Data culture that values protecting trusted data**: Implement information protection in a way that's low friction and doesn't get in the way of user productivity. When implemented in a balanced way, users are far more likely to work within your systems than around them. User education and user support are essential.
- **Risk reduction**: Protect the organization by reducing its risks. Risk reduction goals often include minimizing the possibility of data leakage outside of the organization and protecting data against unauthorized access.
- **Compliance**: Support compliance efforts for industry, regional, and governmental regulations. Additionally, your organization might also have internal governance and security requirements that are deemed critical.
- **Auditability and awareness**: Understand where the sensitive data is located throughout the organization and who's using it.

Be aware that an initiative to introduce information protection is complementary to other related approaches that involve security and privacy. Coordinate information protection initiatives with other efforts, such as:

- Access roles, permissions, sharing, and row-level security (RLS) for Power BI content
- Data residency requirements
- Network security requirements
- Data encryption requirements
- Data cataloging initiatives

For more information about securing content in Power BI, see the [security planning](powerbi-implementation-planning-security-overview.md) articles.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering your information protection goals, key decisions and actions include:

> [!div class="checklist"]
> - **Identify applicable data privacy regulations and risks**: Ensure that your team is aware of the data privacy regulations that your organization is subject to for your industry or geographic region. If necessary, conduct a data privacy risk assessment.
> - **Discuss and clarify your goals**: Have initial discussions with relevant stakeholders and interested people. Make sure you're clear on your information protection strategic goals. Ensure that you can translate these goals into business requirements.
> - **Approve, document, and prioritize your goals**: Ensure that your strategic goals are documented and prioritized. When you need to make complex decisions, prioritize, or make trade-offs, refer to these goals.
> - **Verify and document regulatory and business requirements**: Ensure that all regulatory and business requirements for data privacy are documented. Refer to them for prioritization and compliance needs.
> - **Begin creating a plan**: Start building a project plan by using the prioritized strategic goals and documented requirements.

## Related content

In the [next article in this series](powerbi-implementation-planning-info-protection.md), learn about labeling and classification of data assets for use with Power BI.
