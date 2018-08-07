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

**The Power BI service (online)** requires connectivity to the Internet. The endpoints below should be reachable for customers using the Power BI service.

To use the Power BI service, you must be able to connect to the endpoints marked **required** in the tables below.

Power BI is requested from browsers, clients, and servers to require an authenticated user to be passed. The Power BI service only requires TCP Port 443.

Wildcards represent all levels under the root domain, and we use N/A when information isn't available. The Destination column is a list with FQDN/domains, links to the [O365 URL site](https://support.office.com/article/office-365-urls-and-ip-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2?ui=en-US&rs=en-US&ad=US#bkmk_portal-identity), along with port information.

## Administration

Power BI depends on the required endpoints in the Office 365 portal. Power BI also depends on Office 365 authentication and identity sections to function. To use any Office 365 services, you must be able to connect to the endpoints marked required in the table below.

The administration URLs are not just for the Office 365 portal; they are also for the Power BI admin portal.

>![Note]
>The Office 365 admin portal is integrated with the Power BI Portal.

|     Row     |     Purpose     |     Destination     |       Port(s)
|-------------|----------------------|-----------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Required: Managing Users (O365 portal) | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_portal-identity) for more details | N/A |
| 2 | Required: Viewing Audit Logs (O365 portal) | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_portal-identity) for more details | N/A |

## Authentication

Power BI depends on the required endpoints in the Office 365 portal and the Office 365 authentication and identity sections to function. To use Power BI, you must be able to connect to the endpoints marked required in the table below. If your organization uses **Azure AD Connect (AAD Connect)**, **AD FS**, or **multi-factor authentication**, you can find the associated endpoints below. All IP addresses entered directly in the Destination IP column are also listed in the IP tables and XML file for your convenience.

### Authentication and identity FQDNs
If you’re using Active Directory Federation Services (AD FS) with your deployment, you can also use AD FS client access policies with Windows Server 2012 R2 or client access policies with AD FS 2.0 to further restrict and control access to Office 365.

|     Row     |     Purpose     |     Destination     |       Port(s)
|-------------|----------------------|-----------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Required: Login page | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_identity) for more details | N/A |

## Custom visuals

You can use [custom visuals](power-bi-custom-visuals.md) in Power BI to create a unique type of visual that’s tailored to you, or the data insights you’re trying to convey.

Power BI depends on the required endpoints to be able to view and access the custom visuals. You must be able to connect to the endpoints marked required in the table below.

| Row | Purpose | Destination | Port(s) |
|-----|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------|--------------|---------------------------------------------|
| 1 | Required: Import a custom visual from the Marketplace Interface and a file | *.bing.com, *.microsoft.com, *.msecnd.net, *.msecnd.net,  *.osi.office.net, ajax.aspnetcdn.com, nexus.ensighten.com, store.office.com, *.azureedge.net, *.azureedge.net | TCP 443 |
| 2 | Optional: PowerApps | Go [here](https://docs.microsoft.com/powerapps/maker/canvas-apps/limits-and-config#required-services) for more details | N/A |
| 3 | Optional: Visio | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_officeonline) for more details | N/A |
| 4 | Optional: Bing Maps | bing.com, platform.bing.com, *.dynamic.tiles.virtualearth.net, *.virtualearth.net | TCP 443 |

## Dashboard and Report integration

Power BI depends on the required endpoints to be able to integrate your dashboards and report with your applications. You must be able to connect to the endpoints marked required in the table below.

|     Row     |     Purpose     |     Destination     |       Port(s)     |
|-------------|---------------------------------------------|-------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Required: Viewing a report published to web | *.analysis.windows.net | TCP 443 |
| 2 | Optional: Bing Maps Integration | bing.com, platform.bing.com, *.dynamic.tiles.virtualearth.net, *.virtualearth.net | TCP 443 | |
| 3 | Optional: Excel Integration | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_officeonline) for more details | N/A |

## External related sites

To reach out to other sites related to Power BI such as the community page or the ideas page, you must be able to connect to the endpoints marked required in the table below.

|     Row     |     Purpose     |     Destination     |       Port(s)     |
|-------------|-------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Optional: The community page  |  community.powerbi.com | TCP 443 |
| 2 | Optional: The ideas page | ideas.powerbi.com | TCP 443 |
| 3 | Optional: The documentation page | docs.microsoft.com | TCP 443 |
| 4 | Optional: Download sources (Power BI Desktop, etc.) | download.microsoft.com | TCP 443 |
| 5 | Optional: External redirects | aka.ms, go.microsoft.com  | TCP 443 |
| 6 | Optional: The landing page and the support page | powerbi.microsoft.com | TCP 443 |

## General site usage

To use some essential features with Power BI such as Backend APIs or using the Power BI admin portal, you must be able to connect to the endpoints marked required in the table below.

|     Row     |       Purpose     |       Destination     |       Port(s)     |
|-------------|-----------------------------------|-------------------------------------|----------------|------------------------|--------------------------------------------------------------|
| 1 | Required: Backend APIs | *.analysis.windows.net | TCP 443 |
| 2 | Required: Office 365 Integration | Go [here](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#bkmk_portal-identity) for more details | N/A |
| 3 | Required: Portal | app.powerbi.com | TCP 443 |
| 4 | Required: Telemetry (AppInsights) | dc.services.visualstudio.com | TCP 443 |
| 5 | Optional: Marketing Messages  | dynmsg.modpim.com | TCP 443 |
| 6 | Optional: NPS Surveys  | nps.onyx.azure.net | TCP 443 |

## Get Data

To be able to get data from specific data sources such as OneDrive, you must be able to connect to the endpoints marked required in the table below.

|     Row     |     Purpose     |     Destination     |       Port(s)     |
|-------------|-----------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|----------------------|--------------------------------------------------------------|
| 1 | Required: AppSource | appsource.microsoft.com | TCP 443 |
| 2 | Optional: Import Files From OneDrive Personal | Go [here](https://support.office.com/en-ie/article/required-urls-and-ports-for-onedrive-ce15d2cc-52ef-42cd-b738-d9c6f9b03f3a) for more details | N/A |
| 3 | Optional: Power BI in 60-Seconds video | *.doubleclick.net, *.ggpht.com, *.google.com, *.googlevideo.com, *.youtube.com, *.ytimg.com,  fonts.gstatic.com | TCP 443 |
| 4 | Optional: PubNub streaming data sources | Go [here](https://support.pubnub.com/support/solutions/articles/14000043522) for more details | N/A |