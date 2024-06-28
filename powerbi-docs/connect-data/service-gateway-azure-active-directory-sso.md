---
title: Microsoft Entra SSO
description: Learn how you can enable single sign-on to access cloud data sources that rely on Microsoft Entra ID from the Power BI Admin portal.
author: miquelladeboer
ms.author: mideboer
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 06/27/2024
LocalizationGroup: Gateways
---

# Microsoft Entra SSO

You can use Microsoft Entra single sign-on (SSO) to authenticate to the data gateway and access cloud data sources that rely on Microsoft Entra ID based authentication. When you configure Microsoft Entra SSO on the on-premises data gateway for an applicable data source, queries run under the Microsoft Entra identity of the user that interacts with the Power BI report.

Azure Virtual Networks (VNets) offer network isolation and security for your resources on the Microsoft cloud. On-premises data gateways help you achieve a secure way to connect to these data sources. Microsoft Entra SSO allows users to see only data that they have access to.

>[!NOTE]
> VNet data gateways, which are available in public preview for Power BI Premium Semantic models, eliminate the need to install an on-premises data gateway for connecting to your VNet data sources. To learn more about VNet gateways and their current limitations, see [What is a virtual network (VNet) data gateway](/data-integration/vnet/overview).

The data sources listed here aren't supported with Microsoft Entra SSO using an on-premises data gateway behind an Azure VNet:

* Analysis Services
* ADLS Gen1
* ADLS Gen2
* Azure Blobs
* CDPA
* Exchange
* OData
* SharePoint
* SQL Server
* Web
* AzureDevOpsServer
* CDSTOData
* Cognite
* CommonDataService
* Databricks
* EQuIS
* Kusto (when using the newer “DataExplorer” function)
* VSTS
* Workplace Analytics

For more information on SSO, and a list of supported data sources for Microsoft Entra SSO, see [Overview of single sign-on for on-premises data gateways in Power BI](service-gateway-sso-overview.md).

<a name='query-steps-when-running-azure-ad-sso'></a>

## Query steps when running Microsoft Entra SSO

![Diagram that shows the path that a Microsoft Entra token takes to establish a connection to the data source.](media/service-gateway-azure-active-directory-sso/aad-sso-query-steps.png)

<a name='enable-azure-ad-sso-for-gateway'></a>

## Enable Microsoft Entra SSO for Gateway

Because the Microsoft Entra token of the user is passed via the gateway, it's possible for an admin of the gateway computer to obtain access to these tokens. To make sure a user with malicious intent isn't able to intercept these tokens, the following safeguard mechanisms are available:

* Only Fabric administrators can enable Microsoft Entra SSO for a tenant by enabling the setting in the Microsoft Fabric admin portal. For more information, see [Microsoft Entra single sign-on for gateways](/fabric/admin/service-admin-portal-integration#azure-ad-single-sign-on-sso-for-gateway).
* As a Fabric administrator, you can also control who can install gateways in your tenant. For more information, see [Manage gateway installers](/power-platform/admin/onpremises-data-gateway-management#manage-gateway-installers).

The Microsoft Entra SSO feature is disabled by default for on-premises data gateways. As a Fabric administrator, you have to enable the **Microsoft Entra Single Sign-On (SSO) for Gateway** tenant setting in the Admin portal before data sources can use Microsoft Entra SSO on an on-premises data gateway.

:::image type="content" source="media/service-gateway-azure-active-directory-sso/powerbi-admin-portal-entra-sso-for-gateway-setting.png" alt-text="Screenshot of the Microsoft Entra SSO for gateway feature in the Power BI Admin portal.":::

## Related content

* [Overview of single sign-on for on-premises data gateways in Power BI](service-gateway-sso-overview.md)
