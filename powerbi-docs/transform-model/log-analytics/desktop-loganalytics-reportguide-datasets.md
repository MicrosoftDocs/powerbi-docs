---
title: Using the Log Analytics for Power BI Datasets Template App (preview)
description: Usage guide for the Template App that visualizes Dataset activity from Analysis Services
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 10/21/2022
LocalizationGroup: Transform and shape data
---
# Using the Log Analytics for Power BI Datasets Template App (preview)

Power BI is integrating with Azure Log Analytics (LA) to enable administrators and Premium workspace owners to configure a connection from Power BI to a Log Analytics workspace in Azure subscriptions that they control. We published a template app to give you a head start with your analysis. This article describes the app so you can understand how to use the parameters, filters, navigation, and drillthrough paths to answer questions about dataset operations from the perspective of the Analysis Services (AS) engine. We will describe each page so you can understand its purpose and the typical use cases they support.

To [install the AS Engine app](install-as-engine-app.md), you must have a Log Analytics workspace. Once installed, anyone in the organization with the right permissions can view the app. You can see the source .pbit for the template app on [Github](https://github.com/microsoft/PowerBI-LogAnalytics-Template-Reports).

## App Goals
We wanted to build an app that can be used to analyze AS engine behavior in general, and to help isolate and debug specific problems in depth. Any operation can be sliced by CapacityId, Workspace Name, Dataset Name, and ReportId to give you the necessary context. We are looking into providing you with more item names, and not just the ID.

<details><br>
<summary>Some examples of questions that can be answered</summary>

**General**
* What is engine activity by capacity and workspace?
* What is my engine load by day or by hour?
* What operations are taking the most CPU time or duration?
* How does the load vary by hour of day?
* Which users are generating load?

**Query**
* Which DAX queries were issued in a particular scope? 
* Which queries are the most expensive?
* How does a unique DAX query vary over time, and which are the worst?
* What was the query text?
* What were the Storage Engine or DQ queries that were generated from a DAX query?
* How much time did the query spend in Storage Engine vs Formula Engine?
* Did queries use aggregations and what was the performance benefit?

**Refresh**
* Which refreshes are expensive? 
* Which refreshes are overlapping?
* Which operations within a refresh are in parallel, and which ones take the longest time?
* What were the different operations and sub-operations within a refresh?

**Others**
* Since the app contains a variety of AS engine events, you can customize the **app** to answer questions related to other events such as Discover or Notification.
</details>

## App Data Source

The app loads data from a single Azure Log Analytics workspace.
 
It doesn't matter if the Log Analytics workspace contains data from many Power BI workspaces. It also doesn't matter which level of administrator configured logging. The log schemas are exactly the same for every role, so there is only one version of the app. We included different levels of aggregation to accommodate a range of use cases. [Using Log Analytics in Power BI](desktop-log-analytics-overview.md) goes into detail on this.

## App Data Model

The app has the following tables and relationships:

* User
* Query Duration Segment
* Scenario
* Calendar
* Time
* Operation
* Suboperation - Aggregations
* Suboperation - Query
* Suboperation - Refresh

<details>
<summary>Screenshot of ER Diagram</summary>

![Screenshot of ER Diagram.](media/desktop-loganalytics-reportguide-datasets/er-diagram.png)

</details>

## App Parameters

The following parameters are defined in the template:

|**Parameter**  |**Description**  |
|---------|---------|
|Days Ago To Start     |Load data from the specified day to the time the call was initiated. The maximum value you can select is 30 days. However, your Premium capacity memory limits apply to this parameter. If those limits are exceeded, the template app may fail to refresh.    |
|Days Ago To Finish  |Load data up to the specified number of days ago. Use 0 for today. | 
|Log Analytics Table |Preset values corresponding to the Log Analytics source table:<br> -	PowerBIDatasetsWorkspace<br> -	PowerBIDatasetsTenant <br> Currently only PowerBIDatasetsWorkspace is supported. |
|Log Analytics WorkspaceId |GUID of the Azure Log Analytics workspace containing the AS Engine data. |
UTC Offset |An hourly offset used to convert the data from UTC to a local time zone. |
Pagination Hours | This is an optional parameter. It describes the time window for each log analytics call from Power BI. You only need to update this if you're running into failures while fetching data due to data size exceeding Log Analytics limits. |

<details>
<summary>Screenshot of AS Engine Parameters</summary>

![Screenshot of AS Engine Parameters.](media/desktop-loganalytics-reportguide-datasets/parameters.png)

</details>

## App Usage

### App Workflow

<details>
<summary>Diagram showing the major pages of the app and some important available drillthroughs</summary>

![Screenshot of Template App-ASEngine_Report Flow.](media/desktop-loganalytics-reportguide-datasets/template-app-as-engine-flow.png)

</details>

### Workspace Summary 
Shows engine activities and load at a workspace level, focusing on identifying interesting datasets, reports, or users. You can use this to identify a high-level issue to analyze further by navigating or drilling through to other pages of the app.

### Engine Activities
Provides engine load and activity trends by day and hour, with the ability to select a scenario such as Refresh Completed or Query Completed. You can drill through to the Engine Activity Detail page to get a look at a detailed list of each activity within the selected context.

### Engine Activity Detail
This is a drillthrough page showing event-level data. For example, you can list all queries that ran in a particular time range.

### Dataset Refresh
Provides a Gantt chart for style view of refreshes to observe duration and parallelism. You can drill through to the dataset refresh details for more details.

### Dataset Refresh Detail
A drillthrough page showing the operations that occurred within a single dataset refresh. You can use this view to identify the longest running operation in a refresh and to see if there are any dependencies between activities.

### Query Statistics
An overview of query performance, highlighting typical and low performing durations and letting you see how variable each unique query is.

### Query Detail
A drillthrough page showing visuals such as a detailed table for the query, a table for related queries etc. For Import tables, the page will show you the internal Vertipaq storage engine queries and durations. For DirectQuery models, the page will show you the external queries, for example T-SQL sent to a SQL Server.

### Query History
Shows you every execution of a query, provides CPU and duration stats and trend visuals to see if there are any spikes.

### User Activities
A summary view that focuses on users, helping you identify the most active users and those users who are experiencing worse performance relative to others.

### User Detail
A drillthrough page that provides details of the activities performed by a single user.

### Error Summary
Helps identify errors and spot any error trends.

### Error Details
Allows you to zoom in on a specific error by viewing the detailed event.

### Navigating in The App
<details>
<summary>The app contains a navigation bar at top of the page to navigate to the expected page.</summary>

![Screenshot of the navigation bar.](media/desktop-loganalytics-reportguide-datasets/nav-bar.png)

</details>

<details>
<summary>Also, there is a back button on top-left corner to go back to the previous page and an info icon that provides information about the page.</summary>

![Screenshot of Info & Back button_1.](media/desktop-loganalytics-reportguide-datasets/info-and-back.png)

</details>

### Filtering and Understanding Current Context
<details>
<summary>Every page has a filter button below the navigation bar that you can click to open the pop-up filter panel and make selections.</summary>

![Screenshot of filter button.](media/desktop-loganalytics-reportguide-datasets/filters.png)

</details>

<details>
<summary>The current values of the filters are displayed in the smart narrative next to the filters button. You can clear all the slicers using the **Clear** button on the top-left corner or close the window using the **X** button on top-right corner.</summary>

<br> Pop-up Filter <br>
![Screenshot of Pop-Up Filter.](media/desktop-loganalytics-reportguide-datasets/pop-up-filter.png)

Smart Narrative <br>
**![Screenshot of smart narrative.](media/desktop-loganalytics-reportguide-datasets/smart-narrative.png)**


>[!NOTE]
>If more than one value is selected for a filter, the smart narrative displays one of the values followed by "and more".

</details>  

## App Pages

* [Workspace Summary](#page-workspace-summary)
* [Engine Activities](#page-engine-activities-also-a-drillthrough)
* [Engine Activity Details](#drillthrough-page-engine-activity-details)
* [Dataset Refreshes](#page-dataset-refreshes-also-a-drillthrough)
* [Dataset Refresh Detail](#drillthrough-page-dataset-refresh-detail)
* [Query Statistics](#page-query-statistics-also-a-drillthrough)
* [Query Detail](#drillthrough-page-query-detail)
* [Query History](#drillthrough-page-query-history)
* [User Activities](#page-user-activities)
* [User Detail](#drillthrough-page-user-detail)
* [Error Summary](#page-error-summary)
* [Error Detail](#drillthrough-page--error-detail)
* [Help](#help)

### Page: Workspace Summary
This page is targeted at a Workspace Administrator and shows activities and statistics related to datasets and queries. It also identifies top reports by load, details popular datasets by operations or users, and allows drillthrough to various pages to get further details.

<details>
<summary>Workspace Summary</summary><br>

![Screenshot of ASEngine_WorkspaceSummary.](media/desktop-loganalytics-reportguide-datasets/workspace-summary.png)

The table below lists the visuals displayed on the workspace summary page according to their location on the page.

|Left  | Right  |
|---------|---------|
|**Top N reports with high CPU Usage** - Bar chart shows Top N reports with high aggregate CPU usage by default. <br><br> **Top N users with high CPU Usage** - Bar chart shows Top N users with high aggregate CPU usage by default.  |**Top 10 datasets by query executions** - Table shows 10 datasets by query executions in descending order. <br> <br> **Reports by slow queries** - Scatter chart shows the query performance distribution. |
|**Dataset refresh success vs failures** - Column chart shows number of successful vs failed dataset refreshes per day.  |**Queries by duration** - Column chart shows the count of queries by duration band.
|**Queries by date and duration segments** - Clustered column chart shows query count by query duration distribution per day. | |
</details>

### Page: Engine Activities (also a drillthrough)
This page provides a trend overview of AS Engine activities by day and by hour. It allows you to identify peaks or outliers on a day and then see how that activity was distributed by hour when you cross-highlight by selecting a day.

<details>
<summary>Engine Activities</summary>

![Screenshot of ASEngine_EngineActivities.](media/desktop-loganalytics-reportguide-datasets/engine-activities.png)

The table below lists the visuals displayed on the engine activities page according to their location on the page.

|Left  | Right  |
|---------|---------|
|**CPU time (s) and count of operation by date and scenario** - Columns show the total CPU time taken per day by each operation type.  | **Engine activity details** - Table is represented in stepped layout as a hierarchy across capacities, workspaces, datasets, and reports, showing a count of operations, CPU time, and durations. |
| **CPU time (s) and count of operations by hour and scenario** - Columns show the total CPU time taken per hour by each operation type. | |

</details>

### Drillthrough Page: Engine Activity Details

This page allows you to focus on a narrow time range and see the individual activities at a granular level of detail. The example below shows all the DAX queries that were executed in a minute, sorted by longest duration.

<details>
<summary>Engine Activity Details</summary>

![Screenshot of ASEngine_EngineActivityDetails.](media/desktop-loganalytics-reportguide-datasets/engine-activity-details.png)

The table below lists the visuals displayed on the engine activity details page according to their location on the page.

| Visuals  | 
|---------|
|**CPU time (s) and count of operation by scenarios over period of time** - Column chart shows the total CPU time taken by each scenario per day.  |
**Operations** - Table shows the detail of operations. |
</details>

### Page: Dataset Refreshes (also a drillthrough)

This page provides an overview of dataset refreshes occurring over a selected period. It allows you to identify long running refreshes and visualize which ones are happening in parallel. This page allows you to select any data refresh and drill through to a page called Dataset Refresh Detail.

<details>
<summary>Dataset Refreshes</summary>

![Screenshot of ASEngine_DatasetRefreshes.](media/desktop-loganalytics-reportguide-datasets/dataset-refreshes.png)

The table below lists the visuals displayed on the dataset refreshes page according to their location on the page.

| Visuals |
|---------|
|**Duration (ms) by refresh and start date/time** - Column chart shows the refresh duration for datasets over a period of time.|
| **Dataset refresh timeline** - Timeline visual shows refreshes per dataset over a period of time.|
| **Dataset refresh operations** - Table shows details for the refresh operations.|
</details>

### Drillthrough Page: Dataset Refresh Detail

This page allows you to visualize a single dataset refresh in detail. You can see all the internal operations that the engine performed such as executing queries and compressing data. It allows you to determine the longest running operations, which are parallel, and which may have dependencies.

<details>
<summary>Dataset Refresh Detail</summary>

![Screenshot of ASEngine_DatasetRefreshDetails.](media/desktop-loganalytics-reportguide-datasets/dataset-refresh-detail.png)

The table below lists the visuals displayed on the dataset refresh detail page according to their location on the page.

| Visuals  | 
|---------|
|**Data refresh suboperation timeline by object and event subclass** - Timeline of each corresponding dataset refresh sub-operation is displayed.  
| **Dataset refresh suboperations** - Table shows details of the sub-operations that the engine performs for each refresh. |
</details>

###	Page: Query Statistics (also a drillthrough)

This page focuses on queries in bulk. The goal is to identify which queries are common, and which queries have high variability. We provide percentiles and deviations to give you an idea of both typical and more extreme measurements.

Any query can be drilled through to a page called *Query Details* to see details about its execution,  such as Storage Engine and Formulae Engine time. You can also see the internal Vertipaq Queries or external DirectQuery text and duration depending on the model type.

You can also drill through to a page called *Query History* that will show you all the execution of that query over a period, and its performance trend.

<details>
<summary>Query Statistics</summary>

![Screenshot of ASEngine_QueryStatistcs.](media/desktop-loganalytics-reportguide-datasets/query-statistics.png)

The table below lists the visuals displayed on the query statistics page according to their location on the page.

|Left  | Right  |
|---------|---------|
|**Query success vs failures count** - Line chart shows daily trend of query completions and failures.  |**Queries by aggregation usage** - Shows how many queries used aggregations using both count and percentage. |
|**Queries by date and segments** - Clustered column chart shows query count by query duration segment. | | 
|**Top N queries by CPU variability** - Table is represented in stepped layout as a hierarchy across capacities, workspaces, datasets, reports, and queries showing the count of operations, CPU time standard deviation, and more. <br><br> **Top N queries by duration P50** - Table is represented in stepped layout as a hierarchy across capacities, workspaces, datasets, reports, and queries showing the count of operations, duration standard deviation, and more.||
</details>

### Drillthrough Page: Query Detail

This page provides a detailed look at a single execution of a DAX query. Depending on whether the query was for an Import or DQ model, you will either see the internal Vertipaq Storage Engine queries or the external DQ source queries (for example, T-SQL for SQL Server). It also identifies which aggregations were used, if any.

<details>
<summary>Query Detail</summary>

![Screenshot of ASEngine_QueryDetail.](media/desktop-loganalytics-reportguide-datasets/query-detail.png)

The table below lists the visuals displayed on the query detail page according to their location on the page.


|Left  | Right  |
|---------|---------|
|**Query executions** - Table lists each query executed, with performance details.  |**Event Text** - Table shows the complete event text for queries executed. |
|**CPU time (s) by date and time** - Line chart shows total CPU time taken in seconds depending on whether aggregation is used or not over a time period. <br><br> **Duration (ms) by date and time** - Line chart shows total duration taken in seconds depending on whether aggregation is used or not over a time period. |  | 

The cards on the right display the number of users who ran this query and the application that was used to run this query.
</details>

### Drillthrough Page: Query History

This is a historical view of a single unique query. It shows metrics over time and introduces the Storage Engine and Formula Engine time. You can use it to determine how consistent a query is over time and identify if issues are isolated to particular users or time frames.

<details>
<summary>Query History</summary>

![Screenshot of ASEngine_QueryHistory.](media/desktop-loganalytics-reportguide-datasets/query-history.png)


The table below lists the visuals displayed on the query history page according to their location on the page.

| Visuals  | 
|---------|
|**Query details** - Lists each query executed with performance details.  
|**Related queries details** - Table shows related query details. <br><br> **Aggregation details** - When queries are able to use aggregations, details are provided here. |


The cards on the right display the total number of executions of a given query, the execution times in ms and the aggregation utilization percentage.
</details>

### Page: User Activities

This page gives an overview of the user activities across the workspace. It also gives information about the most active users for a period by capturing their CPU time usage, query usage, and operations performed.

<details>
<summary>User Activities</summary>

![Screenshot of ASEngine_UserActivities.](media/desktop-loganalytics-reportguide-datasets/user-activities.png)

The table below lists the visuals displayed on the user activities page according to their location on the page.

|Left  | Right  |
|---------|---------|
|**Top N users by operation** - Shows the top 5 users who performed the most operations against the dataset. <br><br> **Top N users by query execution** - Shows the top 5 users who ran the most queries against the dataset. |**Queries vs CPU time by users** - Compares query count vs Avg CPU time for each unique query text. | 
| **Daily user and operation count** - Columns show count of users and line shows operation count, both by day. | **Hourly user and operation count** - Column chart represents the users as column and operation count over the time as hourly trend for user.
|**User details** - Shows a count of actions and artifacts per user. | |

The cards on the right display user count and operations count.
</details>

### Drillthrough Page: User Detail

This page provides a detailed historical view of activities for a single user.

<details>
<summary>User Detail</summary>

![Screenshot of ASEngine_UserDetails.](media/desktop-loganalytics-reportguide-datasets/user-detail.png)

The table below lists the visuals displayed on the user detail page according to their location on the page.

|Left  | Right  |
|---------|---------|
|**CPU time (s), count of operations and users by date** - Columns show the total CPU time taken by per day by each operation type. The line shows the count of operations for a day. |**CPU time (s), count of operations and earliest date by hour and scenario** - This hourly breakdown complements the daily version of the chart.|
|**User details** - Table shows the user activities sorted by timestamp.|
</details>

### Page: Error Summary
This page provides an overview of errors or failed executions over time, allowing you to view individual operations that reported an error status.

<details>
<summary>Error Summary</summary>

![Screenshot of ASEngine_ErrorSummary.](media/desktop-loganalytics-reportguide-datasets/error-summary.png)

The table below lists the visuals displayed on the error summary page according to their location on the page.

|Left  | Right  |
|---------|---------|
|**Total query failed and query failure rate by date** - Columns shows total failed queries. Line values represent the query failure rate. <br><br>**Total failed refreshes and refresh - failure rate by date** - Columns shows total failed dataset refreshes. Line values represent the dataset refresh failure rate. Both are shown by day. |**Failure details** - Table shows the details of failure with respect to the total values.|
|**Error details** - Lists errors reported by datasets for any operation.||
</details>

The cards on the right display overall operations count, query failure count, refresh failure count, and user count.

### Drillthrough Page:  Error Detail
This page provides details of errors generated by the engine. It also provides the information about failed operations due to query failures.

<details>
<summary>Error Detail</summary>

![Screenshot of ASEngine_ErrorDetails.](media/desktop-loganalytics-reportguide-datasets/error-detail.png)

The table below lists the visuals displayed on the error detail page according to their location on the page.

| Visuals  |  
|---------|
|**CPU time (ms) total and count of operations by date, hour and scenario** - Line and column chart shows the trends for the scenario executed on the day distributed by CPU time taken for each scenario in stacked column series.|
|**Operations** - Table lists all operations performed on the dataset.|
</details>

### Help

This page provides a help summary of different features throughout the app. It also has support links that can be used for any support assistance.

<details>
<summary>Help</summary>

![Screenshot of ASEngine_Help.](media/desktop-loganalytics-reportguide-datasets/help.png)

>[!NOTE]
>Each visual in the AS Engine app has a **?** icon. Select this icon to learn more about the visual.

</details>

## Considerations and Limitations

* Log Analytics Query Limits

  * Kusto has limits in terms of number of records returned and the overall size of the data based on the query. The app has been built to work around these limits by pulling data in sequential chunks. However, you might still exceed these limits, resulting in a refresh failure in this template app. [Query Limits](/azure/data-explorer/kusto/concepts/querylimits)

  * If template app refresh is failing due to above data limits, you can configure the Pagination Hours parameter. Setting a lower value here will lower the amount of data retrieved from Log Analytics per call by increasing the number of calls.
 
* The following events are intentionally excluded from Log Analytics during the Preview. Due to this, storage engine sub-queries are not visible for now on the Query Detail page.
  
  * ProgressReportCurrent
  * ProgressReportBegin
  * ProgressReportError
  * VertipaqSEQueryBegin
  * VertipaqSEQueryEnd


## Next steps
The following articles provide more information about Power BI and its many features:

* [Log Analytics for Analysis Services Template App](https://appsource.microsoft.com/product/power-bi/pbi_pcmm.powerbiloganalyticsforasengine)
* [Install Log Analytics Template App](install-as-engine-app.md)
* [Configuring Azure Log Analytics for Power BI (Preview)](desktop-log-analytics-configure.md)
* [Azure Log Analytics in Power BI FAQ](desktop-log-analytics-faq.md)
* [What is Power BI Premium?](../../enterprise/service-premium-gen2-what-is.md)


