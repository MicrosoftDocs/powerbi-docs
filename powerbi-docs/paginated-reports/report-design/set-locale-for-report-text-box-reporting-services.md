---
title: "Set the locale for a Power BI paginated report or text box | Microsoft Docs"
description: Use the Language property on a text box to provide the locale setting for formats in a Power BI paginated report that display data that differ by language and region in Power BI Report Builder.
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

  The **Language** property on a Power BI paginated report or a text box contains the locale setting, which determines the default formats for displaying report data that differ by language and region, for example, date, currency, or number values. The **Language** property on a text box overrides the **Language** property on the report. If no value is specified for **Language**, Power BI Services uses the language setting of the browser for published reports.
  
 For HTML reports, you can override the default **Language** value and use the language specified by the HTTP header of the browser client by using the built-in field User!Language in an expression for the **Language** property of a report or a text box.  
  
 You can also specify the **Language** property for a report in a URL. For more information, see [Set the language for report parameters in a URL](/sql/reporting-services/set-the-language-for-report-parameters-in-a-url).  
  
## Set the locale for a report  
  
1. In Design view, select outside the report design surface to select the report.  
  
1. In the Properties pane, for the **Language** property, type or select the language that you want to use for the report.  
  
## Set the locale for a text box  
  
1. In Design view, select the text box to which you want to apply the locale settings.  
  
1. In the Properties pane, set the following properties:  
  
    - **Calendar** property: type or select the calendar that you want to use for dates.  
  
    - **Direction** property: type or select the direction in which the text is written.  
  
    - **Language** property: type or select the language that you want to use for the text box. This value overrides the **Language** property for the Report.  
  
    - **NumeralLanguage** property: type or select the format to use for numbers in the text box.  
  
    - **NumeralVariant** property: type or select the variant of the format to use for numbers in the text box.  
  
    - **UnicodeBiDi** property: select the level of bidirectional embedding to use in the text box.
  
## Set the locale for a paginated report prompt (Power BI Report Builder)

The **User!Language** expression can be used to define the language that must be displayed based on the user's browser language. To do this follow the steps:

1. In Design view, define the [parameter](../../paginated-reports/parameters/paginated-reports-create-parameters.md).
2. Specify the **Name** for the parameter.
3. For the **Prompt**, define an [expression](../../paginated-reports/expressions/expression-uses-reports-report-builder.md)
   
   :::image type="content" source="..media/set-locale-parameter-prompts.png" alt-text="Screenshot of locale for parameter prompt.":::


  
## Related content

- [Expression uses in reports (Power BI Report Builder)](../../paginated-reports/expressions/expression-uses-reports-report-builder.md)  
- [Solution design considerations for multi-lingual or global deployments (Reporting Services)](/previous-versions/sql/)  
  
