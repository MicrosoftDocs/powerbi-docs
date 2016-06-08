<properties 
   pageTitle="Identify barcodes in Power BI Desktop for the Power BI mobile apps"
   description="When you identify a barcode field in your model in Power BI Desktop, you can filter data for barcodes automatically in the Power BI mobile apps for iOS."
   services="powerbi" 
   documentationCenter="" 
   authors="maggiesMSFT" 
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
   ms.date="06/08/2016"
   ms.author="maggies"/>

# Identify barcodes in Power BI Desktop for the Power BI mobile apps

In Power BI Desktop, you can [categorize data](powerbi-desktop-data-categorization.md) in a column, so Power BI Desktop knows how to treat values in visuals in a report. You can also categorize a column as *barcode*. When you or your colleagues scan a barcode with the Power BI mobile app for iOS, you see any report that includes that barcode. When you open the report in the mobile app, Power BI automatically filters it to data related to that barcode. 

1. In Power BI Desktop, switch to Data View ![](media/powerbi-desktop-mobile-geofiltering/pbi_desktop_data_icon.png).

2. Select a column with barcode data &#151; typically a series of 10-digit values.

3. On the **Modeling** tab, select **Data Category** > **Barcode**.

    >Note: You don't need to add a visual with this c

5. Save the report and publish it to the Power BI service.

Now when you open the scanner on the [Power BI app for iOS](powerbi-mobile-ipad-iphone-apps.md) and scan a barcode, you see this report in the list of reports. When you open the report, it's filtered by the barcode you scanned.

### See also  
- [Data categorization in Power BI Desktop](powerbi-desktop-data-categorization.md)  
- [Get started with the iPhone app for Power BI](powerbi-mobile-iphone-app-get-started.md)  
- [Get started with Power BI](powerbi-service-get-started.md)  
