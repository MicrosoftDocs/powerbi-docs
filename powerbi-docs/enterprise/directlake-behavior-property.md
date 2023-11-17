---
title: Learn about Direct Lake in Power BI and Microsoft Fabric
description: Describes using Direct Lake to analyze very large semantic models in Power BI and Microsoft Fabric.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 11/09/2023
LocalizationGroup: Admin
---
# Direct Lake

By default, Direct Lake semantic models fallback to DirectQuery mode if an issue prevents efficient loading of OneLake data into memory. You can 

Configure the DirectLakeBehavior by using Tabular Object Model (TOM) or Tabular Model Scripting Language (TMSL)

Automatic - (Default)

DirectLakeOnly - Disables fallback to DirectQuery mode. I an issue prevents loading of OneLake data into memory, an error is returned. 

DirectQuery only - All model queries to OneLake use DirectQuery mode.

## See also

[Create a Lakehouse for Direct Lake](directlake-create-lakehouse.md)  
[Analyze query processing for Direct Lake datasets](directlake-analyze-qp.md)  
