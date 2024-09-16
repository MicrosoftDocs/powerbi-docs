---
title: Power BI entry point to Real-Time Intelligence sample experience
description: Describes the entry point from Power BI to the Real-Time Intelligence sample epxerience for identified customers.
author: andykop
ms.author: v-andykop
ms.service: powerbi
ms.topic: concept-article
ms.date: 09/15/2024
---
# The Real-Time Intelligence sample experience

You're invited to a sample experience in Real-Time Intelligence in Microsoft Fabric.

When integrated with Real-Time Intelligence, Power BI can use data streams to provide up-to-the-minute insights. Real-Time Intelligence manages the ingestion, transformation, and storage of streaming data, and makes it available for analysis and visualization in Power BI. This integration provides a comprehensive and fully integrated solution for real-time data analysis and visualization. It's an especially effective solution for use cases with high volumes of data or high refresh rates.

## What is Real-Time Intelligence?

Real-Time Intelligence is a powerful service in the Fabric product suite that can help you extract insights and visualize your data in motion.  It offers an end-to-end solution for event-driven scenarios, streaming data, and data logs.  

Real-Time Intelligence is a highly efficient and effective solution for customers working with large volumes of streaming data. It gives high levels of data freshness and high refresh rates, with only a few seconds of latency.

Learn more about [Real-Time Intelligence](/fabric/real-time-intelligence/).

## The Real-Time Intelligence sample experience

Your use case in Power BI is identified as one that could benefit from a Real-Time Intelligence and Power BI integration. There is a bubble pop-up inviting you to try a sample experience in Real-Time Intelligence.

When you select **Try a sample**, an end-to-end flow of Real-Time Intelligence is initiated. In the background, the system builds you a sample Event stream, Eventhouse, KQL database, KQL queryset, Real-Time Dashboard and a Power BI report based on streamed data. Once the build is completed, a pop-up appears with individual links to each of the sample items and to the supporting documentation.

Select **Explore** to close the dialogue box and go directly to the sample database web UI in Real-Time Intelligence.

## Items in Real-Time Intelligence

The main components of Real-Time Intelligence, and the sample experience, are:  

* **Event stream** An event stream is the engine for data ingestion and processing of your real-time data into Microsoft Fabric. You can transform your data and route it via filters to various destinations. Read more about [event streams](/fabric/real-time-intelligence/event-streams/overview).

* **Eventhouse** An eventhouse is where data is stored and analysed. An eventhouse is designed to handle real-time data streams efficiently. An eventhouse can hold one or more KQL databases. They're tailored to large volumes of time-based, streaming events with structured, semi structured, and unstructured data. Read more about [Eventhouse](/fabric/real-time-intelligence/eventhouse).

* **KQL Database** A KQL (Kusto Query Language) database is where data is stored and managed. It allows you to query data in real-time, providing a powerful tool for data exploration and analysis. The KQL database supports various data policies and transformations. Read more about [KQL databases](/fabric/real-time-intelligence/create-database).

* **KQL Queryset** A KQL queryset is used to run queries, view, and customize query results on data from a KQL database. Read more about [KQL queryset](/fabric/real-time-intelligence/create-query-set).

* **Real-Time Dashboard** A Real-Time dashboard provides an up-to-the-second snapshot of various metrics and data points in a collection of tiles. Each tile has an underlying query and a visual representation. It allows you to visualize data in real-time, providing insights and enabling data exploration. Read more about [Real-Time dashboards](/fabric/real-time-intelligence/dashboard-real-time-create).

Power BI is used to create real-time reports that display data from event streams and KQL databases managed by Real-Time Intelligence.

## Create your own Real-Time Dashboard

If you want to implement this solution with our own data, see the step-by-step guide on how to do it in [Real-Time Intelligence tutorials](/fabric/real-time-intelligence/tutorial-introduction).

Before you begin, you need a [workspace](/fabric/get-started/create-workspaces) with a Microsoft Fabric-enabled [capacity](/fabric/enterprise/licenses#capacity).

Here's a summary of the steps you need to take:

1. [Create an eventhouse](/fabric/real-time-intelligence/tutorial-1-resources) and set up your environment.
1. [Create an event stream](/fabric/real-time-intelligence/tutorial-2-get-real-time-events) and bring your data into a KQL database.
1. [Create a KQL queryset](/fabric/real-time-intelligence/tutorial-3-query-data) and query your data.
1. [Create a real-time dashboard](/fabric/real-time-intelligence/tutorial-4-create-dashboard) and explore your data visually.
1. [Build a Power BI report](/fabric/real-time-intelligence/tutorial-5-power-bi-report).
1. [Set an alert](/fabric/real-time-intelligence/tutorial-6-set-alert) on your event stream.

To learn more, navigate through the [Real-Time Intelligence support articles](/fabric/real-time-intelligence/).

## Related content
* [Real-Time Intelligence support articles](/fabric/real-time-intelligence/)
* [Real-Time Intelligence tutorials](/fabric/real-time-intelligence/tutorial-introduction)
