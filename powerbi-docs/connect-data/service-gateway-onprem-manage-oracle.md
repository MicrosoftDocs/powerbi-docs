---
title: Manage your data source - Oracle
description: How to manage the on-premises data gateway and Oracle data sources that belong to that gateway.
author: arthiriyer
ms.author: arthii
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 07/15/2019
LocalizationGroup: Gateways
---

# Manage your data source - Oracle

[!INCLUDE [gateway-rewrite](../includes/gateway-rewrite.md)]

After you [install the on-premises data gateway](/data-integration/gateway/service-gateway-install), you need to [add data sources](service-gateway-data-sources.md#add-a-data-source) that can be used with the gateway. This article looks at how to work with gateways and Oracle data sources either for scheduled refresh or for DirectQuery.

## Connect to an Oracle database
To connect to an Oracle database with the on-premises data gateway, the correct Oracle client software must be installed on the computer running the gateway. The Oracle client software you use depends on the Oracle server version, but will always match the 64-bit gateway.

Supported Oracle versions: 
- Oracle Server 9 and later
- Oracle Data Access Client (ODAC) software 11.2 and later

## Install the Oracle client
- [download and install the 64-bit Oracle client](https://www.oracle.com/database/technologies/odac-downloads.html).

> [!NOTE]
> Choose a version of Oracle Data Access Client (ODAC) which is compatible with your Oracle Server. For instance, ODAC 12.x does not always support Oracle Server version 9.
> Choose the Windows installer of the Oracle Client.
> During the setup of the Oracle client, make sure you enable *Configure ODP.NET and/or Oracle Providers for ASP.NET at machine-wide level* by selecting the corresponding checkbox during the setup wizard. Some versions of the Oracle client wizard selects the checkbox by default, others do not. Make sure that checkbox is selected so that Power BI can connect to your Oracle database.

After the client is installed and ODAC is configured properly, we recommend using Power BI Desktop or other test client to verify correct installation and configuration on the Gateway.

## Add a data source

For more information about how to add a data source, see [Add a data source](service-gateway-data-sources.md#add-a-data-source). Under **Data Source Type**, select **Oracle**.

![Add the Oracle data source](media/service-gateway-onprem-manage-oracle/data-source-oracle.png)

After you select the Oracle data source type, fill in the information for the data source, which includes **Server** and **Database**. 

Under **Authentication Method**, you can choose either **Windows** or **Basic**. Choose **Basic** if you plan to use an account that's created within Oracle instead of Windows authentication. Then enter the credentials to be used for this data source.

> [!NOTE]
> All queries to the data source will run using these credentials. To learn more about how credentials are stored, see [Store encrypted credentials in the cloud](service-gateway-data-sources.md#store-encrypted-credentials-in-the-cloud).

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

After you publish, either from Power BI Desktop or **Get Data**, your reports should start to work. It might take several minutes after you create the data source within the gateway for the connection to be usable.

### Use the data source with scheduled refresh

If you're listed in the **Users** tab of the data source configured within the gateway and the server name and database name match, you see the gateway as an option to use with scheduled refresh.

![Displaying the users](media/service-gateway-onprem-manage-oracle/powerbi-gateway-enterprise-schedule-refresh.png)

## Troubleshooting

You might encounter any of several errors from Oracle when the naming syntax is either incorrect or not configured properly:

* ORA-12154: TNS:could not resolve the connect identifier specified.
* ORA-12514: TNS:listener does not currently know of service requested in connect descriptor.
* ORA-12541: TNS:no listener.
* ORA-12170: TNS:connect timeout occurred.
* ORA-12504: TNS:listener was not given the SERVICE_NAME in CONNECT_DATA.

These errors might occur if the Oracle client either isn't installed or isn't configured properly. If it's installed, verify that the tnsnames.ora file is properly configured and you're using the proper net_service_name. You also need to make sure that the net_service_name is the same between the machine that uses Power BI Desktop and the machine that runs the gateway. For more information, see [Install the Oracle client](#install-the-oracle-client).

You might also encounter a compatibility issue between the Oracle server version and the Oracle Data Access Client version. Typically, you want these versions to match, as some combinations are incompatible. For instance, ODAC 12.x does not support Oracle Server version 9.

For diagnosing connectivity issues between the data source server and the Gateway machine, we recommend installing a client (such as Power BI Desktop or Oracle ODBC Test) on the gateway machine. You can use the client to check connectivity to the data source server.

For additional troubleshooting information that relates to the gateway, see [Troubleshooting the on-premises data gateway](/data-integration/gateway/service-gateway-tshoot).

## Next steps

* [Troubleshoot gateways - Power BI](service-gateway-onprem-tshoot.md)
* [Power BI Premium](../admin/service-premium-what-is.md)

More questions? Try asking the [Power BI Community](https://community.powerbi.com/).
