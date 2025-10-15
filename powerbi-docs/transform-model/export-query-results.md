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

Power Query Editor in Power BI Desktop allows you to connect to to one or many data sources, shape, and transform the data to meet your needs, then load that model into Power BI Desktop. You can export this data to an online destination of your choice, allowing you to perform further analyses without manually exporting it out.
This feature is in Preview and has pre-requisites to be able to use it correctly.

## Enable Preview Settings

To enable the feature from Power BI Desktop, click on the File menu and select Options and settings. Under "Options", select Preview Features from the GLOBAL options. Enable the checkbox on "Export Queries from Power Query".

:::image type="content" source="media/export-query-results/preview-feature-export-query-enable.png" alt-text="Screenshot of Power BI Desktop Options Menu with Export Queries enabled":::

### Export Query Results

### Select Destination

### Enter Credentials

### Export Query Results

### Potential Issues

## Considerations and Limitations

1. You need to be signed into Microsoft Fabric to use this feature
2. The underlying dataflow is created in "My Workspace" which needs to be assigned to a Fabric / Trial Capacity. Future releases will support changing the workspace.
3. 

## Related content

There are all sorts of things you can do with Power BI Desktop. For more information on its capabilities, check out the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Data sources in Power BI Desktop](../connect-data/desktop-data-sources.md)
* [Connect to data sources in Power BI Desktop](../connect-data/desktop-connect-to-data.md)
* [Tutorial: Shape and combine data with Power BI Desktop](../connect-data/desktop-shape-and-combine-data.md)
* [Perform common query tasks in Power BI Desktop](desktop-common-query-tasks.md)
