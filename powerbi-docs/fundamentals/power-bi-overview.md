---
title: "What is Power BI?"
description: "Learn what Power BI is, how Power BI Desktop and Power BI service work together to turn data into insights. Explore key benefits and get started today."
author: JulCsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.search.form: product-power-bi
ms.topic: overview
ms.date: 03/23/2026
LocalizationGroup: Get started
# Customer intent: As a Power BI customer or potential customer, I want to get an overview of Power BI so I can understand how the different parts fit together, so that I know which part to use to accomplish my tasks/goals.
ms.custom: intro-overview
ai-usage: ai-assisted
---

# What is Power BI?

Power BI is Microsoft's business analytics platform that helps you turn data into actionable insights. Whether you're a business user, report creator, or developer, Power BI offers integrated tools and services to connect, visualize, and share data across your organization.

## Find what you need

Jump to the section that matches what you're trying to do:

| I'm a... | Start here |
|---|---|
| **Business user** viewing and exploring reports | [Basics of the Power BI service](service-basic-concepts.md) |
| **Report creator** building or publishing reports | [Get started with Power BI Desktop](desktop-getting-started.md) |
| **Decision maker** evaluating Power BI | [Power BI and Microsoft Fabric](#power-bi-and-microsoft-fabric) and [Core features](#core-features-of-power-bi-desktop-and-power-bi-service) |
| **Administrator** setting up Power BI for my org | [Get started with the admin portal](/fabric/admin/admin-center) |
| **Developer** embedding or extending Power BI | [Power BI developer documentation](../developer/index.yml) |

In this article, you learn:

- What Power BI is and how it fits with Microsoft Fabric
- The key differences between Power BI Desktop and Power BI service
- How to get started with Power BI step-by-step
- Which Power BI component to use for your specific needs

Power BI is a core component of Microsoft Fabric, providing analytics and visualization capabilities. In Fabric, Power BI shares features like data integration, dataflows, and security with other Fabric experiences. However, some features - such as Power BI reports, dashboards, and the Power BI service - are unique to Power BI.

## Power BI and Microsoft Fabric

[Microsoft Fabric](/fabric/get-started/microsoft-fabric-overview) is an all-in-one analytics platform that includes Power BI as one of its core workloads. If you're a Power BI user, here's what you need to know.

**Key points**:

- No migration needed - your Power BI content and workspaces stay the same.
- Use your existing Power BI or Microsoft 365 account to sign in.
- Fabric adds new capabilities, but Power BI’s interface and experience stay familiar.

The following table summarizes the key features of Power BI and how they compare to Microsoft Fabric:

| Feature                        | Description                                                      | Fabric | Power BI |
|--------------------------------|------------------------------------------------------------------|:------:|:--------:|
| OneLake Integration            | Unified data lake for all workloads                              |   ✔️   |    ✔️    |
| Direct Lake Mode               | Query data in OneLake without import or caching                  |   ✔️   |    ✔️    |
| Notebooks and Dataflows Gen2   | Advanced data prep, shared across Fabric                         |   ✔️   |    ✔️    |
| Data Activator                 | Real-time alerting and automation                                |   ✔️   |    ✔️    |
| Security and Governance        | Shared via Microsoft Purview                                     |   ✔️   |    ✔️    |
| Copilot                        | AI-powered assistant for insights and report creation            |   ✔️   |    ✔️    |
| Power BI Desktop               | Windows app for report development                               |        |    ✔️    |
| Power BI Service               | Cloud platform for publishing, sharing, and collaboration        |        |    ✔️    |
| Paginated Reports              | Pixel-perfect, printable reports                                 |        |    ✔️    |
| Power BI Visuals Marketplace   | Custom visuals and integrations                                  |        |    ✔️    |
| Q&A and Natural Language       | AI-powered data querying                                         |        |    ✔️    |
| Power BI Goals                 | KPI tracking and scorecards                                      |        |    ✔️    |

## Power BI step-by-step

> **Quick start**: [Sign up for Power BI](https://www.microsoft.com/power-platform/products/power-bi/getting-started-with-power-bi) | [Download Power BI Desktop](https://www.microsoft.com/power-platform/products/power-bi/desktop) | [Access Power BI service](https://app.powerbi.com/)

Follow these steps to get started with Power BI:

1. **Get started**: Sign up and set up your workspace. Download Power BI Desktop or use the Power BI service in your browser.
1. **Connect and prepare data**: Connect to sources like Excel, SQL, or cloud services. Clean and shape your data.
1. **Model and combine data**: Create relationships, add calculations, and combine sources for a complete view.
1. **Build reports and dashboards**: Use drag-and-drop tools to create interactive visuals.
1. **Explore and analyze**: Filter, sort, and drill down to find insights. Use built-in analytics.
1. **Share and collaborate**: Publish to the Power BI service, share with your team, and collaborate in real time.
1. **Administer and secure**: Manage access, set up security roles, and monitor usage.

For a detailed breakdown of Power BI service capabilities organized by user role (creators versus consumers), see [Basics of the Power BI service](service-basic-concepts.md).

## Power BI Desktop vs. the Power BI service

Power BI has two main components: **Power BI Desktop** and the **Power BI service**. Desktop is best for data modeling and report creation, while the service is ideal for sharing and collaboration. Both can connect to data sources and create visualizations. There's also a **Power BI Mobile app** for viewing reports on the go.

| Need            | Use this                                      | Why                                   |
|-----------------|-----------------------------------------------|---------------------------------------|
| Create reports  | [Power BI Desktop](desktop-getting-started.md) | Full data modeling and design tools   |
| Share with team | [Power BI service](service-get-started.md)     | Collaboration and sharing features    |
| View on mobile  | [Power BI Mobile apps](../explore-reports/mobile/mobile-apps-for-mobile-devices.md) | Optimized for phones and tablets |

## Core features of Power BI Desktop and Power BI service

Power BI Desktop and the Power BI service each have unique features that cater to different aspects of data analysis and reporting.

**Power BI Desktop**:

- Connect to more than 100 data sources, including databases, cloud services, files, and web sources
- Use Power Query Editor for data transformation
- Create data models with DAX, calculated columns, and relationships
- Access more than 30 built-in and custom visuals
- Utilize advanced features like performance analyzer, external tools, and composite models
- [Get started with Power BI Desktop](desktop-getting-started.md)

**Power BI Service**:

- Use workspaces for team collaboration
- Create apps for distributing dashboards and reports
- Build dataflows for reusable data preparation
- Share datasets across reports
- Design real-time dashboards and streaming data
- Schedule refresh, set up email subscriptions, create alerts, use Q&A, embed content, and export data
- Implement security with RLS, sensitivity labels, usage metrics, and audit logs
- [Learn more about the Power BI service](power-bi-service-overview.md)

## Specialized Power BI features and capabilities

The Power BI ecosystem includes specialized tools and features to enhance reporting and analytics.

- **Paginated reports**: Use these reports for structured, printable reports, such as invoices. Create them by using Power BI Report Builder. [Learn more about paginated reports](../paginated-reports/paginated-reports-report-builder-power-bi.md).
- **On-premises reporting**: By using Power BI Report Server, you can keep reports on-premises, with the option to move to the cloud later. [Learn more about Power BI Report Server](../report-server/get-started.md).

## Related content

- [Tutorial: Get started with the Power BI service](service-get-started.md)
- [Quickstart: Connect to data in Power BI Desktop](../connect-data/desktop-quickstart-connect-to-data.md)
- [Get started with Power BI Desktop](desktop-getting-started.md)
- [Create a report in the Power BI service](../create-reports/service-report-create-new.md)
- [Basic concepts for report designers](service-basic-concepts.md)
- [What is Microsoft Fabric?](/fabric/get-started/microsoft-fabric-overview)
- [Compare Power BI Desktop and Power BI service](../fundamentals/service-service-vs-desktop.md)
- [Tutorial: Navigate the Power BI service](../explore-reports/end-user-experience.md)