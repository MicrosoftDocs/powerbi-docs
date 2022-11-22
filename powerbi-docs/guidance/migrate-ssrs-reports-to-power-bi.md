---
title: Migrate SQL Server Reporting Services reports to Power BI
description: Guidance to help you migrate your SQL Server Reporting Services (SSRS) reports to Power BI.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 11/22/2022
ms.custom: intro-migration
---

# Migrate SQL Server Reporting Services reports to Power BI

[!INCLUDE [applies-yes-paginated-yes-service-no-desktop](../includes/applies-yes-paginated-yes-service-no-desktop.md)] ✔️&nbsp;SQL Server Reporting Services

This article targets SQL Server Reporting Services (SSRS) report authors and Power BI administrators. It provides you with guidance to help you migrate your [Report Definition Language (.rdl)](/sql/reporting-services/reports/report-definition-language-ssrs) reports to Power BI.

> [!NOTE]
> You can only migrate .rdl reports. In Power BI, .rdl reports are called _paginated reports_.

Guidance is divided into four stages. We recommend that you first read the entire article prior to migrating your reports.

1. [Before you start](#before-you-start)
1. [Pre-migration stage](#pre-migration-stage)
1. [Migration stage](#migration-stage)
1. [Post-migration stage](#post-migration-stage)

You can achieve migration without downtime to your SSRS servers, or disruption to your report users. It's important to understand that no data or reports need to be removed. So, it means you can keep your current environment in place until you're ready for it to be retired.

## Before you start

Before you start the migration, you should verify that your environment meets certain prerequisites. We'll describe these prerequisites, and also introduce you to a helpful migration tool.

### Preparing for migration

As you prepare to migrate your reports to Power BI, first verify that you have a Power BI Pro or Premium Per User license to upload content to the target workspace.

### Supported versions

You can migrate SSRS instances running on-premises, or on Virtual Machines hosted by cloud providers, like Azure.

The following list describes the SQL Server versions supported for migration to Power BI:

> [!div class="checklist"]
> - SQL Server 2012
> - SQL Server 2014
> - SQL Server 2016
> - SQL Server 2017
> - SQL Server 2019
> - SQL Server 2022

Migration from Power BI Report Server is possible, too.

### Migration tool for SQL Server 2022

If you're using SQL Server 2022 Reporting Services, there's a built-in tool to publish its reports to Power BI. For more information, see [Publish .rdl files to Power BI from Reporting Services](publish-reporting-services-power-bi-service.md).

### Migration tool for previous versions of SQL Server

For earlier versions of SQL Server, we recommend that you use the [RDL Migration Tool](https://github.com/microsoft/RdlMigration) to help prepare, and migrate your reports. This tool was developed by Microsoft to help customers migrate .rdl reports from their SSRS servers to Power BI. It's available on GitHub, and it documents an end-to-end walkthrough of the migration scenario.

The tool automates the following tasks:

* Checks for [unsupported data sources](/power-bi/paginated-reports/paginated-reports-data-sources) and [unsupported report features](/power-bi/paginated-reports/paginated-reports-faq#what-paginated-report-features-in-ssrs-aren-t-yet-supported-in-power-bi-).
* Converts any _shared_ resources to _embedded_ resources:
  * Shared **data sources** become embedded data sources
  * Shared **datasets** become embedded datasets
* Publishes reports (that pass checks) as paginated reports, to a specified Power BI workspace.

It doesn't modify or remove your existing reports. On completion, the tool outputs a summary of all actions completed—successful or unsuccessful.

Over time, the tool may be improved by Microsoft. The community is encouraged to contribute and help enhance it, too.

## Pre-migration stage

After verifying that your organization meets the pre-requisites, you're ready to start the _Pre-migration_ stage. This stage has three phases:

1. Discover
1. Assess
1. Prepare

### Discover

The goal of the _Discover_ phase is to identify your existing SSRS instances. This process involves scanning the network to identify all SQL Server instances in your organization.

You can use the [Microsoft Assessment and Planning Toolkit](https://www.microsoft.com/download/details.aspx?id=7826). The "MAP Toolkit" discovers and reports on your SQL Server instances, versions, and installed features. It's a powerful inventory, assessment, and reporting tool that can simplify your migration planning process.

### Assess

Having discovered your SSRS instances, the goal of the _Assess_ phase is to understand any SSRS reports—or server items—that can't be migrated.

Only .rdl reports can be migrated from your SSRS servers to Power BI. Each migrated .rdl report will become a Power BI paginated report.

The following SSRS item types, however, can't be migrated to Power BI:

- Shared data sources and shared datasets: The [RDL Migration Tool](https://github.com/microsoft/RdlMigration) automatically converts shared data sources and shared datasets, provided that they're using supported data sources.
- Resources such as image files
- Linked reports migrate, whether the *parent* report that links to them is selected for migration or no. In the Power BI service, they're regular .rdl reports. 
- KPIs (SSRS 2016, or later—Enterprise Edition only)
- Mobile reports (SSRS 2016, or later—Enterprise Edition only)
- Report models (deprecated)
- Report parts (deprecated)

If your .rdl reports rely on features [not yet supported by Power BI paginated reports](/power-bi/paginated-reports/paginated-reports-faq#what-paginated-report-features-in-ssrs-aren-t-yet-supported-in-power-bi-), you can plan to redevelop them as [Power BI reports](/power-bi/consumer/end-user-reports). Even if your .rdl reports can migrate, we recommend you consider modernizing them as Power BI reports, when it makes sense.

If your .rdl reports need to retrieve data from _on-premises data sources_, they can't use single sign-on (SSO). Currently, all data retrieval from these sources will be done by using the security context of the _gateway data source user account_. It's not possible for SQL Server Analysis Services (SSAS) to enforce row-level security (RLS) on a per-user basis.

Generally, Power BI paginated reports are optimized for **printing**, or **PDF generation**. Power BI reports are optimized for **exploration and interactivity**. For more information, see [When to use paginated reports in Power BI](report-paginated-or-power-bi.md).

### Prepare

The goal of the _Prepare_ phase involves getting everything ready. It covers setting up the Power BI environment, planning how you'll secure and publish your reports, and ideas for redeveloping SSRS items that won't migrate.

1. Ensure the [Paginated Reports workload](/power-bi/enterprise/service-admin-premium-workloads#paginated-reports) is enabled for your Power BI Premium capacity (only relevant to Power BI Premium Gen1 capacities), and that it has sufficient memory.
1. Verify support for your report [data sources](/power-bi/paginated-reports/paginated-reports-data-sources), and set up a [Power BI gateway](/power-bi/connect-data/service-gateway-onprem) to allow connectivity with any on-premises data sources.
1. Become familiar with Power BI security, and plan [how you'll reproduce your SSRS folders and permissions](/sql/reporting-services/security/secure-folders) with [Power BI workspaces](/power-bi/collaborate-share/service-new-workspaces).
1. Become familiar with Power BI sharing, and plan how you'll distribute content by publishing [Power BI apps](/power-bi/collaborate-share/service-create-distribute-apps).
1. Consider using [shared Power BI datasets](/power-bi/connect-data/service-datasets-build-permissions) in place of your SSRS shared data sources.
1. Use [Power BI Desktop](/power-bi/fundamentals/desktop-what-is-desktop) to develop mobile-optimized reports, possibly using the [Power KPI custom visual](https://appsource.microsoft.com/product/power-bi-visuals/WA104381083?tab=Overview) in place of your SSRS mobile reports and KPIs.
1. Reevaluate the use of the **UserID** built-in field in your reports. If you rely on the **UserID** to secure report data, then understand that for paginated reports (when hosted in the Power BI service) it returns the User Principal Name (UPN). So, instead of returning the NT account name, for example _AW\adelev_, the built-in field returns something like _adelev&commat;adventureworks.com_. You'll need to revise your dataset definitions, and possibly the source data. Once revised and published, we recommend you thoroughly test your reports to ensure data permissions work as expected.
1. Reevaluate the use of the **ExecutionTime** built-in field in your reports. For paginated reports (when hosted in the Power BI service), the built-in field returns the date/time _in Coordinated Universal Time (or UTC)_. It could impact on report parameter default values, and report execution time labels (typically added to report footers).
1. If your data source is SQL Server (on-premises), verify that reports aren't using map visualizations. The map visualization depends on SQL Server spatial data types, and these aren't supported by the gateway. For more information, see [Data retrieval guidance for paginated reports (SQL Server complex data types)](report-paginated-data-retrieval.md#sql-server-complex-data-types).
1. Ensure your report authors have [Power BI Report Builder](/power-bi/paginated-reports/report-builder-power-bi) installed, and that later releases can be easily distributed throughout your organization.

## Migration stage

After preparing your Power BI environment and reports, you're ready for the _Migration_ stage.

There are two migration options: _manual_ and _automated_. Manual migration is suited to a small number of reports, or reports requiring modification before migration. Automated migration is suited to the migration of a large number of reports.

### Manual migration

Anyone with permission to access to the SSRS instance and the Power BI workspace can manually migrate reports to Power BI. Here are the steps to follow:

1. Open the SSRS portal that contains the reports you want to migrate.
1. Download each report definition, saving the .rdl files locally.
1. Open _the latest version_ of Power BI Report Builder, and connect to the Power BI service using your Azure AD credentials.
1. Open each report in Power BI Report Builder, and then:
   1. Verify all data sources and datasets are embedded in the report definition, and that they're [supported data sources](/power-bi/paginated-reports/paginated-reports-data-sources).
   1. Preview the report to ensure it renders correctly.
   1. Select **Publish**, then select **Power BI service**.
   1. Select the workspace where you want to save the report.
   1. Verify that the report saves. If certain features in your report design aren't yet supported, the save action will fail. You'll be notified of the reasons. You'll then need to revise your report design, and try saving again.

### Automated migration

There are three options for automated migration. You can use:

- For SQL Server 2022, see [Publish .rdl files to Power BI from Reporting Services](publish-reporting-services-power-bi-service.md).
- For previous versions, use the [RDL Migration Tool](https://github.com/microsoft/RdlMigration) in GitHub.
- The publicly available APIs for SSRS and Power BI

You can also use the publicly available SSRS and Power BI APIs to automate the migration of your content. While the RDL Migration Tool already uses these APIs, you can develop a custom tool suited to your exact requirements.

For more information about the APIs, see:

- [Power BI REST APIs](/rest/api/power-bi/)
- [SQL Server Reporting Services REST APIs](/sql/reporting-services/developer/rest-api)

## Post-migration stage

After you've successfully completed the migration, you're ready for the _Post-migration_ stage. This stage involves working through a series of post-migration tasks to ensure everything is functioning correctly and efficiently.

### Configure data sources

Once reports have been migrated to Power BI, you'll need to ensure their data sources are correctly set up. It can involve assigning to gateway data sources, and [securely storing data source credentials](/power-bi/paginated-reports/paginated-reports-data-sources#azure-sql-database-authentication). These actions aren't done by the RDL Migration Tool.

### Review report performance

We highly recommended you complete the following actions to ensure the best possible report user experience:

1. Test the reports in each [browser supported by Power BI](/power-bi/fundamentals/power-bi-browsers) to confirm the report renders correctly.
1. Run tests to compare report rending times in SSRS and Power BI. Check that Power BI reports render in an acceptable time.
1. If Power BI reports fail to render because of insufficient memory, allocate [additional resources to the Power BI Premium capacity](/power-bi/enterprise/service-admin-premium-workloads#paginated-reports).
1. For long-rendering reports, consider having Power BI deliver them to your report users as [email subscriptions with report attachments](/power-bi/visuals/power-bi-visualization-export-data).
1. For Power BI reports based on Power BI datasets, review model designs to ensure they're fully optimized.

### Reconcile issues

The Post-migration phase is crucial for reconciling any issues, and that you address any performance concerns. Adding the paginated reports workload to a capacity can contribute to slow performance—for paginated reports _and other content_ stored in the capacity.

For more information about these issues, including specific steps to understand and mitigate them, see the following articles:

- [Optimizing Premium capacities](/power-bi/enterprise/service-premium-capacity-optimize)
- [Monitor Premium capacities within the app](/power-bi/enterprise/service-admin-premium-monitor-capacity)

## Next steps

For more information about this article, check out the following resources:

- [Publish .rdl files to Power BI from SQL Server 2022 Reporting Services](publish-reporting-services-power-bi-service.md)
- [RDL Migration Tool for older versions of Reporting Services](https://github.com/microsoft/RdlMigration)
- [Power BI Report Builder](/power-bi/paginated-reports/paginated-reports-report-builder-power-bi)
- [Data retrieval guidance for paginated reports](report-paginated-data-retrieval.md)
- [When to use paginated reports in Power BI](report-paginated-or-power-bi.md)
- [Paginated reports in Power BI: FAQ](/power-bi/paginated-reports/paginated-reports-faq)
- [Online course: Paginated Reports in a Day](/power-bi/learning-catalog/paginated-reports-online-course)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com)

Power BI partners are available to help your organization succeed with the migration process. To engage a Power BI partner, visit the [Power BI partner portal](https://powerbi.microsoft.com/partners/).
