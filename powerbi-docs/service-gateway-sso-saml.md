---
title: Use Security Assertion Markup Language (SAML) for SSO from Power BI to on-premises data sources
description: Configure your gateway with Security Assertion Markup Language (SAML) to enable SSO from Power BI to on-premises data sources.
author: mgblythe
ms.author: mblythe
manager: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: conceptual
ms.date: 10/10/2019
LocalizationGroup: Gateways
---

# Use Security Assertion Markup Language (SAML) for SSO from Power BI to on-premises data sources

Enabling SSO makes it easy for Power BI reports and dashboards to refresh data from on-premises sources while respecting user-level permissions configured on those sources. Use [Security Assertion Markup Language (SAML)](https://www.onelogin.com/pages/saml) to enable seamless single sign-on connectivity. 

## Supported data sources

We currently support SAP HANA with SAML. For more information about setting up and configuring single sign-on for SAP HANA by using SAML, see [SAML SSO for BI Platform to HANA](https://wiki.scn.sap.com/wiki/display/SAPHANA/SAML+SSO+for+BI+Platform+to+HANA).

We support additional data sources with [Kerberos](service-gateway-sso-kerberos.md) (including SAP HANA).

For SAP HANA, it's recommended you enable encryption before you establish a SAML SSO connection. To enable encryption, configure the HANA server to accept encrypted connections and configure the gateway to use encryption to communicate with your HANA server. Because the HANA ODBC driver doesn't encrypt SAML assertions by default, the signed SAML assertion is sent from the gateway to the HANA server *in the clear* and is vulnerable to interception and reuse by third parties. For instructions about how to enable encryption for HANA with the OpenSSL library, see [Enable encryption for SAP HANA](/power-bi/desktop-sap-hana-encryption).

## Configuring the gateway and data source

To use SAML, you must establish a trust relationship between the HANA servers for which you want to enable SSO and the gateway. In this scenario, the gateway serves as the SAML Identity Provider (IdP). There are various ways to establish this relationship, such as importing the gateway IdP's x509 certificate into the HANA servers' trust store, or by having the gateway's X509 certificate signed by a root Certification Authority (CA) trusted by the HANA servers. Although we describe the latter approach in this guide, you can use another approach if it's more convenient.

While this guide uses OpenSSL as the HANA server's cryptographic provider, SAP recommends you use the SAP Cryptographic Library (also known as CommonCryptoLib or sapcrypto) instead of OpenSSL to complete the setup steps in which we establish the trust relationship. For more information, see the official SAP documentation.

The following steps describe how to establish a trust relationship between a HANA server and the gateway IdP by signing the gateway IdP's X509 certificate with a Root CA trusted by the HANA server. You'll create this Root CA:

1. Create the Root CA's X509 certificate and private key. For example, to create the Root CA's X509 certificate and private key in .pem format, enter this command:

   ```
   openssl req -new -x509 -newkey rsa:2048 -days 3650 -sha256 -keyout CA_Key.pem -out CA_Cert.pem -extensions v3_ca
   ```

    Ensure that the Root CA's private key is secured properly. If it's obtained by a third party, it could be used to gain unauthorized access to the HANA server. 

 1. Add the certificate (for example, CA_Cert.pem) to the HANA server's trust store so that the HANA server will trust any certificates signed by the Root CA you created. 

    You can find the location of your HANA server's trust store by examining the **ssltruststore** configuration setting. If you've followed the instructions in the SAP documentation covering how to configure OpenSSL, your HANA server might already trust a Root CA you that can reuse. For more information, see [How to Configure Open SSL for SAP HANA Studio to SAP HANA Server](https://archive.sap.com/documents/docs/DOC-39571). If you have multiple HANA servers for which you want to enable SAML SSO, make sure that each of the servers trusts this Root CA.

1. Create the gateway IdP's X509 certificate. 

   For example, to create a certificate-signing request (IdP_Req.pem) and a private key (IdP_Key.pem) that are valid for a year, execute the following command:

   ```
   openssl req -newkey rsa:2048 -days 365 -sha256 -keyout IdP_Key.pem -out IdP_Req.pem -nodes
   ```

 1. Sign the certificate-signing request by using the Root CA you've configured your HANA servers to trust. 

    For example, to sign IdP_Req.pem using CA_Cert.pem and CA_Key.pem (the certificate and key of the Root CA), execute the following command:

    ```
    openssl x509 -req -days 365 -in IdP_Req.pem -sha256 -extensions usr_cert -CA CA_Cert.pem -CAkey CA_Key.pem -CAcreateserial -out IdP_Cert.pem
    ```

     The resulting IdP certificate is valid for a year (see the -days option). 

Import your IdP's certificate in HANA Studio to create a new SAML Identity Provider:

1. In SAP HANA Studio, right-click your SAP HANA server name, then navigate to **Security** &gt; **Open Security Console** &gt; **SAML Identity Provider** &gt; **OpenSSL Cryptographic Library**.

    ![Identity providers](media/service-gateway-sso-saml/identity-providers.png)

1. Select **Import**, navigate to IdP_Cert.pem, and import it.

1. In SAP HANA Studio, select the **Security** folder.

    ![Security folder](media/service-gateway-sso-saml/security-folder.png)

1. Expand **Users**, and then select the user you want to map your Power BI user to.

1. Select **SAML**, and then select **Configure**.

    ![Configure SAML](media/service-gateway-sso-saml/configure-saml.png)

1. Select the identity provider you created in step 2. For **External Identity**, enter the Power BI user's UPN (typically the email address the user uses to sign in to Power BI), and then select **Add**. If you've configured your gateway to use the *ADUserNameReplacementProperty* configuration option, enter the value that will replace the Power BI user's original UPN. 

   For example, if you set *ADUserNameReplacementProperty* to **SAMAccountName** you should enter the user's **SAMAccountName**.

    ![Select identity provider](media/service-gateway-sso-saml/select-identity-provider.png)

Now that you have the gateway's certificate and identity configured, convert the certificate to a pfx format and configure the gateway to use the certificate:

1. Convert the certificate to pfx format by running the following command. This command names the resulting .pfx file samlcert.pfx and sets *root* as its password:

    ```
    openssl pkcs12 -export -out samltest.pfx -in IdP_Cert.pem -inkey IdP_Key.pem -passin pass:root -passout pass:root
    ```

1. Copy the pfx file to the gateway machine:

    1. Double-click samltest.pfx, then select **Local Machine** &gt; **Next**.

    1. Enter the password, then select **Next**.

    1. Select **Place all certificates in the following store,** then select **Browse** &gt; **Personal** &gt; **OK**.

    1. Select **Next**, and then **Finish**.

       ![Import certificate](media/service-gateway-sso-saml/import-certificate.png)

1. Grant the gateway service account access to the private key of the certificate:

    1. On the gateway machine, run the Microsoft Management Console (MMC).

        ![Run MMC](media/service-gateway-sso-saml/run-mmc.png)

    1. Under **File**, select **Add/Remove Snap-in**.

        ![Add snap-in](media/service-gateway-sso-saml/add-snap-in.png)

    1. Select **Certificates** &gt; **Add**, then select **Computer account** &gt; **Next**.

    1. Select **Local Computer** &gt; **Finish** &gt; **OK**.

    1. Expand **Certificates** &gt; **Personal** &gt; **Certificates**, and find the certificate.

    1. Right-click the certificate and navigate to **All Tasks** &gt; **Manage Private Keys**.

        ![Manage private keys](media/service-gateway-sso-saml/manage-private-keys.png)

    1. Add the gateway service account to the list. By default, the account is **NT SERVICE\PBIEgwService**. You can find out which account is running the Gateway service by running **services.msc** and locating **On-premises data gateway service**.

        ![Gateway service](media/service-gateway-sso-saml/gateway-service.png)

Finally, follow these steps to add the certificate thumbprint to the gateway configuration:

1. Run the following PowerShell command to list the certificates on your machine:

    ```powershell
    Get-ChildItem -path cert:\LocalMachine\My
    ```

1. Copy the thumbprint for the certificate you created.

1. Navigate to the gateway directory, which by default is C:\Program Files\On-premises data gateway.

1. Open PowerBI.DataMovement.Pipeline.GatewayCore.dll.config, and find the *SapHanaSAMLCertThumbprint* section. Paste the thumbprint you copied.

1. Restart the gateway service.

## Running a Power BI report

Now you can use the **Manage Gateway** page in Power BI to configure the SAP HANA data source. Under **Advanced Settings**, enable SSO via SAML. Doing so allows you to publish reports and datasets binding to that data source.

   ![Advanced settings](media/service-gateway-sso-saml/advanced-settings.png)

## Troubleshooting

After you configure SAML-based SSO, you might see the following error in the Power BI portal: *The credentials provided cannot be used for the SapHana source.* This error indicates that the SAML credential was rejected by SAP HANA.

Server-side authentication traces provide detailed information for troubleshooting credential issues on SAP HANA. Follow these steps to configure tracing for your SAP HANA server:

1. On the SAP HANA server, turn on the authentication trace by running the following query:

    ```
    ALTER SYSTEM ALTER CONFIGURATION ('indexserver.ini', 'SYSTEM') set ('trace', 'authentication') = 'debug' with reconfigure 
    ```

1. Reproduce the issue.

1. In HANA Studio, open the administration console, and select the **Diagnosis Files** tab.

1. Open the latest index server trace and search for *SAMLAuthenticator.cpp*.

    You should find a detailed error message that indicates the root cause, for example:

    ```
    [3957]{-1}[-1/-1] 2018-09-11 21:40:23.815797 d Authentication   SAMLAuthenticator.cpp(00091) : Element '{urn:oasis:names:tc:SAML:2.0:assertion}Assertion', attribute 'ID': '123123123123123' is not a valid value of the atomic type 'xs:ID'.
    [3957]{-1}[-1/-1] 2018-09-11 21:40:23.815914 i Authentication   SAMLAuthenticator.cpp(00403) : No valid SAML Assertion or SAML Protocol detected
    ```

1. After the troubleshooting is complete, turn off the authentication trace by running the following query:

    ```
    ALTER SYSTEM ALTER CONFIGURATION ('indexserver.ini', 'SYSTEM') UNSET ('trace', 'authentication');
    ```

## Next steps

For more information about the on-premises data gateway and DirectQuery, see the following resources:

* [What is an on-premises data gateway?](/data-integration/gateway/service-gateway-onprem)
* [DirectQuery in Power BI](desktop-directquery-about.md)
* [Data sources supported by DirectQuery](desktop-directquery-data-sources.md)
* [DirectQuery and SAP BW](desktop-directquery-sap-bw.md)
* [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md)
