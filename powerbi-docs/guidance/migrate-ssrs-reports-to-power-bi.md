---
title: Plan to migrate .rdl reports to Power BI
description: Guidance to help you migrate your .rdl reports from Power BI Report Server and SQL Server Reporting Services (SSRS) to Power BI.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: cookiemccray
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 01/14/2023
ms.custom: intro-migration
---

# Plan to migrate .rdl reports to Power BI

[!INCLUDE [applies-yes-paginated-yes-service-no-desktop](../includes/applies-yes-paginated-yes-service-no-desktop.md)] :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::&nbsp;Power&nbsp;BI&nbsp;2022&nbsp;Report&nbsp;Server :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::&nbsp;SQL&nbsp;Server&nbsp;2022&nbsp;Reporting&nbsp;Services

This article targets Power BI Report Server and SQL Server Reporting Services (SSRS) report authors and Power BI administrators. It provides you with guidance to help you migrate your [Report Definition Language (.rdl)](/sql/reporting-services/reports/report-definition-language-ssrs) reports to Power BI.

:::image type="content" source="media/migrate-ssrs-reports-to-power-bi/rdl-migration-diagram.png" alt-text="Diagram showing migrating .rdl reports from on premises to the Power BI service.":::

_Flow diagram shows the path migrating on-premises .rdl reports to paginated reports the Power BI service._

> [!NOTE]
> In Power BI, .rdl reports are called _paginated reports_.

Guidance is divided into four stages. We recommend that you first read the entire article prior to migrating your reports.

