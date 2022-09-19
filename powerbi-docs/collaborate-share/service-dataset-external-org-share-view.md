---
title: Access shared datasets in Power BI as a guest user from an external organization (Preview)
description: How to access and build reports with datasets shared externally in your own tenant if you are a data consumer.
author: ajburnle
ms.author: ajburnle
manager: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 09/19/2022
LocalizationGroup: Administration
---

# Access shared datasets in Power BI as a guest user from an external organization (Preview) - consumer

External data consumers can view and access datasets in their own tenants that have been shared with in-place dataset sharing (preview) by a data provider. A data consumer is the a user who doesn't own the dataset, but needs to access it. This article provides guidance on how to access and build reports with datasets shared externally in your own tenant.

## Access shared datasets
Once enabled on provider side, consumers will be able to see the datasets in PBI desktop, in a tab called *External data*. Use the following instructions to access and build reports with a dataset that a data provider shared to your tenant:

> [!IMPORTANT]
> If External sharing is ever disabled by the provider, reports built on top of the external dataset will lose functionality within a few minutes and display an error message.

1. In your tenant on Power BI, go to the data hub.
 
1. Select **external data** to see a list of datasets shared externally with you.

1. Select the dataset you wish to access or build a report with. Once you select the dataset it becomes a *Composite model*. 

1. Once you've accessed the dataset, you can perform one of the following actions: 

    1. Save the dataset as PBIX 

    1. Publish it to Web Service 

    1. Combine this data with other available datasets 

    1. Build a report for this model 

## Publish reports made from shared datasets

1. After publishing a PBIX with external data reference, consumers can do the following: 

    1. Build further reports on top of the existing report

    1. Share any content built on top with others in their organization (

> [!Note]
> Please note that for others to have access to composite model or content built on top, they must also have access to the underlying external dataset.

## Next steps