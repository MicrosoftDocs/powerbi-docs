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

Power BI semantic model refresh templates let you orchestrate semantic model refreshes using **Fabric data pipelines**, making it easier to automate and sequence refresh activities. Instead of configuring refresh logic manually, you can start from a guided template that handles common scenarios such as scheduled refreshes, event-driven triggers, or refreshing multiple models in sequence.  

[Fabric Data Factory](/fabric/data-factory/data-factory-overview) is a cloud-based ETL and data integration service designed to address complex data orchestration scenarios. It enables the creation of data-driven workflows (pipelines) that automate data movement and transformation at scale.  

Learn more about [templates for Data Factory](/fabric/data-factory/templates) and the [semantic model refresh activity](/fabric/data-factory/semantic-model-refresh-activity).  

## Create a data pipeline

Before you begin, you need a workspace with a Microsoft Fabric-enabled [capacity](/fabric/enterprise/licenses#capacity).  

In your Power BI workspace, go to the **semantic model details page** and select **Create advanced refresh** from the refresh dropdown.  

:::image type="content" source="media/data-pipeline-templates/advanced-refresh-entry.png" alt-text="Screenshot of the Power BI semantic model details page entry point for the templates experience." lightbox="media/data-pipeline-templates/advanced-refresh-entry.png":::  

This opens the **template gallery**, which includes preconfigured refresh scenarios such as:  

* **Event-driven refreshes**: Set up an [event or action that triggers a semantic model refresh](/fabric/data-factory/pipeline-storage-event-triggers).  
* **Refresh after a dataflow run**: Trigger a semantic model refresh after each [dataflow activity](/fabric/data-factory/dataflow-activity).  
* **Scheduled refreshes**: Create a [schedule](/fabric/data-factory/pipeline-runs) to trigger a refresh on a recurring basis.  
* **Sequence multiple semantic models**: Trigger refreshes sequentially across different semantic models.  

Each template provides a guided setup to help you configure the refresh process within data pipelines.  

:::image type="content" source="media/data-pipeline-templates/data-pipeline-template-gallery.png" alt-text="Screenshot of the Power BI semantic model refresh template gallery." lightbox="media/data-pipeline-templates/data-pipeline-template-gallery.png":::  

## Components of the data pipeline solution

When you configure a template, you’ll use these core components:  

* **Guided setup**: Each template includes a step-by-step wizard. Read more about [Data Factory templates](/fabric/data-factory/templates).  
* **Semantic model refresh settings**: Select the connection, workspace, and semantic model. Optionally specify tables or partitions for incremental refresh. Read more about [semantic model refresh activities](/fabric/data-factory/semantic-model-refresh-activity).  
* **Scheduling options**: Choose flexible intervals, from minute-by-minute to quarterly.  
* **Additional activities**: Add actions such as Teams or Outlook notifications. Read more about [Data Factory activities](/fabric/data-factory/activity-overview).  
* **Data pipelines**: Orchestrate the overall process, letting you visualize and manage refresh activities. Read more about [data pipelines](/fabric/data-factory/pipeline-landing-page).  

## Examples

The following examples show how you can use templates to orchestrate semantic model refreshes in Power BI. Each scenario provides a guided setup in the Data Pipelines experience, and you can add additional activities as needed.  


### Refresh a semantic model after a dataflow refresh

Use this template when you want a semantic model to refresh once a dataflow completes.  

:::image type="content" source="media/data-pipeline-templates/semantic-model-dataflow.png" alt-text="Screenshot of the refresh semantic model after a dataflow refresh configuration." lightbox="media/data-pipeline-templates/semantic-model-dataflow.png":::  

1. Select the dataflow and workspace to monitor.  
2. Configure the semantic model refresh activity by selecting the connection, workspace, and model.  

:::image type="content" source="media/data-pipeline-templates/semantic-model-dataflow-2.png" alt-text="Screenshot of the semantic model details for refreshing a semantic model after a dataflow refresh." lightbox="media/data-pipeline-templates/semantic-model-dataflow-2.png":::   


### Incremental (partition) refresh

Refresh only the updated partitions.

:::image type="content" source="media/data-pipeline-templates/incremental-refresh.png" alt-text="Screenshot of the incremental refresh configuration." lightbox="media/data-pipeline-templates/incremental-refresh.png":::  

1. In the semantic model refresh activity, choose the tables you want to refresh.  
2. Select partitions (for example, the Category) instead of the entire model.  
3. Run the pipeline to refresh only the changed data.  


### Add notifications or alerts

You can extend your pipeline by adding activities that notify users when a refresh completes or fails.  

:::image type="content" source="media/data-pipeline-templates/add-activity.png" alt-text="Screenshot of the teams and outlook activity." lightbox="media/data-pipeline-templates/add-activity.png":::  

1. After configuring the semantic model refresh, add a **Teams** or **Outlook** activity.  
2. Enter recipients and a custom message.  
3. Save and run the pipeline.  


### Scheduled refreshes

Set up a semantic model refresh to run on a schedule.  

:::image type="content" source="media/data-pipeline-templates/scheduled-refresh.png" alt-text="Screenshot of the scheduled refresh menu." lightbox="media/data-pipeline-templates/scheduled-refresh.png":::  

1. Select the semantic model to refresh.  
2. Configure the schedule (minute-by-minute, hourly, daily, weekly or monthly).  
3. Save the pipeline to apply the schedule.  

:::image type="content" source="media/data-pipeline-templates/save-and-run.png" alt-text="Screenshot of the successful pipeline run." lightbox="media/data-pipeline-templates/save-and-run.png":::  

### Sequence multiple semantic models

Use this template when multiple models need to refresh in a specific order.  

:::image type="content" source="media/data-pipeline-templates/partition1.png" alt-text="Screenshot of the sequence multiple semantic models configuration." lightbox="media/data-pipeline-templates/partition1.png":::  

1. Add multiple semantic model refresh activities to the pipeline.  
2. Arrange them in sequence.  
3. Save and run the pipeline.  


### Event-driven refresh

Trigger a semantic model refresh based on events.  

:::image type="content" source="media/data-pipeline-templates/add-trigger.png" alt-text="Screenshot of the add trigger button for event-driven refresh." lightbox="media/data-pipeline-templates/add-trigger.png":::  

1. Add a trigger (for example, a file arriving in storage).  
2. Configure the semantic model refresh activity with connection, workspace, and model.  
3. Optionally add alerts or other downstream activities.  

This is ideal for scenarios where your data changes unpredictably, and you need the semantic model updated immediately.  

## Related content

* [Data Factory documentation](/fabric/data-factory/)  
* [Data pipeline landing page](/fabric/data-factory/pipeline-landing-page)  
* [Templates for Data Factory](/fabric/data-factory/templates)  
* [Semantic model refresh activity to refresh a Power BI dataset](/fabric/data-factory/semantic-model-refresh-activity)  

