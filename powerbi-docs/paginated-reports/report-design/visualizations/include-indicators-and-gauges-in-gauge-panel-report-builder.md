---
title: "Include indicators and gauges in gauge panel in Power BI paginated report | Microsoft Docs"
description: Find out about using gauges and indicators in the gauge panel, a top-level container, in your Power BI paginated reports in Power BI Report Builder. 
ms.date: 03/10/2023
ms.service: powerbi
ms.subservice: report-builder


ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Include indicators and gauges in gauge panel in Power BI paginated report (Power BI Report Builder)


  The gauge panel is the top-level container that holds one or more gauges and indicators in a paginated report. Indicators can be embedded in gauges or placed next to them in the gauge panel.  
  
 If the indicator and gauge are adjacent in the gauge panel and show data from different fields, you might want to add labels to make it clear what data the gauge and indicator convey.  
  
 Gauge and indicator options can be set by using expressions. For more information, see [Expressions &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/expressions-report-builder-and-ssrs).  
  
> [!NOTE]  
>  You can create and modify Power BI paginated report definition (.rdl) files in Power BI Report Builder.
  
### To embed an indicator in a gauge  
  
1.  Open an existing report or create a new report that contains a table and matrix with the data you want to display.   
  
2.  Insert a column in your table or matrix. For more information, see [Insert or delete a column &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/insert-or-delete-a-column-report-builder-and-ssrs).  
  
3.  On the **Insert** tab, in the **Data Regions** group, click **Gauge**, and then, and then click a cell in the new column. The **Select Gauge Type** dialog box appears.  
  
4.  Click **Radial**. The first radial gauge is selected.  
  
5.  Select **OK**.
  
6.  Click the gauge. The **Gauge Data** pane opens.  
  
7.  In the **Values** area, in the **(Unspecified)** list box, click the field whose values you want to display in the gauge. Alternatively, drag the field to use from the report dataset.  
  
8.  Right-click the gauge, click **Add Indicator**, and then click **Child**. The **Select Indicator Style** dialog box opens.  
  
9. In the **Select Indicator Style** dialog box, in the left pane, click the indicator type you want, and then click the indicator set.  
  
10. Select **OK**.
  
11. Click the indicator. The **Gauge Data** pane opens.  
  
12. In the **Values** area, in the **(Unspecified)** list box, click the field whose values you want to display as an indicator. Alternatively, drag the field to use from the report dataset.  
  
     The field can be the same or a different field from the one you use in the gauge.  
  
13. Select **OK**.
  
### To show an indicator and gauge side by side  
  
1.  Open an existing report or create a new report that contains a table and matrix with the data you want to display.  
  
2.  Insert a column in your table or matrix. For more information, see [Insert or delete a column &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/insert-or-delete-a-column-report-builder-and-ssrs).  
  
3.  On the **Insert** tab, in the **Data Regions** group, click **Gauge**, and then click a cell in the column you inserted. The **Select Gauge Type** dialog appears.  
  
4.  Click **Radial**. The first radial gauge is selected.  
  
5.  Select **OK**.
  
6.  Click the gauge. The **Gauge Data** pane opens.  
  
7.  In the **Values** area, in the **(Unspecified)** list box, click the field whose values you want to display in the gauge. Alternatively, drag the field to use from the report dataset.  
  
8.  Right-click the gauge, click **Add Indicator**, and then click **Adjacent**. The **Select Indicator Style** dialog box opens.  
  
9. In the **Select Indicator Style** dialog box, in the left pane, click the indicator type you want, and then click the indicator set.  
  
10. Select **OK**.
  
11. Click the indicator. The **Gauge Data** pane opens.  
  
12. In the **Values** area, in the **(Unspecified)** list box, click the field whose values you want to display as an indicator. Alternatively, drag the field to use from the report dataset.  
  
     The field can be the same or a different field from the one you use in the gauge.  
  
13. Select **OK**.
  
14. Right-click the gauge panel and click **Add Label**. A label is added to the gauge panel. Repeat one more time.  
  
     The gauge panel has two labels.  
  
15. Drag each label to a location near the gauge or indicator.  
  
16. Right-click the label near the gauge, click **Label Properties**,and type the text you want in the **Text** box.  
  
17. Right-click the label near the indicator, click **Label Properties**,and type the text you want in the **Text** box.  
  
18. Select **OK**.
  
## Next steps  
 [Indicators &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/indicators-report-builder-and-ssrs)  
  
  
