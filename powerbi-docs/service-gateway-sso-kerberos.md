---
title: Use Kerberos on the on-premises gateway for (single sign-on) SSO from Power BI to on-premises data sources
description: Configure your gateway with Kerberos to enable SSO from Power BI to on-premises data sources
author: mgblythe
ms.author: mblythe
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-gateways
ms.topic: conceptual
ms.date: 10/10/2018
LocalizationGroup: Gateways
---

# Use Kerberos for single sign-on (SSO) from Power BI to on-premises data sources

Use [Kerberos constrained delegation](https://technet.microsoft.com/library/jj553400.aspx) to enable seamless single sign-on connectivity. Enabling SSO makes it easy for Power BI reports and dashboards to refresh data from on-premises sources.

## Supported data sources

We currently support the following data sources:

* SQL Server
* SAP HANA
* Teradata
* Spark

We also support SAP HANA with [Security Assertion Markup Language (SAML)](service-gateway-sso-saml.md).

### SAP HANA

To enable SSO for SAP HANA, follow these steps first:

* Ensure the SAP HANA server is running the required minimum version, which depends on your SAP Hana server platform level:
  * [HANA 2 SPS 01 Rev 012.03](https://launchpad.support.sap.com/#/notes/2557386)
  * [HANA 2 SPS 02 Rev 22](https://launchpad.support.sap.com/#/notes/2547324)
  * [HANA 1 SP 12 Rev 122.13](https://launchpad.support.sap.com/#/notes/2528439)
* On the gateway machine, install SAP’s latest HANA ODBC driver.  The minimum version is HANA ODBC version 2.00.020.00 from August 2017.

For more information about setting up and configuring single sign-on for SAP HANA using Kerberos, see the topic [Single Sign-on Using Kerberos](https://help.sap.com/viewer/b3ee5778bc2e4a089d3299b82ec762a7/2.0.03/en-US/1885fad82df943c2a1974f5da0eed66d.html) in the SAP HANA Security Guide and the links from that page, particularly SAP Note 1837331 – HOWTO HANA DBSSO Kerberos/Active Directory].

## Preparing for Kerberos Constrained Delegation

Several items must be configured in order for Kerberos Constrained Delegation to work properly, including *Service Principal Names* (SPN) and delegation settings on service accounts.

### Prerequisite 1: Install & configure the On-premises data gateway

This release of the On-premises data gateway supports an in-place upgrade, as well as settings take-over of existing gateways.

### Prerequisite 2: Run the gateway Windows service as a domain account

In a standard installation, the gateway runs as a machine-local service account (specifically, *NT Service\PBIEgwService*) such as what's shown in the following image:

![Service account](media/service-gateway-sso-kerberos/kerberos-sso-on-prem_04.png)

To enable **Kerberos Constrained Delegation**, the gateway must run as a domain account, unless your Azure AD is already synchronized with your local Active Directory (using Azure AD DirSync/Connect). If you need to switch the account to a domain account, see [Switching the gateway to a domain account](#switching-the-gateway-to-a-domain-account) later in this article.

> [!NOTE]
> If Azure AD DirSync / Connect is configured and user accounts are synchronized, the gateway service does not need to perform local AD lookups at runtime, and you can use the local Service SID (instead of requiring a domain account) for the gateway service. The Kerberos Constrained Delegation configuration steps outlined in this article are the same as that configuration (they are simply applied based on the service SID, instead of domain account).

### Prerequisite 3: Have domain admin rights to configure SPNs (SetSPN) and Kerberos Constrained Delegation settings

While it is technically possible for a domain administrator to temporarily or permanently allow rights to someone else to configure SPNs and Kerberos delegation without requiring domain admin rights, that's not the recommended approach. In the following section, we cover the configuration steps necessary for **Prerequisite 3** in detail.

## Configuring Kerberos Constrained Delegation for the gateway and data source

To properly configure the system, we need to configure or validate the following two items:

1. If needed, configure an SPN for the gateway service domain account.

2. Configure delegation settings on the gateway service domain account.

Note that you must be a domain administrator to perform those two configuration steps.

The following sections describe these steps in turn.

### Configure an SPN for the gateway service account

First, determine whether an SPN was already created for the domain account used as the gateway service account, but following these steps:

1. As a domain administrator, launch **Active Directory Users and Computers**.

2. Right-click on the domain, select **Find**, and type in the account name of the gateway service account

3. In the search result, right-click on the gateway service account and select **Properties**.

4. If the **Delegation** tab is visible on the **Properties** dialog, then an SPN was already created and you can jump ahead to the next subsection about configuring Delegation settings.

    If there is no **Delegation** tab on the **Properties** dialog, you can manually create an SPN on that account which adds the **Delegation** tab (that is the easiest way to configure delegation settings). Creating an SPN can be done using the [setspn tool](https://technet.microsoft.com/library/cc731241.aspx) that comes with Windows (you need domain admin rights to create the SPN).

    For example, imagine the gateway service account is “PBIEgwTest\GatewaySvc”, and the machine name with the gateway service running is called **Machine1**. To set the SPN for the gateway service account for that machine in this example, you would run the following command:

    ![Set SPN](media/service-gateway-sso-kerberos/kerberos-sso-on-prem_05.png)

    With that step completed, we can move on to configuring delegation settings.

### Configure delegation settings on the gateway service account

The second configuration requirement is the delegation settings on the gateway service account. There are multiple tools you can use to perform these steps. In this article, we'll use **Active Directory Users and Computers**, which is a Microsoft Management Console (MMC) snap-in that you can use to administer and publish information in the directory. It's available on domain controllers by default. You can also enable it through **Windows Feature** configuration on other machines.

We need to configure **Kerberos Constrained Delegation** with protocol transiting. With constrained delegation, you must be explicit about which services you want to delegate to. For example, only your SQL Server or your SAP HANA server will accept delegation calls from the gateway service account.

This section assumes you have already configured SPNs for your underlying data sources (such as SQL Server, SAP HANA, Teradata, Spark, and so on). To learn how to configure those data source server SPNs, please refer to technical documentation for the respective database server. You can also look at the blog post that describes [*What SPN does your app require?*](https://blogs.msdn.microsoft.com/psssql/2010/06/23/my-kerberos-checklist/)

In the following steps we assume an on-premises environment with two machines: a gateway machine and a database server running SQL Server. For the sake of this example we'll also assume the following settings and names:

* Gateway machine name: **PBIEgwTestGW**
* Gateway service account: **PBIEgwTest\GatewaySvc** (account display name: Gateway Connector)
* SQL Server data source machine name: **PBIEgwTestSQL**
* SQL Server data source service account: **PBIEgwTest\SQLService**

Given those example names and settings, the configuration steps are the following:

1. With domain administrator rights, launch **Active Directory Users and Computers**.

2. Right-click on the gateway service account (**PBIEgwTest\GatewaySvc**) and select **Properties**.

3. Select the **Delegation** tab.

4. Select **Trust this computer for delegation to specified services only.**

5. Select **Use any authentication protocol.**

6. Under the **Services to which this account can present delegated credentials**, select **Add**.

7. In the new dialog box, select **Users or Computers**.

8. Enter the service account for the SQL Server Database service (**PBIEgwTest\SQLService**) and select **OK**.

9. Select the SPN that you created for the database server. In our example, the SPN will begin with **MSSQLSvc**. If you added both the FQDN and the NetBIOS SPN for your database service, select both. You may only see one.

10. Select **OK**. You should see the SPN in the list now.

11. Optionally, you can select **Expanded** to show both the FQDN and NetBIOS SPN.

12. The dialog box will look similar to the following if you selected **Expanded**. Select **OK**.

    ![Gateway connector properties](media/service-gateway-sso-kerberos/kerberos-sso-on-prem_06.png)

Finally, on the machine running the gateway service (**PBIEgwTestGW** in our example), the gateway service account must be granted the local policy “Impersonate a client after authentication”. You can perform/verify this with the Local Group Policy Editor (**gpedit**).

1. On the gateway machine, run: *gpedit.msc*.

1. Navigate to **Local Computer Policy > Computer Configuration > Windows Settings > Security Settings > Local Policies > User Rights Assignment**, as shown in the following image.

    ![User rights assignment](media/service-gateway-sso-kerberos/kerberos-sso-on-prem_07.png)

1. From the list of policies under **User Rights Assignment**, select **Impersonate a client after authentication**.

    ![Impersonate a client](media/service-gateway-sso-kerberos/kerberos-sso-on-prem_08.png)

    Right-click and open the **Properties** for **Impersonate a client after authentication**, and check the list of accounts. It must include the gateway service account (**PBIEgwTest\GatewaySvc**).

1. From the list of policies under **User Rights Assignment**, select **Act as part of the operating system (SeTcbPrivilege)**. Ensure that the gateway service account is included in the list of accounts as well.

18. Restart the **On-premises data gateway** service process.

If you're using SAP HANA, we recommend following these additional steps, which can yield a small performance improvement.

1. In the gateway installation directory find and open this configuration file: *Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config*.

1. Find the *FullDomainResolutionEnabled* property, and change its value to *True*.

    ```xml
    <setting name=" FullDomainResolutionEnabled " serializeAs="String">
          <value>True</value>
    </setting>
    ```

## Running a Power BI report

After all the configuration steps outlined earlier in this article have been completed, you can use the **Manage Gateway** page in Power BI to configure the data source. Then under its **Advanced Settings** enable SSO, and publish reports and datasets binding to that data source.

![Advanced settings](media/service-gateway-sso-kerberos/kerberos-sso-on-prem_09.png)

This configuration will work in most cases. However, with Kerberos there can be different configurations depending on your environment. If the report still won't load, you'll need to contact your domain administrator to investigate further.

## Switching the gateway to a domain account

Earlier in this article, we discussed switching the gateway from a local service account to run as a domain account, using the **On-premises data gateway** user interface. Here are the steps necessary to do so.

1. Launch the **On-premises data gateway** configuration tool.

   ![Gateway desktop app](media/service-gateway-sso-kerberos/kerberos-sso-on-prem_10.png)

2. Select the **Sign-in** button on the main page, and sign in with your Power BI account.

3. After sign-in is completed, select the **Service Settings** tab.

4. Select **Change account** to start the guided walk-through, as shown in the following image.

   ![Change account](media/service-gateway-sso-kerberos/kerberos-sso-on-prem_11.png)

## Errors from an insufficient Kerberos configuration

If the underlying database server and gateway are not configured properly for **Kerberos Constrained Delegation**, you may receive the following error message:

![Couldn't load data](media/service-gateway-sso-kerberos/kerberos-sso-on-prem_02.png)

And the technical details associated with the error message (DM_GWPipeline_Gateway_ServerUnreachable) may look like the following:

![Server unreachable](media/service-gateway-sso-kerberos/kerberos-sso-on-prem_03.png)

The result is that the gateway could not impersonate the originating user properly, and the database connection attempt failed.

## Next steps

For more information about the **On-premises data gateway** and **DirectQuery**, check out the following resources:

- [On-premises data gateway](service-gateway-onprem.md)
- [DirectQuery in Power BI](desktop-directquery-about.md)
- [Data sources supported by DirectQuery](desktop-directquery-data-sources.md)
- [DirectQuery and SAP BW](desktop-directquery-sap-bw.md)
- [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md)