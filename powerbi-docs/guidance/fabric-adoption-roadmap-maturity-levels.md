---
title: "Microsoft Fabric adoption roadmap maturity levels"
description: "A description of the maturity levels used in the Microsoft Fabric adoption roadmap series of articles."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: fabric
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 11/06/2023
---

# Microsoft Fabric adoption roadmap maturity levels

[!INCLUDE [fabric-adoption-roadmap-context](includes/fabric-adoption-roadmap-context.md)]

There are three inter-related perspectives to consider when adopting an analytics technology like Microsoft Fabric.

:::image type="content" source="media/fabric-adoption-roadmap-maturity-levels/adoption-types.svg" alt-text="Diagram shows the three inter-related types of analytics adoption, which are described in the table below." border="false":::

The three types of adoption depicted in the above diagram include:

| **Type** | **Description** |
| :-: | --- |
| ![Type 1.](../media/legend-number/legend-number-01-fabric.svg) | **Organizational adoption** refers to the effectiveness of your analytics governance processes. It also refers to data management practices that support and enable analytics and business intelligence (BI) efforts. |
| ![Type 2.](../media/legend-number/legend-number-02-fabric.svg) | **User adoption** is the extent to which consumers and creators continually increase their knowledge. It's concerned with whether they're actively using analytics tools, and whether they're using them in the most effective way. |
| ![Type 3.](../media/legend-number/legend-number-03-fabric.svg) | **Solution adoption** refers to the impact and business value achieved for individual requirements and analytical solutions. |

As the four arrows in the previous diagram indicate, the three types of adoption are all strongly inter-related:

- **Solution adoption affects user adoption.** A well-designed and well-managed solution—which could be many things, such as a set of reports, a Power BI app, a semantic model ([previously known as a dataset](/power-bi/connect-data/service-datasets-rename)) or a Fabric lakehouse—impacts and guides users on how to use analytics in an optimal way.
- **User adoption impacts organizational adoption.** The patterns and practices used by individual users influence organizational adoption decisions, policies, and practices.
- **Organizational adoption influences user adoption.** Effective organizational practices—including mentoring, training, support, and community—encourage users to do the right thing in their day-to-day workflow.
- **User adoption affects solution adoption.** Stronger user adoption, because of the effective use of analytics by educated and informed users, contributes to stronger and more successful individual solutions.

The remainder of this article introduces the three types of adoption in more detail.

## Organizational adoption maturity levels

Organizational adoption measures the state of analytics governance and data management practices. There are several organizational adoption goals:

- Effectively support the community of creators, consumers, and stakeholders
- Enable and empower users
- Right-sized governance of analytics, BI, and data management activities
- Oversee information delivery via enterprise BI and self-service BI with continuous improvement cycles

It's helpful to think about organizational adoption from the perspective of a maturity model. For consistency with the [Power CAT adoption maturity model](https://powerapps.microsoft.com/blog/power-cat-adoption-maturity-model-repeatable-patterns-for-successful-power-platform-adoption/) and the [maturity model for Microsoft 365](/microsoft-365/community/microsoft365-maturity-model--intro), this Microsoft Fabric adoption roadmap aligns with the five levels from the [Capability Maturity Model](https://wikipedia.org/wiki/Capability_Maturity_Model), which were later enhanced by the Data Management Maturity (DMM) model from ISACA (note that the DMM was a paid resource that has since been retired).

Every organization has limited time, funding, and people. So, it requires them to be selective about where they prioritize their efforts. To get the most from your investment in analytics, seek to attain at least maturity level 300 or 400, as discussed below. It's common that different business units in the organization evolve and mature at different rates, so be conscious of the organizational state as well as progress for key business units.

> [!NOTE]
> Organizational adoption maturity is a long journey. It takes time, effort, and planning to progress to the higher levels.

### Maturity level 100 – Initial

