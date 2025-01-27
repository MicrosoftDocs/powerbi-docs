---
title: "Include indicators and gauges in a gauge panel in Power BI paginated reports | Microsoft Docs"
description: Find out about using gauges and indicators in the gauge panel, a top-level container, in your Power BI paginated reports in Power BI Report Builder. 
ms.date: 03/28/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Include indicators and gauges in a gauge panel in Power BI paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

  The gauge panel is the top-level container that holds one or more gauges and indicators in a paginated report. Indicators can be embedded in gauges or placed next to them in the gauge panel.  
  
 If the indicator and gauge are adjacent in the gauge panel and show data from different fields, you might want to add labels to make it clear what data the gauge and indicator convey.  
  
 Gauge and indicator options can be set by using expressions. For more information, see [Expressions in Power BI Report Builder](../../expressions/report-builder-expressions.md).  
  
You create and modify Power BI paginated reports in [Power BI Report Builder](../../report-builder-power-bi.md).
  
## Embed an indicator in a gauge  
  
1. Open an existing report or create a new report that contains a table and matrix with the data you want to display.   
  
1. Insert a column in your table or matrix. For more information, see [Insert or delete a column &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/insert-or-delete-a-column-report-builder-and-ssrs).  
  
1. On the **Insert** tab, in the **Data Regions** group, select **Gauge**, and then, and then select a cell in the new column. The **Select Gauge Type** dialog box appears.  
  
1. Select **Radial**. The first radial gauge is selected.  
  
1. Select **OK**.
  
1. Select the gauge. The **Gauge Data** pane opens.  
  
1. In the **Values** area, in the **(Unspecified)** list box, select the field whose values you want to display in the gauge. Alternatively, drag the field to use from the report dataset.  
  
1. Right-click the gauge, select **Add Indicator**, and then select **Child**. The **Select Indicator Style** dialog box opens.  
  
1. In the **Select Indicator Style** dialog box, in the left pane, select the indicator type you want, and then select the indicator set.  
  
1. Select **OK**.
  
1. Select the indicator. The **Gauge Data** pane opens.  
  
1. In the **Values** area, in the **(Unspecified)** list box, select the field whose values you want to display as an indicator. Alternatively, drag the field to use from the report dataset.  
  
     The field can be the same or a different field from the one you use in the gauge.  
  
1. Select **OK**.
  
## Show an indicator and gauge side by side  
  
1. Open an existing report or create a new report that contains a table and matrix with the data you want to display.  
  
1. Insert a column in your table or matrix. For more information, see [Insert or delete a column &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/insert-or-delete-a-column-report-builder-and-ssrs).  
  
1. On the **Insert** tab, in the **Data Regions** group, select **Gauge**, and then select a cell in the column you inserted. The **Select Gauge Type** dialog appears.  
  
1. Select **Radial**. The first radial gauge is selected.  
  
1. Select **OK**.
  
1. Select the gauge. The **Gauge Data** pane opens.  
  
1. In the **Values** area, in the **(Unspecified)** list box, select the field whose values you want to display in the gauge. Alternatively, drag the field to use from the report dataset.  
  
1. Right-click the gauge, select **Add Indicator**, and then select **Adjacent**. The **Select Indicator Style** dialog box opens.  
  
1. In the **Select Indicator Style** dialog box, in the left pane, select the indicator type you want, and then select the indicator set.  
  
1. Select **OK**.
  
1. Select the indicator. The **Gauge Data** pane opens.  
  
1. In the **Values** area, in the **(Unspecified)** list box, select the field whose values you want to display as an indicator. Alternatively, drag the field to use from the report dataset.  
  
     The field can be the same or a different field from the one you use in the gauge.  
  
1. Select **OK**.
  
1. Right-click the gauge panel and select **Add Label**. A label is added to the gauge panel. Repeat one more time.  
  
     The gauge panel has two labels.  
  
1. Drag each label to a location near the gauge or indicator.  
  
1. Right-click the label near the gauge, select **Label Properties**,and type the text you want in the **Text** box.  
  
1. Right-click the label near the indicator, select **Label Properties**,and type the text you want in the **Text** box.  
  
1. Select **OK**.
  
## Related content

- [Indicators &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/indicators-report-builder-and-ssrs)  
