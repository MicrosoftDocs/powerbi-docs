---
title: Create and validate content to migrate to Power BI
description: Guidance on creating and validating content when migrating to Power BI.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 08/06/2020
ms.author: v-pemyer
---

# Create and validate content to migrate to Power BI

This article discusses **stage four** for migration of BI assets from another platform to Power BI.

:::image type="content" source="media/whitepaper-powerbi-migration-create-and-validate-content/migrate-to-powerbi-stage-4.png" alt-text="Image showing the stages of a Power BI migration. Stage 4 is emphasized for this article.":::

For a complete explanation of the above graphic, see [Power BI migration overview](whitepaper-powerbi-migration-overview.md).

The focus of stage four is performing the actual work to convert the proof of concept to a production-ready solution.

The output from this stage is a Power BI solution that has been validated in a development workspace and is ready for deployment to production.

> [!TIP]
> Most of the topics discussed in this article also apply to a standard Power BI implementation project.

## Create the production solution

At this juncture, the same person who performed the POC may carry on with producing the production-ready Power BI solution or someone new may be involved. If timelines are not jeopardized, it is great to get people involved who will be responsible for Power BI development in the future so they can actively learn.

> [!IMPORTANT]
> Reuse as much of the work from the POC as possible.

### Develop new imported dataset

You may choose to create a new imported dataset when an existing Power BI dataset does not exist to meet your needs, or if it cannot be enhanced to meet your needs.

Ideally, from the very beginning, consider decoupling the development work for data and reports. [Decoupling data and reports](report-separate-from-model.md) will facilitate the separation of work, and permissions, when different people are responsible for data modeling versus reports and visualizations. It makes for a more scalable approach and encourages data reusability.

The essential activities related to development of an imported Power BI dataset include:

- [Acquire data](../connect-data/desktop-quickstart-connect-to-data.md) from one or more sources (which may be a Power BI dataflow when appropriate)
- [Shape, combine, and prepare](../connect-data/desktop-shape-and-combine-data.md) data
- Create the [dataset model](../transform-model/desktop-modeling-view.md), including handling of [dates](../transform-model/desktop-date-tables.md)
- Create and verify [relationships](../transform-model/desktop-create-and-manage-relationships.md)
- Generate [measures](../transform-model/desktop-measures.md)
- Set up [row-level security](../admin/service-admin-rls.md)
- Configure synonyms and [optimize Q&A](../natural-language/q-and-a-best-practices.md)
- Plan for scalability, performance, and concurrency (which may influence your decisions about data storage modes, such as using a [composite model](../transform-model/desktop-composite-models.md) or [aggregations](../transform-model/desktop-aggregations.md) for instance)

> [!TIP]
> If you have different development/test/production environments, consider [parameterizing](/power-query/power-query-query-parameters) data sources. This will make deployment, discussed next in [stage five](whitepaper-powerbi-migration-deploy-support-monitor.md), significantly easier.

### Develop new reports and dashboards

The essential activities related to development of a Power BI report include:

- Decide on the [data storage mode](../transform-model/desktop-storage-mode.md) (Live Connection, DirectQuery, or imported)
- Decide on the best data visualization tool to meet requirements (Power BI Desktop, Paginated Report Builder, or Excel)
- Decide on the [best visual(s)](../consumer/end-user-visual-type.md) to tell the story the report needs to tell
- Ensure all visuals present clear, concise, business-friendly terminology
- Address interactivity requirements
- Add [report-level measures](../transform-model/desktop-tutorial-create-measures.md) (if using Live Connection or DirectQuery)
- Create a [dashboard](../create-reports/service-dashboards.md) in the Power BI service (if applicable)

> [!NOTE]
> Many of these decisions would have been made in earlier stages of planning or proof of concept.

## Validate the solution

There are four main aspects to validation of a Power BI solution:

1. Data accuracy
2. Security
3. Functionality
4. Performance

### Validate data accuracy

As a one-time effort as part of the migration, you will need to ensure the data in the new report matches what is displayed in the legacy report. Or, if there is a difference, be able to explain why. It is more common than you might think to find an error in the legacy solution that gets resolved in the new solution.

As part of ongoing data validation efforts, the new report will typically need to be cross-checked to the original source system. Ideally this validation occurs, in a repeatable way, every time a report change happens.

### Validate security

When validating security, there are two primary aspects to consider:

