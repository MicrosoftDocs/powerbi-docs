---
title: Deployment pipelines troubleshooting
description: Troubleshoot deployment pipelines in Power BI
author: KesemSharabi
ms.author: kesharab
ms.topic: troubleshooting
ms.service: powerbi
ms.subservice: powerbi-service
ms.date: 10/21/2020
---

# Deployment pipelines troubleshooting

Use this article to troubleshoot issues in deployment pipelines.

## General

### What's deployment pipelines in Power BI?

To understand what's deployment pipelines in Power BI, refer to the [deployment pipelines overview](deployment-pipelines-overview.md).

### How do I get started with deployment pipelines?

Get started with deployment pipelines using the [get started instructions](deployment-pipelines-get-started.md).

### Why can't I see the deployment pipelines button?

If the following conditions are not met, you'll not be able to see the deployment pipelines button.

[!INCLUDE[deployment pipelines access](../../includes/deployment-pipelines-access.md)]

### Why can't I see the pipeline stage tag in my workspace?

Deployment pipelines displays a pipeline stage tag in workspaces that are assigned to a pipeline. Tags for the *Development* and *Test* stages are always visible. However, you'll only see the *Production* tag if you have [access to the pipeline](deployment-pipelines-process.md#user-with-pipeline-access) or if you're a [workspace admin](deployment-pipelines-process.md#workspace-admin).

> [!div class="mx-imgBorder"]
> ![A screenshot of the production tag in a production pipeline workspace.](media/deployment-pipelines-troubleshooting/production-tag.png)

## Licensing

### What licenses are needed to work with deployment pipelines?

To use deployment pipelines, you need to be a [Pro user](../admin/service-admin-purchasing-power-bi-pro.md) with [Premium capacity](../admin/service-premium-what-is.md). For more information, see [accessing deployment pipelines](deployment-pipelines-get-started.md#accessing-deployment-pipelines).

### What type of capacity can I assign to a workspace in a pipeline?

All workspaces in a deployment pipeline must reside within a dedicated capacity for the pipeline to be functional. However, you can use different capacities for different workspaces in a pipeline. You can also use different capacity types for different workspaces in the same pipeline.

For development and testing, you can use A or EM capacity alongside a Pro Power BI account for each user. You can also use PPU capacities and Pro user accounts for each user in the development and test stages.

For production workspaces, you need a P capacity. If you're an ISV distributing content through embedded applications, you can also use A or EM capacities for production.

## Technical

### Why can't I see all my workspaces when I try to assign a workspace to a pipeline?

To assign a workspace to a pipeline, the following conditions must be met:

* The workspace is a [new workspace experience](../collaborate-share/service-create-the-new-workspaces.md)

* You're an admin of the workspace

* The workspace is not assigned to any other pipeline

* The workspace resides on a [premium capacity](../admin/service-premium-what-is.md)

Workspaces that don't meet these conditions, are not displayed in the list of workspaces you can select from.

### How can I assign workspaces to all the stages in a pipeline?

You can assign one workspace per pipeline. Once a workspace is assigned to a pipeline, you can deploy it to the next pipeline stages. During first-time deployment, a new workspace is created with copies of the items in the source stage. The relationships of the copied items are kept. For more information, see how to [assign a workspace to a deployment pipeline](deployment-pipelines-get-started.md#step-2---assign-a-workspace-to-a-deployment-pipeline).

### Why did my first deployment fail?

Your first deployment may have failed due to a number of reasons. Some of these reasons are listed in the table below.

|Error  |Action  |
|---------|---------|
|You don't have [premium capacity permissions](deployment-pipelines-process.md#creating-a-premium-capacity-workspace).     |To get premium capacity permissions, ask a capacity admin to add your workspace to a capacity, or ask for assignment permissions for the capacity. After the workspace is in a capacity, redeploy.        |
|You don't have workspace permissions.     |To deploy, you need to be a workspace member. Ask your workspace admin to grant you the appropriate permissions.         |
|Your Power BI admin disabled the creation of workspaces.     |Contact your Power BI admin for support.         |
|Your workspace isn't a [new workspace experience](../collaborate-share/service-create-the-new-workspaces.md).     |Create your content in the new workspace experience. If you have content in a classic workspace, you can [upgrade](../collaborate-share/service-upgrade-workspaces.md) it to a new workspace experience.         |
|You're using [selective deployment](deployment-pipelines-get-started.md#selective-deployment) and are not selecting your content's dataset.     |Do one of the following: </br></br>Unselect the content that is linked to your dataset. Your unselected content (such as reports or dashboards) will not be copied to the next stage. </br></br>Select the dataset that's linked to the selected content. Your dataset will be copied to the next stage.         |

### I'm getting a warning that I have 'unsupported artifacts' in my workspace when I'm trying to deploy. How can I know which artifacts are not supported?

For a comprehensive list of items and artifacts that are not supported in deployment pipelines, see the following sections:

* [Unsupported items](deployment-pipelines-process.md#unsupported-items)

* [Item properties that are not copied](deployment-pipelines-process.md#item-properties-that-are-not-copied)

### Why did my deployment fail due to broken rules?

If you have problems configuring dataset rules, visit [dataset rules](deployment-pipelines-get-started.md#step-4---create-dataset-rules), and make sure you follow the [dataset rule limitations](deployment-pipelines-get-started.md#dataset-rule-limitations).

If your deployment was previously successful, and is suddenly failing with broken rules, it may be due to a dataset being republished. The following changes to the source dataset, result in a failed deployment:

**Parameter rules**

* A removed parameter

* A changed parameter name

**Data source rules**

Your dataset rules are missing values. This may have happened if your dataset changed.

![A screenshot of the invalid rules error displayed when a deployment fails due to broken links.](media/deployment-pipelines-troubleshooting/broken-rule.png)

When a previously successful deployment fails due to broken links, a warning is displayed. You can select **Configure rules** to navigate to the deployment settings pane, where the failed dataset is marked. When you select the dataset, the broken rules are marked.

To deploy successfully, fix or remove the broken rules, and redeploy.

### How can I change the data source in the pipeline stages?

You can’t change the data source connection in Power BI service.

If you want to change the data source in the test or production stages, you can use [dataset rules](deployment-pipelines-get-started.md#step-4---create-dataset-rules) or [APIs](/rest/api/power-bi/datasets/updateparametersingroup). Dataset rules will only come into effect after the next deployment.

### I fixed a bug in production, but now I can't select the 'deploy to previous stage' button. Why is it greyed out?

You can only deploy backwards to an empty stage. If you have content in the test stage, you will not be able to deploy backwards from production.

After creating the pipeline, use the development stage to develop your content, and the test stages to review and test it. You can fix bugs in these stages, and then deploy the fixed environment to the production stage.

>[!NOTE]
>Backwards deployment only supports [full deployment](deployment-pipelines-get-started.md#deploying-all-content). It doesn't support [selective deployment](deployment-pipelines-get-started.md#selective-deployment)

### Does deployment pipelines support multi-geo?

Multi-geo is supported. It may take longer to deploy content between stages in different geos.

## Permissions

### What is the deployment pipelines permissions model?

The deployment pipelines permissions model is described the [permissions](deployment-pipelines-process.md#permissions) section.

### Who can deploy content between stages?

Content can be deployed to an empty stage or to a stage that contains content. The content must reside on a [premium capacity](../admin/service-premium-what-is.md).

* **Deploying to an empty stage** - Any [Pro user](../admin/service-admin-purchasing-power-bi-pro.md) that's a member or admin in the source workspace.

* **Deploying to a stage with content** - Any [Pro user](../admin/service-admin-purchasing-power-bi-pro.md) who's a member or admin of both workspaces in the source and target deployment stages.

* **Overriding a dataset** - Deployment overrides each dataset that is included in the target stage, even if the dataset wasn't changed. The user must be the owner of all the target stage datasets specified in the deployment.

### Which permissions do I need to configure dataset rules?

To configure dataset rules in deployment pipelines, you must be the dataset owner.

### Why can't I see workspaces in the pipeline?

Pipeline and workspace permissions are managed separately. You may have pipeline permissions, but not workspace permissions. For more information, review the [permissions](deployment-pipelines-process.md#permissions) section.

## Next steps

>[!div class="nextstepaction"]
>[Introduction to deployment pipelines](deployment-pipelines-overview.md)

>[!div class="nextstepaction"]
>[Get started with deployment pipelines](deployment-pipelines-get-started.md)

>[!div class="nextstepaction"]
>[Understand the deployment pipelines process](deployment-pipelines-process.md)

>[!div class="nextstepaction"]
>[Deployment pipelines best practices](deployment-pipelines-best-practices.md)