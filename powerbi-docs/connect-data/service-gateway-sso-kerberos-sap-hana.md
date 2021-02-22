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

This section provides extensive steps about how to troubleshoot using Kerberos for single sign-on (SSO) to SAP HANA. Using these troubleshooting steps can help you self-diagnose and correct issues you may be facing.

### Verifying and troubleshooting gateway errors

To follow the steps in this section, you need to [collect gateway logs](https://docs.microsoft.com/data-integration/gateway/service-gateway-tshoot#collect-logs-from-the-on-premises-data-gateway-app).

#### SSL Error (certificate)

**Error symptoms:**

There are multiple symptoms of this issue. When trying to add a new data source, you might see an error like the following:

```Unable to connect: We encountered an error while trying to connect to . Details: "We could not register this data source for any gateway instances within this cluster. Please find more details below about specific errors for each gateway instance."```

When trying to create or refresh a report, you may see the following:

:::image type="content" source="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-01.png" alt-text="Troubleshooting SSL error window":::

When you investigate the Mashup[date]*.log you will see the following error:

```A connection was successfully established with the server, but then an error occurred during the login process and The certificate chain was issued by an authority that is not trusted```

**Resolution:**

To resolve this SSL error, go to the data source connection and set **Validate Server Certificate** to **No**, as shown in the following image:

:::image type="content" source="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-02.png" alt-text="Resolving SSL error window":::

Once selected, the error will no longer appear.

#### Gateway SignXML error

The gateway SignXML error can be the result of incorrect settings with the *SapHanaSAMLCertThumbprint*, or it can be an issue with the HANA server. Entries in the gateway logs help identify where the issue resides, and how to resolve it. 

**Error symptoms:**

Log entries for ```SignXML: Found the cert...```: If your GatewayInfo[*date*].log file contains this error, the SignXML cert was found, and your troubleshooting efforts should focus on steps found in the [verifying and troubleshooting the HANA server side](#verifying-and-troubleshooting-the-hana-server-side) section, later in this article.

Log entries for ```Couldn't find saml cert```: If your GatewayInfo[*date*].log file contains this error, then *SapHanaSAMLCertThumbprint* is set incorrectly. The following resolution section describes how to resolve the issue.

**Resolution:**

To properly set *SapHanaSAMLCertThumbprint*, follow the steps outlined in [Use Security Assertion Markup Language (SAML) for SSO from Power BI to on-premises data sources](service-gateway-sso-saml.md), and specifically, follow the steps outlined toward the bottom of that article that begins with: *Finally, follow these steps to add the certificate thumbprint to the gateway configuration:*

Once the configuration file is changed, restart the gateway service for the change to take effect.

**Validation:**

When *SapHanaSAMLCertThumbprint* is properly set, your gateway logs will have entries that include ```SignXML: Found the cert...```. At this point, you should be able to proceed to [verifying and troubleshooting the HANA server side](#verifying-and-troubleshooting-the-hana-server-side). 

If the gateway is not able to use the certificate to sign the SAML assertion, you may see an error similar to the following in the logs: 

```GatewayPipelineErrorCode=DM_GWPipeline_UnknownError GatewayVersion= InnerType=CryptographicException InnerMessage=<pi>Signing key is not loaded.</pi> InnerToString=<pi>System.Security.Cryptography.CryptographicException: Signing key is not loaded.```

To resolve that error, follow the steps beginning with **Step 3:** in the following [configure the gateway](service-gateway-sso-saml.md#configure-the-gateway) section of that article.

After changing the configuration, restart the gateway service for the change to take effect.

#### Verifying and troubleshooting the HANA server side

Use the troubleshooting steps in this section if the gateway is finding the certificate and is able to sign the SAML assertion, but you're still experiencing errors. Following the steps in this section requires collecting HANA authentication traces, described in the following article's [troubleshooting](service-gateway-sso-saml.md#troubleshooting) section. 

**The SAML identity provider**

Seeing the string ```Found SAML provider``` in the HANA authentication traces indicates proper configuration of the SAML Identity Provider. If the string is not present, the configuration is not correct.

**Resolution:**

First determine whether your organization is using **OpenSSL** or **commoncrypto** as the sslcryptoprovider. Take the following steps to determine which is being used:

1. Open HANA Studio
2. Open the Administration Console for the tenant being used.
3. Go to the configuration tab and use sslcryptoprovider as a filter, as shown in the following image:

:::image type="content" source="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-03.png" alt-text="HANA Studio sslcryptoprovider information":::

Next, verify the cryptographic library is set correctly with the following steps:

1. Go to Security Console in the HANA Studio in the SAML Identity Providers tab
2. If the sslcryptoprovider is OpenSSL, choose the **OpenSSL Cryptographic Library** radio button. If the sslcryptoprovider is commonCrypto, choose the **SAP Cryptographic Library** radio button. The following image shows the **SAP Cryptographic Library** selection:

    :::image type="content" source="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-04.png" alt-text="HANA Studio sslcryptoprovider selection":::

3. Make sure you deploy any changes by selecting the **Deploy** button in the upper right corner of the window, shown in the following image:

    :::image type="content" source="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-05.png" alt-text="Deploy solution changes":::

**Validation:**

When properly configured, the traces will report ```Found SAML provider``` and will *not* report ```SAML Provider not found```. You can proceed to [troubleshooting the SAML Assertion signature](#troubleshooting-the-saml-assertion-signature) later in this article. 


If the cryptographic provider is set but the ```SAML Provider not found``` is still being reported, search for a string in the trace that begins with the following:

```Search SAML provider for certificate with subject =```

In that string, check if the subject and issuer are exactly the same as the SAML identity provider tab in the Security Console. Even a single character of difference can cause the problem. If you find a difference, you can change the SAP Cryptographic library so the entries match exactly.

If changing the SAP Cryptographic library doesn't fix the issue, you can manually edit the fields *Issued To* and *Issued By*. Simply double-click to edit the field.


#### Troubleshooting the SAML Assertion signature

You may run into HANA authentication traces that contain entries similar to the following:

```[48163]{-1}[-1/-1] 2020-09-11 21:15:18.896165 i Authentication SAMLAuthenticator.cpp(00398) : Unable to verify XML signature```
```[48163]{-1}[-1/-1] 2020-09-11 21:15:18.896168 i Authentication MethodSAML.cpp(00103) : unsuccessful login attempt with SAML ticket!```

Such entries means the signature is not trusted.

**Resolution:**
If you're using **OpenSSL** as your sslcryptoprovider, check whether the trust.pem and key.pem are in the SSL directory. The following link provides information on how to check them: [SAP article](https://blogs.sap.com/2015/09/28/securing-the-communication-between-sap-hana-studio-and-sap-hana-server-through-ssl/)

If you're using **commoncrypto** as your sslcryptoprovider, check whether there's a collection with your certificate in the tenant.

**Validation:**

When properly configured, the traces will report ```Found valid XML signature``` 


#### Troubleshooting the UPN mapping

You may run into HANA  traces that contain entries similar to the following:

```SAMLAuthenticator.cpp(00886) : Assertion Subject NameID: johnny@contoso.com SAMLAuthenticator.cpp(00398) : Database user does not exist```

The error indicates that nameId johnny@contoso.com is found in the SAML assertions, but does not exist or is not mapped correctly in HANA Server.

**Resolution:**

Go to the HANA database user and click on the *Configure* link below the checked SAML box. The following window appears:

    :::image type="content" source="media/service-gateway-sso-kerberos-sap-hana/sap-hana-kerberos-troubleshooting-06.png" alt-text="Wrong user name":::

As the error message describes, HANA was trying to find johnny@contoso.com but in the external identity is only johnny. These two values need to match, so to fix it, edit the *External Identity* to be johnny@contoso.com. Note these entries are case sensitive.

## Next steps

For more information about the on-premises data gateway and DirectQuery, see the following resources:

* [What is an on-premises data gateway?](/data-integration/gateway/service-gateway-onprem)
* [DirectQuery in Power BI](desktop-directquery-about.md)
* [Data sources supported by DirectQuery](power-bi-data-sources.md)
* [DirectQuery and SAP BW](desktop-directquery-sap-bw.md)
* [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md)
