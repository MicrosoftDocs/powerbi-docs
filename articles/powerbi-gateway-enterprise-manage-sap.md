<properties
pageTitle="Manage your enterprise data source - SAP HANA"
description="How to manage the enterprise gateway and data sources that belong to that gateway. This article is specific to SAP HANA."
services="powerbi"
documentationCenter=""
authors="guyinacube"
manager="mblythe"
backup=""
editor=""
tags=""
qualityFocus="no"
qualityDate=""/>

<tags
ms.service="powerbi"
ms.devlang="NA"
ms.topic="article"
ms.tgt_pltfrm="na"
ms.workload="powerbi"
ms.date="05/16/2016"
ms.author="asaxton"/>
# Manage your enterprise data source - SAP HANA

Once you have installed the Power BI Gateway - Enterprise, you will need to add data sources that can be used with the gateway. This article will look at how to work with gateways and data sources. You can use the SAP HANA data source either for scheduled refresh or for DirectQuery.

## Download and install the gateway

Download and install the latest version of the [Power BI Gateway - Enterprise](https://go.microsoft.com/fwlink/?LinkId=698863).

Or, from the Power BI service, select **Downloads** > **Power BI Gateways**.

![](media/powerbi-gateway-enterprise/powerbi-gateway-enterprise-download.png)

## Add a gateway

To add a Gateway, simply [download](https://go.microsoft.com/fwlink/?LinkId=698863) and install the enterprise gateway on a server in your environment. After you have installed the gateway, it will show in the lists of gateways under **Manage gateways**.

> NOTE: **Manage gateways** will not show up until you are the admin of at least one gateway. This can happen either by being added as an admin or you installing and configuring a gateway.

## Remove a gateway

Removing a gateway will also delete any data sources under that gateway.  This will also break any dashboards and reports that rely on those data sources.

1.	Select the gear icon ![](media/powerbi-gateway-enterprise-manage/pbi_gearicon.png) in the upper-right corner > **Manage gateways**.

2.	Gateway > **Remove**

    ![](media/powerbi-gateway-enterprise-manage/datasourcesettings7.png)

## Add a data source

You can add a data source by either selecting a gateway and click **Add data source**, or go to Gateway > **Add data source**.

![](media/powerbi-gateway-enterprise-manage/datasourcesettings1.png)

You can then select the **Data Source Type** from the list.

![](media/powerbi-gateway-enterprise-manage/datasourcesettings2-sap.png)

You will then want to fill in the information for the data source which includes the **Server**, **Username** and **Password**. 

> NOTE: All queries to the data source will run using these credentials. [Learn more](powerbi-gateway-enterprise.md#credentials)

![](media/powerbi-gateway-enterprise-manage/datasourcesettings3-sap.png)

You can click **Add** after you have everything filled in.  You can now use this data source for scheduled refresh, or DirectQuery, against a SAP HANA server that is on-premises. You will see *Connection Successful* if it succeeded.

![](media/powerbi-gateway-enterprise-manage/datasourcesettings4.png)

### Advanced settings

You can configure the privacy level for your data source. This controls how data can be mashed up. This is only used for scheduled refresh. It does not apply to DirectQuery. [Learn more](https://support.office.com/article/Privacy-levels-Power-Query-CC3EDE4D-359E-4B28-BC72-9BEE7900B540)

![](media/powerbi-gateway-enterprise-manage/datasourcesettings9.png)

## Remove a data source

Removing a data source will break any dashboards or reports that rely on the given data source.  

To remove a Data Source, go to the Data Source > **Remove**.

![](media/powerbi-gateway-enterprise-manage/datasourcesettings6.png)

## Manage administrators

On the Administrators tab, for the gateway, you can add, and remove, users that can administer the gateway. You can only add users at this time. Security groups cannot be added.

![](media/powerbi-gateway-enterprise-manage/datasourcesettings8.png)

## Manage users

On the Users tab, for the data source, you can add, and remove, users, or security groups, that can use this data source.

> NOTE: The users list only controls who are allowed to publish reports. The report owners can create dashboards, or content packs, and share those with other users.

![](media/powerbi-gateway-enterprise-manage/datasourcesettings5.png)

## Using the data source

After you have created the data source, it will be available to use with either DirectQuery connections, or through scheduled refresh. 

> **Note**: Server and database name have to match between Power BI Desktop and the data source within the enterprise gateway!

The link between your dataset and the data source within the enterprise gateway is based on your server name and database name. These have to match. For example, if you supply an IP Address for the server name, within Power BI Desktop, you will need to use the IP Address for the data source within the enterprise gateway configuration. If you use *SERVER\INSTANCE*, in Power BI Desktop, you will need to use the same within the data source configured for the enterprise gateway.

This is the case for both DirectQuery and scheduled refresh.

### Using the data source with DirectQuery connections

You will need to make sure the server and database name matches between Power BI Desktop and the configured data source for the enterprise gateway. You will also need to make sure your user is listed in the **Users** tab of the data source in order to publish DirectQuery datasets. The selection, for DirectQuery, occurs within Power BI Desktop when you first import data. [Learn more](powerbi-desktop-use-directquery.md)

After you publish, either from Power BI Desktop or **Get Data**, your reports should start working. It may take several minutes, after creating the data source within the enterprise gateway, for the connection to be usable.

### Using the data source with scheduled refresh

If you are listed in the **Users** tab of the data source configured within the enterprise gateway, and the server and database name match, you will see the enterprise gateway as an option to use with scheduled refresh.

![](media/powerbi-gateway-enterprise-manage/powerbi-gateway-enterprise-schedule-refresh.png)

## See Also

[Power BI Gateway – Enterprise](powerbi-gateway-enterprise.md)

[Power BI Gateway - Enterprise in-depth](powerbi-gateway-enterprise-indepth.md)

[Troubleshooting the Power BI Gateway - Enterprise](powerbi-gateway-enterprise-tshoot.md)

[Tools for troubleshooting refresh issues](powerbi-refresh-tools-for-troubleshooting-issues.md)