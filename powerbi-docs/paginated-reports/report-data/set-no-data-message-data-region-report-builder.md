---
title: "Set a No Data message for a data region (Power BI Report Builder)"
description: Learn how to set a no data message to show in a rendered report in place of a data region that has no data.
ms.date: 09/11/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: rpatkar
---
# Set a No Data message for a data region (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  When you want to specify text to show in the rendered report in place of a data region that has no data, set one of these properties:

- The [NoRowsMessage property](#set-the-norowsmessage-property-for-a-table-matrix-or-list) for a table, matrix, or list data region.
- The [NoDataMessage property](#set-a-no-data-message-for-a-data-region-power-bi-report-builder) for a chart data region
- The [NoDataText property](#set-the-nodatatext-property-for-a-color-scale-for-a-map) for the color scale for a map.
- The [NoRowsMessage property](#set-the-norowsmessage-for-a-subreport) for a subreport when no datasets in the subreport have data at run time.

At run time, the report processor runs the query for each dataset in a report and the dataset query may produce no result set. For a data region bound to an empty dataset, you can specify text to display instead of displaying an empty data region.
  
## Set the NoRowsMessage property for a table, matrix, or list  
  
1. In Design view, select the table, matrix, or list data region or subreport on the design surface to select it. The Properties pane displays the properties for the selected item.  
  
1. In the Properties pane, type the text that you want to display as a message in **NoRowsMessage** property field.  
  
     Alternatively, from the drop-down list, select **Expression** to open the **Expression** dialog box and create an expression.  
  
## Set the NoDataMessage property for a chart  
  
1. In Design view, select the chart on the design surface to select it. The Properties pane displays the properties for the selected item.  
  
1. In the Properties pane, expand the node for **NoDataMessage**.  
  
1. In **Caption**, type the text that you want to display as a message in **NoDataMessage** property field.  
  
     Alternatively, from the drop-down list, select **Expression** to open the **Expression** dialog box and create an expression.  
  
## Set the NoRowsMessage for a subreport  
  
1. In Design view, select the subreport on the design surface to select it. The Properties pane displays the properties for the selected item.  
  
1. In the Properties pane, type the text that you want to display as a message in **NoRowsMessage** property field.  
  
     Alternatively, from the drop-down list, select **Expression** to open the **Expression** dialog box and create an expression.  
  
## Set the NoDataText property for a color scale for a map  
  
1. In Design view, select the color scale on the map to select it. The Properties pane displays the properties for the selected item.  
  
1. In the Properties pane, in **NoDataText**, type the text that you want to display as a label for colors with no data value.  
  
     Alternatively, from the drop-down list, select **Expression** to open the **Expression** dialog box and create an expression.  
  
## Related content

- [Subreports (Power BI Report Builder)](../subreports.md)
- [Tables, Matrices, and Lists (Power BI Report Builder)](../report-builder-tables-matrices-lists.md)
- [Charts (Power BI Report Builder)](../report-design/visualizations/charts-report-builder.md)   
- [Maps (Report Builder)](../report-builder/data-regions-maps-report-builder.md)
