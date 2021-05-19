---
title: Automatic aggregations 
description: This article describes using automatic aggregations to optimize query performance.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 05/18/2021
LocalizationGroup: Transform and shape data
---
# Automatic aggregations

Training can be scheduled to occur on a daily, weekly or monthly basis. Training can be trit created by the user. For example, if I have three refresh slots created, (8:00 AM, 9:00 AM, and 10:00 AM), then training would occur at 8:00 AM (along with the refresh). During the other two slots, only refresh would occur.
You can also manually trigger training at any time using the TOM command \<Insert command>

### Fine tuning percentage of cached qu

### Fine-tun

### Refresh frequency

In dataset settings, you can schedule up to 48 refreshes per day. Datasets in a workspace assigned to a Premium capacity with the XMLA endpoint enabled for read-write support unlimited refreshes when configured programmatically with TMSL or PowerShell.



Be sure to configure enough refreshes throughout the day to ensure aggregated data reflects the most up to date data at the data source, but not so many refreshes that resources are consumed unnecessarily.

### Time zone

### Time

### Send refresh failure notifications to