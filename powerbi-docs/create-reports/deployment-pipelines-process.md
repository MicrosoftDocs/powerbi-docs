---
title: Deployment pipelines, the Power BI Application lifecycle management (ALM) tool, process
description: Understand how deployment pipelines, the Power BI Application lifecycle management (ALM) tool, works
author: KesemSharabi
ms.author: kesharab
ms.topic: conceptual
ms.service: powerbi
ms.subservice: pbi-deployment-pipeline
ms.custom: contperf-fy21q1, intro-deployment
ms.date: 08/16/2021
---

# Understand the deployment process

The deployment process lets you clone content from one stage in the pipeline to another, typically from development to test, and from test to production.

During deployment, Power BI copies the content from the current stage, into the target one. The connections between the copied items are kept during the copy process. Power BI also applies the configured deployment rules to the updated content in the target stage. Deploying content may take a while, depending on the number of items being deployed. During this time, you can navigate to other pages in the Power BI portal, but you cannot use the content in the target stage.

You can also deploy content programmatically, using the [deployment pipelines REST APIs](/rest/api/power-bi/pipelines). You can learn more about this process in the [Automate your deployment pipeline using APIs and DevOps](deployment-pipelines-automation.md) article.

## Deploying content to an empty stage

When you deploy content to an empty stage, the metadata of the reports, dashboards, and datasets in the workspace you're deploying from, is copied to the stage you're deploying to. A new workspace for the stage you deployed to, is created on a Premium capacity.

