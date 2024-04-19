---
title: Create content to migrate to Power BI
description: Guidance on creating and validating content when migrating to Power BI.
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 08/20/2020
---

# Create content to migrate to Power BI

This article describes **Stage 4**, which is concerned with creating and validating content when migrating to Power BI.

:::image type="content" source="media/powerbi-migration-create-validate-content/migrate-to-power-bi-stage-4.svg" alt-text="Diagram shows the stages of a Power BI migration. Stage 4 is emphasized for this article." border="false":::

> [!NOTE]
> For a complete explanation of the above graphic, see [Power BI migration overview](powerbi-migration-overview.md).

The focus of Stage 4 is performing the actual work to convert the proof of concept (POC) to a production-ready solution.

The output from this stage is a Power BI solution that has been validated in a development workspace and is ready for deployment to production.

> [!TIP]
> Most of the topics discussed in this article also apply to a standard Power BI implementation project.

## Create the production solution

At this juncture, the same person who performed the POC might carry on with producing the production-ready Power BI solution. Or, someone different could be involved. If timelines are not jeopardized, it's great to get people involved who will be responsible for Power BI development in the future. This way, they can actively learn.

> [!IMPORTANT]
> Reuse as much of the work from the POC as possible.

### Develop new Import semantic model

You might choose to create a new Import semantic model ([previously known as a dataset](../connect-data/service-datasets-rename.md)) when an existing Power BI semantic model doesn't already exist to meet your needs, or if it can't be enhanced to meet your needs.

Ideally, from the very beginning, consider decoupling the development work for data and reports. [Decoupling data and reports](report-separate-from-model.md) will facilitate the separation of work, and permissions, when different people are responsible for data modeling and reports. It makes for a more scalable approach and encourages data reusability.

The essential activities related to development of an Import semantic model include:

- [Acquire data](../connect-data/desktop-quickstart-connect-to-data.md) from one or more data sources (which could be a Power BI dataflow).
- [Shape, combine, and prepare](../connect-data/desktop-shape-and-combine-data.md) data.
- Create the [semantic model](../transform-model/desktop-modeling-view.md), including [date tables](../transform-model/desktop-date-tables.md).
- Create and verify [model relationships](../transform-model/desktop-create-and-manage-relationships.md).
- Define [measures](../transform-model/desktop-measures.md).
- Set up [row-level security](/fabric/security/service-admin-rls), if necessary.
- Configure synonyms and [optimize Q&A](../natural-language/q-and-a-best-practices.md).
- Plan for scalability, performance, and concurrency, which might influence your decisions about data storage modes, such as using a [Composite model](../transform-model/desktop-composite-models.md) or [aggregations](../enterprise/aggregations-auto.md).

> [!TIP]
> If you have different development/test/production environments, consider [parameterizing](/power-query/power-query-query-parameters) data sources. It will make deployment, described in [Stage 5](powerbi-migration-deploy-support-monitor.md), significantly easier.

### Develop new reports and dashboards

The essential activities related to development of a Power BI report or dashboard include:

- Decide on using a Live Connection to an existing data model, or creating a new data model
- When creating a new data model, decide on the [data storage mode](../transform-model/desktop-storage-mode.md) for model tables (Import, DirectQuery, or Composite).
- Decide on the best data visualization tool to meet requirements: Power BI Desktop, Paginated Report Builder, or Excel.
- Decide on the [best visuals](../visuals/power-bi-visualization-types-for-reports-and-q-and-a.md) to tell the story the report needs to tell, and to address the questions the report needs to answer.
- Ensure all visuals present clear, concise, and business-friendly terminology.
- Address interactivity requirements.
- When using Live Connection, add [report-level measures](../transform-model/desktop-tutorial-create-measures.md).
- Create a [dashboard](../create-reports/service-dashboards.md) in the Power BI service, especially when consumers want an easy way to monitor key metrics.

> [!NOTE]
> Many of these decisions will have been made in earlier stages of planning or in the technical POC.

## Validate the solution

There are four main aspects to validation of a Power BI solution:

1. Data accuracy
2. Security
3. Functionality
4. Performance

### Validate data accuracy

As a one-time effort during the migration, you'll need to ensure the data in the new report matches what's displayed in the legacy report. Or—if there's a difference—be able to explain why. It's more common than you might think to find an error in the legacy solution that gets resolved in the new solution.

As part of ongoing data validation efforts, the new report will typically need to be cross-checked with the original source system. Ideally, this validation occurs in a repeatable way every time you publish a report change.

### Validate security

When validating security, there are two primary aspects to consider:

- Data permissions
- Access to semantic models, reports, and dashboards

