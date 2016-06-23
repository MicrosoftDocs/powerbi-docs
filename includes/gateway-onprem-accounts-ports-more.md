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