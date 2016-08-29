<properties 
   pageTitle="Troux content pack"
   description="Troux content pack for Power BI"
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
   ms.date="08/29/2016"
   ms.author="tpalmer"/>
# Troux content pack for Power&nbsp;BI

With the Troux content pack, you can visualize your Enterprise Architecture repository in entirely new ways directly in Power BI. The content pack offers a set of insights on your business capabilities, the applications that deliver those capabilities, and the technologies that support those applications that can be fully customized using Power BI.

Connect to the [Troux content pack](https://app.powerbi.com/getdata/services/troux) for Power BI.

## How to connect

1.  Select **Get Data** at the bottom of the left navigation pane.

	![](media/powerbi-content-pack-troux/getdata.png)

2.  In the **Services** box, select **Get**.

	![](media/powerbi-content-pack-troux/services.png)

3.  Select **Troux** \>  **Get**.

	![](media/powerbi-content-pack-troux/troux.png)

4.  Specify your Troux OData URL. See details on [finding those parameters](#FindingParams) below.

	![](media/powerbi-content-pack-troux/params.png)

5. For **Authentication Method**, select **Basic** and provide your username and password (case sensitive), then select **Sign In**.

	![](media/powerbi-content-pack-troux/creds.png)

6. After approving, the import process will begin automatically. When complete, a new dashboard, report and model will appear in the Navigation Pane. Select the dashboard to view your imported data.

	 ![](media/powerbi-content-pack-troux/dashboard.png)


**What Now?**

- Try [asking a question in the Q&A box](powerbi-service-q-and-a.md) at the top of the dashboard

- [Change the tiles](powerbi-service-edit-a-tile-in-a-dashboard.md) in the dashboard.

- [Select a tile](powerbi-service-dashboard-tiles.md) to open the underlying report.

- While your dataset will be schedule to refreshed daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## System requirements
Access to the Troux OData feed and Troux 9.5.1 or higher is required.

<a name="FindingParams"></a>
## Finding parameters

Your Customer Care team can provide your unique Troux OData feed URL to you

## Troubleshooting
If you are seeing a timeout error after providing credentials, try connecting again.

### See also

[Get started in Power BI](powerbi-service-get-started.md)

[Get data in Power BI](powerbi-service-get-data.md)
