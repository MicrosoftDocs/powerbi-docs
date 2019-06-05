---
title: What can developers do with Power BI?
description: Power BI offers a wide range of options for developers. This ranges from embedding to custom visuals and streaming datasets.
author: rkarlin
ms.author: rkarlin
manager: kfile
ms.topic: overview
ms.service: powerbi
ms.subservice: powerbi-developer
ms.custom: mvc
ms.date: 03/15/2019
#Customer intent: As a developer, I want to understand the capabilities of Power BI, so I have enough info to determine which Power BI developer features to use.
---

# What can developers do with Power BI?

Developers have different options trying to include Power BI content into applications. As a developer, you can use these options include **embedding with Power BI**, **custom visuals**, and **pushing data into Power BI**.

## Embedding Power BI content

The Power BI service (SaaS) and the Power BI Embedded service in Azure (PaaS) have APIs for embedding your dashboards and reports. This feature means you can access the latest Power BI features – such as dashboards, gateways, and app workspaces – when embedding your content.

You can go through the [Embedding setup tool](https://aka.ms/embedsetup) to quickly get started and download a sample application.

Choose the solution that is right for you:

* [Embedding for your customers](embedding.md#embedding-for-your-customers) provides the ability to embed dashboards and reports to users who don't have an account for Power BI. Run the [Embed for your customers](https://aka.ms/embedsetup/AppOwnsData) solution.

* [Embedding for your organization](embedding.md#embedding-for-your-organization) allows you to extend the Power BI service. Run the [Embed for your organization](https://aka.ms/embedsetup/UserOwnsData) solution.

![PBIE sample](media/what-can-you-do/what-can-you-do-02.png)

To learn more about embedding with Power BI, see [Embedding with Power BI](embedding.md).

## Developing custom visuals

You can use custom visuals with Power BI to create a unique type of visual that’s tailored to you or your company. Often these custom visuals are created by developers. They're built when the multitude of visuals that are included with Power BI don’t quite meet your needs.

Custom visuals allow you to create your visuals for use within Power BI reports. Custom visuals are written in TypeScript, which is a superset of JavaScript. TypeScript supports some advanced features and early access to ES6/ES7 functionality. Visual styling is handled using cascading styles sheets (CSS). For your convenience, we use the Less pre-compiler, which supports some advanced features such as nesting, variables, conditions, loops, and other features. If you don't want to use any of those features, you can write plain CSS in the less file.

![CV sample](media/what-can-you-do/powerbi-custom-visual-store.png)

To start learning more about custom visual development, see [Developing a Power BI custom visual](custom-visual-develop-tutorial.md).

## Using API automation

Power BI displays dashboards that are interactive, and can be created and updated from many different data sources in real time. Using any programming language that supports REST calls, you can create apps that integrate with a Power BI dashboard in real time. You can also integrate Power BI tiles and reports into apps.

Developers can also build their own data visualizations that can be used in interactive reports and dashboards.

![Push data sample](media/what-can-you-do/powerbi-push-data.png)

To see some of the things you can do with the Power BI APIs, see [What can developer do with the Power BI APIs](overview-of-power-bi-rest-api.md)?

## Next steps

[Embedding with Power BI](embedding.md)  

[Developing a Power BI custom visual](https://microsoft.github.io/PowerBI-visuals/docs/step-by-step-lab/developing-a-power-bi-custom-visual/)

[What can developers do with the Power BI API?](overview-of-power-bi-rest-api.md)

[Power BI Developer Center](https://powerbi.microsoft.com/developers/)