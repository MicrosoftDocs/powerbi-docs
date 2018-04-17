---
title: What can developers do with Power BI?
description: Power BI offers a wide range of options for developers. This ranges from embedding to custom visuals and streaming datasets.
services: powerbi
keywords: Power BI development
author: markingmyname
ms.author: maghan
ms.date: 04/18/2018
ms.topic: overview
ms.service: powerbi
ms.custom: mvc
manager: kfile
#Customer intent: As a developer, I want to know what all I can do with Power BI so that I can share data with my customers.
---

# What can developers do with Power BI?

## What does it mean to be a Power BI developer?
If you are a developer delivering reporting and analytics to your organization, Power BI lets you be productive and creative with what you can build. You will be able to help your customers access the data they need to make better decisions from within your application. For example, when you use Power BI Embedded on Azure, our API set makes it easy to embed analytics, even if you’ve already designed your app. With Power BI, developers have different options when trying to include Power BI content into applications.

Some of the different options are:
* Embed Power BI content using REST APIs
* Develop custom visuals
* Push data into Power BI

## Embed Power BI content using REST API
The Power BI service and the Power BI Embedded product in Azure are coming together to offer a single API for embedding your dashboards and reports. This means you will have one API surface, a consistent set of capabilities and access to the latest Power BI features – such as dashboards, gateways and app workspaces – when embedding your content. 

![PBIE sample](media/what-can-you-do/powerbi-embed-sample.png)

## Develop custom visuals
Custom visuals allow you to create your own visuals for use within Power BI reports. Custom visuals are written in TypeScript which is a superset of JavaScript. TypeScript supports some advanced features and early access to ES6/ES7 functionality. Visual styling is handled using cascading styles sheets (css). For your convenience, we use the Less pre-compiler which supports some advanced features such as nesting, variables, conditions, loops, etc. If you don't want to use any of those features, you can just write plain css in the less file.

![CV sample](media/what-can-you-do/powerbi-custom-visual-store.png)

## Push data into Power BI
You can use the Power BI API to push data into a dataset. This allows you to add a row to a table within a dataset. The new data can then be reflected in tiles on a dashboard and within visuals within your report.

## Next steps
[Embedding with Power BI](embedding.md)  
[Publish custom visuals to the Office store](office-store.md)  
[Push data into a dashboard](walkthrough-push-data.md)
