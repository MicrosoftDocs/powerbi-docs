---
title: Power BI embedded analytics APIs using automatic retention policy for real-time data
description: Learn about the automatic retention policy in the Power BI service. 
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 06/08/2018
---

# Automatic retention policy for real-time data

The automatic retention policy in the Power BI service is a query string parameter, which enables a default retention policy to automatically clean up old data while keeping a constant flow of new data going into your dashboard. The first retention policy is called *first in first out (FIFO)*. When enabled, the data is collected in a table until it hits 200,000 rows. Once the data goes beyond 200,000 rows, the oldest rows get dropped from the dataset. This maintains between 200,000 and 210,000 rows of only the latest data.  
  
<center>

![retention policy](media/api-Automatic-retention-policy-for-real-time-data/retention-policy.png) 

</center>

The retention policies are enabled when you first create your datasets. All you need to do is add the "default retention policy" query parameter to your POST datasets call and set it equal to *basicFIFO*.  

```console
POST https://api.powerbi.com/v1.0/myorg/datasets?defaultRetentionPolicy={None | basicFIFO}
```
