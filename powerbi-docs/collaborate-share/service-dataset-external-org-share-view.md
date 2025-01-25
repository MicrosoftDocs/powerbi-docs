---
title: Access shared semantic models in Power BI as a guest user from an external organization (preview)
description: How to access and build reports with semantic models shared externally in your own tenant if you are a data consumer.
author: kfollis
ms.author: kfollis
manager: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 06/05/2024
LocalizationGroup: Administration
---

# Access shared semantic models in Power BI as a guest user from an external organization (preview) - consumer

External data consumers can view and access semantic models in their own tenants that have been shared with them by a data provider via in-place semantic model sharing (preview). A data consumer is a user who doesn't own the semantic model, but needs to access it. This article provides guidance on how to access and build reports in your own tenant based on external semantic models in other tenants that have been shared with you.

## Enable the shared semantic models preview feature
Before you can access the semantic models shared in-place, you'll need to enable the feature in the *Preview features* option of your Power BI desktop:  

1. In your tenant, go to **Options & settings**.

1. Select **Options** and then **Preview features**. 

1. Select the checkbox next to the **DirectQuery for PBI semantic models and AS** option 

1. Select the checkbox next to the **Connect to external semantic models shared with me** option. 

## Access shared semantic models
Once enabled on provider side, consumers will be able to see the semantic models in the OneLake data hub in Power BI Desktop, on a tab called *External data*. Use the following instructions to access and build reports with a semantic model that a data provider shared to your tenant:

> [!IMPORTANT]
> If external sharing is ever disabled by the provider, reports built on top of the external semantic model will lose functionality within a few minutes and display an error message.

1. In your tenant, go to the OneLake data hub in Power BI Desktop.
 
1. Select **External data** to see a list of external semantic models that have been shared with you.

1. Select the semantic model you wish to access or build a report with. Once you select the semantic model it becomes a [*composite model*](../transform-model/desktop-composite-models.md). 

1. Once you've accessed the semantic model, you can perform one of the following actions: 

    - Save the semantic model as a *.pbix* file. 

    - Publish it to the Power BI service.

    - Combine its data with other available semantic models. 

    - Build a report based on this model.

## Publish reports made from shared semantic models

1. After publishing a *.pbix* file with external data reference, consumers can do the following: 

    - Build further reports on top of the existing report

    - Share any content built on top with others in their organization

> [!Note]
> For others to have access to a composite model or content built on top of an external semantic model, they must also have access to the underlying external data..

## Related content

- [Use composite models](../transform-model/desktop-composite-models.md#use-composite-models)