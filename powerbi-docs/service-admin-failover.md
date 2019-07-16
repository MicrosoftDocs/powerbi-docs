---
title: Power BI high availability, failover, and disaster recovery FAQ
description: Understand how the Power BI service delivers high availability and provides business continuity and disaster recovery to its users.
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 01/30/2019
ms.author: mblythe

LocalizationGroup: Administration
---

# Power BI high availability, failover, and disaster recovery FAQ

This article explains how the Power BI service delivers high availability and provides business continuity and disaster recovery to its users. After reading this article, you should have a better understanding of how high availability is achieved, under what circumstances Power BI performs a failover, and what to expect from the service when it fails over.

## What does "high availability" mean for Power BI?

Power BI is fully managed software as a service (SaaS).  Microsoft designs and operates it to be resilient to infrastructure failures so that users can always access their reports.  The service is supported by a [99.9% SLA](http://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=37).

## What is a Power BI failover?

Power BI maintains multiple instances of each component in Azure datacenters (also known as regions) to guarantee business continuity. If there is an outage, or an issue that causes Power BI to be inaccessible or inoperable in a region, Power BI fails all its components in that region to a backup instance. The failover restores availability and operability to the Power BI service instance in a new region (usually within the same geographic location, as noted in the [Microsoft Trust Center](https://www.microsoft.com/TrustCenter/CloudServices/business-application-platform/data-location)).

A failed-over Power BI service instance supports only _read operations_, which means the following operations aren't supported during failover: refreshes, report publish operations, dashboard or report modifications, and other operations that require changes to Power BI metadata (for example, inserting a comment in a report).  Read operations, such as displaying dashboards and displaying reports (that are not based on DirectQuery or Live Connect to on-premises data sources) continue to function normally.

## How are backup instances kept in sync with my data?

All Power BI service components regularly sync their backup instances. We target a 15-minute point-in-time sync for any content uploaded or changed in Power BI. In the event of a failover, Power BI uses [Azure storage geo-redundant replication](/azure/storage/common/storage-redundancy-grs) and [Azure SQL geo redundant replication](/azure/sql-database/sql-database-active-geo-replication) to guarantee backup instances exist in other regions and can be used in the case of a failover.

## Where are the failover clusters located?

Backup instances reside within the same geographic location (geo) that you selected when your organization signed up for Power BI, except where noted in the [Microsoft Trust Center](https://www.microsoft.com/TrustCenter/CloudServices/business-application-platform/data-location). A geo can contain several regions, and Microsoft may replicate data to any of the regions within a given geo for data resiliency. Microsoft will not replicate or move customer data outside the geo. For a mapping of the geos offered by Power BI and the regions within them, see the [Microsoft Trust Center](https://www.microsoft.com/TrustCenter/CloudServices/business-application-platform/data-location).

## How does Microsoft decide to failover?

There are two different systems that indicate when a failover might be required:

- Our external and internal monitoring probes indicate a lack of availability or inability to operate properly. Such indications can be based on outages detected in Power BI components or one or more of the services that Power BI depends on in a region.
- Microsoft Azure's central operations team informs us of a critical outage in a region.

In both cases, Power BI executive team members make the decision to fail over; the decision itself isn't automated. Once the decision is made, the process of failing over takes place automatically.

## How do I know Power BI is now in failover mode?

A notification is posted on the Power BI support page ([https://powerbi.microsoft.com/en-us/support/](https://powerbi.microsoft.com/en-us/support/)). The notification includes the major operations that are not available during the failover, including publish, refresh, create dashboard, duplicate dashboard, and permission changes.

## How long does it take Power BI to fail over?

Once a decision to fail over is made, it can take up to 60 minutes for a failover instance to become available.

## When does my Power BI instance return to the original region?

Power BI service instances return to their original region when the issue that caused the failover is resolved. Check the Power BI support page: When the issue is resolved, the Power BI team removes the notification that describes the failover. At that point, operations should be back to normal.

## Am I responsible for the availability of my Power BI solution?

If the Power BI solution used in your organization involves one of the following elements, you must take some measures to guarantee that the solution remains highly available:

- If your organization uses Power BI Premium, you must ensure that the Premium capacity is sized to meet the load demands of your deployment.  The [Power BI Premium Planning and Deployment whitepaper](https://aka.ms/Premium-Capacity-Planning-Deployment), and the  [Power BI Premium Capacity Metrics app](service-admin-premium-monitor-capacity.md) can help you to plan and meet this requirement. We regularly add new features to the metrics app and the admin portal in Power BI to help.
- If your organization accesses on-premises data sources using the on-premises data gateway, you must set the gateway up [as described in this article](/data-integration/gateway/service-gateway-high-availability-clusters) to support high availability. Follow this guidance whether you're refreshing reports in import mode, or you're accessing data or data models by using DirectQuery or Live Connect.

## Will gateways function when in failover mode?

No. Data required from on-premises data sources (any reports and dashboards based on Direct Query and Live Connect) will not work during a failover. The gateway configuration doesn't change though: When the Power BI instance returns to its original state, the gateways return to their normal functions.
