---
title: How to configure workloads in Power BI Premium
description: Learn how to configure workloads in a Power BI Premium capacity.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 08/07/2022
LocalizationGroup: Premium
---

# Configure workloads in a Premium capacity

This article lists the workloads for Power BI Premium, and describes their capacities. Use the *Gen2* and *Gen1* tabs to review the differences between workloads for these Premium offerings.

>[!IMPORTANT]
>Premium Gen1, also known as the original version of Premium, is being deprecated. If you're still using Premium Gen1, you need to migrate your Power BI content to Premium Gen2. For more information, see [Plan your transition to Power BI Premium Gen2](service-premium-transition-gen1-to-gen2.md).

>[!NOTE]
>Workloads can be enabled and assigned to a capacity by using the [Capacities](/rest/api/power-bi/capacities) REST APIs.

## Supported workloads

### [Gen2](#tab/gen2)

Query workloads are optimized for and limited by resources determined by your Premium capacity SKU. Premium capacities also support additional workloads that can use your capacity's resources.

The list of workloads below, describes which Premium Gen2 SKUs supports each workload:

* **AI** - All SKUs are supported apart from the *EM1/A1* SKUs

* **Datasets** - All SKUs are supported

* **Dataflows** - All SKUs are supported

* **Paginated reports** - All SKUs are supported

### [Gen1](#tab/gen1)

By default, capacities support only the workload associated with running Power BI queries. You can also enable and configure additional workloads for **[AI (Cognitive Services)](../transform-model/dataflows/dataflows-machine-learning-integration.md)**, **[Dataflows](../transform-model/dataflows/dataflows-introduction-self-service.md)**, and **[Paginated reports](../paginated-reports/paginated-reports-save-to-power-bi-service.md)**.

### Default memory settings

Query workloads are optimized for and limited by resources determined by your Premium capacity SKU. Premium capacities also support additional workloads that can use your capacity's resources. Default memory values for these workloads are based on the capacity nodes available for your SKU. Max memory settings are not cumulative.

|                       | EM1/A1                  | EM2/A2                  | EM3/A3                  | P1/A4                  | P2/A5                  | P3/A6                   |
|-----------------------|---------------------------|---------------------------|---------------------------|--------------------------|--------------------------|---------------------------|
| **AI**                | Unsupported               | 40% default; 40% minimum  | 20% default; 20% minimum  | 20% default; 8% minimum  | 20% default; 4% minimum  | 20% default; 2% minimum   |
| **Datasets**          | 100% default; 67% minimum | 100% default; 40% minimum | 100% default; 20% minimum | 100% default; 8% minimum | 100% default; 4% minimum | 100% default; 2% minimum  |
| **Dataflows**         | 40% default; 40% minimum  | 24% default; 24% minimum  | 20% default; 12% minimum  | 20% default; 5% minimum  | 20% default; 3% minimum  | 20% default; 2% minimum   |
| **Paginated reports** | Unsupported               | Unsupported               | Unsupported               | 20% default; 10% minimum | 20% default; 5% minimum  | 20% default; 2.5% minimum |

---

### Configure workloads

You can tune the behavior of the workloads, by configuring workload settings for your capacity.

### [Gen2](#tab/gen2)

>[!IMPORTANT]
>All workloads are always enabled and cannot be disabled. Your capacity resources are managed by Power BI according to your capacity usage.

### [Gen1](#tab/gen1)

>[!IMPORTANT]
>You can maximize your capacity's available resources by disabling workloads if they will not be used.

---

#### To configure workloads in the Power BI admin portal

