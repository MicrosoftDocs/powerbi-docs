---
title: Real-Time Intelligence sample experience
description: Describes the entry point from Power BI to the Real-Time Intelligence sample epxerience for identified customers.
author: YaelSchuster
ms.author: yaschust
ms.reviewer: tzgitlin
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: concept-article
ms.date: 09/19/2024
---
# Real-Time Intelligence sample experience

Power BI can be integrated with Real-Time Intelligence to provide enhanced performance for users who need high refresh rates or high volumes of data. This article describes the Real-Time Intelligence sample experience, which is an entry point from Power BI to Real-Time Intelligence.

:::image type="content" source="media/real-time-intelligence-sample-experience/architecture-scheme.png" alt-text="Schematic of Real-Time Intelligence architecture with sample items.":::

When integrated with Real-Time Intelligence, Power BI can use streaming data to provide up-to-the-minute insights. Real-Time Intelligence manages the ingestion, transformation, and storage of streaming data, and makes it available for analysis and visualization in Power BI. This integration provides a comprehensive and fully integrated solution for real-time data analysis and visualization for use cases with high volumes of data or high refresh rates.

## Create a sample experience

When your refresh rate is higher than a certain threshold, you see a bubble pop-up inviting you to try a sample experience in Real-Time Intelligence. Get started with Real-Time Intelligence and see how it can help you with your real-time data analysis and visualization needs.

Select **Try a sample** to start building a sample end-to-end solution in Real-Time Intelligence. The following components are created:

* Eventstream
* Eventhouse
* KQL Database
* KQL Queryset
* Real-Time Dashboard
* Power BI report

This solution is based on streaming sample data, to show you the ease and power of the solution in Real-Time Intelligence. Once the build is completed, a dialogue box opens with individual links to each of the sample items, which open in a new tab.

:::image type="content" source="media/real-time-intelligence-sample-experience/info-bubble.png" alt-text="Screenshot showing the information bubble that appears once the experience is built." lightbox="media/real-time-intelligence-sample-experience/info-bubble.png":::

* Select the name of an item to open it in Real-Time Intelligence.
* Select **Explore** to close the dialogue box and go to the KQL database window for the sample experience.

:::image type="content" source="media/real-time-intelligence-sample-experience/landing-page-refresh.png" alt-text="Screen shot of the landing page for the sample experience." lightbox="media/real-time-intelligence-sample-experience/landing-page-refresh.png":::

The histogram and tables in the main view pane update automatically as the data refreshes.

## Components of the Real-Time Intelligence solution

The components of the Real-Time Intelligence sample experience are:  

* **Eventstream** An event stream is the engine for data ingestion and processing of your real-time data into Microsoft Fabric. You can transform your data and route it via filters to various destinations. Read more about [event streams](/fabric/real-time-intelligence/event-streams/overview).

* **Eventhouse** An eventhouse is where data is stored and analyzed. An eventhouse is designed to handle real-time data streams efficiently. An eventhouse can hold one or more KQL databases. They're tailored to large volumes of time-based, streaming events with structured, semi structured, and unstructured data. Read more about [Eventhouse](/fabric/real-time-intelligence/eventhouse).

* **KQL Database** A KQL database is where data is stored and managed. It allows you to query data in real-time, providing a powerful tool for data exploration and analysis. The KQL database supports various data policies and transformations. Read more about [KQL databases](/fabric/real-time-intelligence/create-database).

* **KQL Queryset** A KQL queryset is used to run queries, view, and customize query results on data from a KQL database. Read more about [KQL queryset](/fabric/real-time-intelligence/create-query-set).

* **Real-Time Dashboard** A Real-Time dashboard provides an up-to-the-second snapshot of various metrics and data points in a collection of tiles. Each tile has an underlying query and a visual representation. It allows you to visualize data in real-time, providing insights and enabling data exploration. Read more about [Real-Time dashboards](/fabric/real-time-intelligence/dashboard-real-time-create).

* **Power BI** is used to create real-time reports that display data from event streams and KQL databases managed by Real-Time Intelligence.

## Create your own solution in Real-Time Intelligence

You can implement this solution with your own data. Before you begin, you need a [workspace](/fabric/get-started/create-workspaces) with a Microsoft Fabric-enabled [capacity](/fabric/enterprise/licenses#capacity).

To set up our own real-time dashboard, follow the [Real-Time Intelligence tutorials](/fabric/real-time-intelligence/tutorial-introduction). Here's a summary of the steps:

1. [Create an eventhouse](/fabric/real-time-intelligence/tutorial-1-resources) and set up your environment.
1. [Create an event stream](/fabric/real-time-intelligence/tutorial-2-get-real-time-events) and bring your data into a KQL database.
1. [Create a KQL queryset](/fabric/real-time-intelligence/tutorial-3-query-data) and query your data.
1. [Create a real-time dashboard](/fabric/real-time-intelligence/tutorial-4-create-dashboard) and explore your data visually.
1. [Build a Power BI report](/fabric/real-time-intelligence/tutorial-5-power-bi-report).
1. [Set an alert](/fabric/real-time-intelligence/tutorial-6-set-alert) on your event stream.

## Learn more about Real-Time Intelligence

Real-Time Intelligence is a powerful service in the Fabric product suite that can help you extract insights and visualize your data in motion. It offers an end-to-end solution for event-driven scenarios, streaming data, and data logs.  

Learn more about [Real-Time Intelligence](/fabric/real-time-intelligence/).

## Related content

* [Real-Time Intelligence documentation](/fabric/real-time-intelligence/)
* [Real-Time Intelligence end to end tutorial](/fabric/real-time-intelligence/tutorial-introduction)
