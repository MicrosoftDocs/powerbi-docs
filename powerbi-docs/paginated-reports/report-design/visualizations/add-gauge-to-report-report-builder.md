---
title: "Add a gauge to a Power BI paginated report | Microsoft Docs"
description: Learn how to summarize data in a Power BI paginated report in a visual format by creating a gauge data region and dragging report dataset fields to a pane on the gauge in Power BI Report Builder.
ms.date: 03/28/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Add a gauge to a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

In a Power BI paginated report, when you want to summarize data in a visual format, you can use a gauge data region. After you add a gauge data region to the design surface, you can drag report dataset fields to a data pane on the gauge.  
  
## Add a gauge to your report  
  
1. Create a report or open an existing report.  
  
1. On the Insert tab, double-click Gauge. The **Select Gauge Type** dialog box opens.  
  
1. Select the type of gauge you want to add. Select **OK**.
  
    > [!NOTE]  
    >  Unlike charts, gauges have only two types: linear and radial. The available gauges in the **Select a Gauge Type** dialog box are templates for these two types of gauges. For this reason, you cannot change the gauge type after you add the gauge to your report. You must delete and re-add a gauge to change its type.  
  
     If the report has no data source and dataset the **Data Source Properties** dialog box opens and takes you through the steps to create both. For more information see, [Add and verify a data connection &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-data/add-and-verify-a-data-connection-report-builder-and-ssrs).  
  
     If the report has a data source, but no dataset the **Dataset Properties** dialog box opens and takes you through the steps to create one. For more information, see [Create a shared dataset](../../paginated-reports-create-embedded-dataset.md).  
  
1. Select the gauge to display the data pane. By default, a gauge has one pointer corresponding to one value. You can add additional pointers.  
  
1. Add one field from the dataset to the data field drop-zone. You can add only one field. If you want to display multiple fields, you must add additional pointers, one for each field.  
  
     Right-click the gauge scale, and select **Scale Properties**. Type a value for the **Minimum** and **Maximum** of the scale. For more information, see [Set a minimum or maximum on a gauge &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/set-a-minimum-or-maximum-on-a-gauge-report-builder-and-ssrs).  
  
## Related content

- [Nested data regions &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/nested-data-regions-report-builder-and-ssrs)   
- [Gauges &#40;Power BI Report Builder&#41;](gauges-report-builder.md)  
  
  