1. Sign in to [Power BI](https://app.powerbi.com) using your admin account credentials.

2. From the page header, select **...** > **Settings** > **Admin portal**.

   :::image type="content" source="../includes/media/admin-portal-settings/power-bi-settings-menu.png" alt-text="Settings menu with admin portal selected.":::

3. Go to **Capacity settings** and from the **Power BI Premium** tab, select a capacity.

4. Expand **Workloads**.

5. Set the values for each workload according to your specifications.

6. Select **Apply**.

### Monitor workloads

### [Gen2](#tab/gen2)

Use the [Power BI Premium utilization and metrics app](../enterprise/service-premium-gen2-metrics-app.md) to monitor your capacity's activity.

### [Gen1](#tab/gen1)

The [Power BI Premium Capacity Metrics app](service-premium-gen2-metrics-app.md) provides dataset, dataflows, and paginated reports metrics to monitor workloads enabled for your capacities.

---

> [!IMPORTANT]
> If your Power BI Premium capacity is experiencing high resource usage, resulting in performance or reliability issues, you can receive notification emails to identify and resolve the issue. This can be a streamlined way to troubleshoot overloaded capacities. For more information, see [capacity and reliability notifications](../support/service-interruption-notifications.md#capacity-and-reliability-notifications).

## AI (Preview)

The AI workload lets you use cognitive services and Automated Machine Learning in Power BI. Use the following settings to control workload behavior.

| Setting Name | Description |
|---------------------------------|----------------------------------------|
| **Max Memory (%)**<sup>1</sup> | The maximum percentage of available memory that AI processes can use in a capacity. |
| **Allow usage from Power BI Desktop** | This setting is reserved for future use and doesn't appear in all tenants. |
| **Allow building machine learning models** | Specifies whether business analysts can train, validate, and invoke machine learning models directly in Power BI. For more information, see [Automated Machine Learning in Power BI (Preview)](../transform-model/dataflows/dataflows-machine-learning-integration.md). |
| **Enable parallelism for AI requests** | Specifies whether AI requests can run in parallel. |

<sup>1</sup> *Premium Gen2* doesn't require memory settings to be changed. Memory in Premium Gen2 is automatically managed by the underlying system.

## Datasets

This section describes the following datasets workload settings:

* [Power BI settings](#power-bi-settings)

* [Analysis Services server properties](#analysis-services-server-properties)

### Power BI settings

Use the settings in the table below to control workload behavior. Settings with a link have additional information that you can review in designated sections below the table.

>[!NOTE]
>In Premium Gen1, the datasets workload is enabled by default and cannot be disabled.

| Setting Name | Description |
|---------------------------------|----------------------------------------|
| **Max Memory (%)**<sup>1</sup> | The maximum percentage of available memory that datasets can use in a capacity. |
| **XMLA Endpoint** | Specifies that connections from client applications honor the security group membership set at the workspace and app levels. For more information, see [Connect to datasets with client applications and tools](service-premium-connect-tools.md). |
| **[Max Intermediate Row Set Count](#max-intermediate-row-set-count)** | The maximum number of intermediate rows returned by DirectQuery. The default value is 1000000, and the allowable range is between 100000 and 2147483646. The upper limit may need to be further constrained based on what the datasource supports. |
| **[Max Offline Dataset Size (GB)](#max-offline-dataset-size)** | The maximum size of the offline dataset in memory. This is the compressed size on disk. The default value is 0, which is the highest limit defined by SKU. The allowable range is between 0 and the capacity size limit. |
| **[Max Result Row Set Count](#max-result-row-set-count)** | The maximum number of rows returned in a DAX query. The default value is -1 (no limit), and the allowable range is between 100000 and 2147483647. |
| **[Query Memory Limit (%)](#query-memory-limit)** | The maximum percentage of available memory in the workload that can be used for executing an MDX or DAX query. The default value is 0, which results in SKU-specific automatic query memory limit being applied. |
| **[Query Timeout (seconds)](#query-timeout)** | The maximum amount of time before a query times out. The default is 3600 seconds (1 hour). A value of 0 specifies that queries won't time out. |
| **[Automatic page refresh](#automatic-page-refresh)** | On/Off toggle to allow premium workspaces to have reports with automatic page refresh based on fixed intervals. |
| **Minimum refresh interval** | If automatic page refresh is on, the minimum interval allowed for page refresh interval. The default value is five minutes, and the minimum allowed is one second. |
| **Change detection measure** | On/Off toggle to allow premium workspaces to have reports with automatic page refresh based on change detection. |
| **Minimum execution interval** | If change detection measure is on, the minimum execution interval allowed to poll for data changes. The default value is five seconds, and the minimum allowed is one second. |

<sup>1</sup> *Premium Gen2* doesn't require memory settings to be changed. Memory in Premium Gen2 is automatically managed by the underlying system.

#### Max Intermediate Row Set Count

Use this setting to control the impact of resource-intensive or poorly designed reports. When a query to a DirectQuery dataset results in a very large result from the source database, it can cause a spike in memory usage and processing overhead. This situation can lead to other users and reports running low on resources. This setting allows the capacity administrator to adjust how many rows an individual query can fetch from the data source.

Alternatively, if the capacity can support more than the one million row default, and you have a large dataset, increase this setting to fetch more rows.

This setting affects only DirectQuery queries, whereas [Max Result Row Set Count](#max-result-row-set-count) affects DAX queries.

#### Max Offline Dataset Size

Use this setting to prevent report creators from publishing a large dataset that could negatively impact the capacity. Power BI can't determine actual in-memory size until the dataset is loaded into memory. It's possible that a dataset with a smaller offline size can have a larger memory footprint than a dataset with a larger offline size.

If you have an existing dataset that is larger than the size you specify for this setting, the dataset will fail to load when a user tries to access it. The dataset can also fail to load if it's larger than the Max Memory configured for the datasets workload.

This setting is applicable for models in both small dataset storage format (ABF format) and large dataset storage format (PremiumFiles), although the offline size of the same model might differ when stored in one format vs another. For more information, see [Large models in Power BI Premium](service-premium-large-models.md).

To safeguard the performance of the system, an additional SKU-specific hard ceiling for max offline dataset size is applied, regardless of the configured value. The additional SKU-specific hard ceiling in the below table does not apply to Power BI datasets stored in large dataset storage format.

|                                               | EM1/A1   | EM2/A2   | EM3/A3   | P1/A4   | P2/A5  | P3/A6   | P4/A7  | P5/A8 |
|-----------------------------------------------|----------|----------|----------|---------|--------|---------|--------|-------|
| **Hard ceiling for Max Offline Dataset Size** | 3 GB     | 5 GB     | 6 GB     | 10 GB   | 10 GB  | 10 GB   | 10 GB  | 10 GB |

#### Max Result Row Set Count

Use this setting to control the impact of resource-intensive or poorly designed reports. If this limit is reached in a DAX query, a report user sees the following error. They should copy the error details and contact an administrator.

![Couldn't load data for this visual](media/service-admin-premium-workloads/could-not-load-data.png)

This setting affects only DAX queries, whereas [Max Intermediate Row Set Count](#max-intermediate-row-set-count) affects DirectQuery queries.

#### Query Memory Limit

Use this setting to control the impact of resource-intensive or poorly designed reports. Some queries and calculations can result in intermediate results that use a lot of memory on the capacity. This situation can cause other queries to execute very slowly, cause eviction of other datasets from the capacity, and lead to out of memory errors for other users of the capacity.

This setting applies to all DAX and MDX queries that are executed by Power BI reports, Analyze in Excel reports, as well as other tools that might connect over the XMLA endpoint.

Data refresh operations may also execute DAX queries as part of refreshing the dashboard tiles and visual caches after the data in the dataset has been refreshed. Such queries may also potentially fail because of this setting, and this could lead to the data refresh operation being shown in a failed state, even though the data in the dataset was successfully updated.

The default setting is 0, which results in the following SKU-specific automatic query memory limit being applied.

|                                  | EM1/A1   | EM2/A2   | EM3/A3   | P1/A4   | P2/A5   | P3/A6   | P4/A7   | P5/A8   |
|----------------------------------|----------|----------|----------|---------|---------|---------|---------|---------|
| **Automatic Query Memory Limit** | 1 GB     | 2 GB     | 2 GB     | 6 GB    | 6 GB    | 10 GB   | 10 GB   | 10 GB   |

To safeguard the performance of the system, a hard ceiling of 10 GB is enforced for all queries executed by Power BI reports, regardless of the query memory limit configured by the user. This hard ceiling doesn't apply to queries issued by tools that use the Analysis Services protocol (also known as XMLA). Users should consider simplifying the query or its calculations if the query is too memory intensive.

#### Query Timeout

Use this setting to maintain better control of long-running queries, which can cause reports to load slowly for users.

This setting applies to all DAX and MDX queries that are executed by Power BI reports, Analyze in Excel reports, as well as other tools that might connect over the XMLA endpoint.

Data refresh operations may also execute DAX queries as part of refreshing the dashboard tiles and visual caches after the data in the dataset has been refreshed. Such queries may also potentially fail because of this setting, and this could lead to the data refresh operation being shown in a failed state, even though the data in the dataset was successfully updated.

This setting applies to a single query and not the length of time it takes to run all of the queries associated with updating a dataset or report. Consider the following example:

* The **Query Timeout** setting is 1200 (20 minutes).
* There are five queries to execute, and each runs 15 minutes.

The combined time for all queries is 75 minutes, but the setting limit isn't reached because all of the individual queries run for less than 20 minutes.

Note that Power BI reports override this default with a much smaller timeout for each query to the capacity. The timeout for each query is typically about three minutes.

#### Automatic page refresh

When enabled, automatic page refresh allows users in your Premium capacity to refresh pages in their report at a defined interval, for DirectQuery sources. As a capacity admin, you can do the following:

* Turn automatic page refresh on and off
* Define a minimum refresh interval

To find the automatic page refresh setting:

1. In the Power BI Admin portal, select **Capacity settings**.

2. Select your capacity, and then scroll down and expand the **Workloads** menu.

3. Scroll down to the **Datasets** section.

:::image type="content" source="media/service-admin-premium-workloads/powerbi-permium-automatic-page-refresh.png" alt-text="Screenshot that shows the admin setting for automatic refresh interval.":::

Queries created by automatic page refresh go directly to the data source, so it's important to consider reliability and load on those sources when allowing automatic page refresh in your organization.

### Analysis Services server properties

Power BI Premium Gen2 supports additional Analysis Services server properties. To review these properties, refer to [Server properties in Analysis Services](/analysis-services/server-properties/server-properties-in-analysis-services).

#### Admin portal switch

The Analysis Services XMLA-based server properties setting is enabled by default. When enabled, workspace admins can modify behaviors for an individual workspace. Modified properties apply only to that workspace. To toggle the Analysis Services server properties setting, follow the steps below.

1. Go to your [capacity settings](./../admin/service-admin-portal-capacity-settings.md).

2. Select the capacity you want to disable the *Analysis Services server properties* in.

3. Expand **Workloads**.

4. Under *datasets*, select the setting you want for the **Observe XMLA-based workspace settings (which may override capacity settings)** switch.

    :::image type="content" source="media/service-admin-premium-workloads/disable-xmla.png" alt-text="Screenshot that shows the admin setting for disabling the analysis services server properties.":::

## Dataflows

The dataflows workload lets you use dataflows self-service data prep, to ingest, transform, integrate, and enrich data. Use the following settings to control workload behavior in Premium Gen1.

| Setting Name | Description |
|---------------------------------|----------------------------------------|
| **Max Memory (%)**<sup>1</sup> | The maximum percentage of available memory that dataflows can use in a capacity. |
| **Enhanced Dataflows Compute Engine (Preview)** | Enable this option for up to 20x faster calculation of computed entities when working with large scale data volumes. **You must restart the capacity to activate the new engine.** For more information, see [Enhanced dataflows compute engine](#enhanced-dataflows-compute-engine). |
| **Container Size** | The maximum size of the container that dataflows use for each entity in the dataflow. The default value is 700 MB. For more information, see [Container size](#container-size). |

<sup>1</sup> *Premium Gen2* doesn't require memory settings to be changed. Memory in Premium Gen2 is automatically managed by the underlying system.

### Enhanced dataflows compute engine

To benefit from the new compute engine, split ingestion of data into separate dataflows and put transformation logic into computed entities in different dataflows. This approach is recommended because the compute engine works on dataflows that reference an existing dataflow. It doesn't work on ingestion dataflows. Following this guidance ensures that the new compute engine handles transformation steps, such as joins and merges, for optimal performance.

### Container size

When refreshing a dataflow, the dataflow workload spawns a container for each entity in the dataflow. Each container can take memory up to the volume specified in the Container Size setting. The default for all SKUs is 700 MB. You might want to change this setting if:

* Dataflows take too long to refresh, or dataflow refresh fails on a timeout.
* Dataflow entities include computation steps, for example, a join.  

It's recommended you use the [Power BI Premium Capacity Metrics](service-premium-gen2-metrics-app.md) app to analyze Dataflow workload performance.

In some cases, increasing container size may not improve performance. For example, if the dataflow is getting data only from a source without performing significant calculations, changing container size probably won't help. Increasing container size might help if it will enable the Dataflow workload to allocate more memory for entity refresh operations. By having more memory allocated, it can reduce the time it takes to refresh heavily computed entities.

The Container Size value can't exceed the maximum memory for the Dataflows workload. For example, a P1 capacity has 25 GB of memory. If the Dataflow workload Max Memory (%) is set to 20%, Container Size (MB) can't exceed 5000. In all cases, the Container Size can't exceed the Max Memory, even if you set a higher value.

## Paginated reports

The paginated reports workload lets you run paginated reports, based on the standard SQL Server Reporting Services format, in the Power BI service.

Paginated reports offer the same capabilities that SQL Server Reporting Services (SSRS) reports do today, including the ability for report authors to add custom code.  This allows authors to dynamically change reports, such as changing text colors based on code expressions.

>[!NOTE]
>You need to enable this workload with Power BI Premium Gen1 capacities.


### Outbound connectivity

Outbound connectivity is turned on by default. It allows paginated reports to make requests for fetching external resources such as images, and call external APIs and Azure functions defined using custom code in paginated reports. A global admin or a Power BI service admin can disable this setting in the Power BI admin portal.

To get to the outbound connectivity settings, follow these steps:

1. In Power BI service, navigate to the [admin portal](./../admin/service-admin-portal.md#how-to-get-to-the-admin-portal).

2. From the **Power BI Premium** tab, select the capacity you want to disable the paginated reports outbound requests for.

3. Expand **Workloads**.

    The outbound connectivity switch is in the *paginated reports* section.

    * When **Outbound Connectivity Disable** is turned off, outbound connectivity is enabled.

    * When **Outbound Connectivity Disable** is turned on, outbound connectivity is disabled.

4. After you've made a change, select **Apply**.

    :::image type="content" source="media/service-admin-premium-workloads/outbound-connectivity.png" alt-text="A screenshot of the paginated reports outbound connectivity setting.":::

### [Gen2](#tab/gen2)

The paginated reports workload is enabled automatically, and is always enabled.

### [Gen1](#tab/gen1)

Paginated reports are only supported when using *P1/A4* or higher SKUs.

| Setting Name | Description |
|---------------------------------|----------------------------------------|
| **Max Memory (%)** | The maximum percentage of available memory that paginated reports can use in a capacity. |

To ensure proper isolation, paginated reports are run within a protected sandbox per capacity. Reports running with the same capacity can cause side effects between them. In the same way you'd restrict the authors who can publish content to an instance of SSRS, we recommend that you follow a similar practice with paginated reports. Ensure that authors publishing content to a capacity are trusted by the organization. You can further secure your environment by provisioning multiple capacities and assigning different authors to each of them.

A Power BI administer can enable or disable the paginated reports workload. When the workload is disabled, you can't use the paginated reports feature. If you're trying to render a paginated report when the workload is disabled, you’ll receive a message notifying you that you need to contact your capacity administrator.

---

## Next steps

>[!div class="nextstepaction"]
>[Power BI Premium Generation 2](service-premium-gen2-what-is.md)

>[!div class="nextstepaction"]
>[Self-service data prep in Power BI with Dataflows](../transform-model/dataflows/dataflows-introduction-self-service.md)

>[!div class="nextstepaction"]
>[What are paginated reports in Power BI?](../paginated-reports/paginated-reports-report-builder-power-bi.md)

>[!div class="nextstepaction"]
>[Automatic page refresh in Power BI Desktop (preview)](../create-reports/desktop-automatic-page-refresh.md)
