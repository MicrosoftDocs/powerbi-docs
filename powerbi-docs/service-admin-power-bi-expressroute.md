---
title: Power BI and ExpressRoute
description: Power BI and ExpressRoute
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-admin
ms.topic: conceptual
ms.date: 11/28/2018
ms.author: davidi

LocalizationGroup: Administration
---
# Power BI and ExpressRoute
With **Power BI** and **ExpressRoute**, you can create a private network connection from your organization to Power BI (or using an ISP’s colocation facility), bypassing the Internet to better secure your sensitive Power BI data and connections.

**ExpressRoute** is an Azure service that lets you create private connections between Azure datacenters (where Power BI resides) and your on-premises infrastructure, or create private connections between Azure datacenters and your colocation environment.

![](media/service-admin-power-bi-expressroute/pbi_expressroute_1.png)

You can get [more information about ExpressRoute](https://azure.microsoft.com/services/expressroute/) or learn [how to sign up](https://azure.microsoft.com/pricing/details/expressroute/).

> [!NOTE]
> Power BI is supported in Public peering mode, as described in [this FAQ](https://docs.microsoft.com/azure/expressroute/expressroute-faqs).
> 
> 

## Power BI ExpressRoute Exceptions
Power BI is compliant with ExpressRoute, with a few exceptions where Power BI gets or sends data over the public Internet. These specific exceptions often include static data, such as browser configuration files that are downloaded from the nearest **Content Delivery Network (CDN)** node. There are some broad exceptions which apply to all of Power BI, and there are some service- or feature-specific exceptions, each of which are documented in the following sections.

### Overall Exceptions to Power BI and ExpressRoute
An exception to **Power BI** and **ExpressRoute** means that the data being transmitted to or from Power BI goes over the public Internet, rather than being transmitted over the private ExpressRoute link.

The two overall exceptions to Power BI using ExpressRoute are:

* Static files downloaded from the **Content Delivery Network (CDN)** and websites
* **Telemetry** data sent over the public Internet

Power BI uses multiple **Content Delivery Networks (CDNs)** or web sites to efficiently distribute the necessary static content and files to users based on geographical locale through the public Internet. These static files include product downloads (such as **Power BI Desktop**, **On-premises data gateway**, or **Power BI Content Packs** from various independent service providers), browser configuration files that are used to initiate and establish any subsequent connections with Power BI, as well as the initial secure Power BI login page – the actual credentials are only sent over ExpressRoute.   

Certain **telemetry data** is also sent over the public Internet and over ExpressRoute. Telemetry data includes usage statistics and similar data, which is transmitted to services that are used to monitor usage and activity.

### Power BI SaaS Application and ExpressRoute
When a user initiates a connection to the Power BI service (powerbi.com or through Cortana), the Power BI Landing Page, the login page, and static files that prepare the browser to connect and interact with Power BI are retrieved from a CDN or websites, which connects over the public Internet.

Once the login is established, subsequent Power BI data interactions occur over ExpressRoute, with the exception of certain features and services that depend on public Internet data:

* **Map visuals** require connection and data transmission to the Bing Virtual Earth service or the Bing geocoding service, each of which is established over the public Internet.
* Power BI integration with **Cortana** requires access to Bing over the public Internet.
* When **custom links** are added by a user, such as an image widget or a video, Power BI requests data based on the link provided by the user, which may or may not use ExpressRoute.
* Users can send **feedback to Power BI** in text (and optionally images) over the User Voice feedback mechanism, which uses the public Internet for transmission.
* The **Bing News content provider** downloads content from Bing using the public Internet.
* When connecting to **apps** (for example, content packs), users are often required to enter credentials and settings using pages provided by the SaaS provider. Such pages may or may not use ExpressRoute.

| User Activity | Destination |
| --- | --- |
| Landing page (prior to login) |`maxcdn.bootstrapcdn.com ; ajax.aspnetcdn.com ; netdna.bootstrapcdn.com ; cdn.optimizely.com; google-analytics.com ` |
| Login |`*.mktoresp.com ; *.aadcdn.microsoftonline-p.com ; *.msecnd.com ; *.localytics.com ; ajax.aspnetcdn.com` |
| Dashboard, report, dataset management (includes maps and geocoding) |`*.localytics.com ; *.virtualearth.net ; platform.bing.com; powerbi.microsoft.com; c.microsoft.com; app.powerbi.com; *.powerbi.com; dc.services.visualstudio.com ` |
| Support |`support.powerbi.com ; powerbi.uservoice.com ; go.microsoft.com ` |

### Power BI Desktop and ExpressRoute
Power BI Desktop is also ExpressRoute compliant, with a few exceptions that are described in the following list:

* **Update notifications**, used to detect whether users have the most recent version of Power BI Desktop, go over the public Internet.
* Certain **telemetry data** goes over the public Internet.
* **Map visuals** require connection and data transmission to the **Bing Virtual Earth** service or the **Bing geocoding** service, each of which is established over the public Internet.
* **Get Data** from several data sources such as **Web** or third party SaaS providers go over the public Internet.

### Power BI PaaS and ExpressRoute
Power BI offers APIs and other platform-based features that enable developers to create customized Power BI solutions and apps. The following services, in addition to telemetry and CDN data discussed earlier in this topic, are used when transmitting Power BI PaaS data over the public Internet:

| PaaS Activity | Additional destinations used |
| --- | --- |
| Public embed (telemetry) |`c1.microsoft.com` |
| Custom visuals (CDN) |`*.azureedge.net` |

Some **custom visuals** are created by third-parties, some are created by Microsoft. These may or may not use ExpressRoute.

### Power BI Mobile and ExpressRoute
This document does not cover the use of Power BI Mobile apps.  

### On-premises data gateway and ExpressRoute
When an **On-premises data gateway** is used with Power BI, transmissions are ExpressRoute compliant, with the exception of the user activities documented in the **Power BI SaaS Application and ExpressRoute** section found earlier in this topic.  

