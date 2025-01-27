---
title: "Specify the size of an indicator in Power BI paginated reports using an expression | Microsoft Docs"
description: Discover ways to use size, in addition to color, direction, and shape, to maximize the visual impact of indicators in a Power BI paginated report in Power BI Report Builder.
ms.date: 04/24/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Specify the size of an indicator in Power BI paginated reports using an expression (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

  In addition to color, direction, and shape, you can use size to maximize the visual impact of indicators in a paginated report.  
  
 An indicator has a collection of indicator states named IndicatorStates. The IndicatorStates collection typically has multiple states. Each state is a member of the collection and is represented by an icon. Together the states constitute the IndicatorsStates collection.  
  
 To dynamically configure the sizes of icons, you set properties of members of the IndicatorsStates collection in the Properties pane of Report Builder. If the **Properties** pane is not visible, select the **View** tab and select **Properties**.  
  
 The **Properties** pane provides access to the properties of the IndicatorStates collection of an indicator. You configure the icons to be different sizes by setting the ScaleFactor property of the IndicatorStates collection members using an expression. For more information, see [Expressions &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/expressions-report-builder-and-ssrs).  
  
 The expression used in this procedure was also used to generate the report with different sizes of indicators, shown in [Indicators &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/indicators-report-builder-and-ssrs).  

## Specify the indicator icon size using an expression  
  
1.  Select the indicator you want to change.  
  
2.  In the Properties pane, locate the IndicatorStates property.  
  
     If the Properties pane is organized by category, you will find IndicatorStates in the **States** category.  
  
3.  Select the ellipsis **(...)** button next to IndicatorStates. The **IndicatorState Collection Editor** dialog box opens.  
  
     Select all members of the collection.  
  
4.  In the **Multi-Select Properties** list, select the down arrow next to ScaleFactor and then select **Expression**.  
  
5.  In the **Expression** dialog box write the expression.  
  
     The following sample expression makes the icon a different size based on the value of the **SalesYTD** field.  
  
     `=IIF(Fields!SalesYTD.value = 0,0,Fields!SalesYTD.value/Max(Fields!SalesYTD.value,"Indicator"))`  
  
     For more information, see [Expression Examples &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/expression-examples-report-builder-and-ssrs).  
  
6.  Select **OK**.
  
7.  Select **OK**.
  
## Related content

- [Indicators &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/indicators-report-builder-and-ssrs)  
