---
title: Use Power BI in-place dataset sharing (preview) to share datasets with external users - data provider
description: As a data provider, enable and share Power BI datasets with external guest users.
author: ajburnle
ms.author: ajburnle
manager: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 09/21/2022
LocalizationGroup: Administration
---

# Use Power BI in-place dataset sharing (preview) to share datasets with external users - data provider

Data providers can use in-place dataset sharing (preview) to share datasets with external users that they can access in their organization's tenant. A data provider is the source data owner who intends to share a dataset externally with a data consumer (external user). This article provides guidance on how to enable external sharing and share datasets.

> [!NOTE]
> Before a data provider can share, there are two new tenant settings that must be enabled for the specified data provider by their Power BI admins. For more information about these settings, see [Information for Power BI administrators](./service-dataset-external-org-share-admin.md).

## Enable external sharing 

 Before sharing the dataset, the provider must first enable external sharing. The following instructions are for the provider who wants to share the data: 

1. Select the dataset you intend to share with external guest user.

1. To access dataset settings, go to **File** and click **Settings**. 

1. Scroll to the bottom of the page and click on the dropdown for **External sharing**. 

1. Turn on the external sharing switch and click **Apply**. This will allow external users (who have at least “build” access to this dataset) to discover, connect to, and work with this dataset within their own Power BI tenant”.

     ![Screenshot of the dataset settings with the external sharing settings set to apply.](media/service-dataset-external-org-share-provider/external-sharing-dataset.png)

> [!NOTE] 
> If **Allow specific users to turn on external data sharing** is disabled by the Power BI admin for the specific user/user groups, they won't be able to turn on this dataset property.  

## Share the Dataset 

1. Open the dataset that you want to share with external users 

1. Share the dataset with an external user. 

    > [!NOTE] 
    > Only registered guest users in your Azure AD tenant can access the shared dataset. Registered guest users will be tagged as **EXT** in their domain name to show they're an external guest.

1. External users need to have at least “Build” access to the dataset to access datasets in their own tenant. So, select the **Allow recipients to build content with the data associated with this dataset** checkbox. 

    > [!NOTE] 
    > The **Allow recipients to modify this dataset** option is not supported for B2B external sharing. So, guests won't be able to modify the source dataset. This means that even if this option is checked, external guests can't change the dataset. 

1. Click **Grant access**. 

    ![Screenshot of the dataset how to grant access to a dataset.](media/service-dataset-external-org-share-provider/share-dataset.png)

## Next steps
- [Access shared datasets in Power BI as a guest user from an external organization (preview)](service-dataset-external-org-share-view.md)