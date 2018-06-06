---
title: Power BI REST API supported data types
description: Power BI REST API has the following supported date types and restrictions
author: markingmyname
manager: kfile
ms.author: maghan
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-developer
ms.topic: conceptual
ms.date: 06/08/2018
---

# Power BI REST API supported data types and restrictions

The Power BI REST API has the following supported [EDM](http://msdn.microsoft.com/library/vstudio/ee382832.aspx) date types and restrictions:  
<table><tr><td>Data type</td><td>Restrictions</td></tr><tr><td>Int64</td><td>Int64.MaxValue and Int64.MinValue not allowed.</td></tr><tr><td>Double</td><td>Double.MaxValue and Double.MinValue values not allowed. NaN not supported.+Infinity and -Infinity not supported in some functions (e.g. Min, Max).</td></tr><tr><td>Boolean</td><td> None</td></tr><tr><td>Datetime</td><td>During data loading we quantize values with day fractions to whole multiples of 1/300 seconds (3.33ms).</td></tr><tr><td>String</td><td>Currently allows up to 128K characters.</td></tr></table>  
  
## See also  
[Overview of Power BI REST API](https://docs.microsoft.com/rest/api/power-bi/)