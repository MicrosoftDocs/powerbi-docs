---
title: Plan to migrate .rdl reports to Power BI
description: Guidance to help you migrate your .rdl reports from Power BI Report Server and SQL Server Reporting Services (SSRS) to Power BI.
author: peter-myers
ms.author: v-pemyers
ms.reviewer: daengli
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat, intro-migration
ms.date: 10/29/2024
---

# Plan to migrate .rdl reports to Power BI

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)] :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::&nbsp;Power&nbsp;BI&nbsp;2022&nbsp;Report&nbsp;Server :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::&nbsp;SQL&nbsp;Server&nbsp;2022&nbsp;Reporting&nbsp;Services

This article targets Power BI Report Server and SQL Server Reporting Services (SSRS) report authors and Power BI administrators. It provides you with guidance to help you migrate your [Report Definition Language (.rdl)](/sql/reporting-services/reports/report-definition-language-ssrs) reports to Power BI.

> [!NOTE]
> In Power BI, .rdl reports are called _paginated reports_.

Guidance is divided into four stages. We recommend that you first read the entire article prior to migrating your reports.

1. [Before you start](#before-you-start)
1. [Pre-migration stage](#pre-migration-stage)
1. [Migration stage](#migration-stage)
1. [Post-migration stage](#post-migration-stage)

You can achieve migration without downtime to your report servers, or disruption to your report users. It's important to understand that you don't need to remove any data or reports. So, it means you can keep your current environment in place until you're ready for it to be retired.

## Before you start

Before you start the migration, verify that your environment meets certain prerequisites. We describe these prerequisites, and also introduce you to a helpful migration tool.

### Prepare for migration

As you prepare to migrate your reports to Power BI, first verify that you have a Power BI Pro or Premium Per User license to upload content to the target workspace.

### Supported versions

You can migrate report server instances running on premises, or on virtual machines hosted by cloud providers like Azure.

The following list describes the SQL Server Reporting Services versions supported for migration to Power BI:

> [!div class="checklist"]
> - SQL Server Reporting Services 2012
> - SQL Server Reporting Services 2014
> - SQL Server Reporting Services 2016
> - SQL Server Reporting Services 2017
> - SQL Server Reporting Services 2019
> - SQL Server Reporting Services 2022

You can migrate .rdl files from Power BI Report Server as well.

### Migration tool for Power BI Report Server and SQL Server Reporting Services 2017+

If you're using Power BI Report Server or SQL Server Reporting Services after SQL Server 2016, there's a built-in tool to publish its reports to Power BI. For more information, see [Publish .rdl files to Power BI](publish-reporting-services-power-bi-service.md).

### Migration tool for previous versions of SQL Server

For earlier versions of SQL Server Reporting Services, we recommend that you use the [RDL Migration Tool](using-rdl-migration-tool.md) to help prepare and migrate your reports. This tool was developed by Microsoft to help customers migrate .rdl reports from their SSRS servers to Power BI. It's available on GitHub, and it documents an end-to-end walkthrough of the migration scenario.

The tool automates the following tasks:

- Checks for [unsupported data sources](../paginated-reports/paginated-reports-data-sources.md) and [unsupported report features](../paginated-reports/paginated-reports-faq.yml#what-paginated-report-features-in-ssrs-aren-t-yet-supported-in-power-bi-).
- Converts any _shared_ resources to _embedded_ resources:
  - Shared **data sources** become embedded data sources.
  - Shared **datasets** become embedded datasets.
- Publishes reports that pass checks as _paginated reports_, to a specified Power BI workspace.

It doesn't modify or remove your existing reports. On completion, the tool outputs a summary of all actions completed, successful or unsuccessful.

Over time, Microsoft might improve the tool. The community is encouraged to contribute and help enhance it, too.

## Pre-migration stage

After verifying that your organization meets the pre-requisites, you're ready to start the _Pre-migration_ stage. This stage has three phases:

1. [Discover](#discover)
1. [Assess](#assess)
1. [Prepare](#prepare)

### Discover

The goal of the _Discover_ phase is to identify your existing report server instances. This process involves scanning the network to identify all report server instances in your organization.

You can use the [Microsoft Assessment and Planning Toolkit](https://www.microsoft.com/download/details.aspx?id=7826). The "MAP Toolkit" discovers and reports on your report server instances, versions, and installed features. It's a powerful inventory, assessment, and reporting tool that can simplify your migration planning process.

Organizations might have hundreds of SQL Server Reporting Services (SSRS) reports. Some of those reports might become obsolete due to lack of use. The article [Find and retire unused reports](retire-unused-reports-ssrs.md) can help you discover unused reports and how to create a cadence for cleanup.

### Assess

Having discovered your report server instances, the goal of the _Assess_ phase is to understand any .rdl reports, or server items, that can't be migrated.

Your .rdl reports can be migrated from your report servers to Power BI. Each migrated .rdl report becomes a Power BI paginated report.

The following report server item types, however, can't be migrated to Power BI:

- **Shared data sources** and **shared datasets**: The [RDL Migration Tool](using-rdl-migration-tool.md) automatically converts shared data sources and shared datasets into embedded data sources and datasets, provided that they're using supported data sources.
- **Resources** such as image files.
- **Linked reports** migrate, whether the *parent* report that links to them is selected for migration or not. In the Power BI service, they're regular .rdl reports. 
- **KPIs**: Power BI Report Server, or Reporting Services 2016 or later—Enterprise Edition only.
- **Mobile reports**: Power BI Report Server, or Reporting Services 2016 or later—Enterprise Edition only.
- **Report models**: deprecated.
- **Report parts**: deprecated.

If your .rdl reports rely on features [not yet supported by Power BI paginated reports](../paginated-reports/paginated-reports-faq.yml#what-paginated-report-features-in-ssrs-aren-t-yet-supported-in-power-bi-), you can plan to redevelop them as [Power BI reports](../consumer/end-user-reports.md), when it makes sense.

For more information about supported data sources for paginated reports in the Power BI service, see [Supported data sources for Power BI paginated reports](../paginated-reports/paginated-reports-data-sources.md#other-data-sources).

Generally, Power BI paginated reports are optimized for **printing**, or **PDF generation**. Power BI reports are optimized for **exploration and interactivity**. For more information, see [When to use paginated reports in Power BI](report-paginated-or-power-bi.md).

Referencing [custom code](../paginated-reports/paginated-reports-faq.yml#can-i-run-custom-code-in-my-report-) DLL files within a report isn't supported.  

Differences in PDF output occur most often when a font that doesn't support non-Latin characters is used in a report and then non-Latin characters are added to the report. Test the [PDF rendering output](../paginated-reports/report-builder/export-pdf-file-report-builder.md#verifying-fonts-in-a-pdf-file) on both the report server and the client computers to verify that the report renders correctly.

### Prepare

The goal of the _Prepare_ phase involves getting everything ready. It covers setting up the Power BI environment, planning how you'll secure and publish your reports, and ideas for redeveloping report server items that won't migrate.

1. Verify support for your report [data sources](../paginated-reports/paginated-reports-data-sources.md), and set up a [Power BI gateway](../connect-data/service-gateway-onprem.md) to allow connectivity with any on-premises data sources.
1. Become familiar with Power BI security, and plan [how you'll reproduce your report server folders and permissions](/sql/reporting-services/security/secure-folders) with [Power BI workspaces](../collaborate-share/service-new-workspaces.md).
1. Become familiar with Power BI sharing, and plan how you'll distribute content by publishing [Power BI apps](../collaborate-share/service-create-distribute-apps.md).
1. Consider using [shared Power BI semantic models](../connect-data/service-datasets-build-permissions.md) in place of your report server shared data sources.
1. Use [Power BI Desktop](../fundamentals/desktop-what-is-desktop.md) to develop mobile-optimized reports, possibly using the [Power KPI custom visual](https://appsource.microsoft.com/en-us/product/power-bi-visuals/WA104381083?tab=Overview) in place of your report server mobile reports and KPIs.
1. Reevaluate the use of the **UserID** built-in field in your reports. If you rely on the **UserID** to secure report data, then understand that for paginated reports (when hosted in the Power BI service) it returns the User Principal Name (UPN). So, instead of returning the NT account name, for example _AW\adelev_, the built-in field returns something like _adelev&commat;adventureworks.com_. You need to revise your dataset definitions, and possibly the source data. Once revised and published, we recommend you thoroughly test your reports to ensure data permissions work as expected.
1. Reevaluate the use of the **ExecutionTime** built-in field in your reports. For paginated reports (when hosted in the Power BI service), the built-in field returns the date/time _in Coordinated Universal Time (or UTC)_. It could impact on report parameter default values, and report execution time labels (typically added to report footers).
1. If your data source is SQL Server (on premises), verify that reports aren't using map visualizations. The map visualization depends on SQL Server spatial data types, and these aren't supported by the gateway. For more information, see [Data retrieval guidance for paginated reports (SQL Server complex data types)](report-paginated-data-retrieval.md#sql-server-complex-data-types).
1. For cascading parameters, be mindful that parameters are evaluated sequentially. Try preaggregating report data first. For more information, see [Use cascading parameters in paginated reports](../guidance/paginated-report-cascading-parameter.md).
1. Ensure your report authors have [Power BI Report Builder](../paginated-reports/report-builder-power-bi.md) installed, and that you can easily distribute later releases throughout your organization.
1. Utilize [capacity planning](../paginated-reports/paginated-capacity-planning.md) documentation for paginated reports.

## Migration stage

After preparing your Power BI environment and reports, you're ready for the _Migration_ stage.

There are two migration options: _manual_ and _automated_. Manual migration is suited to a small number of reports, or reports requiring modification before migration. Automated migration is suited to the migration of a large number of reports.

### Manual migration

Anyone with permission to access to the report server instance and the Power BI workspace can manually migrate reports to Power BI. Here are the steps to follow:

1. Open the report server portal that contains the reports you want to migrate.
1. Download each report definition, saving the .rdl files locally.
1. Open _the latest version_ of Power BI Report Builder, and connect to the Power BI service using your Microsoft Entra ID credentials.
1. Open each report in Power BI Report Builder, and then:
   1. Verify all data sources and datasets are embedded in the report definition, and that they're [supported data sources](../paginated-reports/paginated-reports-data-sources.md).
   1. Preview the report to ensure it renders correctly.
   1. Select **Publish**, then select **Power BI service**.
   1. Select the workspace where you want to save the report.
   1. Verify that the report saves. If certain features in your report design aren't yet supported, the save action fails. You're notified of the reasons. You then need to revise your report design, and try saving again.

### Automated migration

There are three options for automated migration. You can use:

- For Power BI Report Server and SQL Server 2022, see [Publish .rdl files to Power BI](publish-reporting-services-power-bi-service.md).
- For previous versions of Reporting Services, use the [RDL Migration Tool](using-rdl-migration-tool.md) in GitHub.
- The publicly available APIs for Power BI Report Server, Reporting Services, and Power BI

You can also use the publicly available Power BI Report Server, Reporting Services, and Power BI APIs to automate the migration of your content. While the RDL Migration Tool already uses these APIs, you can develop a custom tool suited to your exact requirements.

For more information about the APIs, see:

- [Power BI REST APIs](/rest/api/power-bi/).
- [SQL Server Reporting Services REST APIs](/sql/reporting-services/developer/rest-api).

## Post-migration stage

After you've successfully completed the migration, you're ready for the _Post-migration_ stage. This stage involves working through a series of post-migration tasks to ensure everything is functioning correctly and efficiently.

### Setting query time-out for embedded datasets  

You specify query time-out values during report authoring when you define an embedded dataset. The [time-out value](../paginated-reports/paginated-reports-faq.yml#do-i-need-to-set-a-query-time-out-for-an-embedded-dataset-in-a-paginated-report-) is stored with the report, in the Timeout element of the report definition.

### Configure data sources

Once reports have been migrated to Power BI, you need to ensure their data sources are correctly set up. It can involve assigning to gateway data sources, and [securely storing data source credentials](../paginated-reports/paginated-reports-data-sources.md#azure-sql-database-authentication). These actions aren't done by the RDL Migration Tool.

### Review report performance

We highly recommended you complete the following actions to ensure the best possible report user experience:

1. Test the reports in each [browser supported by Power BI](../fundamentals/power-bi-browsers.md) to confirm the report renders correctly.
1. Run tests to compare report rending times on the report server and in the Power BI service. Check that Power BI reports render in an acceptable time.
1. For long-rendering reports, consider having Power BI deliver them to your report users as [email subscriptions with report attachments](../visuals/power-bi-visualization-export-data.md).
1. For Power BI reports based on Power BI semantic models, review model designs to ensure they're fully optimized.

### Reconcile issues

The Post-migration phase is crucial for reconciling any issues, and that you address any performance concerns. Adding the paginated reports workload to a capacity can contribute to slow performance for paginated reports _and other content_ stored in the capacity.

## Related content

For more information about this article, check out the following resources:

- [Publish .rdl files to Power BI from Power BI Report Server and SQL Server Reporting Services](publish-reporting-services-power-bi-service.md)
- [RDL Migration Tool for older versions of Reporting Services](using-rdl-migration-tool.md)
- [Power BI Report Builder](../paginated-reports/paginated-reports-report-builder-power-bi.md)
- [Data retrieval guidance for paginated reports](report-paginated-data-retrieval.md)
- [When to use paginated reports in Power BI](report-paginated-or-power-bi.md)
- [Paginated reports in Power BI: FAQ](../paginated-reports/paginated-reports-faq.yml)
- Questions? [Try asking the Fabric Community](https://community.fabric.microsoft.com/)
- Suggestions? [Contribute ideas to improve Fabric](https://ideas.fabric.microsoft.com/)

Power BI partners are available to help your organization succeed with the migration process. To engage a partner, visit the [Microsoft Power BI partner portal](https://www.microsoft.com/power-platform/products/power-bi/partners).
