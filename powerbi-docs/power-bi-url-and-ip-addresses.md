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

| Feature   Area | Description | Required/Optional | Address to Whitelist |
|----------------|-------------|-------------------|------------------|-----------------------------------------------------------------------------------------------------------------------------------|---------------------------------|
| Auth | Login page | Required | https://support.office.com/en-us/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_identity |
|  |  |  |  |  |  |

## Custom Visuals

| Feature   Area | Description | Required/Optional | Address to Whitelist |  |  |
|----------------|---------------------------------------------------|-------------------|-------------------------|---|---|
| Custom Visuals | Import a Custom Visual From Marketplace Interface | Required | *.bing.com |  |  |
| Custom Visuals | Import a Custom Visual From Marketplace Interface | Required | *.microsoft.com |  |  |
| Custom Visuals | Import a Custom Visual From Marketplace Interface | Required | *.microsoft.com |  |  |
| Custom Visuals | Import a Custom Visual From Marketplace Interface | Required | *.microsoft.com |  |  |
| Custom Visuals | Import a Custom Visual From Marketplace Interface | Required | *.microsoft.com |  |  |
| Custom Visuals | Import a Custom Visual From Marketplace Interface | Required | *.msecnd.net |  |  |
| Custom Visuals | Import a Custom Visual From Marketplace Interface | Required | *.msecnd.net |  |  |
| Custom Visuals | Import a Custom Visual From Marketplace Interface | Required | *.osi.office.net |  |  |
| Custom Visuals | Import a Custom Visual From Marketplace Interface | Required | ajax.aspnetcdn.com |  |  |
| Custom Visuals | Import a Custom Visual From Marketplace Interface | Required | nexus.ensighten.com |  |  |
| Custom Visuals | Import a Custom Visual From Marketplace Interface | Required | store.office.com |  |  |
| Custom Visuals | Import Custom Visual from File or Marketplace | Required | *.azureedge.net |  |  |
| Custom Visuals | Import Custom Visual from File or Marketplace | Required | *.azureedge.net |  |  |
| Custom Visuals | Import Custom Visual from File or Marketplace | Required | *.blob.core.windows.net |  |  |
| Custom Visuals | PowerApps Custom Visual | Optional | *.azureedge.net |  |  |
| Custom Visuals | PowerApps Custom Visual | Optional | *.azureedge.net |  |  |
| Custom Visuals | PowerApps Custom Visual | Optional | *.blob.core.windows.net |  |  |
| Custom Visuals | PowerApps Custom Visual | Optional | *.microsoft.com |  |  |
| Custom Visuals | PowerApps Custom Visual | Optional | *.powerapps.com |  |  |
| Custom Visuals | PowerApps Custom Visual | Optional | *.sharepointonline.com |  |  |
| Custom Visuals | PowerApps Custom Visual | Optional | api.powerapps.com |  |  |
| Custom Visuals | Visio Custom Visual | Optional | *.akamaihd.net |  |  |
| Custom Visuals | Visio Custom Visual | Optional | *.cdn.office.net |  |  |
| Custom Visuals | Visio Custom Visual | Optional | *.cdn.office.net |  |  |
| Custom Visuals | Visio Custom Visual | Optional | *.microsoft.com |  |  |
| Custom Visuals | Visio Custom Visual | Optional | *.office365.com |  |  |
| Custom Visuals | Visio Custom Visual | Optional | *.officeapps.live.com |  |  |
| Custom Visuals | Visio Custom Visual | Optional | *.sharepoint.com |  |  |
| Custom Visuals | Visio Custom Visual | Optional | *.sharepointonline.com |  |  |
| Custom Visuals | Visio Custom Visual | Optional | *.sharepointonline.com |  |  |

## Integration

| Feature   Area | Description | Required/Optional | Address to Whitelist |  |
|-----------------------------------|-----------------------------------|-------------------|----------------------------------|---|
| Dashboard & Report   Integrations | Bing Maps Integration | Optional | *.dynamic.tiles.virtualearth.net |  |
| Dashboard & Report   Integrations | Bing Maps Integration | Optional | *.virtualearth.net |  |
| Dashboard & Report   Integrations | Bing Maps Integration | Optional | bing.com |  |
| Dashboard & Report   Integrations | Bing Maps Integration | Optional | platform.bing.com |  |
| Dashboard & Report   Integrations | Excel Integration | Optional | *.cdn.office.net |  |
| Dashboard & Report   Integrations | Excel Integration | Optional | *.microsoft.com |  |
| Dashboard & Report   Integrations | Excel Integration | Optional | *.officeapps.live.com |  |
| Dashboard & Report   Integrations | Viewing a report published to web | Required | *.analysis.windows.net |  |

