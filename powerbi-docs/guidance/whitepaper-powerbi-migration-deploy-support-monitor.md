---
title: Deploy, support, and monitor content to migrate to Power BI
description: Guidance on deploying, supporting, and monitoring content when migrating to Power BI.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 08/06/2020
ms.author: v-pemyer
---

# Deploy, support, and monitor content to migrate to Power BI

This article discusses **stage five** for migration of BI assets from another platform to Power BI.

:::image type="content" source="media/whitepaper-powerbi-migration-deploy-support-monitor/migrate-to-powerbi-stage-5.png" alt-text="Image showing the stages of a Power BI migration. Stage 5 is emphasized for this article.":::

For a complete explanation of the above graphic, see [Power BI migration overview](whitepaper-powerbi-migration-overview.md).

The primary focus of stage five is to deploy the new Power BI solution to production.

The output from this stage is a production solution actively being used by business users. When working in an agile method, it is acceptable to have some planned enhancements that will be delivered in a future iteration. Support and monitoring are also very important at this stage, and on an ongoing basis.

> [!TIP]
> Except for running in parallel and decommissioning the legacy reports which are discussed below, the topics discussed in this article also apply to a standard Power BI implementation project.

## Deploy to test environment

For IT-managed solutions, or solutions that are critical to business productivity, there is generally a test environment. A test environment, placed between development and production, is not necessary for all Power BI solutions. A test workspace serves as a stable location, separate from development, for user acceptance testing (UAT) to occur before impacting production.

