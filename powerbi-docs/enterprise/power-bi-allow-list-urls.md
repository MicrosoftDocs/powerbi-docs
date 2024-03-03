---
title: Add Power BI URLs to allowlist
description: Learn about URL endpoints and ports with their associated linked sites to add to your allowlist for connectivity to Power BI.
author: kesharab
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 09/29/2023
ms.custom: ''
---

# Add Power BI URLs to your allowlist

[//]: # "suparnap, miwehnia, natham are contacts for maintaining this list."

The Power BI service requires internet connectivity. The endpoints listed in the following tables should be reachable for customers who use the Power BI service.

To use the Power BI service, you must be able to connect to the endpoints marked **required** in the tables in this article, and to any endpoints marked **required** on the linked sites. If the link to an external site refers to a specific section, you only need to review the endpoints in that section.

You can also add endpoints that are marked **optional** to allowlists for specific functionality to work.

The Power BI service requires only TCP Port 443 to be opened for the listed endpoints.

Wildcards (*) represent all levels under the root domain. N/A is used when information isn't available. The **Destination(s)** column lists domain names and links to external sites, which contain further endpoint information.

>[!Important]
>The information in this article doesn't apply to Power BI China operated by 21Vianet or Power BI for US government. Read [Connect government and global Azure cloud services](../enterprise/service-govus-overview.md#connect-government-and-global-azure-cloud-services) to learn more about communicating between cloud services.

## Authentication

Power BI depends on the required endpoints in the Microsoft 365 authentication and identity sections. To use Power BI, you must be able to connect to the endpoints in the following linked site.

| Purpose | Destination | Port |
| --- | --- | --- |
| **Required:** Authentication and identity | See the documentation for [Microsoft 365 Common and Office Online URLs](/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online)  | N/A |

## General site usage

For the general use of Power BI, you must be able to connect to the endpoints and linked sites in the following table.

| Purpose | Destination | Port |
| --- | --- | --- |
| **Required:** Backend APIs | api.powerbi.com | TCP 443 |
| **Required:** Backend APIs | *.analysis.windows.net | TCP 443 |
| **Required:** Backend APIs | *.pbidedicated.windows.net | TCP 443 |
| **Required:** Content Delivery Network (CDN) | content.powerapps.com | TCP 443 |
| **Required:** Datamart SQL | One of the following:<li>datamart.fabric.microsoft.com</li><li>datamart.pbidedicated.windows.net</li> | 1433 |
| **Required:** Microsoft 365 integration | See the documentation for [Microsoft 365 Common and Office Online URLs](/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) | N/A |
| **Required:** Portal | *.powerbi.com | TCP 443 |
| **Required:** Manage gateways, connections and data policies (preview) | gatewayadminportal.azure.com | TCP 443 |
| **Required:** Service telemetry | dc.services.visualstudio.com | TCP 443 |
| **Optional:** Informational messages | arc.msn.com | TCP 443 |
| **Optional:** NPS surveys | nps.onyx.azure.net | TCP 443 |

## Administration

To perform administrative functions in Power BI, you must be able to connect to the endpoints in the following linked sites.

| Purpose | Destination | Port |
| --- | --- | --- |
| **Required:** For managing users and viewing audit logs | See the documentation for [Microsoft 365 Common and Office Online URLs](/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) | N/A |

## Getting data

To get data from specific data sources, such as OneDrive, you must be able to connect to the endpoints in the following table. Access to other internet domains and URLs might be required for specific data sources that your organization uses.

| Purpose | Destination | Port |
| --- | --- | --- |
| **Required:** AppSource (internal or external apps in Power BI) | appsource.microsoft.com <br> *.s-microsoft.com  | TCP 443 |
| **Optional:** Import files From OneDrive personal | See the [Required URLs and ports for OneDrive site](/onedrive/required-urls-and-ports) | N/A |
| **Optional:** Power BI in 60-Seconds tutorial video | *.doubleclick.net <br> *.ggpht.com <br> *.google.com <br> *.googlevideo.com <br> *.youtube.com <br> *.ytimg.com <br> fonts.gstatic.com | TCP 443 |
| **Optional:** PubNub streaming data sources | See the [PubNub documentation](https://support.pubnub.com/hc/en-us/categories/360004336832-PubNub-101) | N/A |

## Dashboard and report integration

Power BI depends on certain endpoints to support your dashboards and reports. You must be able to connect to the endpoints and linked sites in the following table.

| Purpose | Destination | Port |
| --- | --- | --- |
| **Required:** Excel integration | See the documentation for [Microsoft 365 Common and Office Online URLs](/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) | N/A |

## Power BI visuals

Power BI depends on certain endpoints to view and access Power BI visuals. You must be able to connect to the endpoints and linked sites in the following table.

| Purpose | Destination | Port |
| --- | --- | --- |
| **Required:** Import a custom visual from the Marketplace interface or from a file | *.powerbi.com <br> *.osi.office.net <br> *.msecnd.net <br> store.office.com <br> store-images.s-microsoft.com <br> visuals.azureedge.net | TCP 443 |
| **Optional:**  Azure Maps | `https://atlas.microsoft.com`<br>`https://us.atlas.microsoft.com`<br>`https://eu.atlas.microsoft.com` | N/A |
| **Optional:** Bing Maps | bing.com <br> platform.bing.com <br> r.bing.com <br> *.virtualearth.net | TCP 443 |
| **Optional:** Esri Maps | *.esri.com <br> *.arcgis.com | TCP 443 |
| **Optional:** PowerApps | See the [Required services section](/powerapps/maker/canvas-apps/limits-and-config#required-services) from the PowerApps system requirements site | N/A |
| **Optional:** Visio | See the documentation for [Microsoft 365 Common and Office Online URLs](/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online), as well as [SharePoint Online and OneDrive for work or school](/office365/enterprise/urls-and-ip-address-ranges#sharepoint-online-and-onedrive-for-business) | N/A |

## Power BI OneDrive and SharePoint integration

Power BI depends on certain endpoints to support integration with OneDrive for Business and SharePoint Online. You must be able to connect to the endpoints and linked sites in the following table.

| Purpose | Destination | Port |
| --- | --- | --- |
| **Required:** OneDrive and SharePoint integration | See the documentation for  [SharePoint Online and OneDrive for Business URLs](/office365/enterprise/urls-and-ip-address-ranges##sharepoint-online-and-onedrive-for-business) | N/A |

## Related external sites

Power BI links to other related sites. These sites host documentation, support, new feature requests, and more. Access to these sites doesn't affect the functionality of Power BI, so adding them to allowlists is optional.

| Purpose | Destination | Port |
| --- | --- | --- |
| **Optional:** Community site | community.powerbi.com <br> oxcrx34285.i.lithium.com | TCP 443 |
| **Optional:** Documentation site | learn.microsoft.com <br> img-prod-cms-rt-microsoft-com.akamaized.net <br> statics-uhf-eas.akamaized.net <br> cdnssl.clicktale.net <br> ing-district.clicktale.net | TCP 443 |
| **Optional:** Download site (for Power BI Desktop and other products) | download.microsoft.com | TCP 443 |
| **Optional:** External redirects | aka.ms <br> go.microsoft.com | TCP 443 |
| **Optional:** Ideas feedback site| ideas.powerbi.com <br> powerbi.uservoice.com | TCP 443 |
| **Optional:** Power BI site - landing page, learn more links, support site, download links, partner showcase, and so on. | powerbi.microsoft.com | TCP 443 |
| **Optional:** Power BI Developer Center | dev.powerbi.com | TCP 443 |
| **Optional:** Support site | support.powerbi.com <br> s3.amazonaws.com <br> *.olark.com <br> logx.optimizely.com <br> mscom.demdex.net <br> tags.tiqcdn.com | TCP 443 |
