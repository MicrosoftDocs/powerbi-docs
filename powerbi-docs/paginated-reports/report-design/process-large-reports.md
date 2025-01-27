---
title: "Process large Power BI paginated reports | Microsoft Docs"
description: Find out how to run large paginated reports properly by following configuration and rendering recommendations.
author: kfollis
ms.author: kfollis
ms.reviewer: rpatkar
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 01/24/2023
---
# Process large Power BI paginated reports
  Large Power BI paginated reports present certain processing challenges and require certain configurations if they are to run properly. Large reports shouldn't be run on demand unless you configure them to support pagination.  
  
> [!NOTE]  
>  Page breaks are enabled by default. Don't disable page breaks if you think the report will contain a large amount of data. The rendering format that is used to initially render a report opens a report in a browser. If the report isn't paginated, all of the data is included in a single page, which most browsers can't accommodate. For example, a report that contains 5,000 rows of data almost certainly can't be viewed in a browser in a single page.  
  
 If you're working with a large report, choose report execution, rendering, and delivery options that can accommodate large documents. Report size is largely determined by the row set that comes back from the query and the rendering extension that is used to present the report.  
  
 For reports that contain volatile data, report size can change dramatically from one report run to the next. In this case, monitor the data source to determine how data volatility affects your report and whether you need to follow the steps prescribed in this topic.  
  
## Configuration recommendations  
 Recommendations for report execution, report rendering, and report access include the following items:  
  
-   Design the report to support pagination. The paginated reports workload sends a report one page at a time. 
-   Limit access to the report. Configure the report to use item-level security.
  
## Rendering recommendations  
 Before you configure report distribution, it is important to know which rendering clients can accommodate large documents.
  
 Performance and memory consumption varies for each rendering format. The same report will render at different rates and require different amounts of memory depending on the format you select. The fastest and least memory intensive formats include CSV, XML, and HTML. PDF and Excel have the slowest performance, but for different reasons. PDF is CPU-intensive, while Excel is RAM-intensive. Image rendering falls in-between the two groups. You can specify the format when you define how the report is distributed.  
  
## Related content

- [Paginated reports capacity planning](/power-bi/paginated-reports/paginated-capacity-planning)
