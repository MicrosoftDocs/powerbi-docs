---
title: Prepare Your Data for AI - Settings
description: Prepare your data for AI in Power BI settings. Learn how to optimize your semantic model for Copilot and enhance AI-driven insights.
author: julcsc
ms.author: juliacawthra
ms.reviewer: 
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 10/22/2025
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
#customer intent: As a Power BI user, I want to understand how to prepare my data for AI to optimize the performance of Copilot, improve AI-driven insights, and enhance user interactions by leveraging AI settings.
---

# Prepare your data for AI: Settings

This article explains the Prepare Data for AI **Settings** page, which controls how Power BI Copilot interacts with your data, including indexing behavior and known limitations.

> [!NOTE]
> You can now *author* **Prep data for AI** features in both the Power BI service and Power BI Desktop. Users can *consume* these features everywhere that Copilot exists.

|Setting | Description | Default behavior | Editable |
|---|---|---|---|
|Copilot indexing | Indexes model metadata and column values so Copilot can answer data questions faster and more accurately | Enabled automatically after migrating to the new Copilot file format | Yes |

## Copilot indexing

Copilot indexing enables Copilot to answer data questions faster and more accurately by indexing model metadata and column values.

> [!NOTE]
> For Power BI Desktop, there's an additional Local Desktop Indexing setting. This allows Desktop to locally index external data sources (DirectQuery, Live connection) for Copilot. It can be edited per machine through the Prep Data for AI settings dialog.

:::image type="content" source="media/copilot-prep-data/copilot-prep-data-ai-settings.png" alt-text="Screenshot of the Prepare Data for AI settings page in Power BI Copilot.":::

## Considerations and limitations

- The Local Desktop Indexing setting applies only to DirectQuery and Live connection.

## Related content

- [Prep data for AI](copilot-prepare-data-ai.md)
- [AI data schemas](copilot-prepare-data-ai-data-schema.md)
- [Verified answers](copilot-prepare-data-ai-verified-answers.md)
- [Prep data for AI FAQ](copilot-prepare-data-ai-faq.yml)
