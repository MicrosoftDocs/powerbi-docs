---
title: Embed reports or dashboards from apps
description: Learn how to integrate, or embed, a report or dashboard from a Power BI app and not from an app workspace.
author: markingmyname
ms.author: maghan 
ms.date: 07/13/2018
ms.topic: how-to
ms.service: powerbi
ms.component: powerbi-developer
ms.custom: mvc
manager: kfile
#Customer intent: As a developer, I want to embed Power BI content into an application from an app, so users of an organization can share data.
---

# Embed reports or dashboards from apps

In **Power BI**, you can create apps to bring related **dashboards** and **reports** together, all in one place, and then publish them to large groups of people in your organization. The usage of those apps is relevant when all your users are Power BI users, so you can share content with them using Power BI Apps. We would like to share a few quick steps on how to accomplish embedding of content out of a published Power BI App and into a third-party application.

## How to grab Report embed URL for embedding

1. Instantiate the application in a user workspace (‘My Workspace’) by either sharing with yourself or guiding another user to go through this flow.

2. Open your desired report in Power BI service.

3. Go to File->Embed In SharePoint Online and grab the report embed URL from there (can be seen in the snapshot below) or call GetReports/GetReport REST API and extract the corresponding report embedURL field out of the response (please note that the REST call shouldn’t have a workspace identifier as part of the URL as the app got instantiated in the user’s workspace).

4. Use the embed URL retrieved in step 3 to use with the JS SDK.

    ![Embed from Apps](media/embed-from-apps/embed-from-app.png)

## How to grab Dashboard embed URL for embedding

1. Instantiate the application in a user workspace (‘My Workspace’) by either sharing with yourself or guiding another user to go through this flow.

2. Call GetDashboards REST API and extract the corresponding dashboard embedURL field out of the response (please note that the REST call shouldn’t have a workspace identifier as part of the URL as the app got instantiated in the user’s workspace).

3. Use the embed URL retrieved in step 4 to use with our JS SDK.

## Next Steps

Also review how to embed from app worksapces for your 3rd party customer and for your organization.

> [!div class="nextstepaction"]
>[Embed for 3rd party customers](embed-sample-for-customers.md)

> [!div class="nextstepaction"]
>[Embed for your organization](embed-sample-for-your-organization.md)