---
title: "What is Power BI? What is Fabric?"
description: "This overview describes two Microsoft products and how they work together. The two products are Microsoft Fabric and Microsoft Power BI."
author: mihart
ms.author: mihart
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: overview  
ms.date: 07/29/2024
# customer intent: As a Power BI user, I want an understanding of Microsoft Fabric and how it relates to the Power BI service so that I know how to use these two services separately or together.
---

# What is Microsoft Fabric for Power BI service users?

If you're a Power BI user, you probably have questions about the introduction of [Microsoft Fabric](/fabric/get-started/microsoft-fabric-overview).

- Are these two different tools? 
- Do I have to migrate from Power BI to Fabric? 
- Is Fabric complicated?
- How do I buy Fabric? 
- How do I log in?

This article answers your questions and helps you understand how these two tools work together. We start with a basic overview of both Fabric and the Power BI service. With an understanding of each service, we then look at what it means to *move* from using the Power BI service to using Fabric. *Moving* includes a discussion of licenses and capacities. The article wraps up with a discussion of the overlap between the two services.

[Open Microsoft Fabric](https://app.fabric.microsoft.com)

## Power BI as a standalone service

The Microsoft Power BI service started as a standalone Software as a service (SaaS) offering for combining, exploring, and visualizing your data. That same Power BI service is now a component of Microsoft Fabric. You can continue to use Power BI by itself, if that's what you need. And you can use the new capabilities of Fabric with Power BI to do even more with your data.

## A brief overview of the Power BI service

Power BI is a business intelligence platform for visualizing your data and using that data to discover insights and make business decisions. Power BI simplifies data analysis and decentralizes BI. *Creators* ingest, integrate, combine, and model data. When that data is shared with *consumers*, those consumers use the visualizations to make business decisions, track key metrics, and dig into the data to discover other business insights. 

To learn more about Power BI, read [What is Power BI](power-bi-overview.md).

## A brief overview of Fabric

Fabric is an all-in-one data analytics solution that covers everything from data movement to data science, real-time analytics, and business intelligence. Fabric consolidates several Azure data workloads with Power BI so that you and your colleagues can all work with different workloads, and in different roles, in the same environment. With Fabric, you can go from raw fragmented data to meaningful insights across your organization and in other clouds in seconds.  

The data for all of these workloads is consolidated in a multicloud data lake called OneLake. Each Fabric tenant has one OneLake, and all Fabric services work natively with data in OneLake. This one copy of the data can be used across all of Fabric. This centralized storage eliminates duplication, maintains a single data source, simplifies data discovery, and enforces security and data protection. The data is saved in a way that makes is accessible to the different workloads in the necessary format.  

 AI capabilities are seamlessly embedded within Fabric, eliminating the need for manual integration. With Fabric, you can easily transition your raw data into actionable insights.

To learn more about Fabric, read [What is Power BI](/fabric/get-started/microsoft-fabric-overview).

## How do I migrate from Power BI to Fabric?

If you're already using the Power BI service, you now also have Fabric and all of its extra workloads and capabilities. There's nothing to migrate from Power BI to Fabric. All of your Power BI content is available in Fabric. Your workspaces are still there. Your reports are still in your workspaces. The user interface for Power BI is unchanged. The same capabilities are there. Use Power BI the same way in Fabric as you did when it was a standalone service. 

Start to explore Fabric. For Azure services users, Fabric should feel familiar. Azure services, like Azure Data factory and Azure Data explorer, were added to the Fabric SaaS platform.

For existing Power BI users, Fabric should feel familiar too. Fabric uses the Power BI foundation, user interface, and navigation. Fabric and Power BI share many concepts as well, like workspaces, reports, and capacities. And administration of both services takes place in the Fabric admin center. 

## What about licenses?

If you have a Power BI or Microsoft 365 account, you can sign in to Fabric. For new users, create your first item in Fabric, and Fabric auto enrolls you in a free trial. The only license you need for all of Fabric is a Fabric (Free) license. If your organization doesn't yet have a Fabric capacity, [sign up for a free trial capacity](/fabric/get-started/fabric-trial) as well. Fabric is yours to explore at no cost. And, signing up takes only a few clicks.  

> [!NOTE]
> Some features of Power BI require a paid license.  

## How Microsoft Fabric works with Power BI

Microsoft Fabric is an offering that combines data, roles, and workloads in a unified environment. **Power BI** is an example of one of the *workloads* integrated with Microsoft Fabric. Each Fabric tenant has a single data store called **OneLake**. OneLake data can be used, analyzed, or visualized across all workloads and roles, making it easier to perform analysis and analytics on multiple sets of data. Large organizations find Microsoft Fabric useful, since it can corral large sets of data and store it in a way that makes it available to all of the Fabric workloads, including Power BI.

Microsoft Fabric now handles administration of Power BI. But your favorite tools like the **Power BI service** and **Power BI Desktop** still operate like they always have - as a service that can turn your data, whether in OneLake or in Excel, into powerful business intelligence insights.

## Related content

- [What is Power BI](power-bi-overview.md)
- [What is Microsoft Fabric](/fabric/get-started/microsoft-fabric-overview)
- [Start a trial of a Fabric capacity and license](/fabric/get-started/fabric-trial)