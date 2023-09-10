---
title: Access shared datasets in Power BI as a guest user from an external organization (preview)
description: How to access and build reports with datasets shared externally in your own tenant if you are a data consumer.
author: ajburnle
ms.author: ajburnle
manager: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 02/20/2023
LocalizationGroup: Administration
---

# Access shared datasets in Power BI as a guest user from an external organization (preview) - consumer

External data consumers can view and access datasets in their own tenants that have been shared with them by a data provider via in-place dataset sharing (preview). A data consumer is a user who doesn't own the dataset, but needs to access it. This article provides guidance on how to access and build reports in your own tenant based on external datasets in other tenants that have been shared with you.

## Enable the shared datasets preview feature
Before you can access the datasets shared in-place, you'll need to enable the feature in the *Preview features* option of your Power BI desktop:  

1. In your tenant, go to **Options & settings**.

1. Select **Options** and then **Preview features**. 

1. Select the checkbox next to the **DirectQuery for PBI datasets and AS** option 

1. Select the checkbox next to the **Connect to external datasets shared with me** option. 

## Access shared datasets
Once enabled on provider side, consumers will be able to see the datasets in the data hub in Power BI Desktop, on a tab called *External data*. Use the following instructions to access and build reports with a dataset that a data provider shared to your tenant:

> [!IMPORTANT]
> If external sharing is ever disabled by the provider, reports built on top of the external dataset will lose functionality within a few minutes and display an error message.

1. In your tenant, go to the data hub in Power BI service.
 
1. Select **External data** to see a list of external datasets that have been shared with you.

1. Select the dataset you wish to access or build a report with. Once you select the dataset it becomes a [*composite model*](../transform-model/desktop-composite-models.md). 

1. Once you've accessed the dataset, you can perform one of the following actions: 

    - Save the dataset as a *.pbix* file. 

    - Publish it to the Power BI service.

    - Combine its data with other available datasets. 

    - Build a report based on this model.

## Publish reports made from shared datasets

1. After publishing a *.pbix* file with external data reference, consumers can do the following: 

    - Build further reports on top of the existing report

    - Share any content built on top with others in their organization

> [!Note]
> For others to have access to a composite model or content built on top of an external dataset, they must also have access to the underlying external data..

## Next steps
- [Use composite models](../transform-model/desktop-composite-models.md#use-composite-models)