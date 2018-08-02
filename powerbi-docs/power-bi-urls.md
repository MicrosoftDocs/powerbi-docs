---
title: Power BI URLs
description: Endpoints should be reachable for customers using Power BI
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 08/06/2018
---

# Power BI URLs

Power BI requires connectivity to the Internet. The endpoints below should be reachable for customers using Power BI.

To use Power BI, you must be able to connect to the endpoints marked **required** in the tables below.

Power BI is requested from browsers, clients, and servers to require an authenticated user to be passed.

Wildcards represent all levels under the root domain, and we use N/A when information isn't available. The Destination column is a list with FQDN/domains, links to the [O365 URL site](https://support.office.com/en-us/article/office-365-urls-and-ip-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2?ui=en-US&rs=en-US&ad=US#bkmk_portal-identity), along with port information.

For any remaining optional FQDNs, wildcards, DNS, CDN, CRL, or other unpublished destinations requested by Power BI, ensure clients can access them over the Internet.

## Administration

|     Row     |     Purpose     |     Destination     |       Port(s)
|-------------|----------------------|-----------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Required: Managing Users (O365 portal) | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_portal-identity) for more details | N/A |
| 2 | Required: Viewing Audit Logs (O365 portal) | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_portal-identity) for more details | N/A |

## Authentication

|     Row     |     Purpose     |     Destination     |       Port(s)
|-------------|----------------------|-----------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Required: Login page | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_identity) for more details | N/A |

## Custom visuals

| Row | Purpose | Destination | Port(s) |
|-----|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------|--------------|---------------------------------------------|
| 1 | Required: Import a custom visual from the Marketplace Interface and a file | *.bing.com, *.microsoft.com, *.msecnd.net, *.msecnd.net,  *.osi.office.net, ajax.aspnetcdn.com, nexus.ensighten.com, store.office.com, *.azureedge.net, *.azureedge.net | TCP 443 |
| 2 | Optional: PowerApps | Go [here](https://docs.microsoft.com/powerapps/maker/canvas-apps/limits-and-config#required-services) for more details | N/A |
| 3 | Optional: Visio | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_officeonline) for more details | N/A |
| 4 | Optional: Bing Maps | bing.com, platform.bing.com, *.dynamic.tiles.virtualearth.net, *.virtualearth.net | TCP 443 |

## Dashboard and Report integration

|     Row     |     Purpose     |     Destination     |       Port(s)     |
|-------------|---------------------------------------------|-------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Required: Viewing a report published to web | *.analysis.windows.net | TCP 443 |
| 2 | Optional: Bing Maps Integration | bing.com, platform.bing.com, *.dynamic.tiles.virtualearth.net, *.virtualearth.net | TCP 443 | |
| 3 | Optional: Excel Integration | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_officeonline) for more details | N/A |

## External related sites

|     Row     |     Purpose     |     Destination     |       Port(s)     |
|-------------|-------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Optional: The community page  |  community.powerbi.com | TCP 443 |
| 2 | Optional: The ideas page | ideas.powerbi.com | TCP 443 |
| 3 | Optional: The documentation page | docs.microsoft.com | TCP 443 |
| 4 | Optional: Download sources (Power BI Desktop, etc.) | download.microsoft.com | TCP 443 |
| 5 | Optional: External redirects | aka.ms, go.microsoft.com  | TCP 443 |
| 6 | Optional: The landing page, the support site, etc. | powerbi.microsoft.com | TCP 443 |

## General site usage

|     Row     |       Purpose     |       Destination     |       Port(s)     |
|-------------|-----------------------------------|-------------------------------------|----------------|------------------------|--------------------------------------------------------------|
| 1 | Required: Backend APIs | *.analysis.windows.net | TCP 443 |
| 2 | Required: Office 365 Integration | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_portal-identity) for more details | N/A |
| 3 | Required: Portal | app.powerbi.com | TCP 443 |
| 4 | Required: Telemetry (AppInsights) | dc.services.visualstudio.com | TCP 443 |
| 5 | Optional: Marketing Messages  | dynmsg.modpim.com | TCP 443 |
| 6 | Optional: NPS Surveys  | nps.onyx.azure.net | TCP 443 |

## Get Data

|     Row     |     Purpose     |     Destination     |       Port(s)     |
|-------------|-----------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Required: AppSource | appsource.microsoft.com | TCP 443 |
| 2 | Optional: Import Files From OneDrive Personal | Go [here](https://support.office.com/en-ie/article/required-urls-and-ports-for-onedrive-ce15d2cc-52ef-42cd-b738-d9c6f9b03f3a) for more details | N/A |
| 3 | Optional: Power BI in 60 Seconds video | *.doubleclick.net, *.ggpht.com, *.google.com, *.googlevideo.com, *.youtube.com, *.ytimg.com,  fonts.gstatic.com | TCP 443 |
| 4 | Optional: PubNub streaming data sources | Go [here](https://support.pubnub.com/support/solutions/articles/14000043522) for more details | N/A |