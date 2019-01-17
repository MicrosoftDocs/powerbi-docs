---
title: What can I do with the Power BI API
description: What can I do with the Power BI API
author: markingmyname
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 05/25/2018
ms.author: maghan
---

# What can developers do with the Power BI API?

Power BI displays dashboards that are interactive, and can be created and updated from many different data sources in real time. Using any programming language that supports REST calls, you can create apps that integrate with a Power BI dashboard in real time. You can also integrate Power BI tiles and reports into apps.

Developers can also build their own data visualizations that can be used in interactive reports and dashboards.

Here are some of the things you can do with the Power BI APIs.

| **To do this** | **Go here** |
| --- | --- |
| Embed dashboards, reports, and tiles for Power BI users and Non-Power BI users (app owns data) |[How to embed your Power BI dashboards, reports, and tiles](embedding-content.md) |
| Extend an existing business workflow to push key data into a Power BI dashboard. |[Push data into a dashboard](walkthrough-push-data.md) |
| Authenticate to Power BI. |[Authenticate to Power BI](get-azuread-access-token.md) |
| Create a custom visual. |[Developing a Power BI custom visual](custom-visual-develop-tutorial.md) |

> [!NOTE]
> The Power BI APIs still refer to app workspaces as groups. Any references to groups mean that you are working with app workspaces.

## Power BI Developer samples

The Power BI Developer samples include items for embedding dashboards, reports and tiles.

[Power BI Developer samples](https://github.com/Microsoft/PowerBI-Developer-Samples)

* Samples within **App Owns Data** are for embedding with non-Power BI users.
* Samples within **User Owns Data** are for embedding with Power BI users.

## GitHub repositories

* [.NET SDK](https://github.com/Microsoft/PowerBI-CSharp)
* [JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript)
* [Custom Visuals](https://github.com/Microsoft/PowerBI-visuals)

## Developer tools

The following are tools you can use to aid in your development of Power BI items.

You can go through the [Embedding setup tool](https://aka.ms/embedsetup) to quickly get started and download a sample application on how to embed Power BI content.

Choose the solution that is right for you:

* [Embedding for your customers](embedding.md#embedding-for-your-customers) provides the ability to embed dashboards and reports to users who don't have an account for Power BI. Run the [Embed for your customers](https://aka.ms/embedsetup/AppOwnsData) solution.

* [Embedding for your organization](embedding.md#embedding-for-your-organization) allows you to extend the Power BI service. Run the [Embed for your organization](https://aka.ms/embedsetup/UserOwnsData) solution.

For a full sample of using the JavaScript API, you can use the [Playground tool ](https://microsoft.github.io/PowerBI-JavaScript/demo). This tool is a quick way to play with different types of Power BI Embedded samples. You also can get more Information about the JavaScript API by visiting the [PowerBI-JavaScript wiki](https://github.com/Microsoft/powerbi-javascript/wiki) page.

## Push data into Power BI

You can use the Power BI API to push data into a dataset. This feature allows you to add a row to a table within a dataset. The new data can then be reflected in tiles on a dashboard and within visuals within your report.

![Push data sample](media/what-can-you-do/powerbi-push-data.png)

## Next steps

[Push data into a dataset](walkthrough-push-data.md)  
[Developing a Power BI custom visual](custom-visual-develop-tutorial.md)  
[Power BI REST API reference](https://docs.microsoft.com/rest/api/power-bi/)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)
