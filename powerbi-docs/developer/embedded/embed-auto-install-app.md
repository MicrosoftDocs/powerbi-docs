---
title: Automatically install Power BI apps when embedding content for your organization
description: Learn how to set up automatic app installation for Power BI apps when embedding content from apps for your organization.
author: mberdugo
ms.author: monaberdugo
ms.topic: how-to
ms.service: powerbi
ms.subservice: powerbi-developer
ms.custom:
ms.date: 06/03/2024
---

# Automatically install Power BI apps when embedding content for your organization

**APPLIES TO:** :::image type="icon" source="../../includes/media/no-icon.svg" border="false":::&nbsp;App&nbsp;owns&nbsp;data :::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::&nbsp;User&nbsp;owns&nbsp;data

To embed content from an app, the user needs [access to the app](../../collaborate-share/service-create-distribute-apps.md) that contains the content to embed. If the app isn't installed, the embedding will fail. To make embedding content from an app easier, you can set up [automatic app installation](https://powerbi.microsoft.com/blog/automatically-install-apps/) in PowerBI.com for your organization. Defining automatic app installation is a tenant level action and applies to all apps.

## Automatically install an app upon embedding content

If you have access to an app that isn't installed, and try to embed app content, the embedding will fail. To avoid this problem, allow automatic installation of the app upon embedding content. Allowing automatic installation means if the app the user tries to embed content from isn't installed, then the app is automatically installed for the user. Automatic app installation results in a smoother experience for the user.

## Embedding for Power BI users (User owns data)

To allow the automatic installation of apps for your users, add the *Create APIs* permission to your application when you're [registering your application](register-app.md#step-2---register-your-application). If you've already registered your app, add the Create APIs permission by [changing your application's permissions](/power-bi/developer/embedded/change-permissions).

:::image type="content" source="media/embed-auto-install-app/register-app-create-content.png" alt-text="Screenshot of the Power BI embedding setup tool, which shows the selected Create APIs option.":::

Provide the app ID in the embed URL. To provide the app ID, the app creator must install the app and then use one of the supported [Power BI REST API](/rest/api/power-bi/) calls, such as [Get Reports](/rest/api/power-bi/reports/getreports) or [Get Dashboards](/rest/api/power-bi/dashboards/getdashboards). The app creator must take the embed URL from the REST API response. The app ID appears in the URL if the content is from an app. Use the embed URL to embed content.

## Secure embedding

To use automatic application installation, the app creator must install the app. Then the app creator must go to the app on PowerBI.com, navigate to the report, and get the link. All other users with access to the app that can use the link can embed the report.

## Considerations and limitations

* You can only embed reports and dashboards in this scenario.

* This feature is currently not supported for app-owns data or SharePoint embedding scenarios.
