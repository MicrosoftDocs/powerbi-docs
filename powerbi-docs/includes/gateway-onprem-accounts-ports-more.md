## Sign in account

Users sign in with either a work or school account. This account is your **organization account**. If you signed up for an Office 365 offering and didn’t supply your actual work email, it may look like nancy@contoso.onmicrosoft.com. Your account is stored within a tenant in Azure Active Directory (AAD). In most cases, your AAD account’s UPN will match the email address.

## Windows Service account

The On-premises data gateway is configured to use *NT SERVICE\PBIEgwService* for the Windows service logon credential. By default, it has the right of Log on as a service, in the context of the machine that you are installing the gateway on. The account is not the same account used to connect to on-premises data sources. The account is also not the work or school account that you sign in to cloud services with.

> [!NOTE]
> If you selected personal mode, you configure the Windows service account separately.

If you encounter authentication issues with your proxy server, try changing the Windows service account to a domain user or managed service account. For more information, see [proxy configuration](../service-gateway-proxy.md#changing-the-gateway-service-account-to-a-domain-user).

## Ports

The gateway creates an outbound connection to Azure Service Bus. It communicates on outbound ports: TCP 443 (default), 5671, 5672, 9350 through 9354.  The gateway does not require inbound ports.

It is recommended that you whitelist the IP addresses, for your data region, in your firewall. You can download the [Microsoft Azure Datacenter IP list](https://www.microsoft.com/download/details.aspx?id=41653), which is updated weekly. Alternatively you can obtain the list of required ports by performing the [Network port test](service-gateway-onprem-tshoot.md#network-ports-test) on the on-premises data gateway application. The gateway will communicate with Azure Service Bus using the IP address along with the fully qualified domain name (FQDN). If you are forcing the gateway to communicate using HTTPS it will strictly use FQDN only, and no communication will happen using IP addresses.


> [!NOTE]
> The IP Addresses listed in the Azure Datacenter IP list are in CIDR notation. For example, 10.0.0.0/24 does not mean 10.0.0.0 through 10.0.0.24. Learn more about the [CIDR notation](http://whatismyipaddress.com/cidr).

Here is a listing of the fully qualified domain names used by the gateway.

| Domain names | Outbound ports | Description |
| --- | --- | --- |
| *.download.microsoft.com |80 |HTTP used to download the installer. |
| *.powerbi.com |443 |HTTPS |
| *.analysis.windows.net |443 |HTTPS |
| *.login.windows.net |443 |HTTPS |
| *.servicebus.windows.net |5671-5672 |Used for Advanced Message Queuing Protocol (AMQP) |
| *.servicebus.windows.net |443, 9350-9354 |Listeners on Service Bus Relay over TCP (requires 443 for Access Control token acquisition) |
| *.frontend.clouddatahub.net |443 |HTTPS |
| *.core.windows.net |443 |HTTPS |
| login.microsoftonline.com |443 |HTTPS |
| *.msftncsi.com |443 |Used to test internet connectivity if the gateway is unreachable by the Power BI service. |
| *.microsoftonline-p.com |443 |Used for authentication depending on configuration. |

> [!NOTE]
> Once the gateway is installed and registered, the only required ports/IPs are the ones needed by the Azure service bus(servicebus.windows.net above). You can obtain the list of required ports by performing the [Network port test](service-gateway-onprem-tshoot.md#network-ports-test) on the on-premises data gateway application.

## Forcing HTTPS communication with Azure Service Bus

You can force the gateway to communicate with Azure Service Bus using HTTPS instead of direct TCP. using HTTPS may have an impact on performance. To do so, modify the *Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config* file by changing the value from `AutoDetect` to `Https`, as shown in the code snippet directly following this paragraph. That file is located (by default) at *C:\Program Files\On-premises data gateway*.

```xml
<setting name="ServiceBusSystemConnectivityModeString" serializeAs="String">
    <value>Https</value>
</setting>
```

The value for the *ServiceBusSystemConnectivityModeString* parameter is case-sensitive. Valid values are *AutoDetect* and *Https*.

Alternatively, you can force the gateway to adopt this behavior using the gateway user interface. In the gateway user interface select **Network**, then toggle the **Azure Service Bus connectivity mode** to **On**.

![](./media/gateway-onprem-accounts-ports-more/gw-onprem_01.png)

Once changed, when you select **Apply** (a button that only appears when you make a change), the *gateway Windows service* restarts automatically, so the change can take effect.

For future reference, you can restart the *gateway Windows service* from the user interface dialog by selecting **Service Settings** then select *Restart Now*.

![](./media/gateway-onprem-accounts-ports-more/gw-onprem_02.png)

## Support for TLS 1.2

By default, the On-premises data gateway uses Transport Layer Security (TLS) 1.2 to communicate with the Power BI service. To ensure all gateway traffic uses TLS 1.2, you might have to add or modify the following registry keys on the machine running the gateway service:

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\v4.0.30319]"SchUseStrongCrypto"=dword:00000001
[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v4.0.30319]"SchUseStrongCrypto"=dword:00000001
```

> [!NOTE]
> Adding or modifying these registry keys applies the change to all .NET applications. For information about registry changes that affect TLS for other applications, see [Transport Layer Security (TLS) registry settings](https://docs.microsoft.com/windows-server/security/tls/tls-registry-settings).

## How to restart the gateway

The gateway runs as a windows service. You can start and stop it like any windows service. Here is how you can do it from the command prompt.

1. On the machine where the gateway is running, launch an admin command prompt.
2. Use the following command to stop the service.
   
   net stop PBIEgwService
3. Use the following command to start the service.
   
   net start PBIEgwService

