---
title: What can I do with the Power BI API
description: What can I do with the Power BI API
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 03/15/2019
---

# What can developers do with the Power BI API?

Using Power BI REST API, you can create apps that integrate with Power BI reports, dashboards, and tiles.

With Power BI REST API, it is possible to perform management tasks on Power BI objects like reports, datasets and workspaces.

Here are some of the things you can do with the Power BI APIs.

| **To learn more** | **Reference this information** |
|----------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Embed reports, dashboards and tiles for Power BI users and Non-Power BI users. | [How to embed your Power BI dashboards, reports, and tiles ](embedding-content.md) |
| Perform management tasks on Power BI objects. | [Power BI REST API reference](https://docs.microsoft.com/rest/api/power-bi/) |
| Extend an existing business workflow to push key data into a Power BI dashboard. | [Push data into a dashboard ](walkthrough-push-data.md) |
| Authenticate to Power BI. | [Authenticate to Power BI ](get-azuread-access-token.md) |
| Create a custom visual. | [Developing a Power BI custom visual ](custom-visual-develop-tutorial.md) |

> [!NOTE]
> The Power BI APIs still refer to app workspaces as groups. Any references to groups mean that you are working with app workspaces.

## API Developer tools

| Tool(s) | Description |  |  |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|---|---|
| [Playground tool](https://microsoft.github.io/PowerBI-JavaScript/demo) | Experience a full sample of using the Power BI JavaScript APIs. This tool is also a quick way to play with different types of Power BI Embedded samples. |  |  |
| [Power BI JavaScript wiki](https://github.com/Microsoft/powerbi-javascript/wiki) | To get more Information about the Power BI JavaScript APIs. |  |  |
| [Postman](https://www.getpostman.com/) | Run requests, test, debug, monitor, run automated tests and more. |

## Push data into Power BI

You can use the Power BI API to [push data into a dataset](walkthrough-push-data.md). This feature allows you to add a row to a table within a dataset. The new data is then reflected in tiles on a dashboard and within visuals within your report.

![Push data sample](media/what-can-you-do/powerbi-push-data.png)

## GitHub repositories

* [Power BI Developer samples](https://github.com/Microsoft/PowerBI-Developer-Samples)
* [.NET SDK](https://github.com/Microsoft/PowerBI-CSharp)
* [JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript)
* [Custom Visuals](https://github.com/Microsoft/PowerBI-visuals)

## Next steps

* [Developing a Power BI custom visual](custom-visual-develop-tutorial.md)
* [Power BI REST API Reference](rest-api-reference.md)
* [Power BI REST APIs](https://docs.microsoft.com/rest/api/power-bi/)

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)
