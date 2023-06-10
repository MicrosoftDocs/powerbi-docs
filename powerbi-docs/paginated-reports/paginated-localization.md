---
title: "Culture-sensitive reports in Power BI paginated reports"
description: Set the language locale for a Power BI paginated report created from a Power BI dataset.
author: nirusrin
ms.author: nisrinivasan
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 06/07/2023
---

# Culture-sensitive reports in Power BI paginated reports

[!INCLUDE [applies-yes-service-yes-report-builder-no-desktop](../includes/applies-yes-service-no-report-builder-no-desktop.md)]

You can now view paginated reports in your local or preferred language on the Power BI service. This guidance applies only to **Power BI datasets** as a datasource. There are prerequisites that you should follow in order to be able to leverage this capability. 

## Pre-requisites
[!INCLUDE [power-bi-paginated-prerequisites](../includes/power-bi-paginated-prerequisites.md)]

Add translations to the Power BI dataset: [Translation Builder documentation](https://github.com/PowerBiDevCamp/TranslationsBuilder/blob/main/Docs/Building%20Multi-language%20Reports%20in%20Power%20BI.md) 


## Get started
In Power BI Report Builder, you can create a culture-sensitive report by adding the translated label measures to an RDL dataset. You can then reference the translated labels by specifying expressions such as **=First(Fields!Product_Sales_Report_Label.Value, "TranslatedLabelsDataSet")** .

You can publish/ upload an RDL report from Power BI Report Builder and view the report on the service by setting the language in the browser.  

You can create a [paginated report on the service] (../includes/paginated-formatted-table.md) and view the translated content on the service by setting the language in the browser settings, if your **Power BI dataset contains the translations**.

Another way to view the translated version is to append the url with **"?language=de-DE".**

Below is a **en-US** version of a sample report on the service
:::image type="content" source="media/paginated-language-report-parameter/paginated-localization_en_US_report.png" alt-text="Screenshot of tables in en-US":::

Below is the **de-DE** version of the localized report on the service
:::image type="content" source="media/paginated-language-report-parameter/paginated-localization_de_DE_report.png" alt-text="Screenshot of tables in de-DE":::


## Considerations and limitations
- When publishing/uploading a report from Power BI Report Builder
    - You can overwrite the browser language by setting the **Report.Language** property to the desired language. For eg. if **Report.Language = de-DE**, the report will display de-DE as long as the translations exist in the PBI dataset.
    - When the **Report.Language** property is set to an expression, the browser/ Power BI language settings will **not** be over-ridden. For example the **Report.Language** property is set to a report parameter (Example: **“=Parameters!SomeLanguageParameter”**).
-	Power BI language settings don’t affect the rendering from the server for eg. dates and number formatting.
    
      
