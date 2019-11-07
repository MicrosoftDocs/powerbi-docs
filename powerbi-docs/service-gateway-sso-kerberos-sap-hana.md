---
title: Use Kerberos for single sign-on (SSO) to SAP HANA
description: Configure your SAP HANA server to enable SSO from Power BI service
author: mgblythe
ms.author: mblythe
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: conceptual
ms.date: 10/10/2019
LocalizationGroup: Gateways
---

# Use Kerberos for single sign-on (SSO) to SAP HANA

This article describes how to configure your SAP HANA data source to enable SSO from the Power BI service.

> [!NOTE]
> Before you attempt to refresh a SAP HANA-based report that uses Kerberos SSO, complete both the steps in this article and the steps in [Configure Kerberos SSO](service-gateway-sso-kerberos.md).

## Enable SSO for SAP HANA

To enable SSO for SAP HANA, follow these steps:

1. Ensure the SAP HANA server is running the required minimum version, which depends on your SAP HANA server platform level:
   - [HANA 2 SPS 01 Rev 012.03](https://launchpad.support.sap.com/#/notes/2557386)
   - [HANA 2 SPS 02 Rev 22](https://launchpad.support.sap.com/#/notes/2547324)
   - [HANA 1 SP 12 Rev 122.13](https://launchpad.support.sap.com/#/notes/2528439)

2. On the gateway machine, install the latest SAP HANA ODBC driver. The minimum version is HANA ODBC version 2.00.020.00 from August 2017.

3. Ensure that the SAP HANA server has been configured for Kerberos-based SSO. For more information about setting up SSO for SAP HANA by using Kerberos, see [Single Sign-on Using Kerberos](https://help.sap.com/viewer/b3ee5778bc2e4a089d3299b82ec762a7/2.0.03/1885fad82df943c2a1974f5da0eed66d.html) in the SAP HANA Security Guide. Also see the links from that page, particularly SAP Note 1837331 – HOWTO HANA DBSSO Kerberos/Active Directory.

We also recommend following these additional steps, which can yield a small performance improvement:

1. In the gateway installation directory, find and open this configuration file: Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config.

2. Find the `FullDomainResolutionEnabled` property, and change its value to `True`.

    ```xml
    <setting name=" FullDomainResolutionEnabled " serializeAs="String">
          <value>True</value>
    </setting>
    ```

Now, [Run a Power BI report](service-gateway-sso-kerberos.md#run-a-power-bi-report).

## Next steps

For more information about the on-premises data gateway and DirectQuery, see the following resources:

* [What is an on-premises data gateway?](/data-integration/gateway/service-gateway-onprem)
* [DirectQuery in Power BI](desktop-directquery-about.md)
* [Data sources supported by DirectQuery](desktop-directquery-data-sources.md)
* [DirectQuery and SAP BW](desktop-directquery-sap-bw.md)
* [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md)
