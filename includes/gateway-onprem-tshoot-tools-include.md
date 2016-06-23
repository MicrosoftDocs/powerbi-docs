## Tools for troubleshooting

<a name="logs" />
### Collecting logs from the gateway configurator

There are several logs you can collect for the enterprise gateway. Always start with the logs!

**Installer logs**

    %localappdata%\Temp\Power_BI_Gateway_–_Enterprise*.log

**Configuration logs**

    %localappdata%\Microsoft\Power BI Enterprise Gateway\GatewayConfigurator*.log

**Enterprise gateway service logs**

    C:\Users\PBIEgwService\AppData\Local\Microsoft\Power BI Enterprise Gateway\EnterpriseGateway*.log

### Event Logs  
The **Data Management Gateway** and **PowerBIGateway** logs are present under **Application and Services Logs**.

![](media/powerbi-gateway-enterprise-tshoot/event-logs.png)

<a name="fiddler" />
### Fiddler Trace  
[Fiddler](http://www.telerik.com/fiddler) is a free tool from Telerik that monitors HTTP traffic.  You can see the back and forth with the Power BI service from the client machine. This may show errors and other related information.

![](media/powerbi-gateway-enterprise-tshoot/fiddler.png)