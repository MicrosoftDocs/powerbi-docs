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

After assigning a workspace to a deployment pipeline stage, deployment pipelines attempts to recreate the connections between the Power BI items in the adjacent stages. If you're assigning a workspace to the test stage, deployment pipelines cannot recreate these connections as to reestablish the connections between the items in the *test* and *production* stages, follow the instructions in []() to 

Before you assign or unassign a workspace to a pipeline, consider that every time you deploy to a vacant stage, a new workspace is created.

## Assign a workspace to a pipeline stage

To assign a workspace to a pipeline, the pipeline stage you want to assign the workspace to, has to be vacant. If you want to assign a workspace to a pipeline stage that already has another workspace assigned to it, [unassign](#unassign-a-workspace-from-a-pipeline-stage) the current workspace from that stage and then continue with assigning the new workspace.

Before you assign a workspace to a pipeline stage, review the [workspace assignment limitations](deployment-pipelines-get-started.md#workspace-assignment-limitations) and make sure that the workspace meets the required conditions.

To assign a workspace to a pipeline stage, follow these steps:

1. Open the pipeline.

2. In the stage you want to assign a workspace to, expand the dropdown titled **Choose a workspace to assign to this pipeline**.

3. From the dropdown menu, select the workspace you want to assign to this stage.

    :::image type="content" source="media/deployment-pipelines-assign/assign-workspace.png" alt-text="A screenshot showing the assign workspace dropdown in a deployment pipelines empty stage.":::

4. Select **Assign a workspace**.

    :::image type="content" source="media/deployment-pipelines-assign/assign-button.png" alt-text="A screenshot showing the assign workspace button in a deployment pipelines empty stage.":::

## Unassign a workspace from a pipeline stage

You can unassign a workspace from any pipeline stage. If you want to assign a different workspace to a pipeline stage, you'll first have to unassign the current workspace from that stage.

To unassign a workspace from a pipeline stage, follow these steps:

1. Open the pipeline.

2. In the stage you want to unassign the workspace from, select **settings**.

3. From the *settings* menu, select **Unassign workspace**.

    :::image type="content" source="media/deployment-pipelines-assign/unassign-workspace.png" alt-text="A screenshot showing the unassign workspace option in deployment pipelines, available from the settings menu of the pipeline stage.":::

4. In the *Unassign workspace* dialogue box, select **Unassign**.

    :::image type="content" source="media/deployment-pipelines-assign/unassign-note.png" alt-text="A screenshot showing the unassign workspace pop up window in deployment pipelines, with the unassign button highlighted.":::

## Limitations

When assigning a workspace, if a report and a paginated report from an adjacent stage have the same name, the assignment will fail.

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
