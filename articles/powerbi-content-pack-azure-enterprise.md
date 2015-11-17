<properties 
   pageTitle="Microsoft Azure Enterprise content pack for Power BI"
   description="Microsoft Azure Enterprise content pack for Power BI"
   services="powerbi" 
   documentationCenter="" 
   authors="tpalmer" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="11/02/2015"
   ms.author="tpalmer"/>
# Microsoft Azure Enterprise content pack for Power BI

Explore and monitor your Microsoft Azure Enterprise data in Power BI with the Power BI content pack. The data will be refreshed automatically once per day.

Connect to the [Microsoft Azure Enterprise content pack](https://app.powerbi.com/getdata/services/azure-enterprise) for Power BI.


1. Select **Get Data** at the bottom of the left navigation pane.

	![](media/powerbi-content-pack-azure-enterprise/getdata.png)

2.  In the **Services** box, select **Get**.

	![](media/powerbi-content-pack-azure-enterprise/services.png)

3.  Select **Microsoft Azure Enterprise** \> **Connect**. 

	![](media/powerbi-content-pack-azure-enterprise/connect.png)

4. Provide the Azure Environment URL, the number months of data you want to import and your Azure Enterprise enrollment number. Your Azure Environment URL will be `https://ea.azure.com` or `https://ea.windowsazure.cn`.

    ![](media/powerbi-content-pack-azure-enterprise/params.png)

5. Provide your Access key to connect. The key for your enrollment can be found in your Azure EA Portal. 

	![](media/powerbi-content-pack-azure-enterprise/creds.png)

6.  The import process will begin automatically. When complete, a new dashboard, report and model will appear in the Navigation Pane. Select the dashboard to view your imported data.

	![](media/powerbi-content-pack-azure-enterprise/dashboard.png)

	You can change this dashboard to display your data the way you want it. Plus you can:

	- Try [asking a question in the Q&A box](powerbi-service-q-and-a.md) at the top of the dashboard, such as "Show total clicks by location on a map"

	- [Change the tiles](powerbi-service-edit-a-tile-in-a-dashboard.md) in the dashboard.

	- [Select a tile](powerbi-service-dashboard-tiles.md) to open the underlying report.
    
###Providing your Azure Enterprise parameters
Power BI reporting is available for EA Direct, Partner and Indirect Customers who are able to view billing information. Please read below for details about finding each of the values the connection flow expects.

**Azure Environment URL**

- This value is typically https://ea.azure.com, however you can check the URL once you sign in to confirm.

**Number of Months**

- This should be a number between 1-36 representing the number of months of data (from today) you'd like to import.

**Enrollment Number**

- This is your Azure Enterprise enrollment number. If you're having difficulties finding it please contact your admin.

**Access Key**

- Your key can be found in the Azure Enterprise portal, under "Download Usage" > "API Access Key"

### See also

[Get started in Power BI](powerbi-service-get-started.md)

[Get data in Power BI](powerbi-service-get-data.md)


