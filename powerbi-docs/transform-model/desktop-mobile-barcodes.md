---
title: Tag barcode fields in Power BI Desktop
description: Learn how to tag a barcode field in your model in Power BI Desktop, so you can use your mobile app to scan barcodes to get filtered data on your iOS and Android devices.
author: eric-urban
ms.author: eur
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 03/13/2023
LocalizationGroup: Model your data
---

# Tag barcode fields in Power BI Desktop

In Power BI Desktop, you can [categorize data](desktop-data-categorization.md) in a column, so that Power BI Desktop knows how to treat values in visuals in a report. You can also categorize a column as **Barcode**. Then, you can let someone in your organization [scan a barcode](../explore-reports/mobile/mobile-apps-scan-barcode.md) on a product by using the Power BI mobile app on their iOS or Android device. This barcode lets them see any report that includes it. When they open the report, it automatically filters to the data related to that barcode.

## Categorize barcode data

Assuming you have a report that includes barcodes:

1. In Power BI Desktop, switch to Table view.
2. Select the column that contains the barcode data. See the list of [supported barcode formats](#supported-barcode-formats) in the following section.
3. On the **Column tools** tab, select **Data category** > **Barcode**.

    :::image type="content" source="media/desktop-mobile-barcodes/power-bi-desktop-barcode.png" alt-text="Screenshot of Power BI Desktop showing the Column tools tab in Table view. The Data category dropdown is selected, and Barcode is highlighted.":::

    >[!WARNING]
    >Do not categorize more than one column across all data tables in a report as **Barcode**. The mobile apps support barcode filtering only for reports that have only one barcode column across all report data tables. If a report has more than one barcode column, no filtering takes place.

4. In Report view, add the barcode field to the visuals you want filtered by the barcode.
5. Save the report, and publish it to the Power BI service.

Now when you open the scanner on the Power BI apps for iOS and Android devices, you can scan a barcode. Then you can see this report in the list of reports that have barcodes. When you open the report, it filters the visuals by the product barcode you scanned.

## Supported barcode formats

Power BI recognizes these barcode formats if you can tag them in a Power BI report:

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

## Related content

* [Scan barcodes from the mobile app to get filtered data](../explore-reports/mobile/mobile-apps-scan-barcode.md)
* [Issues with scanning a barcode](../explore-reports/mobile/mobile-apps-scan-barcode.md#issues-with-scanning-a-barcode)
* [Specify data categories in Power BI Desktop](desktop-data-categorization.md)  
* Questions? [Ask the Power BI Community](https://community.powerbi.com/)
