---
title: "Preview a Power BI paginated report in Report Builder  | Microsoft Docs"
description: Learn how to preview paginated reports before you publish them in the Power BI service.  
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: report-builder
ms.topic: conceptual
ms.date: 10/31/2018
ms.author: maggies
---
# Preview a paginated report in Report Builder 

When you're designing a paginated report in Report Builder, you want to preview it before you publish it in the Power BI service.

In Report Design View in Report Builder, you're working with a representation of the data indicated by the field name or expression, and not the actual data. To see the actual data in the context of the report, you run the report to preview the data from the underlying database displayed in the report layout. Switching between designing and running your report, you can adjust its design and see the results immediately. 

## Preview your report

- Select **Run** in the **Views** group on the ribbon.  
  
When you select **Run**, Report Builder connects to the report data sources, caches the data on your computer, combines the data and the layout and then renders the report in the HTML Viewer. You can run your report as often as you like while you design it. When you are satisfied with the report, you save the report to your local computer. Then you [publish it to the Power BI service](paginated-reports-preview-report-builder.md). There, you can share it with others who have permissions to view your report.  
  
## Run a report with parameters  

When you run your report, it is processed automatically. If the report contains parameters, all the parameters must have default values before the report can run automatically. If a parameter does not have a default value, when you run the report you need to choose a value for the parameter, and then click **View Report** on the **Run** tab. For more information, see Report Parameters.  
  
## Print Preview  

 When you preview a report in run mode, it resembles a report produced in HTML. The preview is not HTML, but the layout and pagination of the report is similar to HTML output. You can change the view to represent a printed report by switching to print preview mode. Click the **Print Preview** button on the **Run** tab. The report will display as though it were on a physical page. This view resembles the output produced by the Image and PDF rendering extensions. Print Preview is not an image or PDF file, but the layout and pagination of the report are similar to the output of those formats.  
  
## Next steps

[What are paginated reports in Power BI Premium? (Preview)](paginated-reports-report-builder-power-bi.md) 

  
  
