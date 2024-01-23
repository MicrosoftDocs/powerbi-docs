---
title: "Add sparklines and data bars in a Power BI paginated report | Microsoft Docs"
description: "Add sparklines and data bars in a paginated report."
ms.date: 10/03/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Add sparklines and data bars in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Sparklines and data bars are small, spare charts that convey a lot of information with little extraneous detail in a paginated report. For more information about them, see [Sparklines and Data Bars &#40;Power BI Report Builder&#41;](sparklines-data-bars-report-builder.md).  
  
 In paginated reports, sparklines and data bars are most commonly placed in cells in a table or matrix. Sparklines usually display only one series each. Data bars can contain one or more data points. Both sparklines and data bars derive their impact from repeating the series information for each row in the table or matrix.  
  
## Add a sparkline or data bar to a table or matrix  
  
1.  If you have not done so already, create a [table](tables-report-builder.md) or [matrix](/sql/reporting-services/report-design/create-a-matrix-report-builder-and-ssrs) with the data you want to display.  
  
1.  Insert a column in your table or matrix. For more information, see [Insert or Delete a Column &#40;Power BI Report BuilderS&#41;](../../paginated-reports/report-design/insert-delete-column-report-builder.md).  
  
1.  On the **Insert** tab, select **Sparkline** or **Data Bar**, and then select in a cell in the new column.  
  
    > [!NOTE]  
    >  You cannot place sparklines in a detail group in a table. They must go in a cell associated with a group.  
  
1.  In the **Change Sparkline/Data Bar Type** dialog box, select the kind of sparkline or data bar you want, and then select **OK**.  
  
1.  Select the sparkline or data bar.  
  
     The **Chart Data** pane opens.  
  
1.  In the **Values** area, select the **Add Fields** plus sign (**+**), and then select the field whose values you want charted.  
  
1.  In the **Category Groups** area, select the **Add Fields** plus sign (**+**), and then select the field whose values you want to group by.  
  
     Typically for sparklines and data bars, you don't add a field to the **Series Group** area because you only want one series for each row.  
  
## Related content

- [Align the Data in a Chart in a Table or Matrix &#40;Power BI Report Builder&#41;](align-data-chart-table-matrix-report-builder.md)  
- [Charts &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/charts-report-builder.md)
  
  
