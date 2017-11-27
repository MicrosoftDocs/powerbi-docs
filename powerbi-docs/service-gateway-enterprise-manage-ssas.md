---
title: Manage your data source - Analysis Services
description: How to manage the on-premises data gateway and data sources that belong to that gateway. This is for Analysis Services in both Multidimensional and Tabular mode.
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
ms.date: 10/05/2017
ms.author: davidi

---
# Manage your data source - Analysis Services
Once you have installed the on-premises data gateway, you will need to add data sources that can be used with the gateway. This article will look at how to work with gateways and data sources. You can use the Analysis Services data source either for scheduled refresh or for live connections.

<iframe width="560" height="315" src="https://www.youtube.com/embed/ownIGbcRAAU" frameborder="0" allowfullscreen></iframe>

## Download and install the gateway
You can download the gateway from the Power BI service. Select **Downloads** > **Data Gateway**, or by going to the [gateway download page](https://go.microsoft.com/fwlink/?LinkId=698861).

![](media/service-gateway-enterprise-manage-ssas/powerbi-download-data-gateway.png)

## Limitations of Analysis Services live connections
You can use a live connection against tabular or multidimensional instances.

| **Server version** | **Required SKU** |
| --- | --- |
| 2012 SP1 CU4 or later |Business Intelligence and Enterprise SKU |
| 2014 |Business Intelligence and Enterprise SKU |
| 2016 |Standard SKU or higher |

* Cell level Formatting and translation features are not supported.
* Actions and Named Sets are not exposed to Power BI, but you can still connect to multidimensional cubes that also contain Actions or Named sets and create visuals and reports.

## Add a gateway
To add a Gateway, simply [download](https://go.microsoft.com/fwlink/?LinkId=698861) and install the gateway on a server in your environment. After you have installed the gateway, it will show in the lists of gateways under **Manage gateways**.

> [!NOTE]
> **Manage gateways** will not show up until you are the admin of at least one gateway. This can happen either by being added as an admin or you installing and configuring a gateway.
> 
> 

## Remove a gateway
Removing a gateway will also delete any data sources under that gateway.  This will also break any dashboards and reports that rely on those data sources.

1. Select the gear icon ![](media/service-gateway-enterprise-manage-ssas/pbi_gearicon.png) in the upper-right corner > **Manage gateways**.
2. Gateway > **Remove**
   
   ![](media/service-gateway-enterprise-manage-ssas/datasourcesettings7.png)

## Add a data source
You can add a data source by either selecting a gateway and click **Add data source**, or go to Gateway > **Add data source**.

![](media/service-gateway-enterprise-manage-ssas/datasourcesettings1.png)

You can then select the **Data Source Type** from the list. Select Analysis Services if you are connecting to either a Multidimensional or Tabular server.

![](media/service-gateway-enterprise-manage-ssas/datasourcesettings2-ssas.png)

You will then want to fill in the information for the data source which includes the **Server** and the **Database**.  

The **Username** and **Password** that you enter will be used by the gateway to connect to the Analysis Services instance.

> [!NOTE]
> The Windows account you enter must have Server Administrator permissions for the instance you are connecting to. If this account’s password is set to expire, users could get a connection error if the password isn’t updated for the data source. For more information, see the main on-premises data gateway article to learn more about how [credentials](service-gateway-onprem.md#credentials) are stored.
> 
> 

![](media/service-gateway-enterprise-manage-ssas/datasourcesettings3-ssas.png)

You can click **Add** after you have everything filled in.  You can now use this data source for scheduled refresh, or live connections, against an Analysis Services instance that is on premises.  You will see *Connection Successful* if it succeeded.

![](media/service-gateway-enterprise-manage-ssas/datasourcesettings4.png)

### Advanced settings
You can configure the privacy level for your data source. This controls how data can be mashed up. This is only used for scheduled refresh. It does not apply to live connections. [Learn more](https://support.office.com/article/Privacy-levels-Power-Query-CC3EDE4D-359E-4B28-BC72-9BEE7900B540)

![](media/service-gateway-enterprise-manage-ssas/datasourcesettings9.png)

## 'Get Data' experience for Analysis Services in Power BI site
A unique option for Analysis Services is to use Get Data within the Power BI service directly. You can connect to a live Analysis Services data source that is configured within the gateway without needing Power BI Desktop. Your account needs to be listed in the **Users** tab for the data source, under the gateway, for it to show up in the list. To connect to the data source, you can do the following.

1. Within the Power BI service, select **Get Data**.
2. Select **Databases**.
3. Select **SQL Server Analysis Services** > **Connect**.
4. Select a data source from the list. Any Analysis Services data source that you have access to will be listed here.
5. Select the model that you want to connect to. Then select **Connect**.

You will see a dataset show up with the name of the server. You can then select that dataset and begin to create reports on it. This will be working against live data.

## Usernames with Analysis Services
Each time a user interacts with a report connected to Analysis Services, the effective username is passed to the gateway and then onto your on-premises Analysis Services server. The email address, that you sign into Power BI with, is what we will pass to Analysis Services as the effective user. This is passed in the connection property [EffectiveUserName](https://msdn.microsoft.com/library/dn140245.aspx#bkmk_auth). This email address should match a defined UPN within the local Active Directory Domain. The UPN is a property of an Active Directory account. That Windows account then needs to be present in an Analysis Services role. If a match cannot be found, in Active Directory, the login will not be successful. [Learn more](https://msdn.microsoft.com/library/ms677605.aspx)

You can also map your Power BI sign in name with a local directory UPN. [Learn more](service-gateway-enterprise-manage-ssas.md#map-user-names)

<iframe width="560" height="315" src="https://www.youtube.com/embed/Qb5EEjkHoLg" frameborder="0" allowfullscreen></iframe>

### How do I tell what my UPN is?
You may not know what your UPN is, and you may not be a domain administrator. You can use the following command from your workstation to find out the UPN for your account.

    whoami /upn

The result will look similar to an email address, but this is the UPN that is on your domain account. If you are using an Analysis Services data source for live connections, and If this doesn't match the email address you sign into Power BI with, you may want to look at how to [Map user names](#map-user-names).

## Map user names
<iframe width="560" height="315" src="https://www.youtube.com/embed/eATPS-c7YRU" frameborder="0" allowfullscreen></iframe>

You can map user names for Analysis Services in two different ways:

1. Manual user re-mapping 
2. On-premises Active Directory Property Lookup to remap AAD UPNs to Active Directory users (AD Lookup mapping)

While it's possible to perform manual mapping using the second approach, doing so would be time consuming and difficult to maintain; it's especially difficult when pattern matching doesn't suffice--such as when domain names are different between AAD and on-premises AD, or when user account names are different between AAD and AD. As such, manual mapping with the second approach is not recommended.

We describe these two approaches, in order, in the following two sections

### Manual user name re-mapping
For Analysis Services data sources, you can configure custom User Principal Name (UPN) rules. This will help you if your Power BI service login names do not match your local directory UPN. For example, if you sign into Power BI with john@contoso.com, but your local directory UPN is john@contoso.local, you can configure a mapping rule to have john@contoso.local passed to Analysis Services.

To get to the UPN Mapping screen, do the following.

1. Go to the **gear icon** and select **Manage Gateways**.
2. Expand the gateway that contains the Analysis Services data source. Or, if you haven't created the Analysis Services data source, you can do that at this point.
3. Select the data source and then select the **Users** tab.
4. Select **Map user names**.
   
    ![](media/service-gateway-enterprise-manage-ssas/gateway-enterprise-map-user-names_02.png)

You will then see options to add rules as well as test for a given user.

> [!NOTE]
> You may inadvertently change a user that you didn't intend to. For example, if your **Replace (original value)** is *@contoso.com* and your **With (New name)** is *@contoso.local*, all users with a sign in that contains *@contoso.com* will then be replaced with *@contoso.local*. Also, if your **Replace (Original name)** is *dave@contoso.com* and your **With (New name)** is *dave@contoso.local*, a user with the sign in of v-dave@contoso.com would be sent as v-dave*@contoso.local*.
> 
> 

### AD lookup mapping
To perform on-premises AD property lookup to re-map AAD UPNs to Active Directory users, follow the steps in this section. To begin with, let's review how this works.

In the **Power BI service** the following occurs:

- For each query by a Power BI AAD user to an on-premises SSAS server, a UPN string is passed along, such as: 
       firstName.lastName@contoso.com

> [!NOTE]
> Any manual UPN user mappings defined in the Power BI data source configuration are still applied *before* sending the user name string to the on-premises data gateway.
> 
> 

On the on-premises data gateway with configurable Custom User Mapping, do the following:

1. Find Active Directory to search (automatic, or configurable)
2. Look up the attribute of the AD Person (such as *Email*) based on incoming UPN string (“firstName.lastName@contoso.com”) from the **Power BI service**.
3. If the AD Lookup fails, it attempts to use the passed-along UPN as EffectiveUser to SSAS.
4. If the AD Lookup succeeds, it retrieves *UserPrincipalName* of that AD Person. 
5. It passes the *UserPrincipalName* email as *EffectiveUser* to SSAS, such as: *Alias@corp.on-prem.contoso*

How to configure your gateway to perform the AD Lookup:

1. Download and install the latest gateway
2. In the gateway, you need to change the **on-premises data gateway service** to run with a domain account (instead of a local service account – otherwise the AD lookup won’t work properly at runtime). You'll need to restart the Gateway service for the change to take effect.  Go to the Gateway app on your machine (search for “on-premises data gateway”). To do this, go to **Service settings > Change service account**. Make sure you have the recovery key for this gateway, since you'll need to restore it on the same machine unless you want to create a new gateway instead. 
3. Navigate to the gateway’s installation folder, *C:\Program Files\On-premises data gateway* as an administrator, to ensure that you have write-permissions, and edit the following file:
   
       Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config 
4. Edit the following two configuration values according to *your* Active Directory attribute configurations of your AD users. The configuration values shown below are just examples – you need to specify them based on your Active Directory configuration. 
   
   ![](media/service-gateway-enterprise-manage-ssas/gateway-enterprise-map-user-names_03.png)
5. Restart the **on-premises data gateway** service for the configuration change to take effect.

### Working with mapping rules
To create a mapping rule, enter a value for **Original name** and **New Name** and then select **Add**.

| Field | Description |
| --- | --- |
| Replace (Original name) |The email address that you signed into Power BI with. |
| With (New Name) |The value you want to replace it with. The result of the replacement is what will be passed to the *EffectiveUserName* property for the Analysis Services connection. |

![](media/service-gateway-enterprise-manage-ssas/gateway-enterprise-map-user-names-effective-user-names.png)

When you select an item in the list, you can choose to re-order it by using the **chevron icons**, or **Delete** the entry.

![](media/service-gateway-enterprise-manage-ssas/gateway-enterprise-map-user-names-entry-selected.png)

### Using wildcard (*)
You can use a wildcard for your **Replace (Original name)** string. It can only be used on its own and not with any other string part. This will allow you to take all users and pass a single value to the data source. This is useful when you want all users in your organization to use the same user in your local environment.

### Test a mapping rule
You can validate what an original name will be replaced with by entering a value for **Original name** and selecting **Test rule**.

![](media/service-gateway-enterprise-manage-ssas/gateway-enterprise-test-mapping-rule.png)

> [!NOTE]
> Rules that are saved will take a few minutes for the service to start using them. Within the browser, the rule will work immediately.
> 
> 

### Limitations for mapping rules
* Mapping is for the specific data source that is being configured. It is not a global settings. If you have multiple Analysis Services data sources, you will have to map the users for each data source.

## Remove a data source
Removing a data source will break any dashboards or reports that rely on the given data source.  

To remove a data source, go to Data Source > **Remove**.

![](media/service-gateway-enterprise-manage-ssas/datasourcesettings6.png)

## Manage administrators
On the Administrators tab for the gateway, you can add and remove users (or security groups) that can administer the gateway.

![](media/service-gateway-enterprise-manage-ssas/datasourcesettings8.png)

## Manage users
On the Users tab for the data source, you can add, and remove, users, or security groups, that can use this data source.

> [!NOTE]
> The users list only controls who are allowed to publish reports. The report owners can create dashboards, or content packs, and share those with other users.
> 
> 

![](media/service-gateway-enterprise-manage-ssas/datasourcesettings5.png)

## Using the data source
After you have created the data source, it will be available to use with either live connections, or through scheduled refresh.

> [!NOTE]
> Server and database name have to match between Power BI Desktop and the data source within the on-premises data gateway!
> 
> 

The link between your dataset and the data source within the gateway is based on your server name and database name. These have to match. For example, if you supply an IP Address for the server name, within Power BI Desktop, you will need to use the IP Address for the data source within the gateway configuration. If you use *SERVER\INSTANCE*, in Power BI Desktop, you will need to use the same within the data source configured for the gateway.

This is the case for both live connections and scheduled refresh.

### Using the data source with live connections
You will need to make sure the server and database name matches between Power BI Desktop and the configured data source for the gateway. You will also need to make sure your user is listed in the **Users** tab of the data source in order to publish live connection datasets. The selection, for live connections, occurs within Power BI Desktop when you first import data.

After you publish, either from Power BI Desktop or **Get Data**, your reports should start working. It may take several minutes, after creating the data source within the gateway, for the connection to be usable.

### Using the data source with scheduled refresh
If you are listed in the **Users** tab of the data source configured within the gateway, and the server and database name match, you will see the gateway as an option to use with scheduled refresh.

![](media/service-gateway-enterprise-manage-ssas/powerbi-gateway-enterprise-schedule-refresh.png)

## Next steps
[On-premises data gateway](service-gateway-onprem.md)  
[On-premises data gateway - in-depth](service-gateway-onprem-indepth.md)  
[Troubleshooting the on-premises data gateway](service-gateway-onprem-tshoot.md)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)

