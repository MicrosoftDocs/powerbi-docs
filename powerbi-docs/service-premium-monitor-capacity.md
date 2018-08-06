---
title: Using the report to monitor Power BI Premium in your organization
description: Monitoring Power BI Premium capacities in the Admin portal using the report
author: mgblythe
ms.author: mblythe
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-admin
ms.topic: conceptual
ms.date: 08/08/2018
LocalizationGroup: Premium
---

# Using the report to monitor Power BI Premium in your organization

This article aims to give an in-depth overview of the Power BI report built using Power BI diagnostic APIs ( TODO: add link to beta version of Power BI diagnostic APIs when made public) to support admins in monitoring the health of their capacity and taking appropriate steps to scale up or down as needed based on the metrics provided.

![Usage in 7 days](media/service-premium-monitor-capacity/Usage in days.png)

Today, the Premium Capacity admin portal provides four gauges which indicate the load placed and resource utilized by your capacity in past week. These four tiles work on an hourly time windows and indicate how many hours in the past week the corresponding metric was above 80% utilization indicating potentially a degraded end user experience. The new report is intended to complement the existing tiles in a more granular way focusing on better and informative metrics measures indicative of real issues.

## Overview of the report

![Premium report overview](media/service-premium-monitor-capacity/premium report overview.png)