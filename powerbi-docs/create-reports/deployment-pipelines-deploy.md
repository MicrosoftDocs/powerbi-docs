---
title: Power BI Application lifecycle management (ALM) deploy content
description: Learn how to deploy content to an empty or to non-empty stage using the Power BI Application lifecycle management (ALM) tool
author: mberdugo
ms.author: monaberdugo
ms.topic: conceptual
ms.service: powerbi
ms.subservice: pbi-deployment-pipeline
ms.custom: contperf-fy21q1, fabric
ms.date: 07/31/2022
---

# Deploy content using Deployment pipelines

Any [Pro user](../enterprise/service-admin-purchasing-power-bi-pro.md) that's a member or admin in the source workspace, can deploy content to an empty stage (a stage that doesn't contain content). The workspace must reside on a capacity for the deployment to be completed.

You can also use the [deployment pipelines REST APIs](/rest/api/power-bi/pipelines) to programmatically perform deployments. For more information, see [Automate your deployment pipeline using APIs and DevOps](deployment-pipelines-automation.md).

## Deploy to an empty stage

If you already have a workspace that you'd like to use with a specific stage, instead of deploying you can [assign](deployment-pipelines-assign.md) that workspace to the appropriate stage.

When you deploy content to an empty stage, the relationships between the items are kept. For example, a report that is bound to a dataset in the source stage, will be cloned alongside its dataset, and the clones will be similarly bound in the target workspace.

Once the deployment is complete, refresh the dataset. For more information, see [deploying content to an empty stage](deployment-pipelines-process.md#deploying-content-to-an-empty-stage).

### Deploying options

Deployment pipelines offer three options when it comes to deploying your Power BI content:

* [Deploying all content](#deploy-all-content) - Deploy all your Power BI content to the target stage.

* [Selective deployment](#selective-deployment) - Select which Power BI content to deploy to the target stage.

* [Backwards deployment](#backwards-deployment) - Deploy your content to a previous stage in the pipeline.

After you choose how to deploy your Power BI content, you can [Review your deployment and leave a note](#review-your-deployment-and-leave-a-note).

#### Deploy all content

Select the stage to deploy from and then select the deployment button. The deployment process creates a duplicate workspace in the target stage. This workspace includes all the content existing in the current stage.

:::image type="content" source="media/deployment-pipelines-get-started/deploy.png" alt-text="A screenshot showing the deploy button for the development and test stages in a deployment pipeline." lightbox="media/deployment-pipelines-get-started/deploy.png":::

#### Selective deployment

If you don't want to deploy everything from that stage, you can select specific items for deployment. Select the **Show more** link, and then select the items you wish to deploy. When you select the **Deploy** button, only the selected items are deployed to the next stage.

Since dashboards, reports, datasets and dataflows are related and have dependencies, you can use the select related button to see all items that those items are dependent on. For example, if you want to deploy a report to the next stage, click the **Select related** button to mark the dataset that the report is connected to, so that both will be deployed together and the report won't break.

:::image type="content" source="media/deployment-pipelines-get-started/selective-deploy.png" alt-text="A screenshot showing the selective deploy option in deployment pipelines, available after selecting the show more option." lightbox="media/deployment-pipelines-get-started/selective-deploy.png":::

>[!NOTE]
>
> * You can't deploy a Power BI item to the next stage, if the items it's dependent on doesn't exist in the stage you are deploying to. For example, deploying a report without a dataset will fail, unless the dataset already exists in the target stage.
> * You might get unexpected results if you choose to deploy a Power BI item without the item it's dependent on. This can happen when a dataset or a dataflow in the target stage, has changed and is no longer identical to the one in the stage you're deploying from.

#### Backwards deployment

You can choose to deploy to a previous stage, for example in a scenario where you assign an existing workspace to a production stage and then deploy it backwards, first to the test stage, and then to the development one.

Deploying to a previous stage works only if the previous stage is empty. When deploying to a previous stage, you can't select specific items. All content in the stage will be deployed.

:::image type="content" source="media/deployment-pipelines-get-started/deploy-back.png" alt-text="A screenshot showing the deploy to previous stage button, available from the test or production stage menus." lightbox="media/deployment-pipelines-get-started/deploy-back.png":::

### Review your deployment and leave a note

After selecting which content to deploy, a pop-up window lists all the items you're about to deploy. You can review the list and add a note to the deployment. Adding a note is optional, but it is highly recommended as the notes are added to the [deployment history](deployment-pipelines-history.md). With a note for each deployment, reviewing the history of your pipelines becomes more meaningful.

To leave a note, expand the **Add a note** option and write your note in the text box. When you're ready to deploy, select **Deploy**.

:::image type="content" source="media/deployment-pipelines-get-started/add-note.png" alt-text="A screenshot showing the deployment pop-up window, with the Add a note option expanded.":::

## Deploy content from one stage to another

Once you have content in a pipeline stage, you can deploy it to the next stage. Deploying content to another stage is usually done after you've performed some actions in the pipeline. For example, made development changes to your content in the development stage, or tested your content in the test stage. A typical workflow for moving content from stage to stage, is development to test, and then test to production. You can learn more about this process, in the [deploy content to an existing workspace](deployment-pipelines-process.md#deploy-content-to-an-existing-workspace) section.

When you're deploying content to a stage that already has other content in it, select the items you want to deploy. If there's already an item there with the same name, that item will be overwritten. Relationships between the items aren't kept. Therefore, if you deploy a report that is bound to a dataset in the source stage, only the report will be deployed. If you want to deploy everything connected to the report, use the **Select related** button.

To deploy content to the next stage in the deployment pipeline, select the deploy button at the bottom of the stage.

When reviewing the test and production stage cards, you can see the last deployment time. This indicates the last time content was deployed to the stage.

The deployment time is useful for establishing when a stage was last updated. It can also be helpful if you want to track time between test and production deployments.

## Next steps

>[!div class="nextstepaction"]
>[Introduction to deployment pipelines](deployment-pipelines-overview.md)

>[!div class="nextstepaction"]
>[Assign a workspace to a pipeline stage](deployment-pipelines-assign.md)

>[!div class="nextstepaction"]
>[Deployment history](deployment-pipelines-history.md)

>[!div class="nextstepaction"]
>[Understand the deployment pipelines process](deployment-pipelines-process.md)

>[!div class="nextstepaction"]
>[Automate your deployment pipeline using APIs and DevOps](deployment-pipelines-automation.md)

>[!div class="nextstepaction"]
>[Deployment pipelines troubleshooting](deployment-pipelines-troubleshooting.yml)

>[!div class="nextstepaction"]
>[Deployment pipelines best practices](deployment-pipelines-best-practices.md)
