---
title: "Copilot in Power BI Tutorial: Get Started"
description: Learn how to configure Power BI Desktop settings that are required for this end-to-end tutorial.
author: julcsc
ms.author: juliacawthra
ms.reviewer: alpowers
ms.topic: tutorial
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
ms.custom: azure-data-cat
ms.date: 05/26/2026
ms.update-cycle: 180-days
ai-usage: ai-assisted
---

# Copilot in Power BI tutorial: Get started

> [!NOTE]
> You can author **Prep data for AI** features in both Power BI Desktop and the Power BI service. Users can consume these features anywhere Copilot in Power BI is available.

Before you begin, complete the following prerequisites and download the sample Power BI Desktop file required for this end-to-end tutorial.

## Prerequisites

To use Copilot in Power BI Desktop, you need admin, member, or contributor access to at least one workspace that is assigned to a paid Fabric capacity (F2 or higher), Power BI Premium capacity (P1 or higher) that has Copilot enabled, or assigned to a Fabric Copilot capacity.

> [!IMPORTANT]
> This tutorial includes [preview](/fabric/fundamentals/preview) features.

> [!NOTE]
> The Copilot button in Desktop always appears in the ribbon. To use Copilot, you must be signed in and have access to a workspace that is in Premium or Fabric capacity, or assigned to a Fabric Copilot capacity.

When you use Copilot in Power BI Desktop for the first time, you're asked to pick a Copilot compatible workspace when you select the Copilot button in the ribbon. The workspace you select doesn't need to be the same as the workspace where you plan to publish your report. If you're assigned access to a Fabric Copilot capacity, you aren't asked to select a workspace.

Learn more by using [Copilot in Power BI Desktop the first time](copilot-power-bi-desktop.md) or [Fabric Copilot capacity](/fabric/enterprise/fabric-copilot-capacity).

### Settings

To confirm that Power BI Desktop enables the following preview features for this tutorial, select **File** > **Options and settings** > **Options** > **Preview features**. Then, ensure the boxes next to each of the listed preview features are checked if they're currently disabled.

- Prep data for AI

To ensure that the necessary settings are available for this tutorial in the Power BI service, request that a tenant administrator or capacity administrator verify the appropriate settings are enabled. A tenant admin  should select the **settings** (gear) icon at the top of portal and, in the side pane that appears, navigate to the **Admin portal** under the **Governance and insights** section. From there, they should select **Tenant settings** and carefully review the following list to confirm that each relevant feature is enabled.

- Users can use Copilot and other features powered by Azure OpenAI
- Users can access a standalone, cross-item Power BI Copilot experience (preview)

## Download the sample

The documents provided in this tutorial, including the .pbix file and related data, are offered "as-is." The examples are for illustration purposes only and are fictitious. No real association is intended or inferred. Microsoft makes no warranties, express or implied, with respect to the information provided herein.

By selecting any of the following links to download the .pbix files, you agree to the terms of use.

To download the sample file from the GitHub repo for Power BI Desktop, you can either:

- [Download the file automatically](https://github.com/microsoft/powerbi-desktop-samples/raw/refs/heads/main/Sample%20Reports/Revenue%20Opportunities.pbix)
- Visit the [Sample reports folder](https://github.com/microsoft/powerbi-desktop-samples/tree/main/Sample%20Reports), select the `Revenue Opportunities.pbix` file, and save it to your computer.

## Next step

> [!div class="nextstepaction"]
> [Prepare semantic model for AI](tutorial-copilot-power-bi-prepare-model.md)
