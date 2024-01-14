---
title: "Power BI usage scenarios: Embed for your organization"
description: "Learn how a developer can programmatically embed Power BI content in a custom application for your organization."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 01/16/2023
---

# Power BI usage scenarios: Embed for your organization

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This usage scenario focuses on how a developer can programmatically embed Power BI content in a custom application _for your organization_. (The developer isn't necessarily responsible for creating the Power BI content.) The **Embed for your organization** scenario applies when the application audience comprises users who have permission and appropriate licenses to access Power BI content in the organization. These users must have organizational accounts (including guest accounts), which authenticate with Microsoft Entra ID ([previously known as Azure Active Directory](/azure/active-directory/fundamentals/new-name)).

> [!NOTE]
> In this scenario, Power BI is software-as-a-service (SaaS). The embedding scenario is sometimes referred to as _User owns data_.

## Scenario diagram

The following diagram depicts a high-level overview of the most common user actions and Power BI components that support embedding for your organization.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-embed-for-your-organization/usage-scenario-embed-for-your-organization-inline.svg" alt-text="Diagram shows embedding for your organization, which is about integrating content into internal applications. Items in the diagram are described in the following table." lightbox="media/powerbi-implementation-planning-usage-scenario-embed-for-your-organization/usage-scenario-embed-for-your-organization-expanded.svg" border="false":::

> [!TIP]
> We encourage you to [download the scenario diagram](powerbi-implementation-planning-usage-scenario-diagrams.md#embed-for-your-organization) if you'd like to embed it in your presentation, documentation, or blog post—or print it out as a wall poster. Because it's a Scalable Vector Graphics (SVG) image, you can scale it up or down without any loss of quality.

The above diagram depicts the following user actions, tools, and features:

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | The Power BI content creator develops a BI solution by using [Power BI Desktop](/power-bi/fundamentals/desktop-what-is-desktop). |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | When ready, the content creator publishes the Power BI Desktop file (.pbix) or Power BI project file (.pbip) to the [Power BI service](/power-bi/fundamentals/power-bi-service-overview). |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Some data sources may require an [On-premises data gateway](/power-bi/connect-data/service-gateway-onprem) or VNet gateway for data refresh, like those that reside within a private organizational network. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | A Power BI workspace contains Power BI items ready for embedding. For non-personal workspaces, users of the custom application have [permission to view (or create or modify) Power BI content](powerbi-implementation-planning-security-report-consumer-planning.md) because they belong to a workspace role or they have direction permissions. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | The custom application prompts the app user to authenticate with Microsoft Entra ID. When authentication succeeds, the custom application caches a Microsoft Entra access token. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | The custom application uses the Microsoft Entra access token to make Power BI REST API calls on behalf of the app user. Specifically, the application uses the access token to retrieve metadata about workspace items. Metadata includes properties required to embed content in the custom application. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | The custom application embeds a specific Power BI item in an `iframe` HTML element. The application can support the creation and editing of Power BI reports, providing the user has permission to do so. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | Power BI administrators oversee and monitor activity in the Power BI service. |

## Key points

The following are some key points to emphasize about programmatically embed Power BI content in a custom application for your organization.

### Use cases

There are several reasons why you might embed Power BI content for your organization.

- **Internal business intelligence portal:** You might want to create an internal business intelligence (BI) portal as a replacement for the Power BI service. That way, you can create a custom application that integrates content from Power BI and other BI tools.
- **Internal app:** You might want to develop an intranet app that shows data visualizations. For example, an intranet site for a manufacturing department could show real-time visuals that provide up-to-date information about the production line.
- **Customized logging:** You might want to log custom events to record Power BI content access and use, beyond what the [activity log](/power-bi/enterprise/service-admin-auditing) records.

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

Any content the user can see in the Power BI service can be embedded in a custom application. If the user has permission to create or edit content, it's possible for a custom app to support that functionality (for Power BI reports only).

### Authentication

The authentication flow is _interactive authentication_ with Microsoft Entra ID. Interactive authentication means that the app user will be challenged to authenticate. When authenticated, Microsoft Entra ID returns an access token. It's the responsibility of the custom application to cache the access token so that it can be used to make Power BI REST API calls and to embed content inside an `iframe` HTML element. Those calls can retrieve metadata about Power BI content on behalf of the app user, including the properties required to embed it in the custom application.

### Licensing

There's no specific licensing requirement to embed for your organization. What matters is that the app user has permission and an appropriate Power BI license to view (or create or edit) the content. It's even possible to embed content from a personal workspace when the app user only has a Fabric (free) license.

### Power BI client APIs

The [Power BI client APIs](/javascript/api/overview/powerbi/) allow a developer to achieve tight integration between the custom application and the Power BI content. They develop the application by writing custom logic with JavaScript or TypeScript that runs in the browser.

The application can set up and automate operations, and it can respond to user-initiated actions. Additionally, you can integrate Power BI capabilities, including navigation, filters and slicers, menu operations, layout, and bookmarks.

> [!TIP]
> The _Power BI Embedded Analytics Playground_ is a website that helps you learn, explore, and experiment with Power BI embedded analytics. It includes a developer sandbox for hands-on experiences that use the client APIs with sample Power BI content or your own content. Code snippets and showcases are available for you to explore, too.
>
> For more information, see [What is the Power BI embedded analytics playground?](/power-bi/developer/embedded/power-bi-playground/)

### Gateway setup

Typically, a [data gateway](/power-bi/connect-data/service-gateway-onprem) is required when accessing data sources that reside within the private organizational network or a virtual network. The two purposes of a gateway are to [refresh imported data](/power-bi/connect-data/refresh-data), or view a report that queries a live connection or [DirectQuery](/power-bi/connect-data/desktop-directquery-about) semantic model ([previously known as a dataset](../connect-data/service-datasets-rename.md)).

> [!NOTE]
> A centralized [data gateway](/power-bi/connect-data/service-gateway-personal-mode#on-premises-data-gateway-vs-on-premises-data-gateway-personal-mode) in _standard mode_ is strongly recommended over gateways in [personal mode](/power-bi/connect-data/service-gateway-personal-mode). In standard mode, the data gateway supports live connection and DirectQuery operations (in addition to scheduled data refresh operations).

### System oversight

The [activity log](/power-bi/enterprise/service-admin-auditing) records user activities that occur in the Power BI service. Power BI administrators can use the activity log data that's collected to perform [auditing](powerbi-implementation-planning-auditing-monitoring-overview.md) to help them understand usage patterns and adoption. Logged events will describe the consumption method as _Embedding for your organization_. There's presently no way to determine whether content was viewed in a no-code embedding experience in a custom application.

## Related content

To learn more about Power BI embedded analytics, work through the [Embed Power BI analytics](/training/paths/power-bi-embedded/) learning path.

You can also work through the [Power BI Developer in a Day course](/power-bi/learning-catalog/developer-online-course/). It includes a self-study kit that guides you through the process of developing an ASP.NET Core MVC app.

For other useful scenarios to help you with Power BI implementation decisions, see the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
