---
title: How to configure workloads in Power BI Premium
description: Learn how to configure workloads in a Power BI Premium capacity.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 09/25/2024
LocalizationGroup: Premium
---

# Configure workloads in a Premium capacity

This article lists the workloads for Power BI Premium, and describes their capacities.

>[!NOTE]
>Workloads can be enabled and assigned to a capacity by using the [Capacities](/rest/api/power-bi/capacities) REST APIs.

## Supported workloads

Query workloads are optimized for and limited by resources determined by your Premium capacity SKU. Premium capacities also support additional workloads that can use your capacity's resources.

The list of workloads below, describes which Premium SKUs supports each workload:

* **AI** - All SKUs are supported apart from the *EM1/A1* SKUs

* **Semantic models** - All SKUs are supported

* **Dataflows** - All SKUs are supported

* **Paginated reports** - All SKUs are supported

### Configure workloads

You can tune the behavior of the workloads, by configuring workload settings for your capacity.

>[!IMPORTANT]
>All workloads are always enabled and cannot be disabled. Your capacity resources are managed by Power BI according to your capacity usage.

#### To configure workloads in the Power BI admin portal

1. Sign in to [Power BI](https://app.powerbi.com) using your admin account credentials.

2. From the page header, select **...** > **Settings** > **Admin portal**.

   :::image type="content" source="../includes/media/admin-portal-settings/power-bi-settings-menu.png" alt-text="Settings menu with admin portal selected.":::

3. Go to **Capacity settings** and from the **Power BI Premium** tab, select a capacity.

4. Expand **Workloads**.

5. Set the values for each workload according to your specifications.

6. Select **Apply**.

### Monitor workloads

Use the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) to monitor your capacity's activity.

> [!IMPORTANT]
> If your Power BI Premium capacity is experiencing high resource usage, resulting in performance or reliability issues, you can receive notification emails to identify and resolve the issue. This can be a streamlined way to troubleshoot overloaded capacities. For more information, see [Notifications](../admin/service-admin-premium-capacity-notifications.md).

## AI (Preview)

The AI workload lets you use cognitive services and Automated Machine Learning in Power BI. Use the following settings to control workload behavior.

| Setting Name | Description |
|---------------------------------|----------------------------------------|
| **Max Memory (%)**<sup>1</sup> | The maximum percentage of available memory that AI processes can use in a capacity. |
| **Allow usage from Power BI Desktop** | This setting is reserved for future use and doesn't appear in all tenants. |
| **Allow building machine learning models** | Specifies whether business analysts can train, validate, and invoke machine learning models directly in Power BI. For more information, see [Automated Machine Learning in Power BI (Preview)](../transform-model/dataflows/dataflows-machine-learning-integration.md). |
| **Enable parallelism for AI requests** | Specifies whether AI requests can run in parallel. |

<sup>1</sup> *Premium* doesn't require memory settings to be changed. Memory in Premium is automatically managed by the underlying system.

## Semantic models

This section describes the following semantic models workload settings:

