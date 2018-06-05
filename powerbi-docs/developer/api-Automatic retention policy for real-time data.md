---
title: Automatic retention policy for real-time data
description: Learn about the automatic retention policy in the Power BI service
author: markingmyname
manager: kfile
ms.author: maghan
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-developer
ms.topic: conceptual
ms.date: 06/05/2018
---

# Automatic retention policy for real-time data

The automatic retention policy in the Power BI service is a query string parameter which enables a default retention policy to automatically clean up old data while keeping a constant flow of new data going into your dashboard. The first retention policy is called basic first in first out (FIFO). When enabled, data will collect in a table until it hits 200,000 rows. Once the data goes beyond 200,000 rows, the oldest rows will get dropped from the dataset. This will maintain between 200,000 and 210,000 rows of only the latest data.  
  
![retention policy](media/api-Automatic retention policy for real-time data/retention policy.jpeg)
  
The retention policies are enabled when you first create your datasets. All you need to do is add the “defaultRetentionPolicy” query parameter to your POST datasets call and set it equal to “basicFIFO”.  
  
    POST https://api.powerbi.com/v1.0/myorg/datasets?defaultRetentionPolicy={None | basicFIFO}  
  
## To learn more about how to enable default retention policy

* [Create Dataset](Create%20Dataset.md)  
* [Try the call now using our interactive API console](http://docs.powerbi.apiary.io/#reference/datasets/datasets-collection/create-a-dataset)   