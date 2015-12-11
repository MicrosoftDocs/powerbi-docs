<properties
pageTitle="Manage your enterprise data source - Analysis Services"
description="How to manage the enterprise gateway and data sources that belong to that gateway. This is for Analysis Services in both Multidimensional and Tabular mode."
services="powerbi"
documentationCenter=""
authors="guyinacube"
manager="mblythe"
editor=""/>

<tags
ms.service="powerbi"
ms.devlang="NA"
ms.topic="article"
ms.tgt_pltfrm="na"
ms.workload="powerbi"
ms.date="12/14/2015"
ms.author="asaxton"/>
# Manage your enterprise data source - SQL Server

Once you have installed the Power BI Gateway - Enterprise (Preview), you will need to add data sources that can be used with the gateway. This article will look at how to work with gateways and data sources.

## Add a gateway

To add a Gateway, simply [download](https://go.microsoft.com/fwlink/?LinkId=698863) and install the enterprise gateway on a server in your environment. After you have installed the gateway, it will show in the lists of gateways under **Manage gateways**.

> NOTE: **Manage gateways** will not show up until you are the admin of at least one gateway. This can happen either by being added as an admin or you installing and configuring a gateway.

## Remove a gateway

Removing a gateway will also delete any data sources under that gateway.  This will also break any dashboards and reports that rely on those data sources.

1.	Select the gear icon ![](media/powerbi-gateway-enterprise-manage-sql/pbi_gearicon.png) in the upper-right corner > **Manage gateways**.

2.	Gateway > **Remove**

    ![](media/powerbi-gateway-enterprise-manage-sql/datasourcesettings7-ssas.png)

## Add a data source

You can add a data source by either selecting a gateway and click **Add data source**, or go to Gateway > **Add data source**.

![](media/powerbi-gateway-enterprise-manage-sql/datasourcesettings1.png)

You can then select the **Data Source Type** from the list. Select Analysis Services if you are connecting to either a Multidimensional or Tabular server.

![](media/powerbi-gateway-enterprise-manage-sql/datasourcesettings2-ssas.png)

You will then want to fill in the information for the data source which includes the **Server** and the **Database**.  

The **Username** and **Password** that you enter will be used by the gateway to connect to the Analysis Services instance. 

> NOTE: The Windows account you enter must have Server Administrator permissions for the instance you are connecting to. If this account’s password is set to expire, users could get a connection error if the password isn’t updated for the data source. [Learn more](powerbi-gateway-enterprise.md#credentials)

When a user interacts with a report in Power BI, such as click on a chart, select a filter, or adds a new field, a query is created by Power BI and sent along with an effective username to the Analysis Services instance.

![](media/powerbi-gateway-enterprise-manage-sql/datasourcesettings3-ssas.png)

You can click **Add** after you have everything filled in.  You can now use this data source for live queries against an Analysis Services instance that is on premises.  You will see *Connection Successful* if it succeeded.

![](media/powerbi-gateway-enterprise-manage-sql/datasourcesettings4-ssas.png)

## Remove a data source

Removing a data source will break any dashboards or reports that rely on the given data source.  

To remove a Data Source, go to the Data Source > **Remove**.

![](media/powerbi-gateway-enterprise-manage-sql/datasourcesettings6-ssas.png)

## Manage administrators

On the Administrators tab, for the gateway, you can add, and remove, users that can administer the gateway. You can only add users at this time. Security groups cannot be added.

![](media/powerbi-gateway-enterprise-manage-sql/datasourcesettings8.png)

## Manage users

On the Users tab, for the data source, you can add, and remove, users that can use this gateway. You can only add users at this time. Security groups cannot be added.

![](media/powerbi-gateway-enterprise-manage-sql/datasourcesettings5.png)

## See Also

[Power BI Gateway – Enterprise (Preview)](powerbi-gateway-enterprise.md)

[Troubleshooting the Power BI Gateway - Enterprise (Preview)](powerbi-gateway-enterprise-tshoot.md)

[Tools for troubleshooting refresh issues](powerbi-refresh-tools-for-troubleshooting-issues.md)