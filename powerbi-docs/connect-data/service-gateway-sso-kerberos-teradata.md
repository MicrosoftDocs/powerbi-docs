---
title: Configure Kerberos SSO for Teradata in Power BI
description: "Learn how to configure Kerberos SSO for Teradata in Power BI. Step-by-step guide to enable single sign-on authentication with gateway settings."
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 10/01/2025
ai-usage: ai-assisted
LocalizationGroup: Gateways
#customer intent: As a Power BI user I want to learn how to configure SSO for my Teradata server using Power BI.
---

# Configure Kerberos SSO for Teradata in Power BI

This article explains how to configure Kerberos single sign-on (SSO) for Teradata in Power BI. Learn the specific gateway configuration requirements needed to enable SSO authentication based on how your Teradata server identifies user accounts.

- If Teradata identifies user accounts by using *sAMAccountNames*, you must set `FullDomainResolutionEnabled` on the gateway to `True`.
- If Teradata identifies user accounts by using *User Principal Names (UPNs)*, keep `FullDomainResolutionEnabled` on the gateway set to `False`.

## Configure gateway settings for Teradata SSO

To change the `FullDomainResolutionEnabled` configuration on the gateway to enable SSO for Teradata:

1. In the on-premises gateway directory at *%ProgramFiles%\On-premises data gateway*, open the configuration file *Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config*.
1. In the file, find the `FullDomainResolutionEnabled` property and change its value to `True`.

   ```xml
   <setting name=" FullDomainResolutionEnabled " serializeAs="String">
         <value>True</value>
   </setting>
   ```

## Related content

For more information about the on-premises data gateway and DirectQuery, see the following resources:

- [What is an on-premises data gateway?](/data-integration/gateway/service-gateway-onprem)
- [DirectQuery in Power BI](desktop-directquery-about.md)
- [Data sources supported by DirectQuery](power-bi-data-sources.md)
- [DirectQuery and SAP Business Warehouse (BW)](desktop-directquery-sap-bw.md)
- [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md)
