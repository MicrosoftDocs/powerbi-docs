---
title: "Create parameters for paginated reports in Power BI Report Builder"
description: In this article, you learn how to create parameters for paginated reports in the Power BI Report Builder.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 12/11/2025
ai-usage: ai-assisted
---

# Create parameters for paginated reports in Power BI Report Builder

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

In this article, you learn how to create parameters in Power BI Report Builder for paginated reports that are displayed in the Power BI service. A report parameter provides a way for report readers to choose report data and vary the report presentation. You can provide a default value and a list of available values. Your report readers can change the selection. They can also type in the parameter text boxes to search for values. For more information about how your business users interact with parameters in the Power BI service, see [View parameters for paginated reports](../../consumer/paginated-reports-view-parameters.md).  

The following illustration shows Design view in Power BI Report Builder for a report with the parameters @BuyingGroup, @Customer, @FromDate, and @ToDate.
  
:::image type="content" source="media/paginated-reports-create-parameters/power-bi-paginated-parameters-report-builder.png" alt-text="Screenshot showing parameters in Report Builder.":::
  
1. The report parameters in the Report Data pane.  
1. The table with one of the parameters in the dataset.  
1. The Parameters pane. You can customize the layout of parameters in the parameters pane.
1. The parameters @FromDate and @ToDate have the data type **DateTime**. When viewing the report, you can either type a date in the text box, choose a date in the calendar control, or select **Go to today**.
1. One of the parameters in the **Dataset Properties** dialog box.  

## Prerequisites

[!INCLUDE [power-bi-paginated-prerequisites](../../includes/power-bi-paginated-prerequisites.md)]
  
## Create or edit a report parameter  
  
1. Open your paginated report in Power BI Report Builder.
1. In the **Report Data** pane, right-click the **Parameters** node and select **Add Parameter**. The **Report Parameter Properties** dialog box opens.  
1. In **Name**, type a name for the parameter or accept the default name.  
1. In **Prompt**, type text to appear next to the parameter text box when the user runs the report.  
1. In **Data type**, select the data type for the parameter value.  
1. If the parameter can contain a blank value, select **Allow blank value**.  
1. If the parameter can contain a null value, select **Allow null value**.  
1. To allow a user to select more than one value for the parameter, select **Allow multiple values**.  
1. Set the visibility option.  
   - To show the parameter on the toolbar at the top of the report, select **Visible**.  
   - To hide the parameter so it doesn't display on the toolbar, select **Hidden**.  
   - To hide the parameter and protect it from being modified on the report server after the report is published, select **Internal**. The report parameter can then only be viewed in the report definition. For this option, you must set a default value or allow the parameter to accept a null value.  
1. To make the parameter fully functional, you also need to:
   - **Set available values** (optional): On the **Available Values** page, choose whether to manually enter values or get them from a query.
   - **Set default values** (optional): On the **Default Values** page, specify default values for the parameter.
   - **Connect the parameter to your dataset**: In the **Dataset Properties** dialog, add the parameter to your query or use it as a filter.

   For complete parameter setup examples and advanced options, see [Report parameters in Power BI Report Builder](report-builder-parameters.md).

1. Select **OK**.

## Related content

To see how the parameters look in the Power BI service, see [View parameters for paginated reports](../../consumer/paginated-reports-view-parameters.md).

For in-depth information about parameters in paginated reports, see [Report parameters in Power BI Report Builder](report-builder-parameters.md).