Level 100 is referred to as _initial_ or _performed_. It's the starting point for new data-related investments that are new, undocumented, and without any process discipline.

Common characteristics of maturity level 100 include:

- Pockets of success and experimentation with Fabric exist in one or more areas of the organization.
- Achieving quick wins has been a priority, and solutions have been delivered with some success.
- Organic growth has led to the lack of a coordinated strategy or [governance](fabric-adoption-roadmap-governance.md) approach.
- Practices are undocumented, with significant reliance on tribal knowledge.
- There are few formal processes in place for effective data management.
- Risk exists due to a lack of awareness of how data is used throughout the organization.
- The potential for a strategic investment with analytics is acknowledged. However, there's no clear path forward for purposeful, organization-wide execution.

### Maturity level 200 – Repeatable

Level 200 is referred to as _repeatable_ or _managed_. At this point on the maturity curve, data management is planned and executed. Defined processes exist, though these processes might not apply uniformly throughout the organization.

Common characteristics of maturity level 200 include:

- Certain analytics content is now critical in importance and/or it's broadly used by the organization.
- There are attempts to document and define repeatable practices. These efforts are siloed, reactive, and deliver varying levels of success.
- There's an over-reliance on individuals having good judgment and adopting healthy habits that they learned on their own.
- Analytics adoption continues to grow organically and produces value. However, it takes place in an uncontrolled way.
- Resources for an internal community are established, such as a Teams channel or Yammer group.
- Initial planning for a consistent analytics governance strategy is underway.
- There's recognition that a [Center of Excellence (COE)](fabric-adoption-roadmap-center-of-excellence.md) can deliver value.

### Maturity level 300 – Defined

Level 300 is referred to as _defined_. At this point on the maturity curve, a set of standardized data management processes are established and consistently applied across organizational boundaries.

Common characteristics of maturity level 300 include:

