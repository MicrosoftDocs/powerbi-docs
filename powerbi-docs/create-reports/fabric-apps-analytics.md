---
title: "Power BI data in Fabric Apps (preview)"
description: "Learn how Power BI users can connect data apps to existing semantic models in Microsoft Fabric. Explore Fabric Apps to build custom analytics experiences today."
author: julcsc
ms.author: juliacawthra
ms.reviewer: vipinhei
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: concept-article
ms.date: 05/22/2026
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
---
# Power BI data in Fabric Apps (preview)

This article is for Power BI users who want to understand how Fabric Apps complement existing Power BI reports. For full how-to guidance on creating and deploying Fabric Apps, see the [Fabric Apps documentation](/fabric/apps/overview).

## Fabric Apps for Power BI users

[Fabric Apps](/fabric/apps/overview) introduces a new way to analyze and visualize data when you need more flexibility or speed of creation than reports allow. It enables coding agents to create custom web apps for exploring and presenting data, removing many of the authoring, visualization, and analytical limitations Power BI authors traditionally work around. Reports remain a core analytics experience. Fabric Apps complement reports by supporting scenarios that require more flexibility, faster iteration, or more tailored user experiences.

## Benefits of the data app template

People who want to analyze and visualize data in Fabric Apps should use the data app template. This template contains a set of reusable primitives and agent capabilities that simplify data connectivity, AI-assisted analytics, and visualization generation. By default, apps created with the template include Fabric authentication and connectivity to semantic models, with additional Fabric data sources coming soon. The agent can generate reliable DAX and bind it to structured visual components designed specifically for analytical applications.

These built-in capabilities matter because, without them, an AI agent would need to handle authentication, DAX generation, and visualization design independently in every session. That approach leads to more failures, broken or empty visuals, inconsistent chart behavior, and unnecessary DAX queries during both development and runtime. Encoding those patterns directly into the template improves reliability, produces more cohesive visuals aligned with reporting best practices, and reduces query overhead. Learn more about the capabilities of Fabric Apps.

## Create a Fabric App connected to a semantic model

Before you start, review the [prerequisites for creating a Fabric App](/fabric/apps/create-app) in the Fabric documentation.

For step-by-step instructions, see [Create your first Fabric App](/fabric/apps/create-app) in the Fabric documentation. The guide walks you through using the data app template, connecting to your semantic model, and telling Copilot what you want it to create.

## Related content

- [Copilot for Power BI apps](copilot-apps-overview.md)
