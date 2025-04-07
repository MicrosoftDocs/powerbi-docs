---
title: External tools in Power BI Desktop
description: Learn how to extend the use of Power BI Desktop with external tools developed by community contributors.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: concept-article
ms.date: 09/04/2024
ms.custom: FY25Q1-Linter
LocalizationGroup: Create reports
#customer intent: As a Power BI user I want to learn about external tools in Power BI Desktop.
---

# External tools in Power BI Desktop

Power BI has a vibrant community of business intelligence professionals and developers. Community contributors create free tools that use Power BI and Analysis Services APIs to extend and integrate with Power BI Desktop's data modeling and reporting features.

The **External Tools** ribbon provides easy access to external tools that are installed locally and *registered* with Power BI Desktop. When launched from the External Tools ribbon, Power BI Desktop passes the name and port number of its internal data model engine instance and the current model name to the tool. The tool then automatically connects, providing a seamless connection experience.  

:::image type="content" source="media/desktop-external-tools/external-tools-ribbon.png" border="false" alt-text="Screenshot of the external tools ribbon in Power BI Desktop.":::

## External tool categories

External tools generally fall into one of the following categories:

**Semantic modeling** - Open-source tools such as DAX Studio, ALM Toolkit, Tabular Editor, and Metadata Translator extend Power BI Desktop functionality for specific data modeling scenarios such as Data Analysis Expressions (DAX) query and expression optimization, application lifecycle management (ALM), and metadata translation.

**Data analysis** - Tools for connecting to a model in read-only to query data and perform other analysis tasks. For example, a tool might launch Python, Excel, and Power BI Report Builder. The tool connects the client application to the model in Power BI Desktop for testing and analysis without having to first publish the Power BI Desktop (*pbix*) file to the Power BI service. Tools to document a Power BI semantic model also fall into this category.

**Miscellaneous** - Some external tools don’t connect to a model at all, but instead extend Power BI Desktop to make helpful tips and make helpful content more readily accessible. For example, PBI.tips tutorials, DAX Guide from sqlbi.com, and the PowerBI.tips Product Business Ops community tool, make installation of a large selection of external tools easier. These tools also assist registration with Power BI Desktop, including DAX Studio, ALM Toolkit, Tabular Editor, and many others easy.

**Custom** - Integrate your own scripts and tools by adding a *.pbitool.json document to the Power BI Desktop\External Tools folder.

Before installing external tools, keep the following notes in mind:

- External tools aren't supported in Power BI Desktop for Power BI Report Server.

- External tools are provided by external, third-party contributors. Except for the underlying public Microsoft APIs, Microsoft doesn't provide support or documentation for external tools. Microsoft does provide support if the issue can be reproduced with Microsoft tools. These tools include SQL Server Management Studio (SSMS), or sample code that uses the public Microsoft APIs.

## Featured open-source tools

There are many external tools out there. Here are some of the most popular and belong in every Power BI Desktop data modelers toolbox:

