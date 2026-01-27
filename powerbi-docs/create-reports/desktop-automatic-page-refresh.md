---
title: Automatic Page Refresh in Power BI Desktop 
description: Learn how to automatically refresh pages for DirectQuery and LiveConnect sources in Power BI Desktop.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.custom:
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/01/2025
LocalizationGroup: Connect to data
ai-usage: ai-assisted
---

# Automatic page refresh in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

When you monitor critical events, you want data to be refreshed as soon as the source data is updated. For example, in the manufacturing industry, you need to know when a machine is malfunctioning or is close to malfunctioning. If you're monitoring signals like social media sentiment, you want to know about sudden changes as soon as they happen.

Automatic page refresh in Power BI enables your active report page to query for new data, at a predefined cadence, for [DirectQuery sources](../connect-data/desktop-directquery-about.md). Furthermore, Automatic Page Refresh supports Proxy Models as well.

## Refresh types

When using automatic page refresh, two refresh types are available: fixed interval and change detection.

### Fixed interval

This refresh type updates all visuals in a report page based on a constant interval such as one second or five minutes. When that specific interval is reached, all visuals in that page send an update query to the data source and update accordingly.

### Change detection

This refresh type refreshes visuals on a page based on detecting changes in the data rather than a specific refresh interval. Specifically, this measure polls for changes to your [DirectQuery source](../connect-data/desktop-directquery-about.md). Besides defining the measure, you must also select how frequently Power BI Desktop checks for changes. When publishing to the service, this refresh type is only supported in workspaces that are part of a Premium capacity. LiveConnect sources such as Analysis Services and Power BI semantic models aren't supported.

## Author reports with automatic page refresh in Power BI Desktop

Automatic page refresh is available for [DirectQuery sources](../connect-data/desktop-directquery-about.md) and some LiveConnect scenarios. You can use this feature only when you're connected to a supported data source. This restriction applies to both automatic page refresh types.

> [!IMPORTANT]
> **Can't find the Page refresh option?** The **Page refresh** card only appears in the Formatting pane when your report is connected to a [DirectQuery source](../connect-data/desktop-directquery-about.md). If your report uses Import mode, the Page refresh option isn't available. To use automatic page refresh, you must change your data connection to DirectQuery.

To use automatic page refresh in Power BI Desktop, select the report page where you want to enable automatic page refresh. In the **Visualizations** pane, select the **Formatting** button (a paint roller) and find the **Page refresh** section near the bottom of the pane.

![Page refresh location](media/desktop-automatic-page-refresh/automatic-page-refresh-01.png)

1. Turns page refresh on or off.
1. Refresh type
1. Inputs and information (depending on refresh type)

The **Page refresh** card appears only if you're connected to a [DirectQuery source](../connect-data/desktop-directquery-about.md). To enable automatic page refresh, turn the toggle to **On**. The inputs needed and information provided depend on the refresh type you select.

### Fixed interval setup

When you select **Auto page refresh** as the refresh type, enter the refresh interval you want. The default value is 30 minutes. The minimum refresh interval is one second. Your report starts refreshing at the interval you set.

If you're the administrator and need to change the refresh interval, see [Configure workloads in a Premium capacity](../enterprise/service-admin-premium-workloads.md).

When you select **show details**, Power BI provides more information on:

- If your admin enables the feature (only when you sign in to your Power BI account).
- The minimum interval your admin allows (only when you sign in to your Power BI account).
- The actual rate of refresh (usually longer than your selected interval).
- The last refresh time.

![Page refresh show details](media/desktop-automatic-page-refresh/automatic-page-refresh-02.png)

### Change detection setup

When you select **Change detection** as your refresh type, you see a link to **Add change detection**. You can also access the **change detection** window from the Modeling tab in the ribbon. Select the **Change detection** icon in the **Page refresh** section. Finally, you can right-click or select the dropdown arrow next to any value in the Values well, and select **Change detection** from the menu.

![Change detection card](media/desktop-automatic-page-refresh/automatic-page-refresh-03.png)

When the window opens, you see the **Measure type** option where you can select an existing measure or create a new one. To select an existing measure, select the desired measure from the fields list or drag and drop it into the **Choose existing measure** section. To create a new measure, **Choose a calculation** for the measure between count, count distinct, minimum, maximum, and sum. For example, you can use count distinct to count customer IDs and only refresh when a new customer is added to the list. After you select a measure, define how often Power BI will **Check for changes**. This interval controls how often Power BI calculates the measure and polls for changes. When you select **apply**, a new measure with the change detection icon appears in your field list.

![Change detection window](media/desktop-automatic-page-refresh/automatic-page-refresh-04.png)

