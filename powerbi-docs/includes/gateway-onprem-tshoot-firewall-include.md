## Firewall or Proxy
For information on providing proxy information for your gateway, see [Configuring proxy settings for the Power BI gateways](../service-gateway-proxy.md).

You can test to see if your firewall, or proxy, may be blocking connections by running [Test-NetConnection](https://docs.microsoft.com/powershell/module/nettcpip/test-netconnection) from a PowerShell prompt. This will test connectivity to the Azure Service Bus. This only tests network connectivity and doesn't have anything to do with the cloud server service or the gateway. It helps to determine if your machine can actually get out to the internet.

    Test-NetConnection -ComputerName watchdog.servicebus.windows.net -Port 9350

> [!NOTE]
> Test-NetConnection is only available on Windows Server 2012 R2 and later. It is also available on Windows 8.1 and later. On earlier OS versions, you can use Telnet to test port connectivity.
> 
> 

The results should look similar to the following. The difference will be with TcpTestSucceeded. If **TcpTestSucceeded** is not *true*, then you may be blocked by a firewall.

    ComputerName           : watchdog.servicebus.windows.net
    RemoteAddress          : 70.37.104.240
    RemotePort             : 5672
    InterfaceAlias         : vEthernet (Broadcom NetXtreme Gigabit Ethernet - Virtual Switch)
    SourceAddress          : 10.120.60.105
    PingSucceeded          : False
    PingReplyDetails (RTT) : 0 ms
    TcpTestSucceeded       : True

If you want to be exhaustive, substitute the **ComputerName** and **Port** values with those listed for [ports](../service-gateway-onprem.md#ports)

The firewall may also be blocking the connections that the Azure Service Bus makes to the Azure data centers. If that is the case, you will want to whitelist (unblock) the IP addresses for your region for those data centers. You can get a list of Azure IP addresses [here](https://www.microsoft.com/download/details.aspx?id=41653).