- Measurable success is achieved for the effective use of analytics.
- Progress is made on the standardization of repeatable practices. However, less-than-optimal aspects could still exist due to early uncontrolled growth.
- The [COE](fabric-adoption-roadmap-center-of-excellence.md) is established. It has clear goals and scope of responsibilities.
- The internal [community of practice](fabric-adoption-roadmap-community-of-practice.md) gains traction with the participation of a growing number of users.
- [Champions](fabric-adoption-roadmap-community-of-practice.md#champions-network) emerge in the internal user community.
- Initial investments in [training](fabric-adoption-roadmap-mentoring-and-user-enablement.md#training), [documentation](fabric-adoption-roadmap-mentoring-and-user-enablement.md#documentation), and resources (such as [template files](fabric-adoption-roadmap-mentoring-and-user-enablement.md#power-bi-template-files)) are made.
- An initial [governance](fabric-adoption-roadmap-governance.md) model is in place.
- There's an active and engaged [executive sponsor](fabric-adoption-roadmap-executive-sponsorship.md).
- [Roles and responsibilities](fabric-adoption-roadmap-governance.md#roles-and-responsibilities) for all analytics stakeholders are well understood.

### Maturity level 400 – Capable

Level 400 is known as _capable_ or _measured_. At this point on the maturity curve, data is well-managed across its entire lifecycle.

Common characteristics of maturity level 400 include:

- Analytics and business intelligence efforts deliver significant value.
- Approved tools are commonly used for delivering critical content throughout the organization.
- There's an established and accepted [governance](fabric-adoption-roadmap-governance.md) model with cooperation from all key business units.
- Training, documentation, and resources are readily available for, and actively used by, the internal community of users.
- Standardized processes are in place for the oversight and monitoring of analytics usage and practices.
- The [COE](fabric-adoption-roadmap-center-of-excellence.md) includes representation from all key business units.
- A [champions network](fabric-adoption-roadmap-community-of-practice.md#champions-network) supports the internal community. The champions actively work with their colleagues as well as the COE.

### Maturity level 500 – Efficient

Level 500 is known as _efficient_ or _optimizing_ because at this point on the maturity curve, the emphasis is now on automation and continuous improvement.

Common characteristics of maturity level 500 include:

- The value of analytics solutions is prevalent in the organization. Fabric is widely accepted throughout the organization.
- Analytics skillsets are highly valued in the organization, and they're recognized by leadership.
- The internal user community is self-sustaining, with support from the COE. The community isn't over-reliant on key individuals.
- The COE reviews key performance indicators regularly to measure success of implementation and adoption goals.
- Continuous improvement is a continual priority.
- Use of automation adds value, improves productivity, or reduces risk for error.

> [!NOTE]
> The characteristics above are generalized. When considering maturity levels and designing a plan, you'll want to consider each topic or goal independently. In reality, it's probably not possible to reach level 500 maturity level for every aspect of Fabric adoption for the entire organization. So, assess maturity levels independently per goal. That way, you can prioritize your efforts where they will deliver the most value. The remainder of the articles in this Fabric adoption series present maturity levels on a per-topic basis.

Individuals—and the organization itself—continually learn, change, and improve. That means there's no formal end to adoption-related efforts. However, it's common that effort is reduced as higher maturity levels are reached.

The remainder of this article introduces the second and third types of adoption: [user adoption](#user-adoption-stages) and [solution adoption](#solution-adoption-phases).

> [!NOTE]
> The remaining articles in this series focus primarily on organizational adoption.

## User adoption stages

User adoption measures the extent to which content consumers and self-service content creators are actively and effectively using analytics tools such as Fabric. Usage statistics alone don't indicate successful user adoption. User adoption is also concerned with individual user behaviors and practices. The aim is to ensure users engage with solutions, tools, and processes in the correct way and to their fullest extent.

User adoption encompasses how consumers view content, as well as how self-service creators generate content for others to consume.

User adoption occurs on an individual user basis, but it's measured and analyzed in the aggregate. Individual users progress through the four stages of user adoption at their own pace. An individual who adopts a new technology will take some time to achieve proficiency. Some users will be eager; others will be reluctant to learn yet another tool, regardless of the promised productivity improvements. Advancing through the user adoption stages involves time and effort, and it involves behavioral changes to become aligned with organizational adoption objectives. The extent to which the organization supports users advancing through the user adoption stages has a direct correlation to the organizational-level adoption maturity.

### User adoption stage 1 – Awareness

Common characteristics of stage 1 user adoption include:

- An individual has heard of, or been initially exposed to, analytics in some way.
- An individual might have access to a tool, such as Fabric, but isn't yet actively using it.

### User adoption stage 2 – Understanding

Common characteristics of stage 2 user adoption include:

- An individual develops understanding of the benefits of analytics and how it can support decision-making.
- An individual shows interest and starts to use analytics tools.

### User adoption stage 3 – Momentum

Common characteristics of stage 3 user adoption include:

- An individual actively gains analytics skills by attending formal training, self-directed learning, or experimentation.
- An individual gains basic competency by using or creating analytics relevant to their role.

### User adoption stage 4 – Proficiency

Common characteristics of stage 4 user adoption include:

- An individual actively uses analytics regularly.
- An individual understands how to use analytic tools in the way in which they were intended, as relevant for their role.
- An individual modifies their behavior and activities to align with organizational governance processes.
- An individual's willingness to support organizational processes and change efforts is growing over time, and they become an advocate for analytics in the organization.
- An individual makes the effort to continually improve their skills and stay current with new product capabilities and features.

It's easy to underestimate the effort it takes to progress from stage 2 (understanding) to stage 4 (proficiency). Typically, it takes the longest time to progress from stage 3 (momentum) to stage 4 (proficiency).

> [!IMPORTANT]
> By the time a user reaches the momentum and proficiency stages, the organization needs to be ready to support them in their efforts. You can consider some proactive efforts to encourage users to progress through stages. For more information, see the [community of practice](fabric-adoption-roadmap-community-of-practice.md) and the [user support](fabric-adoption-roadmap-user-support.md) articles.

## Solution adoption phases

Solution adoption is concerned with measuring the impact of content that's been deployed. It's also concerned with the level of value solutions provide. The scope for evaluating solution adoption is for one set of requirements, like a set of reports, a lakehouse, or a single Power BI app.

> [!NOTE]
> In this series of articles, _content_ is synonymous with _solution_.

As a solution progresses to phases 3 or 4, expectations to operationalize the solution are higher.

> [!TIP]
> The importance of scope on expectations for governance is described in the [content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md) article. That concept is closely related to this topic, but this article approaches it from a different angle. It considers when you already have a solution that is operationalized and distributed to many users. That doesn't immediately equate to phase 4 solution adoption, as the concept of solution adoption focuses on how much value the content delivers.

### Solution phase 1 – Exploration

Common characteristics of phase 1 solution adoption include:

- Exploration and experimentation are the main approaches to testing out new ideas. Exploration of new ideas can occur through informal self-service efforts, or through a formal proof of concept (POC), which is purposely narrow in scope. The goal is to confirm requirements, validate assumptions, address unknowns, and mitigate risks.
- A small group of users test the proof of concept solution and provide useful feedback.
- For simplicity, all exploration—and initial feedback—could occur within local user tools (such as Power BI Desktop or Excel) or within a single Fabric workspace.

### Solution phase 2 – Functional

Common characteristics of phase 2 solution adoption include:

- The solution is functional and meets the basic set of user requirements. There are likely plans to iterate on improvements and enhancements.
- The solution is deployed to the Fabric portal.
- All necessary supporting components are in place (for example, a gateway to support scheduled data refresh).
- Target users are aware of the solution and show interest in using it. Potentially, it could be a limited preview release, and might not yet be ready to promote to a production [workspace](/power-bi/collaborate-share/service-create-the-new-workspaces).

### Solution phase 3 – Valuable

Common characteristics of phase 3 solution adoption include:

- Target users find the solution to be valuable and experience tangible benefits.
- The solution is promoted to a production [workspace](/power-bi/collaborate-share/service-create-the-new-workspaces) that's managed, secured, and audited.
- Validations and testing occur to ensure data quality, accurate presentation, accessibility, and acceptable performance.
- Content is [endorsed](/power-bi/collaborate-share/service-endorse-content), when appropriate.
- Usage metrics for the solution are actively monitored.
- User feedback loops are in place to facilitate suggestions and improvements that can contribute to future releases.
- Solution documentation is generated to support the needs of information consumers (such as data sources used or how metrics are calculated). The documentation helps future content creators (for example, for documenting any future maintenance or planned enhancements).
- Ownership and subject matter experts for the content are clear.
- Report branding and theming are in place and in line with governance guidelines.

### Solution phase 4 – Essential

Common characteristics of phase 4 solution adoption include:

- Target users actively and routinely use the solution, and it's considered essential for decision-making purposes.
- The solution resides in a [production workspace](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines) well separated from development and test content. [Change management](fabric-adoption-roadmap-change-management.md) and release management are carefully controlled due to the impact of changes.
- A subset of users regularly provides feedback to ensure the solution continues to meet evolving requirements.
- Expectations for the success of the solution are clear and are measured.
- Expectations for support of the solution are clear, especially if there are service level agreements.
- The solution aligns with organizational [governance](fabric-adoption-roadmap-governance.md) guidelines and practices.
- Most content is [certified](/power-bi/collaborate-share/service-endorse-content) due to its critical nature.
- Formal user acceptance testing for new changes might occur, particularly for IT-managed content.

## Related content

In the [next article](fabric-adoption-roadmap-data-culture.md) in the Microsoft Fabric adoption roadmap series, learn about the organizational data culture and its impact on adoption efforts.
