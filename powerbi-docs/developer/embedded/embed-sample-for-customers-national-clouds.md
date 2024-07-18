---
title: Embed content in your Power BI embedded analytics application for government and national/regional clouds
description: Learn how to integrate Power BI into your application using embedded analytics software, embedded analytics tools, or embedded business intelligence tools for government and national/regional clouds.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: tutorial
ms.custom:
ms.date: 03/07/2024
---

# Tutorial: Embed Power BI content into your application for national/regional clouds

Learn how to embed analytical content within your business process applications for the [national/regional cloud](/azure/active-directory/develop/authentication-national-cloud). Use the Power BI .NET SDK with the Power BI JavaScript API to embed a report, dashboard, or tile, into your web applications.

Power BI supports the following national/regional clouds:

* U.S. Government Community Cloud (GCC)

* U.S. Government Community Cloud High (GCC High)

* U.S. Military Contractors (DoDCON)

* U.S. Military (DoD)

* Power BI for China cloud

:::image type="content" source="media/embed-sample-for-customers/powerbi-embed-dashboard.png" alt-text="Screenshot showing the Embed a dashboard feature.":::

To get started with this walkthrough, you need a **Power BI account**. If you don't have an account set up, depending on the type of government or country/region, you can choose the right national/regional cloud for you. Sign up for a [U. S. government Power BI account](../../enterprise/service-govus-signup.md), or a [Power BI for China cloud account](https://www.21vbluecloud.com/powerbi/).

> [!NOTE]
> Are you looking to embed a dashboard for your organization instead? See [Integrate a dashboard into an app for your organization](embed-sample-for-your-organization.md).

To integrate a dashboard into a web app, use the **Power BI** API and a Microsoft Entra authorization **access token** to get a dashboard. Load the dashboard using an embed token. The **Power BI** API provides programmatic access to specific **Power BI** resources. For more information, see [Power BI REST API](/rest/api/power-bi/), Power BI .NET SDK, and the [Power BI JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript).

## Download the sample

This article shows the code for the [App Owns Data sample](https://github.com/microsoft/PowerBI-Developer-Samples/tree/master/.NET%20Framework/Embed%20for%20your%20customers) on GitHub. To follow along with this walkthrough, download the sample. We're using the `.NET Framework/Embed for your customers` directory.

> [!IMPORTANT]
> You can only embed Power BI content from a Government Community Cloud (GCC) with a Microsoft 365 SKU. Other national/regional cloud customers can use [Microsoft 365 or Azure SKUs](embedded-capacity.md#which-sku-should-i-use).

:::image type="content" source="media/embed-sample-for-customers-national-clouds/embed-sample-for-customers-026.png" alt-text="A screenshot that shows downloading the App Owns Data sample.":::

:::image type="content" source="media/embed-sample-for-customers-national-clouds/embed-sample-for-customers-directory.png" alt-text="A screenshot that shows the App Owns Data directory.":::

* Government Community Cloud (GCC):

    1. In the *Web.config* file, update `applicationId` (Native app `applicationId`), `workspaceId`, the username (your master user), and password.

    2. Next, add the GCC parameters as follows.

        ```xml
        <add key="authorityUrl" value="https://login.microsoftonline.com/organizations/" />
        <add key="scopeBase" value="https://analysis.usgovcloudapi.net/powerbi/api/.default" />
        <add key="urlPowerBiServiceApiRoot" value="https://api.powerbigov.us/" />
        ```

* Military Contractors (DoDCON):

    1. In the *Web.config* file, update `applicationId` (Native app `applicationId`), `workspaceId`, the username (your master user), and password.

    2. Next, add the DoDCON parameters as follows.

        ```xml
        <add key="authorityUrl" value="https://login.microsoftonline.us/organizations/" />
        <add key="scopeBase" value="https://high.analysis.usgovcloudapi.net/powerbi/api/.default" />
        <add key="urlPowerBiServiceApiRoot" value="https://api.high.powerbigov.us/" />
        ```

* Military (DoD):

    1. In the *Web.config* file, update `applicationId` (Native app `applicationId`), `workspaceId`, the username (your master user), and password.

    2. Next, add the DoDCON parameters as follows.

        ```xml
        <add key="authorityUrl" value="https://login.microsoftonline.us/organizations/" />
        <add key="scopeBase" value="https://mil.analysis.usgovcloudapi.net/powerbi/api/.default" />
        <add key="urlPowerBiServiceApiRoot" value="https://api.mil.powerbigov.us/" />
        ```

* Power BI for China cloud parameters

    1. In the *Web.config* file, update `applicationId` (Native app `applicationId`), `workspaceId`, the username (your master user), and password.

    2. Next, add the Power BI for China cloud parameters as follows.

        ```xml
        <add key="authorityUrl" value="https://login.chinacloudapi.cn/organizations/" />
        <add key="scopeBase" value="https://analysis.chinacloudapi.cn/powerbi/api/.default" />
        <add key="urlPowerBiServiceApiRoot" value="https://api.powerbi.cn/" />
        ```

<a name='step-1---register-an-app-in-azure-ad'></a>

## Step 1 - register an app in Microsoft Entra ID

Register your application with Microsoft Entra ID to make REST API calls. For more information, see [Register a Microsoft Entra app to embed Power BI content](register-app.md). Since there are different national/regional cloud affiliations, there are distinct URLs to register your application.

* Government Community Cloud (GCC) - ```https://app.powerbigov.us/apps```

* Military Contractors (DoDCON) - ```https://app.high.powerbigov.us/apps```

* Military (DoD) - ```https://app.mil.powerbigov.us/apps```

* Power BI for China cloud - ```https://app.powerbi.cn/apps```

If you downloaded the [Embedding for your customer sample](https://github.com/microsoft/PowerBI-Developer-Samples/tree/master/.NET%20Core/Embed%20for%20your%20customers/AppOwnsData), you would use the `applicationId` you get, so that the sample can authenticate to Microsoft Entra ID. To configure the sample, change the `applicationId` in the *web.config* file.

<a name='step-2---get-an-access-token-from-azure-ad'></a>

## Step 2 - get an access token from Microsoft Entra ID

Within your application, you need to get an access token, from Microsoft Entra ID, before you can make calls to the Power BI REST API. For more information, see [Authenticate users and get a Microsoft Entra access token for your Power BI app](generate-embed-token.md). Since there are different national/regional cloud affiliations, there are distinct URLs to get an access token for your application.

* Government Community Cloud (GCC) - ```https://login.microsoftonline.com```

* Military Contractors (DoDCON) - ```https://login.microsoftonline.us```

* Military (DoD) - ```https://login.microsoftonline.us```

* Power BI for China cloud - ```https://login.chinacloudapi.cn```

You can see examples of these access tokens within each content item task in the **Controllers\HomeController.cs** file.

## Step 3 - embed content

Now that you have an access token, you can continue embedding as you would on any other platform.

* [Embed content for customers](embed-sample-for-customers.md#step-8---embed-your-content)
* [Embed content for your organization](embed-sample-for-your-organization.md#step-5---embed-your-content)

## Related content

* [Embedding for your customers sample](https://github.com/microsoft/PowerBI-Developer-Samples/tree/master/.NET%20Core/Embed%20for%20your%20customers/AppOwnsData)
* [Power BI JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
