---
title: Using DirectQuery with dataflows
description: Learn how to connect Power BI Desktop to the semantic models in your Power BI dataflows by using DirectQuery.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: how-to
ms.date: 11/10/2023
LocalizationGroup: Data from files
---
# Use DirectQuery with dataflows

Using DirectQuery with Power BI dataflows lets you connect directly to a dataflow without the need to import the data into a semantic model. There are many reasons why using DirectQuery with dataflows, rather than importing data, is useful and helpful. The following are a few examples:

* Working with large dataflows
* Decreasing orchestration needs for dataflows
* Serving data to customers in a managed and performance-minded way
* Preventing the need to duplicate data in a dataflow and an imported semantic model

## Configurations

To use DirectQuery with dataflows, you must explicitly toggle the **enhanced compute engine** to **On** in dataflow settings. You must then refresh the dataflow before it can be consumed in DirectQuery mode.

1. Navigate to the Premium dataflow, and set **enhanced compute engine** to **On**.
2. Refresh the dataflow.

After you complete the steps, the dataflow is accessible in Power BI Desktop with DirectQuery mode.

## Consumption

When DirectQuery is available for a dataflow, connecting to a dataflow by using the **Dataflows** connector prompts you to choose whether to connect to tables through DirectQuery or Import.

Dataflow entities that support DirectQuery display the **View** icon in Power BI Desktop, rather than the **Table** icon. The View icon appears as two boxes overlaid on each other, the Table icon is a single table with a grid.

The following image shows the **View** icon, indicating that the *Orders* table supports DirectQuery:

:::image type="content" source="media/dataflows-directquery/dataflows-directquery-supported.png" alt-text="Screenshot of the View icon showing that direct query is supported.":::

This image shows the **Table** icon, indicating that the *Query* table only supports import:

:::image type="content" source="media/dataflows-directquery/dataflows-directquery-not-supported.png" alt-text="Screenshot of the Table icon showing that direct query isn't supported.":::

In DirectQuery mode, you can quickly interrogate large-scale semantic models locally. However, you can't currently perform any other transformations.

## Related content

This article provided an overview of using DirectQuery with dataflows. The following articles might also be useful:

* [DirectQuery in Power BI](../../connect-data/desktop-directquery-about.md)
* [DirectQuery model guidance in Power BI Desktop](../../guidance/directquery-model-guidance.md)

The following articles provide more information about dataflows and Power BI:

* [Introduction to dataflows and self-service data prep](dataflows-introduction-self-service.md)
* [Creating a dataflow](dataflows-create.md)
* [Configure and consume a dataflow](dataflows-configure-consume.md)
* [Configuring Dataflow storage to use Azure Data Lake Gen 2](dataflows-azure-data-lake-storage-integration.md)
* [Premium features of dataflows](dataflows-premium-features.md)
* [Dataflows considerations and limitations](dataflows-features-limitations.md)
* [Dataflows best practices](dataflows-best-practices.md)
