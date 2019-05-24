---
title: Manage your data source - Import/Scheduled Refresh
description: How to manage the On-premises data gateway and data sources that belong to that gateway. This article is specific to data sources that can be used with import/scheduled refresh.
author: mgblythe
manager: kfile
ms.reviewer: kayu

ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: conceptual
ms.date: 12/06/2017
ms.author: mblythe

LocalizationGroup: Gateways
---
# Manage your data source - Import/Scheduled Refresh
Once you have installed the On-premises data gateway, you will need to add data sources that can be used with the gateway. This article will look at how to work with gateways and data sources that are used for scheduled refresh as opposed to DirectQuery or live connections.

## Download and install the gateway
You can download the gateway from the Power BI service. Select **Downloads** > **Data Gateway**, or by going to the [gateway download page](https://go.microsoft.com/fwlink/?LinkId=698861).

![](media/service-gateway-enterprise-manage-scheduled-refresh/powerbi-download-data-gateway.png)

## Add a gateway
To add a gateway, simply [download](https://go.microsoft.com/fwlink/?LinkId=698863) and install the enterprise gateway on a server in your environment. After you have installed the gateway, it will show in the lists of gateways under **Manage gateways**.

> [!NOTE]
> **Manage gateways** will not show up until you are the admin of at least one gateway. This can happen either by being added as an admin or you installing and configuring a gateway.
> 
> 

## Remove a gateway
Removing a gateway will also delete any data sources under that gateway.  This will also break any dashboards and reports that rely on those data sources.

1. Select the gear icon ![](media/service-gateway-enterprise-manage-scheduled-refresh/pbi_gearicon.png) in the upper-right corner > **Manage gateways**.
2. Gateway > **Remove**
   
   ![](media/service-gateway-enterprise-manage-scheduled-refresh/datasourcesettings7.png)

## Add a data source
You can add a data source by either selecting a gateway and click **Add data source**, or go to Gateway > **Add data source**.

![](media/service-gateway-enterprise-manage-scheduled-refresh/datasourcesettings1.png)

You can then select the **Data Source Type** from the list. All of the data sources listed can be used for scheduled refresh with the enterprise gateway. Analysis Services, SQL Server and SAP HANA can be used for either scheduled refresh, or DirectQuery/live connections.

![](media/service-gateway-enterprise-manage-scheduled-refresh/datasourcesettings2.png)

You will then want to fill in the information for the data source which includes the source information and credentials used to access the data source.

> [!NOTE]
> All queries to the data source will run using these credentials. For more information, see the main On-premises data gateway article to learn more about how [credentials](service-gateway-onprem.md#credentials) are stored.
> 
> 

![](media/service-gateway-enterprise-manage-scheduled-refresh/datasourcesettings3-oracle.png)

You can click **Add** after you have everything filled in.  You can now use this data source for scheduled refresh with your on-premises data. You will see *Connection Successful* if it succeeded.

![](media/service-gateway-enterprise-manage-scheduled-refresh/datasourcesettings4.png)

<!-- Shared Install steps Include -->
[!INCLUDE [gateway-onprem-datasources-include](./includes/gateway-onprem-datasources-include.md)]

### Advanced settings
You can configure the privacy level for your data source. This controls how data can be mashed up. This is only used for scheduled refresh. [Learn more](https://support.office.com/article/Privacy-levels-Power-Query-CC3EDE4D-359E-4B28-BC72-9BEE7900B540)

![](media/service-gateway-enterprise-manage-scheduled-refresh/datasourcesettings9.png)

## Remove a data source
Removing a data source will break any dashboards or reports that rely on the given data source.  

To remove a Data Source, go to the Data Source > **Remove**.

![](media/service-gateway-enterprise-manage-scheduled-refresh/datasourcesettings6.png)

## Manage administrators
On the Administrators tab, for the gateway, you can add, and remove, users that can administer the gateway. You can only add users at this time. Security groups cannot be added.

![](media/service-gateway-enterprise-manage-scheduled-refresh/datasourcesettings8.png)

## Manage users
On the Users tab, for the data source, you can add, and remove, users, or security groups, that can use this data source.

> [!NOTE]
> The users list only controls who are allowed to publish reports. The report owners can create dashboards, or content packs, and share those with other users.
> 
> 

![](media/service-gateway-enterprise-manage-scheduled-refresh/datasourcesettings5.png)

## Using the data source for scheduled refresh
After you have created the data source, it will be available to use with either DirectQuery connections, or through scheduled refresh.

> [!NOTE]
> Server and database name have to match between Power BI Desktop and the data source within the On-premises data gateway!
> 
> 

The link between your dataset and the data source within the gateway is based on your server name and database name. These have to match. For example, if you supply an IP Address for the server name, within Power BI Desktop, you will need to use the IP Address for the data source within the gateway configuration. If you use *SERVER\INSTANCE*, in Power BI Desktop, you will need to use the same within the data source configured for the gateway.

If you are listed in the **Users** tab of the data source configured within the gateway, and the server and database name match, you will see the gateway as an option to use with scheduled refresh.

![](media/service-gateway-enterprise-manage-scheduled-refresh/powerbi-gateway-enterprise-schedule-refresh.png)

> [!WARNING]
> If your dataset contains multiple data sources, each data source must be added within the gateway. If one or more data sources are not added to the gateway, you will not see the gateway as available for scheduled refresh.
> 
> 

## Limitations
* OAuth is not a supported authentication scheme with the On-premises data gateway. You cannot add data sources that require OAuth. If your dataset has a data source requiring OAuth, you will not be able to use the gateway for scheduled refresh.

## Next steps
[On-premises data gateway](service-gateway-onprem.md)  
[On-premises data gateway - in-depth](service-gateway-onprem-indepth.md)  
[Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)

