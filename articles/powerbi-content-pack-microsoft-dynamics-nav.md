<properties 
   pageTitle="Microsoft Dynamics NAV content pack for Power BI"
   description="Microsoft Dynamics NAV content pack for Power BI"
   services="powerbi" 
   documentationCenter="" 
   authors="theresapalmer" 
   manager="mblythe" 
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
   ms.date="03/16/2016"
   ms.author="tpalmer"/>

# Microsoft Dynamics NAV content pack for Power&nbsp;BI  

Getting insights into your Microsoft Dynamics NAV data is easy with Power BI and the Microsoft Dynamics NAV content pack. Power BI retrieves your data, both Sales and Financial data then builds an out-of-box dashboard and reports based on that data.

[Connect to the Microsoft Dynamics NAV for Power BI](https://app.powerbi.com/getdata/services/microsoft-dynamics-nav) or read more about the [Dynamics NAV integration](https://powerbi.microsoft.com/integrations/microsoft_dynamics_nav) with Power BI.

Note: this content pack requires permissions to the tables where data is retrieved from, in this case sales and finance data. More details on requirements below.

## How to connect

1. Select Get Data at the bottom of the left navigation pane.  
![](media/powerbi-content-pack-microsoft-dynamics-nav/getdata.png)

2. In the Services box, select Get.  
![](media/powerbi-content-pack-microsoft-dynamics-nav/services.PNG)

3. Select Microsoft Dynamics NAV, then select Connect.  
![](media/powerbi-content-pack-microsoft-dynamics-nav/getdata1.PNG)

4. When prompted, enter your Microsoft Dynamics NAV OData URL. The URL should match the following pattern: 

    	https//instance.navserver.com:7048/DynamicsNAV90_Instance1/OData/Company('CRONUS%20International%20Ltd.')
	- "instance.navserver.com" with your NAV Server name
	- "DynamicsNAV90\_Instance1" with your NAV Server Instance name
    - "Company('CRONUS%20International%20Ltd.')" with your NAV Company name

	An easy way to obtain this URL is in Dynamics NAV to go to Web Services, find the powerbifinance web service and copy the OData URL, but leaving out the “/powerbifinance” from the URL string.  
	![](media/powerbi-content-pack-microsoft-dynamics-nav/param.PNG)

5. Select **Basic** and enter your Microsoft Dynamics NAV credentials.

	>**Note:**  
	>You need admin credentials (or at least permissions to sales and finance data) for your Microsoft Dynamics NAV account.  Only Basic (Username and Password) authentication is currently supported.
	
	![](media/powerbi-content-pack-microsoft-dynamics-nav/creds.PNG)

6. Power BI will retrieve your Microsoft Dynamics NAV data and create a ready-to-use dashboard and report for you.   
![](media/powerbi-content-pack-microsoft-dynamics-nav/dashboard.png)

**What Now?**

- Try [asking a question in the Q&A box](powerbi-service-q-and-a.md) at the top of the dashboard

- [Change the tiles](powerbi-service-edit-a-tile-in-a-dashboard.md) in the dashboard.

- [Select a tile](powerbi-service-dashboard-tiles.md) to open the underlying report.

- While your dataset will be schedule to refreshed daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## What's included

The content pack includes data from the following tables (case sensitive):  
    - ItemSalesAndProfit  
    - ItemSalesByCustomer  
    - powerbifinance  
    - SalesDashboard  
    - SalesOpportunities  
    - SalesOrdersBySalesPerson  
    - TopCustomerOverview  

## System requirements

To import your Microsoft Dynamics NAV data into Power BI, you need to have permissions to the sales and finance data tables where data is retrieved from (listed above). The tables are also required to have some data, empty tables will currently fail to import.


## Troubleshooting  

The Power BI Microsoft Dynamics NAV content pack uses Microsoft Dynamics NAV's web services to retrieve your data. If you have a lot of data in your Microsoft Dynamics NAV instance, a suggestion to minimize the impact on your web service usage is to change the refresh frequency depending on your needs. Another suggestion is to have one admin create the content pack and share it instead of having every admin create their own.

**"Parameter validation failed, please make sure all parameters are valid"**  
If you see this error after typing your Microsoft Dynamics NAV URL. Make sure the following requirements are satisfied:

- The URL follows exactly this pattern 

    	https//instance.navserver.com:7048/DynamicsNAV90_Instance1/OData/Company('CRONUS%20International%20Ltd.')
    - "instance.navserver.com" with your NAV Server name
    - "DynamicsNAV90\_Instance1" with your NAV Server Instance name
    - "Company('CRONUS%20International%20Ltd.')" with your NAV Company name
- Make sure all the letters are lower case.  
- Make sure the URL is in 'https'.  
- Make sure there are no trailing forward slash at the end of the URL.

**"Login failed"**  
If you get a "login failed" error after using your Microsoft Dynamics NAV credentials to login, then you may be hitting one of the following issues:

- The account you are using doesn't have permissions to retrieve the Microsoft Dynamics NAV data from your account. Verify it is an admin account and try again. 
 
- The Dynamics NAV instance you're trying to connect to doesn't have a valid SSL certificate. In this case you'll see a more detailed error message ("unable to establish trusted SSL relationship"). Note that self-signed certs are not supported.

**"Oops"**  
If you see an "Oops" error dialog after you pass the authentication dialog, we're hitting an issue while loading the data for the content pack. 

- Verify the URL follows the pattern specified above. A common mistake is to specify 

    `https//instance.navserver.com:7048/DynamicsNAV90\_Instance1/OData` 
    
    however the 'Company('CRONUS%20International%20Ltd.')' section with your NAV Company name needs to be included:
    
    `https//instance.navserver.com:7048/DynamicsNAV90\_Instance1/OData/Company('CRONUS%20International%20Ltd.')`
    
### See also

[Get started with Power BI](powerbi-service-get-started.md)

[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)

