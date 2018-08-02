---
title: Power BI URLs and IP addresses
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

# Power BI URLs and IP address ranges

**Power BI** requires connectivity to the Internet. The endpoints below should be reachable for customers using **Power BI**, including Government Community Cloud (GCC).

Please read each service introduction for more info. Wildcards represent all levels under the root domain and we use N/A when information is not available. Destinations are listed with FQDN/domain only, CIDR prefixes only, or a pairing of FQDNs that represent specific CIDR prefixes along with Port(s) information.

For any remaining optional FQDNs, wildcards, DNS, CDN, CRL, or other unpublished destinations requested by **Power BI**, ensure clients can access them over the Internet.

To use **Power BI**, you must be able to connect to the endpoints marked required in the tables below.

### Portal and shared FQDNs
Power BI is requested from browsers, clients, and servers to require an authenticated user to be passed.

## Authentication

|     Row     |     Purpose     |     Destination     |       Port(s)
|-------------|----------------------|-----------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Required: Login page | https://support.office.com/ | TCP 443 |

## Custom visuals

| Row | Purpose | Destination | Port(s) |
|-----|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------|--------------|---------------------------------------------|
| 1 | Required: ImPort(s) a Custom Visual from Marketplace Interface and from   a file | *.bing.com, *.microsoft.com, *.msecnd.net, *.msecnd.net,  *.osi.office.net, ajax.aspnetcdn.com, nexus.ensighten.com, store.office.com, *.azureedge.net, *.azureedge.net | TCP 80, 443 | ||

## Dashboard and Report integration

|     Row     |     Purpose     |     Destination     |       Port(s)     |
|-------------|---------------------------------------------|-------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Required: Viewing a report published to web | *.analysis.windows.net | TCP 80, 443 |
| 2 | Optional: Bing Maps Integration | bing.com, platform.bing.com, *.dynamic.tiles.virtualearth.net,   *.virtualearth.net | TCP 80, 443 | |
| 3 | Optional: Excel Integration | Go [here](https://support.office.com/en-us/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_officeonline) for more details  | N/A |

## External related sites

|     Row     |     Purpose     |     Destination     |       Port(s)     |
|-------------|-------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Optional: community.powerbi.com   - Community site  | *.lithium.com, *.microsoft.com,   community.powerbi.com, powerbicdn.azureedge.net,  www.google-analytics.com | TCP 80, 443 |
| 2 | Optional: docs.microsoft.com -   Documentation site | *.akamaized.net,   *.microsoft.com, *.msecnd.net, ajax.aspnetcdn.com, www.google-analytics.com | TCP 80, 443 |
| 3 | Optional: Download sources   (Power BI Desktop, etc) | download.microsoft.com | TCP 80, 443 |
| 4 | Optional: External redirects | aka.ms, go.microsoft.com  | TCP 80, 443 | |
| 5 | Optional: ideas.powerbi.com - ideas site | *.gstatic.com, *.gstatic.com, *.microsoft.com, *.uvcdn.com, *.wp.com, ajax.aspnetcdn.com, code.jquery.com,   ideas.powerbi.com, maxcdn.bootstrapcdn.com, nexus.ensighten.com,   pbiwebprod.blob.core.windows.net, powerbi.uservoice.com, secure.gravatar.com,   ssl.google-analytics.com, widget.uservoice.com, www.google.com  | TCP 80, 443 |
| 6 | Optional: powerbi.microsoft.com - Landing page, learn more links, support site, download links, partner showcase, etc.  | ajax.aspnetcdn.com,   amp.azure.net, cdn.optimizely.com, google-analytics.com,   maxcdn.bootstrapcdn.com,    netdna.bootstrapcdn.com,    powerbi.microsoft.com,powerbicdn.azureedge.net, support.powerbi.com,  www.powerbi.com | TCP 80, 443 |

## General site usage

|     Row     |       Purpose     |       Destination     |       Port(s)     |
|-------------|-----------------------------------|-------------------------------------|----------------|------------------------|--------------------------------------------------------------|
| 1 | Required: Backend APIs | *.analysis.windows.net | TCP 80, 443 |
| 2 | Required: Office 365 Integration | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_portal-identity) for more details| N/A |
| 3 | Required: Portal  | app.powerbi.com | TCP 80, 443 |
| 4 | Required: Telemetry (AppInsights) | dc.services.visualstudio.com | TCP 80, 443 |
| 5 | Optional: Marketing Messages  | dynmsg.modpim.com  | TCP 80, 443 |
| 6 | Optional: NPS Surveys  | nps.onyx.azure.net | TCP 80, 443 |

## Get Data

|     Row     |     Purpose     |     Destination     |       Port(s)     |
|-------------|-----------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Required: AppSource | *.azureedge.net, *.azureedge.net, *.blob.core.windows.net,   *.doubleclick.net, *.google-analytics.com,    appsource.microsoft.com,    c.s-microsoft.com, google-analytics.com,  login.microsoftonline.com,   login.windows.net, secure.aadcdn.microsoftonline-p.com | TCP 80, 443 |
| 2 | Optional: ImPort(s) Files From OneDrive Personal | *.azureedge.net, *.live.net, auth.gfx.ms | TCP 80, 443 |
| 3 | Optional:  Power BI in   60 Seconds video | *.doubleclick.net, *.ggpht.com, *.google.com,  *.googlevideo.com, *.youtube.com,  *.ytimg.com,  fonts.gstatic.com | TCP 80, 443 | |
| 4 | Optional: PubNub streaming data sources | *.pubnub.com | TCP 80, 443 |

## O365

|     Row     |     Purpose     |     Destination     |       Port(s)     |
|-------------|----------------------------------------------------|--------------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Required: Managing Users (done in O365 Port(s)al) | *.microsoft.com, *.msocdn.com, *.office.com, *.office.net,  *.office365.com,   *.skype.com | TCP 80, 443 |
| 2 | Required: Viewing Audit Logs (done in O365 Port(s)al) | *.microsoft.com,  *.office.com,   *.office365.com, d3js.org | TCP 80, 443 |