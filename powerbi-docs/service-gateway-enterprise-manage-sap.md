---
title: Manage your SAP HANA data source
description: How to manage the On-premises data gateway and data sources that belong to that gateway. This article is specific to SAP HANA. 
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: conceptual
ms.date: 01/24/2018
ms.author: mblythe

LocalizationGroup: Gateways
---
# Manage your SAP HANA data source
Once you have installed the On-premises data gateway , you will need to add data sources that can be used with the gateway. This article will look at how to work with gateways and data sources. You can use the SAP HANA data source either for scheduled refresh or for DirectQuery.

## Download and install the gateway
You can download the gateway from the Power BI service. Select **Downloads** > **Data Gateway**, or by going to the [gateway download page](https://go.microsoft.com/fwlink/?LinkId=698861).

![](media/service-gateway-enterprise-manage-sap/powerbi-download-data-gateway.png)

## Add a gateway
To add a Gateway, simply [download](https://go.microsoft.com/fwlink/?LinkId=698861) and install the gateway on a server in your environment. After you have installed the gateway, it will show in the lists of gateways under **Manage gateways**.

> [!NOTE]
> **Manage gateways** will not show up until you are the admin of at least one gateway. This can happen either by being added as an admin or you installing and configuring a gateway.
> 
> 

## Remove a gateway
Removing a gateway will also delete any data sources under that gateway.  This will also break any dashboards and reports that rely on those data sources.

1. Select the gear icon ![](media/service-gateway-enterprise-manage-sap/pbi_gearicon.png) in the upper-right corner > **Manage gateways**.
2. Gateway > **Remove**
   
   ![](media/service-gateway-enterprise-manage-sap/datasourcesettings7.png)

## Add a data source
You can add a data source by either selecting a gateway and click **Add data source**, or go to Gateway > **Add data source**.

![](media/service-gateway-enterprise-manage-sap/datasourcesettings1.png)

You can then select the **Data Source Type** from the list.

![](media/service-gateway-enterprise-manage-sap/datasourcesettings2-sap.png)

You will then want to fill in the information for the data source which includes the **Server**, **Username** and **Password**.

> [!NOTE]
> All queries to the data source will run using these credentials. For more information, see the main On-premises data gateway article to learn more about how [credentials](service-gateway-onprem.md#credentials) are stored.
> 
> 

![](media/service-gateway-enterprise-manage-sap/datasourcesettings3-sap.png)

You can click **Add** after you have everything filled in.  You can now use this data source for scheduled refresh, or DirectQuery, against a SAP HANA server that is on-premises. You will see *Connection Successful* if it succeeded.

![](media/service-gateway-enterprise-manage-sap/datasourcesettings4.png)

### Advanced settings
You can configure the privacy level for your data source. This controls how data can be mashed up. This is only used for scheduled refresh. It does not apply to DirectQuery. [Learn more](https://support.office.com/article/Privacy-levels-Power-Query-CC3EDE4D-359E-4B28-BC72-9BEE7900B540)

![](media/service-gateway-enterprise-manage-sap/datasourcesettings9.png)

## Remove a data source
Removing a data source will break any dashboards or reports that rely on the given data source.  

To remove a Data Source, go to the Data Source > **Remove**.

![](media/service-gateway-enterprise-manage-sap/datasourcesettings6.png)

## Manage administrators
On the Administrators tab for the gateway, you can add and remove users (or security groups) that can administer the gateway.

![](media/service-gateway-enterprise-manage-sap/datasourcesettings8.png)

## Manage users
On the Users tab, for the data source, you can add, and remove, users, or security groups, that can use this data source.

> [!NOTE]
> The users list only controls who are allowed to publish reports. The report owners can create dashboards, or content packs, and share those with other users.
> 
> 

![](media/service-gateway-enterprise-manage-sap/datasourcesettings5.png)

## Using the data source
After you have created the data source, it will be available to use with either DirectQuery connections, or through scheduled refresh.

> [!NOTE]
> Server and database name have to match between Power BI Desktop and the data source within the On-premises data gateway!
> 
> 

The link between your dataset and the data source within the gateway is based on your server name and database name. These have to match. For example, if you supply an IP Address for the server name, within Power BI Desktop, you will need to use the IP Address for the data source within the gateway configuration. If you use *SERVER\INSTANCE*, in Power BI Desktop, you will need to use the same within the data source configured for the gateway.

This is the case for both DirectQuery and scheduled refresh.

### Using the data source with DirectQuery connections
You will need to make sure the server and database name matches between Power BI Desktop and the configured data source for the gateway. You will also need to make sure your user is listed in the **Users** tab of the data source in order to publish DirectQuery datasets. The selection for DirectQuery occurs within Power BI Desktop when you first import data. [Learn more](desktop-use-directquery.md)

After you publish, either from Power BI Desktop or **Get Data**, your reports should start working. It may take several minutes, after creating the data source within the gateway, for the connection to be usable.

### Using the data source with scheduled refresh
If you are listed in the **Users** tab of the data source configured within the gateway, and the server and database name match, you will see the gateway as an option to use with scheduled refresh.

![](media/service-gateway-enterprise-manage-sap/powerbi-gateway-enterprise-schedule-refresh.png)

## Next steps
[On-premises data gateway](service-gateway-onprem.md)  
[On-premises data gateway - in-depth](service-gateway-onprem-indepth.md)  
[Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)

