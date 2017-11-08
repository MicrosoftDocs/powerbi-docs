---
title: Tag a barcode field in Power BI Desktop for the mobile apps
description: When you tag a barcode field in your model in Power BI Desktop, you can filter data for barcodes automatically in the Power BI app on your iPhone.
services: powerbi
documentationcenter: ''
author: maggiesMSFT
manager: erikre
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 07/18/2017
ms.author: maggies

---
# Tag barcodes in Power BI Desktop for the mobile apps
In Power BI Desktop, you can [categorize data](desktop-data-categorization.md) in a column, so Power BI Desktop knows how to treat values in visuals in a report. You can also categorize a column as **Barcode**. When you or your colleagues [scan a barcode on a product with the Power BI app](powerbi-mobile-scan-barcode-for-report.md) on the iPhone, you see any report that includes that barcode. When you open the report in the mobile app, Power BI automatically filters the report to data related to that barcode.

1. In Power BI Desktop, switch to Data View.
2. Select a column with barcode data. See the list of [supported barcode formats](#supported-barcode-formats) below.
3. On the **Modeling** tab, select **Data Category** > **Barcode**.
   
    ![Data category list](media/desktop-mobile-barcodes/power-bi-desktop-barcode.png)
4. In Report view, add this field to the visuals you want filtered by the barcode.
5. Save the report and publish it to the Power BI service.

Now when you open the scanner on the [Power BI app for iPhone](powerbi-mobile-ipad-iphone-apps.md) and scan a barcode, you see this report in the list of reports. When you open the report, its visuals are filtered by the product barcode you scanned.

## Supported barcode formats
These are the barcodes Power BI recognizes if you can tag them in a Power BI report: 

* UPCECode 
* Code39Code  
* A39Mod43Code 
* EAN13Code 
* EAN8Code  
* 93Code  
* 128Code 
* PDF417Code 
* Interleaved2of5Code 
* ITF14Code 

## Next steps
* [Scan a barcode from the Power BI app on your iPhone](powerbi-mobile-scan-barcode-for-report.md)
* [Issue with scanning barcodes on an iPhone](powerbi-mobile-scan-barcode-for-report.md#issues-with-scanning-a-barcode)
* [Data categorization in Power BI Desktop](desktop-data-categorization.md)  
* Questions? [Try asking the Power BI Community](http://community.powerbi.com/)

