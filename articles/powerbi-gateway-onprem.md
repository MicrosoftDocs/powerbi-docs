<properties
pageTitle="On-premises data gateway"
description="This is an overview of the On-premises data gateway for Power BI. You can use this gateway to work with DirectQuery data sources. You can also use this gateway to refresh cloud datasets with on-premises data."
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
# On-premises data gateway

The on-premises data gateway acts as a bridge, providing quick and secure data transfer between on-premises data (data that is not in the cloud) and the Power BI, Microsoft Flow, Logic Apps, and PowerApps services.

You can use a single gateway with different services at the same time. If you are using Power BI, as well as PowerApps, a single gateway and be used for both. It is dependent on the account you sign in with.

<!-- Shared Requirements Include -->
[AZURE.INCLUDE [gateway-onprem-requirements-include](../includes/gateway-onprem-requirements-include.md)]

### Limitations of Analysis Services live connections

You can use a live connection against tabular or multidimensional instances.

|**Server version**|**Required SKU**|
|---|---|
|2012 SP1 CU4 or later|Business Intelligence and Enterprise SKU|
|2014|Business Intelligence and Enterprise SKU|
|2016|Standard SKU or higher|

- Cell level Formatting and translation features are not supported.
- Actions and Named Sets are not exposed to Power BI, but you can still connect to multidimensional cubes that also contain Actions or Named sets and create visuals and reports.

## List of available data source types

|**Data source**|**Live/DirectQuery**|**User configured manual or scheduled refresh**|
|---|---|---|---|
|Analysis Services Tabular|Yes|Yes|
|Analysis Services Multidimensional|Yes|Yes|
|SQL Server|Yes|Yes|
|SAP HANA|Yes|Yes|
|Oracle|Yes|Yes|
|Teradata|Yes|Yes|
|File|No|Yes|
|Folder|No|Yes|
|SharePoint list (on-premises)|No|Yes|
|Web|No|Yes|
|OData|No|Yes|
|IBM DB2|No|Yes|
|MySQL|No|Yes|
|Sybase|No|Yes|
|SAP BW|No|Yes|
 
## Download and install the On-premises data gateway

To download the gateway, select **Power BI Gateways** under the Downloads menu. Download the [On-premises data gateway](https://go.microsoft.com/fwlink/?LinkId=698863).

<!--image place holder-->

<!-- Shared Install steps Include -->
[AZURE.INCLUDE [gateway-onprem-install-include](../includes/gateway-onprem-install-include.md)]

## Install the gateway in personal mode 

> **Note:** Personal will only work with Power BI.

During the installation, you will need to sign in to Power BI to register the gateway with the Power BI service.

<!--image place holder-->

You will also need to supply the windows user name and password that the windows service will run as. You can specify a different Windows account from your own. The gateway service will run using this account.

<!--image place holder-->

After the installation is complete, you will need to go to your datasets within Power BI and make sure credentials are entered for your on-premises data sources.

## Sign in account

Users will sign in with either a work or school account. This is your organization account. If you signed up for an Office 365 offering and didn’t supply your actual work email, it may look like nancy@contoso.onmicrosoft.com. Your account, within a cloud service, is stored within a tenant in Azure Active Directory (AAD). In most cases, your AAD account’s UPN will match the email address.

## Windows Service account

The on-premises data gateway is configured to use *NT SERVICE\PBIEgwService* for the windows service logon credential. By default, it has the right of Log on as a service. This is in the context of the machine that you are installing the gateway on. 

> **Note:** If you selected personal mode, you configure the windows service account separately.

This is not the account used to connect to on-premises data sources.  This is also not your work or school account that you sign into cloud services with.

## Ports

The gateway creates an outbound connection to Azure Service Bus. It communicates on outbound ports: TCP 443 (default), 5671, 5672, 9350 thru 9354.  The gateway does not require inbound ports. [Learn more](https://azure.microsoft.com/documentation/articles/service-bus-fundamentals-hybrid-solutions/)

|Domain names|Outbound ports|Description|
|---|---|---|
|*.analysis.windows.net|443|HTTPS|
|*.login.windows.net|443|HTTPS|
|*.servicebus.windows.net|5671-5672|Advanced Message Queuing Protocol (AMQP)|
|*.servicebus.windows.net|443, 9350-9354|Listeners on Service Bus Relay over TCP (requires 443 for Access Control token acquisition)|
|*.frontend.clouddatahub.net|443|HTTPS|
|*.core.windows.net|443|HTTPS|
|login.microsoftonline.com|443|HTTPS|
|*.msftncsi.com|443|Used to test internet connectivity if the gateway is unreachable by the Power BI service.|

If you need to white list IP addresses instead of the domains, you can download and use the Microsoft Azure Datacenter IP ranges list. In some cases, the Azure Service Bus connections will be made with IP Address instead of the fully qualified domain names. [Download](https://www.microsoft.com/download/details.aspx?id=41653)

## High Availability

High availability options are in the roadmap for the gateway. Stay tuned for more updates.

## How to restart the gateway

The gateway runs as a windows service. You can start and stop it like any windows service. There are multiple ways to do this. Here is how you can do it from the command prompt.

1.	On the machine where the gateway is running, launch an admin command prompt.

2.	Use the following command to stop the service.

    net stop PBIEgwService 

3.	Use the following command to start the service.

    net start PBIEgwService

## How the gateway works 

Let’s first look at what happens when a user interacts with an element  connected to an on-premises data source. 

> **Note:** For Power BI, you will need to configure a data source for the gateway.

1.	A query will be created by the cloud service, along with the encrypted credentials for the on-premises data source, and sent to the queue for the gateway to process.

2.	The service will analyze the query and will push the request to the [Azure Service Bus](https://azure.microsoft.com/documentation/services/service-bus/).

3.	The on-premises data gateway polls the [Azure Service Bus](https://azure.microsoft.com/documentation/services/service-bus/) for pending requests.

4.	The gateway gets the query, decrypts the credentials and connects to the data source(s) with those credentials.

5.	The gateway sends the query to the data source for execution.

6.	The results are sent from the data source, back to the gateway, and then onto the cloud service. The service then uses the results.

## Troubleshooting

If you’re having trouble when installing and configuring a gateway, be sure to see [Troubleshooting the Power BI Gateway - Enterprise](powerbi-gateway-enterprise-tshoot.md). If you think you are having an issue with your firewall, see the [firewall or proxy](powerbi-gateway-enterprise-tshoot.md#firewall-or-proxy) section in the troubleshooting article.

If you think you are encountering proxy issues, with the gateway, see [Configuring proxy settings for the Power BI Gateways](powerbi-gateway-proxy.md).

## See also

[Manage your enterprise data source - Analysis Services](powerbi-gateway-enterprise-manage-ssas.md)

[Manage your enterprise data source - SAP HANA](powerbi-gateway-enterprise-manage-sap.md)

[Manage your enterprise data source - SQL Server](powerbi-gateway-enterprise-manage-sql.md)

[Manage your enterprise data source - Import/Scheduled refresh](powerbi-gateway-enterprise-manage-scheduled-refresh.md)

[On-premises Data Gateway in-depth](powerbi-gateway-onprem-indepth.md)

[Troubleshooting the On-premises Data Gateway](powerbi-gateway-onprem-tshoot.md)

[Configuring proxy settings for the On-Premises Data Gateway](powerbi-gateway-proxy.md)
