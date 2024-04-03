---
title: Power BI site reliability engineering (SRE) model
description: Learn how Power BI approaches its site reliability model.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 11/10/2023
LocalizationGroup: Administration
---

# Power BI site reliability engineering (SRE) model

This document describes the Power BI team's approach to maintaining a reliable, performant, and scalable service for customers. It describes monitoring service health, mitigating incidents, release management and acting on necessary improvements. Other important operational aspects such as security are outside of the scope of this document. This document was created to share knowledge with our customers, who often raise questions regarding site reliability engineering practices. The intention is to offer transparency into how Power BI minimizes service disruption through safe deployment, continuous monitoring, and rapid incident response. The techniques described here also provide a blueprint for teams hosting service-based solutions to build foundational live site processes that are efficient and effective at scale.

**Author:** Yitzhak Kesselman

## Background

Power BI is a native cloud offering and global service, supporting the following customers and capabilities:

* Serving 260,000 organizations and 97% of Fortune 500 companies
* Deployed in 52 Azure regions around the world
* Executes nearly 20 million queries per hour at peak
* Ingests over 90 petabytes of data per month into customer semantic models
* Employs 149 clusters powered by more than 350,000 cores

Despite absorbing six straight years of triple-digit growth and substantial new capabilities, the Power BI service exhibits strong service reliability and operational excellence. As the service grew and large enterprises deployed it at scale to hundreds of thousands of users, the need for exceptional reliability became essential. The reliability results shown in the following table are the direct consequence of engineering, tools, and culture changes made by the Power BI team over the past few years, and are highlighted in this article.

:::image type="content" source="media/service-admin-site-reliability-engineering-model/service-admin-site-reliability-engineering-model-01.png" alt-text="Table describing site reliability statistics.":::

Through solutions and disciplined operations, the Power BI team has sustained exponential growth and rapid update cycles without increasing overall cost or burden on live site management. In the following graph, you can see the continuous and significant decline in Service Reliability Engineering cost per monthly active user (MAU). 

:::image type="content" source="media/service-admin-site-reliability-engineering-model/service-admin-site-reliability-engineering-model-02.png" alt-text="Graph showing decrease in site reliability engineering cost despite rapid growth.":::

The efficiencies gained from site reliability engineering (SRE) team efforts offset the cost of funding such a team. The SRE team size, and its corresponding operational cost, has remained constant despite exponential service growth over the same period. Without such dedicated focus on efficiency, live site support costs would have grown substantially with increased service usage.

Further, an increasing percentage of Power BI live site incidents can now be addressed partially or completely through automation. The following chart shows a 90% decrease in Time to Mitigate (TTM) incidents over the past two years while usage has more than tripled. The same period saw the introduction of alert automation to deflect more than 82% of incidents.

:::image type="content" source="media/service-admin-site-reliability-engineering-model/service-admin-site-reliability-engineering-model-03.png" alt-text="Chart showing decreased response time despite increase in usage.":::

These efforts have resulted in greatly improved service reliability to customers, approaching four nines (99.99%) success rate.

The remainder of this article describes the approach and best practices put in place that enabled the SRE team to achieve the previous chart's outcomes. The following sections include details on live site incident types, standard investigation processes, best practices for operationalizing those processes at scale, and the Objective Key Results (OKRs) used by the team to measure success.

## Why incidents occur and how to live with them

The Power BI team ships weekly feature updates to the service and on-demand targeted fixes to address service quality issues. The release process includes a comprehensive set of quality gates, including comprehensive code reviews, ad-hoc testing, automated component-based and scenario-based tests, feature flighting, and regional safe deployment. However, even with these safeguards, live site incidents can and do happen.

Live site incidents can be divided into several categories:

* Dependent-service issues (such as Microsoft Entra ID, Azure SQL, Storage, virtual machine scale set, Service Fabric)
* Infrastructure outage (such as a hardware failure, data center failure)
* Power BI environmental configuration issues (such as insufficient capacity)
* Power BI service code regressions
* Customer misconfiguration (such as insufficient resources, bad queries/reports)

