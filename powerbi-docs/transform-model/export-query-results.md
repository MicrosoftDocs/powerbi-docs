---
title: Export Query Results in Power BI Desktop
description: Export query results to an online destination using Power BI Desktop
author: mihirwagleMSFT
ms.author: mihirwagle
ms.reviewer: kgremban
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: concept-article
ms.date: 10/01/2025
ms.custom: dFY26Q1-Linter
LocalizationGroup: Transform and shape data
ai-usage: ai-assisted
#customer intent: As a Power BI user, I want to export my query results to a destination of my choice.
---

# Export query results in Power BI Desktop

Power Query Editor in Power BI Desktop lets you connect to one or more data sources, shape and transform the data, and load it into your model. The **Export query results** feature helps you send this data to an online destination without manually exporting queries. This feature is in Preview and requires some setup.

## Turn on the preview feature

To enable this feature:

1. Go to **File** > **Options and settings** > **Options**.
1. Under **GLOBAL** options, select **Preview Features**.
1. Check **Export Queries from Power Query**.

:::image type="content" source="media/export-query-results/preview-feature-export-query-enable.png" alt-text="Power BI Desktop Options menu with Export Queries enabled":::

## Open the *Export query results* feature

After enabling the preview:

1. Open **Power Query Editor** from the ribbon (**Transform**) or the query menu (**Edit Query**).
1. In the ribbon, select **Export Query Results**.

:::image type="content" source="media/export-query-results/export-query-results-power-query-ribbon.png" alt-text="Power Query editor ribbon with Export Query Results enabled":::

## Check Fabric access

To use this feature:

- You need access to **Microsoft Fabric**.
- Your **My Workspace** must be assigned to a Fabric or trial capacity.

If these conditions aren’t met, you’ll see an error message.

:::image type="content" source="media/export-query-results/export-query-results-fabric-not-enabled-on-my-workspace.png" alt-text="Export Query Results showing Fabric not enabled":::

**Options:**

- Sign up for a [Fabric trial](/fabric/fundamentals/fabric-trial) and [assign your workspace](/fabric/fundamentals/fabric-trial#share-by-assigning-workspaces).
- Assign **My Workspace** to a Fabric capacity in your organization.

If you can’t enable Fabric, contact your Fabric admin.

## Select a destination

Once your workspace is assigned to Fabric, choose an online destination:

- Supported destinations match those in [Fabric Dataflows](/fabric/data-factory/dataflow-gen2-data-destinations-and-managed-settings).
- You can also pick existing OneLake destinations.

:::image type="content" source="media/export-query-results/export-query-results-select-destination.png" alt-text="Destination selection screen":::

## Enter credentials

After selecting a destination:

1. Enter your credentials.
1. Select **Connect**, then **Choose**.

:::image type="content" source="media/export-query-results/export-query-results-select-edit-connection.png" alt-text="Connection edit screen":::

## Confirm and export

You see a summary screen:

- A Fabric Dataflow Gen2 is created in **My Workspace**.
- You can rename the dataflow but can’t change the workspace yet.
- Expand **Manage Connections** to check or fix query connections.

   :::image type="content" source="media/export-query-results/edit-destination-settings-manage-connections-collapsed.png" alt-text="Connections collapsed":::

   :::image type="content" source="media/export-query-results/edit-destination-settings-manage-connections-expanded.png" alt-text="Connections expanded":::

   When ready, select **Export**.

- The next screen shows export progress.

   :::image type="content" source="media/export-query-results/export-query-results-in-progress.png" alt-text="Export in progress screen":::

- After completion, review your dataflow in Fabric.
- If errors occur, open the dataflow in Fabric and run it to debug.

   :::image type="content" source="media/export-query-results/export-query-results-success.png" alt-text="Export success screen":::

## Troubleshooting

Not all errors appear in Power BI Desktop. Validate and fix issues in Fabric. Learn more about [running a Fabric Dataflow](/fabric/data-factory/dataflows-gen2-overview).

## Considerations and limitations

- You must sign in to Microsoft Fabric.
- Dataflows are created in **My Workspace**, which needs Fabric or trial capacity. Future updates will allow workspace changes.

## Related Content

Explore more Power BI Desktop features:

- [Query Overview Power BI Desktop](desktop-query-overview.md)
- [Data sources in Power BI Desktop](../connect-data/desktop-data-sources.md)
- [Connect to data sources in Power BI Desktop](../connect-data/desktop-connect-to-data.md)
- [Tutorial: Shape and combine data with Power BI Desktop](../connect-data/desktop-shape-and-combine-data.md)
- [Perform common query tasks in Power BI Desktop](desktop-common-query-tasks.md)
