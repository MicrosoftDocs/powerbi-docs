---
title: External tools in Power BI Desktop
description: Extend the use of Power BI Desktop with external tools
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 05/06/2021
LocalizationGroup: Create reports
---

# External tools in Power BI Desktop

Power BI has a vibrant community of BI professionals and developers. A vital part of that community are contributors that create free tools that use Power BI and Analysis Services APIs to extend and integrate with Power BI Desktop's data modeling and reporting features. 

The **External Tools** ribbon provides easy access to external tools that have been installed locally and *registered* with Power BI Desktop. When launched from the External Tools ribbon, Power BI Desktop passes the name and port number of its internal data model engine instance to the tool, and the current model name. The tool then automatically connects, providing a seamless connection experience.  

:::image type="content" source="media/desktop-external-tools/external-tools-ribbon.png" border="false" alt-text="The external tools ribbon in Power BI Desktop":::


External tools generally fall into one of the following categories:

**Semantic modeling** - Open-source tools such as DAX Studio, ALM Toolkit, Tabular Editor, and Metadata Translator extend Power BI Desktop functionality for specific data modeling scenarios such as DAX query and expression optimization, application lifecycle management (ALM), and metadata translation.

**Data analysis** - Tools for connecting to a model in read-only to query data and perform other analysis tasks. For example, tools that launch Python, Excel, and Power BI Report Builder and connect the client application to the model in Power BI Desktop for testing and analysis without having to first publish the Power BI Desktop (pbix) file to the Power BI service. Tools to document a Power BI dataset also fall into this category.

**Miscellaneous** - Some external tools don’t connect to a model at all, but instead extend Power BI Desktop to make helpful tips and make helpful content more readily accessible. For example, PBI.tips tutorials, DAX Guide from sqlbi.com, and the PowerBI.tips Product Business Ops community tool, which makes installation of a large selection of external tools and their registration with Power BI Desktop, including DAX Studio, ALM Toolkit, Tabular Editor, and many others easy.

**Custom** - Integrate your own scripts and tools by adding a  *.pbitool.json document to the Power BI Desktop\External Tools folder.

Before installing external tools, keep the following in mind:

- External tools are not supported in Power BI Desktop for Power BI Report Server.

- External tools are provided by external, third-party contributors. Microsoft does not provide support or documentation for external tools.

## Featured open-source tools

There are many external tools out there. Here are some of the most popular and belong in every Power BI Desktop data modelers toolbox:

