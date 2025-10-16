---
title: Export Query Results in Power BI Desktop
description: Export query results to an online destination using Power BI Desktop
author: mihirwagleMSFT
ms.author: mihirwagle
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: concept-article
ms.date: 10/16/2025
ms.custom: dFY26Q1-Linter
LocalizationGroup: Transform and shape data
ai-usage: ai-assisted
#customer intent: As a Power BI user, I want to export my query results to a destination of my choice.
---

# Export Query Results in Power BI Desktop

Power Query Editor in Power BI Desktop lets you connect to one or more data sources, shape and transform the data, and load it into your model. The **Export Query Results** feature helps you send this data to an online destination without manually exporting queries. This feature is in Preview and requires some setup.

---

## 1. Turn on the Preview Feature

To enable this feature:

1. Go to **File** > **Options and settings** > **Options**.
1. Under **GLOBAL** options, select **Preview Features**.
1. Check **Export Queries from Power Query**.

:::image type="content" source="media/export-query-results/preview-feature-export-query-enable.png" alt-text="Power BI Desktop Options menu with Export Queries enabled":::

---

## 1. Open Export Query Results

After enabling the preview:

1. Open **Power Query Editor** from the ribbon (**Transform**) or the query menu (**Edit Query**).
1. In the ribbon, select **Export Query Results**.

:::image type="content" source="media/export-query-results/export-query-results-power-query-ribbon.png" alt-text="Power Query editor ribbon with Export Query Results enabled":::

---

## 1. Check Fabric Access

To use this feature:

- You need access to **Microsoft Fabric**.
- Your **My Workspace** must be assigned to a Fabric or trial capacity.

If these conditions aren’t met, you’ll see an error message.

:::image type="content" source="media/export-query-results/export-query-results-fabric-not-enabled-on-my-workspace.png" alt-text="Export Query Results showing Fabric not enabled":::

**Options:**

1. Sign up for a [Fabric trial](/fabric/fundamentals/fabric-trial.md) and [assign your workspace](/fabric/fundamentals/fabric-trial#share-by-assigning-workspaces).
1. Assign **My Workspace** to a Fabric capacity in your organization.

If you can’t enable Fabric, contact your Fabric admin.

---

## 1. Select a Destination

Once your workspace is assigned to Fabric:

- Choose an online destination.
- Supported destinations match those in [Fabric Dataflows](/fabric/data-factory/dataflow-gen2-data-destinations-and-managed-settings.md).
- You can also pick existing OneLake destinations.

:::image type="content" source="media/export-query-results/export-query-results-select-destination.png" alt-text="Destination selection screen":::

---

## 1. Enter Credentials

After selecting a destination:

1. Enter your credentials.
1. Select **Connect**, then **Choose**.

:::image type="content" source="media/export-query-results/export-query-results-select-edit-connection.png" alt-text="Connection edit screen":::

---

## 1. Confirm and Export

You’ll see a summary screen:

- A Fabric Dataflow Gen2 is created in **My Workspace**.
- You can rename the dataflow but can’t change the workspace yet.
- Expand **Manage Connections** to check or fix query connections.

:::image type="content" source="media/export-query-results/edit-destination-settings-manage-connections-collapsed.png" alt-text="Connections collapsed":::
:::image type="content" source="media/export-query-results/edit-destination-settings-manage-connections-expanded.png" alt-text="Connections expanded":::

When ready, select **Export**.

- The next screen shows export progress.
- After completion, review your dataflow in Fabric.
- If errors occur, open the dataflow in Fabric and run it to debug.

:::image type="content" source="media/export-query-results/edit-destination-settings-export-query-results-success.png" alt-text="Export success screen":::

---

## 1. Troubleshooting

Not all errors appear in Power BI Desktop. Validate and fix issues in Fabric. Learn more about [running a Fabric Dataflow](fabric/data-factory/dataflows-gen2-overview.md).

---

## 1. Considerations and Limitations

1. You must sign in to Microsoft Fabric.
1. Dataflows are created in **My Workspace**, which needs Fabric or trial capacity. Future updates will allow workspace changes.

---

## 1. Related Content

Explore more Power BI Desktop features:

- [Query Overview Power BI Desktop](desktop-query-overview.md)
- [Data sources in Power BI Desktop](../connect-data/desktop-data-sources.md)
- [Connect to data sources in Power BI Desktop](../connect-data/desktop-connect-to-data.md)
- [Tutorial: Shape and combine data with Power BI Desktop](../connect-data/desktop-shape-and-combine-data.md)
- [Perform common query tasks in Power BI Desktop](desktop-common-query-tasks.md)
