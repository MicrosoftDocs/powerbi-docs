---
title: How to configure workloads in Power BI Premium
description: Learn how to configure workloads in a Power BI Premium capacity.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 04/02/2021
LocalizationGroup: Premium
---

# Configure workloads in a Premium capacity

This article describes enabling and configuring workloads for Power BI Premium capacities. By default, capacities support only the workload associated with running Power BI queries. You can also enable and configure additional workloads for **[AI (Cognitive Services)](../transform-model/dataflows/dataflows-machine-learning-integration.md)**, **[Dataflows](../transform-model/dataflows/dataflows-introduction-self-service.md)**, and **[Paginated reports](../paginated-reports/paginated-reports-save-to-power-bi-service.md)**.

> [!NOTE]
> Power BI Premium recently released a new version of Premium, called **Premium Gen2**, which is currently in preview. Premium Gen2 will simplify the management of Premium capacities, and reduce management overhead. For more information, see [Power BI Premium Generation 2 (preview)](service-premium-what-is.md#power-bi-premium-generation-2-preview).
>
>To review the Power BI Embedded Gen2 enhancements, refer to [Power BI Embedded Generation 2](../developer/embedded/power-bi-embedded-generation-2.md).

> [!NOTE]
> You can also get Premium Per User (PPU) licenses for individuals, which provides many of the features and capabilities of a Premium capacity, and also incorporates all functionality included with a Power BI Pro license. For more information, see [Power BI Premium Per User](service-premium-per-user-faq.yml).

## Default memory settings

Query workloads are optimized for and limited by resources determined by your Premium capacity SKU. Premium capacities also support additional workloads that can use your capacity's resources. Default memory values for these workloads are based on the capacity nodes available for your SKU. Max memory settings are not cumulative. 


|                       | EM1 / A1                  | EM2 / A2                  | EM3 / A3                  | P1 / A4                  | P2 / A5                  | P3 / A6                   |
|-----------------------|---------------------------|---------------------------|---------------------------|--------------------------|--------------------------|---------------------------|
| **AI**                | Unsupported               | 40% default; 40% minimum  | 20% default; 20% minimum  | 20% default; 8% minimum  | 20% default; 4% minimum  | 20% default; 2% minimum   |
| **Datasets**          | 100% default; 67% minimum | 100% default; 40% minimum | 100% default; 20% minimum | 100% default; 8% minimum | 100% default; 4% minimum | 100% default; 2% minimum  |
| **Dataflows**         | 40% default; 40% minimum  | 24% default; 24% minimum  | 20% default; 12% minimum  | 20% default; 5% minimum  | 20% default; 3% minimum  | 20% default; 2% minimum   |
| **Paginated reports** | Unsupported               | Unsupported               | Unsupported               | 20% default; 10% minimum | 20% default; 5% minimum  | 20% default; 2.5% minimum |

> [!NOTE]
> **Premium Gen2**, currently in preview, does not require memory settings to be changed. Memory in Premium Gen2 is automatically managed by the underlying system. 


## Workload settings

The following sections go into detail about the workload settings described in the previous table. 

### AI (Preview)

The AI workload lets you use cognitive services and Automated Machine Learning in Power BI. Use the following settings to control workload behavior.

| Setting Name | Description |
|---------------------------------|----------------------------------------|
| **Max Memory (%)** | The maximum percentage of available memory that AI processes can use in a capacity. |
| **Allow usage from Power BI Desktop** | This setting is reserved for future use and does not appear in all tenants. |
| **Allow building machine learning models** | Specifies whether business analysts can train, validate, and invoke machine learning models directly in Power BI. For more information, see [Automated Machine Learning in Power BI (Preview)](../transform-model/dataflows/dataflows-machine-learning-integration.md). |
| **Enable parallelism for AI requests** | Specifies whether AI requests can run in parallel. |
|  |  |

### Datasets

The datasets workload is enabled by default and cannot be disabled. Use the following settings to control workload behavior. There is additional usage information below the table for some of the settings.

| Setting Name | Description |
|---------------------------------|----------------------------------------|
| **Max Memory (%)** | The maximum percentage of available memory that datasets can use in a capacity. |
| **XMLA Endpoint** | Specifies that connections from client applications honor the security group membership set at the workspace and app levels. For more information, see [Connect to datasets with client applications and tools](service-premium-connect-tools.md). |
| **Max Intermediate Row Set Count** | The maximum number of intermediate rows returned by DirectQuery. The default value is 1000000, and the allowable range is between 100000 and 2147483647. |
| **Max Offline Dataset Size (GB)** | The maximum size of the offline dataset in memory. This is the compressed size on disk. The default value is 0, which is the highest limit defined by SKU. The allowable range is between 0 and the capacity size limit. |
| **Max Result Row Set Count** | The maximum number of rows returned in a DAX query. The default value is -1 (no limit), and the allowable range is between 100000 and 2147483647. |
| **Query Memory Limit (%)** | The maximum percentage of available memory in the workload that can be used for executing a MDX or DAX query. The default value is 0, which results in SKU-specific automatic query memory limit being applied. |
| **Query Timeout (seconds)** | The maximum amount of time before a query times out. The default is 3600 seconds (1 hour). A value of 0 specifies that queries won't timeout. |
| **Automatic page refresh** | On/Off toggle to allow premium workspaces to have reports with automatic page refresh based on fixed intervals. |
| **Minimum refresh interval** | If automatic page refresh is on, the minimum interval allowed for page refresh interval. The default value is five minutes, and the minimum allowed is one second. |
| **Change detection measure** | On/Off toggle to allow premium workspaces to have reports with automatic page refresh based on change detection. |
| **Minimum execution interval** | If change detection measure is on, the minimum execution interval allowed to poll for data changes. The default value is five seconds, and the minimum allowed is one second. |

#### Max Intermediate Row Set Count

Use this setting to control the impact of resource-intensive or poorly designed reports. When a query to a DirectQuery dataset results in a very large result from the source database, it can cause a spike in memory usage and processing overhead. This situation can lead to other users and reports running low on resources. This setting allows the capacity administrator to adjust how many rows an individual query can fetch from the data source.

Alternatively, if the capacity can support more than the one million row default, and you have a large dataset, increase this setting to fetch more rows.

Note that this setting affects only DirectQuery queries, whereas [Max Result Row Set Count](#max-result-row-set-count) affects DAX queries.

#### Max Offline Dataset Size

Use this setting to prevent report creators from publishing a large dataset that could negatively impact the capacity. Note that Power BI cannot determine actual in-memory size until the dataset is loaded into memory. It is possible that a dataset with a smaller offline size can have a larger memory footprint than a dataset with a larger offline size.

If you have an existing dataset that is larger than the size you specify for this setting, the dataset will fail to load when a user tries to access it. The dataset can also fail to load if it is larger than the Max Memory configured for the datasets workload.

To safeguard the performance of the system, an additional SKU-specific hard ceiling for max offline dataset size is applied, regardless of the configured value. This hard ceiling does not apply to Power BI datasets which are optimized for large data sizes. For more information, see [Large models in Power BI Premium](service-premium-large-models.md).

|                                               | EM1 / A1 | EM2 / A2 | EM3 / A3 | P1 / A4 | P2 / A5 | P3 / A6 |
|-----------------------------------------------|----------|----------|----------|---------|---------|---------|
| **Hard ceiling for Max Offline Dataset Size** | 3 GB     | 5 GB     | 6 GB     | 10 GB   | 10 GB   | 10 GB   |

#### Max Result Row Set Count

Use this setting to control the impact of resource-intensive or poorly designed reports. If this limit is reached in a DAX query, a report user sees the following error. They should copy the error details and contact an administrator.

![Couldn't load data for this visual](media/service-admin-premium-workloads/could-not-load-data.png)

Note that this setting affects only DAX queries, whereas [Max Intermediate Row Set Count](#max-intermediate-row-set-count) affects DirectQuery queries.

#### Query Memory Limit

Use this setting to control the impact of resource-intensive or poorly designed reports. Some queries and calculations can result in intermediate results that use a lot of memory on the capacity. This situation can cause other queries to execute very slowly, cause eviction of other datasets from the capacity, and lead to out of memory errors for other users of the capacity.

This setting applies to all DAX and MDX queries that are executed by Power BI reports, Analyze in Excel reports, as well as other tools which might connect over the XMLA endpoint.

Note that data refresh operations may also execute DAX queries as part of refreshing the dashboard tiles and visual caches after the data in the dataset has been refreshed. Such queries may also potentially fail because of this setting, and this could lead to the data refresh operation being shown in a failed state, even though the data in the dataset was successfully updated.

The default setting is 0, which results in the following SKU-specific automatic query memory limit being applied.

|                                  | EM1 / A1 | EM2 / A2 | EM3 / A3 | P1 / A4 | P2 / A5 | P3 / A6 |
|----------------------------------|----------|----------|----------|---------|---------|---------|
| **Automatic Query Memory Limit** | 1 GB     | 2 GB     | 2 GB     | 6 GB    | 6 GB    | 10 GB   |

To safeguard the performance of the system, a hard ceiling of 10 GB is enforced for all queries executed by Power BI reports, regardless of the query memory limit configured by the user. This hard ceiling does not apply to queries issued by tools that use the Analysis Services protocol (also known as XMLA). Users should consider simplifying the query or its calculations if the query is too memory intensive.

#### Query Timeout

Use this setting to maintain better control of long-running queries, which can cause reports to load slowly for users.

This setting applies to all DAX and MDX queries that are executed by Power BI reports, Analyze in Excel reports, as well as other tools which might connect over the XMLA endpoint.

Note that data refresh operations may also execute DAX queries as part of refreshing the dashboard tiles and visual caches after the data in the dataset has been refreshed. Such queries may also potentially fail because of this setting, and this could lead to the data refresh operation being shown in a failed state, even though the data in the dataset was successfully updated.

This setting applies to a single query and not the length of time it takes to run all of the queries associated with updating a dataset or report. Consider the following example:

- The **Query Timeout** setting is 1200 (20 minutes).
- There are five queries to execute, and each runs 15 minutes.

The combined time for all queries is 75 minutes, but the setting limit isn't reached because all of the individual queries run for less than 20 minutes.

Note that Power BI reports override this default with a much smaller timeout for each query to the capacity. The timeout for each query is typically about three minutes.

#### Automatic page refresh

When enabled, automatic page refresh allows users in your Premium capacity to refresh pages in their report at a defined interval, for DirectQuery sources. As a capacity admin, you can do the following:

- Turn automatic page refresh on and off
- Define a minimum refresh interval

To find the automatic page refresh setting:

1. In the Power BI Admin portal, select **Capacity settings**.

2. Select your capacity, and then scroll down and expand the **Workloads** menu.

3. Scroll down to the **Datasets** section.

:::image type="content" source="media/service-admin-premium-workloads/powerbi-permium-automatic-page-refresh.png" alt-text="Screenshot that shows the admin setting for automatic refresh interval.":::

Queries created by automatic page refresh go directly to the data source, so it's important to consider reliability and load on those sources when allowing automatic page refresh in your organization. 

### Dataflows

The dataflows workload lets you use dataflows self-service data prep, to ingest, transform, integrate, and enrich data. Use the following settings to control workload behavior.

| Setting Name | Description |
|---------------------------------|----------------------------------------|
| **Max Memory (%)** | The maximum percentage of available memory that dataflows can use in a capacity. |
| **Enhanced Dataflows Compute Engine (Preview)** | Enable this option for up to 20x faster calculation of computed entities when working with large scale data volumes. **You must restart the capacity to activate the new engine.** For more information, see [Enhanced dataflows compute engine](#enhanced-dataflows-compute-engine). |
| **Container Size** | The maximum size of the container that dataflows use for each entity in the dataflow. The default value is 700 MB. For more information, see [Container size](#container-size). |
|  |  |

#### Enhanced dataflows compute engine

To benefit from the new compute engine, split ingestion of data into separate dataflows and put transformation logic into computed entities in different dataflows. This approach is recommended because the compute engine works on dataflows that reference an existing dataflow. It doesn't work on ingestion dataflows. Following this guidance ensures that the new compute engine handles transformation steps, such as joins and merges, for optimal performance.

#### Container size

When refreshing a dataflow, the dataflow workload spawns a container for each entity in the dataflow. Each container can take memory up to the volume specified in the Container Size setting. The default for all SKUs is 700 MB. You might want to change this setting if:

- Dataflows take too long to refresh, or dataflow refresh fails on a timeout.
- Dataflow entities include computation steps, for example, a join.  

It's recommend you use the [Power BI Premium Capacity Metrics](service-admin-premium-monitor-capacity.md) app to analyze Dataflow workload performance.

In some cases, increasing container size may not improve performance. For example, if the dataflow is getting data only from a source without performing significant calculations, changing container size probably won't help. Increasing container size might help if it will enable the Dataflow workload to allocate more memory for entity refresh operations. By having more memory allocated, it can reduce the time it takes to refresh heavily computed entities.

The Container Size value can't exceed the maximum memory for the Dataflows workload. For example, a P1 capacity has 25GB of memory. If the Dataflow workload Max Memory (%) is set to 20%, Container Size (MB) cannot exceed 5000. In all cases, the Container Size cannot exceed the Max Memory, even if you set a higher value.

### Paginated reports

The paginated reports workload lets you run paginated reports, based on the standard SQL Server Reporting Services format, in the Power BI service. Use the following setting to control workload behavior.

| Setting Name | Description |
|---------------------------------|----------------------------------------|
| **Max Memory (%)** | The maximum percentage of available memory that paginated reports can use in a capacity. |
|  |  |

Paginated reports offer the same capabilities that SQL Server Reporting Services (SSRS) reports do today, including the ability for report authors to add custom code.  This allows authors to dynamically change reports, such as changing text colors based on code expressions.  To ensure proper isolation, paginated reports are run within a protected sandbox per capacity. Reports running with the same capacity can cause side effects between them. In the same way you'd restrict the authors who can publish content to an instance of SSRS, we recommend that you follow a similar practice with paginated reports. Ensure that authors publishing content to a capacity are trusted by the organization. You can further secure your environment by provisioning multiple capacities and assigning different authors to each of them. 

In some cases, the paginated reports workload can become unavailable. In this case, the workload shows an error state in the Admin portal, and users see timeouts for report rendering. To mitigate this issue, disable the workload and then enable it again.

## Configure workloads

Maximize your capacity's available resources by enabling workloads only if they will be used. Change memory and other settings only when you have determined default settings are not meeting your capacity resource requirements.

### To configure workloads in the Power BI admin portal

1. In **Capacity settings** > **PREMIUM CAPACITIES**, select a capacity.

1. Under **MORE OPTIONS**, expand **Workloads**.

1. Enable one or more workloads, and set a value for **Max Memory** and other settings.

1. Select **Apply**.

### REST API

Workloads can be enabled and assigned to a capacity by using the [Capacities](/rest/api/power-bi/capacities) REST APIs.

## Monitoring workloads

The [Power BI Premium Capacity Metrics app](service-admin-premium-monitor-capacity.md) provides dataset, dataflows, and paginated reports metrics to monitor workloads enabled for your capacities. 


> [!IMPORTANT]
> If your Power BI Premium capacity is experiencing high resource usage, resulting in performance or reliability issues, you can receive notification emails to identify and resolve the issue. This can be a streamlined way to troubleshoot overloaded capacities. See [capacity and reliability notifications](service-interruption-notifications.md#capacity-and-reliability-notifications) for more information.


## Next steps

[Optimizing Power BI Premium capacities](service-premium-capacity-optimize.md)
[Self-service data prep in Power BI with Dataflows](../transform-model/dataflows/dataflows-introduction-self-service.md)
[What are paginated reports in Power BI Premium?](../paginated-reports/paginated-reports-report-builder-power-bi.md)
[Automatic page refresh in Power BI Desktop (preview)](../create-reports/desktop-automatic-page-refresh.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)

Power BI has introduced Power BI Premium Gen2 as a preview offering, which improves the Power BI Premium experience with improvements in the following:
* Performance
* Per-user licensing
* Greater scale
* Improved metrics
* Autoscaling
* Reduced management overhead

For more information about Power BI Premium Gen2, see [Power BI Premium Generation 2 (preview)](service-premium-what-is.md#power-bi-premium-generation-2-preview).