In an Import semantic model, data permissions are applied by defining [row-level security](/fabric/security/service-admin-rls) (RLS). It's also possible that data permissions are enforced by the source system when using DirectQuery storage mode (possibly with [single sign-on](../connect-data/service-gateway-sso-overview.md)).

The main ways to grant access to Power BI content are:

- [Workspace roles](../collaborate-share/service-roles-new-workspaces.md) (for content editors and viewers).
- [App audience permissions](../collaborate-share/service-create-distribute-apps.md#create-and-manage-multiple-audiences) applied to a packaged set of workspace content (for viewers).
- [Sharing](../collaborate-share/service-share-dashboards.md) an individual report or dashboard (for viewers).

> [!TIP]
> We recommend training content authors on how to manage security effectively. It's also important to have robust testing, auditing and monitoring in place.

### Validate functionality

It's the time to double-check semantic model details like field names, formatting, sorting, and default summarization behavior. Interactive report features, such as [slicers](../visuals/power-bi-visualization-slicers.md), [drill-down actions](../consumer/end-user-drill.md), [drillthrough actions](../create-reports/desktop-drillthrough.md), [expressions](../create-reports/desktop-conditional-format-visual-titles.md), [buttons](../create-reports/desktop-buttons.md), or [bookmarks](../create-reports/desktop-bookmarks.md), should all be verified, too.

During the development process, the Power BI solution should be published to a development workspace in the Power BI service on a regular basis. Verify all functionality works as expected in the service, such as the rendering of custom visuals. It's also a good time to do further testing. Test [scheduled refresh](../connect-data/refresh-scheduled-refresh.md), [Q&A](../consumer/end-user-q-and-a.md), and how reports and dashboards look on a [mobile device](../consumer/mobile/mobile-apps-for-mobile-devices.md).

### Validate performance

Performance of the Power BI solution is important for consumer experience. Most reports should present visuals in under 10 seconds. If you have reports that take longer to load, pause and reconsider what might be contributing to delays. Report performance should be assessed regularly in the Power BI service, in addition to Power BI Desktop.

Many performance issues arise from substandard [DAX (Data Analysis eXpressions)](../transform-model/desktop-quickstart-learn-dax-basics.md), poor semantic model design, or suboptimal report design (for instance, trying to render too many visuals on a single page). Technical environment issues, such as the network, an overloaded data gateway, or how a Premium capacity is configured can also contribute to performance issues. For more information, see the [Optimization guide for Power BI](power-bi-optimization.md) and [Troubleshoot report performance in Power BI](report-performance-troubleshoot.md).

## Document the solution

There are two main types of documentation that are useful for a Power BI solution:

- Semantic model documentation
- Report documentation

Documentation can be stored wherever it's most easily accessed by the target audience. Common options include:

- **Within a SharePoint site:** A SharePoint site might exist for your Center of Excellence or an internal Power BI community site.
- **Within an app:** URLs can be set up when publishing a Power BI app to direct the consumer to more information.
- **Within individual Power BI Desktop files:** Model elements, like tables and columns, can define a description. These descriptions appear as tooltips in the **Fields** pane when authoring reports.

> [!TIP]
> If you create a site to serve as a hub for Power BI-related documentation, consider [customizing the Get Help menu](/fabric/admin/service-admin-portal-help-support#publish-get-help-information) with its URL location.

### Create semantic model documentation

Semantic model documentation is targeted at users who will be managing the semantic model in the future. It's useful to include:

- Design decisions made and reasons why.
- Who owns, maintains, and certifies semantic models.
- Data refresh requirements.
- Custom business rules defined in semantic models.
- Specific semantic model security or data privacy requirements.
- Future maintenance needs.
- Known open issues or deferred backlog items.

You might also elect to create a change log that summarizes the most important changes that have happened to the semantic model over time.

### Create report documentation

Report documentation, which is typically structured as a walk-through targeted at report consumers, can help consumers get more value from your reports and dashboards. A short video tutorial often works well.

You may also choose to include additional report documentation on a hidden page of your report. It could include design decisions and a change log.

## Related content

In the [next article in this Power BI migration series](powerbi-migration-deploy-support-monitor.md), learn about stage 5, which is concerned with deploying, supporting, and monitoring content when migrating to Power BI.

Other helpful resources include:

- [Microsoft's BI transformation](center-of-excellence-microsoft-business-intelligence-transformation.md)
- [Power BI implementation planning](powerbi-implementation-planning-introduction.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)

Experienced Power BI partners are available to help your organization succeed with the migration process. To engage a Power BI partner, visit the [Power BI partner portal](https://powerbi.microsoft.com/partners/).
