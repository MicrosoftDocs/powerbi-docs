---
title: Export Query Results in Power BI Desktop
description: Export Query Results to an online destination using Power BI Desktop
author: mihirwagleMSFT
ms.author: mihirwagle
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: concept-article
ms.date: 10/04/2025
ms.custom: dFY26Q1-Linter
LocalizationGroup: Transform and shape data
#customer intent: As a Power BI user I want to export my query results to a destination of my choice.
---
# Export Query Results in Power BI Desktop

Power Query Editor in Power BI Desktop allows you to connect to to one or many data sources, shape, and transform the data to meet your needs, then load that model into Power BI Desktop. Export Query Results is a feature within Power Query Editor that allows you to export this data to an online destination of your choice without having to manually export out queries. This feature is in Preview and has pre-requisites to be able to use it correctly.



## Enable Preview Settings

To enable the feature in Power BI Desktop, under the File menu, select Options and settings. Within "Options", select Preview Features from the GLOBAL options. Enable the checkbox on "Export Queries from Power Query" if it is not enabled already.

:::image type="content" source="media/export-query-results/preview-feature-export-query-enable.png" alt-text="Screenshot of Power BI Desktop Options Menu with Export Queries enabled":::

### Export Query Results

Once the preview feature is enabled, navigate to the Query editor using either "Transform" from the ribbon or "Edit Query" from the query contextual menu. In the Power Query editor, you will see Export Query Results in the ribbon. Click on the icon.

:::image type="content" source="media/export-query-results/export-query-results-power-query-ribbon.png" alt-text="Screenshot of Power BI Desktop Power Query editor ribbon with Export Query Results enabled":::

### Check for Fabric enablement

For this feature to work, you need to have access to Fabric and your "My Workspace" needs to be attached to a Fabric or trial capacity. If both of these conditions are not met, you will see an informational window with an error message.

:::image type="content" source="media/export-query-results/export-query-results-fabric-not-enabled-on-my-workspace.png" alt-text="Screenshot of Export Query Results showing when Fabric is not enabled on my workspace":::

You have two options - (1) Sign up for a [Fabric trial](/fabric/fundamentals/fabric-trial.md) and then [assign](/fabric/fundamentals/fabric-trial#share-by-assigning-workspaces) your "My Workspace" to the trial capacity (2) Assign "My Workspace" to a Fabric capacity in your organization. If you are blocked from using Fabric, you will not be able to use this feature and you will need to reach out to your organization's Fabric administrator.

### Select Destination
Once your "My Workspace" is assigned to Fabric, you will be able to proceed to this screen where you can select an online destination of your choice. All destinations that are supported within [Fabric Dataflows](/fabric/data-factory/dataflow-gen2-data-destinations-and-managed-settings.md) are enabled here. You can also review existing OneLake destinations you already have access to.

:::image type="content" source="media/export-query-results/export-query-results-select-destination.png" alt-text="Screenshot of Export Query Results showing destination selection":::

### Enter Credentials

Once you select a destination, you will need to enter in your credentials, select "Connect" and then select "Choose" to proceed.

:::image type="content" source="media/export-query-results/export-query-results-select-edit-connection.png" alt-text="Screenshot of Export Query Results showing connection edits":::

## Export Query Results
After choosing your destination, you will see this screen that confirms your selections. A Fabric Dataflow Gen2 wil be created for you in "My Workspace". Currently you are unable to choose your workspace but you can rename the Dataflow.

You will be also able to confirm all the query connections. Initially this section wil be collapsed.

:::image type="content" source="media/export-query-results/edit-destination-settings-manage-connections-collapsed.png" alt-text="Screenshot of Export Query Results showing connections collapsed":::

You can expand this section and confirm that all your query connections are valid and fix them if needed.

:::image type="content" source="media/export-query-results/edit-destination-settings-manage-connections-expanded.png" alt-text="Screenshot of Export Query Results showing connections expanded":::

Once you are satisfied with your selections, click on "Export". 

The next screen shows the progress for your export and the output destination.

:::image type="content" source="media/export-query-results/edit-destination-settings-export-query-results-in-progress.png" alt-text="Screenshot of Export Query Results showing the progress screen":::

Once the export is finished, you can go to your dataflow in Fabric and confirm the results. If there is any error, you will see it inline and will need to open the dataflow and run it within Fabric to debug.

:::image type="content" source="media/export-query-results/edit-destination-settings-export-query-results-success.png" alt-text="Screenshot of Export Query Results showing the success screen":::

### Potential Issues
Not all error mesages will be visible in Power BI Desktop. Opening the Dataflow in Fabric and performing a validation is the best option. Learn more about running a Fabric Dataflow [here](fabric/data-factory/dataflows-gen2-overview.md).

## Considerations and Limitations

1. You need to be signed into Microsoft Fabric to use this feature.
2. The underlying dataflow is created in "My Workspace" which needs to be assigned to a Fabric / Trial Capacity. Future releases will support changing the workspace.

## Related content

There are all sorts of things you can do with Power BI Desktop. For more information on its capabilities, check out the following resources:

* [Query Overview Power BI Desktop](desktop-query-overview.md)
* [Data sources in Power BI Desktop](../connect-data/desktop-data-sources.md)
* [Connect to data sources in Power BI Desktop](../connect-data/desktop-connect-to-data.md)
* [Tutorial: Shape and combine data with Power BI Desktop](../connect-data/desktop-shape-and-combine-data.md)
* [Perform common query tasks in Power BI Desktop](desktop-common-query-tasks.md)
