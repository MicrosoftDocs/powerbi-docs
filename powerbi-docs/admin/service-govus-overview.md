---
title: Power BI for US government customers - Overview
description: US government customers can add a Power BI Pro subscription to their Microsoft 365 government plan. Learn how to sign up, connect, and review feature availability in this service description. 
author: kfollis
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 09/23/2020
ms.author: kfollis
ms.custom: licensing support

LocalizationGroup: Get started
---

# Power BI for US government customers

This article is for US government customers who are deploying Power BI as part of a Microsoft 365 Government plan. Government plans are designed for the unique needs of organizations that must meet US compliance and security standards. The Power BI service that's designed for US government customers differs from the commercial version of the Power BI service. These feature differences and capabilities are described in the following sections.

## Add Power BI to your Microsoft 365 Government plan

Before you can get a Power BI US government subscription and assign licenses to users, you have to enroll in a Microsoft 365 Government plan. If your organization already has a Microsoft 365 Government plan, skip ahead to [Buy a Power BI Pro subscription for government customers](#buy-a-power-bi-pro-subscription-for-government-customers).

### Enroll in a Microsoft 365 Government plan

If you're a new customer, you have to validate your organization's eligibility before you can sign up for a Microsoft 365 Government plan.  Get started by completing the [Microsoft 365 for Government eligibility validation form](https://www.microsoft.com/microsoft-365/government/eligibility-validation). To ensure that you're selecting the right plan for your organization, consult the [Microsoft 365 US Government service descriptions](/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/office-365-us-government).

> [!NOTE]
> If you've already deployed Power BI to a commercial environment and want to migrate to the US government cloud, you'll need to add a new Power BI Pro subscription to your Microsoft 365 Government plan. Next, replicate the commercial data to the Power BI service for US government, remove commercial license assignments from user accounts, and then assign a Power BI Pro government license to the user accounts.
>
>
### Buy a Power BI Pro subscription for government customers

After you've deployed Microsoft 365, you can add a Power BI Pro subscription. Follow the step-by-step guidance in [Enroll your US government organization](service-govus-signup.md) to buy the Power BI Pro government service. Buy enough licenses for all the users who need to use Power BI, and then assign the licenses to individual user accounts.

> [!IMPORTANT]
> Power BI US Government isn't available as a *Free* license. To access the government community cloud, each user must be assigned a *Pro* license. If a user account has been assigned a Free license, the user is authorized to access only the commercial cloud and will encounter authentication and access issues. If you've purchased Power BI Premium, you don't have to assign Pro licenses to enable user access.  Users in the organization can access reports that are shared with them as long as the reports are published to a Premium capacity. To review the differences between license types, see [Power BI service features by license type](../fundamentals/service-features-license-type.md).
>

## Government cloud instances

Microsoft 365 provides different environments for government agencies to meet varying compliance requirements. For more information about each environment, see:

* [Microsoft 365 Government Community Cloud (GCC)](/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc) is designed for federal, state, and local government.

* [Microsoft 365 Government Community Cloud High (GCC High)](/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod) is designed for federal agencies, defense industry, aerospace industry, and other organizations that hold controlled unclassified information. This environment is suited for national security organizations and companies that have International Traffic in Arms Regulations (ITAR) data or Defense Federal Acquisition Regulations Supplement (DFARS) requirements.

* The [Microsoft 365 DoD environment](/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod) is designed exclusively for the US Department of Defense.


## Sign in to Power BI for US government

The URL for connecting to Power BI differs for government users and commercial users. To sign in to Power BI, use the following URLs:

| Commercial version  | GCC  | GCC High | DoD |
| --- | --- | --- | --- |
| [https://app.powerbi.com/](https://app.powerbi.com) |[https://app.powerbigov.us](https://app.powerbigov.us) | [https://app.high.powerbigov.us](https://app.high.powerbigov.us) | [https://app.mil.powerbigov.us](https://app.mil.powerbigov.us) |

Your account might be set up in more than one cloud. If your account is set up that way, when you sign in to Power BI Desktop, you can choose which cloud to connect to.

## Allow connections to Power BI

To use the Power BI service, you must allow connections to required endpoints on the internet. These destinations have to be reachable to enable communication between your own network, Power BI, and other dependent services.

In the table below, we list the required endpoints to add to your allow list to enable connection to the Power BI service for general site usage. These endpoints are unique to the US government cloud. The Power BI service requires only TCP Port 443 to be opened for the listed endpoints. The endpoints for getting data, dashboard and report integration, Power BI visuals, and other optional services aren’t unique to the US government cloud. To also add these URLs to your allow list, see [Add Power BI URLs to your allow list](power-bi-whitelist-urls.md).

Authentication, identity, and administration for Power BI depend on connectivity to Microsoft 365 services. You also have to connect to Microsoft 365 to view audit logs. To identify the endpoints for these services, see Microsoft 365 integration in the table below.

### Power BI URLs for general site usage

|  Purpose | Destination |
| ---- | ----- |
| Backend APIs | **GCC**: api.powerbigov.us |
| | **GCC-High**: api.high.powerbigov.us |
| | **DoD**: api.mil.powerbi.gov.us |
| Backend APIs | **GCC**: *analysis.usgovcloudapi.net |
| | **GCC High**: *.high.analysis.usgovcloudapi.net |
| | **DoD**: *.mil.analysis.usgovcloudapi.net |
| Backend APIs | **All**: *.pbidedicated.usgovcloudapi.net |
| Content Delivery Network (CDN) | **GCC**: gov.content.powerapps.us |
| | **GCC High**: high.content.powerapps.us |
| | **DoD**: mil.content.powerapps.us |
| Microsoft 365 integration | **GCC**: [Worldwide endpoints](/microsoft-365/enterprise/urls-and-ip-address-ranges) |
| | **GCC High**: [US Government GCC High endpoints](/microsoft-365/enterprise/microsoft-365-u-s-government-gcc-high-endpoints) |
| | **DoD**: [US Government DOD endpoints](/microsoft-365/enterprise/microsoft-365-u-s-government-dod-endpoints) |
| Portal |**GCC**: *.powerbigov.us |
| | **GCC-High**: *.high.powerbigov.us |
| | **DoD**: *.mil.powerbigov.us |
| Service telemetry | **All**: dc.services.visualstudio.us |
| Informational messages (optional) | **All**: dynmsg.modpim.com |
| NPS surveys (optional) | **All**: nps.onyx.azure.net |

## Connect government and global Azure cloud services

Azure is distributed across multiple clouds. By default, you can enable firewall rules to open a connection to a cloud-specific instance, but cross-cloud networking is different.  To communicate between services in the public cloud and services in the Government Community Cloud, you have to configure specific firewall rules. For example, if you want to access public cloud instances of a SQL database from your government cloud deployment of Power BI, you need a firewall rule in the SQL database. Configure specific firewall rules for SQL databases to allow connections to the Azure Government Cloud for the following datacenters:

* USGov Iowa
* USGov Virginia
* USGov Texas
* USGov Arizona
* US DoD East
* US DoD Central

To get the US government cloud IP ranges, download the [Azure IP Ranges and Service Tags – US Government Cloud](https://www.microsoft.com/download/details.aspx?id=57063) file. ranges are listed for both Power BI and Power Query.

For more information about Microsoft Azure Government cloud services, see [Azure Government documentation](/azure/azure-government/).

To set up firewalls for SQL databases, see [Create and manage IP firewall rules](/azure/sql-database/sql-database-firewall-configure#create-and-manage-ip-firewall-rules).

## Power BI feature availability

To accommodate the requirements of government cloud customers, there are some differences between government plans and commercial plans. Our goal is to make all features available in government clouds within 30 days of general availability. In some cases, underlying dependencies prevent us from making a feature available.

The following table lists features that aren't available in a particular government environment. We include estimated availability if release is planned:

|Feature |GCC |GCC High |DoD|
|------|------|------|------|
|[Azure B2B Collaboration between government and commercial cloud](service-admin-azure-ad-b2b.md)<sup>1</sup>|![available](../media/yes.png)|![not available](../media/no.png)|![not available](../media/no.png)|
|[Embed in SharePoint Online using the Power BI web part](/sharepoint/dev/spfx/web-parts/overview-client-side-web-parts)|![available](../media/yes.png)|![Available](../media/yes.png)|![not available](../media/no.png)|
|[Power Automate connectivity for data-driven alerts](../connect-data/power-bi-data-sources.md)|![available](../media/yes.png)|![available](../media/yes.png)|![not available](../media/no.png)|
|[Power BI tab in Teams](../collaborate-share/service-collaborate-microsoft-teams.md)<sup>2</sup>|![available](../media/yes.png)|![not available](../media/no.png)|![not available](../media/no.png)|
|[Large models](service-premium-large-models.md) | Q4 2020 |Q4 2020| ![not available](../media/no.png) |
|[Dataflows - SQL Compute engine optimization](../transform-model/service-dataflows-enhanced-compute-engine.md) | Q4 2020 |Q4 2020| ![not available](../media/no.png) |
|[Dataflows - Direct Query](../transform-model/service-dataflows-directquery.md) | Q4 2020 |Q4 2020|![not available](../media/no.png)|
|[Service interruption notifications](service-premium-large-models.md)|Q4 2020 |Q4 2020|Q4 2020|
|[Data Protection (MIP labels)](service-security-sensitivity-label-overview.md)|Q4 2020|Q4 2020 |Q4 2020|
|[Template apps](../connect-data/service-template-apps-overview.md)<sup>3</sup>|Q4 2020 |Q4 2020| Q4 2020|
|[Custom Visuals](../developer/visuals/power-bi-custom-visuals.md)<sup>3</sup>|Q4 2020 |Q4 2020| Q4 2020|
|[Call Quality Data Connector](/microsoftteams/cqd-power-bi-connector)|![not available](../media/no.png)|![not available](../media/no.png)|![not available](../media/no.png)|
|[QR Code generation](../create-reports/service-create-qr-code-for-tile.md)|![not available](../media/no.png)|![not available](../media/no.png)|![not available](../media/no.png)|

<sup>1</sup> Although B2B Collaboration is available for GCC, the external user must be issued a license in that environment. Commercial cloud licenses aren't valid in GCC. For more information about known limitations with B2B Collaboration for US government, [Compare Azure Government and global Azure](/azure/azure-government/compare-azure-government-global-azure#azure-active-directory-premium-p1-and-p2)

<sup>2</sup> The Power BI experience in Teams for GCC is limited, works only for classic workspaces, and doesn't include the enhanced functionality described in [Embed Power BI Content in Microsoft Teams](../collaborate-share/service-embed-report-microsoft-teams.md).

<sup>3</sup> The functionality for Template Apps and Custom Visuals on release will be limited for government clouds. More information about specific limitations will be published at release.

## Next steps

* [Sign up for Power BI for US government](service-govus-signup.md)
* [Microsoft Power Apps US Government](/power-platform/admin/powerapps-us-government)
* [Power Automate US Government](/power-automate/us-govt)
* [Power BI US Government Demo](https://channel9.msdn.com/Blogs/Azure/Cognitive-Services-HDInsight-and-Power-BI-on-Azure-Government)