## External related sites

| Feature   Area | Description | Required/Optional | Address to Whitelist |  |
|------------------------|----------------------------------------------------------------------------------------------------------------|-------------------|----------------------------------|---|
| External Related Sites | community.powerbi.com - Community site | Optional | *.lithium.com |  |
| External Related Sites | community.powerbi.com - Community site | Optional | *.microsoft.com |  |
| External Related Sites | community.powerbi.com - Community site | Optional | *.microsoft.com |  |
| External Related Sites | community.powerbi.com - Community site | Optional | community.powerbi.com |  |
| External Related Sites | community.powerbi.com - Community site | Optional | powerbicdn.azureedge.net |  |
| External Related Sites | community.powerbi.com - Community site | Optional | www.google-analytics.com |  |
| External Related Sites | docs.microsoft.com - Documentation site | Optional | *.akamaized.net |  |
| External Related Sites | docs.microsoft.com - Documentation site | Optional | *.microsoft.com |  |
| External Related Sites | docs.microsoft.com - Documentation site | Optional | *.microsoft.com |  |
| External Related Sites | docs.microsoft.com - Documentation site | Optional | *.msecnd.net |  |
| External Related Sites | docs.microsoft.com - Documentation site | Optional | ajax.aspnetcdn.com |  |
| External Related Sites | docs.microsoft.com - Documentation site | Optional | www.google-analytics.com |  |
| External Related Sites | Download sources (Power BI Desktop, etc) | Optional | download.microsoft.com |  |
| External Related Sites | External redirects | Optional | aka.ms |  |
| External Related Sites | External redirects | Optional | go.microsoft.com |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | *.gstatic.com |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | *.gstatic.com |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | *.microsoft.com |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | *.s-microsoft.com |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | *.uvcdn.com |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | *.wp.com |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | ajax.aspnetcdn.com |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | code.jquery.com |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | ideas.powerbi.com |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | maxcdn.bootstrapcdn.com |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | nexus.ensighten.com |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | pbiwebprod.blob.core.windows.net |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | powerbi.uservoice.com |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | secure.gravatar.com |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | ssl.google-analytics.com |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | widget.uservoice.com |  |
| External Related Sites | ideas.powerbi.com - Ideas site | Optional | www.google.com |  |
| External Related Sites | powerbi.microsoft.com - Landing page, Learn More links,   Support site, download links, partner showcase, etc. | Optional | ajax.aspnetcdn.com |  |
| External Related Sites | powerbi.microsoft.com - Landing page, Learn More links,   Support site, download links, partner showcase, etc. | Optional | amp.azure.net |  |
| External Related Sites | powerbi.microsoft.com - Landing page, Learn More links,   Support site, download links, partner showcase, etc. | Optional | cdn.optimizely.com |  |
| External Related Sites | powerbi.microsoft.com - Landing page, Learn More links,   Support site, download links, partner showcase, etc. | Optional | google-analytics.com |  |
| External Related Sites | powerbi.microsoft.com - Landing page, Learn More links,   Support site, download links, partner showcase, etc. | Optional | maxcdn.bootstrapcdn.com |  |
| External Related Sites | powerbi.microsoft.com - Landing page, Learn More links,   Support site, download links, partner showcase, etc. | Optional | netdna.bootstrapcdn.com |  |
| External Related Sites | powerbi.microsoft.com - Landing page, Learn More links,   Support site, download links, partner showcase, etc. | Optional | powerbi.microsoft.com |  |
| External Related Sites | powerbi.microsoft.com - Landing page, Learn More links,   Support site, download links, partner showcase, etc. | Optional | powerbicdn.azureedge.net |  |
| External Related Sites | powerbi.microsoft.com - Landing page, Learn More links,   Support site, download links, partner showcase, etc. | Optional | support.powerbi.com |  |
| External Related Sites | powerbi.microsoft.com - Landing page, Learn More links,   Support site, download links, partner showcase, etc. | Optional | www.powerbi.com |  |

## General site usage

