---
title: Use notebooks with a semantic model
description: Learn how to use notebooks with semantic models in Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 03/31/2025
LocalizationGroup: Transform and shape data
---

# Use notebooks with a semantic model

With [Fabric notebooks](/fabric/data-engineering/how-to-use-notebook) and [semantic link](/fabric/data-science/semantic-link-overview), you can use code to analyze semantic models, along with other data science and data engineering features, enabling you to perform in-depth statistical analysis and predictive modeling in customizable and flexible ways. 


**Microsoft Fabric notebooks** provide interactive ways for data engineers and data scientists to build Apache Spark jobs, manage data workflows and develop machine learning models. Fabric notebooks provide an easy low-code interface with enterprise security, integration with Lakehouse and built-in visualization tools. Notebooks also support collaboration through commenting, tagging and version control, simplifying the management of code execution, data exploration, and model deployment. 

**Semantic link** functionality lets you establish a connection between semantic models and data science capabilities in Microsoft Fabric, so you can optimize Fabric items for performance, memory, and cost. 

## Open sample notebooks from your semantic model

Notebooks offer a collection of ready-made experiences for semantic models to help you get started, which you can access in multiple ways:

* From the **Home** tab of the ribbon, [editing semantic models](service-edit-data-models.md) in the Power BI service, shown in the following image.
    :::image type="content" source="media/service-notebooks/service-notebooks-01.png" alt-text="Screenshot of home ribbon accessing notebook experiences.":::

* From the semantic model details page under the **Model health** dropdown, shown in the following image.
    :::image type="content" source="media/service-notebooks/service-notebooks-02.png" alt-text="Screenshot of model health drop-down menu accessing notebook experiences.":::

* From **More options (...)** in the OneLake catalog when selecting a semantic model, shown in the following image.
    :::image type="content" source="media/service-notebooks/service-notebooks-03.png" alt-text="Screenshot of more options menu in the one lake catalog to access notebook experiences.":::

The functions used in these sample notebooks are examples of useful functions that semantic link enables. You can find more functions and helper notebooks in [Semantic Link Labs](https://github.com/microsoft/semantic-link-labs), a Python library that extends semantic link capabilities to automate technical tasks. You don’t have to be a Python expert to use Semantic Link or Semantic Link Labs. Many functions can be used simply by entering your parameters and running the notebook.


## Best practice analyzer

When you run the sample notebook, the **Best Practice Analyzer (BPA)** offers tips to improve the design and performance of your semantic model. By default, the BPA checks a set of more than 60 rules against your semantic model and summarizes the results. The rules used in the BPA come from experts within Microsoft and the Fabric Community. The suggestions for improvement are organized into five categories: Performance, DAX Expressions, Error Prevention, Maintenance, and Formatting.

The following image shows the BPA in use. 

:::image type="content" source="media/service-notebooks/service-notebooks-04.png" alt-text="Screenshot of the best practice analyzer results." lightbox="media/service-notebooks/service-notebooks-04.png":::

## Model memory analyzer

When you run the sample notebook notebook, the **Memory Analyzer** shows you memory and storage statistics about the objects in your semantic model, such as Tables, Columns, Hierarchies, Partitions, and Relationships. The statistics the Memory Analyzer returns can be used to identify areas of performance optimization and memory reduction for your semantic model. The following image shows the Memory Analyzer in use. 

:::image type="content" source="media/service-notebooks/service-notebooks-05.png" alt-text="Screenshot of memory analyzer results." lightbox="media/service-notebooks/service-notebooks-05.png":::

## Requirements and permissions

The following requirements and permissions settings apply to notebooks:

* Users must have *build* permission on the semantic model to create a sample notebook from the semantic model entry points described in this article. For more information, see the [semantic model permissions](../connect-data/service-datasets-permissions.md) article.
* To create a notebook the workspace must have Fabric capacity, and the user must have contributor access to the workspace where the notebook is created. For more information, see the [workspace roles](../collaborate-share/service-roles-new-workspaces.md) article. 


## Considerations and limitations

The following considerations and limitations should be taken into account when working with notebooks:

* Notebooks use Python, which is currently a [preview experience](/fabric/data-engineering/using-python-experience-on-notebook). For a General Availability experience, you can change the language to PySpark from the language dropdown menu in the **Home** tab.
* Notebooks fail to run if the semantic model name ends with a whitespace.


## Related content

This article provided information about one-click experiences to start using Fabric notebooks and semantic link to analyze your semantic models in the web. For more information on semantic link and Fabric notebooks, see the following resources:

* [How to use Microsoft Fabric notebooks](/fabric/data-engineering/how-to-use-notebook)
* [What is semantic link?](/fabric/data-science/semantic-link-overview)
* [Power BI connectivity with semantic link](/fabric/data-science/semantic-link-power-bi?tabs=sql)
* [Edit data models in the Power BI service (preview)](service-edit-data-models.md)


