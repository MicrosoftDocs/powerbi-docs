---
title: Overview of single sign-on (SSO) for on-premises data gateways
description: Configure your gateway to enable single sign-on (SSO) from Power BI to on-premises data sources.
author: arthiriyer
ms.author: arthii
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 07/11/2021
LocalizationGroup: Gateways
---

# Active Directory (AD) SSO

The on-premises data gateway supports Active Directory (AD) SSO for connecting to your on-premises data sources that have Active Directory configured. AD SSO includes both [Kerberos](service-gateway-sso-kerberos.md) constrained delegation  and [Security Assertion Markup Language (SAML)](service-gateway-sso-saml.md). For more information on SSO and list of data sources supported for AD SSO, see [Overview of single sign-on (SSO) for on-premises data gateways in Power BI](service-gateway-sso-overview.md).

## Query steps when running SSO

A query that runs with SSO consists of three steps, as shown in the following diagram.

![SSO query steps](media/service-gateway-active-directory-sso/sso-query-steps.png)

Here are additional details about each step:

1. For each query, the Power BI service includes the *user principal name (UPN)*, which is the fully qualified username of the user currently signed in to the Power BI service, when it sends a query request to the configured gateway.

2. The gateway must map the Azure Active Directory UPN to a local Active Directory identity:

   a. If Azure AD DirSync (also known as *Azure AD Connect*) is configured, then the mapping works automatically in the gateway.

   b.  Otherwise, the gateway can look up and map the Azure AD UPN to a local AD user by performing a lookup against the local Active Directory domain.

3. The gateway service process impersonates the mapped local user, opens the connection to the underlying database, and then sends the query. You don't need to install the gateway on the same machine as the database.

## Next steps

Now that you understand the basics of enabling SSO through the gateway, read more detailed information about Kerberos and SAML:

* [Single sign-on (SSO) - Kerberos](service-gateway-sso-kerberos.md)
* [Single sign-on (SSO) - SAML](service-gateway-sso-saml.md
