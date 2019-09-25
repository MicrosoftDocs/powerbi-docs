---
title: Best practices for Power BI dataflows
description: Best practices for Power BI dataflows
author: mohaali
manager: mohaali
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 09/19/2019
ms.author: davidi

LocalizationGroup: Data from files
---
# Dataflows best practice

This article provides best practices for designing dataflows in Power BI. You can use this guidance to learn how to create dataflows, apply these practices to your own dataflows.

> [!NOTE]
> The recommendations made in this article are guidelines. For each best practice in this article, there may be legitimate reasons to deviate from this guidance. 
> 
> 

### Split ingestion and transformation to use the enhanced compute engine

When creating dataflows, you may be tempted to create a single dataflow with all entities, transformations, joins, and enhancements in one place. For smaller datasets a single dataflow may be effective. But when dealing with larger data volumes, performing joins or certain transformations can sometimes experience throttle or memory limits. To address those issues, an enhanced engine has been released for Power BI Premium users that scales to much larger data volumes. The enhanced compute engine works against linked or computed entities only, so creating a separate dataflow for ingestion and a linked dataflow to perform all the complex merges and transformations can benefit from the enhanced engine.

Splitting dataflows is also beneficial for diagnosing and debugging refresh issues,  especially when working with sources that have throttling limits.

### Perform actions that can use the enhanced compute engine

Ensure you make use of the enhanced compute engine by ensuring you perform joins and filter transformations first in a computed entity before performing other types of transformations.

### Split dataflows when connecting to SharePoint

When working with SharePoint and connecting to multiple files, you may notice sporadic failures. SharePoint throttles requests to ensure it remains reliable and responsive. As a consequence, when connecting to Excel files from SharePoint you may be inclined to download all files in a single dataflow. If you're downloading many files, more than 20, create two dataflows or more to split the refresh load, and overcome SharePoint throttling.

### Avoid scheduling refresh for linked entities inside the same workspace

If you're regularly being locked out of your dataflows that contain linked entities, it may be a result of corresponding, dependent dataflow inside the same workspace are locked during dataflow refresh. Such locking provides transactional accuracy and ensures both dataflows successfully refresh, but it can block you from editing. 

If you set up a separate schedule for the linked dataflow, dataflows can refresh unnecessarily and block you from editing the dataflow. There are two recommendations to avoid this issue: 

* Avoid setting a refresh schedule for a linked dataflow in the same workspace as the source dataflow
* If you want to configure a refresh schedule separately, and want to avoid the locking behavior, separate the dataflow in a separate workspace.

### Create a separate workspace for ingestion, transformation

To provide access to underlying dataflow data for many users, without allowing access to the raw data of the underlying source system, create a separate workspace that has all the data you need to share, and assign permissions. Individual dataflow permissions are not currently supported.

### Ensure capacity is in the same region

Dataflows do not currently support multi-geo regions. The Premium capacity must be in the same region as your Power BI tenant.

### Separate on-premises sources from cloud sources

In addition to the previously described best practices, you can create a separate dataflow for each type of source, such as on-premises, cloud, SQL Server, Spark, Dynamics, and so on. It's strongly recommended to split your dataflow by data source type. Such separation by source type facilitates quick troubleshooting, and avoids internal limits when refreshing your dataflows.

### Separate dataflows into a separate capacity

If you are experiencing throttling limits, or seeing regular failures for your dataflows due to memory limits on your capacity, consider separating your dataflows, or scaling up your Premium capacity for additional memory.

## Next Steps

This article provided information about best practices for dataflows. For more information about dataflows, the following articles may be helpful:

* [Self-service data prep with dataflows](service-dataflows-overview.md)
* [Create and use dataflows in Power BI](service-dataflows-create-use.md)
* [Using computed entities on Power BI Premium](service-dataflows-computed-entities-premium.md)
* [Using dataflows with on-premises data sources](service-dataflows-on-premises-gateways.md)

For information about CDM development and tutorial resources, see the following:
* [Common Data Model - overview ](https://docs.microsoft.com/powerapps/common-data-model/overview)
* [CDM folders](https://go.microsoft.com/fwlink/?linkid=2045304)
* [CDM model file definition](https://go.microsoft.com/fwlink/?linkid=2045521)


For more information about Power Query and scheduled refresh, you can read these articles:
* [Query overview in Power BI Desktop](desktop-query-overview.md)
* [Configuring scheduled refresh](refresh-scheduled-refresh.md)
