---
title: "View parameters for paginated reports in the Power BI service | Microsoft Docs"
description: In this article, you learn how to interact with parameters for paginated reports in the Power BI service.
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: report-builder
ms.topic: conceptual
ms.date: 09/14/2018
ms.author: maggies
---
# View parameters for paginated reports in the Power BI service

In this article, you learn how to interact with parameters for paginated reports in the Power BI service.  A report parameter provides a way to filter report data. Parameters offer a list of available values, and you can choose one or many values. Sometimes parameters have a default value, and sometimes you have to choose a value before you can see the report.  

When you view a report that has parameters, the report viewer toolbar displays each parameter so you can interactively specify values. The following illustration shows the parameter area for a report withparameters @ReportMonth, @ReportYear, @EmployeeID, @ShowAll, @ExpandTableRows, @CategoryQuota, and @SalesDate.  
  
Image: View report with parameters  
  
1.  **Parameters pane** The report viewer toolbar displays a prompt and default value for each parameter. You can customize the layout of parameters in the parameters pane. For more information, see [Customize the Parameters Pane in a Report &#40;Report Builder&#41;](../../reporting-services/report-design/customize-the-parameters-pane-in-a-report-report-builder.md).  
  
2.  **@SalesDate parameter** The parameter @SalesDate is data type **DateTime**. The prompt Select the Date appears next to the text box. To modify the date, type a new date in the text box or use the calendar control.  
  
3.  **@ShowAll parameter** The parameter @ShowAll is data type **Boolean**. Use the radio buttons to specify **True** or **False**.  
  
4.  **Show or Hide Parameter Area handle** On the report viewer toolbar, click this arrow to show or hide the parameters pane.  
  
5.  **@CategoryQuota parameter** The parameter @CategoryQuota is data type **Float**, so it takes a numeric value.  @CategoryQuota is set to allow multiple values.  
  
6.  **View Report**  After you enter parameter values, click **View Report** to run the report. If all parameters have default values, the report runs automatically on first view.  

## Next steps

[Create parameters for paginated reports in the Power BI service](paginated-reports-parameters.md)
