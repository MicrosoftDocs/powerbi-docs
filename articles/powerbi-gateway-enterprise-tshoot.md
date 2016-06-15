<properties
pageTitle="Troubleshoot the enterprise gateway"
description="Troubleshooting the enterprise gateway"
services="powerbi"
documentationCenter=""
authors="guyinacube"
manager="mblythe"
backup=""
editor=""
tags=""
qualityFocus="identified"
qualityDate="06/13/2016"/>

<tags
ms.service="powerbi"
ms.devlang="NA"
ms.topic="article"
ms.tgt_pltfrm="na"
ms.workload="powerbi"
ms.date="06/15/2016"
ms.author="asaxton"/>
# Troubleshooting the Power BI Gateway - Enterprise

The following goes through some common issues you may encounter when using the Power BI Gateway - Enterprise. 

> **Note**: If you encounter an issue that is not listed below, you can ask for further assistance on the [community site](http://community.powerbi.com/), or you can create a [support ticket](https://powerbi.microsoft.com/support/).

## Update to the latest version 
 
A lot of issues can surface when the gateway version is out of date.  It is a good general practice to make sure you are on the latest version.  If you haven't updated the gateway for a month, or longer, you may want to consider installing the latest version of the gateway and see if you can reproduce the issue.

## Installation

### Error: Failed to add user to group.  (-2147463168   PBIEgwService   Performance Log Users   )

You may receive this error if you are trying to install the enterprise gateway on a domain controller. Deploying on a domain controller is not supported. You will need to deploy the enterprise gateway on a machine that is not a domain controller.

## Configuration

### How to restart the gateway

The enterprise gateway runs as a windows service. You can start and stop it like any windows service. There are multiple ways to do this. Here is how you can do it from the command prompt. 

1. On the machine where the enterprise gateway is running, launch an admin command prompt.

2. Use the following command to **stop** the service.

    net stop PBIEgwService
    
3. Use the following command to **start** the service.

    net start PBIEgwService

### Error: Failed to create gateway. Please try again.

All of the details are available, but the call to the Power BI service returned an error. The error, and an activity id, will be displayed. This could happen for different reasons. You can collect, and review, the logs as mentioned above to get more details. 

This could also be due to proxy configuration issues. The user interface does now allow for proxy configuration. You can learn more about making [proxy configuration changes](powerbi-gateway-proxy.md)

### Error: Failed to update gateway details.  Please try again.

Information was received from the Power BI service, to the gateway. The information was passed onto the local windows service, but it failed to return. Or, a symmetric key generation failed. The inner exception will be displayed under **Show details**. You can collect, and review, the logs as mentioned above to get more details. 

### Error: Power BI service reported local gateway as unreachable. Please restart the gateway and try again.

At the end of configuration, the Power BI service will be called again to validate the gateway. The Power BI service does not report the gateway as *live*. Restarting the windows service may allow the communication to be successful. You can collect, and review, the logs as mentioned above to get more details. 

### Script error during sign into Power BI

You may receive a script error when signing into Power BI as part of the enterprise gateway configuration. Installing the following security update should resolve the issue. This can be installed via Windows Update.

[MS16-051: Security update for Internet Explorer: May 10, 2016 (KB 3154070)](https://support.microsoft.com/kb/3154070)

### Gateway configuration failed with a null reference exception

You may encounter an error similar to the following.

	    Failed to update gateway details.  Please try again.
        Error updating gateway configuration.

This will include a stack trace, and that stack trace will may include the following.

	    Microsoft.PowerBI.DataMovement.Pipeline.Diagnostics.CouldNotUpdateGatewayConfigurationException: Error updating gateway configuration. ----> System.ArgumentNullException: Value cannot be null.
        Parameter name: serviceSection

If you are upgrading from an older gateway, we preserve the config file. There may be a section that is missing. When the gateway tries to read it, we will get the above null reference exception.

To correct this, do the following.

1. Uninstall the gateway.

2. Delete the following folder.

        c:\Program Files\Power BI Enterprise Gateway

3. Reinstall the gateway.

4. Optionally apply the recovery key to restore an existing gateway.

## Data sources

### Error: Unable to Connect. Details: "Invalid connection credentials"

Within **Show details**, it should display the error message received from the data source. For SQL Server, you should see something like the following.

    Login failed for user 'username'.

Verify that you have the correct username and password. Also verify that those credentials can successfully connect to the data source. Make sure the account being used matches the **Authentication Method**.

### Error: Unable to Connect. Details: "Cannot connect to the database"

We were able to connect to the server, but not to the database supplied. Verify the name of the database, and that the user credential as the proper permission to access that database.

Within **Show details**, it should display the error message received from the data source. For SQL Server, you should see something like the following.

    Cannot open database "AdventureWorks" requested by the login. The login failed. Login failed for user 'username'.

### Error: Unable to Connect. Details: "Unknown error in enterprise gateway"

This error could occur for different reasons. Be sure to validate that you can connect to the data source from the machine hosting the gateway. This could be the result of the server not being accessible.

Within **Show details**, you will see an error code of **DM_GWPipeline_UnknownError**.

You can also look in the Event Logs > **Applications and Services Logs** > **Power BI Enterprise Gateway Service** for more details.

### Error: We encountered an error while trying to connect to <server>. Details: "We reached the enterprise gateway, but the gateway can't access the on-premises data source."

We were unable to connect to the specified data source. Be sure to validate the information provided for that data source.

Within **Show details**, you will see an error code of **DM_GWPipeline_Gateway_DataSourceAccessError**. 

If the underlying error message is similar to the following, this means that the account you are using for the data source is not a server admin for that Analysis Services instance. [Learn more](powerbi-gateway-enterprise-manage-ssas.md#add-a-data-source)

    The 'CONTOSO\account' value of the 'EffectiveUserName' XML for Analysis property is not valid.

If the underlying error message is similar to the following, it could mean that the service account for Analysis Services may be missing the [token-groups-global-and-universal](https://msdn.microsoft.com/library/windows/desktop/ms680300.aspx) (TGGAU) directory attribute.

    The user name or password is incorrect.

Domains with Pre-Windows 2000 compatibility access will have the TGGAU attribute enabled. However, most newly created domains will not enable this attribute by default. You can read more about this [here](https://support.microsoft.com/kb/331951).

You can confirm this by doing the following.

1. Connect to the Analysis Services machine within SQL Server Management Studio. Within the Advanced connection properties, include EffectiveUserName for the user in question and see if this reproduces the error.

2. You can use the dsacls Active Directory tool to validate whether the attribute is listed. This is tool is normally found on a domain controller. You will need to know what the distinguished domain name is for the account and pass that to the tool.

        dsacls "CN=John Doe,CN=UserAccounts,DC=contoso,DC=com"
    
    You want to see something similar to the following in the results.

        	Allow BUILTIN\Windows Authorization Access Group
	                                      SPECIAL ACCESS for tokenGroupsGlobalAndUniversal
                                          READ PROPERTY

To correct this issue, you will need to enable TGGAU on account used for the Analysis Services windows service.

**Another possibility for user name or password incorrect**

This error could also be caused if the Analysis Services server is in a different domain than the users and there is not a two-way trust established.

You will need to work with your domain administrators to verify the trust relationship between domains.

**Unable to see enterprise gateway data sources in the 'Get Data' experience for Analysis Services from the Power BI service**

Make sure that your account is listed in the **Users** tab of the data source within the gateway configuration. If you don't have access to the gateway, check with the adminsitrator of the gateway and ask them to verify. Only accounts in the **Users** list will see the data source listed in the Analysis Services list.

## Dataset

### Error: Couldn't refresh because your Personal Gateway is offline. Make sure your Personal Gateway is up and running.

You may have configured an enterprise gateway, and see this error for a given dataset when you try to refresh. The enterprise gateway currently does not support imported data. It supports SQL Server and SAP HANA in DirectQuery mode, or live connections with Analysis Services, either Tabular or Multidimensional.

If you have imported data into your file, you will need the Personal Gateway to refresh the dataset.

## Reports

### Report could not access the data source because you do not have access to our data source via an enterprise gateway.

This is usually caused by one of the following. 

1. The data source information does not match what is in the underlying dataset. The server and database name need to match between the data source defined for the enterprise gateway and what you supply within Power BI Desktop. If you use an IP Address in Power BI Desktop, the data source, for the enterprise gateway, needs to use an IP Address as well.

2. There is not a data source available on any enterprise gateway within your organization. You can configure the data source on a new, or existing, enterprise gateway.

### Error: Data source access error. Please contact the gateway administrator.

If this report is making use of a live Analysis Services connection, you could be encountering an issue with a value being passed to EffectiveUserName that is either not valid, or doesn't have permissions on the Analysis Services machine. Typically, an authentication issue is due to the fact that the value being passed for EffectiveUserName doesn't match a local user principal name (UPN).

To confirm this, you can do the following.

1. Find the effective username within the [gateway logs](#logs).

2. Once you have the value being passed, validate that it is correct. If it is your user, you can use the following command from a command prompt to see what the UPN should be. The UPN will look like an email address.

        whoami /upn

Optionally, you can see what Power BI gets from Azure Active Directory.

1. Browse to [https://graphexplorer.cloudapp.net](https://graphexplorer.cloudapp.net).

2. Select **Sign in** in the upper right.

3. Run the following query. You will see a rather large JSON response.

        https://graph.windows.net/me?api-version=1.5

4. Look for **userPrincipalName**. 


If your Azure Active Directory UPN doesn't match your local Active Directory UPN, you can use the [Map user names](powerbi-gateway-enterprise-manage-ssas.md#map-user-names) feature to replace it with a valid value. Or you can work with either your tenant admin, or local Active Directory admin, to get your UPN changed.

## Firewall or Proxy

For information on providing proxy information for your gateway, see [Configuring proxy settings for the Power BI Gateways](powerbi-gateway-tshoot.md).

You can test to see if your firewall, or proxy, may be blocking conections by running the following command from a PowerShell prompt. This will test connectivity to the Azure Service Bus. This only tests network connectivity and doesn't have anything to do with the Power BI service or the gateway. It helps to determine if your machine can actually get out to the internet.

    Test-NetConnection -ComputerName watchdog.servicebus.windows.net -Port 9350

The results should look similar to the following. The difference will be with TcpTestSucceeded. If **TcpTestSucceeded** is not *true*, then you may be blocked by a firewall.

    ComputerName           : watchdog.servicebus.windows.net
    RemoteAddress          : 70.37.104.240
    RemotePort             : 5672
    InterfaceAlias         : vEthernet (Broadcom NetXtreme Gigabit Ethernet - Virtual Switch)
    SourceAddress          : 10.120.60.105
    PingSucceeded          : False
    PingReplyDetails (RTT) : 0 ms
    TcpTestSucceeded       : True

If you want to be exhaustive, substitute the **ComputerName** and **Port** values with those listed for [ports](powerbi-gateway-enterprise.md#ports)

The firewall may also be blocking the connections that the Azure Service Bus makes to the Azure data centers. If that is the case, you will want to whitelist (unblock) all of the IP addresses for your region for those data centers. You can get a list of Azure IP addresses [here](https://www.microsoft.com/download/details.aspx?id=41653).

You can find the data center region you are in by doing the following:

1. Select the **?** in the upper right of the Power BI service.

2. Select **About Power BI**.

3. Your data region will be listed in **Your data is stored in**.

    ![](media/powerbi-gateway-enterprise-tshoot/power-bi-region.png)

If you are still not getting anywhere, you could try getting a network trace using a tool like [fiddler](#fiddler) or netsh, although these are advanced collection methods and you may need assistance in analyzing the collected data. You can contact [support](https://support.microsoft.com) for assistance.

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

### Refresh History  
When using the enterprise gateway for scheduled refresh, **Refresh History** can help you see what errors have occurred, as well as provide useful data if you should need to create a support request. You can view both scheduled, as well as on demand, refreshes. Here is how you can get to the **Refresh History**.

1.  In the Power BI navigation pane, in **Datasets**, select a dataset &gt; Open Menu &gt; **Schedule Refresh**.

    ![](media/powerbi-gateway-enterprise-tshoot/scheduled-refresh.png)

2.  In **Settings for...** &gt; **Schedule Refresh**, select **Refresh History**.

    ![](media/powerbi-gateway-enterprise-tshoot/scheduled-refresh-2.png)

    ![](media/powerbi-gateway-enterprise-tshoot/refresh-history.png)

### Event Logs  
The **Data Management Gateway** and **PowerBIGateway** logs are present under **Application and Services Logs**.

![](media/powerbi-gateway-enterprise-tshoot/event-logs.png)

<a name="fiddler" />
### Fiddler Trace  
[Fiddler](http://www.telerik.com/fiddler) is a free tool from Telerik that monitors HTTP traffic.  You can see the back and forth with the Power BI service from the client machine. This may show errors and other related information.

![](media/powerbi-gateway-enterprise-tshoot/fiddler.png)

## See also

[Configuring proxy settings for the Power BI Gateways](powerbi-gateway-proxy.md)

[Power BI Gateway – Enterprise](powerbi-gateway-enterprise.md)

[Power BI Gateway - Enterprise in-depth](powerbi-gateway-enterprise-indepth.md)

[Manage your enterprise data source - Analysis Services](powerbi-gateway-enterprise-manage-ssas.md)

[Manage your enterprise data source - SAP HANA](powerbi-gateway-enterprise-manage-sap.md)

[Manage your enterprise data source - SQL Server](powerbi-gateway-enterprise-manage-sql.md)

[Manage your enterprise data source - Import/Scheduled refresh](powerbi-gateway-enterprise-manage-scheduled-refresh.md)
