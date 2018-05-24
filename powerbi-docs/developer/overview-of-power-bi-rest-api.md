---
title: What can I do with the Power BI API
description: What can I do with the Power BI API
author: markingmyname
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-developer
ms.topic: conceptual
ms.date: 07/20/2017
ms.author: maghan

---
# What can developers do with the Power BI API?
Power BI displays dashboards that are interactive, and can be created and updated from many different data sources in real time. Using any programming language that supports REST calls, you can create apps that integrate with a Power BI dashboard in real-time. You can also integrate Power BI tiles and reports into apps.

Developers can also build their own data visualizations that can be used in interactive reports and dashboards. 

Here are some of the things you can do with the Power BI APIs.

| **To do this** | **Go here** |
| --- | --- |
| Embed dashboards, reports and tiles for Power BI users and Non-Power BI users (app owns data) |[How to embed your Power BI dashboards, reports and tiles](embedding-content.md) |
| Extend an existing business workflow to push key data into a Power BI dashboard. |[Push data into a dashboard](walkthrough-push-data.md) |
| Import a Power BI Desktop file |[Import PBIX File](https://msdn.microsoft.com/library/mt243837.aspx) |
| Authenticate to Power BI. |[Authenticate to Power BI](get-azuread-access-token.md) |
| Create a custom visual. |[Use developer tools to create custom visuals](../service-custom-visuals-getting-started-with-developer-tools.md) |

> [!NOTE]
> The Power BI APIs still refer to app workspaces as groups. Any references to groups mean that you are working with app workspaces.
> 
> 

## Power BI Developer Samples
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

You can go through the new [Onboarding experience tool](https://aka.ms/embedsetup) to quickly get started and download a sample application on how to embed Power BI content specifically.

Choose the solution that is right for you:
* **Embedding for your customers** - when you are interested in an [app owns data](https://aka.ms/embedsetup/AppOwnsData) solution. [Embedding for your customers](embedding-content.md#embedding-for-your-customers) provides the ability to embed reports and dashboards to users who don't have a Power BI account or even know what Power BI is.
* **Embedding for your organization** - when you are interested in a [user owns data](https://aka.ms/embedsetup/UserOwnsData) solution. [Embedding for your organization](embedding-content.md#embedding-for-your-organization) allows you to extend the Power BI service.

For a full sample of using the JavaScript API, you can use the [Playground tool ](https://microsoft.github.io/PowerBI-JavaScript/demo). This is a quick way to play with different types of Power BI Embedded samples. You also can get more Information about the JavaScript API by visitng the [PowerBI-JavaScript wiki](https://github.com/Microsoft/powerbi-javascript/wiki) page.

## Next steps
[Push data into a dataset](walkthrough-push-data.md)  
[Getting started with custom visuals developer tools](../service-custom-visuals-getting-started-with-developer-tools.md) 
[Power BI REST API reference](https://msdn.microsoft.com/library/mt147898.aspx)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

