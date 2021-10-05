---
title: Power BI for US government customers - Overview
description: US government customers can add a Power BI subscription to their Microsoft 365 government plan. Learn how to sign up, connect, and review feature availability in this service description. 
author: kfollis
ms.author: kfollis
ms.reviewer: dodruker; jonp
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 10/03/2021
ms.custom: gcc
LocalizationGroup: Get started
---

# Power BI for US government customers

This article is for US government customers who are deploying Power BI as part of a Microsoft 365 Government plan. Government plans are designed for the unique needs of organizations that must meet US compliance and security standards. 

The Power BI service that's designed for US government customers differs from the commercial version of the Power BI service. These feature differences and capabilities are described in the following sections.

> [!NOTE]
> Before you can get a Power BI US government subscription and assign licenses to users, you have to enroll in a Microsoft 365 Government plan. If your organization already has a Microsoft 365 Government plan, skip ahead to [Buy a Power BI Pro subscription for government customers](#buy-a-power-bi-pro-subscription-for-government-customers).
>

## Government cloud instances

If you're a new customer, you have to validate your organization's eligibility before you can sign up for a Microsoft 365 Government plan.  Get started by completing the [Microsoft 365 for Government eligibility validation form](https://www.microsoft.com/microsoft-365/government/eligibility-validation). 

Microsoft 365 provides different environments for government agencies to meet varying compliance requirements. To ensure that you're selecting the right plan for your organization, consult the Microsoft 365 US Government service description for each environment:

* [Microsoft 365 Government Community Cloud (GCC)](/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc) is designed for federal, state, and local government.

* [Microsoft 365 Government Community Cloud High (GCC High)](/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod) is designed for federal agencies, defense industry, aerospace industry, and other organizations that hold controlled unclassified information. This environment is suited for national security organizations and companies that have International Traffic in Arms Regulations (ITAR) data or Defense Federal Acquisition Regulations Supplement (DFARS) requirements.

* The [Microsoft 365 DoD environment](/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod) is designed exclusively for the US Department of Defense.


> [!NOTE]
> If you've already deployed Power BI to a commercial environment and want to migrate to the US government cloud, you'll need to add a new Power BI Pro or Premium Per User (PPU) subscription to your Microsoft 365 Government plan. Next, replicate the commercial data to the Power BI service for US government, remove commercial license assignments from user accounts, and then assign a Power BI Pro government license to the user accounts.
>
>
### Buy a Power BI Pro subscription for government customers

After you've deployed Microsoft 365, you can add a Power BI Pro subscription. To buy the Power BI Pro government service, follow the guidance in [Enroll your US government organization](service-govus-signup.md). Buy enough licenses for all the users who need to use Power BI, and then assign the licenses to individual user accounts.

> [!IMPORTANT]
> Power BI US Government isn't available as a *Free* license. To access the government community cloud, each user must be assigned a *Pro* or *Premium Per User (PPU)* license. If a user account has been assigned a Free license, the user is authorized to access only the commercial cloud and will encounter authentication and access issues. 
> 
> If you've purchased Power BI Premium, you don't have to assign Pro licenses to allow users to consume content.  Users in the organization can view reports that are shared with them, as long as the reports are published to a Premium capacity. Content creators still need to be assigned a Pro license.
> 
> To review the differences between license types, see [Power BI service features by license type](../fundamentals/service-features-license-type.md).
>

## Sign in to Power BI for US government

The URLs for connecting to Power BI differ for government users and commercial users. To sign in to the correct Power BI version, use one of the following URLs:

* **Commercial version**: https://app.powerbi.com 
* **GCC**: https://app.powerbigov.us
* **GCC High**: https://app.high.powerbigov.us
* **DoD**: https://app.mil.powerbigov.us

Your account might be set up in more than one cloud. If your account is set up that way, when you sign in to Power BI Desktop, you can choose which cloud to connect to.

>[!TIP]
>In this video, [Using Power BI Desktop in government clouds](https://www.youtube.com/watch?v=CTMG1OE17uk), Technical Specialist Steve Winward shows how you can apply a registry setting to go directly to the right cloud endpoint for your environment. The [registry key settings](https://github.com/microsoft/Federal-Business-Applications/tree/main/whitepapers/power-bi-registry-settings) to bypass the global discovery endpoint are shared on GitHub.
>

## Allow connections to Power BI

To use the Power BI service, you must allow connections to required endpoints on the internet. These destinations have to be reachable to enable communication between your own network, Power BI, and other dependent services.

The following table lists the required endpoints to add to your allowlist to enable connection to the Power BI service for general site usage. These endpoints are unique to the US government cloud. The Power BI service requires only Transmission Control Protocol (TCP) port 443 to be opened for the listed endpoints. 

The endpoints for getting data, dashboard and report integration, Power BI visuals, and other optional services aren’t unique to the US government cloud. 

To add these URLs to your allowlist also, see [Add Power BI URLs to your allowlist](power-bi-allow-list-urls.md).

Authentication, identity, and administration for Power BI depend on connectivity to Microsoft 365 services. You also have to connect to Microsoft 365 to view audit logs. To identify the endpoints for these services, see "Microsoft 365 integration" in the following table:

### Power BI URLs for general site usage

|  Purpose | Destination |
| ---- | ----- |
| Back-end APIs | **GCC**: api.powerbigov.us<br>**GCC High**: api.high.powerbigov.us<br>**DoD**: api.mil.powerbigov.us |
| Back-end APIs | **GCC**: *.analysis.usgovcloudapi.net<br>**GCC High**: *.high.analysis.usgovcloudapi.net<br>**DoD**: *.mil.analysis.usgovcloudapi.net |
| Back-end APIs | **All**: *.pbidedicated.usgovcloudapi.net |
| Content Delivery Network (CDN) | **GCC**: gov.content.powerapps.us<br>**GCC High**: high.content.powerapps.us<br>**DoD**: mil.content.powerapps.us |
| Microsoft 365 integration | **GCC**: [Worldwide endpoints](/microsoft-365/enterprise/urls-and-ip-address-ranges)<br>**GCC High**: [US Government GCC High endpoints](/microsoft-365/enterprise/microsoft-365-u-s-government-gcc-high-endpoints)<br>**DoD**: [US Government DOD endpoints](/microsoft-365/enterprise/microsoft-365-u-s-government-dod-endpoints) |
| Portal |**GCC**: *.powerbigov.us<br>**GCC High**: *.high.powerbigov.us<br>**DoD**: *.mil.powerbigov.us |
| Service telemetry | **All**: dc.services.visualstudio.us |
| Informational messages (optional) | **All**: arc.msn.com |
| | |

<br>

## Connect government and global Azure cloud services

Azure is distributed across multiple clouds. By default, you can enable firewall rules to open a connection to a cloud-specific instance, but cross-cloud networking is different. To communicate between services in the public cloud and services in the Government Community Cloud, you have to configure specific firewall rules. For example, if you want to access public cloud instances of a SQL database from your government cloud deployment of Power BI, you need a firewall rule in the SQL database. Configure specific firewall rules for SQL databases to allow connections to the Azure Government Cloud for the following datacenters:

* USGov Iowa
* USGov Virginia
* USGov Texas
* USGov Arizona
* US DoD East
* US DoD Central

To get the US government cloud IP ranges, download the [Azure IP Ranges and Service Tags – US Government Cloud](https://www.microsoft.com/download/details.aspx?id=57063) file. Ranges are listed for both Power BI and Power Query.

For more information about Microsoft Azure Government cloud services, see [Azure Government documentation](/azure/azure-government/).

To set up firewalls for SQL databases, see [Create and manage IP firewall rules](/azure/sql-database/sql-database-firewall-configure#create-and-manage-ip-firewall-rules).

## Power BI feature availability

To accommodate the requirements of government cloud customers, government plans differ from commercial plans in some respects. Our goal is to make all features available in government clouds within 30 days of general availability. In a few cases, underlying dependencies prevent us from making a feature available. 

The following table lists features that aren't yet available in a particular government environment or that are available with limited functionality. The table uses the following keys:

| Key | Description |
|-----|------|
|![Image of an "Available" button, a checkmark indicating that the listed item is available.](../media/yes.png)|The feature is available in the environment, and any exceptions are defined in footnotes.|
|![Image of a "Not available" button, an "x" sign indicating that the listed item is not available.](../media/no.png)| The feature isn't available in the environment, and we don't have an estimated time frame for delivery.|
| | |

If a release is planned for an environment, we include the quarter of estimated availability.

|Feature |GCC |GCC High |DoD|
|------|------|------|------|
|[Azure B2B collaboration between government and commercial cloud](service-admin-azure-ad-b2b.md)<sup>1</sup>|![Image of "Available" button.](../media/yes.png)|![Image of "Available" button.](../media/yes.png)|![Image of "Available" button.](../media/yes.png)
|[Template apps](../connect-data/service-template-apps-overview.md)<sup>2</sup>|![Image of "Available" button.](../media/yes.png) |![Image of "Available" button.](../media/yes.png)| ![Image of "Available" button.](../media/yes.png)|
|[Embed in SharePoint Online by using the Power BI web part](/sharepoint/dev/spfx/web-parts/overview-client-side-web-parts)|![Image of "Available" button.](../media/yes.png)|![Image of "Available" button.](../media/yes.png)|![Image of "Not available" button.](../media/no.png)|
|[Data Protection (MIP labels)](service-security-sensitivity-label-overview.md)|![Image of "Available" button.](../media/yes.png)|![Image of "Available" button.](../media/yes.png) |![Image of "Available" button.](../media/yes.png)|
|[Dataflows - Direct Query](../transform-model/dataflows/dataflows-configure-consume.md) | ![Image of "Available" button.](../media/yes.png) |![Image of "Available" button.](../media/yes.png)|Not planned |
|[Dataflows - SQL Compute engine optimization](../transform-model/dataflows/dataflows-premium-features.md) | ![Image of "Available" button.](../media/yes.png) |![Image of "Available" button.](../media/yes.png)|Not planned |
|[Power BI tab in Teams](../collaborate-share/service-collaborate-microsoft-teams.md)<sup>3</sup>|![Image of "Available" button.](../media/yes.png)|![Image of "Not available" button.](../media/no.png)|![Image of "Not available" button.](../media/no.png)|
|[Large models](service-premium-large-models.md) | ![Image of "Available" button.](../media/yes.png) |![Image of "Available" button.](../media/yes.png)| Not planned |
|[Call Quality Data Connector](/microsoftteams/cqd-power-bi-connector)|CY2022-H1|CY2022-H1|CY2022-H1|
|[Bring your own storage (Azure Data Lake Gen 2)](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md)|![Image of "Not available" button.](../media/no.png)|![Image of "Available" button.](../media/yes.png)|![Image of "Available" button.](../media/yes.png)|
|[Autoscale](service-premium-auto-scale.md) |![Image of "Not available" button.](../media/no.png) |![Image of "Not available" button.](../media/no.png) |![Image of "Not available" button.](../media/no.png) |
|Tenant metadata scanning flow<sup>4</sup>|![Image of "Not available" button.](../media/no.png)|![Image of "Not available" button.](../media/no.png)|![Image of "Not available" button.](../media/no.png)|

<sup>1</sup> Although B2B collaboration is available for GCC, external users must be issued a license in that environment. Commercial cloud licenses aren't valid in GCC. For more information about known limitations with B2B collaboration for US government, see [Compare Azure Government and global Azure](/azure/azure-government/compare-azure-government-global-azure#azure-active-directory-premium-p1-and-p2).

<sup>2</sup> Because marketplace apps aren't available to US government cloud instances, template apps are limited to private and organizational apps.

<sup>3</sup> The Power BI experience in Teams for GCC is limited. It works only for classic workspaces and doesn't include the enhanced functionality that's described in [Embed Power BI content in Microsoft Teams](../collaborate-share/service-embed-report-microsoft-teams.md).

## Next steps

* Article: [Sign up for Power BI for US government](service-govus-signup.md)
* Article: [Microsoft Power Apps US Government](/power-platform/admin/powerapps-us-government)
* Article: [Power Automate US Government](/power-automate/us-govt)
* Video: [Power BI US Government](https://channel9.msdn.com/Blogs/Azure/Cognitive-Services-HDInsight-and-Power-BI-on-Azure-Government) demo
