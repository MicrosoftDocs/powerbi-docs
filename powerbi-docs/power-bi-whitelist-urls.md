---
title: Power BI URLs for whitelisting
description: This article describes the endpoints that should be reachable for customers using Power BI.
author: mgblythe
ms.author: mblythe
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 10/22/2018
ms.custom: seodec18
---

# Power BI URLs for whitelisting

**The Power BI online service**, also known as the Power BI SaaS (Software as a Service) application, requires connectivity to the internet. The endpoints below should be reachable for customers using the Power BI online service.

To use the Power BI online service, you must have access to connect to the endpoints marked **required** in the tables below, and any endpoints marked **required** on the linked sites. If the link to an external site refers to a specific section, you only need to review the endpoints in that section.

Endpoints marked **optional** may also be **whitelisted** for specific functionality to work.

The Power BI online service requires only TCP Port 443 to be opened for the listed endpoints.

Wildcards (*) represent all levels under the root domain, and we use N/A when information isn't available. The **Destination(s)** column is a list with FQDN/domains and links to external sites, which contain further endpoint information.

>[!Important]
>The information in the tables below doesn't represent the **U.S. Government cloud**, **the Germany cloud**, or **the China cloud**.

## Authentication

Power BI depends on the required endpoints in the Office 365 authentication and identity sections. To use Power BI, you must be able to connect to the endpoints in the linked site below.

| Row | Purpose | Destination(s) | Port(s) |
| --- | --- | --- | --- |
| 1 | **Required:** Authentication and identity | See the Office 365 documentation for [Office Online and common URLs](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online)  | N/A |

## General site usage

For the general use of Power BI, you must be able to connect to the endpoints in the table and linked sites below.

| Row | Purpose | Destination(s) | Port(s) |
| --- | --- | --- | --- |
| 1 | **Required:** Backend APIs | *.analysis.windows.net | TCP 443 |
| 2 | **Required:** Office 365 integration | See the Office 365 documentation for [Office Online and common URLs](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) | N/A |
| 3 | **Required:** Portal | app.powerbi.com | TCP 443 |
| 4 | **Required:** Service telemetry | dc.services.visualstudio.com | TCP 443 |
| 5 | **Optional:** Informational messages | dynmsg.modpim.com | TCP 443 |
| 6 | **Optional:** NPS surveys | nps.onyx.azure.net | TCP 443 |
| | | |

## Administration

To perform administrative functions within Power BI, you must be able to connect to the endpoints in the linked sites below.

| Row | Purpose | Destination(s) | Port(s) |
| --- | --- | --- | --- |
| 1 | **Required:** For managing users and viewing audit logs | See the Office 365 documentation for [Office Online and common URLs](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) | N/A |
| | | |

## Getting data

To get data from specific data sources, such as OneDrive, you must be able to connect to the endpoints in the table below. Access to additional internet domains and URLs may be required for specific data sources used within your organization.

| Row | Purpose | Destination(s) | Port(s) |
| --- | --- | --- | --- |
| 1 | **Required:** AppSource (internal or external apps in Power BI) | appsource.microsoft.com <br> *.s-microsoft.com  | TCP 443 |
| 2 | **Optional:** Sign in and get data for content packs | Depends on content packs used | Depends on content packs used |
| 3 | **Optional:** Import files From OneDrive personal | See the [Required URLs and ports for OneDrive site](https://docs.microsoft.com/onedrive/required-urls-and-ports) | N/A |
| 4 | **Optional:** Power BI in 60-Seconds tutorial video | *.doubleclick.net <br> *.ggpht.com <br> *.google.com <br> *.googlevideo.com <br> *.youtube.com <br> *.ytimg.com <br> fonts.gstatic.com | TCP 443 |
| 5 | **Optional:** PubNub streaming data sources | See the [PubNub documentation](https://support.pubnub.com/support/solutions/articles/14000043522) | N/A |
| | | |

## Dashboard and report integration

Power BI depends on certain endpoints to be able to support your dashboards and reports. You must be able to connect to the endpoints in the table and linked sites below.

| Row | Purpose | Destination(s) | Port(s) |
| --- | --- | --- | --- |
| 1 | **Required:** Excel integration | See the Office 365 documentation for [Office Online and common URLs](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) | N/A |
| | | |

## Custom visuals

Power BI depends on certain endpoints to be able to view and access the custom visuals. You must be able to connect to the endpoints in the table and linked sites below.

| Row | Purpose | Destination(s) | Port(s) |
| --- | --- | --- | --- |
| 1 | **Required:** Import a custom visual from the Marketplace interface or from a file | *.azureedge.net <br> *.blob.core.windows.net <br> store.office.com | TCP 443 |
| 2 | **Optional:** Bing Maps | bing.com <br> platform.bing.com <br> *.virtualearth.net | TCP 443 |
| 3 | **Optional:** PowerApps | See the [Required services section](https://docs.microsoft.com/powerapps/maker/canvas-apps/limits-and-config#required-services) from the PowerApps system requirements site | N/A |
| 4 | **Optional:** Visio | See the Office 365 documentation for [Office Online and common URLs](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online), as well as [SharePoint Online and OneDrive for Business](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges#sharepoint-online-and-onedrive-for-business) | N/A |
| | | |

## Related external sites

Power BI links to other related sites. These sites include those for documentation, support, new feature requests, and more. These sites will not affect the functionality of Power BI, so can be optionally whitelisted if desired.

| Row | Purpose | Destination(s) | Port(s) |
| --- | --- | --- | --- |
| 1 | **Optional:** Community site | community.powerbi.com <br> oxcrx34285.i.lithium.com | TCP 443 |
| 2 | **Optional:** Documentation site | docs.microsoft.com <br> img-prod-cms-rt-microsoft-com.akamaized.net <br> statics-uhf-eas.akamaized.net <br> cdnssl.clicktale.net <br> ing-district.clicktale.net | TCP 443 |
| 3 | **Optional:** Download site (for Power BI Desktop, etc.) | download.microsoft.com | TCP 443 |
| 4 | **Optional:** External redirects | aka.ms <br> go.microsoft.com | TCP 443 |
| 5 | **Optional:** Ideas feedback site| ideas.powerbi.com <br> powerbi.uservoice.com | TCP 443 |
| 6 | **Optional:** Power BI site - landing page, learn more links, support site, download links, partner showcase, etc. | powerbi.microsoft.com | TCP 443 |
| 7 | **Optional:** Power BI Developer Center | dev.powerbi.com | TCP 443 |
| 8 | **Optional:** Support site | support.powerbi.com <br> s3.amazonaws.com <br> *.olark.com <br> logx.optimizely.com <br> mscom.demdex.net <br> tags.tiqcdn.com | TCP 443 |
| | | |