---
title: Learn how to analyze query processing for Direct Lake datasets
description: Describes how to analyze query processing for Direct Lake datasets.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 05/16/2023
LocalizationGroup: Admin
---
# Analyze query processing for Direct Lake datasets (PREVIEW)

> [!IMPORTANT]
> Direct Lake is currently in **PREVIEW**. This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

Power BI datasets in [*Direct Lake*](directlake-overview.md) mode read delta tables directly from OneLake — unless they have to fallback to *DirectQuery* mode. Typical fallback reasons include memory pressures that can prevent loading of columns required to process a DAX query, and certain features at the data source might not support Direct Lake mode, like SQL views in a Warehouse. In general, Direct Lake mode provides the best DAX query performance unless a fallback to DirectQuery mode is necessary. Because fallback to DirectQuery mode can impact DAX query performance, it's important to analyze query processing for a Direct Lake dataset to identify if and how often fallbacks occur.

## Analyze by using Performance analyzer

Performance analyzer can provide a quick and easy look into how a visual queries a data source, and how much time it takes to render a result.

1. Start Power BI Desktop. On the startup screen select **Get Data**.

1. In **Get Data** > **Power Platform**, select **Power BI datasets**, and then select **Connect**.

1. In the **Data hub** page, select the Direct Lake dataset you want to connect to, and then select **Connect**.

1. Place a card visual on the report canvas, select a data column to create a basic report, and then on the **View** menu, select **Performance analyzer**.

    :::image type="content" source="media/directlake-analyze-qp/viewing-performance-analyzer.png" alt-text="Viewing Performance analyzer":::

1. In the **Performance analyzer** pane, select **Start recording**.

    :::image type="content" source="media/directlake-analyze-qp/start-recording.png" alt-text="Select Start recording":::

1. In the **Performance analyzer** pane, select **Refresh visuals**, and then expand the Card visual. Note that the Card does not generate any DirectQuery processing. This indicates the dataset was able to process the visual’s DAX queries in Direct Lake mode.

    If the dataset falls back to DirectQuery mode to process the visual’s DAX query, you'll see a **Direct query** performance metric, as shown in the following image:

    :::image type="content" source="media/directlake-analyze-qp/fallback-based-on-view.png" alt-text="Fallback based on view":::

## See also

[Direct Lake](directlake-overview.md)