|Tool  |Description  |
|---------|---------|
|PowerBI.tips - Business Ops      |   An easy to use deployment tool for adding external tools extensions to Power BI Desktop. The Business Ops goal is to provide a one stop shop for installing all the latest versions of external tools. To learn more, go to [PowerBI.tips - Business Ops](https://powerbi.tips/product/business-ops/).      |
|Tabular Editor     |   Model creators can easily build, maintain, and manage tabular models by using an intuitive and lightweight editor. A hierarchical view shows all objects in your tabular model organized by display folders, with support for multi-select property editing and DAX syntax highlighting. To learn more, go to [tabulareditor.com](https://tabulareditor.com/).       |
|DAX Studio      | A feature-rich tool for DAX authoring, diagnosis, performance tuning, and analysis. Features include object browsing, integrated tracing, query execution breakdowns with detailed statistics, DAX syntax highlighting and formatting. To get the latest, go to [DAX Studio](https://github.com/DaxStudio/DaxStudio) on GitHub.         |
|ALM Toolkit     |   A schema compare tool for Power BI models and semantic models, used for application lifecycle management (ALM) scenarios. You can perform straightforward deployment across environments and retain incremental refresh historical data. You can diff and merge metadata files, branches, and repos. You can also reuse common definitions between semantic models. To get the latest, go to [alm-toolkit.com](http://alm-toolkit.com/).      |
|Metadata Translator      |    Streamlines localization of Power BI models and semantic models. The tool can automatically translate captions, descriptions, and display folder names of tables, columns, measures, and hierarchies. The tool translates by using the machine translation technology of Azure Cognitive Services. You can also export and import translations via Comma Separated Values (.csv) files for convenient bulk editing in Excel or a localization tool. To get the latest, go to [Metadata Translator](https://github.com/microsoft/Analysis-Services/tree/master/MetadataTranslator) on GitHub.    |

## External tools integration architecture

Power BI Desktop (*pbix*) files consist of multiple components including the report canvas, visuals, model metadata, and any data that was loaded from data sources. When Power BI Desktop opens a *pbix* file, it launches an Analysis Services process in the background to load the model so that the data modeling features and report visuals can access model metadata and query model data.

When Power BI Desktop launches Analysis Services as its analytical data engine, it dynamically assigns a random port number. It also loads the model with a randomly generated name in the form of a globally unique identifier (GUID). Because these connection parameters change with every Power BI Desktop session, it's difficult for external tools to discover on their own the correct Analysis Services instance and model to connect to. External tools integration solves this problem by allowing Power BI Desktop to send the Analysis Services server name, port number, and model name to the tool as command-line parameters when starting the external tool from the External Tools ribbon, as shown in the following diagram.

:::image type="content" source="media/desktop-external-tools/external-tool-arch.png" border="false" alt-text="Diagram of the external tool architecture.":::

With the Analysis Services Server name, port number, and model name, the tool uses Analysis Services client libraries to establish a connection to the model, retrieve metadata, and execute DAX or MDX queries. Whenever an external data modeling tool updates the metadata, Power BI Desktop synchronizes the changes so that the Power BI Desktop user interface reflects the current state of the model accurately. Keep in mind there are some limitations to the synchronization capabilities as described later.

## Data modeling operations

External tools, which connect to Power BI Desktop's Analysis Services instance, can make changes (write operations) to the data model. Power BI Desktop then synchronizes those changes with the report canvas so they're shown in report visuals. For example, external data modeling tools can override the original format string expression of a measure, and edit any of the measure properties including KPIs and detail rows. External tools can also create new roles for object and row-level security, and add translations.

### Supported write operations

Objects that support write operations:

| Object                        | Connect to AS instance    |
|-------------------------------|---------------------------|
| Tables                        | No                        |
| Columns                       | Yes [1]                   |
| Calculated tables             | Yes                       |
| Calculated columns            | Yes                       |
| Relationships                 | Yes                       |
| Measures                      | Yes                       |
| Model KPIs                    | Yes                       |
| Calculation groups            | Yes                       |
| Perspectives                  | Yes                       |
| Translations                  | Yes                       |
| Row Level Security (RLS)      | Yes                       |
| Object Level Security (OLS)   | Yes                       |
| Annotations                   | Yes                       |
| M expressions                 | No                        |

[1] When using external tools to connect to the AS instance, changing a column's data type is supported, however, renaming columns isn't supported.

Power BI Desktop *project files* offer a broader scope of supported write operations. Those objects and operations that don't support write operations by using external tools to connect to Power BI Desktop's Analysis Services instance may be supported by editing Power BI Desktop project files. To learn more, see [Power BI Desktop projects - Model authoring](../developer/projects/projects-overview.md#model-authoring).

### Data modeling limitations

All Tabular Object Model (TOM) metadata can be accessed for read-only. Write operations are limited because Power BI Desktop must remain in-sync with the external modifications, therefore the following operations aren't supported:

- Any TOM object types not covered in Supported write operations, such as tables and columns.
- Editing a Power BI Desktop template (PBIT) file.
- Report-level or data-level translations.
- Renaming tables and columns isn't yet supported
- Sending processing commands to a semantic model loaded in Power BI Desktop

## Registering external tools

External tools are *registered* with Power BI Desktop when the tool includes a \*.pbitool.json registration file in the `C:\Program Files (x86)\Common Files\Microsoft Shared\Power BI Desktop\External Tools` folder. When a tool is registered, and includes an icon, the tool appears in the External Tools ribbon. Some tools, like ALM Toolkit and DAX Studio create the registration file automatically when you install the tool. However, many tools, like SQL Profiler typically don't because the installer they do have doesn't include creating a registration file for Power BI Desktop. Tools that don't automatically register with Power BI Desktop can be registered manually by creating a \*.pbitool.json registration file.

To learn more, including json examples, see [Register an external tool](desktop-external-tools-register.md).

## Disabling the External Tools ribbon

The External Tools ribbon is enabled by default, but can be disabled by using Group Policy or editing the **EnableExternalTools** registry key directly.

- Registry key: `Software\Policies\Microsoft\Power BI Desktop\`
- Registry value: `EnableExternalTools`

A value of 1 (decimal) enables the External Tools ribbon, which is also the default value.

A value of 0 (decimal) disable the External Tools ribbon.

## Related content

- [Register an external tool](desktop-external-tools-register.md)  