Reducing incident volume is one way to decrease live site burden and to improve customer satisfaction. However, doing so isn't always possible given that some of the incident categories are outside the team's direct control. Furthermore, as the service footprint expands to support rapid growth in usage, the probability of an incident occurring due to external factors increases. High incident counts can occur even in cases where the Power BI service has minimal service code regressions, and has met or exceeded its Service Level Objective (SLO) for overall reliability of 99.95%, which has led the Power BI team to devote significant resources to reducing incident costs to a level that is sustainable, by both financial and engineering measures.

## Live site incident process

When investigating live site incidents, the Power BI team follows a standard operational process that's common across Microsoft and the industry. The following image summarizes the standard live site incident handling lifecycle.

:::image type="content" source="media/service-admin-site-reliability-engineering-model/service-admin-site-reliability-engineering-model-04.png" alt-text="Visual showing the live site incident process handling lifecycle.":::

In the first phase, which is the **service monitoring** phase, the SRE team works with engineers, program managers, and the Senior Leadership Team to define Service Level Indicators (SLIs) and Service Level Objectives (SLOs) for both major scenarios and minor scenarios. These objectives apply to different metrics of the service, including scenario/component reliability, scenario/component performance (latency), and resource consumption. The live site team and product team then craft alerts that monitor Service Level Indicators (SLIs) against agreed upon targets. When violations are detected, an alert is triggered for investigation. 

In the second phase, which is the **incident response** phase, processes are structured to facilitate the following results:
* Prompt and targeted notification to customers of any relevant impact
* Analysis of affected service components and workflows
* Targeted mitigation of incident impact

In the final phase, which is the **continuous improvement** phase, the team focuses on completion of relevant post-mortem analysis and resolution of any identified process, monitoring, or configuration or code fixes. The fixes are then prioritized against the team's general engineering backlog based on overall severity and risk of reoccurrence.

## Our practices for service monitoring

The Power BI team emphasizes a consistent, data-driven, and customer-centric approach to its live site operations. Defining Service Level Indicators (SLIs) and implementing corresponding live site monitoring alerts is part of the approval criteria for enabling any new Power BI feature in production. Product group engineers also include steps for investigation and mitigation of alerts when they occur using a template Troubleshooting Guide (TSG). Those deliverables are then presented to the Site Reliability Engineering (SRE) team.

One way in which the Power BI team enables exponential service growth is by using a SRE team. These individuals are skilled with service architecture, automation and incident management practices, and are embedded within incidents to drive end-to-end resolution. The approach contrasts with the rotational model where engineering leaders from the product group take on an incident manager role for only a few weeks per year. The SRE team ensures that a consistent group of individuals are responsible for driving live site improvements and ensuring that learnings from previous incidents are incorporated into future escalations. The SRE team also assists with large-scale drills that test Business Continuity and Disaster Recovery (BCDR) capabilities of the service.

SRE team members use their unique skill set and considerable live site experience, and also partner with feature teams to enhance SLIs and alerts provided by the product team in numerous ways. Some of the ways they enhance SLIs include:

* **Anomaly Alerts:** SREs develop monitors that consider typical usage and operational patterns within a given production environment and alert when significant deviations occur. *Example: semantic models refresh latency increases by 50% relative to similar usage periods.*
* **Customer/Environment-Specific Alerts:** SREs develop monitors that detect when specific customers, provisioned capacities, or deployed clusters deviate from expected behavior. *Example: A single capacity owned by a customer is failing to load semantic models for querying.*
* **Fine-Grained Alerts:** SREs consider subsets of the population that might experience issues independently of the broader population. For such cases, specific alerts are crafted to ensure that alerts will in fact fire if those less common scenarios fail despite lower volume. *Example: Refreshing semantic models that use the GitHub connector are failing.*
* **Perceived Reliability Alerts:** SREs also craft alerts that detect cases when customers are unsuccessful due to any type of error. This can include failures from user errors and indicate a need for improved documentation or a modified user experience. These alerts also can notify engineers of unexpected system errors that might otherwise be misclassified as a user error. *Example: semantic model refresh fails due to incorrect credentials.*

