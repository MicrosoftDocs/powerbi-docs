---
title: Automate your deployment pipeline, the Power BI Application lifecycle management (ALM) tool 
description: Learn how to automate your deployment pipeline, the Power BI Application lifecycle management (ALM) tool, using APIs and DevOps
author: KesemSharabi
ms.author: kesharab
ms.topic: conceptual
ms.service: powerbi
ms.subservice: pbi-deployment
ms.date: 05/04/2021
---

# Automate your deployment pipeline using APIs and DevOps

The Power BI [deployment pipelines](deployment-pipelines-overview.md) tool enables BI teams to build an efficient and reusable release process for their Power BI content.

To achieve continuous integration and continuous delivery (CI/CD) of content, many organizations use a variety of automation tools, including [DevOps](/azure/devops/user-guide/what-is-azure-devops).

You can leverage the [deployment pipelines REST APIs](add-link), to integrate Power BI into your organization's automation process. Here are a few examples of what can be done using the APIs:

* Deploy multiple pipelines at same time

* Cascade depending pipeline deployments

* Schedule pipeline deployments to happen automatically at a given time

* Integrate Power BI into familiar DevOps tools such as [Azure DevOps](/azure/devops/user-guide/what-is-azure-devops) or [GitHub Actions](https://docs.github.com/en/actions)

## Deployment pipelines APIs

Using the deployment pipelines REST APIs, you cab get information about the pipeline, and deploy Power BI content from one stage to another.

* **Get pipeline information** - Retrieve information about your pipelines and their content. Getting the pipeline information will enable you to dynamically build the deployment API calls. You can also check the status of a deployment, or the deployment history.

* **Deploy** - The REST calls enables developers to use any type of deployment available in the Power BI service.

### Which deployments are supported by the APIs?

Here's a list of the different deployment types the APIs support:

* **Deploy all** - A single API call that deploys all the content in the workspace to the next stage in the pipeline.

* **Selective deploy** - Deploy only specific Power BI items (such as reports or dashboards) in the pipeline.

* **Backward deploy** - Use to deploy new Power BI items to the previous stage. Backward deployment only works if the Power BI items that are deployed, don’t already exist in the target stage.

* **Update App** - As part of the deployment API call, you can also update the content of the app that’s related to that stage. Using this capability, new or updated Power BI items will automatically be available to the end users, once a deployment has been completed.


## Integrate your pipeline with Azure DevOps

You can use PowerShell to connect your pipeline to DevOps…

[Additional text from Mahir]

### Prerequisites

Before you begin, make sure you have the following:

* A working pipeline. To create a new pipeline, [Get started using deployment pipelines](deployment-pipelines-get-started.md).

* An [Azure AD application](/azure/active-directory/develop/active-directory-how-applications-are-added)

[Check prerequisites with Mahir]

### Connect your pipeline to DevOps with PowerShell

...how can I leverage (high level) the PS sample into ADO


...include specific PS samples or reference to them

### Using a service principal

...how to work with SP, what’s not supported

## Limitations

* Limitation A

* Limitation B

* Limitation C


## Next steps

>[!div class="nextstepaction"]
>[Introduction to deployment pipelines](deployment-pipelines-overview.md)

>[!div class="nextstepaction"]
>[Get started with deployment pipelines](deployment-pipelines-get-started.md)

>[!div class="nextstepaction"]
>[Understand the deployment pipelines process](deployment-pipelines-process.md)

>[!div class="nextstepaction"]
>[Deployment pipelines troubleshooting](deployment-pipelines-troubleshooting.md)