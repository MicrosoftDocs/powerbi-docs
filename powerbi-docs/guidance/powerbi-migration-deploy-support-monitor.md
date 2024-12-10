---
title: Deploy to Power BI
description: Guidance on deploying, supporting, and monitoring content when migrating to Power BI.
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat, intro-deployment
ms.date: 02/27/2022
---

# Deploy to Power BI

This article describes **Stage 5**, which is concerned with deploying, supporting, and monitoring content when migrating to Power BI.

:::image type="content" source="media/powerbi-migration-deploy-support-monitor/migrate-to-power-bi-stage-5.svg" alt-text="Diagram shows the stages of a Power BI migration. Stage 5 is emphasized for this article." border="false":::

> [!NOTE]
> For a complete explanation of the above diagram, see [Power BI migration overview](powerbi-migration-overview.md).

The primary focus of Stage 5 is to deploy the new Power BI solution to production.

The output from this stage is a production solution ready for use by the business. When working with an agile method, it's acceptable to have some planned enhancements that will be delivered in a future iteration. Support and monitoring are also important at this stage, and on an ongoing basis.

> [!TIP]
> Except for running in parallel and decommissioning the legacy reports, which are discussed below, the topics discussed in this article also apply to a standard Power BI implementation project.

## Deploy to test environment

For IT-managed solutions, or solutions that are critical to business productivity, there's generally a test environment. A test environment sits between development and production, and it's not necessary for all Power BI solutions. A test workspace can serve as a stable location, separated from development, for user acceptance testing (UAT) to occur before release to production.