Another critical role of the SRE team is to automate TSG actions to the extent possible through Azure Automation. In cases where complete automation is not possible, the SRE team defines actions to *enrich* an alert with useful and incident-specific diagnostic information to accelerate subsequent investigation. Such enrichment is paired with prescriptive guidance in a corresponding TSG so that live site engineers can either take a specific action to mitigate the incident or quickly escalate to SMEs for more investigation. Alerts with enrichment are also candidates for complete automation when possible and when incident volume/severity provides a sufficiently high ROI.

As a direct result of these efforts, more than 82% of incidents are mitigated without any human interaction. The remaining incidents have enough enrichment data and supporting documentation to be handled without SME involvement in 99.7% of cases. 

:::image type="content" source="media/service-admin-site-reliability-engineering-model/service-admin-site-reliability-engineering-model-05.png" alt-text="Chart showing incident automation and deflection.":::

Live Site SREs also enforce alert quality in several ways, including the following:

* Ensuring that TSGs include impact analysis and escalation policy
* Ensuring that alerts execute for the absolute smallest time window possible for faster detection
* Ensuring that alerts use reliability thresholds instead of absolute limits to scale clusters of different size

## Our practices for incident response

When an automated live site incident is created for the Power BI service, one of the first priorities is to notify customers of potential impact. Azure has a target notification time of 15 minutes, which is difficult to achieve when notifications are manually posted by incident managers after joining a call. Communications in such cases are at risk of being late or inaccurate due to required manual analysis. Azure Monitoring offers centralized monitoring and alerting solutions that can detect impact to certain metrics within this time window. However, Power BI is a SaaS offering with complex scenarios and user interactions that cannot be easily modeled and tracked using such alerting systems. In response, the Power BI team developed a novel solution called **TTN0**.

* **TTN0 (Time To Notify “0”)** is a *fully automated* incident notification service that uses our internal alerting infrastructure to identify specific scenarios and customers that are impacted by a newly created incident. It is also integrated with external monitoring agents outside of Azure to detect connectivity issues that might otherwise go unnoticed. TTN0 allows customers to receive an email when TTN0 detects a service disruption or degradation. With TTN0, the Power BI team can send reliable, targeted notifications within 10 minutes of impact start time (which is 33% faster than the Azure target). Since the solution is fully automated, there is minimal risk from human error or delays. As of May 2021, more than 8,000 companies have registered for TTN0 alerts.

As mentioned in the previous section, Power BI’s live site philosophy emphasizes automated resolution of incidents to improve overall scalability and sustainability of the SRE team. The emphasis on automation enables mitigation at scale and can potentially avoid costly rollbacks or risky expedited fixes to production systems. When manual investigation is required, Power BI adopts a tiered approach with initial investigation done by a dedicated SRE team. SRE team members are experienced in managing live site incidents, facilitating cross-team communication, and driving mitigation. In cases where the acting SRE team member requires more context on an impacted scenario/component, they may engage the Subject Matter Expert (SME) of that area for guidance. Finally, the SME team conducts simulations of system component failures to understand and to mitigate issues in advance of an active live site incident. 

Once the affected component/scenario of the service is determined, the Power BI team has multiple techniques for quickly mitigating impact. Some of them are the following:

* **Activate side-by-side deployment infrastructure:** Power BI supports running different versioned workloads in the same cluster, allowing the team to run a new (or previous) version of a specific workload for certain customers without triggering a full-scale deployment (or rollback). The approach can reduce mitigation time to 15 minutes and lower overall deployment risk.
* **Execute Business Continuity/Disaster Recovery (BCDR) process:** Allows the team to fail over primary workloads to this alternate environment in three minutes if a serious issue is found in a new service version. BCDR can also be used when environmental factors or dependent services prevent the primary cluster/region from operating normally.
* **Leverage resiliency of dependent services:** Power BI proactively evaluates and invests in resiliency and redundancy efforts for all dependent services (such as SQL, Redis Cache, Key Vault). Resiliency includes sufficient component monitoring to detect upstream/downstream regressions as well as local, zonal, and regional redundancy (where applicable). Investing in these capabilities ensures that tooling exists for automatic or manual triggering of recovery operations to mitigate impact from an affected dependency.


## Our practices for continuous improvement

The Power BI team reviews all customer-impacting incidents during a Weekly Service Review with representation from all engineering groups that contribute to the Power BI service. The review disseminates key learnings from the incident to leaders across the organization and provides an opportunity to adapt our processes to close gaps and address inefficiencies.

