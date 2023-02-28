---
title: "Power BI usage scenarios: Embed for your customers"
description: "Learn how a developer can programmatically embed Power BI content in a custom application for your customers."
author: mberdugo
ms.author: monaberdugo
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 12/31/2022
---

# Power BI usage scenarios: Embed for your customers

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This usage scenario focuses on how a developer can programmatically embed Power BI content in a custom application _for your customers_. (The developer isn't necessarily responsible for creating the Power BI content.) The **For your customers** scenario applies when the application audience comprises users who don't have permission or appropriate licenses to access Power BI content in your customers. The custom application requires an embedding identity that has permission and an appropriate license to access Power BI content. The custom application could be a multitenancy application.

> [!NOTE]
> In this scenario, Power BI is platform-as-a-service (PaaS). The embedding scenario is sometimes referred to as _App owns data_.

## Scenario diagram

The following diagram depicts a high-level overview of the most common user actions and Power BI components that support embedding for your customers.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-embed-for-your-customers/usage-scenario-embed-for-your-customers-inline.png" alt-text="Image shows a diagram of embedding for your customers, which is about integrating content into an external application. Items in the diagram are described in the following table." lightbox="media/powerbi-implementation-planning-usage-scenario-embed-for-your-customers/usage-scenario-embed-for-your-customers-expanded.png" border="false":::

The above diagram depicts the following user actions, tools, and features:

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](media/common/icon-01-red-30x30.png) | The Power BI content creator develops a BI solution by using [Power BI Desktop](/power-bi/fundamentals/desktop-what-is-desktop). |
| ![Item 2.](media/common/icon-02-red-30x30.png) | When ready, the content creator publishes the Power BI Desktop file (.pbix) to the [Power BI service](/power-bi/fundamentals/power-bi-service-overview). |
| ![Item 3.](media/common/icon-03-red-30x30.png) | To connect to any data sources that reside within a private organizational network, an [on-premises data gateway](/power-bi/connect-data/service-gateway-onprem) is required for data refresh. |
| ![Item 4.](media/common/icon-04-red-30x30.png) | A Power BI workspace contains Power BI items ready for embedding. An embedding identity, either a service principal or master user account, must belong to either the [workspace Admin or Member role](powerbi-implementation-planning-security-content-creator-planning.md#workspace-roles). In a multi-tenancy solution, the separation of tenants is achieved by creating one workspace for each tenant. This design pattern is known as _workspace separation_. |
| ![Item 5.](media/common/icon-05-red-30x30.png) | The custom application prompts the app user to authenticate by using any authentication method (not necessarily Azure AD). |
| ![Item 6.](media/common/icon-06-red-30x30.png) | When authentication succeeds, the custom application uses the embedding identity to acquire and cache an Azure AD access token. |
| ![Item 7.](media/common/icon-07-red-30x30.png) | The custom application uses the Azure AD access token to make Power BI REST API calls on behalf of the embedding identity. Specifically, the application uses the access token to retrieve metadata about workspace items. Metadata includes properties required to embed content in the custom application. It also uses the access token to generate and cache embed tokens, which represent facts about Power BI content and how the application can access it. |
| ![Item 8.](media/common/icon-08-red-30x30.png) | The custom application embeds a specific Power BI item in an `iframe` HTML element. The application can support the creation and editing of Power BI reports, providing the embedding identity has permission to do so. |
| ![Item 9.](media/common/icon-09-red-30x30.png) | Power BI administrators oversee and monitor activity in the Power BI service. |

## Key points

The following are some key points to emphasize about programmatically embed Power BI content in a custom application for your customers.

### Embeddable content

When embedding for your customers, you can embed the following Power BI content types:

- Power BI reports
- Specific Power BI report visuals
- Paginated reports
- Q&A experience
- Dashboards
- Specific dashboard tiles

There's no limitation on where the content resides, except the content can't reside in a personal workspace. What matters is that the embedding identity has permission to view (or create or edit) the content.

### Authentication

The authentication flow is _non-interactive authentication_ with Azure AD (also known as _silent authentication_). Non-interactive authentication means that the app user isn't required to have a Power BI account, and even when they do, it isn't used. So a dedicated Azure AD identity, known as the embedding identity, authenticates with Azure AD. An embedding identity can be a service principal or a master user account (described later).

The authentication flow attempts to acquire an Azure token in a way in which the authentication service can't prompt the user for additional information. Once the app user authenticates with the app (the app can use any authentication method), the app uses the embedding identity to acquire an Azure AD token by using a non-interactive authentication flow.

Once the app acquires an Azure AD token, it caches it and then uses it to generate an _embed token_. An embed token represents facts about Power BI content and how to access them. The app uses the embed token to embed content inside an `iframe` HTML element.

#### Service principal

An app can use a service principal to acquire an Azure AD token. An Azure service principal is a security identity used by apps. It defines the access policy and permissions for the app in the Azure AD tenant, enabling core features such as authentication of the app during sign in, and authorization during resource access. A service principal can authenticate by using an app secret or certificate. A service principal can only use Power BI REST APIs, when the _Allow service principals to use Power BI APIs_ tenant setting is enabled, and the service principal belongs to an allowed group.

> [!TIP]
> We recommend using a service principal for production apps. It provides the highest security and for this reason it's the approach recommended by Azure AD. Also, it supports better automation and scale and there's less management overhead. However, it requires Power BI admin rights to set up and manage.

#### Master user account

An app can use a _master user account_ to acquire an AD token. A master user account is a regular Azure AD user. In Power BI, the account must belong to the workspace Amin or Member role to embed workspace content. It must also have either a Power BI Pro or Power BI Premium Per User (PPU) license.

> [!NOTE]
> It's not possible to use a master user account to embed paginated reports.

For more information about embedding identities, see [Set up permissions to embed Power BI content](/training/modules/power-bi-embedded-permissions-content/introduction).

### Licensing

When embedding Power BI content by using the _For your customers_ scenario, you need to ensure that content resides in a workspace that has one of the following license modes:

- **Premium per capacity:** This license mode is available with [Power BI Premium](/power-bi/enterprise/service-premium-what-is).
- **Embedded:** This license mode is available with [Power BI Embedded](https://azure.microsoft.com/products/power-bi-embedded/).

Each license mode option requires the purchase of a billable product that is a capacity-based license. A capacity-based license allows you to create _reserved capacities_.

Capacities represent the computational resources that are required to process workloads, such as report rendering and data refresh. Reserved capacities are isolated from other customers' workloads, so they offer scale that can deliver dependable and consistent performance.

> [!NOTE]
> It's not possible to use the _For your customers_ scenario in production environments with the Power BI (free), Power BI Pro, or Power BI PPU licenses.

For more information about products and licensing, see [Select the appropriate Power BI embedded analytics product](/training/modules/power-bi-embedded-select).

### Power BI client APIs

The [Power BI client APIs](/javascript/api/overview/powerbi/) allow a developer to achieve tight integration between the custom application and the Power BI content. They develop the application by writing custom logic with JavaScript or TypeScript that runs in the browser.

The application can set up and automate operations, and it can respond to user-initiated actions. Additionally, you can integrate Power BI capabilities, including navigation, filters and slicers, menu operations, layout, and bookmarks.

> [!TIP]
> The _Power BI Embedded Analytics Playground_ is a website that helps you learn, explore, and experiment with Power BI embedded analytics. It includes a developer sandbox for hands-on experiences that use the client APIs with sample Power BI content or your own content. Code snippets and showcases are available for you to explore, too.
>
> For more information, see [What is the Power BI embedded analytics playground?](/power-bi/developer/embedded/power-bi-playground/)

### Enforce data permissions

When the app users should only have access to view a subset of data, you need to develop a solution that restricts access to Power BI dataset data. The reason might be because some users aren't permitted to view specific data, such as sales results of other sales regions. Achieving this requirement commonly involves setting up row-level security (RLS), which involves defining roles and rules that filter model data.

When you use the _For your customers scenario_, the app must set the effective identity of the embed token to restrict access to data. This effective identity determines how Power BI will connect to the model and how it will enforce RLS roles. How you set up the effective identity depends on the type of Power BI dataset.

For more information about RLS roles for embedded content, see [Enforce data permissions for Power BI embedded analytics](/training/modules/power-bi-embedded-permissions-analytics/).

### Multitenancy applications

Multiple organizations can use a multitenancy app, where each organization is a tenant. A multitenancy app that embeds Power BI analytics can use the _For your customers_ scenario because the app users include external users. When designing a multitenancy app, you can choose from two different tenancy models.

The recommended approach is to use the _workspace separation_ model. You can achieve this approach by creating one Power BI workspace for each tenant. Each workspace contains Power BI artifacts that are specific to that tenant, and the datasets connect to a separate database for each tenant.

> [!TIP]
> For more information about the workspace separation model, see [Automate workspace separation](/training/modules/power-bi-embedded-automate/workspace-separation). For more information about scalable multitenancy apps, see [Service principal profiles for multitenancy apps in Power BI Embedded](/power-bi/developer/embedded/embed-multi-tenancy).

Alternatively, the single multi-customer database model is available. When you use this model, your solution will achieve separation with a single workspace that includes a set of Power BI items that are shared across all tenants. RLS roles, which are defined in the datasets, will help filter the data more securely to ensure that organizations only view their own data.

### No-code embedding

Developing a programmatic solution requires skill, time, and effort. Consider that there's one embedding technique known as _no-code embedding_ that non-developers can use to embed Power BI reports or dashboards in [Power Pages](/power-apps/maker/portals/add-powerbi).

### Gateway setup

Typically, a [data gateway](/power-bi/connect-data/service-gateway-onprem) is required when accessing data sources that reside within the private organizational network or a virtual network. The two purposes of a gateway are to [refresh imported data](/power-bi/connect-data/refresh-data), or view a report that queries a live connection or [DirectQuery](/power-bi/connect-data/desktop-directquery-about) dataset.

> [!NOTE]
> A centralized [data gateway](/power-bi/connect-data/service-gateway-personal-mode#on-premises-data-gateway-vs-on-premises-data-gateway-personal-mode) in _standard mode_ is strongly recommended over gateways in [personal mode](/power-bi/connect-data/service-gateway-personal-mode). In standard mode, the data gateway supports live connection and DirectQuery operations (in addition to scheduled data refresh operations).

### System oversight

The [activity log](/power-bi/admin/service-admin-auditing) records user activities that occur in the Power BI service. Power BI administrators can use the activity log data that's collected to perform [auditing](powerbi-adoption-roadmap-system-oversight.md#auditing) to help them understand usage patterns and adoption.

## Next steps

To learn more about Power BI embedded analytics, work through the [Embed Power BI analytics](/training/paths/power-bi-embedded/) learning path.

You can also work through the [Power BI Developer in a Day course](/power-bi/learning-catalog/developer-online-course/). It includes a self-study kit that guides you through the process of developing an ASP.NET Core MVC app.

For other useful scenarios to help you with Power BI implementation decisions, see the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
