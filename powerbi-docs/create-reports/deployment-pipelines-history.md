---
title: Power BI Application lifecycle management (ALM) deployment pipelines history 
description: Learn how the history feature works in the deployment pipelines, the Power BI Application lifecycle management (ALM) tool.
author: KesemSharabi
ms.author: kesharab
ms.topic: conceptual
ms.service: powerbi
ms.subservice: pbi-deployment-pipeline
ms.custom: contperf-fy21q1
ms.date: 07/27/2022
---

# Deployment history

Deployment history is a deployment pipelines feature that enables reviewing the past deployments in your pipeline. The feature is designed as a log that lists all the past deployments in the pipeline.

You can use the deployment history log, to check the health of your pipeline, and to troubleshoot problems that occurred during previous deployments.

When you perform a deployment, you can use the built in option to [leave notes](deployment-pipelines-get-started.md#review-your-deployment-and-leave-a-note), to add additional information to each deployment. Later, when you're looking back at your deployment history, the notes can help you understand what happened during each deployment.

:::image type="content" source="media/deployment-pipelies-history/deployment-history.png" alt-text="A screenshot of the deployment pipelines history pane.":::

## Deployment information

To view the pipeline's deployment history, select **Deployment history**.

:::image type="content" source="media/deployment-pipelies-history/deployment-history-button.png" alt-text="A screenshot of the deployment pipelines history button.":::

The deployment history log is formatted as a table. Each row represents a single deployment, and the columns list the following information per deployment:

* **Deployed to** - The target stage of the deployment.

* **Date and time** - The date and time of the end of the deployment.

* **Deployed by** - The person who performed the deployment.

* **Items** - After you deploy your content, the *items* column indicates the differences between the Power BI items in the source and target stage. The labels refer to the items in the target stage. Each label shows the number of items from that category that were deployed. You can click on the label to view a list of all the items in that category. If a label isn't showing, no deployed items fit that category.

    | Label   | Name          | Description |
    |---------|---------------|-------------|
    |         | New           | A new item that was deployed |
    |         | Different     | A deployed item that's different in the source and target stages |
    |         | Missing from  | A deployment item that's missing from the target stage |

* **Note** - A note, if exists. Click the note's icon to display its content.

* **ID** - The deployment ID. Use as a reference when troubleshooting a deployment.

* **Status** - The status of the deployment.

    |Icon     | Deployment status |
    |---------|-------------------|
    |         | Successful        |
    |         | Unsuccessful      |

## Considerations and limitations

The following section lists the deployment history limitations.

* Limited information is displayed from April 2022 to June 2022

* Notes are only displayed from June 2022

* Renamed/removed items <---Chen to provide info--->

## Next steps

>[!div class="nextstepaction"]
>[Introduction to deployment pipelines](deployment-pipelines-overview.md)

>[!div class="nextstepaction"]
>[Get started with deployment pipelines](deployment-pipelines-get-started.md)

>[!div class="nextstepaction"]
>[Assign a workspace to a pipeline stage](deployment-pipelines-assign.md)

>[!div class="nextstepaction"]
>[Understand the deployment pipelines process](deployment-pipelines-process.md)

>[!div class="nextstepaction"]
>[Automate your deployment pipeline using APIs and DevOps](deployment-pipelines-automation.md)

>[!div class="nextstepaction"]
>[Deployment pipelines troubleshooting](deployment-pipelines-troubleshooting.yml)

>[!div class="nextstepaction"]
>[Deployment pipelines best practices](deployment-pipelines-best-practices.md)
