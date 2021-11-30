---
title: Azure Active Directory (Azure AD) SSO
description: Configure your gateway to enable single sign-on (SSO) to the data gateway to cloud data sources that rely on Azure Active Directory (Azure AD)-based authentication.
author: arthiriyer
ms.author: arthii
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 07/14/2021
LocalizationGroup: Gateways
---

# Azure Active Directory (Azure AD) SSO

Azure AD SSO enables single sign on on the data gateway to cloud data sources that rely on Azure Active Directory (Azure AD)-based authentication. When you configure Azure AD SSO on the on-premises data gateway for an applicable data source, queries execute under the Azure AD identity of the user that interacts with the Power BI report.

While Azure Virtual Networks (VNets) offer network isolation and security for your resources on the Microsoft cloud, you now require a secure way to connect to these data sources. On-premises data gateways help you achieve that. Additionally, Azure AD SSO as explained above allows users to see only data that they have access to.

>[!NOTE]
> VNet data gateways, which are available in public preview for Power BI Premium Datasets, eliminate the need to install an on-premises data gateway for connecting to your VNet data sources. To learn more about VNet gateways and their current limitations, see [What is a virtual network (VNet) data gateway (Preview)](/data-integration/vnet/overview).

For more information on SSO and list of data sources supported for Azure AD SSO, see [Overview of single sign-on (SSO) for on-premises data gateways in Power BI](service-gateway-sso-overview.md). 

## Query steps when running Azure AD SSO

![Screenshot of Azure AD SSO query steps.](media/service-gateway-azure-active-directory-sso/aad-sso-query-steps.png)

Since the Azure AD token of the user is passed via the gateway, it is possible for an admin of the gateway machine to obtain access to these tokens. To make sure a user with malicious intent isn't able to intercept these tokens, the following safeguard mechanisms are available:

* A tenant-level setting in the Power BI admin portal allows only Power BI service admins to enable this feature for a tenant. See [Azure AD Single Sign-On (SSO) for Gateway](../admin/service-admin-portal.md#azure-ad-single-sign-on-sso-for-gateway) for details.
* As a Power BI service admin, you can also control who can install gateways in your tenant. See [Preview: View and manage on-premises data gateways - Power Platform](/power-platform/admin/onpremises-data-gateway-management#manage-gateway-installers) for more information.

The Azure AD Single Sign-On feature is disabled by default for on-premises data gateways. As a Power BI admin, you must enable the Azure AD Single Sign-On (SSO) for Gateway tenant setting (shown below) in the Power BI admin portal before data sources can be enabled for Azure AD SSO on an on-premises data gateway.

## Next steps

* [Overview of single sign-on (SSO) for on-premises data gateways in Power BI](service-gateway-sso-overview.md)
