<properties
pageTitle="Manage your enterprise data source - Analysis Services"
description="How to manage the enterprise gateway and data sources that belong to that gateway. This is for Analysis Services in both Multidimensional and Tabular mode."
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
ms.date="05/09/2016"
ms.author="asaxton"/>
# Manage your enterprise data source - Analysis Services

Once you have installed the Power BI Gateway - Enterprise, you will need to add data sources that can be used with the gateway. This article will look at how to work with gateways and data sources. You can use the Analysis Services data source either for scheduled refresh or for live connections.

<iframe width="560" height="315" src="https://www.youtube.com/embed/ownIGbcRAAU" frameborder="0" allowfullscreen></iframe>

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

You can then select the **Data Source Type** from the list. Select Analysis Services if you are connecting to either a Multidimensional or Tabular server.

![](media/powerbi-gateway-enterprise-manage/datasourcesettings2-ssas.png)

You will then want to fill in the information for the data source which includes the **Server** and the **Database**.  

The **Username** and **Password** that you enter will be used by the gateway to connect to the Analysis Services instance. 

> NOTE: The Windows account you enter must have Server Administrator permissions for the instance you are connecting to. If this account’s password is set to expire, users could get a connection error if the password isn’t updated for the data source. [Learn more](powerbi-gateway-enterprise.md#credentials)

![](media/powerbi-gateway-enterprise-manage/datasourcesettings3-ssas.png)

You can click **Add** after you have everything filled in.  You can now use this data source for scheduled refresh, or live connections, against an Analysis Services instance that is on premises.  You will see *Connection Successful* if it succeeded.

![](media/powerbi-gateway-enterprise-manage/datasourcesettings4.png)

### Advanced settings

You can configure the privacy level for your data source. This controls how data can be mashed up. This is only used for scheduled refresh. It does not apply to live connections. [Learn more](https://support.office.com/article/Privacy-levels-Power-Query-CC3EDE4D-359E-4B28-BC72-9BEE7900B540)

![](media/powerbi-gateway-enterprise-manage/datasourcesettings9.png)

## 'Get Data' experience for Analysis Services in Power BI site

A unique option for Analysis Services is to use Get Data within the Power BI service directly. You can connect to a live Analysis Services data source that is configured within the enterprise gateway without needing Power BI Desktop. Your account needs to be listed in the **Users** tab for the data source, under the gateway, for it to show up in the list. To connect to the data source, you can do the following.

1. Within the Power BI service, select **Get Data**.

2. Select **Databases**.

3. Select **SQL Server Analysis Services** > **Connect**.

4. Select a data source from the list. Any Analysis Services data source that you have access to will be listed here.

5. Select the model that you want to connect to. Then select **Connect**.

You will see a dataset show up with the name of the server. You can then select that dataset and begin to create reports on it. This will be working against live data.

## Usernames with Analysis Services

Each time a user interacts with a report connected to Analysis Services, the effective username is passed to the gateway and then onto your on-premises Analysis Services server. The email address, that you sign into Power BI with, is what we will pass to Analysis Services as the effective user. This is passed in the connection property [EffectiveUserName](https://msdn.microsoft.com/library/dn140245.aspx#bkmk_auth). This email address should match a defined UPN within the local Active Directory Domain. The UPN is a property of an Active Directory account. That Windows account then needs to be present in an Analysis Services role. If a match cannot be found, in Active Directory, the login will not be successful. [Learn more](https://msdn.microsoft.com/library/ms677605.aspx)

You can also map your Power BI sign in name with a local directory UPN. [Learn more](powerbi-gateway-enterprise-manage-ssas.md#map-user-names)

<iframe width="560" height="315" src="https://www.youtube.com/embed/Qb5EEjkHoLg" frameborder="0" allowfullscreen></iframe>

## Map user names

For Analysis Services data sources, you can configure custom User Principal Name (UPN) rules. This will help you if your Power BI service login names do not match your local directory UPN. For example, if you sign into Power BI with john@contoso.com, but your local directory UPN is john@contoso.local, you can configure a mapping rule to have john@contoso.local passed to Analysis Services.

To get to the UPN Mapping screen, do the following.

1. Go to the **gear icon** and select **Manage Gateways**.

2. Expand the gateway that contains the Analysis Services data source. Of, if you haven't created the Analysis Services data source, you can do that at this point.

3. Select the data source and then select the **Users** tab.

4. Select **Map user names**.

    ![](media/powerbi-gateway-enterprise-manage/gateway-enterprise-map-user-names.png)
    
You will then see options to add rules as well as test for a given user.

> **Note**: You may inadvertantly change a user that you didn't intend to. For example, if your **Replace (original value)** is *@contoso.com* and your **With (New name)** is *@contoso.local*, all users with a sign in that contains *@contoso.com* will then be replaced with *@contoso.local*. Also, if your **Replace (Original name)** is *dave@contoso.com* and your **With (New name)** is *dave@contoso.local*, a user with the sign in of v-dave@contoso.local would be sent as v-dave*@contoso.local*.

Currently you can only supply rules for **Effective user names**.

### Working with mapping rules

To create a mapping rule, enter a value for **Original name** and **New Name** and then select **Add**.

|Field|Description
|---|---|
|Replace (Orignal name)|The email address that you signed into Power BI with.|
|With (New Name)|The value you want to replace it with. The result of the replacement is what will be passed to the *EffectiveUserName* property for the Analysis Services connection.|

![](media/powerbi-gateway-enterprise-manage/gateway-enterprise-map-user-names-effective-user-names.png)

When you select an item in the list, you can choose to re-order it by using the **chevron icons**, or **Delete** the entry.

![](media/powerbi-gateway-enterprise-manage/gateway-enterprise-map-user-names-entry-selected.png)

### Test a mapping rule

You can validate what an original name will be replaced with by entering a value for **Original name** and selecting **Test rule**.

![](media/powerbi-gateway-enterprise-manage/gateway-enterprise-test-mapping-rule.png)

### Limitations for mapping rules

- Wildcards (\*) are not allowed.
- Mapping is for the specific data source that is being configured. It is not a global settings. If you have multiple Analysis Services data sources, you will have to map the users for each data source.

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

## See Also

[Power BI Gateway – Enterprise](powerbi-gateway-enterprise.md)

[Power BI Gateway - Enterprise in-depth](powerbi-gateway-enterprise-indepth.md)

[Upgrading the Analysis Services Connector to the Power BI Gateway - Enterprise](powerbi-gateway-enterprise-upgrade-as-connector.md)

[Troubleshooting the Power BI Gateway - Enterprise](powerbi-gateway-enterprise-tshoot.md)

[Tools for troubleshooting refresh issues](powerbi-refresh-tools-for-troubleshooting-issues.md)