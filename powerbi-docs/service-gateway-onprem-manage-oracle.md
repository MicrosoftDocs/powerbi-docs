---
title: Manage your data source - Oracle
description: How to manage the On-premises data gateway and data sources that belong to that gateway.
services: powerbi
documentationcenter: ''
author: davidiseminger
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: powerbi
ms.date: 01/24/2018
ms.author: davidi

LocalizationGroup: Gateways
---
# Manage your data source - Oracle
Once you have installed the On-premises data gateway, you will need to add data sources that can be used with the gateway. This article will look at how to work with gateways and data sources. You can use the Oracle data source either for scheduled refresh or for DirectQuery.

## Download and install the gateway
You can download the gateway from the Power BI service. Select **Downloads** > **Data Gateway**, or by going to the [gateway download page](https://go.microsoft.com/fwlink/?LinkId=698861).

![](media/service-gateway-onprem-manage-oracle/powerbi-download-data-gateway.png)

> [!WARNING]
> In order for the gateway to be able to connect to your Oracle server, the Oracle Data Provider for .NET (ODP.NET) needs to be installed and configured. This is part of the Oracle Data Access Components (ODAC). For more information on how to download the Oracle provider, see [Installing the Oracle Client](#installing-the-oracle-client) below.
> 
> 

## Installing the Oracle client
For **32-bit** versions of Power BI Desktop, use the following link to download and install the **32-bit** Oracle client:

* [32-bit Oracle Data Access Components (ODAC) with Oracle Developer Tools for Visual Studio (12.1.0.2.4)](http://www.oracle.com/technetwork/topics/dotnet/utilsoft-086879.html)

For **64-bit** versions of Power BI Desktop, or for the On-premises data gateway, use the following link to download and install the **64-bit** Oracle client:

* [64-bit ODAC 12.2c Release 1 (12.2.0.1.0) for Windows x64](http://www.oracle.com/technetwork/database/windows/downloads/index-090165.html)

Once that is installed, you will need to configure your tnsnames.ora file with the proper information for your database. Power BI Desktop and the gateway will go off of the net_service_name defined in the tnsnames.ora file. If it isn't configured, you will not be able to connect. The default path for tnsnames.ora is the following: `[Oracle Home Directory]\Network\Admin\tnsnames.ora`. For more information about how to configure tnsnames.ora files, see [Oracle: Local Naming Parameters (tnsnames.ora)](https://docs.oracle.com/cd/B28359_01/network.111/b28317/tnsnames.htm).

### Example tnsnames.ora file entry
The basic format of an entry in tnsname.ora is the following.

```
net_service_name=
 (DESCRIPTION=
   (ADDRESS=(protocol_address_information))
   (CONNECT_DATA=
     (SERVICE_NAME=service_name)))
```

Here is an example of the server and port information filled in.

```
CONTOSO =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = oracleserver.contoso.com)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = CONTOSO)
    )
  )
```

## Add a gateway
To add a gateway, simply [download](https://go.microsoft.com/fwlink/?LinkId=698861) and install the gateway on a server in your environment. After you have installed the gateway, it will show in the lists of gateways under **Manage gateways**.

> [!NOTE]
> **Manage gateways** will not show up until you are the admin of at least one gateway. This can happen either by being added as an admin or you installing and configuring a gateway.
> 
> 

## Remove a gateway
Removing a gateway will also delete any data sources under that gateway.  This will also break any dashboards and reports that rely on those data sources.

1. Select the gear icon ![](media/service-gateway-onprem-manage-oracle/pbi_gearicon.png) in the upper-right corner > **Manage gateways**.
2. Gateway > **Remove**
   
   ![](media/service-gateway-onprem-manage-oracle/datasourcesettings7.png)

## Add a data source
You can add a data source by either selecting a gateway and click **Add data source**, or go to Gateway > **Add data source**.

![](media/service-gateway-onprem-manage-oracle/datasourcesettings1.png)

You can then select the **Data Source Type** from the list.

![](media/service-gateway-onprem-manage-oracle/data-source-oracle.png)

You will then want to fill in the information for the data source which includes the **Server** and the **Database**.  

You will also need to choose an **Authentication Method**.  This can either be **Windows** or **Basic**.  You would want to choose **Basic** if you are going to use an account that is created within Oracle instead of Windows Authentication. Then enter the credentials that will be used for this data source.

> [!NOTE]
> All queries to the data source will run using these credentials. For more information, see the main On-premises data gateway article to learn more about how [credentials](service-gateway-onprem.md#credentials) are stored.
> 
> 

![](media/service-gateway-onprem-manage-oracle/data-source-oracle2.png)

You can click **Add** after you have everything filled in.  You can now use this data source for scheduled refresh, or DirectQuery, against an Oracle server that is on-premises. You will see *Connection Successful* if it succeeded.

![](media/service-gateway-onprem-manage-oracle/datasourcesettings4.png)

### Advanced settings
You can configure the privacy level for your data source. This controls how data can be mashed up. This is only used for scheduled refresh. It does not apply to DirectQuery. [Learn more](https://support.office.com/article/Privacy-levels-Power-Query-CC3EDE4D-359E-4B28-BC72-9BEE7900B540)

![](media/service-gateway-onprem-manage-oracle/datasourcesettings9.png)

## Remove a data source
Removing a data source will break any dashboards or reports that rely on the given data source.  

To remove a Data Source, go to the Data Source > **Remove**.

![](media/service-gateway-onprem-manage-oracle/datasourcesettings6.png)

## Manage administrators
On the Administrators tab for the gateway, you can add and remove users (or security groups) that can administer the gateway.

![](media/service-gateway-onprem-manage-oracle/datasourcesettings8.png)

## Manage users
On the Users tab, for the data source, you can add, and remove, users, or security groups, that can use this data source.

> [!NOTE]
> The users list only controls who are allowed to publish reports. The report owners can create dashboards, or content packs, and share those with other users. Users that are consuming the report or dashboard do not need to be in the users list.
> 
> 

![](media/service-gateway-onprem-manage-oracle/datasourcesettings5.png)

## Using the data source
After you have created the data source, it will be available to use with either DirectQuery connections, or through scheduled refresh.

> [!WARNING]
> Server and database name have to match between Power BI Desktop and the data source within the On-premises data gateway!
> 
> 

The link between your dataset and the data source within the gateway is based on your server name and database name. These have to match! For example, if you supply an IP Address for the server name, within Power BI Desktop, you will need to use the IP Address for the data source within the gateway configuration. This name also has to match an alias defined within the tnsnames.ora file. For more information about the tnsnames.ora file, see [Installing the Oracle Client](#installing-the-oracle-client).

This is the case for both DirectQuery and scheduled refresh.

### Using the data source with DirectQuery connections
You will need to make sure the server and database name matches between Power BI Desktop and the configured data source for the gateway. You will also need to make sure your user is listed in the **Users** tab of the data source in order to publish DirectQuery datasets. The selection, for DirectQuery, occurs within Power BI Desktop when you first import data. [Learn more](desktop-use-directquery.md)

After you publish, either from Power BI Desktop or **Get Data**, your reports should start working. It may take several minutes, after creating the data source within the gateway, for the connection to be usable.

### Using the data source with scheduled refresh
If you are listed in the **Users** tab of the data source configured within the gateway, and the server and database name match, you will see the gateway as an option to use with scheduled refresh.

![](media/service-gateway-onprem-manage-oracle/powerbi-gateway-enterprise-schedule-refresh.png)

## Troubleshooting
You may encounter serveral errors from Oracle when the naming syntax is either incorrect or not configured properly.

* ORA-12154: TNS: could not resolve the connect identifier specified  
* ORA-12514: TNS listener does not currently know of service requested in connect descriptor  
* ORA-12541: TNS: no listener  
* ORA-12170: TNS:Connect timeout occurred  
* ORA-12504: TNS listener was not given the SERVICE_NAME in CONNECT_DATA  

These errors could occur if either the Oracle client is not installed, or if it is not configured properly. If it is installed, you will want to verify the tnsnames.ora file is properly configured and you are using the proper net_service_name. You will also need to make sure that the net_service_name is the same between the machine using Power BI Desktop and the machine that is running the gateway. For more information, see [Installing the Oracle Client](#installing-the-oracle-client).

> [!NOTE]
> You may also be hitting an issue due to compatability between the Oracle server version and the Oracle client version. Typically you want these to match.
> 
> 

For additional troubleshooting information relating to the gateway, see [Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md).

## Next steps
[On-premises data gateway](service-gateway-onprem.md)  
[On-premises data gateway - in-depth](service-gateway-onprem-indepth.md)  
[Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md)  
[Power BI Premium](service-premium.md)

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

