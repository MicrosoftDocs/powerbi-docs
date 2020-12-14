---
title: Dataflows best practices
description: A collection of best practice links and guidance for dataflows
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: how-to
ms.date: 12/10/2020
LocalizationGroup: Data from files
---
# Dataflows best practices

Power BI **dataflows** are an enterprise-focused data prep solution, enabling an ecosystem of data that's ready for consumption, reuse, and integration. This article provides a list of best practices, with links to articles and other information that will help you understand and use dataflows to their full potential.

## Dataflows across the Power Platform

Dataflows can be used across various Power Platform technologies, such as Power Query, Microsoft Dynamics 365, and other Microsoft offerings. For more information about how dataflows can work across the Power Platform, see [using dataflows across Microsoft products](https://docs.microsoft.com/power-query/dataflows/overview-dataflows-across-power-platform-dynamics-365).


## Dataflows best practices table and links

The following table provides a collection of links to articles that describe best practices when creating or working with dataflows. The links include information about developing business logic, developing complex dataflows, re-use of dataflows, and how to achieve enterprise-scale with your dataflows.


|**Topic**  |**Guidance area**  |**Link to article or content**  |
|---------|---------|---------|
|Power Query     | Tips and tricks to get the most of your data wrangling experience        |[Power Query best practices](https://docs.microsoft.com/power-query/best-practices)        |
|Leveraging Computed Entities     |There are performance benefits for using computed entities in a dataflow         |[Computed Entities Scenarios](https://docs.microsoft.com/power-query/dataflows/computed-entities-scenarios)         |
|Developing complex dataflows     |Patterns for developing large-scale, performant dataflows         |[Complex dataflows](https://docs.microsoft.com/power-query/dataflows/best-practices-developing-complex-dataflows)         |
|Reusing dataflows     |Patterns, guidance, and use cases         |[Reusing dataflows](https://docs.microsoft.com/power-query/dataflows/best-practices-reusing-dataflows)         |
|Large-scale implementations     |Large-scale use and guidance to complement enterprise architecture         |[Data warehousing using dataflows](https://docs.microsoft.com/power-query/dataflows/best-practices-for-data-warehouse-using-dataflows)         |
|Leveraging Enhanced Compute     |Potentially improve dataflow performance up to 25x         |[Enhanced Compute Engine](dataflows-premium-workload-configuration.md#using-the-compute-engine-to-improve-performance)         |
|Optimizing your workload settings     |Get the most our of your dataflows infrastructure by understanding the levers you can pull to maximize performance         |[Dataflows workload configuration](dataflows-premium-workload-configuration.md)         |
|Joining and expanding tables     |Creating performant joins         |[Optimize expanding table operations](https://docs.microsoft.com/power-query/optimize-expanding-table-columns)         |
|Query folding guidance     |Speeding up transformations using the source system         |[Query folding](https://docs.microsoft.com/power-query/power-query-folding)         |
|Using data profiling     |Understand column quality, distribution, and profile         |[Data profiling tools](https://docs.microsoft.com/power-query/data-profiling-tools)         |
|Implementing error handling     |Developing robust dataflows resilient to refresh errors, with suggestions         |[Patterns for common errors](https://docs.microsoft.com/power-query/dealing-with-errors)  </br> [Complex error handling](https://docs.microsoft.com/power-query/error-handling)      |
|Use Schema view      |Improve the authoring experience when working with a wide table and performing schema level operations         |[Schema view](https://docs.microsoft.com/power-query/schema-view)         |
|Linked entities      |Reusing and referencing transformations         |[Linked Entities](https://docs.microsoft.com/power-query/dataflows/linked-entities)         |
|Incremental refresh      |Load the latest or changed data versus a full reload         |[Incremental refresh](https://docs.microsoft.com/power-query/dataflows/incremental-refresh)         |
|||


		
## Next steps

The following articles provide more information about dataflows and Power BI:

* [Introduction to dataflows and self-service data prep](dataflows-introduction-self-service.md)
* [Creating a dataflow](dataflows-create.md)
* [Configure and consume a dataflow](dataflows-configure-consume.md)
* [Premium features of dataflows](dataflows-premium-features.md)
* [Configuring Dataflow storage to use Azure Data Lake Gen 2](dataflows-azure-data-lake-storage-integration.md)
* [AI with dataflows](dataflows-machine-learning-integration.md)
* [Dataflows limitations and considerations](dataflows-features-limitations.md)