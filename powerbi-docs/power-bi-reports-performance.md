---
title: Power BI performance best practices
description: This article provides guidance for building fast and reliable reports in Power BI
author: MarkMcGeeAtAquent
ms.author: kfile
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 05/18/2018
LocalizationGroup: Reports
---

# Power BI performance best practices

This article offers guidance for building fast and reliable reports in Power BI.  

## Use filters to limit report visuals to display only what’s needed 

The more data that a visual needs to display, the slower that visual will be to load. While this principle seems obvious, it can be easy to forget. For example: suppose you have a large dataset. Atop of that, you build a report with a table of the table. End users use slicers on the page to get to the rows they wanted – typically they’re only interested in a few dozen rows.

A common mistake is to have the default view of the table be unfiltered - that is, all 100M+ rows. The data for these rows must be loaded into memory and uncompressed at every refresh. This created huge memory loads. The solution: reduce the max number of items that the table displayed using the “Top N” filter. The max item can be much larger than what users would need, for example, 10,000. As a result, the end-user experience was unchanged, but memory utilization of the report dropped multiple orders of magnitude, and performance improved accordingly.

A similar approach to the above is suggested for all visuals on your reports. Ask yourself, is all the data in this visual needed? Are there ways to filter down the amount of data shown in the visual with minimal impact to the end-user experience? Note that tables in particular can be expensive.

## Limit visuals on report pages

The above principle applies equally to the number of visuals on a particular report. It's highly recommended you limit the number of visuals on a particular report to only what is necessary. Drill-through pages are a great way to provide additional details without jamming more visuals into the report.  

## Optimize your model

Some best practices:

- Tables or columns that are unused should be removed if possible. 
- Avoid distinct counts on fields with high cardinality – that is, millions of distinct values.  
- Take steps to avoid fields with unnecessary precision and high cardinality. For example, you could split highly unique datetime values into separate columns – for example, month, year, date, etc. Or, where possible, use rounding on high-precision fields to decrease cardinality – (for example, 13.29889 -> 13.3).
- Use integers instead of strings, where possible.
- Be wary of DAX functions, which need to test every row in a table – for example, RANKX – in the worst case, these functions can exponentially increase run-time and memory requirements given linear increases in table size.
- When connecting to data sources via DirectQuery, consider indexing columns that are commonly filtered or sliced again – this will greatly improve report responsiveness.  