Back on the page refresh section, you see the information about which measure is used for change detection and the defined interval for your reference.

![Change detection card with details](media/desktop-automatic-page-refresh/automatic-page-refresh-05.png)

> [!NOTE]
> You can only have one change detection measure per model.

## Determining the refresh interval

When you enable automatic page refresh, Power BI Desktop constantly sends queries to your DirectQuery source. After sending the query, there's a delay before data returns. For short refresh intervals, confirm that queries successfully return the queried data within the configured interval. If data doesn't return within the interval, visuals update less frequently than configured.

These considerations apply for both fixed interval and change detection refresh types. The main difference is that for change detection, only one query goes back to the source at a fixed interval. The visuals refresh triggers only when the value of the change detection measure changes.

As a best practice, match the refresh interval to your expected new data arrival rate:

- If new data arrives at the source every 20 minutes, your refresh interval can't be less than 20 minutes.
- If new data arrives every second, set the interval to one second.

For low refresh intervals like one second, take factors like the following into consideration:

- The type of the DirectQuery data source.
- The load your queries create on it.
- The distance of your report viewers from the capacity's datacenter.

You can estimate return times by using the [Performance Analyzer](desktop-performance-analyzer.md) in Power BI Desktop and the show details menu in the page refresh section for the fixed interval refresh type. Performance Analyzer lets you check if each visual query has enough time to come back with results from the source. It also lets you determine where time is spent. Based on the results from Performance Analyzer, you can adjust the data source, or you can experiment with other visuals and measures in your report.

The following image shows the results of a DirectQuery source in Performance Analyzer:

![Performance Analyzer results](media/desktop-automatic-page-refresh/automatic-page-refresh-06.png)

Other characteristics of this data source include:

- The data arrives at a rate of 2 seconds.
- The Performance Analyzer shows a maximum query and display time of approximately 4.9 seconds (4,688 milliseconds).
- The data source is configured to handle approximately 1,000 concurrent queries per second.
- You expect approximately 10 users to be viewing the report concurrently.

These characteristics result in the following equation:

- **5 visuals x 10 users = approximately 50 queries**

The result of this calculation shows a higher load than the data source can support. The data arrives at a rate of two seconds, so that value should be your refresh rate. However, because the query takes around five seconds to complete, you should set it to more than five seconds.

Also note that this result might differ as you publish your report to the service. This difference occurs because the report uses the Azure Analysis Services instance that's hosted in the cloud. You might want to adjust your refresh rates accordingly.

To account for queries and refresh timing, Power BI only runs the next refresh query when all the remaining refresh queries are complete. So even if your refresh interval is shorter than the time your queries take to process, Power BI refreshes only after remaining queries complete.

In the case of change detection refresh type, these considerations still apply. Also, the [Performance Analyzer](desktop-performance-analyzer.md) shows you the results for the change detection measure query even though it doesn't match any visual in your report. This capability helps you troubleshoot this type of measure by following the same guidance mentioned previously. The main difference for this refresh type is that only one query goes to the data source instead of all queries from all visuals. This condition is still true if multiple users are viewing the report.

![Performance Analyzer results with change detection](media/desktop-automatic-page-refresh/automatic-page-refresh-07.png)

For the same scenario we discussed before:

- **One change detection measure query for five visuals generates only one query for any number of viewers.**

- **When the change detection measure triggers an update assuming the same scenario as before with five visuals times 10 users equals approximately 50 queries.**

To summarize, when using change detection, only one query is sent to the data source until a change is detected. When that condition happens, the same logic used for a fixed interval refresh type applies for updating all visuals for all users generating the same number of queries. This approach should be more efficient in the long run.

