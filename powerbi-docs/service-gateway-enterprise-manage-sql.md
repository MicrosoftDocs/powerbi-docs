---
title: Manage your data source - SQL
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
# Manage your data source - SQL Server

[!INCLUDE [gateway-rewrite](includes/gateway-rewrite.md)]

After you [install the on-premises data gateway](/data-integration/gateway/service-gateway-install), you can [add data sources](service-gateway-data-sources.md#add-a-data-source) that can be used with the gateway. This article looks at how to work with gateways and SQL Server data sources that are used either for scheduled refresh or for DirectQuery.

## Add a data source

For more information about how to add a data source, see [Add a data source](service-gateway-data-sources.md#add-a-data-source). Under **Data Source Type**, select **SQL Server**.

![Select the SQL Server data source](media/service-gateway-enterprise-manage-sql/datasourcesettings2.png)

> [!NOTE]
> When you use DirectQuery, the gateway supports only **SQL Server 2012 SP1** and subsequent versions.

Then fill in the information for the data source, which includes **Server** and **Database**. 

Under **Authentication Method**, choose either **Windows** or **Basic**. Choose **Basic** if you plan to use SQL authentication instead of Windows authentication. Then enter the credentials to be used for this data source.

> [!NOTE]
> All queries to the data source will run using these credentials, unless Kerberos single sign-on (SSO) is configured and enabled for the data source. With SSO, import datasets use the stored credentials, but DirectQuery datasets use the current Power BI user to execute the queries using SSO. To learn more about how credentials are stored, see [Store encrypted credentials in the cloud](service-gateway-data-sources.md#store-encrypted-credentials-in-the-cloud). Or, see the article that describes how to [use Kerberos for single sign-on (SSO) from Power BI to on-premises data sources](service-gateway-sso-kerberos.md).

![Filling in the data source settings](media/service-gateway-enterprise-manage-sql/datasourcesettings3.png)

After you fill in everything, select **Add**. You can now use this data source for scheduled refresh or DirectQuery against a SQL Server that's on-premises. You see *Connection Successful* if it succeeded.

![Displaying the connection status](media/service-gateway-enterprise-manage-sql/datasourcesettings4.png)

### Advanced settings

Optionally, you can configure the privacy level for your data source. This setting controls how data can be combined. It's only used for scheduled refresh. The privacy-level setting doesn't apply to DirectQuery. To learn more about privacy levels for your data source, see [Privacy levels (Power Query)](https://support.office.com/article/Privacy-levels-Power-Query-CC3EDE4D-359E-4B28-BC72-9BEE7900B540).

![Setting the privacy level](media/service-gateway-enterprise-manage-sql/datasourcesettings9.png)

## Use the data source

After you create the data source, it's available to use with either DirectQuery connections or through scheduled refresh.

> [!NOTE]
> The server and database names must match between Power BI Desktop and the data source within the on-premises data gateway.

The link between your dataset and the data source within the gateway is based on your server name and database name. These names must match. For example, if you supply an IP address for the server name within Power BI Desktop, you must use the IP address for the data source within the gateway configuration. If you use *SERVER\INSTANCE* in Power BI Desktop, you must use it within the data source configured for the gateway.

This requirement is the case for both DirectQuery and scheduled refresh.

### Use the data source with DirectQuery connections

Make sure that the server and database names match between Power BI Desktop and the configured data source for the gateway. You also need to make sure your user is listed in the **Users** tab of the data source to publish DirectQuery datasets. The selection for DirectQuery occurs within Power BI Desktop when you first import data. For more information about how to use DirectQuery, see [Use DirectQuery in Power BI Desktop](desktop-use-directquery.md).

After you publish, either from Power BI Desktop or **Get Data**, your reports should start to work. It might take several minutes after you create the data source within the gateway for the connection to be usable.

### Use the data source with scheduled refresh

If you're listed in the **Users** tab of the data source configured within the gateway and the server name and database name match, you see the gateway as an option to use with scheduled refresh.

![Displaying the users](media/service-gateway-enterprise-manage-sql/powerbi-gateway-enterprise-schedule-refresh.png)

## Next steps

* [Connect to on-premises data in SQL Server](service-gateway-sql-tutorial.md)
* [Troubleshooting the on-premises data gateway](/data-integration/gateway/service-gateway-tshoot)
* [Troubleshoot gateways - Power BI](service-gateway-onprem-tshoot.md)
* [Use Kerberos for single sign-on (SSO) from Power BI to on-premises data sources](service-gateway-sso-kerberos.md)

More questions? Try asking the [Power BI Community](http://community.powerbi.com/).

