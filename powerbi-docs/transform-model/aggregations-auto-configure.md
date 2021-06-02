---
title: Configure automatic aggregations 
description: This article describes how to enable and configure automatic aggregations to optimize query performance for DirectQuery datasets.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 05/18/2021
LocalizationGroup: Transform and shape data
---
# Configure automatic aggregations

This article describes how to enable and configure automatic aggregations for DirectQuery datasets. Configuring automatic aggregations is done in the service, in dataset Settings. Tasks include enabling the feature for a dataset, and scheduling at least one or more refreshes. After the first refresh has completed, you can then further optimize performance by the changing the percentage of aggregations that are cached.

> [!IMPORTANT]
> Automatic aggregations is in Preview. When in preview, feature functionality, user experience, and documentation are likely to change.

## Configure

1. In the service > dataset Settings, expand **Optimize performance**.
1. Click the Automate aggregations slider to **On**. If the slider is greyed out, ensure Data source credentials for the dataset are configured and signed in.
    
    Leave the **Fine-tune the percentage of cached queries** slidebar at the default 75% for the first few refresh frequency cycles. This gives the training and refresh processes time to self optimize at the default percentage.
1. In **Refresh settings**, specify a refresh frequency and your time zone.
1. Click **Add another time**, and then specify a refresh time.
    
    You must configure at least one refresh. The first refresh for the frequency you selected will include both the training process and a refresh that loads new and updated aggregations into the cache. Schedule additional refreshes to ensure report queries that hit the cache are getting results that are most in-sync with the backend data source.
  
    :::image type="content" source="media/aggregations-automatic/auto-aggs-refresh.png" alt-text="Configure aggregations refresh dialog":::

1. In **Send refresh failure notifications to**, specify additional contacts if necessary. Contacts should have dataset admin permissions in order to investigate and change settings if needed.
1. Click **Apply**.

You can monitor refreshes in **Refresh history**.

## Fine tune

After the first refresh is complete, you can change the percentage of aggregations cached. Keep in mind, changing the percentage of queries cached

1. In dataset Settings > Optimize performance, expand Visualize how changing the percent cached affects this workload.
1. In **Set threshold**, specify a target query response time, in seconds. Threshold appears as a marker line on the lift chart.
1. Need text.