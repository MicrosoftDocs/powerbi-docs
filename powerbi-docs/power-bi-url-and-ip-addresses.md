---
title: Power BI URLs and IP addresses
description: Endpoints should be reachable for customers using Power BI
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 07/24/2018
---

# Power BI URLs and IP address ranges

**Power BI** requires connectivity to the Internet. The endpoints below should be reachable for customers using **Power BI**, including Government Community Cloud (GCC).

Please read each service introduction for more info. Wildcards represent all levels under the root domain and we use N/A when information is not available. Destinations are listed with FQDN/domain only, CIDR prefixes only, or a pairing of FQDNs that represent specific CIDR prefixes along with port information.

Bypass your proxy for all FQDN/CIDR paired and CIDR prefix only destinations, such as row 2 and 3 in portal and shared.

Bypass your proxy or remove inspection, authentication, reputation lookup services for any FQDNs marked required without a CIDR prefix, such as row 5 in portal and shared.

For any remaining optional FQDNs, wildcards, DNS, CDN, CRL, or other unpublished destinations requested by Power BI, ensure clients can access them over the Internet.

## Portal and shared
**Power BI** depends on the required endpoints in the Office 365 portal, Office 365 authentication and identity sections to function. To use Power BI, you must be able to connect to the endpoints marked required in the table below.

### Portal and shared FQDNs
Power BI is requested from browsers, clients, and servers to require an authenticated user to be passed.

## Authentication

|     Row     |     Purpose     |     Destination     |       Port     |     CIDR Address     |        ExpressRoute for Office 365 BGP   Communities         |
|-------------|----------------------|-----------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Required: Login page | https://support.office.com/ | N/A | N/A | N/A |

## Custom Visuals

| Row | Purpose | Destination | Port | CIDR Address | ExpressRoute for Office 365 BGP Communities |
|-----|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------|--------------|---------------------------------------------|
| 1 | Required: Import a Custom Visual from Marketplace Interface and from   a file | *.bing.com, *.microsoft.com, *.msecnd.net, *.msecnd.net,  *.osi.office.net, ajax.aspnetcdn.com, nexus.ensighten.com, store.office.com, *.azureedge.net, *.azureedge.net | N/A | N/A | N/A |

## Report and dashboard integration

|     Row     |     Purpose     |     Destination     |       Port     |     CIDR Address     |        ExpressRoute for Office 365 BGP   Communities         |
|-------------|---------------------------------------------|-------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Required: Viewing a report published to web | *.analysis.windows.net | N/A | N/A | N/A |
| 2 | Optional: Bing Maps Integration | bing.com, platform.bing.com, *.dynamic.tiles.virtualearth.net,   *.virtualearth.net | N/A | N/A | N/A |
| 3 | Optional: Excel Integration | *.microsoft.com, *.officeapps.live.com, *.cdn.office.net,  | N/A | N/A | N/A |

## External related sites

|     Row     |     Purpose     |     Destination     |       Port     |     CIDR Address     |        ExpressRoute for Office 365 BGP   Communities         |
|-------------|-------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Optional: community.powerbi.com   - Community site  | *.lithium.com, *.microsoft.com,   community.powerbi.com, powerbicdn.azureedge.net,  www.google-analytics.com | N/A | N/A | N/A |
| 2 | Optional: docs.microsoft.com -   Documentation site | *.akamaized.net,   *.microsoft.com, *.msecnd.net, ajax.aspnetcdn.com, www.google-analytics.com | N/A | N/A | N/A |
| 3 | Optional: Download sources   (Power BI Desktop, etc) | download.microsoft.com | N/A | N/A | N/A |
| 4 | Optional: External redirects | aka.ms, go.microsoft.com  | N/A | N/A | N/A |
| 5 | Optional: ideas.powerbi.com -   ideas site | *.gstatic.com, *.gstatic.com,   *.microsoft.com, *.uvcdn.com, *.wp.com, ajax.aspnetcdn.com, code.jquery.com,   ideas.powerbi.com, maxcdn.bootstrapcdn.com, nexus.ensighten.com,   pbiwebprod.blob.core.windows.net, powerbi.uservoice.com, secure.gravatar.com,   ssl.google-analytics.com, widget.uservoice.com, www.google.com  | N/A | N/A | N/A |
| 6 | Optional: powerbi.microsoft.com   - Landing page, Learn More links,     Support site, download links, partner showcase, etc.  | ajax.aspnetcdn.com,   amp.azure.net, cdn.optimizely.com, google-analytics.com,   maxcdn.bootstrapcdn.com,    netdna.bootstrapcdn.com,    powerbi.microsoft.com,powerbicdn.azureedge.net, support.powerbi.com,  www.powerbi.com | N/A | N/A | N/A |

## General site usage

|     Row     |       Purpose     |       Destination     |       Port     |       CIDR Address     |          ExpressRoute for Office 365 BGP Communities         |
|-------------|-----------------------------------|-------------------------------------|----------------|------------------------|--------------------------------------------------------------|
| 1 | Required: Backend APIs | *.analysis.windows.net | N/A | N/A | N/A |
| 2 | Required: O365 Waffle Menu | *.microsoft.com, *.office365.com | N/A  | N/A | N/A | N/A |
| 3 | Required: Portal  | app.powerbi.com | N/A | N/A | N/A |
| 4 | Required: Telemetry (AppInsights) | dc.services.visualstudio.com | N/A | N/A | N/A |
| 5 | Optional: Marketing Messages  | dynmsg.modpim.com  | N/A | N/A | N/A |
| 6 | Optional: NPS Surveys  | nps.onyx.azure.net | N/A | N/A | N/A |

## Get Data

|     Row     |     Purpose     |     Destination     |       Port     |     CIDR Address     |        ExpressRoute for Office 365 BGP   Communities         |
|-------------|-----------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Required: AppSource | *.azureedge.net, *.azureedge.net, *.blob.core.windows.net,   *.doubleclick.net, *.google-analytics.com,    appsource.microsoft.com,    c.s-microsoft.com, google-analytics.com,  login.microsoftonline.com,   login.windows.net, secure.aadcdn.microsoftonline-p.com | N/A | N/A | N/A |
| 2 | Optional: Import Files From OneDrive Personal | *.azureedge.net, *.live.net, auth.gfx.ms | N/A | N/A | N/A |
| 3 | Optional:  Power BI in   60 Seconds video | *.doubleclick.net, *.ggpht.com, *.google.com,  *.googlevideo.com, *.youtube.com,  *.ytimg.com,  fonts.gstatic.com | N/A | N/A | N/A |
| 4 | Optional: PubNub streaming data sources | *.pubnub.com | N/A | N/A | N/A |

## O365

|     Row     |     Purpose     |     Destination     |       Port     |     CIDR Address     |        ExpressRoute for Office 365 BGP   Communities         |
|-------------|----------------------------------------------------|--------------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Required: Managing Users (done in O365 portal) | *.microsoft.com, *.msocdn.com, *.office.com, *.office.net,  *.office365.com,   *.skype.com | N/A | N/A | N/A |
| 2 | Required: Viewing Audit Logs (done in O365 portal) | *.microsoft.com,  *.office.com,   *.office365.com, d3js.org | N/A | N/A | N/A |