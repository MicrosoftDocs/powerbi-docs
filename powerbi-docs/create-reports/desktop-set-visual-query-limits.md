---
title: Set visual query limits in Power BI Desktop
description: Learn how to define timeouts and memory limits for visual queries in Power BI Desktop. 
author: rien
ms.author: rien
ms.reviewer: ''
ms.custom:
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/23/2023
LocalizationGroup: Create reports
---

# Set visual query limits in Power BI Desktop

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

When you load a report page or make changes to the fields in a visual, that visual will send a query to your report's data source. Processing these queries requires both time and computer memory. In the Power BI service, depending on where your data is hosted, that capacity will apply different limits to the time a query is allowed to run and the amount of memory that query is allowed to use. 

The following table shows the timeouts and memory limits applied by different capacities.

| Capacity | Timeout | Memory limit |
| -------- | ------- | ------------ |
| Shared | 225 seconds | 1048576 KB (1 GB) | 
| Premium | 225 seconds | 10485760 KB (10 GB) | 
| SQL Server Analysis Services | 600 seconds | 1048576 KB (1 GB) | 
| Azure Analysis Services | 600 seconds | 10485760 KB (10 GB) | 

If a visual sends a query that reaches one of the limits applied by the hosting capacity, that visual will display an error. 

![Screenshot of the error message.](media/desktop-set-visual-query-limits/desktop-set-visual-query-limits-00.png)

Power BI Desktop will not naturally apply any of these limits to local models. However, you can use query limit simulations to test any limits which may be applied to your report after you publish it. 

## Apply query limits in the Options menu

1. Select **File** > **Options and settings** > **Options**
2. Under **Current file**, select **Report settings**.
3. Scroll to the **Query limit simulations** section. 
   ![Screenshot of the options menu where the query limit simulations section is available.](media/desktop-set-visual-query-limits/desktop-set-visual-query-limits-01.png)
4. Using the dropdown menu, select a capacity to simulate. You can choose from:
   - Auto (recommended)
   - Shared capacity
   - Premium capacity
   - SQL Server Analysis Services
   - Azure Analysis Services
   - Custom limits
   - No query limits

By default, new reports have "auto (recommended)" selected. With auto limits, Power BI will do its best to identify where the model is hosted and apply those limits. Otherwise, it will default to the Shared capacity limits to ensure that queries which complete on Desktop will complete for published reports, regardless of where the report's data ends up hosted. Underneath the dropdown, you will be able to see the exact timeout and memory limits currently being applied for the chosen capacity. 

If you choose to apply custom limits, enter specific timeout and memory limits in the input field. When you set your own limits, you can use "0" to indicate "no limits." 

## Considerations and troubleshooting


- Reports created before this feature was available are set to "no query limits."  If a visual or report seems to be working without error on Power BI Desktop, but other users are running into errors trying to view the published report, consider applying query limits as described in this article.
- Limits set in this manner will apply to all queries sent from the report view. Queries sent from the data or model views will not be affected.
- With live connected reports, you may notice visuals erroring before they reach query limits you set. This might occur if the external Analysis Services engine to which your report is live connected has its own stricter query limits. Even when Power BI Desktop applies query limits through the report setting described in this article, queries will still be subject to any other limits imposed by the data source. 
