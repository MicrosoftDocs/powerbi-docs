---
title: Add comments to a report in Power BI Report Server
description: Learn how to add comments to a Power BI or a paginated report on a Power BI Report Server or SQL Server Reporting Services report server.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 11/15/2018
---

# **PBIRS with ADFS and WAP**

**Prerequisites:**

- **Domain Name Services (DNS) configuration**

- The public URL will be that the user will connect to. For example, it may look similar to the following : [https://reports.contosolab.com](https://reports.contosolab.com)
- Configure your DNS record for **reports.contosolab.com** (the host name) to point to the public IP address of the Web Application Proxy (WAP) server.
- You also need to configure a public DNS record for your ADFS server. For example, you may have configured the ADFS server with the following URL: [https://adfs.contosolab.com](https://adfs.contosolab.com)
- Configure your DNS record for **adfs.contosolab.com** to point to the public IP address of the Web Application Proxy (WAP) server as it will be published as part of the WAP application.

- **Certificates**

You need to configure certificates for both the WAP application and the ADFS server. Both of these certificates must be part of a valid certificate authority that your machines recognize.

**Steps to add set up PBIRS with ADFS and WAP:**

**1. Power BI Reporting Server configuration:**

We just need to make sure that we have a valid Service Principal Name (SPN) to enable the proper Kerberos authentication to occur and that the Power BI Reporting Services server is enabled for negotiate authentication.

**Service Principal Name (SPN)**

The SPN is a unique identifier for a service that uses Kerberos authentication. You need to make sure you have a proper HTTP SPN present for your report server.

For information on how to configure the proper Service Principal Name (SPN) for your report server, see [Register a Service Principal Name (SPN) for a Report Server](https://msdn.microsoft.com/library/cc281382.aspx).

**Enabling negotiate authentication**

To enable a report server to use Kerberos authentication, you need to configure the Authentication Type of the report server to be RSWindowsNegotiate. You do it in the rsreportserver.config file.

\&lt;AuthenticationTypes\&gt;

    \&lt;RSWindowsNegotiate /\&gt;

    \&lt;RSWindowsNTLM /\&gt;

\&lt;/AuthenticationTypes\&gt;

For more information, see [Modify a Reporting Services Configuration File](https://msdn.microsoft.com/library/bb630448.aspx) and [Configure Windows Authentication on a Report Server](https://msdn.microsoft.com/library/cc281253.aspx).

**2. Active Directory Federation Services (ADFS) Configuration**

You need to configure ADFS on a Windows 2016 server within your environment. The configuration can be done through the Server Manager and selecting Add Roles and Features under Manage. For more information, see [Active Directory Federation Services](https://technet.microsoft.com/windows-server-docs/identity/active-directory-federation-services).

On the ADFS server, using ADFS Management App perform the following steps:

- Right click on Relying Party trust -\&gt; Add Relying Party trust:

Image: report-server-adfs-add-relying-party-trust.png



- Perform the following steps in &#39;Add Relying Party Trust&#39; wizard:
- Choose &#39;Non-Claims aware&#39; option in order to use Windows Integrated security as the authentication mechanism

Image: report-server-adfs-add-relying-party-trust-welcome.png

- Enter a name you prefer in the &#39;Specify Display Name&#39; and click on &#39;Next&#39;
- Add the Relying party trust identifier : \&lt;ADFS\_URL\&gt;/adfs/services/trust  (for ex : [https://adfs.contosolab.com/adfs/services/trust](https://adfs.contosolab.com/adfs/services/trust) )

Image: report-server-adfs-configure-identifiers.png

- Choose the **Access Control Policy** that fits your organization&#39;s needs.

Image: report-server-adfs-choose-access-control.png

- Select **Next**.
- Select **Next**.
- When completed, you should see the properties of the Relying Party Trusts look like the following.

Image: report-server-adfs-relying-party-trusts.png

**3. Web Application Proxy (WAP) Configuration**

You want to enable the Web Application Proxy (Role) Windows role on a server in your environment. It must be on a Windows 2016 server. For more information, see [Web Application Proxy in Windows Server 2016](https://technet.microsoft.com/windows-server-docs/identity/web-application-proxy/web-application-proxy-windows-server) and [Publishing Applications using AD FS Preauthentication](https://technet.microsoft.com/windows-server-docs/identity/web-application-proxy/publishing-applications-using-ad-fs-preauthentication#a-namebkmk14apublish-an-application-that-uses-oauth2-such-as-a-windows-store-app).

**Constrained delegation configuration**

In order to transition from Forms authentication to Windows authentication, we need to use constrained delegation with protocol transitioning. This is part of the Kerberos configuration. We already defined the Reporting Services SPN within the Reporting Services configuration.

We need to configure constrained delegation on the WAP Server machine account within Active Directory. You may need to work with a domain administrator if you don&#39;t have rights to Active Directory.

To configure constrained delegation, you want to do the following steps.

1. On a machine that has the Active Directory tools installed, launch **Active Directory Users and Computers**.
2. Find the machine account for your WAP server. By default, it will be in the computers container.
3. Right-click the WAP server and go to **Properties**.
4. Select the **Delegation** tab.
5. Select **Trust this computer for delegation to specified services only** and then **Use any authentication protocol**.

Image: report-server-adfs-delegation-use-any.png

1. This sets up constrained delegation for this WAP Server machine account. We then need to specify the services that this machine is allowed to delegate to.
2. Select Add… under the services box

Image: report-server-adfs-trust-add.png

1. Select Users or Computers…
2. Enter the service account that you are using for Power BI Reporting Services. This account is the account you added the SPN to, within the Power BI Reporting Services configuration.
3. Select the SPN for Reporting Services and then select OK.

**Note: You may only see the NetBIOS SPN. It will actually select both the NetBIOS and FQDN SPNs if they both exist.**

1. The result should look similar to the following when the **Expanded** checkbox is checked.

report-server-wap-properties.png

**Add WAP Application**

- Open Remote Access Management console and click on Publish option to a publish a new Web Application Proxy:

Image: report-server-welcome-publish-new-app-wizard.png

- Click on Next
- Choose ADFS preauthentication method as shown below and click on &#39;Next&#39;:

Image: report-server-preauthentication-new-app-wizard.png

- Select &#39;Web and MSOFBA&#39; preauthentication as we are going to set up just the Browser access for PBIRS and not mobile app access

Image: report-server-supported-clients-publish-new-app-wizard.png

- Add the Relying Party that we created in the ADFS server as shown below and Select Next:

Image: report-server-relying-party-publish-new-app-wizard.png

- In the &#39;External URL&#39; section, put in the Publicly accessible URL configured on the WAP server and add the URL configured with PBIRS (Report Server Configuration Manager) as shown below in the Backend Server URL section. Add the SPN of PBIRS in the &#39;Backend server SPN&#39; section:

report-server-publishing-settings-new-app-wizard.png

- Select Next and Publish once done
- Run the following PowerShell command to validate the WAP configuration:

**Get-WebApplicationProxyApplication &quot;PBIRSBrowser&quot; | FL**

Image: report-server-powershell-get-webapplication.png

**Connecting with PBIRS through Browser:**

You can then access the Public WAP URL ([https://reports.contosolab.com/ReportServer](https://reports.contosolab.com/ReportServer) for web service and [https://reports.contosolab.com/Reports](https://reports.contosolab.com/Reports) for web portal) from browser and view the reports on successful authentication:

Image: report-server-adfs-sign-in.png

## Next steps
* [What is Power BI Report Server?](get-started.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

