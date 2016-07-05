## Tools for troubleshooting

<a name="logs" />
### Collecting logs from the gateway configurator

There are several logs you can collect for the gateway. Always start with the logs!

**Installer logs**

    %localappdata%\Temp\On-premises_data_gateway_*.log

**Configuration logs**

    %localappdata%\Microsoft\on-premises data gateway\GatewayConfigurator*.log

**Enterprise gateway service logs**

    C:\Users\PBIEgwService\AppData\Local\Microsoft\on-premises data gateway\Gateway*.log

### Event Logs  
The **On-premises data gateway service** event logs are present under **Application and Services Logs**.

![on-prem-data-gateway-event-logs](./media/gateway-onprem-tshoot-tools-include/on-prem-data-gateway-event-logs.png)

<a name="fiddler" />
### Fiddler Trace  
[Fiddler](http://www.telerik.com/fiddler) is a free tool from Telerik that monitors HTTP traffic.  You can see the back and forth with the Power BI service from the client machine. This may show errors and other related information.

![](media/powerbi-gateway-enterprise-tshoot/fiddler.png)