---
title: Overview of Copilot in Power BI Mobile Apps
description: Learn about the Copilot features available in Power BI mobile apps, including in-report Copilot and standalone Copilot experiences.
author: JulCsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: overview
ms.collection: ce-skilling-ai-copilot
ms.date: 11/18/2025
#customer intent: As a Power BI mobile user, I want to understand what Copilot features are available in the mobile apps so I can use AI to get insights from my data on the go.
---

# Overview of Copilot in Power BI mobile apps (preview)

| :::image type="icon" source="./media/mobile-apps-logo-images/ios-logo-40-px.png" border="false" alt-text="Screenshot of iOS logo."::: | :::image type="icon" source="./media/mobile-apps-logo-images/ios-logo-40-px.png" border="false" alt-text="Screenshot of iOS logo."::: | :::image type="icon" source="./media/mobile-apps-logo-images/android-logo-40-px.png" border="false" alt-text="Screenshot of Android logo."::: | :::image type="icon" source="./media/mobile-apps-logo-images/android-logo-40-px.png" border="false" alt-text="Screenshot of Android logo."::: |
|:---:|:---:|:---:|:---:|
| iPhones | iPads | Android phones | Android tablets |

Copilot in Power BI mobile apps brings AI-powered insights directly to your mobile device, helping you make data-driven decisions on the go. Whether you're reviewing a specific report or exploring data across your organization, Copilot provides intelligent assistance through natural language interactions.

The Power BI mobile apps offer two distinct Copilot experiences, each designed for different scenarios:

## Copilot features in Power BI mobile apps

### In-report Copilot

The in-report Copilot provides context-aware assistance for the report you're currently viewing. Access it by tapping the Copilot icon in any open report header.

**Key capabilities:**
- Generate AI-powered summaries of report data
- Get insights about the current report's content
- Ask questions about the specific report you're viewing
- Receive responses based on the current state of filters and slicers

**Best for:** Quick insights and summaries when you're already viewing a specific report.

[Learn more about in-report Copilot →](mobile-apps-copilot.md)

### Standalone Copilot

The standalone Copilot offers a full-screen chat experience accessible from the app's home page. It can query any report, semantic model, or data agent in your organization without opening a specific item first.

**Key capabilities:**
- Ask questions about any accessible data in your organization
- Query reports, semantic models, and data agents from one place
- Get answers with both textual summaries and interactive visuals
- Use voice input to dictate questions (iPhone and iPad only)
- Share Copilot responses and visuals with colleagues

**Best for:** Exploring data across multiple sources or when you don't know which specific report to open.

[Learn more about standalone Copilot →](mobile-standalone-copilot.md)

## Choosing the right Copilot experience

| Scenario | Use this Copilot |
|----------|------------------|
| I'm viewing a report and want a quick summary | In-report Copilot |
| I want insights about the current report's data | In-report Copilot |
| I have a question but don't know which report to open | Standalone Copilot |
| I want to explore data across multiple reports or semantic models | Standalone Copilot |
| I want to use voice to ask questions (iOS only) | Standalone Copilot |
| I want to share AI-generated insights with colleagues | Standalone Copilot |

## Requirements

To use Copilot in Power BI mobile apps:

- **Admin enablement:** Your administrator must enable Copilot in Power BI. For standalone Copilot, the "Users can access a standalone, cross-item Power BI Copilot experience" tenant setting must also be enabled.
- **Data preparation:** Copilot works best when data has been prepared for AI by report and semantic model authors.
- **Geographic availability:** Your organization's home tenant must be in a [supported geographic region](/fabric/admin/region-availability#all-workloads).

For detailed requirements, see the [Overview of Copilot for Power BI](../../create-reports/copilot-introduction.md).

## Related content

- [In-report Copilot in Power BI mobile apps (preview)](mobile-apps-copilot.md)
- [Standalone Copilot in Power BI mobile apps (preview)](mobile-standalone-copilot.md)
- [Overview of Copilot for Power BI](../../create-reports/copilot-introduction.md)
- [Prepare your data for AI](../../create-reports/copilot-prepare-data-ai.md)
