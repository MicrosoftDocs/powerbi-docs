---
title: Power BI REST API limitations
description: The Power BI REST API has the following limitations.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 06/08/2018
---

# Power BI REST API limitations  
  
**To POST Rows**
  
* 75 max columns
* 75 max tables
* 10,000 max rows per single POST rows request  
* 1,000,000 rows added per hour per dataset  
* 5 max pending POST rows requests per dataset  
* 120 POST rows requests per minute per dataset
* If table has 250,000 or more rows, 120 POST rows requests per hour per dataset
* 200,000 max rows stored per table in FIFO dataset
* 5,000,000 max rows stored per table in 'none retention policy' dataset  
* 4,000 characters per value for string column in POST rows operation
  
## See also

* [Azure AD service limits and restrictions](/azure/active-directory/active-directory-service-limits-restrictions)   
* [Overview of Power BI REST API](/rest/api/power-bi/)