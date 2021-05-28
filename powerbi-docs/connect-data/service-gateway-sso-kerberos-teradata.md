---
title: Use Kerberos for single sign-on (SSO) to Teradata
description: Configure your Teradata server to enable SSO from the Power BI service.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 05/28/2021
LocalizationGroup: Gateways
---

# Use Kerberos for SSO to Teradata

This article describes specific and additional requirements to successfully enable single sign-on (SSO) to Teradata from the Power BI service.

If user accounts in Teradata are identified using *sAMAccountName*, you must set *FullDomainResolutionEnabled* on the gateway to **true**. 

If user accounts in Teradata are identified by their **UPN**, keep *FullDomainResolutionEnabled* on the gateway set to **false**.

## Enabling SSO for Teradata

The following steps describe how to change the *FullDomainResolutionEnabled* configuration on the gateway to enable SSO for Teradata:

1.	In the gateway installation directory, open the configuration file **Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config**.
2.	In the file, find the *FullDomainResolutionEnabled* property and change its value to **True**.

```xml
<setting name=" FullDomainResolutionEnabled " serializeAs="String">
      <value>True</value>
</setting>
```

## Next steps

For more information about the on-premises data gateway and DirectQuery, see the following resources:

* [What is an on-premises data gateway?](/data-integration/gateway/service-gateway-onprem)
* [DirectQuery in Power BI](desktop-directquery-about.md)
* [Data sources supported by DirectQuery](power-bi-data-sources.md)
* [DirectQuery and SAP Business Warehouse (BW)](desktop-directquery-sap-bw.md)
* [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md)
