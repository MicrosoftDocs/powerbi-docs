---
title: "Microsoft Fabric adoption roadmap: Center of Excellence"
description: "Establish a Center of Excellence (COE) to drive strong and successful adoption of Microsoft Fabric."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: fabric
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 11/06/2023
---

# Microsoft Fabric adoption roadmap: Center of Excellence

[!INCLUDE [fabric-adoption-roadmap-context](includes/fabric-adoption-roadmap-context.md)]

A data or analytics Center of Excellence (COE) is an internal team of technical and business experts. The team actively assists others within the organization who are working with data. The COE forms the nucleus of the broader community to advance adoption goals, which align with the data culture vision.

A COE might also be known as _competency center_, _capability center_, or a _center of expertise_. Some organizations use the term _squad_. Many organizations perform the COE responsibilities within their data, analytics, or business intelligence (BI) team.

> [!NOTE]
> Having a COE team formally recognized in your organizational chart is recommended, but not required. What's most important is that the COE roles and responsibilities are identified, prioritized, and assigned. It's common for a centralized data or analytics team to take on many of the COE responsibilities; some responsibilities might also reside within IT. For simplicity, in this series of articles, COE means a _specific group of people_, although you might implement it differently. It's also very common to implement the COE with a scope broader than Fabric or Power BI alone: for instance, a Power Platform COE, a data COE, or an analytics COE.

## Goals for a COE

Goals for a COE include:

- Evangelizing a data-driven culture.
- Promoting the adoption of analytics.
- Nurturing, mentoring, guiding, and educating internal users to increase their skills and level of self-reliance.
- Coordinating efforts and disseminating knowledge across organizational boundaries.
- Creating consistency and transparency for the user community, which reduces friction and pain points related to finding relevant data and analytics content.
- Maximizing the benefits of self-service BI, while reducing the risks.
- Reducing technical debt by helping users make good decisions that increase consistency and result in fewer inefficiencies.

> [!IMPORTANT]
> One of the most powerful aspects of a COE is the cross-departmental insight into how analytics tools like Fabric are used by the organization. This insight can reveal which practices work well and which don't, that can facilitate a bottom-up approach to governance. A primary goal of the COE is to learn which practices work well, share that knowledge more broadly, and replicate best practices across the organization.

## Scope of COE responsibilities

The scope of COE responsibilities can vary significantly between organizations. In a way, a COE can be thought of as a consultancy service because its members routinely provide expert advice to the internal community of users. To varying degrees, most COEs handle hands-on work too.

Common COE responsibilities include:

