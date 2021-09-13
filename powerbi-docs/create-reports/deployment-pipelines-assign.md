---
title: Assigning a workspace to a Power BI Application lifecycle management (ALM) deployment pipeline 
description: Learn how to assign and unassign a workspace to a deployment pipeline, the Power BI Application lifecycle management (ALM) tool
author: KesemSharabi
ms.author: kesharab
ms.topic: how-to
ms.service: powerbi
ms.subservice: pbi-deployment-pipeline
ms.custom: contperf-fy21q1
ms.date: 09/13/2021
---

# Assign a workspace to a deployment pipeline

Deployment pipelines enables you to assign and unassign a workspace to any stage in a pipeline.

Before you assign or unassign a workspace to a pipeline, consider the following: (every time you deploy a new workspace is created)

After assigning a workspace to a deployment pipeline stage, deployment pipelines attempts to 

## Prerequisites

* Permissions

* Workspaces that show

* Workspaces that can be assigned

## Assign a workspace to a pipeline stage

To assign a workspace to a pipeline, the pipeline stage you want to assign the workspace to, has to be vacant. If you want to assign a workspace to a pipeline stage that already has a workspace assigned to it, [unassign](#unassign-a-workspace-from-a-pipeline-stage) the workspace from the stage before you continue.

To assign a workspace to a pipeline stage, follow these steps:

1. Open the pipeline.

2. In the stage you want to assign a workspace to, expand the dropdown titled **Choose a workspace to assign to this pipeline**.

3. From the dropdown menu, select the workspace you want to assign to this stage.

4. Select **Assign a workspace**.

## Unassign a workspace from a pipeline stage

You can unassign a workspace from any pipeline stage. Use this action if you want to assign a different workspace to the pipeline stage.

To unassign a workspace from a pipeline stage, follow these steps:

1. Open the pipeline.

2. In the stage you want to unassign the workspace from, select **settings**.

3. From the *settings* menu, select **Unassign workspace**.

4. In the *Unassign workspace* dialogue box, select **Unassign**.

## Limitations



## Next steps

>[!div class="nextstepaction"]
>[Introduction to deployment pipelines](deployment-pipelines-overview.md)

>[!div class="nextstepaction"]
>[Get started with deployment pipelines](deployment-pipelines-get-started.md)

>[!div class="nextstepaction"]
>[Understand the deployment pipelines process](deployment-pipelines-process.md)

>[!div class="nextstepaction"]
>[Automate your deployment pipeline using APIs and DevOps](deployment-pipelines-automation.md)

>[!div class="nextstepaction"]
>[Deployment pipelines troubleshooting](deployment-pipelines-troubleshooting.md)

>[!div class="nextstepaction"]
>[Deployment pipelines best practices](deployment-pipelines-best-practices.md)
