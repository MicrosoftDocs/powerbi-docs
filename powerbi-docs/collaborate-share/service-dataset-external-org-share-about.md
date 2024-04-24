---
title: Power BI in-place semantic model sharing with guest users in external organizations (preview)
description: Learn about Power BI in-place semantic model sharing which allows you to share semantic models with external guest users in their own tenants.
author: paulinbar
ms.author: painbar
manager: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 12/12/2022
LocalizationGroup: Administration
---

# About Power BI in-place semantic model (preview) sharing with guest users in external organizations

The B2B semantic model sharing capability (preview) allows customers to share semantic models with external users that external users can access in their organization's tenant. **In-place semantic model sharing** means that data providers can allow authorized guest users to work with shared semantic models in their own Power BI tenants.

With existing B2B capabilities, data providers have previously shared data with external partners by requiring them to be a guest user in their organization through Microsoft Entra Business-to-Business (Microsoft Entra B2B). The guest user would then access content in the data provider's organization (tenant). With Power BI in-place semantic model sharing, data providers can now share data from their Power BI tenants in-place to guest users' tenants. In-place semantic model sharing allows consumers to have near real-time access to shared data, and to access that shared data from within their own tenant.  

With in-place sharing, data is never copied to the consumer tenant, however data consumers can search the shared semantic models directly in the source data systems. When consumers access these semantic models in their own tenant, they can build their own composite models and reports on top of the shared data. Since consumers can build their own models and reports, they won't need to manually transfer data between organizations. This capability becomes useful when you want to share data with external partners, subsidiaries, consulting organizations, and other business partners. 

This article provides a basic introduction to in-place semantic model sharing in Power BI. For more information on existing Microsoft Entra B2B in Power BI, see [Distribute Power BI content to external guest users with Microsoft Entra B2](../enterprise/service-admin-azure-ad-b2b.md).

## Considerations and Limitations 

- If you use in-place semantic model sharing, data might move to another region if the consumer and provider tenants are located in different regions. This is because data is cached on the consumer tenant to build composite models and reports on top of the shared data. Regardless, storage and computation for shared semantic models remains within the provider tenant. This may potentially impact EU Data Boundary compliance.

- Existing limitations for Microsoft Entra B2B in Power BI and B2B collaboration in Microsoft Entra ID still apply to in-place semantic model sharing.  

- Live connect mode isn't currently supported for in-place semantic model sharing. Power BI will need to change queries in the DirectQuery mode, which consumes resources on shared capacity or a Premium capacity. For more information on DirectQuery versus LiveConnect, see [Data refresh in Power BI](../connect-data/refresh-data.md#semantic-models-in-directquery-mode).

- If **Private Links** and **Block Public Internet Access** are enabled for a Provider’s Power BI tenant, consumers won't see semantic models shared by this provider in their own tenant. 

- Semantic models hosted in My Workspace, V1 Workspace (classic), or Admin Monitoring workspaces aren't supported. Only V2 (new) workspaces are supported for in-place sharing.

- For Azure Analysis services (AAS), customers are expected to connect directly to the AAS instance. Live connection to AAS data sources isn't supported.

- This capability isn't supported for composite models, meaning, consumers can't build content for external semantic models that are composite models.

- Only pro and premium users can share semantic models externally. However, pro trial users won't be able to use this capability. In-place semantic model sharing isn't available for free users.  

- All composite model limitations apply. For more information, see [Use composite models in Power BI Desktop](../transform-model/desktop-composite-models.md#considerations-and-limitations). 

- The size of the data model being shared externally and the complexity of the query affect premium capacity utilization. The source (data provider's) tenant is responsible for this cost.

- All DirectQuery limitations apply. For more information, see [Use DirectQuery in Power BI Desktop](../connect-data/desktop-use-directquery.md#considerations-and-limitations).

- In-place semantic model sharing is not supported for cross-sovereign cloud scenarios. This means that users in a government cloud cannot share or receive shared semantic models from a commercial cloud tenants. Read more on cross-cloud B2B limitations in [Cross-cloud B2B](../enterprise/service-admin-azure-ad-b2b.md#cross-cloud-b2b).

- A report that was created by a user in the host tenant, using a semantic model in the same host tenant will result in failure if opened in Power BI Desktop by a guest user. Only reports created using the 'external data' tab in Power BI Desktop can be re-opened in Power BI Desktop by the guest user.

## Requirements

- You'll need to enable access for external guest users with Microsoft Entra B2B. For more information, see the enable access section of [Distribute content to external guest users with Microsoft Entra B2B](../enterprise/service-admin-azure-ad-b2b.md#enable-invite-external-users-to-your-organization-setting).

- If the provider tenant is MFA enabled, the consumer tenant needs to also be MFA enabled to access the **External Data** tab in their Power BI desktop. Additionally, the provider tenant needs to turn on the **Trust multi-factor authentication from Microsoft Entra tenants** option. Read [To change inbound trust settings for MFA and device claims](/azure/active-directory/external-identities/cross-tenant-access-settings-b2b-collaboration#to-change-inbound-trust-settings-for-mfa-and-device-claims) for more information.

- The following tenant settings across workspaces and existing B2B capabilities need to be enabled: 
    - [Control the use of semantic models across workspaces](../connect-data/service-datasets-admin-across-workspaces.md)
    - [Allow Microsoft Entra guest users to access Power BI](../guidance/whitepaper-azure-b2b-power-bi.md) 
    - [Allow XMLA endpoints and analyze in Excel with on-premises datasets](../enterprise/service-premium-connect-tools.md)
    - [Allow live connections](/fabric/admin/service-admin-portal-export-sharing)

- For using in-place semantic model sharing, Power BI admins will need to turn on the following settings in the admin portal: 
    - **Allow guest users to work with shared semantic models in their own tenants**
    - **Allow specific users to turn on external data sharing** 

- Before sharing the semantic model, make sure to enable the **semantic model external sharing** option for the specified semantic model. 

## Security

Storage and computation for semantic models shared with external users remains within the provider tenant. Users with appropriate permissions in the consumer tenant get live access to this semantic model. As such, the shared data respects Power BI permissions and data security such as row-level security (RLS), so your data remains secure. 

## Information for the Power BI administrator

If you're a Power BI administrator, see [Information for Power BI administrators](./service-dataset-external-org-share-admin.md) for details on how to enable semantic model sharing to external organizations.

## Related content

- [Use Power BI in-place semantic model sharing (preview) to share semantic models with external users](service-dataset-external-org-share-provider.md)
- [Access shared semantic models in Power BI as a guest user from an external organization (preview)](service-dataset-external-org-share-view.md)
