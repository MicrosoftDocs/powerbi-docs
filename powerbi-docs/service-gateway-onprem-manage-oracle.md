---
title: Manage your data source - Oracle
description: How to manage the on-premises data gateway and data sources that belong to that gateway.
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: conceptual
ms.date: 07/15/2019
ms.author: mblythe

LocalizationGroup: Gateways
---

# Manage your data source - Oracle

[!INCLUDE [gateway-rewrite](includes/gateway-rewrite.md)]

After you [install the on-premises data gateway](/data-integration/gateway/service-gateway-install), you need to [add data sources](service-gateway-data-sources.md#add-a-data-source) that can be used with the gateway. This article looks at how to work with gateways and Oracle data sources either for scheduled refresh or for DirectQuery.

## Install the Oracle client

To connect the gateway to your Oracle server, the Oracle Data Provider for .NET (ODP.NET) must be installed and configured. ODP.NET is part of the Oracle Data Access Components (ODAC).

For 32-bit versions of Power BI Desktop, use the following link to download and install the 32-bit Oracle client:

* [32-bit Oracle Data Access Components (ODAC) with Oracle Developer Tools for Visual Studio (12.1.0.2.4)](http://www.oracle.com/technetwork/topics/dotnet/utilsoft-086879.html)

For 64-bit versions of Power BI Desktop or for the on-premises data gateway, use the following link to download and install the 64-bit Oracle client:

* [64-bit ODAC 12.2c Release 1 (12.2.0.1.0) for Windows x64](http://www.oracle.com/technetwork/database/windows/downloads/index-090165.html)

After the client is installed, configure your tnsnames.ora file with the proper information for your database. Power BI Desktop and the gateway go off of the net_service_name defined in the tnsnames.ora file. If the file isn't configured, you can't connect. The default path for tnsnames.ora is `[Oracle Home Directory]\Network\Admin\tnsnames.ora`. For more information about how to configure tnsnames.ora files, see [Oracle: Local naming parameters (tnsnames.ora)](https://docs.oracle.com/cd/B28359_01/network.111/b28317/tnsnames.htm).

### Example tnsnames.ora file entry

Here's the basic format of an entry in tnsname.ora:

```
net_service_name=
 (DESCRIPTION=
   (ADDRESS=(protocol_address_information))
   (CONNECT_DATA=
     (SERVICE_NAME=service_name)))
```

Here's an example of the server and port information filled in:

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

## Add a data source

For more information about how to add a data source, see [Add a data source](service-gateway-data-sources.md#add-a-data-source). Under **Data Source Type**, select Oracle.

![Add the Oracle data source](media/service-gateway-onprem-manage-oracle/data-source-oracle.png)

After you select the Oracle data source type, fill in the information for the data source, which includes **Server** and **Database**. 

Under **Authentication Method**, you can choose either **Windows** or **Basic**. Choose **Basic** if you plan to use an account that's created within Oracle instead of Windows authentication. Then enter the credentials to be used for this data source.

> [!NOTE]
> All queries to the data source will run by using these credentials. To learn more about how credentials are stored, see [Store encrypted credentials in the cloud](service-gateway-data-sources.md#store-encrypted-credentials-in-the-cloud).

![Filling in the data source settings](media/service-gateway-onprem-manage-oracle/data-source-oracle2.png)

After you fill in everything, select **Add**. You can now use this data source for scheduled refresh or DirectQuery against an Oracle server that's on-premises. You see *Connection Successful* if it succeeded.

![Displaying the connection status](media/service-gateway-onprem-manage-oracle/datasourcesettings4.png)

### Advanced settings

Optionally, you can configure the privacy level for your data source. This setting controls how data can be combined. It's only used for scheduled refresh. The privacy-level setting doesn't apply to DirectQuery. To learn more about privacy levels for your data source, see [Privacy levels (Power Query)](https://support.office.com/article/Privacy-levels-Power-Query-CC3EDE4D-359E-4B28-BC72-9BEE7900B540).

![Setting the privacy level](media/service-gateway-onprem-manage-oracle/datasourcesettings9.png)

## Use the data source

After you create the data source, it's available to use with either DirectQuery connections or through scheduled refresh.

> [!WARNING]
> The server and database names must match between Power BI Desktop and the data source within the on-premises data gateway.

The link between your dataset and the data source within the gateway is based on your server name and database name. These names must match. For example, if you supply an IP address for the server name within Power BI Desktop, you must use the IP address for the data source within the gateway configuration. This name also has to match an alias defined within the tnsnames.ora file. For more information about the tnsnames.ora file, see [Install the Oracle client](#install-the-oracle-client).

This requirement is the case for both DirectQuery and scheduled refresh.

### Use the data source with DirectQuery connections

Make sure that the server and database names match between Power BI Desktop and the configured data source for the gateway. You also need to make sure your user is listed in the **Users** tab of the data source to publish DirectQuery datasets. The selection for DirectQuery occurs within Power BI Desktop when you first import data. For more information about how to use DirectQuery, see [Use DirectQuery in Power BI Desktop](desktop-use-directquery.md).

After you publish, either from Power BI Desktop or **Get Data**, your reports start to work. It might take several minutes after you create the data source within the gateway for the connection to be usable.

### Use the data source with scheduled refresh

If you're listed in the **Users** tab of the data source configured within the gateway and the server name and database name match, you see the gateway as an option to use with scheduled refresh.

![Displaying the users](media/service-gateway-onprem-manage-oracle/powerbi-gateway-enterprise-schedule-refresh.png)

## Troubleshooting

You might encounter several errors from Oracle when the naming syntax is either incorrect or not configured properly.

* ORA-12154: TNS: Could not resolve the connect identifier specified.
* ORA-12514: TNS: Listener does not currently know of service requested in connect descriptor.
* ORA-12541: TNS: No listener.
* ORA-12170: TNS: Connect timeout occurred.
* ORA-12504: TNS: Listener was not given the SERVICE_NAME in CONNECT_DATA.

These errors might occur if the Oracle client either isn't installed or isn't configured properly. If it's installed, verify that the tnsnames.ora file is properly configured and you're using the proper net_service_name. You also need to make sure that the net_service_name is the same between the machine that uses Power BI Desktop and the machine that runs the gateway. For more information, see [Install the Oracle client](#install-the-oracle-client).

> [!NOTE]
> You might also encounter a compatibility issue between the Oracle server version and the Oracle client version. Typically, you want these versions to match.

For additional troubleshooting information that relates to the gateway, see [Troubleshooting the on-premises data gateway](/data-integration/gateway/service-gateway-tshoot).

## Next steps

* [Troubleshoot gateways - Power BI](service-gateway-onprem-tshoot.md)
* [Power BI Premium](service-premium.md)

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

