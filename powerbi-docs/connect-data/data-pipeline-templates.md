---
title: Refresh a Semantic Model using Data Pipelines (Preview)
description: 
author: GraceGong
ms.author: ggongg
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: concept-article
ms.date: 08/08/2025
---
# Refresh a Semantic Model using Data Pipelines (Preview)

Power BI semantic model refresh templates allow users to orchestrate semantic model refreshes using Data Pipelines, providing a streamlined way to visualize and sequence refresh activities for common scenarios. This article describes the Data Pipelines experience with Semantic Model Refresh Templates, which serve as an entry point from Power BI to Data pipelines. 

<!-- :::image type="content" source="media/real-time-intelligence-sample-experience/architecture-scheme.png" alt-text="Schematic of Real-Time Intelligence architecture with sample items."::: -->

[Azure Data Factory](/fabric/azure/data-factory/introduction), part of the Fabric product suite, is a cloud-based ETL and data integration service designed to address complex data orchestration scenarios. It enables the creation of data-driven workflows (pipelines) that automate data movement and transformation at scale.

Learn more about [Templates for Data Factory](/fabric/data-factory/templates) & [Semantic model refresh activity](/fabric/data-factory/semantic-model-refresh-activity) to refresh a Power BI Dataset. 

## Create a Data Pipeline

Before you begin, you need a workspace with a Microsoft Fabric-enabled [capacity](/fabric/enterprise/licenses#capacity).

In your Power BI workspace, navigate to the semantic model details page and select **Create Advanced Refresh** from the refresh dropdown to begin orchestrating a refresh. 

:::image type="content" source="media/data-pipeline-templates/create-advanced-refresh.png" alt-text="Screen shot of the power bi semantic model details page entry point for the templates experience." lightbox="media/data-pipeline-templates/create-advanced-refresh.png":::

This opens the template gallery, which includes several pre-configured refresh scenarios, such as:
* **Event-driven refreshes**: Set up an [event or action that will trigger a semantic model refresh](/fabric/data-factory/pipeline-storage-event-triggers). 
* **Refreshing a semantic model after a dataflow runs**: trigger a semantic model refresh after each [data flow activity](/fabric/data-factory/dataflow-activity). 
* **Scheduled refreshes**: Create a [schedule](/fabric/data-factory/pipeline-runs) to trigger a semantic model refresh, such as on a monthly or quarterly basis. 
* **Sequencing multiple semantic model refreshes**: trigger refreshes sequentially for different semantic models. 
Each template provides a guided setup to help you configure the refresh process within Data Pipelines.

:::image type="content" source="media/data-pipeline-templates/dp-template-gallery.png" alt-text="Screen shot of the power bi semantic model refresh template gallery." lightbox="media/data-pipeline-templates/dp-template-gallery.png":::

## Components of the Data Pipeline solution

The components of the Data Pipeline template experience include:

* **Guided Tour**: After selecting a semantic model refresh template, you'll be guided step-by-step through the configuration process. Read more about [Data Factory templates](/fabric/data-factory/templates).

* **Semantic Model Refresh Settings**: Select the connection, workspace, and semantic model to refresh. You can also specify tables or partitions for incremental refresh, updating only the changed data to optimize performance. Read more about [semantic model refresh activities](/fabric/data-factory/semantic-model-refresh-activity).

* **Additional Activities**: You can add additional actions to your refresh workflow, such as sending a Teams notification upon successful execution. Read more about [Data Factory Activities](/fabric/data-factory/activity-overview). 

* **Data Pipelines**: Data Pipelines orchestrate the refresh process, allowing you to visualize and sequence refresh activities for common scenarios. They provide a comprehensive and integrated solution for managing semantic model refreshes in Power BI. 

## Related content

* [Data Factory documentation](/fabric/azure/data-factory/introduction)
* [Templates for Data Factory](/fabric/data-factory/templates)
* [Semantic model refresh activity to refresh a Power BI Dataset](/fabric/data-factory/semantic-model-refresh-activity)

