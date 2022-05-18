---
title: Introduction to datamarts
description: Overview of datamarts and how to use them
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-datamarts
ms.topic: how-to
ms.date: 05/24/2022
LocalizationGroup: Data from files
---
# Introduction to datamarts

Datamarts are self-service analytics solutions, enabling users to store and explore data that is loaded in a fully managed database. Datamarts provide a simple and optionally no-code experience to ingest data from different data sources, extract transform and load (ETL) the data using Power Query, then load it into an Azure SQL database that's fully managed and requires no tuning or optimization. 

Once data is loaded into a datamart, you can additionally define relationships and policies for business intelligence and analysis. Datamarts automatically generate a dataset or semantic model, which can be used to create Power BI reports and dashboards. You can also query a datamart using a T-SQL endpoint or using a visual experience.

:::image type="content" source="media/datamarts-overview/datamarts-overview-01.png" alt-text="Diagram that shows datamarts and power B I relationship.":::

Datamarts offer the following benefits:

* Self-service users can easily perform relational database analytics, without the need for a database administrator
* Datamarts provide end-to-end data ingestion, preparation and exploration with SQL, including no-code experiences
* Enable building semantic models and reports within one holistic experience

Datamart features:

* 100% web-based, no additional software required
* Native integration with Power BI (datasets, paginated reports), Office (Excel, Teams) and the rest of the Microsoft analytics offerings
* Automated performance tuning
* Easy low-code and no-code experiences for any user
* Support for SQL and other popular client tools
* Provide visual experiences for querying data and ad-hoc analysis
* Included with Power BI Premium capacities and Premium Per User

## When to use datamarts

Datamarts are targeted towards high concurrency, interactive data workloads for self-service scenarios. For example, if you're working in accounting or finance, you can build your own data models and collections, which you can then use to self-serve business questions and answers through T-SQL and visual query experiences. In addition, you can still use those data collections for more traditional Power BI reporting experiences. Datamarts are recommended for customers who need domain oriented, decentralized data ownership and architecture, such as users who need data as a product or a self-service data platform.

Datamarts are designed to support the following scenarios:

* **Centralize aata:** Centralize small to moderate data volume (approximately 100 GB) in a self-service fully managed SQL database. Datamarts enable you to designate a single store for self-service departmental downstream reporting needs (sych as Excel, Power BI reports, others), thereby reducing the infrastructure in self-service solutions.

* **Relational database analytics with Power BI:** Access a datamart’s data using external SQL clients. Azure Synapse and other services/tools that use T-SQL can also use datamarts in Power BI.

* **End-to-end semantic models and report creation:** Enable Power BI creators to build end-to-end solutions without dependencies on other tooling or IT teams. Datamarts gets rid of managing orchestration between dataflows and datasets through auto-generated datasets, while providing visual experiences for querying data and ad-hoc analysis, all backed by Azure SQL DB.

## Comparing datamarts to dataflows and data sets

This sections describes the differences between datamarts, dataflows and data sets. 

**[Dataflows](../dataflows/dataflows-introduction-self-service.md)** provide reusable extract, transform and load (ETL). Tables cannot be browsed, queried, or explored without a dataset, but can be defined for reuse. The data is exposed in Power BI or [CDM format](/common-data-model/) if you bring your own [data lake](../dataflows/dataflows-azure-data-lake-storage-integration.md). Dataflows are used by Power BI to ingest data into your datamarts. You should use dataflows whenever you want to reuse your ETL logic.

Use **dataflows** when you need to:
* Build reusable and shareable data prep for items in Power BI.


**Datamarts** are a fully managed database that enables you to store and explore your data in a relational and fully managed Azure SQL DB. Datamarts provide SQL support, a no-code visual query designer, Role Level Security (RLS), and auto-generation of a dataset for each datamart. You can perform ad-hoc analysis and create reports, all on the web.

Use **datamarts** when you need to:
* Sort, filter, do simple aggregation visually or through expressions defined in SQL
* For outputs that are results, sets, tables, and filtered tables of data
* Provide accessible data through a SQL endpoint
* Enable users who don’t have access to Power BI Desktop

**[Datasets](../../connect-data/service-datasets-understand.md)** are semantic models with business semantics and measures that enable business intelligence reporting. Datasets always serve a purpose and can accentuate the value a datamart. 
For example, datasets can provide composite models, Analyze in Excel functionality, dataset hub, reports in the web, downloaded pbix files, and so on.

Use **datasets** when you need to:
* Define complex business logic and calculations
* Work with aggregate data and build reports on top of it
* Use traditional Power BI reporting and dashboards

The following table describes these offerings and the best uses for each, including their role with datamarts.

| Item | Recommended Use Case | Complementing role with datamarts |
| --- | --- | --- |
| Dataflows | Reusable data prep (ETL) for datasets or marts | Datamarts use a single, built-in dataflow for ETL. Dataflows can accentuate this, enabling:<ul> <li>Loading data to datamarts with different refresh schedules<li>Separating ETL and data prep steps from storage, so it can be reused by datasets</ul> |
| Datasets | Metrics and semantic layer for BI reporting | Datamarts provide an auto-generated dataset for reporting, enabling:<ul> <li>Creating subsets of the datamart tables for fine grained reporting<li>Composite models - a dataset with data from the datamart and other data sources outside of the datamart<li>Proxy models - a dataset which uses DirectQuery for the auto-generated model, using a single source of truth</ul> |
| Datamarts | User-based data warehousing and SQL access to your data | Datamarts can be used as sources for other datamarts or items, using the SQL endpoint:<ul> <li>External sharing<li>Sharing across departmental or organizational boundaries with security enabled</ul> |
| Paginated Reports | Pixel-perfect static tables, matrices, and charts | Creating formatted tables, matrices, or static charts from SQL |


The following image illustrates which solutions are best suited for specific tasks in Power BI.

:::image type="content" source="media/datamarts-overview/datamarts-overview-02.png" alt-text="Diagram showing flowchart for choosing when to use datamarts.":::


## Next steps
This article provided an overview of datamarts and the many ways you can use them. 

The following articles provide more information about datamarts and Power BI:

* [Understand datamarts](datamarts-understand.md)
* [Get started with datamarts](datamarts-get-started.md)
* [Analyzing datamarts](datamarts-analyze.md)
* [Create reports with datamarts](datamarts-create-reports.md)
* [Access control in datamarts](datamarts-access-control.md)
* [Datamart administration](datamarts-administration.md)


For more information about dataflows and transforming data, consult the following articles:
* [Introduction to dataflows and self-service data prep](../dataflows/dataflows-introduction-self-service.md)
* [Tutorial: Shape and combine data in Power BI Desktop](../../connect-data/desktop-shape-and-combine-data.md)

