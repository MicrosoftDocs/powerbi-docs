---
title: "Set the locale for a paginated report or text box | Microsoft Docs"
description: Use the Language property on a text box to provide the locale setting for formats in a paginated report that display data that differ by language and region in Report Builder.
ms.date: 06/28/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Set the locale for a paginated report or text box (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  The **Language** property on a paginated report or a text box contains the locale setting, which determines the default formats for displaying report data that differ by language and region, for example, date, currency, or number values. The **Language** property on a text box overrides the **Language** property on the report. If no value is specified for **Language**, Power BI Services uses the language setting of the browser for published reports.
  
 For HTML reports, you can override the default **Language** value and use the language specified by the HTTP header of the browser client by using the built-in field User!Language in an expression for the **Language** property of a report or a text box.  
  
 You can also specify the **Language** property for a report in a URL. For more information, see [Set the language for report parameters in a URL](/sql/reporting-services/set-the-language-for-report-parameters-in-a-url).  
  
### To set the locale for a report  
  
1.  In Design view, click outside the report design surface to select the report.  
  
2.  In the Properties pane, for the **Language** property, type or select the language that you want to use for the report.  
  
### To set the locale for a text box  
  
1.  In Design view, select the text box to which you want to apply the locale settings.  
  
2.  In the Properties pane, do the following:  
  
    -   For the **Calendar** property, type or select the calendar that you want to use for dates.  
  
    -   For the **Direction** property, type or select the direction in which the text is written.  
  
    -   For the **Language** property, type or select the language that you want to use for the text box. This value overrides the **Language** property for the Report.  
  
    -   For the **NumeralLanguage** property, type or select the format to use for numbers in the text box.  
  
    -   For the **NumeralVariant** property, type or select the variant of the format to use for numbers in the text box.  
  
    -   For the **UnicodeBiDi** property, select the level of bidirectional embedding to use in the text box.  
  
## Next steps  
 [Expression uses in reports &#40;Power BI Report Builder&#41;](../../paginated-reports/expressions/expression-uses-reports-report-builder.md)  
 [Solution design considerations for multi-lingual or global deployments (Reporting Services)](/previous-versions/sql/)  
  
