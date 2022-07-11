---
title: Power BI Application lifecycle management (ALM) deployment pipelines history 
description: Learn how the history feature works in the deployment pipelines, the Power BI Application lifecycle management (ALM) tool.
author: KesemSharabi
ms.author: kesharab
ms.topic: conceptual
ms.service: powerbi
ms.subservice: pbi-deployment-pipeline
ms.custom: contperf-fy21q1
ms.date: 07/11/2022
---

# Deployment pipelines history (private preview)

Deployment pipelines history is a feature that enables reviewing the past deployments in your pipeline. The feature is designed as a log of all the past activities in the pipeline.

You can use the deployment pipelines history log, to check the health of your pipeline, and to troubleshoot problems that occurred during previous deployments.

When you perform a deployment, you can use the built in option to [leave notes](), to add additional information to each deployment. Later, when you're looking back at your deployment history, the notes can help you understand what happened during each deployment.

<---Screenshot--->

## Available information

The deployment pipelines history log is formatted as a table. Each row represents a single deployment, and the columns list the following information per deployment:

* **Deployed to** - The target stage of the deployment.

* **Date and time** - The date and time of the end of the deployment.

* **Deployed by** - The person who performed the deployment.

* **Items** - After you deploy your content, the *items* column indicates the differences between the Power BI items in the source and target stage. The labels refer to the items in the target stage. Each label shows the number of items from that category that were deployed. If a label isn't showing, no deployed items fit that category.

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

We started collecting partial data for the deployment pipelines history feature during April 2022. The deployment pipelines history log will not display information related to deployments that occurred before April 2022. In addition, we can't guarantee that the early data is complete. A comprehensive account of all your deployment history, is only available from July <---date--->, the date deployment history became available as a private preview feature. For example, the ability to include deployment notes was only released with the deployment history feature, so prior to <---date---> this information wasn't captured.

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
