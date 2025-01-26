---
title: "Get around Report Design View for paginated reports"
description: Learn how to use the Report Design View in Report Builder to create paginated reports that you can publish in the Power BI service.  
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 01/24/2023
---

# Get around Report Design View for paginated reports

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)] 

Report Design View in Power BI Report Builder is the design space for creating paginated reports that you can publish to the Power BI service. The design surface is at the center of Report Builder, with the ribbon and panes around it. The design surface is where you add and organize your report items. This article explains the panes you use to add, select, and organize your report resources, and change report item properties.  

:::image type="content" source="report-design/media/paginated-reports-report-design-view/power-bi-paginated-report-design-view.png" lightbox="report-design/media/paginated-reports-report-design-view/power-bi-paginated-report-design-view.png" alt-text="Screenshot of the Report Builder Report Design View.":::

1. [Report Data pane](#1-report-data-pane) 
2. [Report design surface](#2-report-design-surface)  
3. [Parameters pane](#3-parameters-pane) 
4. [Properties pane](#4-properties-pane) 
5. [Grouping pane](#5-grouping-pane) 
6. [Current report status bar](#6-current-report-status-bar)  
  
## 1. Report Data pane  
From the Report Data pane, you define the report data and report resources that you need for a report before you design your report layout. For example, you can add data sources, datasets, calculated fields, report parameters, and images to the Report Data pane.  
  
After you add items to the Report Data pane, drag fields to report items on the design surface to control where data appears in the report.  
  
> [!TIP]  
> If you drag a field from the Report Data pane directly to the report design surface instead of placing it in a data region such as a table or chart, only the first value from the data in that field is visible when you run the report.  
  
You can also drag built-in fields from the Report Data pane to the report design surface. When rendered, these fields provide information about the report, such as the report name, the total number of pages in the report, and the current page number.  
  
Some things are automatically added to the Report Data pane when you add an item to the report design surface. For example, if you embed an image in your report, it's added to the Images folder in the Report Data pane.  
  
> [!NOTE]  
> You can use the **New** button to add a new item to the Report Data pane. You can add multiple datasets from the same data source or from other data sources to the report. To add a new dataset from the same data source, right-click a data source > **Add Dataset**.  
  
## 2. Report design surface  
The Report Builder design surface is the main work area for designing your reports. To place report items such as data regions, subreports, text boxes, images, rectangles, and lines in your report, you add them from the ribbon or the Report Part Gallery to the design surface. There, you can add groups, expressions, parameters, filters, actions, visibility, and formatting to your report items.  
  
You can also change the following:  
  
- The report body properties, such as border and fill color, by right-clicking the gray area of the design surface, outside any report items, and selecting **Body Properties**.  
  
- The header and footer properties, such as border and fill color, by right-clicking the gray area of the design surface in the header or footer area, outside any report items, and selecting **Header Properties** or **Footer Properties**.  
  
- The properties of the report itself, such as page setup, by right-clicking the gray area around the design surface and selecting **Report Properties**.  
  
- The properties of report items by right-clicking them and selecting **Properties**.  
  
### Design surface size and print area  
The design surface size might be different from the page size print area that you specify to print the report. Changing the size of the design surface doesn't change the print area of your report. No matter what size you set for the print area of your report, the full design area size doesn't change.
  
- To display the ruler, on the **View** tab, select the **Ruler** check box.  
  
## 3. Parameters pane  
With report parameters, you can control report data, connect related reports together, and vary report presentation. The Parameters pane provides a flexible layout for the report parameters.  
  
For more information about report parameters, see [Create parameters for paginated reports](parameters/paginated-reports-create-parameters.md).
  
## 4. Properties pane
Every item in a report, including data regions, images, text boxes, and the report body itself, has properties associated with it. For example, the *BorderColor* property for a text box shows the color value of the text box's border, and the *PageSize* property for the report shows the page size of the report.  
  
These properties are displayed in the Properties pane. The properties in the pane change depending on the report item that you select.  
  
- To see the Properties pane, on the **View** tab in the **Show/Hide** group > **Properties**.  
  
### Change property values  
In Report Builder, you can change the properties for report items several ways:  
  
- By selecting buttons and lists on the ribbon.  
  
- By changing settings within dialog boxes.  
  
- By changing property values within the Properties pane.  
  
The most commonly used properties are available in the dialog boxes and on the ribbon.  
  
Depending on the property, you can set a property value from a dropdown, type the value, or select `<Expression>` to create an expression.  
  
### Change the Properties pane view  
By default, properties displayed in the Properties pane are organized into broad categories, such as Action, Border, Fill, Font, and General. Each category has a set of properties associated with it. For example, the following properties are listed in the Font category: *Color*, *FontFamily*, *FontSize*, *FontStyle*, *FontWeight*, *LineHeight*, and *TextDecoration*. If you prefer, you can alphabetize all the properties listed in the pane. This removes the categories and lists all the properties in alphabetical order, regardless of category.  
  
The Properties pane has three buttons at the top of pane: **Category**, **Alphabetize**, and **Property Page**. Select the **Category** and **Alphabetize** buttons to switch between the Properties pane views. Select the **Property Pages** button to open the properties dialog box for a selected report item.  
  
## 5. Grouping pane

Groups are used to organize your report data into a visual hierarchy and to calculate totals. You can view the row and column groups within a data region on the design surface and also in the Grouping pane. The Grouping pane has two areas: Row Groups and Column Groups. When you select a data region, the Grouping pane displays all the groups within that data region as a hierarchical list. Child groups appear indented under their parent groups.  
  
You can create groups by dragging fields from the Report Data pane and dropping them on the design surface or in the Grouping pane. In the Grouping pane, you can add parent, adjacent, and child groups, change group properties, and delete groups.  
  
The Grouping pane is displayed by default but you can close it by clearing the Grouping pane checkbox on the View tab. The Grouping pane isn't available for the *Chart* or *Gauge* data regions.  
  
For more information, see [Group visuals in Power BI Desktop reports](../create-reports/desktop-grouping-visuals.md).  
  
## 6. Current report status bar

The current report status bar shows the name of the server the report is connected to, or it shows "No current report server." You can select **Connect** to connect to a server.

## Next steps

- [What are paginated reports in Power BI?](paginated-reports-report-builder-power-bi.md) 