For more questions and answers about performance and troubleshooting, see the [Frequently asked questions](#frequently-asked-questions) section later in this article.

## Automatic page refresh in the Power BI service

You can also set automatic page refresh for reports that you publish to the Power BI service as long as the data source is [DirectQuery](../connect-data/desktop-directquery-about.md).

When you configure automatic page refresh for reports in the Power BI service, the steps are similar to those for Power BI Desktop. When you configure automatic page refresh in the Power BI service, it also supports [embedded Power BI](../developer/embedded/embedded-analytics-power-bi.md) content. This image shows the **Page refresh** configuration for the Power BI service:

![Page refresh location in the service](media/desktop-automatic-page-refresh/automatic-page-refresh-08.png)

1. Turns page refresh on or off.
1. Refresh type.
1. Inputs and information (depending on refresh type).

> [!NOTE]
> When you publish your automatic page refresh-enabled report from Power BI Desktop to the service, you must provide the credentials for the DirectQuery data source on the semantic model settings menu. You can set up the credentials so that report viewers access this data source with their own identities, respecting any security setup at the source. A change detection measure is evaluated by using the author's credentials.

### Page refresh intervals

The report's workspace type affects the page refresh types and intervals that the Power BI service allows. This effect applies to these scenarios:

- Publishing a report into a workspace that has automatic page refresh enabled.
- Editing a page refresh interval that's already in a workspace.
- Creating a report directly in the service.

Power BI Desktop has no restrictions for refresh intervals and can be as frequent as every second. However, when you publish reports to the Power BI service, certain restrictions apply, which the following sections describe.

### Restrictions on refresh intervals

In the Power BI service, restrictions on automatic page refresh apply based on the workspace where you publish the report, whether you're using Premium services, the Premium capacity admin settings, and the type of data source.

To clarify how these restrictions work, start with background on capacities and workspaces.

*Capacities* represent a set of resources (storage, processor, and memory) that host and deliver Power BI content. Capacities are either shared or reserved. A *shared capacity* is shared with other Microsoft customers. A *reserved capacity* is reserved for a single customer. For an introduction to reserved capacities, see [Managing Premium capacities](../enterprise/service-premium-capacity-manage.md).

In a shared capacity, workloads run on computational resources shared with other customers. Because the capacity needs to share resources, it imposes limitations to ensure *fair play*, such as setting a maximum model size (1 GB) and maximum daily refresh frequency (eight times per day).

Power BI *workspaces* reside within capacities. They represent security, collaboration, and deployment containers. Each Power BI user has a personal workspace known as **My Workspace**. You can create additional workspaces to enable collaboration and deployment. By default, you create workspaces, including personal workspaces, in the shared capacity.

Here are details for the two workspace scenarios:

**Shared workspaces (shared capacity / Pro)**. For regular workspaces (workspaces that aren't part of a dedicated capacity), automatic page refresh has a minimum interval of 30 minutes (the lowest interval allowed). Change detection refresh type isn't available in shared capacities.

**Dedicated capacity workspaces (Fabric F / Premium P / PPU)**. The availability of automatic page refresh in dedicated capacity workspaces (both for fixed interval and change detection) depends on the workload settings your capacity administrator sets up for that capacity. Two variables might affect your ability to set up automatic page refresh:

> [!NOTE]
> Premium Per User (PPU) workspaces behave like dedicated capacity for Automatic Page Refresh limits. Treat PPU the same as Fabric F / Premium P when planning refresh intervals.

- **Feature on/off**. If your capacity administrator disables the feature, you can't set up any type of page refresh in your published report. Fixed interval and change detection can be turned on and off separately.

- **Minimum refresh interval**. When enabling automatic page refresh for a fixed interval, your capacity administrator sets up a minimum refresh interval (the default value is five minutes). If your interval is lower than the minimum, the Power BI service overrides your interval to respect the minimum interval set by your capacity administrator.

- **Minimum execution interval**. When enabling change detection, your capacity administrator sets up a minimum execution interval (default value is five seconds). If your interval is lower than the minimum, the Power BI service overrides your interval to respect the minimum interval set by your capacity administrator.

> [!WARNING]
> When enabled in your semantic model, the change detection measure opens a connection to your DirectQuery data source to calculate the measure and poll for changes. This connection is different from the low priority refresh connections Power BI already makes.

![Automatic page refresh settings in the capacity admin portal](media/desktop-automatic-page-refresh/automatic-page-refresh-09.png)

This table describes with more detail where this feature is available and the limits for each capacity type and [storage mode](../connect-data/service-dataset-modes-understand.md):

| Storage mode                                  | Dedicated capacity                                                                                     | Shared capacity                                                                                       |
|-----------------------------------------------|--------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| DirectQuery                                   | **FI supported**: Yes <br>**CD supported**: Yes <br>**Minimum**: 1 second <br>**Admin override**: Yes  | **FI supported**: Yes <br>**CD supported**: No <br>**Minimum**: 30 minutes <br>**Admin override**: No |
| Direct Lake                                   | **FI supported**: Yes <br>**CD supported**: Yes <br>**Minimum**: 1 second <br>**Admin override**: Yes  | **FI supported**: Yes <br>**CD supported**: No <br>**Minimum**: 30 minutes <br>**Admin override**: No |
| Import                                        | **FI supported**: No <br>**CD supported**: No <br>**Minimum**: N/A <br>**Admin override**: N/A         | **FI supported**: No <br>**CD supported**: No <br>**Minimum**: N/A <br>**Admin override**: N/A        |
| Mixed mode (DirectQuery + other data sources) | **FI supported**: Yes <br>**CD supported**: Yes <br>**Minimum**: 1 second <br>**Admin override**: Yes  | **FI supported**: Yes <br>**CD supported**: No <br>**Minimum**: 30 minutes <br>**Admin override**: No |
| Analysis Services (Azure and On Premises)     | **FI supported**: Yes <br>**CD supported**: No <br>**Minimum**: 30 minutes <br>**Admin override**: Yes | **FI supported**: Yes <br>**CD supported**: No <br>**Minimum**: 30 minutes <br>**Admin override**: No |
| Power BI semantic models (connected live)   | **FI supported**: Yes <br>**CD supported**: No <br>**Minimum**: 1 second <br>**Admin override**: Yes  | **FI supported**: Yes <br>**CD supported**: No <br>**Minimum**: 30 minutes <br>**Admin override**: No |
| Power BI composite model   | **FI supported**: Yes <br>**CD supported**: Yes <br>**Minimum**: 1 second <br>**Admin override**: Yes  | **FI supported**: Yes <br>**CD supported**: No <br>**Minimum**: 30 minutes <br>**Admin override**: No |
| Power BI Push semantic models                        | **FI supported**: Yes <br>**CD supported**: No <br>**Minimum**: 30 minutes <br>**Admin override**: Yes | **FI supported**: Yes <br>**CD supported**: No <br>**Minimum**: 30 minutes <br>**Admin override**: No        |
| Power BI streaming semantic models                        | **FI supported**: No <br>**CD supported**: No <br>**Minimum**: N/A <br>**Admin override**: N/A | **FI supported**: No <br>**CD supported**: No <br>**Minimum**: N/A <br>**Admin override**: N/A        |

*Table legend:*
1. *FI: Fixed interval*
1. *CD: Change detection*

> [!IMPORTANT]
> *Admin override* can only increase the refresh interval, and can't be used to set it below the minimum interval.


> [!WARNING]
> There's a known issue when connected from Power BI Desktop to Analysis Services or Power BI semantic models and the refresh interval is 30 minutes or more. Visuals in a report page might show an error after 30 minutes.


> [!IMPORTANT]
> Adding a push dataset (streaming dataset with history **ON**) as a source to an existing semantic model with APR causes the minimum limit to increase to 30 minutes.

The most restrictive setting across the underlying data sources governs automatic refresh for composite models. For example, when a table included in a composite model has an automatic refresh interval of one hour and you configure the composite model for a 30-minute refresh, the composite model adheres to the one-hour interval because of the more restrictive refresh constraint of the underlying data source. As a result, if none of the underlying data sources enable automatic refresh, the composite model can't leverage automatic refresh. To address this problem, the capacity administrator of the workspace where the data resides must update the settings on all the underlying data to ensure the composite model can successfully use automatic refresh. 

## Impact of model refresh on open reports when using Import mode

When you open a report page and refresh a semantic model, the open report page refreshes to show the most recent data. By showing refreshed data for open reports, Power BI resolves problems related to stale data. This behavior is similar to automatic page refresh. Only users with write permissions see their open reports updated automatically when the semantic model is refreshed.

If the semantic model has a large number of users with write permissions, such as more than 1,000 users with write permissions, automatic refresh for open reports can become unreliable.

## Considerations and limitations

Keep the following considerations and limitations in mind when you use automatic page refresh in Power BI Desktop or in the Power BI service:

- Import storage mode doesn't support automatic page refresh. However, open reports update automatically if the underlying semantic model is refreshed and the user has write permissions. For situations when the refresh might become unreliable, see the [previous section](#impact-of-model-refresh-on-open-reports-when-using-import-mode).
- Composite models that have at least one DirectQuery data source are supported.
- You can only have one change detection measure per semantic model.

### Performance diagnostics

Automatic page refresh is useful for monitoring scenarios and exploring fast-changing data. However, it can put extra load on the capacity or data source.

To prevent extra load on data sources, Power BI has the following safeguards:

- All automatic page refresh queries run at a lower priority to ensure that interactive queries, like page load and cross-filtering visuals, take precedence.
- If a query doesn't finish before the next refresh cycle, Power BI doesn't send new refresh queries until the previous query finishes. For example, if you set a refresh interval of one second and your queries take an average of four seconds, Power BI effectively only sends a query every four seconds.

You can still encounter performance bottlenecks in two areas:

1. **The capacity**. The query first goes to the Premium capacity, which folds and evaluates the DAX query generated from the report visualizations into the source queries.
1. **The DirectQuery data source**. The translated queries in the previous step run against the source. The source can be your SQL Server instances, SAP Hana sources, and so on.

By using the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) that's available to admins, you can visualize how much of the capacity is used by low-priority queries.

Low-priority queries consist of automatic page refresh queries and model refresh queries. Currently, there's no way to distinguish between the load from automatic page refresh and model refresh queries.

If low-priority queries overload your capacity, take these actions:

- Request a larger premium SKU.
- Ask the report owner to lower the refresh interval.
- In the capacity admin portal, you can:
   - Turn off automatic page refresh for that capacity.
   - Raise the minimum refresh interval, which affects all reports on that capacity.


### Frequently asked questions

**I'm a report author. I set my report refresh interval to one second on Power BI Desktop, but after publishing, my report isn't refreshing in the service.**

- Make sure that automatic page refresh is turned on for the page. Because this setting is per page, you need to make sure it's turned on for each page in the report you want to refresh.
- Check whether you uploaded to a workspace with an attached Premium capacity. If you didn't, your refresh interval is locked at 30 minutes for fixed interval, and it isn't available for change detection.
- If your report is on a Premium workspace, ask your admin if this feature is enabled for the attached capacity. Also, make sure that the minimum refresh interval for the capacity is equal or lower than the interval for your report. This rule applies separately for both fixed interval and change detection.

**I'm a capacity admin. I changed the settings for my automatic page refresh interval, but the changes aren't reflected. Reports are still refreshing at a rate they shouldn't be, or they're not refreshing even though I turned on automatic page refresh.**

- It takes up to five minutes for automatic page refresh setting changes made in the capacity admin UI to propagate to reports.
- In addition to turning on automatic page refresh for the capacity, you also need to turn it on for the pages of a report where you want to enable it.
- Both refresh types are managed separately, so make sure that the type of refresh you're enabling is turned on.
- For more information on enabling and configuring workloads in a Premium capacity, see [Configure workloads in a Premium capacity](../enterprise/service-admin-premium-workloads.md).

**My report is operating in mixed mode. (Mixed mode means the report has a DirectQuery connection and an Import data source.) Some visuals aren't refreshing.**

- If your visuals reference Import tables, this behavior is expected. Automatic page refresh isn't supported for Import.
- See the first question in this section.

**My report was refreshing in the service, but then it suddenly stopped.**

- Try refreshing the page to see if the problem resolves itself.
- Check with your capacity admin. The admin might have turned off the feature or raised the minimum refresh interval. See the second question in this section.

**I'm a report author. My visuals aren't refreshing at the cadence I specified. They're refreshing at a slower rate.**

- If your queries take longer to run, your refresh interval is delayed. Automatic page refresh waits for all queries to finish before running new ones.
- Your capacity admin might set a minimum refresh interval that's higher than the one you set in your report. Ask your capacity admin to lower the minimum refresh interval.

**Are automatic page refresh queries served from the cache?**

- No. All automatic page refresh queries bypass any cached data.

**My change detection measure isn't triggering any updates**

- Make sure that change detection is turned on for the page. Because this setting is per page, you need to make sure it's turned on for each page in the report you want to refresh.
- Check whether you uploaded to a workspace with an attached Premium capacity. If you didn't, change detection won't work.
- If your report is on a Premium workspace, ask your admin if this feature is enabled for the attached capacity. Also, make sure that the minimum execution interval for the capacity is equal or lower than the interval for your report.
- If you checked all of the items mentioned earlier, check in Power BI Desktop or in edit mode if the measure is changing at all. To do this, drag it into the canvas and check if the value changes. If it doesn't, the measure might not be a good choice to poll for data source changes.

**When connected to analysis services, I can't see the APR toggle**

- Make sure your Analysis Services model is in [Direct Query mode](/analysis-services/tabular-models/directquery-mode-ssas-tabular).


## Related content

For more information, see these articles:

- [Using DirectQuery in Power BI](../connect-data/desktop-directquery-about.md)
- [Use composite models in Power BI Desktop](../transform-model/desktop-composite-models.md)
- [Use Performance Analyzer to examine report element performance](desktop-performance-analyzer.md)
- [Deploying and managing Power BI Premium capacities](../guidance/whitepaper-powerbi-premium-deployment.md)
- [Data sources in Power BI Desktop](../connect-data/desktop-data-sources.md)
- [Shape and combine data in Power BI Desktop](../connect-data/desktop-shape-and-combine-data.md)
- [Connect to Excel workbooks in Power BI Desktop](/power-query/connectors/excel)
- [Enter data directly into Power BI Desktop](../connect-data/desktop-enter-data-directly-into-desktop.md)