1. [Before you start](#before-you-start)
1. [Pre-migration stage](#pre-migration-stage)
1. [Migration stage](#migration-stage)
1. [Post-migration stage](#post-migration-stage)

You can achieve migration without downtime to your report servers, or disruption to your report users. It's important to understand that you don't need to remove any data or reports. So, it means you can keep your current environment in place until you're ready for it to be retired.

## Before you start

Before you start the migration, verify that your environment meets certain prerequisites. We'll describe these prerequisites, and also introduce you to a helpful migration tool.

### Preparing for migration

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

For earlier versions of SQL Server Reporting Services, we recommend that you use the [RDL Migration Tool](https://github.com/microsoft/RdlMigration) to help prepare and migrate your reports. This tool was developed by Microsoft to help customers migrate .rdl reports from their SSRS servers to Power BI. It's available on GitHub, and it documents an end-to-end walkthrough of the migration scenario.

The tool automates the following tasks:

* Checks for [unsupported data sources](/power-bi/paginated-reports/paginated-reports-data-sources) and [unsupported report features](/power-bi/paginated-reports/paginated-reports-faq#what-paginated-report-features-in-ssrs-aren-t-yet-supported-in-power-bi-).
* Converts any _shared_ resources to _embedded_ resources:
  * Shared **data sources** become embedded data sources
  * Shared **datasets** become embedded datasets
* Publishes reports that pass checks as _paginated reports_, to a specified Power BI workspace.

It doesn't modify or remove your existing reports. On completion, the tool outputs a summary of all actions completed—successful or unsuccessful.

Over time, Microsoft may improve the tool. The community is encouraged to contribute and help enhance it, too.

## Pre-migration stage

After verifying that your organization meets the pre-requisites, you're ready to start the _Pre-migration_ stage. This stage has three phases:

1. [Discover](#discover)
1. [Assess](#assess)
1. [Prepare](#prepare)

### Discover

The goal of the _Discover_ phase is to identify your existing report server instances. This process involves scanning the network to identify all report server instances in your organization.

You can use the [Microsoft Assessment and Planning Toolkit](https://www.microsoft.com/download/details.aspx?id=7826). The "MAP Toolkit" discovers and reports on your report server instances, versions, and installed features. It's a powerful inventory, assessment, and reporting tool that can simplify your migration planning process.

Organizations may have hundreds of SQL Server Reporting Services (SSRS) reports. Some of those reports may become obsolete due to lack of use. The article [Find and retire unused reports](retire-unused-reports-ssrs.md) can help you discover unused reports and how to create a cadence for cleanup.

### Assess

Having discovered your report server instances, the goal of the _Assess_ phase is to understand any .rdl reports—or server items—that can't be migrated.

Your .rdl reports can be migrated from your report servers to Power BI. Each migrated .rdl report will become a Power BI paginated report.

The following report server item types, however, can't be migrated to Power BI:

- **Shared data sources** and **shared datasets**: The [RDL Migration Tool](https://github.com/microsoft/RdlMigration) automatically converts shared data sources and shared datasets into embedded data sources and datasets, provided that they're using supported data sources.
- **Resources** such as image files
- **Linked reports** migrate, whether the *parent* report that links to them is selected for migration or no. In the Power BI service, they're regular .rdl reports. 
- **KPIs**: Power BI Report Server, or Reporting Services 2016 or later—Enterprise Edition only
- **Mobile reports**: Power BI Report Server, or Reporting Services 2016 or later—Enterprise Edition only
- **Report models**: deprecated
- **Report parts**: deprecated

If your .rdl reports rely on features [not yet supported by Power BI paginated reports](/power-bi/paginated-reports/paginated-reports-faq#what-paginated-report-features-in-ssrs-aren-t-yet-supported-in-power-bi-), you can plan to redevelop them as [Power BI reports](/power-bi/consumer/end-user-reports), when it makes sense.

For more information about supported data sources for paginated reports in the Power BI service, see [Supported data sources for Power BI paginated reports](/power-bi/paginated-reports/paginated-reports-data-sources#other-data-sources).

Power BI allows you to map user names for Analysis Services data sources. The map user names feature is a great way to work around when your user name in Azure Active Directory (Azure AD) doesn't match a UPN in your local Active Directory instance.  To learn more, see this article [Manage your data source - Analysis Services - Power BI](/power-bi/connect-data/service-gateway-enterprise-manage-ssas#user-names-with-analysis-services).

Generally, Power BI paginated reports are optimized for **printing**, or **PDF generation**. Power BI reports are optimized for **exploration and interactivity**. For more information, see [When to use paginated reports in Power BI](report-paginated-or-power-bi.md).

Referencing [custom code](/power-bi/paginated-reports/paginated-reports-faq#can-i-run-custom-code-in-my-report-) DLL files within a report isn't supported.  

Differences in PDF output occur most often when a font that doesn't support non-Latin characters is used in a report and then non-Latin characters are added to the report. You should test the [PDF rendering output](/sql/reporting-services/report-builder/exporting-to-a-pdf-file-report-builder-and-ssrs#verifying-fonts-in-a-pdf-file) on both the report server and the client computers to verify that the report renders correctly.


### Prepare

The goal of the _Prepare_ phase involves getting everything ready. It covers setting up the Power BI environment, planning how you'll secure and publish your reports, and ideas for redeveloping report server items that won't migrate.

1. Verify support for your report [data sources](/power-bi/paginated-reports/paginated-reports-data-sources), and set up a [Power BI gateway](/power-bi/connect-data/service-gateway-onprem) to allow connectivity with any on-premises data sources.
1. Become familiar with Power BI security, and plan [how you'll reproduce your report server folders and permissions](/sql/reporting-services/security/secure-folders) with [Power BI workspaces](/power-bi/collaborate-share/service-new-workspaces).
1. Become familiar with Power BI sharing, and plan how you'll distribute content by publishing [Power BI apps](/power-bi/collaborate-share/service-create-distribute-apps).
1. Consider using [shared Power BI datasets](/power-bi/connect-data/service-datasets-build-permissions) in place of your report server shared data sources.
1. Use [Power BI Desktop](/power-bi/fundamentals/desktop-what-is-desktop) to develop mobile-optimized reports, possibly using the [Power KPI custom visual](https://appsource.microsoft.com/product/power-bi-visuals/WA104381083?tab=Overview) in place of your report server mobile reports and KPIs.
1. Reevaluate the use of the **UserID** built-in field in your reports. If you rely on the **UserID** to secure report data, then understand that for paginated reports (when hosted in the Power BI service) it returns the User Principal Name (UPN). So, instead of returning the NT account name, for example _AW\adelev_, the built-in field returns something like _adelev&commat;adventureworks.com_. You'll need to revise your dataset definitions, and possibly the source data. Once revised and published, we recommend you thoroughly test your reports to ensure data permissions work as expected.
1. Reevaluate the use of the **ExecutionTime** built-in field in your reports. For paginated reports (when hosted in the Power BI service), the built-in field returns the date/time _in Coordinated Universal Time (or UTC)_. It could impact on report parameter default values, and report execution time labels (typically added to report footers).
1. If your data source is SQL Server (on premises), verify that reports aren't using map visualizations. The map visualization depends on SQL Server spatial data types, and these aren't supported by the gateway. For more information, see [Data retrieval guidance for paginated reports (SQL Server complex data types)](report-paginated-data-retrieval.md#sql-server-complex-data-types).
1. Ensure your report authors have [Power BI Report Builder](/power-bi/paginated-reports/report-builder-power-bi) installed, and that you can easily distribute later releases throughout your organization.
1. Utilize [capacity planning](/power-bi/paginated-reports/paginated-capacity-planning) documentation for paginated reports.

## Migration stage

After preparing your Power BI environment and reports, you're ready for the _Migration_ stage.

There are two migration options: _manual_ and _automated_. Manual migration is suited to a small number of reports, or reports requiring modification before migration. Automated migration is suited to the migration of a large number of reports.

### Manual migration

Anyone with permission to access to the report server instance and the Power BI workspace can manually migrate reports to Power BI. Here are the steps to follow:

1. Open the report server portal that contains the reports you want to migrate.
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

- For Power BI Report Server and SQL Server 2022, see [Publish .rdl files to Power BI](publish-reporting-services-power-bi-service.md).
- For previous versions of Reporting Services, use the [RDL Migration Tool](https://github.com/microsoft/RdlMigration) in GitHub.
- The publicly available APIs for Power BI Report Server, Reporting Services, and Power BI

You can also use the publicly available Power BI Report Server, Reporting Services, and Power BI APIs to automate the migration of your content. While the RDL Migration Tool already uses these APIs, you can develop a custom tool suited to your exact requirements.

For more information about the APIs, see:

- [Power BI REST APIs](/rest/api/power-bi/)
- [SQL Server Reporting Services REST APIs](/sql/reporting-services/developer/rest-api)

## Post-migration stage

After you've successfully completed the migration, you're ready for the _Post-migration_ stage. This stage involves working through a series of post-migration tasks to ensure everything is functioning correctly and efficiently.

### Setting query time-out for embedded datasets  

You specify query time-out values during report authoring when you define an embedded dataset. The [time-out value](/power-bi/paginated-reports/paginated-reports-faq#do-i-need-to-set-a-query-time-out-for-an-embedded-dataset-in-a-paginated-report-) is stored with the report, in the Timeout element of the report definition.

### Configure data sources

Once reports have been migrated to Power BI, you'll need to ensure their data sources are correctly set up. It can involve assigning to gateway data sources, and [securely storing data source credentials](/power-bi/paginated-reports/paginated-reports-data-sources#azure-sql-database-authentication). These actions aren't done by the RDL Migration Tool.

### Review report performance

We highly recommended you complete the following actions to ensure the best possible report user experience:

1. Test the reports in each [browser supported by Power BI](/power-bi/fundamentals/power-bi-browsers) to confirm the report renders correctly.
1. Run tests to compare report rending times on the report server and in the Power BI service. Check that Power BI reports render in an acceptable time.
1. If Power BI reports fail to render because of insufficient memory, allocate [additional resources to the Power BI Premium capacity](/power-bi/enterprise/service-admin-premium-workloads#paginated-reports).
1. For long-rendering reports, consider having Power BI deliver them to your report users as [email subscriptions with report attachments](/power-bi/visuals/power-bi-visualization-export-data).
1. For Power BI reports based on Power BI datasets, review model designs to ensure they're fully optimized.

### Reconcile issues

The Post-migration phase is crucial for reconciling any issues, and that you address any performance concerns. Adding the paginated reports workload to a capacity can contribute to slow performance—for paginated reports _and other content_ stored in the capacity.

## Next steps

For more information about this article, check out the following resources:

- [Publish .rdl files to Power BI from Power BI Report Server and SQL Server 2022 Reporting Services](publish-reporting-services-power-bi-service.md)
- [RDL Migration Tool for older versions of Reporting Services](https://github.com/microsoft/RdlMigration)
- [Power BI Report Builder](/power-bi/paginated-reports/paginated-reports-report-builder-power-bi)
- [Data retrieval guidance for paginated reports](report-paginated-data-retrieval.md)
- [When to use paginated reports in Power BI](report-paginated-or-power-bi.md)
- [Paginated reports in Power BI: FAQ](/power-bi/paginated-reports/paginated-reports-faq)
- [Online course: Paginated Reports in a Day](/power-bi/learning-catalog/paginated-reports-online-course)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com)

Power BI partners are available to help your organization succeed with the migration process. To engage a Power BI partner, visit the [Power BI partner portal](https://powerbi.microsoft.com/partners/).
