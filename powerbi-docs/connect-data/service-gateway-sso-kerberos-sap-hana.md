---
title: Use Kerberos for single sign-on (SSO) to SAP HANA
description: Configure your SAP HANA server to enable SSO from the Power BI service. This article includes troubleshooting.
author: arthiriyer
ms.author: arthii
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 02/03/2023
LocalizationGroup: Gateways
---

# Use Kerberos for SSO to SAP HANA

> [!IMPORTANT]
> Because [SAP no longer supports OpenSSL](https://help.sap.com/viewer/b3ee5778bc2e4a089d3299b82ec762a7/2.0.05/en-US/de15ffb1bb5710148386ffdfd857482a.html), Microsoft has also discontinued its support. Your existing connections continue to work but you can no longer create new connections. Use SAP Cryptographic Library (CommonCryptoLib), or sapcrypto, instead.

This article describes how to configure your SAP HANA data source to enable single sign-on (SSO) from the Power BI service.

> [!NOTE]
> Before you attempt to refresh a SAP HANA-based report that uses Kerberos SSO, complete the steps in both this article and [Configure Kerberos SSO](service-gateway-sso-kerberos.md).

## Enable SSO for SAP HANA

To enable SSO for SAP HANA, do the following steps:

1. Ensure the SAP HANA server is running the required minimum version, which depends on your SAP HANA server platform level:
   - [HANA 2 SPS 01 Rev 012.03](https://launchpad.support.sap.com/#/notes/2557386)
   - [HANA 2 SPS 02 Rev 22](https://launchpad.support.sap.com/#/notes/2547324)
   - [HANA 1 SP 12 Rev 122.13](https://launchpad.support.sap.com/#/notes/2528439)

1. On the gateway computer, install the latest SAP HANA ODBC driver. The minimum version is HANA ODBC version 2.00.020.00 from August 2017.

1. Ensure that the SAP HANA server has been configured for Kerberos-based SSO. For more information about setting up SSO for SAP HANA by using Kerberos, see [Single sign-on using Kerberos](https://help.sap.com/viewer/b3ee5778bc2e4a089d3299b82ec762a7/2.0.03/1885fad82df943c2a1974f5da0eed66d.html). Also see the links from that page, particularly SAP Note 1837331 – HOWTO HANA DBSSO Kerberos/Active Directory.

We also recommend following these extra steps, which can yield a small performance improvement:

1. In the gateway installation directory, look for and open this configuration file: *Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config*.

1. Look for the `FullDomainResolutionEnabled` property, and change its value to `True`.

    ```xml
    <setting name=" FullDomainResolutionEnabled " serializeAs="String">
          <value>True</value>
    </setting>
    ```

1. [Run a Power BI report](service-gateway-sso-kerberos.md#section-3-validate-configuration).

## Troubleshoot

This section provides instructions for troubleshooting using Kerberos for single sign-on (SSO) to SAP HANA in the Power BI service. By using these troubleshooting steps, you can self-diagnose and correct many issues you might be facing.

To follow the steps in this section, you need to [collect gateway logs](/data-integration/gateway/service-gateway-tshoot#collect-logs-from-the-on-premises-data-gateway-app).

### TLS/SSL error (certificate)

This issue has multiple symptoms.

- When you try to add a new data source, you might see an error like the following message:

   ```output
   Unable to connect: We encountered an error while trying to connect to.
   Details: "We could not register this data source for any gateway
   instances within this cluster.
   Please find more details below about specific errors for each gateway instance."
   ```

- When you try to create or refresh a report, you might see the following error message:

   :::image type="content" source="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-01.png" alt-text="Screenshot of a 'Cannot load model' troubleshooting TLS/SSL error window." lightbox="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-01.png":::

- When you investigate the *Mashup[date]\*.log*, you see the following error message:

   ```output
   A connection was successfully established with the server, 
   but then an error occurred during the login process and 
   the certificate chain was issued by an authority that is not trusted.
   ```

#### Resolution

To resolve this TLS/SSL error, go to the data source connection and then, in the **Validate Server Certificate section**, disable the setting, as shown in the following image:

:::image type="content" source="media/service-gateway-sso-kerberos-sap-hana/validate-server-certificate.png" alt-text=" Screenshot of resolving TLS/SSL error window by disabling the certificate." :::

After you've disabled this setting, the error message no longer appears.

### Impersonation

Log entries for impersonation contain entries similar to: 

```output
About to impersonate user DOMAIN\User (IsAuthenticated: True, ImpersonationLevel: Impersonation).
```

The important element in this log entry is the information that's displayed after the `ImpersonationLevel:` entry. Any value different from `Impersonation` reveals that impersonation isn't occurring properly.

#### Resolution

You can set up `ImpersonationLevel` properly by following the instructions in [Grant the gateway service account local policy rights on the gateway](service-gateway-sso-kerberos.md#step-6-grant-the-gateway-service-account-local-policy-rights-on-the-gateway-machine).

After you've changed the configuration file, restart the gateway service for the change to take effect.

#### Validation

Refresh or create the report, and then collect the gateway logs. Open the most recent *GatewayInfo* file, and check the following string: `About to impersonate user DOMAIN\User (IsAuthenticated: True, ImpersonationLevel: Impersonation)`. Make sure that the `ImpersonationLevel` setting returns `Impersonation`.

### Delegation

Delegation issues usually appear in the Power BI service as generic errors. To make sure that the issue isn't a delegation issue, collect Wireshark traces and use *Kerberos* as a filter. To learn more about Wireshark, and for information about Kerberos errors, see [Kerberos errors in network captures](/archive/blogs/askds/kerberos-errors-in-network-captures).

The following symptoms and troubleshooting steps can help remedy some common issues.

#### SPN issues

If you see the following error: `The import [table] matches no exports. Did you miss a module reference?:` while investigating the *Mashup[date]\*.log*, then you're experiencing service principal name (SPN) issues.

When you investigate further by using Wireshark traces, you reveal the error `KRB4KDC_ERR_S_PRINCIPAL_UNKOWN`, which means that the SPN wasn't found or doesn't exist. The following image shows an example:

:::image type="content" source="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-07.png" alt-text="Screenshot showing a service principal name error." lightbox="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-07.png" :::

#### Resolution

To resolve SPN issues such as this issue, you must add an SPN to a service account. For more information, see the SAP documentation in [Configure Kerberos for SAP HANA database hosts](https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/LATEST/en-US/c786f2cfd976101493dfdf14cf9bcfb1.html).

In addition, follow the resolution instructions described in the next section.

#### No credentials issues

There might not be clear symptoms associated with this issue. When you investigate the *Mashup[date]\*.log*, you see the following error:

```output
29T20:21:34.6679184Z","Action":"RemoteDocumentEvaluator/RemoteEvaluation/HandleException","HostProcessId":"1396","identity":"DirectQueryPool","Exception":"Exception:\r\nExceptionType: Microsoft.Mashup.Engine1.Runtime.ValueException, Microsoft.MashupEngine, Version=1.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\r\nMessage:
```

When you investigate the same file further, the following (unhelpful) error appears: 

```output
No credentials are available in the security package
```

Capturing Wireshark traces reveals the following error: `KRB5KDC_ERR_BADOPTION`.

:::image type="content" source="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-08.png" alt-text="Screenshot showing a 'No credentials error'." lightbox="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-08.png":::

Usually, these errors mean that the SPN *hdb/hana2-s4-sso2.westus2.cloudapp.azure.com* file could be found but isn't in the **Services to which this account can present delegated credentials** list on the **Delegation** pane in the Gateway service account.

#### Resolution

To resolve the *No credentials* issue, follow the steps described in [Configure Kerberos constrained delegation](service-gateway-sso-kerberos.md#step-4-configure-kerberos-constrained-delegation). When completed properly, the delegation tab at the gateway service account reflects the HansaWorld Database (HDB) file and fully qualified domain name (FQDN) in the list of **Services to which this account can present delegated credentials**.

#### Validation

Following the preceding steps should resolve the issue. If you still experience Kerberos issues, you might have a misconfiguration in the Power BI gateway or in the HANA server itself.

### Credentials errors

If you experience credentials errors, errors in the logs or traces expose errors that describe `Credentials are invalid` or similar errors. These errors might manifest differently on the data source side of the connection, such as SAP HANA. The following image shows an example error:

:::image type="content" source="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-09.png" alt-text="Screenshot showing an invalid credentials error." lightbox="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-09.png" :::

#### Symptom 1

In HANA authentication traces, you might see entries similar to the following message:

```output
[Authentication|manager.cpp:166] Kerberos: Using Service Principal 
Name johnny@contoso.com@CONTOSO.COM with name type: GSS_KRB5_NT_PRINCIPAL_NAME 
[Authentication|methodgssinitiator.cpp:367] Got principal name: 
johnny@contoso.com@CONTOSO.COM
```

#### Resolution

Follow the instructions described in [Set user-mapping configuration parameters on the gateway machine](service-gateway-sso-kerberos.md#set-user-mapping-configuration-parameters-on-the-gateway-machine), even if you've already configured the **Microsoft Entra Connect** service.

#### Validation

After you've completed the validation, you can successfully load the report in the Power BI service.

#### Symptom 2

In HANA authentication traces, you might see entries similar to the following entry:

```output
Authentication ManagerAcceptor.cpp(00233) : Extending list of expected
external names by johnny@CONTOSO.COM (method: GSS) Authentication 
AuthenticationInfo.cpp(00168) : ENTER getAuthenticationInfo 
(externalName=johnny@CONTOSO.COM) Authentication AuthenticationInfo.cpp(00237) : 
Found no user with expected external name!
```

#### Resolution

Check the Kerberos external ID under **HANA User** to determine whether the IDs match properly.

#### Validation

After you've resolved the issue, you can create or refresh reports in the Power BI service.

## Related content

For more information about the on-premises data gateway and DirectQuery, see the following resources:

- [What is an on-premises data gateway?](/data-integration/gateway/service-gateway-onprem)
- [DirectQuery in Power BI](desktop-directquery-about.md)
- [Data sources supported by DirectQuery](power-bi-data-sources.md)
- [DirectQuery and SAP Business Warehouse (BW)](desktop-directquery-sap-bw.md)
- [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md)