|Tool  |Description  |
|---------|---------|
|PowerBI.tips - Business Ops      |   An easy to use deployment tool for adding external tools extensions to Power BI Desktop. The Business Ops goal is to provide a one stop shop for installing all the latest versions of external tools. To learn more, go to the [PowerBI.tips - Business Ops](https://powerbi.tips/product/business-ops/) website.      |
|Tabular Editor     |   Model creators can easily build, maintain, and manage tabular models using an intuitive and lightweight editor. A hierarchical view shows all objects in your tabular model organized by display folders, with support for multi-select property editing and DAX syntax highlighting. To learn more, go to [tabulareditor.com](https://tabulareditor.com/).       |
|DAX Studio      | A feature-rich tool for DAX authoring, diagnosis, performance tuning, and analysis. Features include object browsing, integrated tracing, query execution breakdowns with detailed statistics, DAX syntax highlighting and formatting. To get the latest, go to [DAX Studio](https://github.com/DaxStudio/DaxStudio) on GitHub.         |
|ALM Toolkit     |   A schema compare tool for Power BI models and datasets, used for application lifecycle management (ALM) scenarios. You can perform straightforward deployment across environments and retain incremental refresh historical data. You can diff and merge metadata files, branches, and repos. You can also reuse common definitions between datasets. To get the latest, go to [alm-toolkit.com](http://alm-toolkit.com/).      |
|Metadata Translator      |    Streamlines localization of Power BI models and datasets. The tool can automatically translate captions, descriptions, and display folder names of tables, columns, measures, and hierarchies by using the machine translation technology of Azure Cognitive Services. You can also export and import translations via Comma Separated Values (.csv) files for convenient bulk editing in Excel or a localization tool. To get the latest, go to [Metadata Translator](https://github.com/microsoft/Analysis-Services/tree/master/MetadataTranslator) on GitHub.    |

## External tools integration architecture

Power BI Desktop (pbix) files consist of multiple components including the report canvas, visuals, model metadata, and any data that has already been loaded from data sources. When Power BI Desktop opens a pbix file, it launches an Analysis Services process in the background to load the model so that the data modeling features and the report visuals can access model metadata and query model data.

When Power BI Desktop launches Analysis Services as its analytical data engine, it dynamically assigns a random port number and loads the model with a randomly generated name in the form of a globally unique identifier (GUID). Because these connection parameters change with every Power BI Desktop session, it's difficult for external tools to discover on their own the correct Analysis Services instance and model to connect to. External tools integration solves this problem by allowing Power BI Desktop to communicate the Analysis Services server name, port number, and model name to the tool as command-line parameters when starting the external tool from the External Tools ribbon, as shown in the following diagram.

:::image type="content" source="media/desktop-external-tools/external-tool-arch.png" border="false" alt-text="External tool architecture":::

With the Analysis Services Server name, port number, and model name, the tool uses Analysis Services client libraries to establish a connection to the model, retrieve metadata, and execute DAX or MDX queries. Whenever an external data modeling tool updates the metadata, Power BI Desktop synchronizes the changes so that the Power BI Desktop user interface reflects the current state of the model accurately. Keep in mind there are some limitations to the synchronization capabilities as described below.

## Data modeling operations

External data modeling tools can apply modifications and have Power BI synchronize those changes with the report canvas. This synchronization is so those modifications are consistently applied in Power BI visuals. For example, external data modeling tools can override the original format string expression of a measure, and edit any of the measure properties including KPIs and detail rows. External tools can also create new roles for object and row-level security, and add translations.

### Supported write operations

- Define and edit [measures](/analysis-services/tabular-models/measures-ssas-tabular?view=power-bi-premium-current&preserve-view=true) for calculations, including format string, KPI, and detail rows settings.
- Add [calculation groups](/analysis-services/tabular-models/calculation-groups?view=power-bi-premium-current&preserve-view=true) for calculation reusability in complex models. 
- Create [perspectives](/analysis-services/tabular-models/perspectives-ssas-tabular?view=power-bi-premium-current&preserve-view=true) to define focused, business-domain specific views of dataset metadata.
- Apply [metadata translations](/analysis-services/tabular-models/translations-in-tabular-models-analysis-services?view=power-bi-premium-current&preserve-view=true) to support multi-language versions within a single dataset.
- Add dataset roles for [row-level security (RLS)](../guidance/rls-guidance.md) and [object-level security (OLS)](/analysis-services/tabular-models/object-level-security?view=power-bi-premium-current&preserve-view=true) rules to restrict data access.

### Data modeling limitations

All Tabular Object Model (TOM) metadata can be accessed for read-only. Write operations are limited because Power BI Desktop must remain in-sync with the external modifications, therefore the following operations are not supported:

- Any TOM object types not covered in Supported write operations, such as tables and columns.
- Editing a Power BI Desktop template (PBIT) file.
- Report-level or data-level translations.
- Renaming tables and columns is not yet supported
- Sending processing commands to a dataset loaded in Power BI Desktop

## Registering external tools

External tools are *registered* with Power BI Desktop when the tool includes a \*.pbitool.json registration file in the `Program Files (x86)\Common Files\Microsoft Shared\Power BI Desktop\External Tools` folder. When a tool is registered, and includes an icon, the tool appears in the External Tools ribbon. Some tools, like ALM Toolkit and DAX Studio create the registration file automatically when you install the tool. However, many tools, like SQL Profiler typically do not because the installer they do have does not include creating a registration file for Power BI Desktop. Tools that don't automatically register with Power BI Desktop can be registered manually by creating a \*.pbitool.json registration file.

To learn more, including json examples, see [Register an external tool](desktop-external-tools-register.md).

## Disabling the External Tools ribbon

The External Tools ribbon is enabled by default, but can be disabled by using Group Policy or editing the **EnableExternalTools** registry key directly.

- Registry key: Software\Policies\Microsoft\Power BI Desktop\
- Registry value: EnableExternalTools

A value of 1 (decimal) enables the External Tools ribbon, which is also the default value.

A value of 0 (decimal) disable the External Tools ribbon.

## See also

[Register an external tool](desktop-external-tools-register.md)  