Prior to review, the SRE team prepares post-mortem content and identifies preliminary repair items for the live site team and product development team. Items may include code fixes, augmented telemetry, or updated alerts/TSGs. Power BI SREs are familiar with many of these areas and often proactively make the adjustments in real time while responding to an active incident. Doing so helps to ensure that changes are incorporated into the system in time to detect reoccurrence of a similar issue. In cases where an incident was the result of a customer escalation, the SRE team adjusts existing automated alerting and SLIs to reflect customer expectations. For the ~0.3% of incidents that require escalation to a Subject Matter Expert (SME) of the impacted scenario/component, the Power BI SRE team will review ways in which the same incident (or similar incidents) could be handled without escalation in the future. The detailed analysis by the SRE team helps the product development team to design a more resilient, scalable, and supportable product.

Beyond review of specific postmortems, the SRE team also generates reports on aggregate incident data to identify opportunities for service improvement such as future automation of incident mitigation or product fixes. The reporting combines data from multiple sources, including the customer support team, automated alerting, and service telemetry. The consolidated view provides visibility into those issues that are most negatively impacting service and team health, and the SRE team then prioritizes potential improvements based on overall ROI. For example, if a particular alert is firing too frequently or generating disproportionate impact on service reliability, the SRE team can partner with the product development team to invest in relevant quality improvements. Completing these work items drives improvement to service and live site metrics and directly contributes to organizational objective key results (OKRs). In cases where an SLI has been consistently met for a long period of time, the SRE team may suggest increases to the service SLO to provide an improved experience for our customers.

## Measuring success through objective key results (OKRs)

The Power BI team has a comprehensive set of Objective Key Results (OKRs) that are used to ensure overall service health, customer satisfaction, and engineer happiness. OKRs can be divided into two categories:

* **Service Health OKRs:** These OKRs directly or indirectly measure the health of scenarios or components in the service and often are tracked by monitoring/alerting. *Example: A single capacity owned by a customer is failing to load semantic models for querying.*
* **Live Site Health OKRs:** These OKRs directly or indirectly measure how efficiently and effectively live site operations are addressing service incidents and outages described in previous sections. *Example: Time To Notify (TTN) customers of an impacting incident.*

The following table shows the major live site health OKRs.

:::image type="content" source="media/service-admin-site-reliability-engineering-model/service-admin-site-reliability-engineering-model-01.png" alt-text="Table describing major live site health objective key results.":::

The time required for the Power BI team to react to incidents as measured by TTN, TTA, and TTM significantly exceeds targets. Alert automation directly correlates with the team’s ability to sustain exponential service growth, while continuing to meet or exceed target response times for incident alerting, notification, and mitigation. Over a two-year period, the Power BI SRE team added automation to deflect more than 82% of incidents and to enrich an additional six percent with details that empower engineers to quickly take action to mitigate incidents when they occur. The approach also enables SMEs to focus on features and proactive quality improvements instead of repeatedly being engaged for reactive incident investigations.

The above OKRs are actively tracked by the Power BI live site team, and the Senior Leadership Team, to ensure that the team continues to meet or exceed the baseline required to support substantial service growth, to maintain a sustainable live site workload, and to ensure high customer satisfaction.

## What's next

Another high priority item on the SRE team roadmap is the reduction of system *noise* from false positive alerts or ignorable alerts. In addition, the team will inventory *transient* alerts, drive RCAs, and determine if there are underlying systemic issues that need to be addressed.

Finally, a foundational element of Power BI service resiliency is ensuring that the service is compartmentalized such that incidents only impact a subset of the users. Doing so enables mitigation by redirecting impacted traffic to a healthy cluster. Supporting this holistically requires significant architectural work and design changes but should yield even higher SLOs than are attainable today.

## Related content

> [!div class="nextstepaction"]
> [Fabric adoption roadmap: Governance](../guidance/fabric-adoption-roadmap-governance.md)

> [!div class="nextstepaction"]
> [Release management and deployment process](/fabric/release-plan/)

> [!div class="nextstepaction"]
> [White papers for Power BI](../guidance/whitepapers.md)
