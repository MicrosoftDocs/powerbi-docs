---
title: What can developers do with Power BI?
description: Power BI offers a wide range of options for developers. This ranges from embedding to custom visuals and streaming datasets.
services: powerbi
keywords: ''
author: markingmyname
ms.author: maghan
ms.date: 04/18/2018
ms.topic: overview
ms.service: powerbi
ms.custom: mvc
ms.reviewer: ''
manager: kfile
---

# What can developers do with Power BI?
With Power BI, developers can do different things when trying to incorporate their Power BI content into applications. 

The different things developers can do with incorporating Power BI into applications are:
* Embedding Power BI dashboards, reports, or tiles into an application using REST APIs
* Developing Custom Visuals
* Pushing data into Power BI

## Embedding
The Power BI service and the Power BI Embedded product in Azure are coming together to offer a single API for embedding your dashboards and reports. This means you will have one API surface, a consistent set of capabilities and access to the latest Power BI features – such as dashboards, gateways and app workspaces – when embedding your content. 

![](media/what-can-you-do/powerbi-embed-sample.png)

## Developing Custom visuals
Custom visuals allow you to create your own visuals for use within Power BI reports. Custom visuals are written in TypeScript which is a superset of JavaScript that supports some advanced features and early access to ES6/ES7 functionality. Visual styling is handled using cascading styles sheets (css). For your convinence, we use the Less pre-compiler which supports some advanced features such as nesting, variables, mixins, conditions, loops, etc. If you don't want to use any of those features, you can just write plain css in the less file.

![](media/what-can-you-do/powerbi-custom-visual-store.png)

## Pushing data into Power BI
You can use the Power BI API to push data into a dataset. This allows you to add a row to a table within a dataset. The new data can then be reflected in tiles on a dashboard and within visuals within your report.

## Next steps
[Embedding with Power BI](embedding.md)  
[Publish custom visuals to the Office store](office-store.md)  
[Push data into a dashboard](walkthrough-push-data.md)
