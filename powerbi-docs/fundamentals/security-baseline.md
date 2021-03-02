---
title: Azure security baseline for Power BI
description: The Power BI security baseline provides procedural guidance and resources for implementing the security recommendations specified in the Azure Security Benchmark.
author: mbaldwin
ms.author: margoc
ms.service: powerbi
ms.subservice: pbi-security
ms.topic: conceptual
ms.date: 11/20/2020
ms.custom: subject-security-benchmark
# Important: This content is machine generated; do not modify this topic directly. Contact mbaldwin for more information.
---

# Azure security baseline for Power BI

This security baseline applies guidance from the [Azure Security Benchmark version 2.0](/azure/security/benchmarks/overview) to Power BI. The Azure Security Benchmark provides recommendations on how you can secure your cloud solutions on Azure. The content is grouped by the **security controls** defined by the Azure Security Benchmark and the related guidance applicable to Power BI. **Controls** not applicable to Power BI have been excluded.

To see how Power BI completely maps to the Azure Security Benchmark, see the [full Power BI security baseline mapping file](https://github.com/MicrosoftDocs/SecurityBenchmarks/tree/master/Azure%20Offer%20Security%20Baselines).

## Network Security

*For more information, see the [Azure Security Benchmark: Network Security](/azure/security/benchmarks/security-controls-v2-network-security).*

### NS-3: Establish private network access to Azure services

**Guidance**: Power
BI supports connecting your Power BI
tenant to a Private link endpoint and disabling public internet access.

- [Private links for accessing Power BI](../admin/service-security-private-links.md)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Shared

## Identity Management

*For more information, see the [Azure Security Benchmark: Identity Management](/azure/security/benchmarks/security-controls-v2-identity-management).*

### IM-1: Standardize Azure Active Directory as the central identity and authentication system

**Guidance**: Power BI is integrated with Azure Active Directory (Azure AD) which is Azure's default identity and access management service. You should standardize on Azure AD to govern your organization’s identity and access management.

Securing Azure AD should be a high priority in your organization’s cloud security practice. Azure AD provides an identity secure score to help you assess identity security posture relative to Microsoft’s best practice recommendations. Use the score to gauge how closely your configuration matches best practice recommendations, and to make improvements in your security posture.

Note: Azure AD supports external identities that allow users without a Microsoft account to sign in to their applications and resources with their external identity.

- [Tenancy in Azure Active Directory](/azure/active-directory/develop/single-and-multi-tenant-apps)

- [How to create and configure an Azure AD instance](/azure/active-directory/fundamentals/active-directory-access-create-new-tenant)

- [Use external identity providers for application](/azure/active-directory/b2b/identity-providers)

- [What is the identity secure score in Azure Active Directory](/azure/active-directory/fundamentals/identity-secure-score)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IM-2: Manage application identities securely and automatically

**Guidance**: Power BI and Power BI Embedded support the use of Service Principals. Store any Service Principal credentials used for encrypting or accessing Power BI in a Key Vault, assign proper access policies to the vault and regularly review access permissions.

Automate Premium workspace and dataset tasks with service principals https://docs.microsoft.com/power-bi/admin/service-premium-service-principal

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IM-3: Use Azure AD single sign-on (SSO) for application access

**Guidance**: Power BI uses Azure Active Directory to provide identity and access management to Azure resources, cloud applications, and on-premises applications. This includes enterprise identities such as employees, as well as external identities such as partners, vendors, and suppliers. This enables single sign-on (SSO) to manage and secure access to your organization’s data and resources on-premises and in the cloud. Connect all your users, applications, and devices to the Azure AD for seamless, secure access and greater visibility and control.

- [Understand Application SSO with Azure AD](/azure/active-directory/manage-apps/what-is-single-sign-on)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IM-4: Use strong authentication controls for all Azure Active Directory based access

**Guidance**: Power BI is integrated with Azure AD that supports strong authentication controls through multi-factor authentication (MFA), and strong passwordless methods.
- Multi-factor authentication - Enable Azure AD MFA and follow Azure Security Center Identity and Access Management recommendations for some best practices in your MFA setup. MFA can be enforced on all, select users or at the per-user level based on sign-in conditions and risk factors.
- Passwordless authentication – Three passwordless authentication options are available: Windows Hello for Business, Microsoft Authenticator app, and on-premises authentication methods such as smart cards.

For administrator and privileged users, ensure the highest level of strong authentication is used, followed by rolling out the appropriate strong authentication policy to other users.

Note: MFA can only be enforced for user accounts enabled in Azure AD. Power BI Service Principals do not support the use of MFA.

- [How to enable MFA in Azure](/azure/active-directory/authentication/howto-mfa-getstarted)

- [Introduction to passwordless authentication options for Azure Active Directory](/azure/active-directory/authentication/concept-authentication-passwordless)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IM-5: Monitor and alert on account anomalies

**Guidance**: Define anomaly detection policies in Microsoft Cloud App Security which can be independently scoped, so that they apply to only the users and groups that you want to include. These anomaly detection policies can help detect and monitor behavior anomalies related to users accessing and using Power BI.

- [Using Microsoft Cloud App Security Controls in Power BI](../admin/service-security-using-microsoft-cloud-app-security-controls.md)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IM-6: Restrict Azure resource access based on conditions

**Guidance**: Power BI supports Azure AD conditional access for a more granular access control based on user-defined conditions, such as user logins from certain IP ranges will need to use MFA for login. Granular authentication session management policy can also be used for different use cases.

- [Azure conditional access overview](/azure/active-directory/conditional-access/overview)

- [Common conditional access policies](/azure/active-directory/conditional-access/concept-conditional-access-policy-common)

- [Configure authentication session management with conditional access](/azure/active-directory/conditional-access/howto-conditional-access-session-lifetime)

- [Using Microsoft Cloud App Security Controls in Power BI](../admin/service-security-using-microsoft-cloud-app-security-controls.md)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IM-7: Eliminate unintended credential exposure

**Guidance**: For Power BI embedded applications
it is recommended to implement Credential Scanner to identify credentials within your
code. Credential Scanner will also encourage moving discovered credentials to
more secure locations such as Azure Key Vault.

Store any encryption keys or Service Principal credentials used for encrypting or accessing Power BI in a Key Vault, assign proper access policies to the vault and regularly review access permissions.
 
For GitHub, you can use
native secret scanning feature to identify credentials or other form of secrets
within the code.

- [Bring your own encryption keys for Power BI](../admin/service-encryption-byok.md)

 
How to set up Credential
- [Scanner](https://secdevtools.azurewebsites.net/helpcredscan.html) 

- [GitHub secret scanning](https://docs.github.com/github/administering-a-repository/about-secret-scanning)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Shared

## Privileged Access

*For more information, see the [Azure Security Benchmark: Privileged Access](/azure/security/benchmarks/security-controls-v2-privileged-access).*

### PA-1: Protect and limit highly privileged users

**Guidance**: To reduce risk and follow the principle of least privilege, it is recommended to keep membership of the Power BI administrators to a small number of people. Users with these privileged permissions could potentially access and modify all any management feature for the organization. Global administrators, via Microsoft 365 or Azure Active Directory, implicitly possess administrator rights in the Power BI service as well.

Power BI has below highly privileged accounts:
- Global admin
- Billing admin
- License admin
- User admin
- Power BI admin
- Power BI Premium Capacity admin
- Power BI Embedded Capacity admin

Power BI supports session policies in Azure AD to enable conditional access policies and route sessions used in Power BI through the Cloud App Security service.

Enable just-in-time (JIT) privileged access for the Power BI admin accounts using M365 Privileged access management.

- [Administrator roles related to Power BI](../admin/service-admin-administering-power-bi-in-your-organization.md#administrator-roles-related-to-power-bi)

- [M365 Privileged Access Management](/microsoft-365/compliance/privileged-access-management-overview?view=o365-worldwide&preserve-view=true)

- [Cloud App Security controls in Power BI](../admin/service-security-using-microsoft-cloud-app-security-controls.md)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### PA-2: Restrict administrative access to business-critical systems

**Guidance**: Limit the number of highly-privileged accounts or roles with elevated access to Power BI.

You can enable just-in-time (JIT) privileged access using the M365 Privileged access management guidance [here](/microsoft-365/compliance/privileged-access-management-overview?view=o365-worldwide&preserve-view=true).

Additional details can be found on page 183 of the Power BI Enterprise Deployment document [here](https://aka.ms/PBIEnterpriseDeploymentWP).

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### PA-3: Review and reconcile user access regularly

**Guidance**: As a Power BI service admin, you can analyze usage for all Power BI resources at the tenant level by using custom reports based on the Power BI activity log. You can download the activities by using a REST API or PowerShell cmdlet. You can also filter the activity data by date range, user, and activity type.

You must meet these requirements to access the Power BI activity log:
- You must either be a global admin or a Power BI service admin.
- You have installed the [Power BI Management cmdlets](https://www.powershellgallery.com/packages/MicrosoftPowerBIMgmt) locally or use the Power BI Management cmdlets in Azure Cloud Shell.

Once these requirements are met you can follow the guidance below to track user activity within Power BI:

- [Track users activity in Power BI](../admin/service-admin-auditing.md)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### PA-4: Set up emergency access in Azure AD

**Guidance**: Power BI is integrated with Azure Active Directory and M365 to manage its resources. To prevent being accidentally locked out of your M365 tenant, or Azure AD organization, set up an emergency access account for access when normal administrative accounts cannot be used. Emergency access accounts are usually highly privileged, and they should not be assigned to specific individuals. Emergency access accounts are limited to emergency or "break glass"' scenarios where normal administrative accounts can't be used.

You should ensure that the credentials (such as password, certificate, or smart card) for emergency access accounts are kept secure and known only to individuals who are authorized to use them only in an emergency.

- [Manage emergency access accounts in Azure AD](/azure/active-directory/users-groups-roles/directory-emergency-access)

- [Protect your M365 accounts](/microsoft-365/campaigns/m365-campaigns-protect-admin-accounts)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### PA-6: Use privileged access workstations

**Guidance**: Secured, isolated workstations are critically
important for the security of sensitive roles like administrators, developers,
and critical service operators. Use highly secured user workstations and/or
Azure Bastion for administrative tasks related to managing Power BI. Use Azure Active Directory, Microsoft
Defender Advanced Threat Protection (ATP), and/or Microsoft Intune to deploy a
secure and managed user workstation for administrative tasks. The secured
workstations can be centrally managed to enforce secured configuration including
strong authentication, software and hardware baselines, restricted logical and
network access.

Understand privileged access
- [workstations](https://4sysops.com/archives/understand-the-microsoft-privileged-access-workstation-paw-security-model/)

- [Deploy a privileged access workstation](/azure/active-directory/devices/howto-azure-managed-workstation)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

## Data Protection

*For more information, see the [Azure Security Benchmark: Data Protection](/azure/security/benchmarks/security-controls-v2-data-protection).*

### DP-1: Discovery, classify and label sensitive data

**Guidance**: Use Microsoft Information Protection sensitivity labels on your reports, dashboards, datasets, and dataflows to guard your sensitive content against unauthorized data access and leakage.

Use Microsoft Information Protection sensitivity labels to classify and label your reports, dashboards, datasets, and dataflows in Power BI service and to protect your sensitive content from unauthorized data access and leakage when content is exported from Power BI service to Excel, PowerPoint and PDF files.

- [How to apply sensitivity labels in Power BI](../admin/service-security-apply-data-sensitivity-labels.md)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### DP-2: Protect sensitive data

**Guidance**: Power BI integrates with Microsoft Information Protection sensitivity labels for sensitive data protection. For more details see [Microsoft Information Protection sensitivity labels in Power BI](../admin/service-security-sensitivity-label-overview.md)

Power BI allows service users to bring their own key to protect data at rest. For more details see [Bring your own encryption keys for Power BI](../admin/service-encryption-byok.md)

Customers have the option to keep data sources on-premise and leverage Direct Query or Live Connect with an on-premise data gateway to minimize data exposure to the cloud service. For more details see [What is an on-premises data gateway?](/data-integration/gateway/service-gateway-onprem)

Power BI supports Row Level Security. For more details see [Row-level security (RLS) with Power BI](../admin/service-admin-rls.md). Note that RLS can be applied even to Direct Query data sources in which case PBIX file acts as a security enabling proxy.

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### DP-3: Monitor for unauthorized transfer of sensitive data

**Guidance**: This control can be partially achieved by using Microsoft
Cloud App Security support for Power BI.

Using Cloud App
Security with Power BI, you can help protect your Power BI reports, data, and
services from unintended leaks or breaches. With Cloud App Security, you create
conditional access policies for your organization’s data, using real-time
session controls in Azure Active Directory (Azure AD), that help to ensure your
Power BI analytics are secure. Once these policies have been set, administrators
can monitor user access and activity, perform real-time risk analysis, and set
label-specific controls.

Using
- [Microsoft Cloud App Security controls in Power BI](../admin/service-security-using-microsoft-cloud-app-security-controls.md)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### DP-4: Encrypt sensitive information in transit

**Guidance**: Ensure for HTTP traffic, that any clients and data sources connecting to your Power BI resources can negotiate TLS v1.2 or greater.

- [Enforcing TLS version usage](../admin/service-admin-power-bi-security.md#enforcing-tls-version-usage)

- [Information on TLS Security](/security/engineering/solving-tls1-problem)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### DP-5: Encrypt sensitive data at rest

**Guidance**: Power
BI encrypts data at rest and in process. By default, Power BI uses
Microsoft-managed keys to encrypt your data. Organizations can choose to use
their own keys for encryption of user content at rest across Power BI, from
report images to imported datasets in Premium capacities.

- [Use bring-your-own-key in Power BI](../admin/service-encryption-byok.md)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Shared

## Asset Management

*For more information, see the [Azure Security Benchmark: Asset Management](/azure/security/benchmarks/security-controls-v2-asset-management).*

### AM-1: Ensure security team has visibility into risks for assets

**Guidance**: Use Azure Sentinel with your Power BI Office Audit logs to ensure
your security team has visibility into risks for your Power BI assets.

- [Connect Office 365 Logs to Azure Sentinel](/azure/sentinel/connect-office-365)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### AM-2: Ensure security team has access to asset inventory and metadata

**Guidance**: Ensure that security teams have access to a continuously updated inventory of Power BI Embedded resources. Security teams often need this inventory to evaluate their organization's potential exposure to emerging risks, and as an input to continuously security improvements. 

Azure Resource Graph can query for and discover all Power BI Embedded resources in your subscriptions.  

Logically organize assets according to your organization’s taxonomy using Tags as well as other metadata in Azure (Name, Description, and Category).  

- [How to create queries with Azure Resource Graph Explorer](/azure/governance/resource-graph/first-query-portal)

- [Resource naming and tagging decision guide](/azure/cloud-adoption-framework/decision-guides/resource-tagging/?toc=%2fazure%2fazure-resource-manager%2fmanagement%2ftoc.json)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### AM-3: Use only approved Azure services

**Guidance**: Power BI supports Azure Resource Manager-based deployments for
Power BI Embedded, and you are able to restrict the deploying of its resources
via Azure Policy using a custom Policy definition.

Use
Azure Policy to audit and restrict which services users can provision in your
environment. Use Azure Resource Graph to query for and discover resources
within their subscriptions. You can also use Azure Monitor to create rules to
trigger alerts when a non-approved service is detected.

- [How to configure and manage Azure Policy](/azure/governance/policy/tutorials/create-and-manage)

How to deny a specific resource type with
- [Azure Policy](/azure/governance/policy/samples/built-in-policies#general)

How to create queries with Azure
- [Resource Graph Explorer](/azure/governance/resource-graph/first-query-portal)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

## Logging and Threat Detection

*For more information, see the [Azure Security Benchmark: Logging and Threat Detection](/azure/security/benchmarks/security-controls-v2-logging-threat-detection).*

### LT-2: Enable threat detection for Azure identity and access management

**Guidance**: Forward any logs from Power BI to your SIEM which can be used to set up custom threat detections. Additionally, use Microsoft Cloud App Security (MCAS) controls in Power BI to enable anomaly detection using the guide [here](../admin/service-security-using-microsoft-cloud-app-security-controls.md).

- [Track user activities in Power BI](../admin/service-admin-auditing.md)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### LT-3: Enable logging for Azure network activities

**Guidance**: Power BI is a fully managed SaaS offering and the underlying network configuration and logging is Microsoft’s responsibility. For customers utilizing Private Links some logging and monitoring is available that can be configured.

- [Private Link logging and monitoring](/azure/private-link/private-link-overview#logging-and-monitoring)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Shared

### LT-4: Enable logging for Azure resources

**Guidance**: With
Power BI, you have two options to track user activity: The Power BI activity log and
the unified audit log. These logs both contain a complete copy
of the Power BI auditing data, but there are several key
differences, as summarized below.
 
Unified Audit Log:

 
- Includes events from SharePoint
     Online, Exchange Online, Dynamics 365, and other services in addition to
     the Power BI auditing events.

 
- Only users with View-Only Audit
     Logs or Audit Logs permissions have access, such as global admins and
     auditors.

 
- Global admins and auditors can
     search the unified audit log by using the Microsoft 365 Security Center
     and the Microsoft 365 Compliance Center.

 
- Global admins and auditors can
     download audit log entries by using Microsoft 365 Management APIs and
     cmdlets.

 
- Keeps audit data for 90 days.

 
- Retains audit data, even if the
     tenant is moved to a different Azure region.
 
Power BI Activity Log:

 
- Includes only the Power BI auditing events.

 
 
- Global admins and Power BI service admins
     have access.

 
- There's
     no user interface to search the activity log yet.

 
- Global
     admins and Power BI service admins can download activity log entries by
     using a Power BI REST API and management cmdlet.

 
- Keeps
     activity data for 30 days.

 
- Doesn't
     retain activity data when the tenant is moved to a different Azure region.

- [Power BI Auditing data](../admin/service-admin-auditing.md#operations-available-in-the-audit-and-activity-logs)

- [Power BI Activity Log](../admin/service-admin-auditing.md#use-the-activity-log)

- [Power BI Audit Log](../admin/service-admin-auditing.md#use-the-audit-log)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Shared

### LT-5: Centralize security log management and analysis

**Guidance**: Power BI, centralizes logs in two places: the Power BI activity log and the unified audit log. These logs both contain a complete copy of the Power BI auditing data, but there are several key differences, as summarized below.
 

Unified Audit Log:

- Includes events from SharePoint Online, Exchange Online, Dynamics 365, and other services in addition to the Power BI auditing events.

- Only users with View-Only Audit Logs or Audit Logs permissions have access, such as global admins and auditors.

- Global admins and auditors can search the unified audit log by using the Microsoft 365 Security Center and the Microsoft 365 Compliance Center.

- Global admins and auditors can download audit log entries by using Microsoft 365 Management APIs and cmdlets.

- Keeps audit data for 90 days.

- Retains audit data, even if the tenant is moved to a different Azure region.

 

Power BI Activity Log:

- Includes only the Power BI auditing events.

- Global admins and Power BI service admins have access.

- There's no user interface to search the activity log yet.

- Global admins and Power BI service admins can download activity log entries by using a Power BI REST API and management cmdlet.

- Keeps activity data for 30 days.

- Doesn't retain activity data when the tenant is moved to a different Azure region.

- [Power BI Auditing data](../admin/service-admin-auditing.md#operations-available-in-the-audit-and-activity-logs)

- [Power BI Activity Log](../admin/service-admin-auditing.md#use-the-activity-log)

- [Power BI Audit Log](../admin/service-admin-auditing.md#use-the-audit-log)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### LT-6: Configure log storage retention

**Guidance**: Configure your storage retention policies for your Office Audit logs according to your compliance, regulation, and business requirements.

- [Office Audit Log Retention Policies](/microsoft-365/compliance/audit-log-retention-policies)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

## Incident Response

*For more information, see the [Azure Security Benchmark: Incident Response](/azure/security/benchmarks/security-controls-v2-incident-response).*

### IR-1: Preparation – update incident response process for Azure

**Guidance**: Ensure your organization has processes to respond to security incidents, has updated these processes for Azure, and is regularly exercising them to ensure readiness.

- [Implement security across the enterprise environment](/azure/cloud-adoption-framework/security/security-top-10#4-process-update-incident-response-ir-processes-for-cloud)

- [Incident response reference guide](/microsoft-365/downloads/IR-Reference-Guide.pdf)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IR-2: Preparation – setup incident notification

**Guidance**: Set up security incident contact information in Azure Security Center. This contact information is used by Microsoft to contact you if the Microsoft Security Response Center (MSRC) discovers that your data has been accessed by an unlawful or unauthorized party. You also have options to customize incident alert and notification in different Azure services based on your incident response needs. 

- [How to set the Azure Security Center security contact](/azure/security-center/security-center-provide-security-contact-details)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IR-3: Detection and analysis – create incidents based on high quality alerts

**Guidance**: Ensure you have a process to create high-quality alerts and measure the quality of alerts. This allows you to learn lessons from past incidents and prioritize alerts for analysts, so they don’t waste time on false positives.

Monitor alerts related to Power BI in Microsoft Cloud App Security. High-quality alerts can be built based on experience from past incidents, validated community sources, and tools designed to generate and clean up alerts by fusing and correlating diverse signal sources.

- [Monitor alerts in Cloud App Security](/cloud-app-security/monitor-alerts)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IR-4: Detection and analysis – investigate an incident

**Guidance**: Build out an incident response guide for your organization. Conduct exercises to test your systems’ incident response capabilities on a regular cadence. Identify weak points and gaps and revise plan as needed.

Ensure that there are written incident response plans that define all roles of personnel as well as phases of incident handling/management from detection to post-incident review.

- [Incidents overview in Microsoft Threat Protection](/microsoft-365/security/mtp/incidents-overview)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IR-5: Detection and analysis – prioritize incidents

**Guidance**: Provide context to analysts on which incidents to focus on first based on alert severity and asset sensitivity. 

 
Microsoft Threat Protection applies correlation analytics and aggregates all related alerts and investigations from different products into one incident. Microsoft Threat Protection also triggers unique alerts on activities that can only be identified as malicious given the end-to-end visibility that Microsoft Threat Protection has across the entire estate and suite of products. By doing so, Microsoft Threat Protection narrates the broader attack story, allowing a security operations analyst to understand and deal with complex threats across the organization.

- [Prioritize incidents in Microsoft Threat Protection](/microsoft-365/security/mtp/incident-queue?view=o365-worldwide&preserve-view=true)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IR-6: Containment, eradication and recovery – automate the incident handling

**Guidance**: Automate manual repetitive tasks to speed up response time and reduce the burden on analysts. Manual tasks take longer to execute, slowing each incident and reducing how many incidents an analyst can handle. Manual tasks also increase analyst fatigue, which increases the risk of human error that causes delays, and degrades the ability of analysts to focus effectively on complex tasks.  
 
Use workflow automation features in Microsoft Threat Protection to automatically trigger investigations and remediation in response to incoming security alerts. 
 
- [Automated investigation and response in Microsoft Threat Protection](/microsoft-365/security/mtp/mtp-autoir)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

## Posture and Vulnerability Management

*For more information, see the [Azure Security Benchmark: Posture and Vulnerability Management](/azure/security/benchmarks/security-controls-v2-posture-vulnerability-management).*

### PV-1: Establish secure configurations for Azure services 

**Guidance**: Configure your Power BI service with the settings appropriate to your organization and security stance. Settings for access to the service, and content, as well as workspace and app security should be carefully considered. See Power BI Security and Data Protection in the Power BI Enterprise Deployment whitepaper.

- [Enterprise Deployment Whitepaper](https://aka.ms/PBIEnterpriseDeploymentWP)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### PV-2: Sustain secure configurations for Azure services

**Guidance**: Monitor your Power BI instance using the Power BI Admin REST APIs.

- [Power BI Admin REST APIs](/rest/api/power-bi/admin)

- [Power BI enterprise deployment whitepaper](https://aka.ms/PBIEnterpriseDeploymentWP)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### PV-8: Conduct regular attack simulation

**Guidance**: As required, conduct penetration testing or red team activities on your Azure resources and ensure remediation of all critical security findings.

Follow the Microsoft Cloud Penetration Testing Rules of Engagement to ensure your penetration tests are not in violation of Microsoft policies. Use Microsoft's strategy and execution of Red Teaming and live site penetration testing against Microsoft-managed cloud infrastructure, services, and applications.

- [Penetration testing in Azure](/azure/security/fundamentals/pen-testing)

- [Penetration Testing Rules of Engagement](https://www.microsoft.com/msrc/pentest-rules-of-engagement?rtc=1)

- [Microsoft Cloud Red Teaming](https://gallery.technet.microsoft.com/Cloud-Red-Teaming-b837392e)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Shared

## Backup and Recovery

*For more information, see the [Azure Security Benchmark: Backup and Recovery](/azure/security/benchmarks/security-controls-v2-backup-recovery).*

### BR-3: Validate all backups including customer-managed keys

**Guidance**: If you are using the Bring
Your Own Key (BYOK) feature in Power BI you need to periodically validate that
you can access and restore your customer-managed keys.

- [BYOK in Power BI](../admin/service-encryption-byok.md)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### BR-4: Mitigate risk of lost keys

**Guidance**: If you are using the Bring Your Own Key (BYOK) feature in Power BI you need to ensure the Key Vault controlling your customer-managed keys is configured with the guidance in the BYOK in Power BI documentation below. Enable soft delete and purge protection in Azure Key Vault to protect keys against accidental or malicious deletion.

- [BYOK in Power BI](../admin/service-encryption-byok.md)

- [How to enable soft delete and purge protection in Key Vault](/azure/storage/blobs/storage-blob-soft-delete?tabs=azure-portal)

For Gateway key resources ensure you are following the guidance in the Gateway recovery key documentation below.

- [On-premises data gateway recovery key](/data-integration/gateway/service-gateway-recovery-key)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

## Governance and Strategy

*For more information, see the [Azure Security Benchmark: Governance and Strategy](/azure/security/benchmarks/security-controls-v2-governance-strategy).*

### GS-1: Define asset management and data protection strategy 

**Guidance**: Ensure you document and communicate a clear strategy for continuous monitoring and protection of systems and data. Prioritize discovery, assessment, protection, and monitoring of business-critical data and systems. 

This strategy should include documented guidance, policy, and standards for the following elements: 

-	Data classification standard in accordance with the business risks

-	Security organization visibility into risks and asset inventory 

-	Security organization approval of Azure services for use 

-	Security of assets through their lifecycle

-	Required access control strategy in accordance with organizational data classification

-	Use of Azure native and third-party data protection capabilities

-	Data encryption requirements for in-transit and at-rest use cases

-	Appropriate cryptographic standards

For more information, see the following references:
- [Azure Security Architecture Recommendation - Storage, data, and encryption](/azure/architecture/framework/security/storage-data-encryption?amp;bc=%2fsecurity%2fcompass%2fbreadcrumb%2ftoc.json&toc=%2fsecurity%2fcompass%2ftoc.json)

- [Azure Security Fundamentals - Azure Data security, encryption, and storage](/azure/security/fundamentals/encryption-overview)

- [Cloud Adoption Framework - Azure data security and encryption best practices](/azure/security/fundamentals/data-encryption-best-practices?amp;bc=%2fazure%2fcloud-adoption-framework%2f_bread%2ftoc.json&toc=%2fazure%2fcloud-adoption-framework%2ftoc.json)

- [Azure Security Benchmark - Asset management](/azure/security/benchmarks/security-controls-v2-asset-management)

- [Azure Security Benchmark - Data Protection](/azure/security/benchmarks/security-controls-v2-data-protection)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### GS-2: Define enterprise segmentation strategy 

**Guidance**: Establish an enterprise-wide strategy to segmenting access to assets using a combination of identity, network, application, subscription, management group, and other controls.

Carefully balance the need for security separation with the need to enable daily operation of the systems that need to communicate with each other and access data.

Ensure that the segmentation strategy is implemented consistently across control types including network security, identity and access models, and application permission/access models, and human process controls.

- [Guidance on segmentation strategy in Azure (video)](/security/compass/microsoft-security-compass-introduction#azure-components-and-reference-model-2151)

- [Guidance on segmentation strategy in Azure (document)](/security/compass/governance#enterprise-segmentation-strategy)

- [Align network segmentation with enterprise segmentation strategy](/security/compass/network-security-containment#align-network-segmentation-with-enterprise-segmentation-strategy)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### GS-3: Define security posture management strategy

**Guidance**: Continuously measure and mitigate risks to your individual assets and the environment they are hosted in. Prioritize high value assets and highly-exposed attack surfaces, such as published applications, network ingress and egress points, user and administrator endpoints, etc.

- [Azure Security Benchmark - Posture and vulnerability management](/azure/security/benchmarks/security-controls-v2-posture-vulnerability-management)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### GS-4: Align organization roles, responsibilities, and accountabilities

**Guidance**: Ensure you document and communicate a clear strategy for roles and responsibilities in your security organization. Prioritize providing clear accountability for security decisions, educating everyone on the shared responsibility model, and educate technical teams on technology to secure the cloud.

- [Azure Security Best Practice 1 – People: Educate Teams on Cloud Security Journey](/azure/cloud-adoption-framework/security/security-top-10#1-people-educate-teams-about-the-cloud-security-journey)

- [Azure Security Best Practice 2 - People: Educate Teams on Cloud Security Technology](/azure/cloud-adoption-framework/security/security-top-10#2-people-educate-teams-on-cloud-security-technology)

- [Azure Security Best Practice 3 - Process: Assign Accountability for Cloud Security Decisions](/azure/cloud-adoption-framework/security/security-top-10#4-process-update-incident-response-ir-processes-for-cloud)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### GS-5: Define network security strategy

**Guidance**: Establish an Azure network security approach as part of your organization’s overall security access control strategy.  

This strategy should include documented guidance, policy, and standards for the following elements: 

-	Centralized network management and security responsibility

-	Virtual network segmentation model aligned with the enterprise segmentation strategy

-	Remediation strategy in different threat and attack scenarios

-	Internet edge and ingress and egress strategy

-	Hybrid cloud and on-premises interconnectivity strategy

-	Up-to-date network security artifacts (e.g. network diagrams, reference network architecture)

For more information, see the following references:
- [Azure Security Best Practice 11 - Architecture. Single unified security strategy](/azure/cloud-adoption-framework/security/security-top-10#11-architecture-establish-a-single-unified-security-strategy)

- [Azure Security Benchmark - Network Security](/azure/security/benchmarks/security-controls-v2-network-security)

- [Azure network security overview](/azure/security/fundamentals/network-overview)

- [Enterprise network architecture strategy](/azure/cloud-adoption-framework/ready/enterprise-scale/architecture)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### GS-6: Define identity and privileged access strategy

**Guidance**: Establish an Azure identity and privileged access approaches as part of your organization’s overall security access control strategy.  

This strategy should include documented guidance, policy, and standards for the following elements: 

-	A centralized identity and authentication system and its interconnectivity with other internal and external identity systems

-	Strong authentication methods in different use cases and conditions

-	Protection of highly privileged users

-	Anomaly user activities monitoring and handling  

-	User identity and access review and reconciliation process

For more information, see the following references:

- [Azure Security Benchmark - Identity management](/azure/security/benchmarks/security-controls-v2-identity-management)

- [Azure Security Benchmark - Privileged access](/azure/security/benchmarks/security-controls-v2-privileged-access)

- [Azure Security Best Practice 11 - Architecture. Single unified security strategy](/azure/cloud-adoption-framework/security/security-top-10#11-architecture-establish-a-single-unified-security-strategy)

- [Azure identity management security overview](/azure/security/fundamentals/identity-management-overview)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### GS-7: Define logging and threat response strategy

**Guidance**: Establish a logging and threat response strategy to rapidly detect and remediate threats while meeting compliance requirements. Prioritize providing analysts with high-quality alerts and seamless experiences so that they can focus on threats rather than integration and manual steps. 

This strategy should include documented guidance, policy, and standards for the following elements: 

-	The security operations (SecOps) organization’s role and responsibilities 

-	A well-defined incident response process aligning with NIST or another industry framework 

-	Log capture and retention to support threat detection, incident response, and compliance needs

-	Centralized visibility of and correlation information about threats, using SIEM, native Azure capabilities, and other sources 

-	Communication and notification plan with your customers, suppliers, and public parties of interest

-	Use of Azure native and third-party platforms for incident handling, such as logging and threat detection, forensics, and attack remediation and eradication

-	Processes for handling incidents and post-incident activities, such as lessons learned and evidence retention

For more information, see the following references:

- [Azure Security Benchmark - Logging and threat detection](/azure/security/benchmarks/security-controls-v2-logging-threat-detection)

- [Azure Security Benchmark - Incident response](/azure/security/benchmarks/security-controls-v2-incident-response)

- [Azure Security Best Practice 4 - Process. Update Incident Response Processes for Cloud](/azure/cloud-adoption-framework/security/security-top-10#4-process-update-incident-response-ir-processes-for-cloud)

- [Azure Adoption Framework, logging, and reporting decision guide](/azure/cloud-adoption-framework/decision-guides/logging-and-reporting/)

- [Azure enterprise scale, management, and monitoring](/azure/cloud-adoption-framework/ready/enterprise-scale/management-and-monitoring)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

## Next steps

- See the [Azure Security Benchmark V2 overview](/azure/security/benchmarks/overview)
- Learn more about [Azure security baselines](/azure/security/benchmarks/security-baselines-overview)