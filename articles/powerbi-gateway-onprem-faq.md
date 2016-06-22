<properties
pageTitle="On-premises data gateway FAQ"
description="This is the on-premises data gateway FAQ. This collects frequently asked questions into one spot for the gateway."
services="powerbi"
documentationCenter=""
authors="guyinacube"
manager="mblythe"
backup=""
editor=""
tags=""
qualityFocus="no"
qualityDate=""/>

<tags
ms.service="powerbi"
ms.devlang="NA"
ms.topic="article"
ms.tgt_pltfrm="na"
ms.workload="powerbi"
ms.date="06/22/2016"
ms.author="asaxton"/>
# On-Premises Data Gateway FAQ

## General

**Question:** What is the actual windows service called?  
**Answer:** The gateway is called Power BI Enterprise Gateway Service in Services

**Question:** What are the requirements for the gateway?  
**Answer:** Take a look at the requirements section of the main [gateway article](powerbi-gateway-onprem.md).

**Question:** What data sources are supported with the gateway?  
**Answer:** See the data sources table in the main [gateway article](powerbi-gateway-onprem.md).

**Question:** Do I need a gateway for cloud data sources like Azure SQL Database?  
**Answer:** No! The service will be able to connect to that data source without a gateway.

**Question:** Are there any inbound connections to the gateway from the cloud?  
**Answer:** No. The gateway uses outbound connections to Azure Service Bus.

**Question:** What if I block outbound connections? What do I need to open?  
**Answer:** See the [list of ports](powerbi-gateway-onprem.md#ports) and hosts that the gateway uses.

**Question:** Where are my credentials stored?  
**Answer:** The credentials you enter for a data source are stored encrypted in the gateway cloud service. The credentials are decrypted at the gateway on-premises. For information you can look at the [security whitepaper](powerbi-admin-power-bi-security.md).  

**Question:** Does the gateway have to be installed on the same machine as the data source?  
**Answer:** No. The gateway will connect to the data source using the connection information that was provided. Think of the gateway as a client application in this sense. It will just need to be able to connect to the server name that was provided.

**Question:** What is the latency for running queries to a data source from the gateway? What is the best architecture?  
**Answer:** It is recommended to have the gateway as close to the data source as possible to avoid network latency. If you can install the gateway on the actual data source, it will minimize the latency introduced. Consider the data centers as well. For example, if your service is making use of the West US data center, and you have SQL Server hosted in an Azure VM, you will want to have the Azure VM in West US as well. This will minimize latency and avoid egress charges on the Azure VM.

**Question:** Are there any requirements for network bandwidth?  
**Answer:** It is recommended to have good throughput for your network connection. Every environment is different and this is also dependent on the amount of data being sent. Using ExpressRoute could help to guarantee a level of throughput between on-premises and the Azure data centers.

You can use the 3rd party [Azure Speed Test app](http://azurespeedtest.azurewebsites.net/) to help gauge what your throughput is. 

**Question:** Can the gateway windows service run with an Azure Active Directory account?  
**Answer:** No. The windows service needs to have a valid windows account. By default it will run with the Service SID, *NT SERVICE\PBIEgwService*.

**Question:** How are results sent back to the cloud?  
**Answer:** This is done by way of the Azure Service Bus. For more information, see [how it works](powerbi-gateway-onprem.md#how-the-gateway-works).

## High Availability/Disaster Recovery

**Question:** Are there any plans for enabling high availability scenarios with the gateway?  
**Answer:** Yes. This is on the roadmap, but we don’t have a timeline yet.

**Question:** What options are available for disaster recovery?  
**Answer:** You can use the recovery key to restore or move a gateway. When you install the gateway, supply the recovery key.

**Question:** What is the benefit of the recovery key?  
**Answer:** It provides a way to migrate or recover your gateway settings. This is also used for disaster recovery.

## Analysis Services (Power BI Only)

**Question:** Can I use msdmpump.dll to create custom effective username mappings for Analysis Services?  
**Answer:** No. This is not supported at this time.

**Question:** Can I use the gateway to connect to a multidimensional (OLAP) instance.  
**Answer:** Yes! The enterprise gateway supports live connections to both Analysis Services Tabular and Multidimensional models.

**Question:** What if I install the gateway on a computer in a different domain from my on-premises server that uses Windows authentication?  
**Answer:** No guarantees here. It all depends on the trust relationship between the two domains. If the two different domains are in a trusted domain model, then the gateway might be able to connect to the Analysis Services server and the effective user name can be resolved. If not, you may encounter a login failure. 

**Question:** How can I find out what effective username is being passed to my on-premises Analysis Services server?  
**Answer:** We answer this in the [troubleshooting article](powerbi-gateway-onprem-tshoot.md).

**Question:** I have 25 databases in Analysis Services, is there a way to have them all enabled for the gateway at once?  
**Answer:** No. This is on the roadmap, but we don’t have a timeframe.

## Administration (Power BI Only)

**Question:** Can I have more than one admin for a gateway?  
**Answer:** Yes! When you manage a gateway, you can go to the administrator’s tab to add additional admins.

**Question:** Does the gateway admin need to be an admin on the machine where the gateway is installed?  
**Answer:** No. The gateway admin is used to manage the gateway from within the service. 

**Question:** Can I prevent users in my organization from creating a gateway?  
**Answer:** No. This is on the roadmap, but we don’t have a timeframe.

**Question:** Can I get usage and statistics information of the gateways in my organization?  
**Answer:** No. This is on the roadmap, but we don’t have a timeframe.

## Troubleshooting

**Question:** Where are the gateway logs located?  
**Answer:** See the tools section of the [troubleshooting article](powerbi-gateway-onprem-tshoot.md#tools).

**Question:** How can I see what queries are being sent to the on-premises data source?  
**Answer:** You can increase the trace level to 5.  This will include the queries being sent. Remember to change it back to the original value when done troubleshooting. Having a level of 5 will cause the logs to be larger.

You can also look at tools your data source has for tracing queries. For example, for SQL Server and Analysis Services you can use Extended Events or SQL Profiler.

## Power BI

**Question:** How often are tiles in a dashboard, in Power BI, refreshed when connected through the enterprise gateway?  
**Answer:** About ten minutes. DirectQuery connections are just that. This doesn’t mean that a tile issues a query to your on-premises server, and shows new data, every ten minutes.

**Question:** Can I upload Excel workbooks with Power Pivot data models that connect to on-premises data sources? Do I need a gateway for this scenario?  
**Answer:** Yes, you can upload the workbook. And, no, you don’t need a gateway. But, because the data will reside in the Excel data model, reports in Power BI based on the Excel workbook will not be live. In order to refresh reports in Power BI, you’d have to re-upload an updated workbook each time. Or, use the gateway with scheduled refresh.

**Question:** If users share dashboards that has a DirectQuery connection, will those other users be able to see the data even though they might not have the same permissions.  
**Answer:** For a dashboard connected to Analysis Services, users will only see the data they have access to. If the users do not have the same permissions, they will not be able to see any data. For other data sources, all users will share the credentials entered by the admin for that data source.

**Question:** Is a Pro license required to use the gateway?  
**Answer:** Yes.

**Question:** Is a Pro license required for users when interacting with a dashboard or report that makes use of the gateway?  
**Answer:** Yes.

## See also
[On-premises data gateway](powerbi-gateway-onprem.md)

[On-premises data gateway in-depth](powerbi-gateway-onprem-indepth.md)

[Troubleshooting the On-premises Data Gateway](powerbi-gateway-onprem-tshoot.md)