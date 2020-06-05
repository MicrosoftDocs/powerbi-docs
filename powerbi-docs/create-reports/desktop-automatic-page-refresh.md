---
title: Automatic page refresh in Power BI Desktop (preview)
description: This article shows how to automatically refresh pages for DirectQuery sources in Power BI Desktop.
author: davidiseminger
ms.reviewer: ''

ms.custom:
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 06/03/2020
ms.author: davidi
LocalizationGroup: Connect to data
---

# Automatic page refresh in Power BI Desktop (preview)

When you monitor critical events, it's important for data to be refreshed as soon as the source data gets updated. For example, in the manufacturing industry, it's critical to know when a machine is malfunctioning or is close to malfunctioning.

The automatic page refresh feature in Power BI enables your active report page to query for new data, at a predefined cadence, for [DirectQuery sources](https://docs.microsoft.com/power-bi/desktop-directquery-about).

## Using automatic page refresh

For this preview version, you must enable the automatic page refresh feature in Power BI Desktop. 

1. Go to **File > Options and settings** > **Options** and select **Preview features** in the left pane. 

2. Select **Automatic page refresh**. 

Automatic page refresh is available only for DirectQuery data sources.

To use automatic page refresh, select the report page for which you want to enable refresh. In the **Visualizations** pane, select the **Formatting** button (a paint roller) and find **Page refresh** near the bottom of the pane. 

![Page refresh location](media/desktop-automatic-page-refresh/automatic-page-refresh-01.png)

The following image shows the **Page refresh** card. The numbered elements are described after the image.

![Page refresh card](media/desktop-automatic-page-refresh/automatic-page-refresh-02.png)

1.    Turns page refresh on or off
2.    Number value for the page refresh interval
3.    Unit for the page refresh interval

On this card, you can turn on page refresh and select the refresh duration. The default value is 30 minutes. (The minimum refresh interval is one second.) Your report will begin refreshing at the interval you set. 

## Determining the page refresh interval

When automatic page refresh is enabled, Power BI Desktop is constantly sending queries to your DirectQuery source. After the query is sent, there's a delay before data is returned. So, for short refresh intervals, you should confirm that queries are successfully returning the queried data within the configured interval. If data isn't returned within the interval, visuals will update less frequently than configured.

As a best practice, the refresh interval should at least match your expected new data arrival rate:

* If new data arrives at the source every 20 minutes, your refresh interval can't be less than 20 minutes. 

* If new data arrives every second, set the interval to one second. 

For low refresh intervals like one second, take factors like the following into consideration:
- The type of the direct query data source
- The load your queries create on it
- The distance of your report viewers from the capacity's datacenter 

You can estimate return times by using Performance Analyzer in Power BI Desktop. Performance Analyzer lets you check if each visual query has enough time to come back with result from the source. It also lets you determine where time is spent. Based on the results of Performance Analyzer, you can adjust the data source, or you can experiment with other visuals and measures in your report.

This image shows the results of a DirectQuery in Performance Analyzer:

![Performance Analyzer results](media/desktop-automatic-page-refresh/automatic-page-refresh-03.png)

Let's consider some other characteristics of this data source: 

-    Data arrives at a rate of two seconds. 
-    Performance Analyzer shows a maximum query + display time of approximately 4.9 seconds (4,688 milliseconds). 
-    The data source is configured to handle approximately 1,000 concurrent queries per second. 
-    You expect approximately 10 users to be viewing the report concurrently.

So that results in the following:

**5 visuals x 10 users = approximately 50 queries**

The result of this calculation shows much more load than the data source can support. The data arrives at a rate of two seconds, so that should be your refresh rate. But because the query takes around five seconds to complete, you should set it to more than five seconds. 

Also note that this result might differ as you publish your report to the service. This difference occurs because the report will use the Azure Analysis Services instance that's hosted in the cloud. You might want to adjust your refresh rates accordingly. 

To account for queries and refresh timing, Power BI will only run the next refresh query when all the remaining refresh queries are complete. So even if your refresh interval is shorter than the time your queries take to process, Power BI will refresh again only after remaining queries complete. 

Now let's look at how you can potentially detect and diagnose performance problems as a capacity administrator. You can also check the [Frequently asked questions](#frequently-asked-questions) section, later in this article, for more questions and answers about performance and troubleshooting.

## Automatic page refresh in the Power BI service

You can also set automatic page refresh intervals for reports that have been authored in Power BI Desktop and published to the Power BI service. 

To configure automatic page refresh for reports in the Power BI service, you use steps that are similar to the steps you'd use in Power BI Desktop. When configured in the Power BI service, automatic page refresh also supports [embedded Power BI](../developer/embedded/embedding.md) content. This image shows the **Page refresh** configuration for the Power BI service:

![Automatic page refresh in the Power BI service](media/desktop-automatic-page-refresh/automatic-page-refresh-04.png)

These descriptions correspond to the numbered elements: 

1.    Turns page refresh on or off.
2.    Number value for the page refresh interval. Must be a whole number.
3.    Unit for the page refresh interval.

### Page refresh intervals

The page refresh intervals allowed in the Power BI service are affected by the report's workspace type. This applies to these reports:

* Publishing a report into a workspace that has automatic page refresh enabled
* Editing a page refresh interval that's already in a workspace
* Creating a report directly in the service

Power BI Desktop has no restrictions for refresh intervals. Its refresh interval can be as frequent as every second. But when reports are published to the Power BI service, certain restrictions apply. These restrictions are described in the following sections.

### Restrictions on refresh intervals

In the Power BI service, restrictions on automatic page refresh apply based on factors like the workspace and whether you're using Premium services.

To clarify how this works, let's start with some background on capacities and workspaces.

*Capacities* are an important Power BI concept. They represent a set of resources (storage, processor, and memory) that are used to host and deliver Power BI content. Capacities are either shared or dedicated. A *shared capacity* is shared with other Microsoft customers. A *dedicated capacity* is fully committed to a single customer. For an introduction to dedicated capacities, see [Managing Premium capacities](../admin/service-premium-capacity-manage.md).

In shared capacity, workloads run on computational resources shared with other customers. Because the capacity needs to share resources, limitations are imposed to ensure *fair play*, such as setting a maximum model size (1 GB) and maximum daily refresh frequency (eight times per day).

Power BI *workspaces* reside within capacities. They represent security, collaboration, and deployment containers. Each Power BI user has a personal workspace known as **My Workspace**. Additional workspaces can be created to enable collaboration and deployment. They're known as *workspaces*. By default, workspaces, including personal workspaces, are created in the shared capacity.

Here are some details for the two workspace scenarios:

**Shared workspaces**. For regular workspaces (workspaces that aren't part of a Premium capacity), automatic page refresh has a minimum interval of 30 minutes (the lowest interval allowed).

**Premium workspaces**. The availability of automatic page refresh in Premium workspaces depends on the workload settings your Premium administrator has set up for the Power BI Premium capacity. There are two variables that might affect your ability to set up automatic page refresh:

 - **Feature on/off**. If your capacity administrator has disabled the feature, you won't be able to set up any type of page refresh in your published report.

 - **Minimum refresh interval**. When enabling the feature, your capacity administrator needs to set up a minimum refresh interval. If your interval is lower than the minimum, the Power BI service overrides your interval to respect the minimum interval set by your capacity administrator. That override is referred to as "Capacity admin override" in the following table. 

This table describes with more detail where this feature is available and the limits for each capacity type and [storage mode](../connect-data/service-dataset-modes-understand.md):

| Storage mode | Dedicated capacity | Shared capacity |
| --- | --- | --- |
| DirectQuery | **Supported**: Yes <br>**Minimum refresh interval**: 1 second <br>**Capacity admin override**: Yes | **Supported**: Yes <br>**Minimum refresh interval**: 30 minutes <br>**Capacity admin override**: No |
| Import | **Supported**: No <br>**Minimum refresh interval**: N/A <br>**Capacity admin override**: N/A | **Supported**: No <br>**Minimum refresh interval**: N/A <br>**Capacity admin override**: N/A |
| Mixed mode (DirectQuery + other data sources) | **Supported**: Yes <br>**Minimum refresh interval**: 1 second <br>**Capacity admin override**: Yes | **Supported**: Yes <br>**Minimum refresh interval**: 30 minutes <br>**Capacity admin override**: No |
| Live connect AS | **Supported**: No <br>**Minimum refresh interval**: N/A <br>**Capacity admin override**: N/A | **Supported**: No <br>**Minimum refresh interval**: N/A <br>**Capacity admin override**: N/A |
| Live connect PBI | **Supported**: No <br>**Minimum refresh interval**: N/A <br>**Capacity admin override**: N/A | **Supported**: No <br>**Minimum refresh interval**: N/A <br>**Capacity admin override**: N/A |

> [!NOTE]
> When you publish your automatic page refresh-enabled report from Power BI Desktop to the service, you'll have to provide the credentials for the DirectQuery data source on the dataset settings menu.

## Considerations and limitations

There are a few things to keep in mind when you use automatic page refresh in Power BI Desktop or in the Power BI service:

* Import, LiveConnect, and Push storage modes aren't supported for automatic page refresh.  
* Composite models that have at least one DirectQuery data source are supported.
* Power BI Desktop has no restrictions for refresh intervals. The interval can be as frequent as every second. When reports are published to the Power BI service, certain restrictions do apply, as described [earlier](#restrictions-on-refresh-intervals) in this article.

### Performance diagnostics

Automatic page refresh is useful for monitoring scenarios and exploring fast-changing data. But sometimes it can put undue load on the capacity or data source.

To prevent undue load on data sources, Power BI has these safeguards:

- All automatic page refresh queries run at a lower priority to ensure that interactive queries (like page load and cross-filtering visuals) take precedence.
- If a query hasn't finished before the next refresh cycle, Power BI doesn't issue new refresh queries until the previous query completes. For example, if you have a refresh interval of one second and your queries take an average of four seconds, Power BI effectively only issues a query every four seconds.

There are two areas where you could still encounter performance bottlenecks:

1. **The capacity**. The query first hits the Premium capacity, which will fold and evaluate the DAX query generated from the report visualizations into the source queries.
2. **The DirectQuery data source**. The translated queries in the previous step are then run against the source. The source would be your SQL Server instances, SAP Hana sources, and so on.

By using the [Premium Capacity Metrics app](../admin/service-admin-premium-monitor-capacity.md) that's available to admins, you can visualize how much of the capacity is being used by low priority queries.

Low priority queries consist of automatic page refresh queries and model refresh queries. There's currently no way to distinguish between the load from automatic page refresh and model refresh queries.

If you notice that your capacity is getting overloaded with low priority queries, there are a few actions you can take:

- Request a larger premium SKU.
- Contact the report owner, and ask to lower the refresh interval.
- In the capacity admin portal, you can:
   - Turn off automatic page refresh for that capacity.
   - Raise the minimum refresh interval, which will affect all reports on that capacity.


### Frequently asked questions

**I'm a report author. I defined my report refresh interval to 1 second on Power BI Desktop, but, after publishing, my report isn't refreshing in the service.**

* Ensure that automatic page refresh is turned on for the page. Because this setting is per page, you need to ensure it's turned on for each page in the report you want to refresh.
* Check whether you uploaded to a workspace with an attached Premium capacity. If you haven't, your refresh interval will be locked at 30 minutes.
* If your report is on a Premium workspace, ask your admin if this feature is enabled for the attached capacity. Also, ensure that the minimum refresh interval for the capacity is lower than or the same as the interval for your report.

**I'm a capacity admin. I changed the settings for my automatic page refresh interval, but the changes aren't reflected. In other words, reports are still refreshing at a rate they shouldn't be, or not refreshing even though I turned on automatic page refresh.**

* Automatic page refresh setting changes made in the capacity admin UI take up to 5 mins to propagate to reports.
* In addition to turning on automatic page refresh for the capacity you also need to turn it on for pages of a report where you want to see it.

**My report is operating in mixed mode (mixed mode means the report has a DirectQuery connection and an Import data source). Not all visuals are refreshing.**

- If your visuals reference Import tables, this is expected. automatic page refresh isn't supported for Import.
- See question 1 in this section.

**My report was refreshing fine in the service, and then suddenly stopped.**

* Try refreshing the page to see if the issue resolves itself.
* Check with your capacity admin, as they may have turned off the feature or raised the minimum refresh interval (See Question 2)

**I'm a report author. My visuals are not refreshing at the cadence I stated. They are refreshing at a slower rate.**

* If your queries are taking longer to execute, your refresh interval will be delayed. automatic page refresh waits for all queries to finish running before running new ones.
* Your capacity admin might have set a minimum refresh interval that is higher than the one you set it your report. Contact your capacity admin and ask for it to be lowered.

**Are automatic page refresh queries served from cache?**

* No, all automatic page refresh queries by-pass any cached data.


## Next steps

For more information, see the following articles:

* [Using DirectQuery in Power BI](../connect-data/desktop-directquery-about.md)
* [Use composite models in Power BI Desktop](../transform-model/desktop-composite-models.md)
* [Use Performance Analyzer to examine report element performance](desktop-performance-analyzer.md)
* [Deploying and Managing Power BI Premium Capacities](../guidance/whitepaper-powerbi-premium-deployment.md)
* [Data Sources in Power BI Desktop](../connect-data/desktop-data-sources.md)
* [Shape and Combine Data with Power BI Desktop](../connect-data/desktop-shape-and-combine-data.md)
* [Connect to Excel workbooks in Power BI Desktop](../connect-data/desktop-connect-excel.md)   
* [Enter data directly into Power BI Desktop](../connect-data/desktop-enter-data-directly-into-desktop.md)   
