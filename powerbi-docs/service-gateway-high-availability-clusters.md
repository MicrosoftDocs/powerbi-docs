---
title: High availability clusters for on-premises data gateway
description: You can create clusters of on-premises data gateways to provide high availability for your enterprise.
services: powerbi
documentationcenter: ''
author: davidiseminger
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: powerbi
ms.date: 11/29/2017
ms.author: davidi

---
# High availability clusters for on-premises data gateway
You can create **high availability clusters** of **on-premises data gateway** installations, to ensure your organization can access on-premises data resources used in Power BI reports and dashboards. Such clusters allow gateway administrators to group gateways to avoid single points of failure in accessing on-premises data resources. This article describes the steps you can take to create a high availability cluster of on-premises data gateways, and shares best practices when setting them up. High availability gateway clusters require the November 2017 update to on-premises data gateway, or later.


## Setting up high availability clusters of gateways

During the **on-premises data gateway** installation process, you can specify whether the gateway should be added to an existing gateway cluster. 

![](media/service-gateway-high-availability-clusters/gateway_clusters_01.png)

In order to add a gateway to an existing cluster, you must provide the *Recovery key* for the primary gateway instance for the cluster you want the new gateway to join. The primary gateway for the cluster must be running the gateway update from November 2017 or later. 


## Managing a gateway cluster

Once a gateway cluster consists of two or more gateways, all gateway management operations, such as adding a data source or granting administrative permissions to a gateway, apply to all gateways that are part of the cluster. 

When administrators use the **Manage gateways** menu item, found under the gear icon in the **Power BI service**, they see the list of registered clusters or individual gateways, but do not see the individual gateway instances that are members of the cluster.

All new **Scheduled Refresh** requests and DirectQuery operations are automatically routed ot the primary instance of a given gateway cluster. If the primary gateway instance is not online, the request is routed to another gateway instance in the cluster.

## PowerShell support for gateway clusters

PowerShell scripts are available in the on-premises data gateway installation folder. By default, that folder is *C:\Program Files\On-premises data gateway*. The PowerShell scripts let users perform the following operations:

-   Retrieve the list of gateway clusters available for a user
-   Retrieve the list of gateway instances registered in a cluster, as well as their online or offline status
-   Modify the enable/disable status for a gateway instance within a cluster, as well as other gateway properties
-   Delete a gateway

The steps to run the PowerShell commands are the following:

1. Run a PowerShell command window as *Administrator*.
2. Execute the following one-time command:

(here)

| **Server version** | **Required SKU** |
| --- | --- |
| 2012 SP1 CU4 or later |Business Intelligence and Enterprise SKU |
| 2014 |Business Intelligence and Enterprise SKU |
| 2016 |Standard SKU or higher |

## Next steps

-   [Manage your data source - Analysis Services](service-gateway-enterprise-manage-ssas.md)  
-   [Manage your data source - SAP HANA](service-gateway-enterprise-manage-sap.md)  
-   [Manage your data source - SQL Server](service-gateway-enterprise-manage-sql.md)  
-   [Manage your data source - Oracle](service-gateway-onprem-manage-oracle.md)  
-   [Manage your data source - Import/Scheduled refresh](service-gateway-enterprise-manage-scheduled-refresh.md)  
-   [On-premises data gateway in-depth](service-gateway-onprem-indepth.md)  
-   [On-premises data gateway (personal mode)](service-gateway-personal-mode.md)
-   [Configuring proxy settings for the on-premises data gateway](service-gateway-proxy.md)  
-   [Use Kerberos for SSO (single sign-on) from Power BI to on-premises data sources](service-gateway-kerberos-for-sso-pbi-to-on-premises-data.md)  

More questions? [Try the Power BI Community](http://community.powerbi.com/)
