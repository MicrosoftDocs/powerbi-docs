<properties
   pageTitle="Connect SQL Server Analysis Services and the Power BI Service"
   description="Create a live connection between SQL Server Analysis Services and the Power BI service."
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""
   featuredVideoId="zSfvHKUDXGI"
   featuredVideoThumb=""
   courseDuration=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="03/20/2016"
   ms.author="davidi"/>

# Connect SQL Server Analysis Services and the Power BI Service

*Watch and learn how to create a live connection between SQL Server Analysis Services and the Power BI service*

In a previous article we looked at how to connect SQL Server Analysis Services (SSAS) to Power BI Desktop, but what if you want to use that live data connection in the Power BI service? To do this, you need to download the **Power BI Analysis Services connector**. The connector works similarly to the **Personal Gateway** - it connects to your on-premises Analysis Services data, and routes any information flowing up into the Power BI service according to your security policies.

To download the Power BI Analysis Services connector, first log in to the Power BI service and select the **Download** icon in the top right-hand corner of the screen.

Select **Analysis Services Connector** from the menu, and download and install the software.

Once it has installed, you can connect to your SSAS directly by selecting **Get Data** in the Power BI service, selecting **Get** for Databases under Import or Connect to Data, and choosing **SQL Server Analysis Services** from the list of available sources. You will now see a list of all the SSAS modules that have been registered by the installed Analysis Services Connector. Browse through the modules until you find the one you want to use, and select **Connect**.

The data will appear under Datasets in the navigation bar on the left-hand side of the screen. The tables and columns that you can access will appear in the Fields pane, and you can use them as usual to build reports and dashboards. Keep in mind that your when you share dashboards with others in your organization, they will only be able to see the data that they have access to from within Analysis Services.


![](./media/powerbi-learning-7-4-connect-analysis-services-power-bi-desktop/7-4_1.png)
