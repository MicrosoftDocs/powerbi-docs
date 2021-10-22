---
title: What can I do with the Power BI API
description: What can I do with the Power BI API.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: overview
ms.date: 03/25/2019
ms.custom: intro-overview
---

# What can developers do with the Power BI API?

Using Power BI REST API, you can create apps that integrate with Power BI reports, dashboards, and tiles.

With Power BI REST API, it is possible to perform management tasks on Power BI objects like reports, datasets, and workspaces.

Here are some of the things you can do with the Power BI APIs.

| **To learn more** | **Reference this information** |
|----------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Embed reports, dashboards, and tiles for Power BI users and Non-Power BI users. | [How to embed your Power BI dashboards, reports, and tiles ](../embedded/embed-sample-for-customers.md) |
| Perform management tasks on Power BI objects. | [Power BI REST API reference](/rest/api/power-bi/) |
| Extend an existing business workflow to push key data into a Power BI dashboard. | [Push data into a dashboard ](walkthrough-push-data.md) |
| Authenticate to Power BI. | [Authenticate to Power BI ](../embedded/generate-embed-token.md) |

> [!NOTE]
> The Power BI APIs still refer to workspaces as groups. Any references to groups mean that you are working with workspaces.

## API Developer tools

| Tool(s) | Description |
|---------|-------------|
| [Playground tool](https://microsoft.github.io/PowerBI-JavaScript/demo) | Experience a full sample of using the Power BI embedded analytics Client APIs. This tool is also a quick way to play with different types of Power BI Embedded samples. |
| [Power BI embedded analytics Client APIs](/javascript/api/overview/powerbi/) | To get more Information about the Power BI Client APIs. |
| [Postman](https://www.getpostman.com/) | Run requests, test, debug, monitor, run automated tests and more. |

## Push data into Power BI

You can use the Power BI API to [push data into a dataset](walkthrough-push-data.md). This feature allows you to add a row to a table within a dataset. The new data is then reflected in tiles on a dashboard and within visuals within your report.

![Push data sample](media/overview-of-power-bi-rest-api/powerbi-push-data.png)

## GitHub repositories

* [Power BI Developer samples](https://github.com/Microsoft/PowerBI-Developer-Samples)
* [.NET SDK](https://github.com/Microsoft/PowerBI-CSharp)
* [Power BI embedded analytics Client APIs](/javascript/api/overview/powerbi/)

## Next Steps

* [Push data into a dataset](walkthrough-push-data.md)
* [Developing a Power BI circle card visual](../visuals/develop-circle-card.md)
* [Power BI REST API Reference](rest-api-reference.md)
* [Power BI REST APIs](/rest/api/power-bi/)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
