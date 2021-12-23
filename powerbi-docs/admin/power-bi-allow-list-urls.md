---
title: Add Power BI URLs to allowlist
description: This article lists URL endpoints and ports to add to your allowlist for connectivity to Power BI.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 09/01/2021
ms.custom: ''
---

# Add Power BI URLs to your allowlist
[//]: # "suparnap, miwehnia, natham are contacts for maintaining this list"

The Power BI service requires connectivity to the internet. The endpoints listed in the tables in this article should be reachable for customers using the Power BI service.

To use the Power BI service, you must be able to connect to the endpoints marked **required** in the tables below, and to any endpoints marked **required** on the linked sites. If the link to an external site refers to a specific section, you only need to review the endpoints in that section.

Endpoints marked **optional** may also be added to allowlists for specific functionality to work.

The Power BI service requires only TCP Port 443 to be opened for the listed endpoints.

Wildcards (*) represent all levels under the root domain, and we use N/A when information isn't available. The **Destination(s)** column lists domain names and links to external sites, which contain further endpoint information.

>[!Important]
>The information in the tables below doesn't apply to Power BI China operated by 21Vianet or Power BI for US government. Read [Connect government and global Azure cloud services](service-govus-overview.md#connect-government-and-global-azure-cloud-services) to learn more about communicating between cloud services.

## Authentication

Power BI depends on the required endpoints in the Microsoft 365 authentication and identity sections. To use Power BI, you must be able to connect to the endpoints in the linked site below.

| Row | Purpose | Destination(s) | Port(s) |
| --- | --- | --- | --- |
| 1 | **Required:** Authentication and identity | See the documentation for [Microsoft 365 Common and Office Online URLs](/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online)  | N/A |

## General site usage

For the general use of Power BI, you must be able to connect to the endpoints in the table and linked sites below.

| Row | Purpose | Destination(s) | Port(s) |
| --- | --- | --- | --- |
| 1 | **Required:** Backend APIs | api.powerbi.com | TCP 443 |
| 2 | **Required:** Backend APIs | *.analysis.windows.net | TCP 443 |
| 3 | **Required:** Backend APIs | *.pbidedicated.windows.net | TCP 443 |
| 4 | **Required:** Content Delivery Network (CDN) | content.powerapps.com | TCP 443 |
| 5 | **Required:** Microsoft 365 integration | See the documentation for [Microsoft 365 Common and Office Online URLs](/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) | N/A |
| 6 | **Required:** Portal | *.powerbi.com | TCP 443 |
| 7 | **Required:** Service telemetry | dc.services.visualstudio.com | TCP 443 |
| 8 | **Optional:** Informational messages | arc.msn.com | TCP 443 |
| 9 | **Optional:** NPS surveys | nps.onyx.azure.net | TCP 443 |
| | | |

## Administration

To perform administrative functions in Power BI, you must be able to connect to the endpoints in the linked sites below.

| Row | Purpose | Destination(s) | Port(s) |
| --- | --- | --- | --- |
| 1 | **Required:** For managing users and viewing audit logs | See the documentation for [Microsoft 365 Common and Office Online URLs](/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) | N/A |
| | | |

## Getting data

To get data from specific data sources, such as OneDrive, you must be able to connect to the endpoints in the table below. Access to additional internet domains and URLs may be required for specific data sources used in your organization.

| Row | Purpose | Destination(s) | Port(s) |
| --- | --- | --- | --- |
| 1 | **Required:** AppSource (internal or external apps in Power BI) | appsource.microsoft.com <br> *.s-microsoft.com  | TCP 443 |
| 2 | **Optional:** Import files From OneDrive personal | See the [Required URLs and ports for OneDrive site](/onedrive/required-urls-and-ports) | N/A |
| 4 | **Optional:** Power BI in 60-Seconds tutorial video | *.doubleclick.net <br> *.ggpht.com <br> *.google.com <br> *.googlevideo.com <br> *.youtube.com <br> *.ytimg.com <br> fonts.gstatic.com | TCP 443 |
| 5 | **Optional:** PubNub streaming data sources | See the [PubNub documentation](https://support.pubnub.com/hc/en-us/categories/360004336832-PubNub-101) | N/A |
| | | |

## Dashboard and report integration

Power BI depends on certain endpoints to support your dashboards and reports. You must be able to connect to the endpoints in the table and linked sites below.

| Row | Purpose | Destination(s) | Port(s) |
| --- | --- | --- | --- |
| 1 | **Required:** Excel integration | See the documentation for [Microsoft 365 Common and Office Online URLs](/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) | N/A |
| | | |

## Power BI visuals

Power BI depends on certain endpoints to view and access Power BI visuals. You must be able to connect to the endpoints in the table and linked sites below.

| Row | Purpose | Destination(s) | Port(s) |
| --- | --- | --- | --- |
| 1 | **Required:** Import a custom visual from the Marketplace interface or from a file | *.azureedge.net <br> *.blob.core.windows.net <br> *.osi.office.net <br> *.msecnd.net <br> store.office.com <br> web.vortex.data.microsoft.com <br> store-images.s-microsoft.com | TCP 443 |
| 2 | **Optional:** Bing Maps | bing.com <br> platform.bing.com <br> *.virtualearth.net | TCP 443 |
| 3 | **Optional:** PowerApps | See the [Required services section](/powerapps/maker/canvas-apps/limits-and-config#required-services) from the PowerApps system requirements site | N/A |
| 4 | **Optional:** Visio | See the documentation for [Microsoft 365 Common and Office Online URLs](/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online), as well as [SharePoint Online and OneDrive for Business](/office365/enterprise/urls-and-ip-address-ranges#sharepoint-online-and-onedrive-for-business) | N/A |
| | | |

## Related external sites

Power BI links to other related sites. These sites host documentation, support, new feature requests, and more. Access to these sites won't affect the functionality of Power BI, so adding them to allowlists is optional.

| Row | Purpose | Destination(s) | Port(s) |
| --- | --- | --- | --- |
| 1 | **Optional:** Community site | community.powerbi.com <br> oxcrx34285.i.lithium.com | TCP 443 |
| 2 | **Optional:** Documentation site | docs.microsoft.com <br> img-prod-cms-rt-microsoft-com.akamaized.net <br> statics-uhf-eas.akamaized.net <br> cdnssl.clicktale.net <br> ing-district.clicktale.net | TCP 443 |
| 3 | **Optional:** Download site (for Power BI Desktop, etc.) | download.microsoft.com | TCP 443 |
| 4 | **Optional:** External redirects | aka.ms <br> go.microsoft.com | TCP 443 |
| 5 | **Optional:** Ideas feedback site| ideas.powerbi.com <br> powerbi.uservoice.com | TCP 443 |
| 6 | **Optional:** Power BI site - landing page, learn more links, support site, download links, partner showcase, and so on. | powerbi.microsoft.com | TCP 443 |
| 7 | **Optional:** Power BI Developer Center | dev.powerbi.com | TCP 443 |
| 8 | **Optional:** Support site | support.powerbi.com <br> s3.amazonaws.com <br> *.olark.com <br> logx.optimizely.com <br> mscom.demdex.net <br> tags.tiqcdn.com | TCP 443 |
| | | |
