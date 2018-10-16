---
title: Power BI URLs
description: This article describes the endpoints that should be reachable for customers using Power BI.
author: mgblythe
ms.author: mblythe
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 10/15/2018
---

# Power BI URLs

**The Power BI online service**, also known as the Power BI SaaS (Software as a Service) application, requires connectivity to the Internet. The endpoints below should be reachable for customers using the Power BI online service.

To use the Power BI online service, you must have access to connect to the endpoints marked **required** in the tables below, and any endpoints marked **required** on the linked sites. If the link to an external site refers to a specific section, you only need to review the endpoints in that section.

Endpoints marked **optional** may also be **whitelisted** for specific functionality to work.

The Power BI online service only requires TCP Port 443 to be opened for the listed endpoints.

Wildcards (*) represent all levels under the root domain, and we use N/A when information isn't available. The **Destination(s)** column is a list with FQDN/domains and links to external sites, which contain further endpoint information.

>[!Important]
>The information in the tables below doesn't represent the **U.S. Government cloud**, **the Germany cloud**, or **the China cloud**.

## Authentication

Power BI depends on the required endpoints in the Office 365 authentication and identity sections. To use Power BI, you must be able to connect to the endpoints in the linked site below.

| Row | Purpose | Destination(s) | Port(s) |
|-----|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------|--------------|---------------------------------------------|
| 1 | **Required:** Authentication and identity | See the [Office 365 authentication and identity section](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_identity) from the Office 365 whitelist site | N/A |

## General site usage

For the general use of Power BI, you must be able to connect to the endpoints in the table and linked sites below.

| Row | Purpose | Destination(s) | Port(s) |
|-----|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------|--------------|---------------------------------------------|
| 1 | **Required:** Backend APIs | *.analysis.windows.net | TCP 443 |
| 2 | **Required:** Office 365 integration | See the [Office 365 portal and shared section](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_portal-identity) from the Office 365 whitelist site | N/A |
| 3 | **Required:** Portal | app.powerbi.com | TCP 443 |
| 4 | **Required:** Service telemetry | dc.services.visualstudio.com | TCP 443 |
| 5 | **Optional:** Informational messages | dynmsg.modpim.com | TCP 443 |
| 6 | **Optional:** NPS surveys | nps.onyx.azure.net | TCP 443 |

## Administration

To perform administrative functions within Power BI, you must be able to connect to the endpoints in the linked sites below.

| Row | Purpose | Destination(s) | Port(s) |
|-----|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------|--------------|---------------------------------------------|
| 1 | **Required:** For managing users and viewing audit logs | See the [Office 365 portal and shared section](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_portal-identity) from the Office 365 whitelist site | N/A |

## Get Data

To be able to get data from specific data sources such as OneDrive, you must be able to connect to the endpoints in the table below.

| Row | Purpose | Destination(s) | Port(s) |
|-----|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------|--------------|---------------------------------------------|
| 1 | **Required:** AppSource (internal or external apps in Power BI) | appsource.microsoft.com | TCP 443 |
| 2 | **Optional:** Import files From OneDrive personal | See the [Required URLs and ports for OneDrive site](https://support.office.com/en-ie/article/required-urls-and-ports-for-onedrive-ce15d2cc-52ef-42cd-b738-d9c6f9b03f3a) | N/A |
| 3 | **Optional:** Power BI in 60-Seconds tutorial video | *.doubleclick.net </br> *.ggpht.com </br> *.google.com </br> *.googlevideo.com </br> *.youtube.com </br> *.ytimg.com </br> fonts.gstatic.com | TCP 443 |
| 4 | **Optional:** PubNub streaming data sources | See the [PubNub documentation](https://support.pubnub.com/support/solutions/articles/14000043522) | N/A |

## Dashboard and Report integration 

Power BI depends on certain endpoints to be able to support your dashboards and reports. You must be able to connect to the endpoints in the table and linked sites below.

| Row | Purpose | Destination(s) | Port(s) |
|-----|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------|--------------|---------------------------------------------|
| 1 | **Required:** Excel integration | See the [Office Online section](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_officeonline) from the Office 365 whitelist site | N/A |

## Custom visuals

Power BI depends on certain endpoints to be able to view and access the custom visuals. You must be able to connect to the endpoints in the table and linked sites below.

| Row | Purpose | Destination(s) | Port(s) |
|-----|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------|--------------|---------------------------------------------|
| 1 | **Required:** Import a custom visual from the Marketplace interface and a file | *.microsoft.com </br> *.bing.com </br> *.msecnd.net </br> *.osi.office.net </br> *.azureedge.net </br> ajax.aspnetcdn.com </br> nexus.ensighten.com </br> store.office.com | TCP 443 |
| 2 | **Optional:** Bing Maps | bing.com </br> platform.bing.com </br> *.dynamic.tiles.virtualearth.net </br> *.virtualearth.net | TCP 443 |
| 3 | **Optional:** PowerApps | See the [Required services section](https://docs.microsoft.com/powerapps/maker/canvas-apps/limits-and-config#required-services) from the PowerApps system requirements site | N/A |
| 4 | **Optional:** Visio | See the [Office Online section](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_officeonline) from the Office 365 whitelist site | N/A |