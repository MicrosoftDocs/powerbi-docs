---
title: Overview of single sign-on (SSO) for gateways in Power BI
description: Configure your gateway to enable single sign-on (SSO) from Power BI to on-premises data sources.
author: arthiriyer
ms.author: arthii
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 03/10/2021
LocalizationGroup: Gateways
---

# Overview of single sign-on (SSO) for gateways in Power BI

You can get seamless single sign-on connectivity, enabling Power BI reports and dashboards to update in real time from on-premises data, by configuring your on-premises data gateway. You have the option of configuring your gateway with either [Kerberos](service-gateway-sso-kerberos.md) constrained delegation or Security Assertion Markup Language ([SAML](service-gateway-sso-saml.md)). The on-premises data gateway supports SSO by using [DirectQuery](desktop-directquery-about.md) or for Refresh, which connects to on-premises data sources. 

Power BI supports the following data sources:

* SQL Server (Kerberos)
* SAP HANA (Kerberos and SAML)
* SAP BW Application Server (Kerberos)
* SAP BW Message Server (Kerberos) 
* Oracle (Kerberos) 
* Teradata (Kerberos)
* Spark (Kerberos)
* Impala (Kerberos)
* Denodo (Kerberos)


> [!NOTE]
> SQL Server Analysis Services also supports SSO, but does so using [Live connections](service-gateway-enterprise-manage-ssas.md#authentication-to-a-live-analysis-services-data-source), rather than using Kerberos or SAML.

We don't currently support SSO for [M-extensions](https://github.com/microsoft/DataConnectors/blob/master/docs/m-extensions.md).

When a user interacts with a DirectQuery report in the Power BI Service, each cross-filter, slice, sort, and report editing operation can result in queries that execute live against the underlying on-premises data source. When you configure SSO for the data source, queries execute under the identity of the user that interacts with Power BI (that is, through the web experience or Power BI mobile apps). Therefore, each user sees precisely the data for which they have permissions in the underlying data source. 

You can also configure a report which is set up for refresh in the Power BI Service to use SSO. When you configure SSO for this data source, queries execute under the identity of the dataset owner within Power BI. Therefore, the refresh happens based on the dataset owner's permissions on the underlying data source. Refresh using SSO is currently enabled only for data sources using [Kerberos](service-gateway-sso-kerberos.md) constrained delegation 

## Query steps when running SSO

A query that runs with SSO consists of three steps, as shown in the following diagram.

![SSO query steps](media/service-gateway-sso-overview/sso-query-steps.png)

Here are additional details about each step:

1. For each query, the Power BI service includes the *user principal name (UPN)*, which is the fully qualified username of the user currently signed in to the Power BI service, when it sends a query request to the configured gateway.

2. The gateway must map the Azure Active Directory UPN to a local Active Directory identity:

   a. If Azure AD DirSync (also known as *Azure AD Connect*) is configured, then the mapping works automatically in the gateway.

   b.  Otherwise, the gateway can look up and map the Azure AD UPN to a local AD user by performing a lookup against the local Active Directory domain.

3. The gateway service process impersonates the mapped local user, opens the connection to the underlying database, and then sends the query. You don't need to install the gateway on the same machine as the database.

## Next steps

Now that you understand the basics of enabling SSO through the gateway, read more detailed information about Kerberos and SAML:

* [Single sign-on (SSO) - Kerberos](service-gateway-sso-kerberos.md)
* [Single sign-on (SSO) - SAML](service-gateway-sso-saml.md)
