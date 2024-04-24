---
title: Manage DirectQuery connections to a published semantic model
description: Learn how to manage DirectQuery connections to a published semantic model in Power BI. Also, learn how to discourage DirectQuery connections from happening.
author: jeroenterheerdt
ms.author: jterh
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 02/01/2023
LocalizationGroup: Connect to data
---
# Manage DirectQuery connections to a published semantic model

By default, when you publish a semantic model to the Power BI service, you can make a DirectQuery connection to it, assuming you have proper permissions. You can use this connection to create new composite models on top of the semantic model.

In some situations, however, you need to discourage these connections from happening. Discouraging these connections is especially important in the composite models scenario, where you might want to prohibit creation of new composite models on top of the semantic model (so-called *chaining*). By discouraging DirectQuery connections to a semantic model, you're effectively ending the chain or stopping it from forming in the first place.

> [!NOTE]
> Power BI honors this setting and disables making DirectQuery connections to a semantic model, but third-party tools might not. Third-party tools might allow users to make DirectQuery connections to a semantic model even if you disabled it.

## Use Power BI Desktop to discourage DirectQuery connections to a semantic model

1. To discourage DirectQuery connections to a semantic model, go to **File > Options and settings > Options > Current File > Published semantic model settings**. 
2. On this page, choose the **Discourage DirectQuery connections** option, and select **OK**.


    :::image type="content" source="media/desktop-discourage-directquery-connections-to-dataset/desktop-discourage-directquery-connections-to-dataset.png" border="true" alt-text="Screenshot of the Discourage DirectQuery connections setting in Power BI Desktop Options menu.":::


## Use third-party tools to discourage DirectQuery connections to a semantic model
By using third-party tools, you can discourage DirectQuery connections to a semantic model by setting the `DiscourageCompositeModels` property on a model to `True`.

## Related content

- [Using DirectQuery in Power BI](desktop-directquery-about.md)
- [Semantic models in the Power BI service](service-dataset-modes-understand.md)
- [Use composite models in Power BI Desktop](../transform-model/desktop-composite-models.md)
- More questions? [Ask the Power BI Community](https://community.powerbi.com/)
