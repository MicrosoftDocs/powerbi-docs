## General
**Question:** What is the actual Windows service called?  
**Answer:** The gateway is called On-premises data gateway service in Services

**Question:** What are the requirements for the gateway?  
**Answer:** Take a look at the requirements section of the main [gateway article](../service-gateway-onprem.md).

**Question:** What data sources are supported with the gateway?  
**Answer:** See the data sources table in the main [gateway article](../service-gateway-onprem.md).

**Question:** Do I need a gateway for cloud data sources like Azure SQL Database?  
**Answer:** No! The service will be able to connect to that data source without a gateway.

**Question:** Are there any inbound connections to the gateway from the cloud?  
**Answer:** No. The gateway uses outbound connections to Azure Service Bus.

**Question:** What if I block outbound connections? What do I need to open?  
**Answer:** See the [list of ports](../service-gateway-onprem.md#ports) and hosts that the gateway uses.

**Question:** Does the gateway have to be installed on the same machine as the data source?  
**Answer:** No. The gateway will connect to the data source using the connection information that was provided. Think of the gateway as a client application in this sense. It will just need to be able to connect to the server name that was provided.

**Question:** What is the latency for running queries to a data source from the gateway? What is the best architecture?  
**Answer:** It is recommended to have the gateway as close to the data source as possible to avoid network latency. If you can install the gateway on the actual data source, it will minimize the latency introduced. Consider the data centers as well. For example, if your service is making use of the West US data center, and you have SQL Server hosted in an Azure VM, you will want to have the Azure VM in West US as well. This will minimize latency and avoid egress charges on the Azure VM.

**Question:** Are there any requirements for network bandwidth?  
**Answer:** It is recommended to have good throughput for your network connection. Every environment is different and this is also dependent on the amount of data being sent. Using ExpressRoute could help to guarantee a level of throughput between on-premises and the Azure data centers.

You can use the 3rd party [Azure Speed Test app](http://azurespeedtest.azurewebsites.net/) to help gauge what your throughput is.

**Question:** Can the gateway Windows service run with an Azure Active Directory account?  
**Answer:** No. The Windows service needs to have a valid Windows account. By default it will run with the Service SID, *NT SERVICE\PBIEgwService*.

**Question:** How are results sent back to the cloud?  
**Answer:** This is done by way of the Azure Service Bus. For more information, see [how it works](../service-gateway-onprem.md#how-the-gateway-works).

**Question:** Where are my credentials stored?  
**Answer:** The credentials you enter for a data source are stored encrypted in the gateway cloud service. The credentials are decrypted at the gateway on-premises.

**Question:** Can I place the gateway in a perimeter network (also known as DMZ, demilitarized zone, and screened subnet)?  
**Answer:** The gateway requires connectivity to the data source. If the data source is not accessible in your perimeter network, the gateway may not be able to connect to it. For example, your SQL Server may not be in your perimeter network. And, you cannot connect to your SQL Server from the perimeter network. If you placed the gateway in your perimeter network, it would not be able to reach the SQL Server.

**Question:** Is it possible to force the gateway to use HTTPS traffic with Azure Service Bus instead of TCP?  
**Answer:** Yes. Although, this will greatly reduce performance. You will want to modify the *Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config* file. You will want to change the value from `AutoDetect` to `Https`. This file is located, by default, at *C:\Program Files\On-premises data gateway*.

**Question:** Do I need to whitelist the Azure Datacenter IP list? Where do I get the list?  
**Answer:** If you are blocking outbound IP traffic, you may need to whitelist the Azure Datacenter IP list. Currently, the gateway will communicate with Azure Service Bus using the IP address in addition to the fully qualified domain name. The Azure Datacenter IP list is updated weekly. You can download the [Microsoft Azure Datacenter IP list](https://www.microsoft.com/download/details.aspx?id=41653).

```xml
<setting name="ServiceBusSystemConnectivityModeString" serializeAs="String">
    <value>Https</value>
</setting>
```

## High Availability/Disaster Recovery
**Question:** Are there any plans for enabling high availability scenarios with the gateway?  
**Answer:** Yes, this is an area of active investment for the Power BI team. Please stay tuned to the [Power BI blog](https://powerbi.microsoft.com/blog/) for further updates about this feature.

**Question:** What options are available for disaster recovery?  
**Answer:** You can use the recovery key to restore or move a gateway. When you install the gateway, supply the recovery key.

**Question:** What is the benefit of the recovery key?  
**Answer:** It provides a way to migrate or recover your gateway settings. This is also used for disaster recovery.

## Troubleshooting
**Question:** Where are the gateway logs located?  
**Answer:** See the tools section of the [troubleshooting article](../service-gateway-onprem-tshoot.md#tools-for-troubleshooting).

**Question:** How can I see what queries are being sent to the on-premises data source?  
**Answer:** You can enable query tracing.  This will include the queries being sent. Remember to change it back to the original value when done troubleshooting. Having query tracing enabled will cause the logs to be larger.

You can also look at tools your data source has for tracing queries. For example, for SQL Server and Analysis Services you can use Extended Events or SQL Profiler.

