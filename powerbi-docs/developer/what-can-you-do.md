---
title: What can developers do with Power BI?
description: Power BI offers a wide range of options for developers. This ranges from embedding to custom visuals and streaming datasets.
author: markingmyname
ms.author: maghan
manager: kfile
ms.topic: overview
ms.service: powerbi
ms.component: powerbi-developer
ms.custom: mvc
ms.date: 09/25/2018
#Customer intent: As a developer, I want to understand the capabilities of Power BI, so I have enough info to determine which Power BI developer features to use.
---

# What can developers do with Power BI?

Developers have different options trying to include Power BI content into applications. As a developer, you can use these options include **embedding with Power BI**, **custom visuals**, and **pushing data into Power BI**.

## Embedding Power BI content

The Power BI service (SaaS) and the Power BI Embedded service in Azure (PaaS) have APIs for embedding your dashboards and reports. This feature means you have a set of capabilities and access to the latest Power BI features – such as dashboards, gateways, and app workspaces – when embedding your content.

You can go through the [Onboarding experience tool](https://aka.ms/embedsetup) to quickly get started and download a sample application.

Choose the solution that is right for you:
* [Embedding for your customers](embedding.md#embedding-for-your-customers) provides the ability to embed dashboards and reports to users who don't have an account for Power BI. Run the [Embed for your customers](https://aka.ms/embedsetup/AppOwnsData) solution.
* [Embedding for your organization](embedding.md#embedding-for-your-organization) allows you to extend the Power BI service. Run the [Embed for your organization](https://aka.ms/embedsetup/UserOwnsData) solution.

![PBIE sample](media/what-can-you-do/what-can-you-do-02.png)

## Develop custom visuals

Custom visuals allow you to create your own visuals for use within Power BI reports. Custom visuals are written in TypeScript, which is a superset of JavaScript. TypeScript supports some advanced features and early access to ES6/ES7 functionality. Visual styling is handled using cascading styles sheets (css). For your convenience, we use the Less pre-compiler, which supports some advanced features such as nesting, variables, conditions, loops, and other features. If you don't want to use any of those features, you can just write plain css in the less file.

![CV sample](media/what-can-you-do/powerbi-custom-visual-store.png)

## Using API automation

You can use the Power BI APIs to push data into a dataset. Using API automation, you can add rows to a table within a data set. The new data can then be viewed in tiles on a dashboard and within visuals in your report.

![Push data sample](media/what-can-you-do/powerbi-push-data.png)

## Next steps

[Embedding with Power BI](embedding.md)  
[Developing a Power BI custom visuals](https://microsoft.github.io/PowerBI-visuals/docs/step-by-step-lab/developing-a-power-bi-custom-visual/)  
[Push data into a dataset](walkthrough-push-data-create-dataset.md)