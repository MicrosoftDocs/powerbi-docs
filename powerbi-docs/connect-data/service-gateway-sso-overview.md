---
title: Overview of single sign-on (SSO) for on-premises data gateways
description: Configure your gateway to enable single sign-on (SSO) from Power BI to on-premises data sources.
author: arthiriyer
ms.author: arthii
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 07/14/2021
LocalizationGroup: Gateways
---

# Overview of single sign-on (SSO) for on-premises data gateways in Power BI

You can get seamless single sign-on connectivity, enabling Power BI reports and dashboards to update in real time by configuring your on-premises data gateway. You have the option of configuring your gateway with

* Active Directory (AD) SSO, which includes:
    * [Kerberos](service-gateway-sso-kerberos.md) constrained delegation.
    * Security Assertion Markup Language ([SAML](service-gateway-sso-saml.md)).
* Azure Active Directory (Azure AD) SSO.

AD SSO is usually configured for on-premises data sources which are secured within your on-premises network, while Azure AD SSO is configured for data sources that support Azure Active Directory authentication (typically cloud data sources) secured behind an Azure Virtual Network.

While the on-premises data gateway supports SSO by using [DirectQuery](desktop-directquery-about.md) or Refresh for the AD-based SSO options, only [DirectQuery](desktop-directquery-about.md) is supported for Azure AD SSO. 

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
* Azure Synapse Analytics (Azure AD)
* Azure SQL (Azure AD) 
* Azure Data Explorer (Azure AD)
* Snowflake (Azure AD) 

> [!NOTE]
> SQL Server Analysis Services also supports SSO, but does so using [Live connections](service-gateway-enterprise-manage-ssas.md#authentication-to-a-live-analysis-services-data-source), rather than using Kerberos or SAML. We don't currently support SSO for [M-extensions](https://github.com/microsoft/DataConnectors/blob/master/docs/m-extensions.md).

When a user interacts with a DirectQuery report in the Power BI Service, each cross-filter, slice, sort, and report editing operation can result in queries that execute live against the underlying data source. When you configure SSO for the data source, queries execute under the identity of the user that interacts with Power BI (that is, through the web experience or Power BI mobile apps). Therefore, each user sees precisely the data for which they have permissions in the underlying data source. 

You can also configure a report which is set up for refresh in the Power BI Service to use SSO. When you configure SSO for this data source, queries execute under the identity of the dataset owner within Power BI. Therefore, the refresh happens based on the dataset owner's permissions on the underlying data source. Refresh using SSO is currently enabled only for data sources using [Kerberos](service-gateway-sso-kerberos.md) constrained delegation 

## Next steps

Now that you understand the basics of enabling SSO through the gateway, read more detailed information about Kerberos and SAML:

* [Single sign-on (SSO) - Kerberos](service-gateway-sso-kerberos.md)
* [Single sign-on (SSO) - SAML](service-gateway-sso-saml.md)