For more guidance on optimizing data sources for DirectQuery, see [DirectQuery in SQL Server 2016 Analysis Services](https://blogs.msdn.microsoft.com/analysisservices/2017/04/06/directquery-in-sql-server-2016-analysis-services-whitepaper/).

## DirectQuery and Live connection: understand underlying data source performance

In the DirectQuery or live connection case, when users visit a Power BI report, Power BI sends queries in real time to the underlying data source. Once the data source returns with the query data, then the report is rendered. As a result, your report performance in these cases depends largely on the performance of the underlying data source.

In these cases, it will be important to understand the performance of your underlying data source. Different data sources will have different tools for understanding query performance. For example, SQL Server and Azure SQL provide the Query Store, which captures a history of queries and their runtime statistics.

As a rule of thumb, when deploying Power BI reports built on DirectQuery and live connection, try out what your end users will do in Power BI Desktop. If the report is slow to load in Power BI Desktop, it will almost certainly be slow to load in the service for your end users. 

## DirectQuery best practices

The following section describes general best practices for connecting via DirectQuery.
  
### DB design guidance

- Push calculated columns and measures to the source where possible – the closer they are to the source, the higher the likelihood of performance.
- Optimize! Understand the execution plans for your queries, add indices for commonly filtered columns, etc.

### Modeling guidance

- Start in the Power BI Desktop.
- Avoid complex queries in Query Editor.
- Do not use relative date filtering in the Query Editor.  
- Keep measures simple initially, and add complexity incrementally.
- Avoid relationships on calculated columns and unique identifier columns.
- Try setting “Assume Referential Integrity” on relationships – in many cases, this can significantly improve query performance.  

### General

- Apply filters first.
- Consider switching off interaction between visuals – this will reduce the query load when users cross-highlight.
- Limit the number of visuals and the data per visuals, as described above.
- Enabling row-level security can result in substantial changes in performance. Be sure to test the different row-level security roles that your users will assume.
- There are query-level time-outs enforced by the service to ensure that long-running queries cannot monopolize system resources. Queries that take longer than 225 seconds will time out and result in a visual-level error.

## Understand dashboards and query caches

Visuals pinned to dashboards are served by the query cache when the dashboard is loaded. Conversely, when visiting a report, the queries are made on-the-fly to the data source – either the Power BI service (in the case of import) or the data source that you specify (in the case of DirectQuery or live connection).  

> [!NOTE]
> When you pin live report tiles a dashboard, they are not served from the query cache – instead, they behave like reports, and make queries to back-end cores on the fly.

As the name suggests, retrieving the data from the query cache provides better and more consistent performance than relying on the data source. One way to take advantage of this functionality is to have dashboards be the first landing page for your users. Pin often used and highly requested visuals to the dashboards. In this way, dashboards become a valuable “first line of defense”, which provide consistent performance with less load on the capacity. Users can still click through to the report to dig into the details.  
 

For DirectQuery and live connection, this query cache is updated on a periodic basis by querying the data source. By default, this happens every hour, though it can be configured in dataset settings. Each query cache update will send queries to the underlying data source to update the cache. The number of queries generated depends on the number of visuals pinned to dashboards relying on that data source. Notice that if row-level security is enabled, queries are generated for each different security context. For example, if you have two different roles that your users fall into, with two different views of the data, then during query cache refresh, two sets of queries are generated. 

## Understand custom visual performance 

Be sure to put each custom visual through its paces to ensure high performance. Poorly optimized custom visuals can negatively affect the performance of the entire report. 

## Deep-dive into query performance with SQL Profiler and Power BI Desktop

For a deeper dive into which visuals are taking up the most time and resources, you can connect SQL Profiler to Power BI Desktop to get all full view of query performance.

> [!NOTE]
> Power BI desktop supports connecting to a diagnostics port. The diagnostic port allows for other tools to connect to and perform traces for diagnostic purposes. *Making any changes to the model is not supported! Changes to the model may lead to corruption and data loss.*

Instructions as follows:
  
1. **Install SQL Server Profiler and run Power BI Desktop**

   SQL Server Profiler is available as part of SQL Server Management Studio.

2. **Determine the port being used by Power BI Desktop**

   Run the command prompt or PowerShell with administrator privileges, and use netstat to find the port that Power BI Desktop is using for analysis:

   `> netstat -b -n`

   The output should be a list of applications and their open ports, for example:  

   `TCP    [::1]:55786            [::1]:55830            ESTABLISHED`

   [msmdsrv.exe]

   Look for the port used by msmdsrv.exe, and write it for later use. In this case, you use port 55786.
3. **Connect SQL Server Profiler to Power BI Desktop**

   - Start SQL Server Profiler from the **Start** menu
   - **File** > **New Trace**
   - Server Type: Analysis Services
   - Server name: localhost:[port number found above]
   - At the next screen, select **Run**
   - Now the SQL Profiler is live, and actively profiling the queries that Power BI Desktop is sending. 
   - As queries are executed, you can see their respective durations and CPU times – using this information, you can determine which queries are the bottlenecks.  

Through the SQL Profiler, you can identify the queries, which are taking up the longest CPU time, which in turn are likely the performance bottlenecks. The visuals, which execute those queries should be a focal point of continued optimization.

## Gateway best practices

The On-premises data gateway is a great tool for connecting the Power BI service with your on-premises data. At the same time, with poor planning, it can also become a bottleneck for report performance. This is especially true for DirectQuery/live connection datasets, where all queries and query responses pass through the gateway. The following are some best practices for ensuring highly performant gateways: 

- **Use the Enterprise mode**, as opposed to the personal mode.
- **Recommended hardware specs for the gateway** – eight CPU cores, 16-GB RAM.
- **Set up monitoring** – set up performance monitoring on the gateway machine understand whether the gateway is becoming overloaded and becoming a bottleneck. For more information, see [Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md).
- **Scale up or scale out** – if the gateway is indeed becoming a bottleneck, then consider scaling up (that is, moving the gateway to a more powerful machine with more CPU and RAM) or scaling out (for example, splitting out datasets onto different gateways). 
- **Separate import vs. DirectQuery** – if scaling out, consider separating the gateways responsible for import vs. those responsible for DirectQuery.

## Network latency

Network latency can impact report performance by increasing the time required for requests to reach the Power BI service, and for responses to be delivered. Tenants in Power BI are assigned a specific region. You can view your tenant’s “home” region by navigating to powerbi.com, selecting?** in the top right and then **About Power BI**. When users from a tenant access the Power BI service, their requests are always routed to this region. Once the requests reach the Power BI service, the service may then send additional requests – for example, to the underlying data source or the gateway – which are also subject to network latency.

Tools such as [Azure Speed Test](http://azurespeedtest.azurewebsites.net/) can provide an indication of network latency between the client and the Azure region. In general, to minimize the impact of network latency, strive to keep data sources, gateways, and your Power BI cluster as close as possible. If network latency is an issue, you can try locating gateways and data sources closer to your Power BI cluster by placing them on virtual machines.

To further improve network latency, consider using [Azure ExpressRoute](https://azure.microsoft.com/services/expressroute/), which is able of creating faster, more reliable network connections between your clients and Azure datacenters.

## Next steps

- [Planning a Power BI Enterprise Deployment](https://aka.ms/pbienterprisedeploy), with all-around guidance on large-scale Power BI deployments
- [DirectQuery in SQL Server 2016 Analysis Services](https://blogs.msdn.microsoft.com/analysisservices/2017/04/06/directquery-in-sql-server-2016-analysis-services-whitepaper/)
- [[YouTube] Building Fast and Reliable Reports in Power BI](https://www.youtube.com/watch?v=GhiJABR7XX0)
- [[YouTube] Power BI Enterprise Deployments](https://www.youtube.com/watch?v=K-zEWICvICM)