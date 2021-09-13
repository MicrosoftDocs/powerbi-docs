---
title: Power BI Application lifecycle management (ALM) deployment pipelines overview 
description: An introduction to deployment pipelines the Power BI Application lifecycle management (ALM) tool
author: KesemSharabi
ms.author: kesharab
ms.topic: conceptual
ms.service: powerbi
ms.subservice: pbi-deployment-pipeline
ms.custom: contperf-fy21q1
ms.date: 09/13/2021
---

# Introduction to deployment pipelines

In today’s world, analytics is a vital part of decision making in almost every organization. The growing use of Power BI as an analytics tool, requires it to use more data, look appealing and  be user-friendly. Above all however, Power BI needs to always be available and reliable. To meet these requirements, BI creators must collaborate effectively.

The deployment pipelines tool enables BI creators to manage the lifecycle of organizational content. It's an efficient and reusable tool for creators in an enterprise with Premium capacity. Deployment pipelines enable creators to develop and test Power BI content in the Power BI service, before the content is consumed by users. The content types include reports, paginated reports, dashboards, and datasets.

The tool is designed as a pipeline with three stages:

* **<a name="development"></a>Development**
    
    This stage is used to design, build, and upload new content with  fellow creators. This is the first stage in deployment pipelines.

* **<a name="test"></a>Test**

    You're ready to enter the test stage after you've made all the needed changes to your content. You upload the modified content so it can be moved to this test stage. Here are three examples of what can be done in the test environment:

    * Share content with testers and reviewers

    * Load and run tests with larger volumes of data

    * Test your app to see how it will look for your end users

* **<a name="production"></a>Production**

    After testing the content, use the production stage to share the final version of your content with business users across the organization.

:::image type="content" source="media/deployment-pipelines-overview/deployment-pipelines.png" alt-text="A screenshot of a working deployment pipeline with all three stages, development, test and production, populated.":::

## Next steps

>[!div class="nextstepaction"]
>[Get started with deployment pipelines](deployment-pipelines-get-started.md)

>[!div class="nextstepaction"]
>[Assign a workspace to a pipeline stage](deployment-pipelines-assign.md)

>[!div class="nextstepaction"]
>[Understand the deployment pipelines process](deployment-pipelines-process.md)

>[!div class="nextstepaction"]
>[Automate your deployment pipeline using APIs and DevOps](deployment-pipelines-automation.md)

>[!div class="nextstepaction"]
>[Deployment pipelines troubleshooting](deployment-pipelines-troubleshooting.md)

>[!div class="nextstepaction"]
>[Deployment pipelines best practices](deployment-pipelines-best-practices.md)
