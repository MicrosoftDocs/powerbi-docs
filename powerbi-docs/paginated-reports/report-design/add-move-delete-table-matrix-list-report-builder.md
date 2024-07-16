---
title: "Add, move, or delete a table, matrix, or list in a Power BI paginated report | Microsoft Docs"
description: Arrange your table or matrix data regions in a paginated report by using the New Table Wizard or New Matrix Wizard in Power BI Report Builder. 
ms.date: 10/03/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Add, move, or delete a table, matrix, or list in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  In a paginated report, a data region displays data from a report dataset. Data regions include table, matrix, list, chart, and gauge. To nest one data region inside another, add each data region separately, and then drag the child data region onto the parent data region.  
  
 The simplest way to add a table or matrix data region to your report is to run the New Table or New Matrix Wizard. These wizards guide you through the process of choosing a connection to a data source, arranging fields, and choosing the layout and style. The wizards are only available in Report Builder.  
  
## Add a table or matrix to a report by using the new table or new matrix wizard  
  
1.  On the **Insert** tab, select **Table** or **Matrix**, and then select **Table Wizard** or **Matrix Wizard**.  
  
2.  Follow the steps in the **New Table** or **New Matrix** wizard.  
  
3.  On the **Home** tab, select **Run** to see the rendered report.  
  
4.  On the **Run** tab, select **Design** to continue working on the report.  
  
## Add a data region  
  
1.  On the **Ribbon**, in the **Data Regions** group, select the data region to add.  
  
2.  Select the design surface, and then drag to create a box that is the desired size of the data region.  
  
3.  Drag a report dataset field from the Report Data pane onto a data region cell. The data region is now bound to data from the report dataset.  
  
## Select a data region  
  
-   For a tablix data region, right-click the corner handle. For a chart or gauge data region, select the data region.  
  
     A selection handle and eight resizing handles appear.  
  
     For nested data regions, right-click in the nested data region, select **Select**, and then select the report item you want. To verify which report item is selected, use the Properties pane. The name of the selected item on the design surface appears in the toolbar of the Properties pane.  
  
## Move a data region  
  
-   To move a data region, select the selection handle of the data region and drag it. Use snaplines to align it to existing report items.  
  
     If the ruler is not visible, select the View tab and select the **Ruler** option.  
  
     Alternatively, use the arrow keys to move the selected data region on the design surface.  
  
## Delete a data region  
  
-   Select the data region, right-click in the data region, and then select **Delete**.  
  
## Related content

- [Tablix Data Region &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/render-data-regions-report-builder-service.md) 
- [Tables, Matrices, and Lists &#40;Power BI Report Builder&#41;](../../paginated-reports/report-builder-tables-matrices-lists.md) 
  
  