| Feature   Area | Description | Required/Optional | Address to Whitelist |  |
|--------------------|-------------------------|-------------------|------------------------------|---|
| General Site Usage | Backend APIs | Required | *.analysis.windows.net |  |
| General Site Usage | Marketing Messages | Optional | dynmsg.modpim.com |  |
| General Site Usage | NPS Survey | Optional | nps.onyx.azure.net |  |
| General Site Usage | O365 Waffle Menu | Required | *.microsoft.com |  |
| General Site Usage | O365 Waffle Menu | Required | *.office365.com |  |
| General Site Usage | Portal | Required | app.powerbi.com |  |
| General Site Usage | Telemetry (AppInsights) | Required | dc.services.visualstudio.com |  |

## Get Data

| Feature   Area | Description | Required/Optional | Address to Whitelist |  |
|----------------|-------------------------------------|-------------------|-------------------------------------|---|
| Get Data | AppSource | Required | *.azureedge.net |  |
| Get Data | AppSource | Required | *.azureedge.net |  |
| Get Data | AppSource | Required | *.blob.core.windows.net |  |
| Get Data | AppSource | Required | *.doubleclick.net |  |
| Get Data | AppSource | Required | *.google-analytics.com |  |
| Get Data | AppSource | Required | appsource.microsoft.com |  |
| Get Data | AppSource | Required | c.s-microsoft.com |  |
| Get Data | AppSource | Required | google-analytics.com |  |
| Get Data | AppSource | Required | login.microsoftonline.com |  |
| Get Data | AppSource | Required | login.windows.net |  |
| Get Data | AppSource | Required | secure.aadcdn.microsoftonline-p.com |  |
| Get Data | Import Files From OneDrive Personal | Optional | *.azureedge.net |  |
| Get Data | Import Files From OneDrive Personal | Optional | *.live.com |  |
| Get Data | Import Files From OneDrive Personal | Optional | *.live.com |  |
| Get Data | Import Files From OneDrive Personal | Optional | *.live.com |  |
| Get Data | Import Files From OneDrive Personal | Optional | *.live.net |  |
| Get Data | Import Files From OneDrive Personal | Optional | *.live.net |  |
| Get Data | Import Files From OneDrive Personal | Optional | auth.gfx.ms |  |
| Get Data | Power BI in 60 Seconds video | Optional | *.doubleclick.net |  |
| Get Data | Power BI in 60 Seconds video | Optional | *.doubleclick.net |  |
| Get Data | Power BI in 60 Seconds video | Optional | *.ggpht.com |  |
| Get Data | Power BI in 60 Seconds video | Optional | *.google.com |  |
| Get Data | Power BI in 60 Seconds video | Optional | *.googlevideo.com |  |
| Get Data | Power BI in 60 Seconds video | Optional | *.youtube.com |  |
| Get Data | Power BI in 60 Seconds video | Optional | *.ytimg.com |  |
| Get Data | Power BI in 60 Seconds video | Optional | fonts.gstatic.com |  |
| Get Data | PubNub streaming data sources | Optional | *.pubnub.com |  |

## O365

| Feature   Area | Description | Required/Optional | Address to Whitelist |  |
|------------------------------|------------------------------------------|-------------------|----------------------|---|
| Scenarios Which Rely on O365 | Managing Users (done in O365 portal) | Required | *.microsoft.com |  |
| Scenarios Which Rely on O365 | Managing Users (done in O365 portal) | Required | *.msocdn.com |  |
| Scenarios Which Rely on O365 | Managing Users (done in O365 portal) | Required | *.office.com |  |
| Scenarios Which Rely on O365 | Managing Users (done in O365 portal) | Required | *.office.com |  |
| Scenarios Which Rely on O365 | Managing Users (done in O365 portal) | Required | *.office.net |  |
| Scenarios Which Rely on O365 | Managing Users (done in O365 portal) | Required | *.office365.com |  |
| Scenarios Which Rely on O365 | Managing Users (done in O365 portal) | Required | *.skype.com |  |
| Scenarios Which Rely on O365 | Viewing Audit Logs (done in O365 portal) | Required | *.microsoft.com |  |
| Scenarios Which Rely on O365 | Viewing Audit Logs (done in O365 portal) | Required | *.office.com |  |
| Scenarios Which Rely on O365 | Viewing Audit Logs (done in O365 portal) | Required | *.office.com |  |
| Scenarios Which Rely on O365 | Viewing Audit Logs (done in O365 portal) | Required | *.office.com |  |
| Scenarios Which Rely on O365 | Viewing Audit Logs (done in O365 portal) | Required | *.office365.com |  |
| Scenarios Which Rely on O365 | Viewing Audit Logs (done in O365 portal) | Required | d3js.org |  |

