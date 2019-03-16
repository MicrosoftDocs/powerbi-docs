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

Power BI displays interactive dashboards, that are created, and updated from many different data sources in real time. Using any programming language that supports REST calls, you can create apps that integrate with a Power BI dashboard in real time. You can also integrate Power BI tiles and reports into apps.

Developers can also build their data visualizations that can be used in interactive reports and dashboards.

Here are some of the things you can do with the Power BI APIs.

| **To learn more** | **Reference this information** |
| --- | --- |
| Embed dashboards, reports, and tiles for Power BI users and Non-Power BI users (app owns data) |[How to embed your Power BI dashboards, reports, and tiles](embedding-content.md) |
| Extend an existing business workflow to push key data into a Power BI dashboard. |[Push data into a dashboard](walkthrough-push-data.md) |
| Authenticate to Power BI. |[Authenticate to Power BI](get-azuread-access-token.md) |
| Create a custom visual. |[Developing a Power BI custom visual](custom-visual-develop-tutorial.md) |

> [!NOTE]
> The Power BI APIs still refer to app workspaces as groups. Any references to groups mean that you are working with app workspaces.

## GitHub repositories

* [.NET SDK](https://github.com/Microsoft/PowerBI-CSharp)
* [JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript)
* [Custom Visuals](https://github.com/Microsoft/PowerBI-visuals)

## API Developer tools

| Tool(s) | Description |  |  |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|---|---|
| [Playground tool](https://microsoft.github.io/PowerBI-JavaScript/demo) | Experience a full sample of using the Power BI JavaScript APIs. This tool is also a quick way to play with different types of Power BI Embedded samples. |  |  |
| [Power BI JavaScript wiki](https://github.com/Microsoft/powerbi-javascript/wiki) | To get more Information about the Power BI JavaScript APIs. |  |  |
| [Postman](https://www.getpostman.com/) | Run requests, test, debug, monitor, run automated tests and more. |

## Push data into Power BI

You can use the Power BI API to [push data into a dataset](walkthrough-push-data.md). This feature allows you to add a row to a table within a dataset. The new data is then reflected in tiles on a dashboard and within visuals within your report.

![Push data sample](media/what-can-you-do/powerbi-push-data.png)

## How to call Power BI APIs

The Power BI APIs allow you to read and modify objects such as users, groups (workspaces), reports, dashboards, and tiles in a tenant. The Power BI API exposes REST endpoints that you send HTTP requests to do operations using the service. The following sections provide general information about how to format requests and what to expect in responses when you use the Power BI API to read and write directory resources, call directory functions or actions, or do queries against the directory.

A successful request to the Power BI API must be addressed to a valid endpoint and be well-formatted. It must contain any required headers and, if necessary, a JSON payload in the request body. The app that makes the request must include a token that is received from Azure AD that proves that it's authorized to access the resources that are targeted by the request. The app needs to handle any responses received from the API.

The sections in this article help you understand the format of requests and responses used with the Power BI API.

### Authentication and authorization

Every request must have a bearer token issued by Azure Active Directory attached. The token carries information about your app, the signed-in user (if there's delegated permissions), authentication, and the operations on the directory that your app is authorized to perform. This token is carried in the Authorization header of the request.

For example, the token has been shortened for brevity:

    ```json
    Authorization: Bearer eyJ0eXAiOiJK ... R2us_QgOQ
    ```

The Power BI API does authorization based on OAuth 2.0 permission scopes present in the token.

For your app to authenticate with Azure AD and call the APIs, you must add it to your tenant and configure it to require permissions (OAuth 2.0 permission scopes) for Windows Azure Active Directory. For information about adding and configuring an app, see [Register an Azure AD application to use with Power BI](register-app.md)

Azure AD uses the OAuth 2.0 authentication protocol. You can learn more about OAuth 2.0 in Azure AD, including supported flows and access tokens in [OAuth 2.0 in Azure AD](https://docs.microsoft.com/previous-versions/azure/dn645545(v=azure.100)).

## Endpoint addressing

To perform operations with the Graph API, you send HTTP requests with a supported method - typically GET, POST, PATCH, PUT, or DELETE -- to an endpoint that targets the service, a resource collection, an individual resource, a navigation property of a resource, or a function or action exposed by the service. Endpoints are expressed as URLs.

The HTTP call below describes the basic format of a Power API endpoint:

    ```https
    https://api.powerbi.com/v1.0/myorg/admin/dashboards
    ```

The following components comprise the URL:

* **Service Root**: The service root for all Graph API requests is ```https://api.powerbi.com/v1.0/myorg```.
* admin: The path to the resource -- for example, a user or a group -- that the request targets.
* dashboards: the path...

## OData query parameters

In many cases, when you read a collection of resources, you can filter, sort, and page the result set by attaching OData query parameters to your request.

Here are some of the OData query parameters that the Power BI supports:

* $filter
* $top
* $skip

## Request and response bodies

Request bodies for POST, PATCH, and PUT requests can be sent in JSON payloads. Server responses are returned in JSON. You can specify the payload in request bodies by using the Content-Type request header and in responses by using the Accept request header.

## Next steps

* [.NET SDK](https://github.com/Microsoft/PowerBI-CSharp)
* [JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript)
* [Push data into a dataset](walkthrough-push-data.md)
* [Developing a Power BI custom visual](custom-visual-develop-tutorial.md)
* [Power BI REST API Reference](rest-api-reference.md)
* [Power BI REST APIs](https://docs.microsoft.com/rest/api/power-bi/)
* [Overview of Microsoft Graph](https://docs.microsoft.com/graph/overview)

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)
