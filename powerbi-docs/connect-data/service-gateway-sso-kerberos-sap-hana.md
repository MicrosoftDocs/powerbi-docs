---
title: Use Kerberos for single sign-on (SSO) to SAP HANA
description: Configure your SAP HANA server to enable SSO from Power BI service
author: arthiriyer
ms.author: arthii
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 02/22/2021
LocalizationGroup: Gateways
---

# Use Kerberos for single sign-on (SSO) to SAP HANA

> [!IMPORTANT]
> As [SAP no longer supports the OpenSSL](https://help.sap.com/viewer/b3ee5778bc2e4a089d3299b82ec762a7/2.0.05/en-US/de15ffb1bb5710148386ffdfd857482a.html), Microsoft also has discontinued its support. Existing connections will continue to work, but you won't be able to create new connections starting February 2021. Going forward, please use CommonCryptoLib instead.

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

We also recommend following these extra steps, which can yield a small performance improvement:

1. In the gateway installation directory, find and open this configuration file: Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config.

2. Find the `FullDomainResolutionEnabled` property, and change its value to `True`.

    ```xml
    <setting name=" FullDomainResolutionEnabled " serializeAs="String">
          <value>True</value>
    </setting>
    ```

Now, [Run a Power BI report](service-gateway-sso-kerberos.md#run-a-power-bi-report).

## Troubleshooting

This section provides extensive steps about how to troubleshoot using Kerberos for single sign-on (SSO) to SAP HANA in the Power BI service. Using these troubleshooting steps can help you self-diagnose and correct issues you may be facing.

### Verifying and troubleshooting gateway errors

To follow the steps in this section, you need to [collect gateway logs](https://docs.microsoft.com/data-integration/gateway/service-gateway-tshoot#collect-logs-from-the-on-premises-data-gateway-app).

#### SSL Error (certificate)

**Error symptoms:**

There are multiple symptoms of this issue. When trying to add a new data source, you might see an error like the following:

```Unable to connect: We encountered an error while trying to connect to . Details: "We could not register this data source for any gateway instances within this cluster. Please find more details below about specific errors for each gateway instance."```

When trying to create or refresh a report, you may see the following:

:::image type="content" source="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-01.png" alt-text="Troubleshooting SSL error window":::

When you investigate the Mashup[date]*.log you will see the following error:

```A connection was successfully established with the server, but then an error occurred during the login process and The certificate chain was issued by an authority that is not trusted.```

**Resolution:**

To resolve this SSL error, go to the data source connection and set **Validate Server Certificate** to **No**, as shown in the following image:

:::image type="content" source="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-02.png" alt-text="Resolving SSL error window":::

Once selected, the error will no longer appear.

#### Impersonation

Log entries for Impersonation contain entries similar to the following: ```About to impersonate user DOMAIN\User (IsAuthenticated: True, ImpersonationLevel: Impersonation).``` 

The important element in that log entry is the information after the *ImpersonationLevel:* entry. Any value different from *Impersonation* reveals that impersonation is not occurring properly.

**Resolution:**

You can properly set up ImpersonationLevel by following the instructions in [grant the gateway service account local policy rights on the gateway machine](service-gateway-sso-kerberos.md#grant-the-gateway-service-account-local-policy-rights-on-the-gateway-machine).

Once the configuration file is changed, restart the gateway service for the change to take effect.

**Validation:**

Refresh or create the report and collect the gateway logs. Open the most recent *GatewayInfo* file and check the following string: ```About to impersonate user DOMAIN\User (IsAuthenticated: True, ImpersonationLevel: Impersonation)```. Make sure that the *ImpersonationLevel:* setting returns *Impersonation*.


#### Delegation
Delegation issues usually appear in the Power BI service as generic errors. To make sure the issue is not a delegation issue, collect Wireshark traces and use *Kerberos* as a filter. To learn more about Wireshark, and for information about Kerberos errors, see the [blog post on Kerberos errors in network captures](https://docs.microsoft.com/archive/blogs/askds/kerberos-errors-in-network-captures).

The following symptoms and troubleshooting steps help remedy some common issues.

**Service Principal Name (SPN) Issues:**
When experiencing SPN issues, when investigating the Mashup[date]*.log you see the following error: ```The import [table] matches no exports. Did you miss a module reference?:```

Investigating further using the WireShark traces reveals the error **KRB4KDC_ERR_S_PRINCIPAL_UNKOWN**, which means that the Service Principal Name (SPN) was not found or does not exists. The following image shows an example:

:::image type="content" source="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-07.png" alt-text="SPN error":::

**Resolution:**

To resolve Service Principal Name (SPN) issues such as this, you must add an SPN to a service account. Information about doing so is provided in the SAP documentation found in [this SAP article](https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/LATEST/en-US/c786f2cfd976101493dfdf14cf9bcfb1.html).

In addition to following those steps, also follow the resolution steps described in the next section, or you will also endure the symptoms in the **No Credentials Issues** section, described in the following section.

**No Credentials Issues:**
There may not be clear symptoms associated with this issue. When you investigate the Mashup[date]*.log you will see the following error:

```29T20:21:34.6679184Z","Action":"RemoteDocumentEvaluator/RemoteEvaluation/HandleException","HostProcessId":"1396","identity":"DirectQueryPool","Exception":"Exception:\r\nExceptionType: Microsoft.Mashup.Engine1.Runtime.ValueException, Microsoft.MashupEngine, Version=1.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\r\nMessage:```

With further investigation into the same file, the following (unhelpful) error appears: ```No credentials are available in the security package```

Capturing Wireshark traces reveals the following error: *KRB5KDC_ERR_BADOPTION.*

:::image type="content" source="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-08.png" alt-text="No credentials error":::

Usually, these errors mean that the SPN *hdb/hana2-s4-sso2.westus2.cloudapp.azure.com* could be found but is not in the **Services to which this account can present delegated credentials** at the **Delegation** tab from the Gateway service account.

**Resolution:**

To resolve the *No credentials* issue, follow the steps described in [configure the gateway service account for standard Kerberos constrained delegation](service-gateway-sso-kerberos.md#configure-the-gateway-service-account-for-standard-kerberos-constrained-delegation). When completed properly, the delegation tab at the gateway service account will reflect the hdb/fqdn in the list of **Services to which this account can present delegated credentials**.


**Validation:**
Following the previous steps should resolve the issue. If you still experience Kerberos issues, you may have a misconfiguration in the **Power BI gateway** or in the HANA server itself. 

#### Credentials errors
If you experience credentials errors, errors in the logs or traces will expose errors describing *Credentials are invalid* or similar errors. These errors may manifest differently on the data source side of the connection, such as SAP HANA. The following image shows an example error:

:::image type="content" source="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-09.png" alt-text="Invalid credentials error":::

**Symptom 1**:
In HANA authentication traces, you may see entries similar to the following:

```[Authentication|manager.cpp:166] Kerberos: Using Service Principal Name johnny@on.microsoft.com@CONTOSO.COM with name type: GSS_KRB5_NT_PRINCIPAL_NAME [Authentication|methodgssinitiator.cpp:367] Got principal name: johnny@on.microsoft.com@CONTOSO.COM```

**Resolution**:
Take the steps described in [set user-mapping configuration parameters on the gateway machine (if necessary)](service-gateway-sso-kerberos.md#set-user-mapping-configuration-parameters-on-the-gateway-machine-if-necessary), even if you already have the **Azure AD Connect** service configured.

**Validation**:
Once properly completed, you'll be able to successfully load the report in the Power BI service.

**Symptom 2**:
In HANA authentication traces, you may see entries similar to the following:

```Authentication ManagerAcceptor.cpp(00233) : Extending list of expected external names by johnny@CONTOSO.COM (method: GSS) Authentication AuthenticationInfo.cpp(00168) : ENTER getAuthenticationInfo (externalName=johnny@CONTOSO.COM) Authentication AuthenticationInfo.cpp(00237) : Found no user with expected external name!```

**Resolution**:
Check the Kerberos external ID in the **HANA User** to determine whether they properly match.

**Validation**:
Once corrected, you can create or refresh reports in the Power BI service.


## Next steps

For more information about the on-premises data gateway and DirectQuery, see the following resources:

* [What is an on-premises data gateway?](/data-integration/gateway/service-gateway-onprem)
* [DirectQuery in Power BI](desktop-directquery-about.md)
* [Data sources supported by DirectQuery](power-bi-data-sources.md)
* [DirectQuery and SAP BW](desktop-directquery-sap-bw.md)
* [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md)
