---
title: Dataflows best practices
description: Learn about where you can find more information about Power BI best practices and get guidance for dataflows.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: how-to
ms.date: 02/07/2023
LocalizationGroup: Data from files
---
# Dataflows best practices

Power BI dataflows are an enterprise-focused data prep solution, enabling an ecosystem of data that's ready for consumption, reuse, and integration. This article provides a list of best practices, with links to articles and other information that will help you understand and use dataflows to their full potential.

## Dataflows across the Power Platform

Dataflows can be used across various Power Platform technologies, such as Power Query, Microsoft Dynamics 365, and other Microsoft offerings. For more information about how dataflows can work across the Power Platform, see [What are dataflows](/power-query/dataflows/overview-dataflows-across-power-platform-dynamics-365).

## Note: There is no way to recover a dataflow that has been deleted. Remember to create a back up of your dataflow. There are multiple ways of creating a backup:

You can enable the Azure storage connection on your Power BI workspace, which will automatically store a copy of your dataflow definition and snapshots in a data lake. This way, you can recover a deleted or modified dataflow by downloading the model.json file from the lake and importing it back to Power BI.

You can use Power Automate or Azure Logic Apps to export your dataflow definition to a JSON file and store it in SharePoint or Azure Data Lake Gen2. This option allows you to backup your dataflow in different file storage options and automate the process.

You can manually export your dataflow to a JSON file and import it to another workspace or location. This option is simple and quick, but requires you to do it manually every time you want to backup your dataflow. 

You can also backup and restore your Power BI datasets using SQL Server Management Studio (SSMS) or other tools that connect to Power BI via XMLA endpoints. This option is useful if you want to backup your entire dataset, not just the dataflow. 

## Dataflows best practices table and links

The following table provides a collection of links to articles that describe best practices when creating or working with dataflows. The links include information about developing business logic, developing complex dataflows, reuse of dataflows, and how to achieve enterprise-scale with your dataflows.

|**Topic**  |**Guidance area**  |**Link to article or content**  |
|---------|---------|---------|
|Power Query     | Tips and tricks to get the most of your data wrangling experience        |[Best practices when working with Power Query](/power-query/best-practices)        |
|Using computed tables     |Performance benefits for using computed tables in a dataflow         |[Computed tables scenarios](/power-query/dataflows/computed-entities-scenarios)         |
|Developing complex dataflows     |Patterns for developing large-scale, performant dataflows         |[Best practices for designing and developing complex dataflows](/power-query/dataflows/best-practices-developing-complex-dataflows)         |
|Reusing dataflows     |Patterns, guidance, and use cases         |[Best practices for reusing dataflows across environments and workspaces](/power-query/dataflows/best-practices-reusing-dataflows)         |
|Large-scale implementations     |Large-scale use and guidance to complement enterprise architecture         |[Best practices for creating a dimensional model using dataflows](/power-query/dataflows/best-practices-for-data-warehouse-using-dataflows)         |
|Using enhanced compute     |Potentially improve dataflow performance up to 25x         |[Using the compute engine to improve performance](dataflows-premium-workload-configuration.md#using-the-compute-engine-to-improve-performance)         |
|Optimizing your workload settings     |Get the most out of your dataflows infrastructure by understanding the levers you can pull to maximize performance         |[Configure Power BI Premium dataflow workloads](dataflows-premium-workload-configuration.md)         |
|Joining and expanding tables     |Creating performant joins         |[Optimize Power Query when expanding table columns](/power-query/optimize-expanding-table-columns)         |
|Query folding guidance     |Speeding up transformations using the source system         |[Power Query query folding](/power-query/power-query-folding)         |
|Using data profiling     |Understand column quality, distribution, and profile         |[Using the data profiling tools](/power-query/data-profiling-tools)         |
|Implementing error handling     |Developing robust dataflows resilient to refresh errors, with suggestions         |[Dealing with errors in Power Query](/power-query/dealing-with-errors)  </br> [Error handling](/power-query/error-handling)      |
|Use Schema view      |Improve the authoring experience when working with a wide table and performing schema level operations         |[Schema view](/power-query/schema-view)         |
|Linked tables      |Reusing and referencing transformations         |[Create a dataflow by using linked tables](./dataflows-create.md#create-a-dataflow-by-using-linked-tables)         |
|Incremental refresh      |Load the latest or changed data versus a full reload         |[Using incremental refresh with dataflows](/power-query/dataflows/incremental-refresh)         |

## Next steps

The following articles provide more information about dataflows and Power BI:

* [Introduction to dataflows and self-service data prep](dataflows-introduction-self-service.md)
* [Creating a dataflow](dataflows-create.md)
* [Configure and consume a dataflow](dataflows-configure-consume.md)
* [Premium features of dataflows](dataflows-premium-features.md)
* [Configuring Dataflow storage to use Azure Data Lake Gen 2](dataflows-azure-data-lake-storage-integration.md)
* [AI with dataflows](dataflows-machine-learning-integration.md)
* [Dataflows considerations and limitations](dataflows-features-limitations.md)
