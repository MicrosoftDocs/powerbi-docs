---
title: "Create parameters for paginated reports in the Power BI service | Microsoft Docs"
description: In this article, you learn how to create parameters for paginated reports in the Power BI service.
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: report-builder
ms.topic: conceptual
ms.date: 11/05/2018
ms.author: maggies
---
# Create parameters for paginated reports in the Power BI service

In this article, you learn how to create parameters for paginated reports in the Power BI service.  A report parameter provides a way to choose report data and vary the report presentation. You can provide a default value and a list of available values, and your report readers can change the selection.  

The following illustration shows Design view in Report Builder for a report with the parameters @BuyingGroup, @Customer, @FromDate, and @ToDate. 
  
![Parameters in Report Builder](media/paginated-reports-parameters/power-bi-paginated-parameters-report-builder.png)
  
1.  The report parameters in the Report Data pane.  
  
2.  The table with one of the parameters in the dataset.  
  
3.  The Parameters pane. You can customize the layout of parameters in the parameters pane. 
  
4.  The parameters @FromDate and @ToDate have the data type **DateTime**. When viewing the report, you can either type a date in the text box or choose a date in the calendar control. 

5.  One of the parameters in the **Dataset Properties** dialog box.  

  
## Create or edit a report parameter  
  
1.  Open your paginated report in Report Builder.

1. In the **Report Data** pane, right-click the **Parameters** node > **Add Parameter**. The **Report Parameter Properties** dialog box opens.  
  
2.  In **Name**, type a name for the parameter or accept the default name.  
  
3.  In **Prompt**, type text to appear next to the parameter text box when the user runs the report.  
  
4.  In **Data type**, select the data type for the parameter value.  
  
5.  If the parameter can contain a blank value, select **Allow blank value**.  
  
6.  If the parameter can contain a null value, select **Allow null value**.  
  
7.  To allow a user to select more than one value for the parameter, select **Allow multiple values**.  
  
8.  Set the visibility option.  
  
    -   To show the parameter on the toolbar at the top of the report, select **Visible**.  
  
    -   To hide the parameter so that it does not display on the toolbar, select **Hidden**.  
  
    -   To hide the parameter and protect it from being modified on the report server after the report is published, select **Internal**. The report parameter can then only be viewed in the report definition. For this option, you must set a default value or allow the parameter to accept a null value.  
  
9. Select **OK**. 
  
## Next steps

See [View parameters for paginated reports](paginated-reports-view-parameters.md) to see how the parameters look in the Power BI service.

For in-depth information about parameters in paginated reports, see the [Report Parameters (Report Builder and Report Designer)](https://docs.microsoft.com/sql/reporting-services/report-design/report-parameters-report-builder-and-report-designer) article in the SQL Server Reporting Services documentation  