* [Power BI settings](#power-bi-settings)

* [Analysis Services server properties](#analysis-services-server-properties)

### Power BI settings

Use the settings in the table below to control workload behavior. Settings with a link have additional information that you can review in designated sections below the table.

| Setting Name | Description |
|---------------------------------|----------------------------------------|
| **Max Memory (%)**<sup>1</sup> | The maximum percentage of available memory that semantic models can use in a capacity. |
| **XMLA Endpoint** | Specifies that connections from client applications honor the security group membership set at the workspace and app levels. For more information, see [Connect to semantic models with client applications and tools](service-premium-connect-tools.md). |
| **[Max Intermediate Row Set Count](#max-intermediate-row-set-count)** | The maximum number of intermediate rows returned by DirectQuery. The default value is 1000000, and the allowable range is between 100000 and 2147483646. The upper limit might need to be further constrained based on what the datasource supports. |
| **[Max Offline Semantic model Size (GB)](#max-offline-semantic-model-size)** | The maximum size of the offline semantic model in memory. This is the compressed size on disk. The default value is 0, which is the highest limit defined by SKU. The allowable range is between 0 and the capacity size limit. |
| **[Max Result Row Count](#max-result-row-set-count)** | The maximum number of rows returned in a DAX query. The default value is 2147483647, and the allowable range is between 100000 and 2147483647. |
| **[Query Memory Limit (%)](#query-memory-limit)** | The maximum percentage of available memory in the workload that can be used for executing an MDX or DAX query. The default value is 0, which results in SKU-specific automatic query memory limit being applied. |
| **[Query Timeout (seconds)](#query-timeout)** | The maximum amount of time before a query times out. The default is 3600 seconds (1 hour). A value of 0 specifies that queries won't time out. |
| **[Automatic page refresh](#automatic-page-refresh)** | On/Off toggle to allow premium workspaces to have reports with automatic page refresh based on fixed intervals. |
| **Minimum refresh interval** | If automatic page refresh is on, the minimum interval allowed for page refresh interval. The default value is five minutes, and the minimum allowed is one second. |
| **Change detection measure** | On/Off toggle to allow premium workspaces to have reports with automatic page refresh based on change detection. |
| **Minimum execution interval** | If change detection measure is on, the minimum execution interval allowed to poll for data changes. The default value is five seconds, and the minimum allowed is one second. |

<sup>1</sup> *Premium* doesn't require memory settings to be changed. Memory in Premium is automatically managed by the underlying system.

#### Max Intermediate Row Set Count

Use this setting to control the impact of resource-intensive or poorly designed reports. When a query to a DirectQuery semantic model results in a very large result from the source database, it can cause a spike in memory usage and processing overhead. This situation can lead to other users and reports running low on resources. This setting allows the capacity administrator to adjust how many rows an individual query can fetch from the data source.

Alternatively, if the capacity can support more than the one million row default, and you have a large semantic model, increase this setting to fetch more rows.

This setting affects only DirectQuery queries, whereas [Max Result Row Set Count](#max-result-row-set-count) affects DAX queries.

#### Max Offline Semantic model Size

Use this setting to prevent report creators from publishing a large semantic model that could negatively impact the capacity. Power BI can't determine actual in-memory size until the semantic model is loaded into memory. It's possible that a semantic model with a smaller offline size can have a larger memory footprint than a semantic model with a larger offline size.

If you have an existing semantic model that is larger than the size you specify for this setting, the semantic model will fail to load when a user tries to access it. The semantic model can also fail to load if it's larger than the Max Memory configured for the semantic models workload.

This setting is applicable for models in both small semantic model storage format (ABF format) and large semantic model storage format (PremiumFiles), although the offline size of the same model might differ when stored in one format vs another. For more information, see [Large models in Power BI Premium](service-premium-large-models.md).

To safeguard the performance of the system, an additional SKU-specific hard ceiling for max offline semantic model size is applied, regardless of the configured value. The additional SKU-specific hard ceiling in the below table does not apply to Power BI semantic models stored in large semantic model storage format.

| SKU          | Limit<sup>1</sup> |
| ------------ | ----------------- |
|   F2         |  1 GB             |
|   F4         |  2 GB             |
|   F8/EM1/A1  |  3 GB             |
|   F16/EM2/A2 |  5 GB             |
|   F32/EM3/A3 |  6 GB             |
|   F64/P1/A4  | 10 GB             |
|  F128/P2/A5  | 10 GB             |
|  F256/P3/A6  | 10 GB             |
|  F512/P4/A7  | 10 GB             |
|  F1024/P5/A8 | 10 GB             |
|  F2048       | 10 GB             |

<sup>1</sup>Hard ceiling for Max Offline semantic model size (small storage format).

#### Max Result Row Set Count

Use this setting to control the impact of resource-intensive or poorly designed reports. If this limit is reached in a DAX query, a report user sees the following error. They should copy the error details and contact an administrator.

![Couldn't load data for this visual](media/service-admin-premium-workloads/could-not-load-data.png)

This setting affects only DAX queries, whereas [Max Intermediate Row Set Count](#max-intermediate-row-set-count) affects DirectQuery queries.

#### Query Memory Limit

Use this setting to control the impact of resource-intensive or poorly designed reports. Some queries and calculations can result in intermediate results that use a lot of memory on the capacity. This situation can cause other queries to execute very slowly, cause eviction of other semantic models from the capacity, and lead to out of memory errors for other users of the capacity.

This setting applies to all DAX and MDX queries that are executed by Power BI reports, Analyze in Excel reports, as well as other tools that might connect over the XMLA endpoint.

Data refresh operations might also execute DAX queries as part of refreshing the dashboard tiles and visual caches after the data in the semantic model has been refreshed. Such queries might also potentially fail because of this setting, and this could lead to the data refresh operation being shown in a failed state, even though the data in the semantic model was successfully updated.

The default setting is 0, which results in the following SKU-specific automatic query memory limit being applied.

| SKU          | Automatic Query Memory Limit |
| ------------ | ---------------------------- |
|   F2         |  1 GB                        |
|   F4         |  1 GB                        |
|   F8/EM1/A1  |  1 GB                        |
|   F16/EM2/A2 |  2 GB                        |
|   F32/EM3/A3 |  5 GB                        |
|   F64/P1/A4  | 10 GB                        |
|  F128/P2/A5  | 10 GB                        |
|  F256/P3/A6  | 10 GB                        |
|  F512/P4/A7  | 20 GB                        |
|  F1024/P5/A8 | 40 GB                        |
|  F2048       | 40 GB                        |

The query limit for a workspace that isn't assigned to a Premium capacity is 1GB.

#### Query Timeout

Use this setting to maintain better control of long-running queries, which can cause reports to load slowly for users.

This setting applies to all DAX and MDX queries that are executed by Power BI reports, Analyze in Excel reports, as well as other tools that might connect over the XMLA endpoint.

Data refresh operations might also execute DAX queries as part of refreshing the dashboard tiles and visual caches after the data in the semantic model has been refreshed. Such queries might also potentially fail because of this setting, and this could lead to the data refresh operation being shown in a failed state, even though the data in the semantic model was successfully updated.

This setting applies to a single query and not the length of time it takes to run all of the queries associated with updating a semantic model or report. Consider the following example:

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

3. Scroll down to the **Semantic models** section.

:::image type="content" source="media/service-admin-premium-workloads/powerbi-permium-automatic-page-refresh.png" alt-text="Screenshot that shows the admin setting for automatic refresh interval.":::

Queries created by automatic page refresh go directly to the data source, so it's important to consider reliability and load on those sources when allowing automatic page refresh in your organization.

### Analysis Services server properties

Power BI Premium supports additional Analysis Services server properties. To review these properties, refer to [Server properties in Analysis Services](/analysis-services/server-properties/server-properties-in-analysis-services).

#### Admin portal switch

The Analysis Services XMLA-based server properties setting is enabled by default. When enabled, workspace admins can modify behaviors for an individual workspace. Modified properties apply only to that workspace. To toggle the Analysis Services server properties setting, follow the steps below.

1. Go to your [capacity settings](./../admin/service-admin-portal-capacity-settings.md).

2. Select the capacity you want to disable the *Analysis Services server properties* in.

3. Expand **Workloads**.

4. Under *semantic models*, select the setting you want for the **Observe XMLA-based workspace settings (which might override capacity settings)** switch.

    :::image type="content" source="media/service-admin-premium-workloads/disable-xmla.png" alt-text="Screenshot that shows the admin setting for disabling the analysis services server properties.":::

## Dataflows

The dataflows workload lets you use dataflows self-service data prep, to ingest, transform, integrate, and enrich data. Use the following settings to control workload behavior in Premium. Power BI Premium doesn't require memory settings to be changed. Memory in Premium is automatically managed by the underlying system.

### Enhanced dataflows compute engine

To benefit from the new compute engine, split ingestion of data into separate dataflows and put transformation logic into computed entities in different dataflows. This approach is recommended because the compute engine works on dataflows that reference an existing dataflow. It doesn't work on ingestion dataflows. Following this guidance ensures that the new compute engine handles transformation steps, such as joins and merges, for optimal performance.

## Paginated reports

The paginated reports workload lets you run paginated reports, based on the standard SQL Server Reporting Services format, in the Power BI service.

Paginated reports offer the same capabilities that SQL Server Reporting Services (SSRS) reports do today, including the ability for report authors to add custom code.  This allows authors to dynamically change reports, such as changing text colors based on code expressions.

### Outbound connectivity

Outbound connectivity is turned on by default. It allows paginated reports to make requests for fetching external resources such as images, and call external APIs and Azure functions defined using custom code in paginated reports. A Fabric administrator can disable this setting in the Power BI admin portal.

To get to the outbound connectivity settings, follow these steps:

1. In Power BI service, navigate to the [admin portal](./../admin/service-admin-portal.md#how-to-get-to-the-admin-portal).

2. From the **Power BI Premium** tab, select the capacity you want to disable the paginated reports outbound requests for.

3. Expand **Workloads**.

    The outbound connectivity switch is in the *paginated reports* section.

    * When **Outbound Connectivity Disable** is turned off, outbound connectivity is enabled.

    * When **Outbound Connectivity Disable** is turned on, outbound connectivity is disabled.

4. After you've made a change, select **Apply**.

    :::image type="content" source="media/service-admin-premium-workloads/outbound-connectivity.png" alt-text="A screenshot of the paginated reports outbound connectivity setting.":::

The paginated reports workload is enabled automatically, and is always enabled.

## Related content

>[!div class="nextstepaction"]
>[Power BI Premium](service-premium-what-is.md)

>[!div class="nextstepaction"]
>[Self-service data prep in Power BI with Dataflows](../transform-model/dataflows/dataflows-introduction-self-service.md)

>[!div class="nextstepaction"]
>[What are paginated reports in Power BI?](../paginated-reports/paginated-reports-report-builder-power-bi.md)

>[!div class="nextstepaction"]
>[Automatic page refresh in Power BI Desktop (preview)](../create-reports/desktop-automatic-page-refresh.md)
