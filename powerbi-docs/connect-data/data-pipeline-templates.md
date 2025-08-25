---
title: Refresh a Semantic Model Using Data Pipelines (Preview)
description: Learn how to use Power BI semantic model refresh templates with Fabric data pipelines. 
author: ggongg
ms.author: gracegong
ms.reviewer: juliacawthra
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: concept-article
ms.date: 08/08/2025
---
# Refresh a semantic model using data pipelines (preview)

Power BI semantic model refresh templates allow users to orchestrate semantic model refreshes using data pipelines, providing a streamlined way to visualize and sequence refresh activities for common scenarios. This article describes the data pipelines experience with Semantic Model Refresh Templates, which serve as an entry point from Power BI to Data pipelines. 

[Azure Data Factory](/fabric/data-factory/data-factory-overview), part of the Fabric product suite, is a cloud-based ETL and data integration service designed to address complex data orchestration scenarios. It enables the creation of data-driven workflows (pipelines) that automate data movement and transformation at scale.

Learn more about [templates for Data Factory](/fabric/data-factory/templates) and [semantic model refresh activity](/fabric/data-factory/semantic-model-refresh-activity) to refresh a Power BI dataset. 

## Create a data pipeline

Before you begin, you need a workspace with a Microsoft Fabric-enabled [capacity](/fabric/enterprise/licenses#capacity).

In your Power BI workspace, navigate to the semantic model details page and select **Create Advanced Refresh** from the refresh dropdown to begin orchestrating a refresh. 

:::image type="content" source="media/data-pipeline-templates/advanced-refresh-entry.png" alt-text="Screen shot of the power bi semantic model details page entry point for the templates experience." lightbox="media/data-pipeline-templates/advanced-refresh-entry.png":::

This opens the template gallery, which includes several pre-configured refresh scenarios, such as:

* **Event-driven refreshes**: Set up an [event or action that will trigger a semantic model refresh](/fabric/data-factory/pipeline-storage-event-triggers). 
* **Refreshing a semantic model after a dataflow runs**: Trigger a semantic model refresh after each [data flow activity](/fabric/data-factory/dataflow-activity). 
* **Scheduled refreshes**: Create a [schedule](/fabric/data-factory/pipeline-runs) to trigger a semantic model refresh, such as on a monthly or quarterly basis. 
* **Sequencing multiple semantic model refreshes**: Trigger refreshes sequentially for different semantic models. 

Each template provides a guided setup to help you configure the refresh process within data pipelines.

:::image type="content" source="media/data-pipeline-templates/data-pipeline-template-gallery.png" alt-text="Screen shot of the power bi semantic model refresh template gallery." lightbox="media/data-pipeline-templates/data-pipeline-template-gallery.png":::

## Components of the data pipeline solution

The components of the data pipeline template experience include:

* **Guided tour**: After selecting a semantic model refresh template, you'll be guided step-by-step through the configuration process. Read more about [Data Factory templates](/fabric/data-factory/templates).
* **Semantic model refresh settings**: Select the connection, workspace, and semantic model to refresh. You can also specify tables or partitions for incremental refresh, updating only the changed data to optimize performance. Read more about [semantic model refresh activities](/fabric/data-factory/semantic-model-refresh-activity).
* **Additional activities**: You can add additional actions to your refresh workflow, such as sending a Teams notification upon successful execution. Read more about [Data Factory activities](/fabric/data-factory/activity-overview). 
* **Data pipelines**: Data pipelines orchestrate the refresh process, allowing you to visualize and sequence refresh activities for common scenarios. They provide a comprehensive and integrated solution for managing semantic model refreshes in Power BI. Read more about [Data pipelines](/fabric/data-factory/pipeline-landing-page). 

## Related content

* [Data Factory documentation](/fabric/data-factory/)
* [Data pipeline landing page](/fabric/data-factory/pipeline-landing-page)
* [Templates for Data Factory](/fabric/data-factory/templates)
* [Semantic model refresh activity to refresh a Power BI dataset](/fabric/data-factory/semantic-model-refresh-activity)


