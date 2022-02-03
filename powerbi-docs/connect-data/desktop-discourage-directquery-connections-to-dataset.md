---
title: Manage DirectQuery connections to a published dataset
description: How to manage DirectQuery connections to a published dataset in Power BI
author: jeroenterheerdt
ms.author: jterh
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 06/24/2021
LocalizationGroup: Connect to data
---
# Manage DirectQuery connections to a published dataset

By default, when a dataset is published to the Power BI service, a DirectQuery connection can be made to it, assuming proper permissions. This connection can be used to create new composite models on top of the dataset.

In some situations, however, you need to discourage these connections from happening. This is especially important in the composite models scenario, where you might want to prohibit creation of new composite models on top of the dataset (so-called *chaining*). By discouraging DirectQuery connections to a dataset, you are effectively ending the chain or stopping it from forming in the first place.

> [!NOTE]
> Power BI will honor this setting and disable making DirectQuery connections to a dataset, but third-party tools might not and still allow users to make DirectQuery connections to a dataset even if you disabled it.

## Discourage DirectQuery connections to a dataset using Power BI Desktop

1. To discourage DirectQuery connections to a dataset go to **File > Options and settings > Options > Current File > Published dataset settings**. 
2. On this page, check the **Discourage DirectQuery connections to this dataset** box, and select **OK**.

    ![Screenshot of discourage DirectQuery connections to this dataset setting in Power BI Desktop Options menu.](media/desktop-discourage-directquery-connections-to-dataset/desktop-discourage-directquery-connections-to-dataset.png)

## Discourage DirectQuery connections to a dataset using third-party tools
Using third-party tools, you can discourage DirectQuery connections to a dataset by setting the `DiscourageCompositeModels` property on a model to `True`.

## Next steps
- [Using DirectQuery in Power BI](desktop-directquery-about.md)
- [Datasets in the Power BI service](service-dataset-modes-understand.md)
- [Use composite models in Power BI Desktop](../transform-model/desktop-composite-models.md)
- More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
