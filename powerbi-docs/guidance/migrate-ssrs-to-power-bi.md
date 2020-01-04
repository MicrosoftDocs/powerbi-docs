---
title: Migrate SQL Server Reporting Services reports to Power BI
description: Guidance to help you migrate your SQL Server Reporting Services (SSRS) reports to Power BI.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 01/03/2020
ms.author: v-pemyer
---

# Migrate SQL Server Reporting Services reports to Power BI

This article targets SQL Server Reporting Services (SSRS) report authors and Power BI administrators. It provides you with guidance to help you migrate your [Report Definition Language (RDL)](/sql/reporting-services/reports/report-definition-language-ssrs) reports to Power BI.

> [!NOTE]
> It's only possible to migrate RDL reports. In Power BI, RDL reports are called _paginated reports_.

Guidance is divided into four stages. We recommend that you first read the entire article prior to migrating your reports.

1. [Before you start](#before-you-start)
1. [Pre-migration stage](#pre-migration-stage)
1. [Migration stage](#migration-stage)
1. [Post-migration stage](#post-migration-stage)

## Before you start

### Preparing for migration

As you prepare to migrate your reports to Power BI, first verify that your organization has a [Power BI Premium](../service-premium-what-is.md) subscription. This subscription is required to host and run your migrated RDL reports.

You can achieve migration without downtime to your SSRS servers, or disruption to your report users. It's important to understand that no data or reports need to be removed. It means you can keep your current environment in place until you're ready to retire it.

### Supported versions

You can migrate SSRS instances running on-premises, or on Virtual Machines hosted by cloud providers, like Azure.

The following list describes the SQL Server versions supported for migration to Power BI:

> [!div class="checklist"]
> * SQL Server 2012
> * SQL Server 2014
> * SQL Server 2016
> * SQL Server 2017
> * SQL Server 2019

### Migration tool

We recommend you use the [RDL Migration Tool](https://github.com/microsoft/RdlMigration) to help prepare your reports for migration. This tool was developed by Microsoft to help customers migrate RDL reports from their SSRS servers to Power BI. It's available on GitHub, and it includes an end-to-end walkthrough of the migration scenario.

The tool automates the following tasks:

* Checks for unsupported data sources and report components
* Converts any _shared_ resources to _embedded_ resources:
  * Shared **data sources** become embedded data sources
  * Shared **datasets** become embedded datasets
* Publishes reports (that pass checks) as paginated reports, to a specified Power BI workspace (on a Premium capacity)

On completion, the tool outputs a summary of all actions performed—successful or unsuccessful. It doesn't modify your existing reports.

Over time, the tool may be improved by Microsoft. The community is encouraged to contribute and help enhance it, too.

### Partners

Power BI partners are available to help your organization succeed with the migration process. To engage a Power BI partner, visit the [Power BI partner portal](https://powerbi.microsoft.com/partners/).

## Pre-migration stage

After verifying that your organization meets the pre-requisites, you're ready to start the _Pre-migration_ stage. This stage has three phases:

1. Discover
1. Assess
1. Prepare

### Discover

The goal of the _Discover_ phase is to identify your existing SSRS instances. This process involves scanning the network to identify all SQL Server instances in your organization.

You can use the [Microsoft Assessment and Planning Toolkit](https://www.microsoft.com/download/details.aspx?id=7826). Also known as the "MAP Toolkit", it can determine your SQL Server instances, versions, and installed features. It's a powerful inventory, assessment, and reporting tool to simplify your migration planning process.

### Assess

Having discovered your SSRS instances, the goal of the _Assess_ phase is to understand any SSRS reports—or resources—that can't be migrated.

Only RDL reports can be migrated from your SSRS servers to Power BI. Each migrated RDL report will become a Power BI paginated report.

The following SSRS resource types, however, can't be migrated to Power BI:

* Shared data sources <sup>1</sup>
* Shared datasets <sup>1</sup>
* Resources, like image files
* KPIs (SSRS 2016, or later—Enterprise Edition only)
* Mobile reports (SSRS 2016, or later—Enterprise Edition only)
* Report models (deprecated)
* Report parts (deprecated)

<sup>1</sup> The [RDL Migration Tool](https://github.com/microsoft/RdlMigration) automatically converts shared data sources and shared datasets—providing they're using supported data sources.

If your SSRS solutions rely on features not supported by Power BI, you can plan to develop alternative solutions, like [Power BI reports](../consumer/end-user-reports.md). Even if your RDL reports will migrate, we recommend you consider modernizing them as Power BI reports.

Power BI reports emphasize interactivity, and can render your data using modern HTML visuals. However, unlike RDL reports, they're not optimized for print-ready reporting. For more information, see [When to use paginated reports in Power BI](TODO).

### Prepare

The goal of the _Prepare_ phase involves getting everything ready. It covers setting up the Power BI environment, planning how you'll secure and publish your reports, and ideas for redeveloping your SSRS solutions.

1. Ensure the [Paginated Reports workload](../service-admin-premium-workloads.md#paginated-reports) is enabled for your Power BI Premium capacity, and that it's allocated sufficient memory.
1. Verify support for your report [data sources](../paginated-reports-data-sources.md), and set up a [Power BI Gateway](../service-gateway-onprem.md) to allow connectivity with any on-premises data sources.
1. Become familiar with Power BI security, and plan [how you'll reproduce your SSRS folders and permissions](/sql/reporting-services/security/secure-folders) with [Power BI workspaces and workspace roles](../service-new-workspaces.md).
1. Become familiar with Power BI sharing, and plan how you'll distribute content by publishing [Power BI apps](../service-create-distribute-apps.md).
1. Consider using [shared Power BI datasets](../service-datasets-build-permissions.md) in place of your SSRS shared data sources.
1. Use [Power BI Desktop](../desktop-what-is-desktop.md) to develop mobile-optimized reports, possibly using the [Power KPI custom visual](https://appsource.microsoft.com/product/power-bi-visuals/WA104381083?tab=Overview) in place of your SSRS mobile reports and KPIs.
1. Ensure your report authors have [Power BI Report Builder](../report-builder-power-bi.md) installed, and that later releases can be easily distributed throughout your organization.

## Migration stage

After preparing your Power BI environment and reports, you're ready for the _Migration_ stage.

There are two migration options: manual and automated. Manual migration is suited to small sets of reports, or reports requiring modification prior to migration. Automated migration is suited to the migration of a large volume of reports.

### Manual migration

Anyone with permission to access to the SSRS instance and the Power BI workspace can manually migrate reports to Power BI. Here's an overview of the steps:

1. Open to the SSRS portal that contains the reports you want to migrate.
1. Download each report, and save them locally.
1. Open each report in _the latest version_ of Power BI Report Builder.
1. Verify all data sources and datasets are embedded in the report definition, and that they're [supported by Power BI paginated reports](../paginated-reports-data-sources.md).
1. Preview the report to ensure it renders correctly.
1. Connect to the Power BI service (in Power BI Report Builder) using your Azure AD credentials.
1. Choose the _Save As_ option, and then select _Power BI service_.
1. Select the workspace that will contain the report.
1. Verify that the report saves. If certain features in your report design aren't yet supported, the save action will fail. You'll be notified of the reasons. You'll then need to revise your report design, and try saving again.

### Automated migration

There are two options for automated migration. You can use:

* The RDL Migration Tool
* The publicly available APIs for SSRS and Power BI

The [RDL Migration Tool](#migration-tool) has already been described in this article.

Alternatively, you can use the publicly available SSRS and Power BI APIs to automate the migration of your content. While the RDL Migration Tool already uses these APIs, you can develop a custom tool suited to your exact requirements.

For more information about the APIs, see:

* [Power BI REST API Reference](../developer/rest-api-reference.md)
* [SQL Server Reporting Services REST APIs](/sql/reporting-services/developer/rest-api)

## Post-migration stage

After you've successfully completed the migration, you're ready for the _Post-migration_ stage. This stage involves working through a series of post-migration tasks to ensure everything is functioning correctly and efficiently.

### Configure data sources

Once reports have been migrated to Power BI, you'll need to ensure their data sources are correctly set up. It can involve assigning to gateway data sources, and securely storing credentials. These steps aren't configured by the RDL Migration Tool.

For more information, see [Supported data sources for Power BI paginated reports](../paginated-reports-data-sources.md).

### Review report performance

We highly recommended you complete the following actions to ensure the best possible report user experience:

1. Test the reports in each [browser supported by Power BI](../power-bi-browsers.md) to confirm the report consumption experience is correct and consistent.
1. Run tests to compare report rending reporting in SSRS and Power BI. Verify that Power BI reports render in a similar time.
1. If Power BI reports fail to render because of insufficient memory, assign [additional resources to the Power BI Premium capacity](../service-admin-premium-workloads.md#paginated-reports).
1. For long-rendering reports, consider having Power BI deliver them to your report users as [email subscriptions with report attachments](../consumer/paginated-reports-subscriptions.md).
1. For Power BI reports based on Power BI datasets, review model designs to ensure they're fully optimized.

### Reconcile issues

The Post-migration phase is crucial for reconciling any issues. It's important that you address any slow performance issues. Adding a paginated reports workload to a capacity can contribute to slow performance for paginated reports _and other content_ in the capacity.

For more information about these issues, including specific steps to understand and mitigate them, see the following articles:

* [Optimizing Premium capacities](../service-premium-capacity-optimize.md)
* [Monitor Premium capacities within the app](../service-admin-premium-monitor-capacity.md)

## Next steps

For more information about this article, check out the following resources:

* [What are paginated reports in Power BI Premium?](../paginated-reports-report-builder-power-bi.md)
* Guy in a Cube video: [Introducing paginated reports in Power BI](https://www.youtube.com/watch?v=wfqn45XNK3M)
* [Paginated reports in Power BI: FAQ](../paginated-reports-faq.md)
* [Power BI Premium FAQ](../service-premium-faq.md)
* [RDL Migration Tool](https://github.com/microsoft/RdlMigration)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
* Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com)

Power BI partners are available to help your organization succeed with the migration process. To engage a Power BI partner, visit the [Power BI partner portal](https://powerbi.microsoft.com/partners/).
