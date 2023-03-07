---
title: Manage your data source - Oracle
description: Learn how to manage the on-premises data gateway and Oracle data sources that belong to that gateway.
author: arthiriyer
ms.author: arthii
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 02/17/2023
LocalizationGroup: Gateways
---

# Manage your data source - Oracle

[!INCLUDE [gateway-rewrite](../includes/gateway-rewrite.md)]

After you [install the on-premises data gateway](/data-integration/gateway/service-gateway-install), you can [add data sources](service-gateway-data-sources.md#add-a-data-source) to use with the gateway. This article looks at how to work with the on-premises gateway and Oracle data sources either for scheduled refresh or for DirectQuery.

<a name="install-the-oracle-client"></a>
## Connect to an Oracle database

To connect to an Oracle database with the on-premises data gateway, [download and install the 64-bit Oracle Client](https://www.oracle.com/database/technologies/net-downloads.html) on the computer running the gateway. The Oracle client software you use depends on the Oracle server version, which always matches the 64-bit gateway.

Supported Oracle versions are: 
- Oracle Server 9 and later.
- Oracle Data Access Components (ODAC) software 11.2 and later.

When you install the client:

- Choose an ODAC version that's compatible with your Oracle server. For instance, ODAC 12.x doesn't always support Oracle Server version 9.
- Choose the Windows installer.
- During setup, make sure to select the checkbox next to **Configure ODP.NET and/or Oracle Providers for ASP.NET at machine-wide level** in the setup wizard so that Power BI can connect to your Oracle database. Some versions of the setup wizard select this checkbox by default and others don't.

After you install the client and configure ODAC properly, use Power BI Desktop or another test client to verify correct installation and configuration on the gateway.

## Add a data source

1. On the **New connection** screen for your on-premises data gateway, select **Oracle** for **Connection type**.

   :::image type="content" source="media/service-gateway-onprem-manage-oracle/add-data-source-oracle.png" alt-text="Screenshot of adding an Oracle data source to the gateway." :::

1. In **Server**, enter the name for the data source.

1. Under **Authentication method**, choose either **Windows** or **Basic**. Choose **Basic** if you plan to use an account you created within Oracle instead of Windows authentication. Then enter the credentials to use for this data source.

   > [!NOTE]
   > All queries to the data source run with these credentials. To learn more about credential storage, see [Store encrypted credentials in the cloud](service-gateway-data-sources.md#store-encrypted-credentials-in-the-cloud).

1. Configure the **Privacy level** for your data source. This setting controls how data can combine for scheduled refresh. The privacy-level setting doesn't apply to DirectQuery. To learn more about privacy levels for your data source, see [Privacy levels (Power Query)](https://support.office.com/article/Privacy-levels-Power-Query-CC3EDE4D-359E-4B28-BC72-9BEE7900B540).

1. Select **Create**.

   :::image type="content" source="media/service-gateway-onprem-manage-oracle/authentication-oracle.png" alt-text="Screenshot of filling in credentials and privacy level for the Oracle data source." :::

   If the creation succeeds, you see **Created \<Data source name>**. You can now use this data source for scheduled refresh or DirectQuery with the on-premises Oracle server. 

   :::image type="content" source="media/service-gateway-onprem-manage-oracle/successful-data-source-oracle.png" alt-text=" Screenshot of successful creation for the Oracle data source." :::

## Use the data source

After you create the data source, it's available to use with either DirectQuery or scheduled refresh.

> [!IMPORTANT]
> The server and database names must match between Power BI Desktop and the data source within the on-premises data gateway.

The link between your dataset and the data source within the gateway is based on your server name and database name. These names must match exactly. For example, if you supply an IP address for the server name within Power BI Desktop, you must use the IP address for the data source within the gateway configuration. This name also has to match an alias that the *tnsnames.ora* file defines. This requirement is the case for both DirectQuery and scheduled refresh.

### Use the data source with DirectQuery connections

Make sure that the server and database names match between Power BI Desktop and the configured data source for the gateway. Also, to be able to publish DirectQuery datasets, your users must appear under **Users** in the data source listing.

After you publish reports, either from Power BI Desktop or by getting data in Power BI service, your on-premises data connection should work. It might take several minutes after you create the data source in the gateway to be able to use the connection.

### Use the data source with scheduled refresh

If you're in the **Users** list of a data source you configure within the gateway, and the server and database names match, you see the gateway as an option to use with scheduled refresh.

![Screenshot that shows the gateway connection settings.](media/service-gateway-onprem-manage-oracle/powerbi-gateway-enterprise-schedule-refresh.png)

## Troubleshooting

You might get one of the following Oracle errors when the naming syntax is either incorrect or improperly configured:

* `ORA-12154: TNS:could not resolve the connect identifier specified.`
* `ORA-12514: TNS:listener does not currently know of service requested in connect descriptor.`
* `ORA-12541: TNS:no listener.`
* `ORA-12170: TNS:connect timeout occurred.`
* `ORA-12504: TNS:listener was not given the SERVICE_NAME in CONNECT_DATA.`

These errors might occur if the Oracle client isn't installed or isn't configured properly. If the client is installed, verify that the *tnsnames.ora* file is properly configured and you're using the proper `net_service_name`. Also make sure that the `net_service_name` is the same between the machine that uses Power BI Desktop and the machine that runs the gateway.

You might also encounter a compatibility issue between the Oracle server version and the ODAC version. Typically, these versions should match, because some combinations are incompatible. For instance, ODAC 12.x doesn't support Oracle Server version 9.

To diagnose connectivity issues between the data source server and the gateway machine, install a client like Power BI Desktop or Oracle ODBC Test on the gateway machine. You can use the client to check connectivity to the data source server.

For more gateway troubleshooting information, see [Troubleshoot the on-premises data gateway](/data-integration/gateway/service-gateway-tshoot).

## Next steps

* [Troubleshoot gateways - Power BI](service-gateway-onprem-tshoot.md)
* [Power BI Premium](../enterprise/service-premium-what-is.md)

More questions? Try asking the [Power BI Community](https://community.powerbi.com/).
