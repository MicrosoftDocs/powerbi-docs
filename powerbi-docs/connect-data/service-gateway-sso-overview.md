---
title: Overview of single sign-on for on-premises data gateways
description: Learn how to configure your gateway to enable single sign-on from Power BI to on-premises data sources.
author: arthiriyer
ms.author: arthii
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 08/25/2023
LocalizationGroup: Gateways
---

# Overview of single sign-on for on-premises data gateways in Power BI

You can get seamless single sign-on (SSO) connectivity, enabling Power BI reports and dashboards to update in real time by configuring your on-premises data gateway. You have the option of configuring your gateway with the following SSO options:

* Active Directory (AD) SSO, which includes:
  * [Kerberos](service-gateway-sso-kerberos.md) constrained delegation.
  * [Security Assertion Markup Language (SAML)](service-gateway-sso-saml.md).
* Microsoft Entra SSO.

> [!NOTE]
> SSO is only supported by Power BI datasets and not by Power BI dataflows.

## Supported data sources for SSO

AD SSO is usually configured for on-premises data sources that are secured within your on-premises network. Microsoft Entra SSO is configured for data sources that support Microsoft Entra authentication, typically cloud data sources, secured behind an Azure Virtual Network.

While the on-premises data gateway supports SSO by using [DirectQuery](desktop-directquery-about.md) or *Refresh* for the AD-based SSO options, only [DirectQuery](desktop-directquery-about.md) is supported for Microsoft Entra SSO.

Power BI supports the following data sources:


* Amazon Redshift (Microsoft Entra ID)
* Azure Databricks
* Azure Data Explorer (Microsoft Entra ID)
* Azure SQL (Microsoft Entra ID)
* Azure Synapse Analytics (Microsoft Entra ID)
* Denodo (Kerberos)
* Hive LLAP (Kerberos)
* Impala (Kerberos)
* Oracle (Kerberos)
* SAP BW Application Server (Kerberos)
* SAP BW Message Server (Kerberos)
* SAP HANA (Kerberos and SAML)
* Snowflake (Microsoft Entra ID)
* Spark (Kerberos)
* SQL Server (Kerberos)
* Teradata (Kerberos)
* Tibco Data Virtualization (Kerberos)


> [!NOTE]
> SQL Server Analysis Services also supports SSO, but does so using [Live connections](service-gateway-enterprise-manage-ssas.md#authentication-to-a-live-analysis-services-data-source), rather than using Kerberos or SAML. Power BI doesn't support SSO for [M-extensions](/power-query/samples/trippin/9-testconnection/readme).

## Interact with reports that rely on SSO

When a user interacts with a DirectQuery report in the Power BI service, each cross-filter, slice, sort, and report editing operation can result in queries that execute live against the underlying data source. When you configure SSO for the data source, queries execute under the identity of the user that interacts with Power BI. That is, they run through the web experience or Power BI mobile apps. Therefore, each user sees precisely the data for which they have permissions in the underlying data source.

You can also configure a report that is set up for refresh in the Power BI service to use SSO. When you configure SSO for this data source, queries execute under the identity of the dataset owner within Power BI. Therefore, the refresh happens based on the dataset owner's permissions on the underlying data source. Refresh using SSO is currently enabled only for data sources using [Kerberos](service-gateway-sso-kerberos.md) constrained delegation.

## Related content

Now that you understand the basics of SSO through the gateway, read detailed information about setting up SSO here:

* [Active Directory (AD) SSO](service-gateway-active-directory-sso.md)
* [Microsoft Entra SSO](service-gateway-azure-active-directory-sso.md)
