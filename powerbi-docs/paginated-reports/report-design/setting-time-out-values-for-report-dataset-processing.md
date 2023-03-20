---
title: "Setting time-out values for report dataset processing | Microsoft Docs"
description: In paginated reports, you can specify time-out values to set limits on how system resources are used.
ms.date: 03/14/2023
ms.service: powerbi
ms.subservice: report-builder


ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: joshger
---
# Setting time-out values for report dataset processing
Most time-out errors occur during query processing. If you are encountering time-out errors, try increasing the dataset query time-out value. 
  
## Setting a query time-out for a dataset in a report  
 Query time-out values are specified during report authoring when you define an embedded dataset. The time-out value is stored with the report, in the Timeout element of the report definition. By default, this value is set to 0 seconds which results in an infinite timeout. 
 
![Screenshot of a dataset-properties-timeout.png](/powerbi-docs/paginated-reports/media/paginated-reports-create-embedded-dataset/power-bi-dataset-properties-timeout.png "Power BI dataset properties")  
 
 Users who have permission to modify the properties of a published report can reset this value by editing the report definition file.
 The value you specify determines how long the Power BI service waits for query processing to complete when retrieving data from the report’s data source.
 
  
## Considerations and limitations
1.  The Power BI on-premises data gateway has a 600 second query timeout. A paginated report dataset query set to 0 seconds will not override the gateway timeout. So, the report will fail with the error “_Unable to render paginated report. Data for this report could not be fetched in the allocated time. If you continue to experience this error contact the report author or data source owner to increase the time-out._” To override the gateway timeout, set the dataset query timeout greater than 600 seconds.
2.	The maximum possible timeout value is 2147483646. However, configuring the dataset query timeout for this long could result in a timeout outside of the paginated report.
 
  
## Next steps 
 [Understand paginated report data in Power BI Report Builder](/powerbi-docs/paginated-reports/report-builder-data)   
 [Create an embedded dataset for a Power BI paginated report](/powerbi-docs/paginated-reports/paginated-reports-create-embedded-dataset)   
 [Paginated reports in Power BI: FAQ](/powerbi-docs/paginated-reports/paginated-reports-faq)   
