---
title: Automate your deployment pipeline, the Power BI Application lifecycle management (ALM) tool 
description: Learn how to automate your deployment pipeline, the Power BI Application lifecycle management (ALM) tool, using APIs and Azure DevOps
author: KesemSharabi
ms.author: kesharab
ms.topic: conceptual
ms.service: powerbi
ms.subservice: pbi-deployment
ms.date: 05/20/2021
---

# Automate your deployment pipeline using APIs and Azure DevOps

The Power BI [deployment pipelines](deployment-pipelines-overview.md) tool enables BI teams to build an efficient and reusable release process for their Power BI content.

To achieve continuous integration and continuous delivery (CI/CD) of content, many organizations use a variety of automation tools, including [Azure DevOps](/azure/devops/user-guide/what-is-azure-devops).

You can leverage the [deployment pipelines Power BI REST APIs](/rest/api/power-bi/pipelines), to integrate Power BI into your organization's automation process. Here are a few examples of what can be done using the APIs:

* Integrate Power BI into familiar DevOps tools such as [Azure DevOps](/azure/devops/user-guide/what-is-azure-devops) or [GitHub Actions](https://docs.github.com/en/actions).

* Schedule pipeline deployments to happen automatically at a given time.

* Deploy multiple pipelines at same time.

* Cascade depending pipeline deployments - If you have content that’s connected across pipelines, you can make sure some pipelines are deployed before others.

## Deployment pipelines API functions

Using the [deployment pipelines Power BI REST APIs](/rest/api/power-bi/pipelines), you can get information about the pipeline, and deploy Power BI content from one stage to another.

* **Get pipeline information** - Retrieve information about your pipelines and their content. Getting the pipeline information will enable you to dynamically build the deployment API calls. You can also check the [status of a deployment](/rest/api/power-bi/pipelines/getpipelineoperation), or the [deployment history](/rest/api/power-bi/pipelines/getpipelineoperations).

* **Deploy** - The REST calls enables developers to use any type of deployment available in the Power BI service.

## Which deployments are supported by the APIs?

Here's a list of the different deployment types the APIs support:

* **Deploy all** - A single API call that deploys all the content in the workspace to the next stage in the pipeline. For this operation, use the [Deploy all](/rest/api/power-bi/pipelines/deployall) API.

* **Selective deploy** - Deploy only specific Power BI items (such as reports or dashboards) in the pipeline. For this operation use the [Selective deploy](/rest/api/power-bi/pipelines/selectivedeploy) API.

* **Backward deploy** - Use to deploy new Power BI items to the previous stage. Backward deployment only works if the Power BI items that are deployed, don’t already exist in the target stage. For this operation use either the [Deploy all](/rest/api/power-bi/pipelines/deployall) or the [Selective deploy](/rest/api/power-bi/pipelines/selectivedeploy) APIs, with `isBackwardDeployment` set to `True`.

* **Update App** - As part of the deployment API call, you can update the content of the app that’s related to that stage. Using this capability, new or updated Power BI items will automatically be available to your end users, once a deployment has been completed. For this operation use either the [Deploy all](/rest/api/power-bi/pipelines/deployall) or the [Selective deploy](/rest/api/power-bi/pipelines/selectivedeploy) APIs, with [PipelineUpdateAppSettings](/rest/api/power-bi/pipelines/selectivedeploy#pipelineupdateappsettings).

## Before you begin

Before you start using the deployment pipelines APIs, make sure you have the following:

* A working pipeline. To create a new pipeline, [Get started using deployment pipelines](deployment-pipelines-get-started.md).

* The *service principal* or *user* you're using for automation, needs [workspace permissions](deployment-pipelines-process.md#permissions) and access to an [Azure AD application](/azure/active-directory/develop/active-directory-how-applications-are-added)

## Using a service principal

[Service principal](..//developer/embedded/embed-service-principal.md) is an authentication method that can be used to let an Azure AD application access Power BI service content and APIs.

### Service principal requirements

When using a *service principal*, you'll need to take into account the following requirements:

* Before using a *service principal*, you have to enable the [Power BI service admin settings](../developer/embedded/embed-service-principal.md#step-3---enable-the-power-bi-service-admin-settings).

* You'll need to [add the *service principal* to the workspace you want to deploy from](../developer/embedded/embed-service-principal.md#step-4---add-the-service-principal-to-your-workspace).

* It's recommended to add the *service principal* to a *security group*.

## Integrate your pipeline with Azure DevOps

You can use PowerShell to integrate a Power BI deployment pipeline into Azure DevOps. The script signs into Power BI using a *service principal* or a *user*, and allows you to automate Power BI deployment processes from within your release pipeline in Azure DevOps.

This section describes an example PowerShell script that performs the following operations:

1. Connects a Power BI deployment pipeline to Azure DevOps.

2. Deploys all the Power BI items in the pipeline's development stage.

3. Checks whether the deployment was successful.

You can use any of these parts to add as tasks in your Azure pipeline stages. To run a PowerShell script that performs a deployment, you'll need the following components:

1. **Sign in** - Before you can deploy your content, you need to sign in to Power BI using a *service principal* or a *user*. In this PowerShell example, a *service principal* is used to sign in to Power BI.

    ```powershell
    # Some code describing signing in to Power BI using a service principal.
    ```

2. **Build your request** - In this part of the script you specify which Power BI items (such as reports and dashboards) you're deploying. You can also deploy all the Power BI items in the source stage, to the target stage:

    ```powershell
    # The sample script deploys all the Power BI items from the development stage to the test stage.
    ```

3. **Deploy** - Here you perform the deployment.

    ```powershell
    # Some code describing the deployment.
    ```

4. (Optional) **Successful deployment notification** - As the deployment API is asynchronous, you can program the script to notify you when the deployment is successful.

    ```powershell
    # Some code showing a wait for successful deployment.
    ```

### Download a PowerShell sample

To download a PowerShell sample, follow these steps:

1. Navigate to the [PowerBI-Developer-Samples](https://github.com/microsoft/PowerBI-Developer-Samples) GitHub folder.

2. Select the green **Code** button.

3. Select **Download ZIP**.

4. Unpack the downloaded ZIP and open the **PowerShell Scripts** folder.

5. The sample PowerShell scripts are titled **1111**, **2222** and **3333**.

### View or copy the PowerShell sample

To view or copy the text in a PowerShell example, use these links:

* [1111](link)

* [2222](link)

* [3333](link)

## Limitations and considerations

* The maximum number of Power BI items that can be deployed in a single deployment is 300.

* Deployment using APIs is subject to the same [limitations](deployment-pipelines-process.md#limitations-1) as the Power BI deployment pipelines user interface.

* A *service principal* or a *user* cannot configure *OAuth* credentials.

* After a successful deployment, if the following items are newly deployed, the signed in *service principal* or *user* becomes their owner:

    * Any deployed paginated reports.

    * Any deployed datasets.

## Next steps

>[!div class="nextstepaction"]
>[Introduction to deployment pipelines](deployment-pipelines-overview.md)

>[!div class="nextstepaction"]
>[Get started with deployment pipelines](deployment-pipelines-get-started.md)

>[!div class="nextstepaction"]
>[Understand the deployment pipelines process](deployment-pipelines-process.md)

>[!div class="nextstepaction"]
>[Deployment pipelines troubleshooting](deployment-pipelines-troubleshooting.md)

>[!div class="nextstepaction"]
>[Deployment pipelines best practices](deployment-pipelines-best-practices.md)