- Mentoring and facilitating [knowledge sharing](fabric-adoption-roadmap-community-of-practice.md#knowledge-sharing) within the internal Fabric community.
- Holding [office hours](fabric-adoption-roadmap-mentoring-and-user-enablement.md#office-hours) to engage with the internal Fabric community.
- Conducting [co-development projects](fabric-adoption-roadmap-mentoring-and-user-enablement.md#co-development-projects) and [best practices reviews](fabric-adoption-roadmap-mentoring-and-user-enablement.md#best-practices-reviews) in order to actively help business units deliver solutions.
- Managing the [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal).
- Producing, curating, and promoting [training materials](fabric-adoption-roadmap-mentoring-and-user-enablement.md#training).
- Creating [documentation](fabric-adoption-roadmap-mentoring-and-user-enablement.md#documentation) and other resources, such as [template files](fabric-adoption-roadmap-mentoring-and-user-enablement.md#power-bi-template-files), to encourage consistent use of standards and best practices.
- Applying, communicating, and assisting with [governance](fabric-adoption-roadmap-governance.md) guidelines.
- Handling and assisting with [system oversight](fabric-adoption-roadmap-system-oversight.md) and Fabric administration.
- Responding to [user support](fabric-adoption-roadmap-user-support.md) issues escalated from the help desk.
- Developing solutions and/or proofs of concept.
- Establishing and maintaining the BI platform and data architecture.
- [Communicating](fabric-adoption-roadmap-community-of-practice.md#communication-plan) regularly with the internal community of users.

## Staffing a COE

People who are good candidates as COE members tend to be those who:

- Understand the analytics vision for the organization.
- Have a desire to continually improve analytics practices for the organization.
- Have a deep interest in, and expertise with, analytics tools such as Fabric.
- Are interested in seeing Fabric used effectively and adopted successfully throughout the organization.
- Take the initiative to continually learn, adapt, and grow.
- Readily share their knowledge with others.
- Are interested in repeatable processes, standardization, and governance with a focus on user enablement.
- Are hyper-focused on collaboration with others.
- Are comfortable working in an agile fashion.
- Have an inherent interest in being involved and helping others.
- Can effectively translate business needs into solutions.
- Communicate well with both technical and business colleagues.

> [!TIP]
> If you have self-service content creators in your organization who constantly push the boundaries of what can be done, they might be a great candidate to become a recognized [champion](fabric-adoption-roadmap-community-of-practice.md#rewarding-champions), or perhaps even a satellite member of the COE.

When recruiting for the COE, it's important to have a mix of complementary analytical skills, technical skills, and business skills.

## Roles and responsibilities

Very generalized roles within a COE are listed below. It's common for multiple people to overlap roles, which is useful from a backup and cross-training perspective. It's also common for the same person to serve multiple roles. For instance, most COE members also serve as a coach or mentor.

| **Role** | **Description** |
| --- | --- |
| COE leader | Manages the day-to-day operations of the COE. Interacts with the executive sponsor and other organizational teams, such as the data governance board, as necessary. For an overview of additional roles and responsibilities, see the [Governance](fabric-adoption-roadmap-governance.md#roles-and-responsibilities) article. |
| Coach | Coaches and educates others on data and BI skills via [office hours](fabric-adoption-roadmap-mentoring-and-user-enablement.md#office-hours) (community engagement), [best practices reviews](fabric-adoption-roadmap-mentoring-and-user-enablement.md#best-practices-reviews), or [co-development projects](fabric-adoption-roadmap-mentoring-and-user-enablement.md#co-development-projects). Oversees and participates in the discussion channel of the internal community. Interacts with, and supports, the [champions network](fabric-adoption-roadmap-community-of-practice.md#champions-network). |
| Trainer | Develops, curates, and delivers internal training materials, documentation, and resources. |
| Data analyst | Domain-specific subject matter expert. Acts as a liaison between the COE and the business unit. Content creator for the business unit. Assists with content certification. Works on co-development projects and proofs of concept. |
| Data modeler | Creates and manages data assets (such as shared semantic model—[previously known as a dataset](/power-bi/connect-data/service-datasets-rename)—and dataflows) to support other self-service content creators. |
| Report creator | Creates and publishes reports, dashboards, and metrics. |
| Data engineer | Plans for deployment and architecture, including integration with other services and data platforms. Publishes data assets which are utilized broadly across the organization (such as a lakehouse, data warehouse, data pipeline, dataflow, or semantic model). |
| User support | Assists with the resolution of data discrepancies and escalated help desk support issues. |

As mentioned previously, the scope of responsibilities for a COE can vary significantly between organizations. Therefore, the roles found for COE members can vary too.

## Structuring a COE

The selected COE structure can vary among organizations. It's also possible for multiple structures to exist inside of a single large organization. That's particularly true when there are subsidiaries or when acquisitions have occurred.

> [!NOTE]
> The following terms might differ to those defined for your organization, particularly the meaning of _federated_, which tends to have many different IT-related meanings.

### Centralized COE

A centralized COE comprises a single shared services team.

**Pros:**

- There's a single point of accountability for a single team that manages standards, best practices, and delivery end-to-end.
- The COE is one group from an organizational chart perspective.
- It's easy to start with this approach and then evolve to the unified or federated model over time.

**Cons:**

- A centralized team might have an authoritarian tendency to favor one-size-fits-all decisions that don't always work well for all business units.
- There can be a tendency to prefer IT skills over business skills.
- Due to the centralized nature, it might be more difficult for the COE members to sufficiently understand the needs of all business units.

### Unified COE

A unified COE is a single, centralized, shared services team that has been expanded to include embedded team members. The embedded team members are dedicated to supporting a specific functional area or business unit.

**Pros:**

- There's a single point of accountability for a single team that includes cross-functional involvement from the embedded COE team members. The embedded COE team members are assigned to various areas of the business.
- The COE is one group from an organizational chart perspective.
- The COE understands the needs of business units more deeply due to dedicated members with domain expertise.

**Cons:**

- The embedded COE team members, who are dedicated to a specific business unit, have a different organizational chart responsibility than the people they serve directly within the business unit. The organizational structure could potentially lead to complications, differences in priorities, or necessitate the involvement of the executive sponsor. Preferably, the executive sponsor has a scope of authority that includes the COE and all involved business units to help resolve conflicts.

### Federated COE

A federated COE comprises a shared services team (the core COE members) plus satellite members from each functional area or major business unit. A federated team works in coordination, even though its members reside in different business units. Typically, satellite members are primarily focused on development activities to support their business unit while the shared services personnel support the entire community.

**Pros:**

- There's cross-functional involvement from satellite COE members who represent their specific functional area and have domain expertise.
- There's a balance of centralized and decentralized representation across the core and satellite COE members.
- When distributed data ownership situations exist—as could be the case when business units take direct responsibility for data management activities—this model is effective.

**Cons:**

- Since core and satellite members span organizational boundaries, the federated COE approach requires strong leadership, excellent communication, robust project management, and ultra-clear expectations.
- There's a higher risk of encountering competing priorities due to the federated structure.
- This approach typically involves part-time people and/or _dotted line_ organizational chart accountability that can introduce competing time pressures.

> [!TIP]
> Some organizations have success by using a _rotational program_. It involves federated members joining the core COE for a period of time, such as six months. This type of program allows federated members to learn best practices and understand more deeply how and why things are done. Although each federated member remains focused on their specific business unit, they gain a deeper understanding of the organization's challenges. This deeper understanding leads to a more productive partnership over time.

### Decentralized COE

Decentralized COEs are independently managed by business units.

**Pros:**

- A specialized data culture exists that's focused on the business unit, making it easier to learn quickly and adapt.
- Policies and practices are tailored to each business unit.
- Agility, flexibility, and priorities are focused on the individual business unit.

**Cons:**

- There's a risk that decentralized COEs operate in isolation. As a result, they might not share best practices and lessons learned outside of their business unit.
- Collaboration with a centralized team might be informal and/or inconsistent.
- Inconsistent policies are created and applied across business units.
- It's difficult to scale a decentralized model.
- There's potential rework to bring one or more decentralized COEs in alignment with organizational-wide policies.
- Larger business units with significant funding might have more resources available to them, which might not serve cost optimization goals from an organizational-wide perspective.

> [!IMPORTANT]
> A highly centralized COE tends to be more _authoritarian_, while highly decentralized COEs tend to be more _siloed_. Each organization will need to weigh the pros and cons that apply to them to determine the best choice. For most organizations, the most effective approach tends to be the unified or federated, which bridges organizational boundaries.

## Funding the COE

The COE might obtain its operating budget in multiple ways:

- Cost center.
- Profit center with project budget(s).
- A combination of cost center and profit center.

When the COE operates as a cost center, it absorbs the operating costs. Generally, it involves an approved annual budget. Sometimes this is called a _push_ engagement model.

When the COE operates as a profit center (for at least part of its budget), it could accept projects throughout the year based on funding from other business units. Sometimes this is called a _pull_ engagement model.

Funding is important because it impacts the way the COE communicates and engages with the internal community. As the COE experiences more and more successes, they might receive more requests from business units for help. It's especially the case as awareness grows throughout the organization.

> [!TIP]
> The choice of funding model can determine how the COE actively grows its influence and ability to help. The funding model can also have a big impact on where authority resides and how decision-making works. Further, it impacts the types of services a COE can offer, such as co-development projects and/or best practices reviews. For more information, see the [Mentoring and user enablement](fabric-adoption-roadmap-mentoring-and-user-enablement.md) article.

Some organizations cover the COE operating costs with chargebacks to business units based on the usage goals of Fabric. For a shared capacity, this could be based on number of active users. For Premium capacity, chargebacks could be allocated based on which business units are using the capacity. Ideally, chargebacks are directly correlated to the business value gained.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

## Considerations and key actions

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - Considerations and key actions you can take to establish or improve your COE.

> [!div class="checklist"]
> - **Define the scope of responsibilities for the COE:** Ensure that you're clear on what activities the COE can support. Once the scope of responsibilities is known, identify the skills and competencies required to fulfill those responsibilities.
> - **Identify gaps in the ability to execute:** Analyze whether the COE has the required systems and infrastructure in place to meet its goals and scope of responsibilities.
> - **Determine the best COE structure:** Identify which COE structure is most appropriate (centralized, unified, federated, or decentralized). Verify that staffing, roles and responsibilities, and appropriate organizational chart relationships (HR reporting) are in place.
> - **Plan for future growth:** If you're starting out with a centralized or decentralized COE, consider how you will scale the COE over time by using the unified or federated approach. Plan for any actions that you can take now that'll facilitate future growth.
> - **Identify customers:** Identify the internal community members, and any external customers, to be served by the COE. Decide how the COE will generally engage with those customers, whether it's a push model, pull model, or both models.
> - **Verify the funding model for the COE:** Decide whether the COE is purely a cost center with an operating budget, whether it will operate partially as a profit center, and/or whether chargebacks to other business units will be required.
> - **Create a communication plan:** Create you [communications strategy](fabric-adoption-roadmap-governance.md#governance-planning) to educate the internal community of users about the services the COE offers, and how to engage with the COE.
> - **Create goals and metrics:** Determine how you'll measure effectiveness for the COE. Create KPIs (key performance indicators) or OKRs (objectives and key results) to validate that the COE consistently provides value to the user community.

## Questions to ask

:::image type="icon" source="media/common/questions-to-ask.svg" border="false":::

Use questions like those found below to assess the effectiveness of a COE.

- Is there a COE? If so, who is in the COE and what's the structure?
- If there isn't a COE, is there a central team that performs a similar function? Do data decision makers in the organization understand what a COE does?
- If there isn't a COE, does the organization aspire to create one? Why or why not?
- Are there opportunities for federated or decentralized COE models due to a mix of [enterprise](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) and [departmental](powerbi-implementation-planning-usage-scenario-departmental-bi.md) solutions?
- Are there any missing roles and responsibilities from the COE?
- To what extent does the COE engage with the user community? Do they mentor users? Do they curate a centralized portal? Do they maintain centralized resources?
- Is the COE recognized in the organization? Does the user community consider them to be credible and helpful?
- Do business users see central teams as enabling or restricting their work with data?
- What's the COE funding model? Do COE customers financially contribute in some way to the COE?
- How consistent and transparent is the COE with their communication?

## Maturity levels

:::image type="icon" source="media/common/maturity-levels.svg" border="false":::

The following maturity levels will help you assess the current state of your COE.

| **Level** | **State of the Center of Excellence** |
| --- | --- |
| 100: Initial | &bull;&nbsp;One or more COEs exist, or the activities are performed within the data team, BI team, or IT. There's no clarity on the specific goals nor expectations for responsibilities. <br/><br/>&bull;&nbsp;Requests for assistance from the COE are handled in an unplanned manner. |
| 200: Repeatable | &bull;&nbsp;The COE is in place with a specific charter to mentor, guide, and educate self-service users. The COE seeks to maximize benefits of self-service approaches to data and BI while reducing the risks. <br/><br/>&bull;&nbsp;The goals, scope of responsibilities, staffing, structure, and funding model are established for the COE. |
| 300: Defined | &bull;&nbsp;The COE operates with active involvement from all business units in a unified or federated mode. |
| 400: Capable | &bull;&nbsp;The goals of the COE align with organizational goals, and they are reassessed regularly. <br/><br/>&bull;&nbsp;The COE is well-known throughout the organization, and consistently proves its value to the internal user community. |
| 500: Efficient | &bull;&nbsp;Regular reviews of KPIs or OKRs evaluate COE effectiveness in a measurable way. <br/><br/>&bull;&nbsp;Agility and implementing continual improvements from lessons learned (including scaling out methods that work) are top priorities for the COE. |

## Related content

In the [next article](fabric-adoption-roadmap-governance.md) in the Microsoft Fabric adoption roadmap series, learn about implementing governance guidelines, policies, and processes.
