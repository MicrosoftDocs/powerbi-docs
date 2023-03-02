---
title: "Power BI usage scenarios: Embed for your organization"
description: "Learn how a developer can programmatically embed Power BI content in a custom application for your organization."
author: mberdugo
ms.author: monaberdugo
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 12/29/2022
---

# Power BI usage scenarios: Embed for your organization

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This usage scenario focuses on how a developer can programmatically embed Power BI content in a custom application _for your organization_. (The developer isn't necessarily responsible for creating the Power BI content.) The **For your organization** scenario applies when the application audience comprises users who have permission and appropriate licenses to access Power BI content in the organization. These users must have organizational accounts (including guest accounts), which authenticate with Azure Active Directory (Azure AD).

> [!NOTE]
> In this scenario, Power BI is software-as-a-service (SaaS). The embedding scenario is sometimes referred to as _User owns data_.

## Scenario diagram

The following diagram depicts a high-level overview of the most common user actions and Power BI components that support embedding for your organization.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-embed-for-your-organization/usage-scenario-embed-for-your-organization-inline.png" alt-text="Image shows a diagram of embedding for your organization, which is about integrating content into an internal application. Items in the diagram are described in the following table." lightbox="media/powerbi-implementation-planning-usage-scenario-embed-for-your-organization/usage-scenario-embed-for-your-organization-expanded.png" border="false":::

The above diagram depicts the following user actions, tools, and features:

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](media/common/icon-01-red-30x30.png) | The Power BI content creator develops a BI solution by using [Power BI Desktop](/power-bi/fundamentals/desktop-what-is-desktop). |
| ![Item 2.](media/common/icon-02-red-30x30.png) | When ready, the content creator publishes the Power BI Desktop file (.pbix) to the [Power BI service](/power-bi/fundamentals/power-bi-service-overview). |
| ![Item 3.](media/common/icon-03-red-30x30.png) | To connect to any data sources that reside within a private organizational network, an [on-premises data gateway](/power-bi/connect-data/service-gateway-onprem) is required for data refresh. |
| ![Item 4.](media/common/icon-04-red-30x30.png) | A Power BI workspace contains Power BI items ready for embedding. For non-personal workspaces, users of the custom application have [permission to view (or create or modify) Power BI content](powerbi-implementation-planning-security-report-consumer-planning.md) because they belong to a workspace role or they have direction permissions. |
| ![Item 5.](media/common/icon-05-red-30x30.png) | The custom application prompts the app user to authenticate with Azure AD. When authentication succeeds, the custom application caches an Azure AD access token. |
| ![Item 6.](media/common/icon-06-red-30x30.png) | The custom application uses the Azure AD access token to make Power BI REST API calls on behalf of the app user. Specifically, the application uses the access token to retrieve metadata about workspace items. Metadata includes properties required to embed content in the custom application. |
| ![Item 7.](media/common/icon-07-red-30x30.png) | The custom application embeds a specific Power BI item in an `iframe` HTML element. The application can support the creation and editing of Power BI reports, providing the user has permission to do so. |
| ![Item 8.](media/common/icon-08-red-30x30.png) | Power BI administrators oversee and monitor activity in the Power BI service. |

## Key points

The following are some key points to emphasize about programmatically embed Power BI content in a custom application for your organization.

### Use cases

There are several reasons why you might embed Power BI content for your organization.

- **Internal business intelligence portal:** You might want to create an internal business intelligence (BI) portal as a replacement for the Power BI service. That way, you can create a custom application that integrates content from Power BI and other BI tools.
- **Internal app:** You might want to develop an intranet app that shows data visualizations. For example, an intranet site for a manufacturing department could show real-time visuals that provide up-to-date information about the production line.
- **Customized logging:** You might want to log custom events to record Power BI content access and use, beyond what the [activity log](/power-bi/admin/service-admin-auditing) records.

> [!TIP]
> If you're looking to create a BI portal styled for your organization, you might be able to achieve that by simply adding [custom branding to the Power BI service](/power-bi/admin/service-admin-custom-branding).

### No-code embedding

Developing a programmatic solution requires skill, time, and effort. Consider that there are embedding techniques known as _no-code embedding_ that non-developers can use to embed content in a simple internal portal or website.

