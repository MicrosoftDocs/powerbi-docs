<properties 
   pageTitle="comScore Digital Analytix content pack for Power BI"
   description="comScore Digital Analytix content pack for Power BI"
   services="powerbi" 
   documentationCenter="" 
   authors="theresapalmer" 
   manager="mblythe" 
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="05/09/2016"
   ms.author="tpalmer"/>
   
# comScore Digital Analytix content pack for Power&nbsp;BI

Visual and explore your comScore Digital Analytix data in Power BI with the Power BI content pack. The data will be refreshed automatically once per day.

Connect to the [comScore content pack for Power BI.](https://app.powerbi.com/getdata/services/comscore)

Note: To connect to the content pack you need a comScore DAx user account and have comScore API access. Please contact your comScore DAx admin to confirm your account.

## How to connect

1.  Select Get Data at the bottom of the left navigation pane.

	![](media/powerbi-content-pack-content-pack/getdata.png)

2.  In the Services box, select Get.

	![](media/powerbi-content-pack-content-pack/services.PNG)
3.  Select comScore \> Connect.

	![](media/powerbi-content-pack-content-pack/connect.PNG)

4.  Provide the datacenter, comScore Client ID and Site you’d like to connect to. For more details on how to find these values, please see Finding you comScore Parameters below.

	![](media/powerbi-content-pack-content-pack/parameters.PNG)

5.  Provide your comScore username and password to connect. See details on finding this value below.

	![](media/powerbi-content-pack-content-pack/creds.PNG)

6.  The import process will begin automatically. When complete, a new dashboard, report and model will appear in the Navigation Pane. Select the dashboard to view your imported data.


**What Now?**

- Try [asking a question in the Q&A box](powerbi-service-q-and-a.md) at the top of the dashboard

- [Change the tiles](powerbi-service-edit-a-tile-in-a-dashboard.md) in the dashboard.

- [Select a tile](powerbi-service-dashboard-tiles.md) to open the underlying report.

- While your dataset will be schedule to refreshed daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## System requirements

A comScore DAx user account and access to the comScore DAx API is required to connect. Please contact your comScore DAx admin to confirm your account.

## Finding parameters

Details on how to find each of your comScore parameters is below.

**Data Center**

The data center you connect to is determined by the URL you navigate to in comScore.

If you use https://dax.comscore.com, enter “US”, if you use https://dax.comscore.eu, enter “EU”.

![](media/powerbi-content-pack-content-pack/comscore_URL.png) 

**Client**

The Client is the same one you provide when signing into comScore DAx.

![](media/powerbi-content-pack-content-pack/comscore_signin.PNG) 

**Site**

The comScore site determines which site you’d like to see the data from. You can find the list of sites from your comScore account.

![](media/powerbi-content-pack-content-pack/comscore_sites.PNG)

 
### See also

[Get started in Power BI](powerbi-service-get-started.md)

[Get data in Power BI](powerbi-service-get-data.md)