1. Authorization to data
2. Access to datasets, reports, and dashboards

In an imported Power BI dataset, authorization to data is handled by [row-level security](../admin/service-admin-rls.md) (RLS). It is also possible that authorization is enforced by a source system when DirectQuery (possibly with single sign-on) is used.

The main ways to handle access to content in the Power BI service are:

- [Workspace roles](../collaborate-share/service-new-workspaces.md#roles-in-the-new-workspaces) (for content editors and viewers)
- [App permissions](../collaborate-share/service-create-distribute-apps.md#publish-your-app) (viewers)
- [Sharing](../collaborate-share/service-share-dashboards.md) of one report or dashboard (viewers)

> [!TIP]
> We recommend training the content authors in your organization on how to manage security effectively. It is also important to have sound auditing and monitoring in place.

### Validate functionality

It's the time to double check things like field names, formatting, sorting, and default summarization behavior in the dataset. Interactive features in reports, such as [slicers](../visuals/power-bi-visualization-slicers.md), [drill-down](../consumer/end-user-drill.md), [drill-through](../create-reports/desktop-drillthrough.md), [expressions](../create-reports/desktop-conditional-format-visual-titles.md), [buttons](../create-reports/desktop-buttons.md), or [bookmarks](../create-reports/desktop-bookmarks.md), should all be verified as well.

The Power BI solution should be published to a development workspace in the Power BI service on a regular basis during the development process. Verify all functionality works as expected in the service, such as rendering of custom visuals. It's also a good time to do further testing of things such as [scheduled refresh](../connect-data/refresh-scheduled-refresh.md), [Q&A](../consumer/end-user-q-and-a.md), and how reports and dashboards display on a [mobile device](../consumer/mobile/mobile-apps-for-mobile-devices.md).

### Validate performance

Performance of the Power BI solution is extremely important for user experience. Most reports should present visuals in under 10 seconds. If you have reports that take longer to load, pause and reconsider what has been done so far. Report performance should be assessed regularly in the Power BI service, in addition to Power BI Desktop.

Most performance issues arise from substandard [DAX (Data Analysis eXpressions)]()../transform-model/desktop-quickstart-learn-dax-basics.md), poor dataset design, or suboptimal report design (for instance, trying to render far too many visuals on a single page). Technical environment issues, such as the network or an overloaded data gateway or how Premium capacity is configured, might also be a factor in performance issues. For more information, see the [Optimization guide for Power BI](power-bi-optimization.md) and [Troubleshoot report performance in Power BI](report-performance-troubleshoot.md).

## Document the solution

There are two main types of documentation that are useful for a Power BI solution:

- Dataset documentation
- Report documentation

Documentation can be stored wherever it is most easily accessed by the target audience. Common options include:

- **Within a SharePoint site**. A site like this may exist in conjunction with a Center of Excellence or perhaps an internal Power BI community site.
- **Within an app**. URLs may be specified when publishing a Power BI app, which direct the user to more information.
- **Within individual .pbix files**. It's most common when the documentation is specific to one individual file only.

> [!TIP]
> If you create a site to serve as a hub for Power BI-related documentation, consider [customizing the Get Help menu](../admin/service-admin-portal.md#publish-get-help-information) with this URL location.

### Create dataset documentation

Dataset documentation is targeted towards those users who'll be managing the dataset in the future. It's useful to include:

- Design decisions made and why
- Who owns, maintains, and/or certifies the dataset
- Data refresh needs
- Custom business rules defined in the dataset
- Specific security or data privacy issues for the dataset
- Future maintenance required
- Known open issues or deferred backlog items

You may also elect to create a change log that summarizes the most important changes that have happened to the dataset over time.

### Create report documentation

Report documentation, which is usually structured as a walkthrough targeted towards report consumers, can help consumers get significantly more value from your reports and dashboards. A short video tutorial often works well for this purpose.

You may also choose to include additional report documentation on a hidden page of your report. This could include design decisions and/or a change log.

## Next steps

In the [next article in this series](whitepaper-powerbi-migration-deploy-support-monitor.md), learn about stage five of the Power BI migration which focuses on deploying the solution to production for use by business users.

Other helpful resources include:

- [Microsoft's BI transformation](center-of-excellence-microsoft-business-intelligence-transformation.md)
- [Planning a Power BI enterprise deployment](https://aka.ms/PBIEnterpriseDeploymentWP)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
