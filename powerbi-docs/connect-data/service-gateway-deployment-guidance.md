---
title: Guidance for deploying a data gateway for the Power BI service
description: Learn best practices and considerations for deploying a gateway for the Power BI service in your network environment.
author: arthiriyer
ms.author: arthii
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: conceptual
ms.date: 05/23/2024
LocalizationGroup: Gateways
---

# Guidance for deploying a data gateway for the Power BI service

[!INCLUDE [gateway-rewrite](../includes/gateway-rewrite.md)]

This article provides guidance and considerations for deploying a data gateway for the Power BI service in your network environment.

For information about how to download, install, configure, and manage the on-premises data gateway, see [What is an on-premises data gateway?](/data-integration/gateway/service-gateway-onprem). You can also find out more about the on-premises data gateway and Power BI by visiting the [Microsoft Power BI blog](https://powerbi.microsoft.com/blog/) and the [Microsoft Power BI Community](https://community.powerbi.com/) site.

## Installation considerations for the on-premises data gateway

Before you install the on-premises data gateway for your Power BI cloud service, there are some considerations to keep in mind. The following sections describe these considerations.

### Number of users

The number of users who consume a report that uses the gateway is an important metric in your decision about where to install the gateway. Here are some questions to consider:

* Do users use these reports at different times of the day?
* What types of connections do they use: DirectQuery or Import?
* Do all users use the same report?

If all the users access a given report at the same time each day, make sure that you install the gateway on a machine that's capable of handling all those requests. See the following sections for performance counters and minimum requirements that can help you determine whether a machine is adequate.

A constraint in the Power BI service allows only *one* gateway per *report*. Even if a report is based on multiple data sources, all such data sources must go through a single gateway. If a dashboard is based on *multiple* reports, you can use a dedicated gateway for each contributing report. In this way, you distribute the gateway load among the multiple reports that contribute to the single dashboard.

### Connection type

The Power BI service offers two types of connections: DirectQuery and Import. Not all data sources support both connection types. Many factors might contribute to your choice of one over the other, such as security requirements, performance, data limits, and data model sizes. To learn more about connection types and supported data sources, see the [list of available data source types](service-gateway-data-sources.md#list-of-available-data-source-types).

Depending on which type of connection is used, gateway usage can be different. For example, try to separate DirectQuery data sources from scheduled refresh data sources whenever possible. The assumption is that they're in different reports and can be separated. Separating sources prevents the gateway from having thousands of DirectQuery requests queued up at the same time as the morning's scheduled refresh of a large-size data model that's used for the company's main dashboard.

Here's what to consider for each option:

* **Scheduled refresh**: Depending on your query size and the number of refreshes that occur per day, you can choose to stay with the recommended minimum hardware requirements or upgrade to a higher performance machine. If a given query isn't folded, transformations occur on the gateway machine. As a result, the gateway machine benefits from having more available RAM.

* **DirectQuery**: A query is sent each time any user opens the report or looks at data. If you expect more than 1,000 users to access the data concurrently, make sure your computer has robust and capable hardware components. More CPU cores result in better throughput for a DirectQuery connection.

For the machine installation requirements, see the on-premises data gateway [installation requirements](/data-integration/gateway/service-gateway-install#requirements).

### Location

The location of the gateway installation can have significant effect on your query performance. Try to make sure that your gateway, data source locations, and the Power BI tenant are as close as possible to each other to minimize network latency. To determine your Power BI tenant location, in the Power BI service select the question mark (**?**) icon in the upper-right corner. Then select **About Power BI**.

![Screenshot shows the question mark where you can determine your Power BI tenant location.](media/service-gateway-deployment-guidance/powerbi-gateway-deployment-guidance-02.png)

If you intend to use the Power BI service gateway with Azure Analysis Services, be sure that the data regions in both match.

### Optimizing performance

By default, the gateway spools data before returning it to the dataset, potentially causing slower performance during data load and refresh operations. The default behavior can be overridden.

1. In the *C:\Program Files\On-Premises data gateway\\**Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config*** file, set the `StreamBeforeRequestCompletes` property to `True`, and then save.

    ```json
    <setting name="StreamBeforeRequestCompletes" serializeAs="String">
       <value>True</value>
    </setting>
    ```

1. In **On-premises data gateway** > **Service Settings**, restart the gateway.

If installing the gateway on an Azure Virtual Machine, ensure optimal networking performance by configuring accelerated networking. To learn more, see [Create a Windows VM with accelerated networking](/azure/virtual-network/create-vm-accelerated-networking-powershell).

## Related content

* [Configure proxy settings](/data-integration/gateway/service-gateway-proxy)  
* [Troubleshoot gateways - Power BI](service-gateway-onprem-tshoot.md)  
* [On-premises data gateway FAQ - Power BI](service-gateway-power-bi-faq.yml)  

More questions? Try the [Power BI Community](https://community.powerbi.com/).