[Deployment pipelines](../create-reports/deployment-pipelines-overview.md) can simplify the process to deploy to development, test, and production workspaces if your content has been published to workspaces with dedicated Premium capacity. Alternatively, publishing may be done manually or with [PowerShell scripts](https://powerbi.microsoft.com/en-us/blog/duplicating-workspaces-by-using-power-bi-cmdlets/).

### Deploy to test workspace

Key activities during a deployment to the test workspace typically include:

- **Connection strings and parameters.** Adjust dataset connection strings if the data source differs between development and test. [Parameters](../connect-data/service-parameters.md) can be used effectively to manage connection strings.
- **Workspace content.** Publish dataset(s), report(s), and dashboards(s) to the test workspace.
- **App.** Publish an [app](../consumer/end-user-apps.md), with the content from the test workspace, if that will be part of the UAT process. The app permissions are restricted to a small number of people involved with UAT.
- **Data refresh.** [Schedule the dataset refresh](../connect-data/refresh-scheduled-refresh.md) for any imported datasets for the period when UAT is actively occurring.
- **Security**. Update or verify [workspace roles](../collaborate-share/service-new-workspaces.md#roles-in-the-new-workspaces). Test workspace access includes a small number of people who are involved with UAT.

> [!NOTE]
> For more information about options for deployment to development, test, and production, see section 9 of the [Planning a Power BI enterprise deployment](https://aka.ms/PBIEnterpriseDeploymentWP) whitepaper.

### Conduct user acceptance testing

Generally, UAT involves business users who are subject matter experts providing their approval to verify that the new content is accurate, meets requirements, and may be deployed for wider consumption by others.

The extent to which this UAT process is formal, including written sign-offs, will depend on your change management practices.

## Deploy to production environment

### Conduct a staged deployment

If you are trying to minimize risk, lessen user disruption, or if there are other concerns, you may opt to do a staged deployment. The first deployment to production may involve a smaller group of pilot users. With a pilot, feedback may be actively requested from the pilot users; other times the absence of any issues is the objective.

Expand permissions in the production workspace, and/or the app, gradually until all target users have permission to the new Power BI solution.

### Handle additional components

At various times during the deployment process, you may need to work with your Power BI administrator(s) to address other components, which may be needed to fully support the entire solution, such as:

- **Gateway maintenance.** A [new data source](../connect-data/service-gateway-data-sources.md) may need to be registered in the data gateway.
- **Gateway drivers and connectors.** A new proprietary data source may require installation of a new driver or custom connector on each server in the gateway cluster.
- **Create a new Premium capacity**. You may be able to use an existing [Premium capacity](../admin/service-premium-capacity-manage.md). Or, there may be situations when a new Premium capacity is warranted such as when you purposely wish to segregate a departmental workload.
- **Set up a Power BI dataflow**. Data preparation activities can be set up once in a [Power BI dataflow](../transform-model/service-dataflows-overview.md) using Power Query Online and avoid replicating data preparation work in many different .pbix files.
- **Register a new organizational visual**. [Organizational visuals](../developer/visuals/power-bi-custom-visuals-organization.md) are registered in the admin portal for custom visuals that did not originate from AppSource.
- **Set featured content**. A tenant setting exists which controls who may [feature content](https://powerbi.microsoft.com/en-us/blog/promote-your-reports-dashboards-and-apps-on-power-bi-home/).
- **Set up sensitivity labels**. All [sensitivity labels](../admin/service-security-data-protection-overview.md) are integrated with Microsoft Information Protection.

### Deploy to production workspace

Key activities during a deployment to the production workspace typically include:

- **Change management.** Obtain approval to deploy, if necessary, and communicate to the user population based on your standard change management practices. There may be an approved change management window during which production deployments are allowed. It's usually applicable to IT-managed content and much less frequently to self-service content.
- **Rollback plan.** With a migration, the expectation is that it's a new solution being migrated for the first time. If content does currently exist, it is wise to have a plan for how to revert to the previous version if that becomes necessary. Having previous versions of the .pbix files (such as via versioning in OneDrive or SharePoint) works well for this purpose.
- **Connection strings and parameters.** Adjust dataset connection strings if the data source differs between test and production. [Parameters](/connect-data/service-parameters.md) can be used effectively for this purpose.
- **Data refresh.** [Schedule the dataset refresh](../connect-data/refresh-scheduled-refresh.md) for any imported datasets.
- **Workspace content.** Publish dataset(s) and report(s) and dashboards(s) to the production workspace. [Deployment pipelines](../create-reports/deployment-pipelines-overview.md) can simplify the process to deploy to development, test, and production workspaces if your content has been published to workspaces with dedicated Premium capacity.
- **App.** Publish an [app](../consumer/end-user-apps.md), with the content from the test workspace, if apps are part of your content distribution strategy.
- **Security**. Update and/or verify [workspace roles](../collaborate-share/service-new-workspaces.md#roles-in-the-new-workspaces) based on your content distribution and collaboration strategy.
- **Report and dashboard settings**. Update and/or verify settings for each report and dashboard. The most important settings include:
  - Description
  - Contact person or group
  - [Sensitivity label](../collaborate-share/service-security-apply-data-sensitivity-labels.md)
  - [Featured content](https://powerbi.microsoft.com/en-us/blog/promote-your-reports-dashboards-and-apps-on-power-bi-home/)
- **Dataset settings**. Update and/or verify settings for each dataset, including:
  - [Endorsement](../connect-data/service-datasets-certify.md) (such as certified or promoted)
  - Gateway connection or data source credentials
  - [Featured Q&A questions](../create-reports/service-q-and-a-create-featured-questions.md)
- **Subscription**. Set up a report subscription if applicable.

> [!IMPORTANT]
> At this point, you have reached a big milestone. Celebrate your accomplishment at completing the migration.

### Communicate with users

Announce the new solution to direct consumers where to find the content, as well as associated documentation, FAQs, and/or tutorials. Consider hosting a lunch-and-learn type of session, or on-demand videos, to introduce the new content.

Include information for users on how to request help, as well as how to provide feedback on the solution.

### Conduct a retrospective

Consider conducting a retrospective to examine what went well with the migration, and what could be done better with the next set of content to be migrated.

## Run in parallel

In many situations, the new solution will run in parallel to the legacy solution for a predetermined time. Advantages of running in parallel include:

- Risk reduction, particularly if the reports are considered mission-critical
- Allows time for users to become accustomed to the new solution in Power BI
- Allows for the information presented in Power BI to be cross-referenced to the legacy reports

## Decommission the legacy report

At some point, the report(s) that were migrated to Power BI should be disabled in the legacy system. Decommissioning the legacy report can occur when:

- The predetermined time for running in parallel, which should have been communicated to the user population, has expired. This is commonly 30-90 days.
- All users of the legacy system have access to the new Power BI solution.
- Significant activity is no longer occurring on the legacy report.
- No issues have occurred with the new Power BI solution that would impact user productivity.

## Monitor the solution

Events from the [Power BI activity log](../admin/service-admin-auditing.md) can be used to understand the usage patterns of the new solution (or the [execution log](/sql/reporting-services/report-server/report-server-executionlog-and-the-executionlog3-view?view=sql-server-ver15) for content deployed to Power BI Report Server). The activity log is helpful to determine if actual use differs from expectations, and to verify that the solution is supported adequately.

A few types of information to look for in the activity log include:

- How frequently is the content being viewed?
- Who is viewing the content?
- Is the content typically viewed through an app or a workspace?
- Are most users using a browser or mobile application?
- Are subscriptions being used significantly?
- Are new reports being created which are based on this solution?
- Is the content being updated frequently?
- How is security defined?
- Are problems occurring with regularity, such as data refresh failure?
- Are concerning activities happening (for instance, significant export activity or numerous individual report sharing) which could mean additional training might be warranted?

> [!IMPORTANT]
> Be sure to have someone regularly review the monitoring data. Merely capturing it and storing the history does have value for auditing or compliance purposes. However, the real value is when proactive action can be taken.

## Support the solution

Although the migration is complete, the post-migration period is vital for addressing issues and handling any performance concerns. Over time, the migrated solution will likely undergo changes as business needs evolve.

Support tends to happen a little differently depending on how self-service BI is managed across organization. Power BI champions throughout the business units often informally act as first-line support. Although it is an informal role, it's a vital one that should be encouraged.

Having a formal support process, usually staffed by IT with support tickets, is also essential for handling routine system-oriented requests and for escalation purposes.

You may also have a [Center of Excellence (COE)](center-of-excellence-establish.md), or similar, organization that acts like an internal consultant to support, educate, and govern Power BI in the organization. A COE is usually involved with curating helpful Power BI content in an internal portal.

It should be clear to report consumers know who to contact with questions about the content, and to have a mechanism for providing feedback on issues or improvements.

## Next steps

In the [final article in this series](whitepaper-powerbi-migration-learn-from-customers.md), learn about Power BI migration experiences from other customers.

Other helpful resources include:

- [Microsoft's BI transformation](center-of-excellence-microsoft-business-intelligence-transformation.md)
- [Planning a Power BI enterprise deployment](https://aka.ms/PBIEnterpriseDeploymentWP)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