- Use the [Power BI report web part](/power-bi/collaborate-share/service-embed-report-spo) to embed Power BI reports in SharePoint Online.
- Use a [secure embed code](/power-bi/collaborate-share/service-embed-secure) (or HTML) that's generated by Power BI to embed Power BI reports in internal web portals.
- Embed Power BI reports or dashboards in [Power Pages](/power-apps/maker/portals/add-powerbi).
- [Embed reports in a Microsoft Teams channel or chat](/power-bi/collaborate-share/service-embed-report-microsoft-teams).

These techniques require that report consumers belong to the organization, be authenticated, and have permission to access the reports. Power BI ensures that all permissions and data security are enforced when consumers view the reports. Sometimes, users might be challenged to authenticate by signing in to Power BI.

### Embeddable content

When embedding for your organization, you can embed the following Power BI content types:

- Power BI reports
- Specific Power BI report visuals
- Paginated reports
- Q&A experience
- Dashboards
- Specific dashboard tiles

There's no limitation on where the content resides. The content could reside in a personal workspace or a regular workspace. What matters is that the app user has permission to view (or create or edit) the content. For example, it's possible to embed content from the app user's personal workspace.

Any content the user can see in the Power BI service may be embedded in a custom application. If the user has permission to create or edit content, it's possible for a custom app to support that functionality (for Power BI reports only).

### Authentication

The authentication flow is _interactive authentication_ with Azure AD. Interactive authentication means that the app user will be challenged to authenticate. When authenticated, Azure AD returns an access token. It's the responsibility of the custom application to cache the access token so that it can be used to make Power BI REST API calls and to embed content inside an `iframe` HTML element. Those calls can retrieve metadata about Power BI content on behalf of the app user, including the properties required to embed it in the custom application.

### Licensing

There's no specific licensing requirement to embed for your organization. What matters is that the app user has permission and an appropriate Power BI license to view (or create or edit) the content. It's even possible to embed content from a personal workspace when the app user only has a Power BI (free) license.

### Power BI client APIs

The [Power BI client APIs](/javascript/api/overview/powerbi/) allow a developer to achieve tight integration between the custom application and the Power BI content. They develop the application by writing custom logic with JavaScript or TypeScript that runs in the browser.

The application can set up and automate operations, and it can respond to user-initiated actions. Additionally, you can integrate Power BI capabilities, including navigation, filters and slicers, menu operations, layout, and bookmarks.

> [!TIP]
> The _Power BI Embedded Analytics Playground_ is a website that helps you learn, explore, and experiment with Power BI embedded analytics. It includes a developer sandbox for hands-on experiences that use the client APIs with sample Power BI content or your own content. Code snippets and showcases are available for you to explore, too.
>
> For more information, see [What is the Power BI embedded analytics playground?](/power-bi/developer/embedded/power-bi-playground/)

### Gateway setup

Typically, a [data gateway](/power-bi/connect-data/service-gateway-onprem) is required when accessing data sources that reside within the private organizational network or a virtual network. The two purposes of a gateway are to [refresh imported data](/power-bi/connect-data/refresh-data), or view a report that queries a live connection or [DirectQuery](/power-bi/connect-data/desktop-directquery-about) dataset.

> [!NOTE]
> A centralized [data gateway](/power-bi/connect-data/service-gateway-personal-mode#on-premises-data-gateway-vs-on-premises-data-gateway-personal-mode) in _standard mode_ is strongly recommended over gateways in [personal mode](/power-bi/connect-data/service-gateway-personal-mode). In standard mode, the data gateway supports live connection and DirectQuery operations (in addition to scheduled data refresh operations).

### System oversight

The [activity log](/power-bi/admin/service-admin-auditing) records user activities that occur in the Power BI service. Power BI administrators can use the activity log data that's collected to perform [auditing](powerbi-adoption-roadmap-system-oversight.md#auditing) to help them understand usage patterns and adoption. Logged events will describe the consumption method as _Embedding for your organization_. There's presently no way to determine whether content was viewed in a no-code embedding experience in a custom application.

## Next steps

To learn more about Power BI embedded analytics, work through the [Embed Power BI analytics](/training/paths/power-bi-embedded/) learning path.

You can also work through the [Power BI Developer in a Day course](/power-bi/learning-catalog/developer-online-course/). It includes a self-study kit that guides you through the process of developing an ASP.NET Core MVC app.

For other useful scenarios to help you with Power BI implementation decisions, see the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
