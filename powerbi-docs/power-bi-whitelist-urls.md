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
ms.date: 08/10/2018
---

# Power BI URLs

**The Power BI online service**, also known as the Power BI SaaS (Software as a Service) application, requires connectivity to the Internet. The endpoints below should be reachable for customers using Power BI.

To use the Power BI online service, you must have access to connect to the endpoints marked **required** in the tables below, as well as any endpoints marked **required on linked sites**.

Power BI service only requires TCP Port 443 to be opened for the listed endpoints.

Wildcards ( represented by an asterisk (*) ) represent all levels under the root domain, and we use N/A when information isn't available. The **Destination** column is a list with FQDN/domains and links to external sites which contain further endpoint information.

The information in the tables below only references the **public cloud**. This means that the **U. S. Government cloud**, **the Germany cloud**, and **the China cloud** *aren't* referenced in the tables below.

## Authentication

Power BI depends on the required endpoints in the Office 365 authentication and identity sections. To use Power BI, you must be able to connect to the endpoints in the linked site below.

|     Row     |     Purpose     |     Destination     |       Port(s)
|-------------|----------------------|-----------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | **Required:** Authentication and identity | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_identity) for more details | N/A |

## General site usage

For general usage of Power BI, you must be able to connect to the endpoints in the table and linked sites below.

|     Row     |       Purpose     |       Destination     |       Port(s)     |
|-------------|-----------------------------------|-------------------------------------|----------------|------------------------|--------------------------------------------------------------|
| 1 | **Required:** Backend APIs | *.analysis.windows.net | TCP 443 |
| 2 | **Required:** Office 365 Integration | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_portal-identity) for more details | N/A |
| 3 | **Required:** Portal | app.powerbi.com | TCP 443 |
| 4 | **Required:** Service Telemetry | dc.services.visualstudio.com | TCP 443 |
| 5 | **Optional:** Informational Messages | dynmsg.modpim.com | TCP 443 |
| 6 | **Optional:** NPS Surveys | nps.onyx.azure.net | TCP 443 |

## Administration

To perform administrative functions within Power BI, you must be able to connect to the endpoints in the linked sites below.

|     Row     |     Purpose     |     Destination     |       Port(s)
|-------------|----------------------|-----------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | **Required:** Managing Users (O365 portal) | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_portal-identity) for more details | N/A |
| 2 | **Required:** Viewing Audit Logs (O365 portal) | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_portal-identity) for more details | N/A |

## Get Data

To be able to get data from specific data sources such as OneDrive, you must be able to connect to the endpoints in the table below.

|     Row     |     Purpose     |     Destination     |       Port(s)     |
|-------------|-----------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | **Required:** AppSource (internal or external apps in Power BI) | appsource.microsoft.com | TCP 443 |
| 2 | **Optional:** Import Files From OneDrive Personal | Go [here](https://support.office.com/en-ie/article/required-urls-and-ports-for-onedrive-ce15d2cc-52ef-42cd-b738-d9c6f9b03f3a) for more details | N/A |
| 3 | **Optional:** Power BI in 60-Seconds tutorial video | *.doubleclick.net, *.ggpht.com, *.google.com, *.googlevideo.com, *.youtube.com, *.ytimg.com,  fonts.gstatic.com | TCP 443 |
| 4 | **Optional:** PubNub streaming data sources | Go [here](https://support.pubnub.com/support/solutions/articles/14000043522) for more details | N/A |

## Dashboard and Report integration

Power BI depends on certain endpoints to be able to support your dashboards and reports. You must be able to connect to the endpoints in the table and linked sites below.

|     Row     |     Purpose     |     Destination     |       Port(s)     |
|-------------|---------------------------------------------|-------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | **Optional:** Excel Integration | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_officeonline) for more details | N/A |

## Custom visuals

You can use [custom visuals](power-bi-custom-visuals.md) in Power BI to create a unique type of visual that’s tailored to you, or the data insights you’re trying to convey.

Power BI depends on certain endpoints to be able to view and access the custom visuals. You must be able to connect to the endpoints in the table and linked sites below.

| Row | Purpose | Destination | Port(s) |
|-----|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------|--------------|---------------------------------------------|
| 1 | **Required:** Import a custom visual from the Marketplace Interface and a file | *.bing.com, *.microsoft.com, *.msecnd.net, *.msecnd.net,  *.osi.office.net, ajax.aspnetcdn.com, nexus.ensighten.com, store.office.com, *.azureedge.net, *.azureedge.net | TCP 443 |
| 2 | **Optional:** PowerApps | Go [here](https://docs.microsoft.com/powerapps/maker/canvas-apps/limits-and-config#required-services) for more details | N/A |
| 3 | **Optional:** Visio | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_officeonline) for more details | N/A |
| 4 | **Optional:** Bing Maps | bing.com, platform.bing.com, *.dynamic.tiles.virtualearth.net, *.virtualearth.net | TCP 443 |

## External related sites

To visit external sites related to Power BI such as the community site or the documentation site, you must be able to connect to the endpoints in the table below.

|     Row     |     Purpose     |     Destination     |       Port(s)     |
|-------------|-------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | **Optional:** The community site | community.powerbi.com | TCP 443 |
| 2 | **Optional:** The ideas site | ideas.powerbi.com | TCP 443 |
| 3 | **Optional:** The documentation site | docs.microsoft.com | TCP 443 |
| 4 | **Optional:** Download sources (e. g. Power BI Desktop) | download.microsoft.com | TCP 443 |
| 5 | **Optional:** Landing site and support site | powerbi.microsoft.com | TCP 443 |
| 6 | **Optional:** External redirects to the sites listed above | aka.ms, go.microsoft.com  | TCP 443 |