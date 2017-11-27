## Sign in account
Users will sign in with either a work or school account. This is your organization account. If you signed up for an Office 365 offering and didn’t supply your actual work email, it may look like nancy@contoso.onmicrosoft.com. Your account, within a cloud service, is stored within a tenant in Azure Active Directory (AAD). In most cases, your AAD account’s UPN will match the email address.

## Windows Service account
The on-premises data gateway is configured to use *NT SERVICE\PBIEgwService* for the Windows service logon credential. By default, it has the right of Log on as a service. This is in the context of the machine that you are installing the gateway on.

> [!NOTE]
> If you selected personal mode, you configure the Windows service account separately.
> 
> 

This is not the account used to connect to on-premises data sources.  This is also not your work or school account that you sign into cloud services with.

If you encounter issues with your proxy server, due to authentication, you may want to change the Windows service account to a domain user or managed service account. You can learn how to change the account in [proxy configuration](../service-gateway-proxy.md#changing-the-gateway-service-account-to-a-domain-user).

## Ports
The gateway creates an outbound connection to Azure Service Bus. It communicates on outbound ports: TCP 443 (default), 5671, 5672, 9350 thru 9354.  The gateway does not require inbound ports. [Learn more](https://azure.microsoft.com/documentation/articles/service-bus-fundamentals-hybrid-solutions/)

It is recommended that you whitelist the IP addresses, for your data region, in your firewall. You can download the [Microsoft Azure Datacenter IP list](https://www.microsoft.com/download/details.aspx?id=41653). This list is updated weekly. The gateway will communicate with Azure Service Bus using the IP address along with the fully qualified domain name (FQDN). If you are forcing the gateway to communicate using HTTPS it will strictly use FQDN only, and no communication will happen using IP addresses.

> [!NOTE]
> The IP Addresses listed in the Azure Datacenter IP list are in CIDR notation. For example, 10.0.0.0/24 does not mean 10.0.0.0 thru 10.0.0.24. Learn more about the [CIDR notation](http://whatismyipaddress.com/cidr).
> 
> 

Here is a listing of the fully qualified domain names used by the gateway.

| Domain names | Outbound ports | Description |
| --- | --- | --- |
| *.download.microsoft.com |80 |HTTP used to download the installer. |
| *.powerbi.com |443 |HTTPS |
| *.analysis.windows.net |443 |HTTPS |
| *.login.windows.net |443 |HTTPS |
| *.servicebus.windows.net |5671-5672 |Advanced Message Queuing Protocol (AMQP) |
| *.servicebus.windows.net |443, 9350-9354 |Listeners on Service Bus Relay over TCP (requires 443 for Access Control token acquisition) |
| *.frontend.clouddatahub.net |443 |HTTPS |
| *.core.windows.net |443 |HTTPS |
| login.microsoftonline.com |443 |HTTPS |
| *.msftncsi.com |443 |Used to test internet connectivity if the gateway is unreachable by the Power BI service. |
| *.microsoftonline-p.com |443 |Used for authentication depending on configuration. |

> [!NOTE]
> Traffic going to visualstudio.com or visualstudioonline.com are for app insights and are not required for the gateway to function.
> 
> 

## Forcing HTTPS communication with Azure Service Bus
You can force the Gateway to communicate with Azure Service Bus using HTTPS instead of direct TCP. This may have an impact on performance. To do so, modify the *Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config* file by changing the value from `AutoDetect` to `Https`, as shown in the code snippet directly following this paragraph. That file is located (by default) at *C:\Program Files\On-premises data gateway*.

```
<setting name="ServiceBusSystemConnectivityModeString" serializeAs="String">
    <value>Https</value>
</setting>
```

The value for the *ServiceBusSystemConnectivityModeString* parameter is case sensitive. Valid values are *AutoDetect* and *Https*.

Alternatively, you can force the Gateway to adopt this behavior using the Gateway user interface, beginning with the [March 2017](https://powerbi.microsoft.com/blog/power-bi-gateways-march-update/) release. In the Gateway user interface select **Network**, then toggle the **Azure Service Bus connectivity mode** to **On**.

![](./media/gateway-onprem-accounts-ports-more/gw-onprem_01.png)

Once changed, when you select **Apply** (a button that only appears when you make a change), the *gateway Windows service* restarts automatically, so the change can take effect.

For future reference, you can restart the *gateway Windows service* from the user interface dialog by selecting **Service Settings** then select *Restart Now*.

![](./media/gateway-onprem-accounts-ports-more/gw-onprem_02.png)

## Support for TLS 1.1/1.2
With the August 2017 update and beyond, the on-premises data gateway uses Transport Layer Security (TLS) 1.1 or 1.2 to communicate with the **Power BI service** by default. Previous versions of the on-premises data gateway use TLS 1.0 by default. On January 15th 2018, support for TLS 1.0 will end, including the gateway's ability to interact with the **Power BI service** using TLS 1.0, so by then you must upgrade your on-premises data gateway installations to the August 2017 release or newer to ensure your gateways continue to operate.

It's important to note that TLS 1.0 is still supported by the on-premises data gateway prior to November 1st, and is used by the gateway as a fallback mechanism. To ensure all gateway traffic uses TLS 1.1 or 1.2 (and to prevent the use of TLS 1.0 on your gateway), you must add or modify the following registry keys on the machine running the gateway service:

        [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\v4.0.30319]"SchUseStrongCrypto"=dword:00000001
        [HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v4.0.30319]"SchUseStrongCrypto"=dword:00000001

> [!NOTE]
> Adding or modifying these registry keys applies the change to all .NET applications. For information about registry changes that affect TLS for other applications, see [Transport Layer Security (TLS) registry settings](https://docs.microsoft.com/windows-server/security/tls/tls-registry-settings).
> 
> 

## How to restart the gateway
The gateway runs as a windows service. You can start and stop it like any windows service. There are multiple ways to do this. Here is how you can do it from the command prompt.

1. On the machine where the gateway is running, launch an admin command prompt.
2. Use the following command to stop the service.
   
   net stop PBIEgwService
3. Use the following command to start the service.
   
   net start PBIEgwService

