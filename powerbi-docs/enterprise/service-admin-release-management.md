---
title: Release management and deployment process
description: Learn about Power BI's release management and deployment process.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 03/30/2023
---

# Release management and deployment process

Power BI releases weekly feature updates to the service and on-demand targeted fixes to address service quality issues. The approach is intended to balance speed and safety. Any code change in Power BI passes through various validation stages before being deployed broadly to external customers, as described in the following diagram.

:::image type="content" source="media/service-admin-release-management/service-admin-site-reliability-engineering-model-07.png" alt-text="Diagram showing release management and deployment process.":::

Every change to the Power BI code base passes through automated component and end-to-end tests that validate common scenarios and ensure that interactions yield expected results. In addition, Power BI uses a Continuous Integration/Continuous Deployment **(CI/CD)** pipeline on main development branches to detect other issues that are cost-prohibitive to identify on a per-change basis. The CI/CD process triggers a full cluster build out and various synthetic tests that must pass before a change can enter the next stage in the release process. Approved CI/CD builds are deployed to internal test environments for more automated and manual validation before being included in each weekly feature update. The process means that a change will be incorporated into a candidate release within 1 to 7 days after it is completed by the developer.

The weekly feature update then passes through various official deployment rings of Power BI’s safe deployment process. The updated product build is applied first to an internal cluster that hosts content for the Power BI team followed by the internal cluster that is used by all employees across Microsoft. The changes wait in each of these environments for one week prior to moving to the final step: production deployment. Here, the deployment team adopts a gradual rollout process that selectively applies the new build by region to allow for validation in certain regions prior to broad application.

## Scaling the deployment

Scaling this deployment model to handle exponential service growth is accomplished in several ways, as described below.

* **Comprehensive Dependency Reviews:** Power BI is a complex service with many upstream dependencies and nontrivial hardware capacity requirements. The deployment team ensures the availability and necessary capacity of all dependent resources and services in a target deployment region. Usage models project capacity needs based on anticipated customer demands.

* **Automation:** Power BI deployments are essentially *zero-touch* with little to no interaction required by the deployment team. Prebuilt rollout specifications exist for multiple deployment scenarios. Deployment configuration is validated at build-time to avoid unexpected errors during live deployment roll-outs.

* **Cluster Health Checks:** Power BI deployment infrastructure checks internal service health models before, during, and after an upgrade to identify unexpected behavior and potential regressions. When possible, deployment tooling attempts auto-mitigation of encountered issues.

* **Incident Response Process:** Deployment issues are handled like other live site incidents using techniques that are discussed in more detail in the following sections of this article. Engineers analyze issues with a focus on immediate mitigation and then follow up with relevant manual or automated process changes to prevent future reoccurrence.

* **Feature Management/Exposure Control:** Power BI applies a comprehensive framework for selectively exposing new features to customers. Feature exposure is independent of deployment cadences and allows code for new scenario code to be deployed in a disabled state until it has passed all relevant quality bars. In addition, new features can be exposed to a subset of the overall Power BI population as an extra validation step prior to enabling globally. If an issue is detected, the Power BI feature management service provides the ability to disable an offending feature in seconds without waiting for more time-consuming deployment rollback operations.

These features have enabled the Power BI team to improve the success rate of deployments by 18 points while absorbing a 400% year-over-year growth in monthly deployments.

## Related content

> [!div class="nextstepaction"]
> [Power BI site reliability engineering (SRE) model](service-admin-site-reliability-engineering-model.md)
