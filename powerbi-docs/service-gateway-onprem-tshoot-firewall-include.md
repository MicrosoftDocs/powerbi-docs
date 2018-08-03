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

### Network Ports Test
The network ports test is a tool to check if your gateway can access the correct ports for all remote servers that are required by your gateway for transferring data. If the network ports test fails to connect to any of the ports, your gateway may experience network issues. If you are currently experiencing network issues with your gateway, run a network ports test to ensure that you have the optimal network environment.  

#### Start a new test
To run a new network ports test, in the On-premises data gateway user interface, select Diagnostics, and then select the Start new test link near the bottom of the page, as shown in the following image. To start a new network ports test, you must be signed into the On-premises data gateway user interface

![gateway-onprem-porttest-starttest](./media/gateway-onprem-tshoot-tools-include/gateway-onprem-porttest-starttest.png)

When executing the network ports test, your gateway will retrieve a list of ports and servers from Azure Service Bus and then it will attempt to connect to all the servers and ports. When the Start new test link reappears, the network ports test has finished executing.  

#### Test results 
A summary of the test can be seen below the Start new test link as Recent test results. The two results are Completed (Succeeded) and Completed (Failed, see last test results). If the test succeeded, then your gateway successfully connected to all the required ports. If the test failed, then your network environment may be blocking these required ports and servers. 

![gateway-onprem-porttest-result](./media/gateway-onprem-tshoot-tools-include/gateway-onprem-porttest-result.png)

To view the results of the last completed test, select the Open last completed test results link, as seen below. The test results will open in Windows’ default text editor.  

The test results list all the servers, ports, and IP addresses that are required by your gateway. If the test results display Closed for any ports as shown below, ensure that your network environment is not blocking the connection. You may need to contact your network administrator to open the required ports.   

![gateway-onprem-porttest-result-file](./media/gateway-onprem-tshoot-tools-include/gateway-onprem-porttest-result-file.png)