There are two ways to deploy content from one stage to the next one. You can deploy all the content, or you can [select which content items to deploy](deployment-pipelines-get-started.md#selective-deployment).

You can also deploy content backwards, from a later stage in the deployment pipeline, to an earlier one.

After the deployment is complete, refresh the datasets so that you can use the newly copied content. The dataset refresh is required because data isn't copied from one stage to another. To understand which item properties are copied during the deployment process, and which item properties are not copied, review the [item properties copied during deployment](#item-properties-copied-during-deployment) section.

### Creating a Premium workspace

During first-time deployment, deployment pipelines checks if you have Premium permissions.  

If you have Premium permissions, the content of the workspace is copied to the stage you're deploying to, and a new  workspace for that stage is created on the Premium capacity.

If you don't have Premium permissions, the workspace is created but the content isn’t copied. You can ask a capacity admin to add your workspace to a capacity, or ask for assignment permissions for the capacity. Later, when the workspace is assigned to a capacity, you can deploy content to this workspace.

If you're using [Premium Per User (PPU)](../admin/service-premium-per-user-faq.yml), your workspace is automatically associated with your PPU. In such cases Premium permissions are not required. However, workspaces created by a PPU user, can only be accessed by other PPU users. In addition, content created in such workspaces can only be consumed by PPU users.

### Workspace and content ownership

The deploying user automatically becomes the dataset owner of the cloned datasets, and the only admin of the new workspace.

## Deploy content to an existing workspace

Deploying content in a working production pipeline, to a stage that has an existing workspace, includes the following:

* Deploying new content as an addition, to a stage that already contains content.

* New content deployed to replace old content, in a current working  stage.

### Deployment process

Content from the current stage is copied over to the target stage. Power BI identifies existing content in the target stage and overwrites it. To identify which content item needs to be overwritten, deployment pipelines uses the connection between the parent item and its clones. This connection is kept when new content is created. The overwrite operation only overwrites the content of the item. The item's ID, URL, and permissions remain unchanged.

In the target stage, [item properties that are not copied](deployment-pipelines-process.md#item-properties-that-are-not-copied), remain as they were before deployment. New content and new items are copied from the current stage to the target stage.

### Auto-binding

When you use [selective deploy](deployment-pipelines-get-started.md?#selective-deployment) to deploy Power BI items, deployment pipelines checks for dependencies. The deployment will either succeed or fail, depending on the location of the item that provides the data that the deployed item relies on.

* **Linked item exists in the target stage** - Deployment pipelines will automatically bind the deployed item, to the item it relies on in the deployed stage. For example, if you deploy a paginated report from development to test, and it's connected to a Power BI dataset that was previously deployed to the test stage, it will be automatically connected to that database.

* **Linked item doesn't exist in the target stage** - Deployment pipelines will fail a deployment if an item has a dependency on another item, and the item providing the data isn't deployed and doesn't reside in the target stage. For example, if you deploy a report from development to test, and the test stage doesn't contain its Power BI dataset, the deployment will fail. To avoid failed deployments due to dependent items not being deployed, use the *Select related* button. *Select related* automatically selects all the related items that provide dependencies to the items you're about to deploy.

Auto-binding works only with Power BI items that are supported by deployment pipelines and reside within Power BI. To view the dependencies of a Power BI item, from the item's *More options* menu, select *View lineage*.

:::image type="content" source="media/deployment-pipelines-process/view-lineage.png" alt-text="A screenshot of the view lineage option, in an item's more options menu.":::

### Refreshing data

Data in the target Power BI item, such as a dataset or dataflow, is kept when possible. If there are no changes to a Power BI item that holds the data, the data is kept as it was before the deployment.

In many cases, when you have a small change such as adding or removing a table, Power BI keeps the original data. For breaking schema changes, or changes in the data source connection, a full refresh is required.

### Requirements for deploying to a stage with an existing workspace

A user with a [Pro license](../admin/service-admin-purchasing-power-bi-pro.md) or a [PPU user](../admin/service-premium-per-user-faq.yml) who's a member of both the target and source deployment workspaces, can deploy content that resides on a [premium capacity](../admin/service-premium-what-is.md) to a stage with an existing workspace. For more information, review the [permissions](#permissions) section.

## Deployed items

When you deploy content from one pipeline stage to another, the copied content contains the following Power BI items:

* Datasets

* Reports

* Dataflows

* Dashboards

* Paginated reports

### Unsupported items

Deployment pipelines doesn't support the following items:

* Datasets that do not originate from a PBIX

* PUSH datasets

* Streaming dataflows

* Reports based on unsupported datasets

* [Template app workspaces](../connect-data/service-template-apps-create.md#create-the-template-workspace)

* Workbooks

* Goals

## Item properties copied during deployment

During deployment, the following item properties are copied and overwrite the item properties at the target stage:

* Data sources ([deployment rules](deployment-pipelines-get-started.md#step-4---create-deployment-rules) are supported)

* Parameters​ ([deployment rules](deployment-pipelines-get-started.md#step-4---create-deployment-rules) are supported)

* Report visuals​

* Report pages​

* Dashboard tiles​

* Model metadata​

* Item relationships

[Sensitivity labels](../admin/service-security-sensitivity-label-overview.md) are copied *only* when one of the conditions listed below is met. If these conditions are not met, sensitivity labels will not be copied during deployment.
* A new item is deployed.

* An item is deployed to an empty stage.

* The source item has a label with protection and the target item doesn't. In such cases, a pop-up window asking for consent to override the target sensitivity label appears.

### Item properties that are not copied

The following item properties are not copied during deployment:

* Data - Data isn't being copied, only metadata is copied

* URL

* ID

* Permissions - For a workspace or a specific item

* Workspace settings - Each stage has its own workspace

* App content and settings - To deploy your apps, see [deploying Power BI apps](#deploying-power-bi-apps)

* [Personal bookmarks](./../consumer/end-user-bookmarks.md#create-personal-bookmarks-in-the-power-bi-service)

The following dataset properties are also not copied during deployment:

* Role assignment

* Refresh schedule

* Data source credentials

* Query caching settings (can be inherited from the capacity)

* Endorsement settings

## Supported dataset features

Deployment pipelines supports many Power BI dataset features. This section lists two Power BI dataset features that can enhance your deployment pipelines experience:

* [Incremental refresh](#incremental-refresh)

* [Composite models](#composite-models)

### Incremental refresh

Deployment pipelines supports [incremental refresh](../connect-data/incremental-refresh-overview.md), a feature that allows large datasets faster and more reliable refreshes, with lower consumption.

With deployment pipelines, you can make updates to a dataset with incremental refresh while retaining both data and partitions. When you deploy the dataset, the policy is copied along.

To understand how incremental refresh behaves with dataflows, see [why do I see two data sources connected to my dataflow after using dataflow rules?](../create-reports/deployment-pipelines-troubleshooting.yml#why-do-i-see-two-data-sources-connected-to-my-dataflow-after-using-dataflow-rules-)

#### Activating incremental refresh in a pipeline

To enable incremental refresh, [configure it in Power BI Desktop](../connect-data/incremental-refresh-overview.md), and then publish your dataset. After you publish, the incremental refresh policy is similar across the pipeline, and can be authored only in Power BI Desktop.

Once your pipeline is configured with incremental refresh, we recommend that you use the following flow:

1. Make changes to your PBIX file in Power BI Desktop. To avoid long waiting times, you can make changes using a sample of your data.

2. Upload your PBIX file to the *development* stage.

3. Deploy your content to the *test* stage. After deployment, the changes you made will apply to the entire dataset you're using.

4. Review the changes you made in the *test* stage, and after you verify them, deploy to the *production* stage.

#### Usage examples

Below are a few examples of how you may integrate incremental refresh with deployment pipelines.

* [Create a new pipeline](deployment-pipelines-get-started.md#step-1---create-a-deployment-pipeline) and connect to it a workspace with a dataset that has incremental refresh enabled.

* Enable incremental refresh in a dataset that's already in a *development* workspace.  

* Create a pipeline from a production workspace that has a dataset that uses incremental refresh. This is done by assigning the workspace to a new pipeline's *production* stage, and using [backwards deployment](deployment-pipelines-get-started.md#backwards-deployment) to deploy to the *test* stage, and then to the *development* stage.

* Publish a dataset that uses incremental refresh to a workspace that's part of an existing pipeline.

#### Limitations and considerations

For incremental refresh, deployment pipelines only supports datasets that use [enhanced dataset metadata](../connect-data/desktop-enhanced-dataset-metadata.md). All datasets created or modified with Power BI Desktop automatically implement enhanced dataset metadata.

When republishing a dataset to an active pipeline with incremental refresh enabled, the following changes will result in deployment failure due to data loss potential:

* Republishing a dataset that doesn't use incremental refresh, to replace a dataset that has incremental refresh enabled.

* Renaming a table that has incremental refresh enabled.

* Renaming non-calculated columns in a table with incremental refresh enabled.

Other changes such as adding a column, removing a column, and renaming a calculated column, are permitted. However, if the changes affect the display, you'll need to refresh before the change is visible.

### Composite models

Using [composite models](../transform-model/desktop-composite-models.md) you can set up a report with multiple data connections.

You can use the composite models functionality to connect a Power BI dataset to an external dataset such as Azure Analysis Services. For more information, see [Using DirectQuery for Power BI datasets and Azure Analysis Services](../connect-data/desktop-directquery-datasets-azure-analysis-services.md).

In a deployment pipeline, you can use composite models to connect a dataset to another Power BI dataset external to the pipeline.  

#### Limitations

The following composite models connections are not supported:

* Connecting datasets that reside in the same workspace.

* Connecting datasets that reside in distinct pipelines.

* Connecting datasets that reside in the same pipeline. 

## Deploying Power BI apps

[Power BI apps](../consumer/end-user-apps.md) are the recommended way of distributing content to free Power BI consumers. Using deployment pipelines you can manage Power BI apps in a deployment pipeline, so that you have more control and flexibility when it comes to your app's lifecycle.

Create an app for each deployment pipeline stage, so that you can test each app update from an end user's point of view. A deployment pipeline allows you to manage this process easily. Use the publish or view button in the workspace card, to publish or view the app in a specific pipeline stage.

:::image type="content" source="media/deployment-pipelines-process/publish.png" alt-text="A screenshot highlighting the publish app button, at the bottom right of the production stage." lightbox="media/deployment-pipelines-process/publish.png":::

In the production stage, the main action button on the bottom-right corner opens the update app page in Power BI, so that any content updates become available to app users.

:::image type="content" source="media/deployment-pipelines-process/update-app.png" alt-text="A screenshot highlighting the update app button, at the bottom right of the production stage." lightbox="media/deployment-pipelines-process/update-app.png":::

>[!IMPORTANT]
>The deployment process does not include updating the app content or settings. To apply changes to content or settings, you need to manually update the app in the required pipeline stage.

## Permissions

Pipeline permissions and workspace permissions are granted and managed separately. For example, a user with pipeline access that doesn't have workspace permissions, will be able to view the pipeline and share it with others. However, this user will not be able to view the content of the workspace in the pipeline, or in the workspace page, and will not be able to perform deployments.

When deploying Power BI items, the ownership of the deployed item may change. Review the table below to understand who can deploy each item and how the deployment affects the item's ownership.

|Power BI Item    |Required permission to deploy an existing item |Item ownership after deployment |
|-----------------|---------|---------|
|Dataset          |Workspace member |Unchanged       |
|Dataflow         |Dataflow owner   |Unchanged         |
|Paginated report |Workspace member |The user who made the deployment becomes the owner |

### User with pipeline access

Users with pipeline access have the following permissions:

* View the pipeline​

* Share the pipeline with others

* Edit and delete the pipeline

>[!NOTE]
>Pipeline access doesn't grant permissions to view or take actions on the workspace content.

### Workspace viewer

Workspace viewers that have *pipeline access*, can also do the following:

* Consume content

>[!NOTE]
>Workspace members assigned the Viewer role without **build** permissions cannot access the dataset or edit workspace content.

### Workspace contributor

Workspace contributors that have *pipeline access*, can also do the following:

* Consume content

* Compare stages

* View datasets

### Workspace member

Workspace members that have *pipeline access*, can also do the following:

* View workspace content​

* Compare stages

* Deploy reports, dashboards and paginated reports

* Remove workspaces

* Update datasets

>[!NOTE]
>If the *block republish and disable package refresh* setting located in the tenant *dataset security* section is enabled, only dataset owners will be able to update datasets.

### Workspace admin

Workspace administrators that have *pipeline access*, can perform *workspace member* actions, and also do the following:

* Assign workspaces

* Remove workspaces

### Dataset owner

Dataset owners that are either workspace members or admins, can also do the following:

* Configure rules

>[!NOTE]
>This section describes user permissions in deployment pipelines. The permissions listed in this section may have different applications in other Power BI features.

## Limitations

This section lists most of the limitations in deployment pipelines.

* The workspace must reside on a [premium capacity](../admin/service-premium-what-is.md).

* The maximum number of Power BI items that can be deployed in a single deployment is 300.

* Downloading a PBIX file after deployment isn't supported.

* For a list of workspace limitations, see [workspace assignment limitations](deployment-pipelines-get-started.md#workspace-assignment-limitations).

* For a list of unsupported items, see [unsupported items](#unsupported-items).

### Dataset limitations

* Datasets that use real-time data connectivity cannot be deployed.

* During deployment, if the target dataset is using a [live connection](../connect-data/desktop-report-lifecycle-datasets.md), the source dataset must use this connection mode too.

* After deployment, downloading a dataset (from the stage it's been deployed to) is not supported.

* For a list of deployment rule limitations, see [deployment rules limitations](deployment-pipelines-get-started.md#deployment-rule-limitations).

### Dataflow limitations

* When deploying a dataflow with linked entities that reside on the same workspace, the deployment will fail.

* When deploying a dataflow to an empty stage, deployment pipelines creates a new workspace and sets the dataflow storage to a Power BI blob storage. Blob storage is used even if the source workspace is configured to use Azure data lake storage Gen2 (ADLS Gen2).

* In deployment pipelines, service principal isn't supported for dataflows.

* For deployment pipeline rule limitations that effect dataflows, see [Deployment rules limitations](deployment-pipelines-get-started.md#deployment-rule-limitations).

## Next steps

>[!div class="nextstepaction"]
>[Introduction to deployment pipelines](deployment-pipelines-overview.md)

>[!div class="nextstepaction"]
>[Get started with deployment pipelines](deployment-pipelines-get-started.md)

>[!div class="nextstepaction"]
>[Automate your deployment pipeline using APIs and DevOps](deployment-pipelines-automation.md)

>[!div class="nextstepaction"]
>[Deployment pipelines troubleshooting](deployment-pipelines-troubleshooting.yml)

>[!div class="nextstepaction"]
>[Deployment pipelines best practices](deployment-pipelines-best-practices.md)