If your content has been published to a workspace on Premium capacity, [deployment pipelines](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines) can simplify the deployment process to development, test, and production workspaces. Alternatively, publishing can be done manually or with [PowerShell scripts](https://powerbi.microsoft.com/blog/duplicating-workspaces-by-using-power-bi-cmdlets/).

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

### Deploy to test workspace

Key activities during a deployment to the test workspace typically include:

- **Connection strings and parameters:** Adjust semantic model connection strings if the data source differs between development and test. [Parameterization](../connect-data/service-parameters.md) can be used to effectively manage connection strings.
- **Workspace content:** Publish semantic models and reports to the test workspace, and create dashboards.
- **App.** Publish an [app](../consumer/end-user-apps.md) using the content from the test workspace, if it will form part of the UAT process. Usually, app permissions are restricted to a small number of people involved with UAT.
- **Data refresh:** [Schedule the semantic model refresh](../connect-data/refresh-scheduled-refresh.md) for any Import semantic models for the period when UAT is actively occurring.
- **Security:** Update or verify [workspace roles](../collaborate-share/service-roles-new-workspaces.md). Testing workspace access includes a small number of people who are involved with UAT.

### Conduct user acceptance testing

Generally, UAT involves business users who are subject matter experts. Once verified, they provide their approval that the new content is accurate, meets requirements, and can be deployed for wider consumption by others.

The extent to which this UAT process is formal, including written sign-offs, will depend on your change management practices.

## Deploy to production environment

There are several considerations for deploying to the production environment.

### Conduct a staged deployment

If you're trying to minimize risk and user disruption, or if there are other concerns, you might opt to perform a staged deployment. The first deployment to production might involve a smaller group of pilot users. With a pilot, feedback can be actively requested from the pilot users.

Expand permissions in the production workspace, or the app, gradually until all target users have permission to the new Power BI solution.

> [!TIP]
> Use the [Power BI Activity Log](../enterprise/service-admin-auditing.md) to understand how consumers are adopting and using the new Power BI solution.

### Handle additional components

During the deployment process, you might need to work with your Power BI administrators to address other requirements that are needed to support the entire solution, such as:

- **Gateway maintenance:** A [new data source](../connect-data/service-gateway-data-sources.md) registration in the data gateway might be required.
- **Gateway drivers and connectors:** A new proprietary data source might require installation of a new driver or custom connector on each server in the gateway cluster.
- **Create a new Premium capacity:** You might be able to use an existing [Premium capacity](../enterprise/service-premium-what-is.md). Or, there might be situations when a new Premium capacity is warranted. It could be the case when you purposely wish to separate a departmental workload.
- **Set up a Power BI dataflow:** Data preparation activities can be set up once in a [Power BI dataflow](../transform-model/dataflows/dataflows-introduction-self-service.md) using Power Query Online. It helps avoid replicating data preparation work in many different Power BI Desktop files.
- **Register a new organizational visual:** [Organizational visual](../developer/visuals/power-bi-custom-visuals-organization.md) registration can be done in the admin portal for custom visuals that didn't originate from AppSource.
- **Set featured content:** A tenant setting exists that controls who can [feature content](https://powerbi.microsoft.com/blog/promote-your-reports-dashboards-and-apps-on-power-bi-home/) in the Power BI service home page.
- **Set up sensitivity labels:** All [sensitivity labels](../enterprise/service-security-data-protection-overview.md) are integrated with Microsoft Purview Information Protection.

### Deploy to production workspace

Key activities during a deployment to the production workspace typically include:

- **Change management:** If necessary, obtain approval to deploy, and communicate deployment to the user population using your standard change management practices. There might be an approved change management window during which production deployments are allowed. Usually, it's applicable to IT-managed content and much less frequently applied to self-service content.
- **Rollback plan:** With a migration, the expectation is that it's the migration of a new solution for the first time. If content does already exist, it's wise to have a plan to revert to the previous version, should it become necessary. Having previous versions of the Power BI Desktop files (using SharePoint or OneDrive versioning) works well for this purpose.
- **Connection strings and parameters:** Adjust semantic model connection strings when the data source differs between test and production. [Parameterization](../connect-data/service-parameters.md) can be used effectively for this purpose.
- **Data refresh:** [Schedule the semantic model refresh](../connect-data/refresh-scheduled-refresh.md) for any imported semantic models.
- **Workspace content:** Publish semantic models and reports to the production workspace, and create dashboards. [Deployment pipelines](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines) can simplify the process to deploy to development, test, and production workspaces if your content has been published to workspaces on Premium capacity.
- **App:** If apps are part of your content distribution strategy, publish an [app](../consumer/end-user-apps.md) using the content from the production workspace.
- **Security:** Update and verify [workspace roles](../collaborate-share/service-roles-new-workspaces.md) based on your content distribution and collaboration strategy.
- **Semantic model settings:** Update and verify settings for each semantic model, including:
  - [Endorsement](../collaborate-share/service-endorse-content.md) (such as certified or promoted)
  - Gateway connection or data source credentials
  - Scheduled refresh
  - [Featured Q&A questions](../create-reports/service-q-and-a-create-featured-questions.md)
- **Report and dashboard settings:** Update and verify settings for each report and dashboard. The most important settings include:
  - Description
  - Contact person or group
  - [Sensitivity label](../enterprise/service-security-apply-data-sensitivity-labels.md)
  - [Featured content](https://powerbi.microsoft.com/blog/promote-your-reports-dashboards-and-apps-on-power-bi-home/)
- **Subscriptions:** Set up report subscriptions, if necessary.

> [!IMPORTANT]
> At this point, you have reached a big milestone. Celebrate your accomplishment at completing the migration.

### Communicate with users

Announce the new solution to consumers. Let them know where they can find the content, as well as associated documentation, FAQs, and tutorials. To introduce the new content, consider hosting a lunch-and-learn type of session or prepare some on-demand videos.

Be sure to include instructions on how to request help, as well as how to provide feedback.

### Conduct a retrospective

Consider conducting a retrospective to examine what went well with the migration, and what could be done better with the next migration.

## Run in parallel

In many situations, the new solution will run in parallel to the legacy solution for a predetermined time. Advantages of running in parallel include:

- Risk reduction, particularly if the reports are considered mission-critical.
- Allows time for users to become accustomed to the new Power BI solution.
- Allows for the information presented in Power BI to be cross-referenced to the legacy reports.

## Decommission the legacy report

At some point, the reports migrated to Power BI should be disabled in the legacy BI platform. Decommissioning legacy reports can occur when:

- The predetermined time for running in parallel—which should have been communicated to the user population—has expired. It's commonly 30-90 days.
- All users of the legacy system have access to the new Power BI solution.
- Significant activity is no longer occurring on the legacy report.
- No issues have occurred with the new Power BI solution that could impact user productivity.

## Monitor the solution

Events from the [Power BI activity log](../enterprise/service-admin-auditing.md) can be used to understand usage patterns of the new solution (or the [execution log](/sql/reporting-services/report-server/report-server-executionlog-and-the-executionlog3-view) for content deployed to Power BI Report Server). Analyzing the activity log can help determine whether actual use differs from expectations. It can also validate that the solution is adequately supported.

Here's some questions that can be addressed by reviewing the activity log:

- How frequently is the content being viewed?
- Who is viewing the content?
- Is the content typically viewed through an app or a workspace?
- Are most users using a browser or mobile application?
- Are subscriptions being used?
- Are new reports being created that are based on this solution?
- Is the content being updated frequently?
- How is security defined?
- Are problems occurring regularly, such as data refresh failures?
- Are concerning activities happening (for instance, significant export activity or numerous individual report shares) which could mean additional training might be warranted?

> [!IMPORTANT]
> Be sure to have someone regularly review the activity log. Merely capturing it and storing the history does have value for auditing or compliance purposes. However, the real value is when proactive action can be taken.

## Support the solution

Although the migration is complete, the post-migration period is vital for addressing issues and handling any performance concerns. Over time, the migrated solution will likely undergo changes as business needs evolve.

[Support](fabric-adoption-roadmap-user-support.md) tends to happen a little differently depending on how self-service BI is managed across the organization. Power BI champions throughout the business units often informally act as first-line support. Although it's an informal role, it's a vital one that should be encouraged.

Having a formal support process, staffed by IT with support tickets, is also essential for handling routine system-oriented requests and for escalation purposes.

> [!NOTE]
> The different types of [internal and external support](fabric-adoption-roadmap-user-support.md#types-of-user-support) are described in the Fabric adoption roadmap.

You might also have a [Center of Excellence (COE)](fabric-adoption-roadmap-center-of-excellence.md) that acts like internal consultants who support, educate, and govern Power BI in the organization. A COE can be responsible for curating helpful Power BI content in an internal portal.

Lastly, it should be clear to content consumers to know who to contact with questions about the content, and to have a mechanism for providing feedback on issues or improvements.

For more information about user support, with a focus on the resolution of issues, see [User support](fabric-adoption-roadmap-user-support.md) in the Fabric adoption roadmap.

## Related content

In the [final article in this series](powerbi-migration-learn-from-customers.md), learn from customers when migrating to Power BI.

Other helpful resources include:

- [Microsoft's BI transformation](center-of-excellence-microsoft-business-intelligence-transformation.md)
- [Power BI implementation planning](powerbi-implementation-planning-introduction.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)

Experienced Power BI partners are available to help your organization succeed with the migration process. To engage a Power BI partner, visit the [Power BI partner portal](https://powerbi.microsoft.com/partners/).
