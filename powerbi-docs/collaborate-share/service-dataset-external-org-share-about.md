---
title: Power BI in-place dataset sharing with guest users in external organizations(preview)
description: Learn about Power BI in-place dataset sharing which allows you to share datasets with external guest users in their own tenants.
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

# About Power BI in-place dataset (preview) sharing with guest users in external organizations

The B2B dataset sharing capability (preview) allows customers to share datasets with external users that external users can access in their organization's tenant. **In-place dataset sharing** means that data providers can allow authorized guest users to work with shared datasets in their own Power BI tenants.

With existing B2B capabilities, data providers have previously shared data with external partners by requiring them to be a guest user in their organization through Azure Active Directory Business-to-Business (Azure AD B2B). The guest user would then access content in the data provider's organization (tenant). With Power BI in-place dataset sharing, data providers can now share data from their Power BI tenants in-place to guest users' tenants. In-place dataset sharing allows consumers to have near real-time access to shared data, and to access that shared data from within their own tenant.  

With in-place sharing, data is never copied to the consumer tenant, however data consumers can search the shared datasets directly in the source data systems. When consumers access these datasets in their own tenant, they can build their own composite models and reports on top of the shared data. Since consumers can build their own models and reports, they won't need to manually transfer data between organizations. This capability becomes useful when you want to share data with external partners, subsidiaries, consulting organizations, and other business partners. 

This article provides a basic introduction to in-place dataset sharing in Power BI. For more information on existing Azure AD B2B in Power BI, see [Distribute Power BI content to external guest users with Azure AD B2](../enterprise/service-admin-azure-ad-b2b.md).

## Considerations and Limitations 

- If you use in-place dataset sharing, data might move to another region if the consumer and provider tenants are located in different regions. This is because data is cached on the consumer tenant to build composite models and reports on top of the shared data. Regardless, storage and computation for shared datasets remains within the provider tenant. This may potentially impact EU Data Boundary compliance.

- Existing limitations for Azure AD B2B in Power BI and B2B collaboration in Azure AD still apply to in-place dataset sharing.  

- Live connect mode isn't currently supported for in-place dataset sharing. Power BI will need to change queries in the DirectQuery mode, which consumes resources on shared capacity or a Premium capacity. For more information on DirectQuery versus LiveConnect, see [Data refresh in Power BI](../connect-data/refresh-data.md#datasets-in-directquery-mode).

- If **Private Links** and **Block Public Internet Access** are enabled for a Provider’s Power BI tenant, consumers won't see datasets shared by this provider in their own tenant. 

- Datasets hosted in My Workspace, V1 Workspace (classic), or Admin Monitoring workspaces aren't supported. Only V2 (new) workspaces are supported for in-place sharing.

- For Azure Analysis services (AAS), customers are expected to connect directly to the AAS instance. Live connection to AAS data sources isn't supported.

- This capability isn't supported for composite models, meaning, consumers can't build content for external datasets that are composite models.

- Only pro and premium users can share datasets externally. However, pro trial users won't be able to use this capability. In-place dataset sharing isn't available for free users.  

- All composite model limitations apply. For more information, see [Use composite models in Power BI Desktop](../transform-model/desktop-composite-models.md#considerations-and-limitations). 

- The size of the data model being shared externally and the complexity of the query affect premium capacity utilization. The source (data provider's) tenant is responsible for this cost.

- All DirectQuery limitations apply. For more information, see [Use DirectQuery in Power BI Desktop](../connect-data/desktop-use-directquery.md#considerations-and-limitations).

- In-place dataset sharing is not supported for cross-sovereign cloud scenarios. This means that users in a government cloud cannot share or receive shared datasets from a commercial cloud tenants. Read more on cross-cloud B2B limitations in [Cross-cloud B2B](../enterprise/service-admin-azure-ad-b2b.md#cross-cloud-b2b).

## Requirements

- You'll need to enable access for external guest users with Azure AD B2B. For more information, see the enable access section of [Distribute content to external guest users with Azure AD B2B](../enterprise/service-admin-azure-ad-b2b.md#enable-access).

- If the provider tenant is MFA enabled, the consumer tenant needs to also be MFA enabled to access the **External Data** tab in their Power BI desktop. Additionally, the provider tenant needs to turn on the **Trust multi-factor authentication from Azure AD tenants** option. Read [To change inbound trust settings for MFA and device claims](/azure/active-directory/external-identities/cross-tenant-access-settings-b2b-collaboration.md#to-change-inbound-trust-settings-for-mfa-and-device-claims) for more information.

- The following tenant settings across workspaces and existing B2B capabilities need to be enabled: 
    - [Control the use of datasets across workspaces](../connect-data/service-datasets-admin-across-workspaces.md)
    - [Allow Azure Active Directory guest users to access Power BI](../guidance/whitepaper-azure-b2b-power-bi.md) 
    - [Allow XMLA endpoints and analyze in Excel with on-premises datasets](../enterprise/service-premium-connect-tools.md)
    - [Allow live connections](../admin/service-admin-portal-export-sharing.md)

- For using in-place dataset sharing, Power BI admins will need to turn on the following settings in the admin portal: 
    - **Allow guest users to work with shared datasets in their own tenants**
    - **Allow specific users to turn on external data sharing** 

- Before sharing the dataset, make sure to enable the **dataset external sharing** option for the specified dataset. 

## Security

Storage and computation for datasets shared with external users remains within the provider tenant. Users with appropriate permissions in the consumer tenant get live access to this dataset. As such, the shared data respects Power BI permissions and data security such as row-level security (RLS), so your data remains secure. 

## Information for the Power BI administrator

If you're a Power BI administrator, see [Information for Power BI administrators](./service-dataset-external-org-share-admin.md) for details on how to enable dataset sharing to external organizations.

## Next Steps
- [Use Power BI in-place dataset sharing (preview) to share datasets with external users](service-dataset-external-org-share-provider.md)
- [Access shared datasets in Power BI as a guest user from an external organization (preview)](service-dataset-external-org-share-view.md)
