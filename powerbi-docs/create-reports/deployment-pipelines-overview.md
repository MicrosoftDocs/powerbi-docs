---
title: Overview of Power BI deployment pipelines 
description: An introduction to deployment pipelines the Power BI Application lifecycle management (ALM) tool
author: mberdugo
ms.author: monaberdugo
ms.topic: conceptual
ms.service: powerbi
ms.subservice: pbi-deployment-pipeline
ms.custom: contperf-fy21q1
ms.date: 04/02/2023
ms.search.form: Create deployment pipeline, View deployment pipeline, Introduction to Deployment pipelines
---

# Introduction to deployment pipelines

In today’s world, analytics is a vital part of decision making in almost every organization. The growing use of Power BI as an analytics tool, requires it to use more data, look appealing and  be user-friendly. Above all however, Power BI needs to always be available and reliable. To meet these requirements, BI creators must collaborate effectively.

The deployment pipelines tool enables BI creators to manage the lifecycle of organizational content. It's an efficient and reusable tool for creators in an enterprise with Premium capacity. Deployment pipelines enable creators to develop and test Power BI content in the Power BI service, before the content is consumed by users. The content types include reports, paginated reports, dashboards, datasets and dataflows.

## Learn to use deployment pipelines

You can learn how to use the deployment pipelines tool by following these links.

* [Create and manage a Power BI deployment pipeline](/training/modules/power-bi-deployment-pipelines) - A Power BI Learn module that walks you through creating a deployment pipeline.

* [Get started with deployment pipelines](deployment-pipelines-get-started.md) - A Power BI article that explains how to create a pipeline, as well as key functions such as backward deployment and deployment rules.

## Pipeline structure

Deployment pipelines is designed as a pipeline with three stages:

* **<a name="development"></a>Development**

    This stage is used to design, build, and upload new content with  fellow creators. This is the first stage in deployment pipelines.

* **<a name="test"></a>Test**

    You're ready to enter the test stage after you've made all the needed changes to your content. You upload the modified content so it can be moved to this test stage. Here are three examples of what can be done in the test environment:

  * Share content with testers and reviewers

  * Load and run tests with larger volumes of data

  * Test your app to see how it will look for your end users

* **<a name="production"></a>Production**

    After testing the content, use the production stage to share the final version of your content with business users across the organization.

:::image type="content" source="media/deployment-pipelines-overview/full-pipeline.gif" alt-text="A screenshot of a working deployment pipeline with all three stages, development, test and production, populated.":::

## Deployment method

When you deploy content from the source stage to a target stage, the source content will overwrite anything with the same name in the target stage. Content in the target stage that doesn't exist in the source stage remains in the target stage as is. After you select *deploy*, you'll get a warning message listing the items that will be overwritten.

:::image type="content" source="media/deployment-pipelines-get-started/replaced-content.png" alt-text="A screenshot of the replaced content warning which is displayed when a deployment is about to cause changes to items in the stage you're deploying to.":::

You can learn more about [which items are copied to the next stage](deployment-pipelines-process.md#deployed-items), and [which items are not copied](deployment-pipelines-process.md#unsupported-items), in [Understand the deployment process](deployment-pipelines-process.md).

## Next steps

>[!div class="nextstepaction"]
>[Get started with deployment pipelines](deployment-pipelines-get-started.md)

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
