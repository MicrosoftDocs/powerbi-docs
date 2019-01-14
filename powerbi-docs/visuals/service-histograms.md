---
title: Histograms
description: Histograms
author: mihart
manager: kvivek
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 07/27/2018
ms.author: mihart

LocalizationGroup: Visualizations
---
# Histograms
There are several ways to build histograms in Power BI. We'll start with the simplest and go from there.

## Simple Histograms
To get started, determine which query has the field you want to build a histogram on.  Use the *Reference* option for the query to create a new query and name it *FieldName Histogram*. Use the **Group by** option in the **Transform** ribbon and select the **count rows** aggregate. Ensure the data type is a number for the resulting aggregate column. Then you can visualize this data on the reports page. This approach is fast and easy to build, but doesn't work well if you have many data points and does not allow brushing across visuals.

## Defining buckets to build a histogram
Determine which query has the field you want to build a histogram on. Use the *Reference* option for the query to create a new query and name it *FieldName*.  Now define the buckets with a rule. Use the **Add Custom Column** option on the **Add Column** ribbon and build a custom rule.

![](media/service-histograms/powerbi-service-histograms_1.png)

Ensure the data type is a number for the resulting aggregate column. Now you can use the group by technique described in **Simple Histograms** (earlier in this article) to achieve the histogram. This option handles more data points but still does not help with brushing.

## Defining a histogram that supports brushing
Brushing is when visuals are linked together so that when a user selects a data point in one visual other visuals on the report page highlight or filter data points related to the selected data point.  Since we're manipulating data at query time, we will need to create a relationship between tables and ensure we know which detail item relates to the bucket in the histogram and vice-versa.

Start the process by using the *Reference* option on the query that has the field you want to build a histogram on.  Name the new query *Buckets*.  For this example let's call the original query *Details*.  Next remove all columns except the column you'll use as the bucket for the histogram.  Now use the *Remove Duplicates* feature in query, it's on the right click menu when you select the column, so the remaining values are the unique values in the column. If you have decimal numbers you can first use the tip for defining buckets to build a histogram to get a manageable set of buckets.  Now, check the data shown in the query preview. If you see blank values or null you'll need to fix those up before creating a relationship. See "Creating a relationship if my data has null or blank values". Using this approach can be problematic due to the need to sort. To get the buckets to sort correctly, see "Sorting order: make categories appear in the order I want". 

> [!NOTE]
> It's useful to think about the sort order before building any visuals.   
> 
> 

Next step in the process is to define a relationship between the *Buckets* and *Details* queries on the buckets column.  In *Power BI Desktop*, select *Manage Relationships* in the ribbon.  Create a relationship where *Buckets* is in the left table and *Details* in on the right table, and select the field you're using for the histogram. 

Last step is to create the histogram. Drag the Bucket field from the *Buckets* table. Remove the default field from the resulting column chart.  Now from the *Details* table drag the histogram field into the same visual. In the field well, change the default aggregate to Count. The result is the histogram. If you create another visual like a treemap from the Details table, select a data point in treemap to see the histogram highlight and show the histogram for the selected data point relative to the trend for the entire data set.

