---
title: Manage SQL Server Analysis Services data sources
description: Learn how to manage SQL Server Analysis Services (SSAS) data sources in both multidimensional and tabular mode for the on-premises data gateway.
author: arthiriyer
ms.author: arthii
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 02/15/2023
ms.custom: video-Qb5EEjkHoLg, video-eATPS-c7YRU
LocalizationGroup: Gateways
---
# Manage SQL Server Analysis Services data sources

[!INCLUDE [gateway-rewrite](../includes/gateway-rewrite.md)]

After you [install an on-premises data gateway](/data-integration/gateway/service-gateway-install), you can [add data sources](service-gateway-data-sources.md#add-a-data-source) to use with the gateway. This article describes how to add a SQL Server Analysis Services (SSAS) data source to your on-premises gateway to use for scheduled refresh or for live connections.

To learn more about how to set up a live connection to SSAS, watch this [Power BI Walkthrough: Analysis Services Live Connect](https://www.youtube.com/watch?v=GPf0YS-Xbyo&feature=youtu.be) video.

> [!NOTE]
> If you have an Analysis Services data source, you need to install the gateway on a computer joined to the same forest or domain as your Analysis Services server.

> [!NOTE]
> The gateway supports only Windows authentication for Analysis Services.

## Add a data source

To connect to either a multidimensional or tabular Analysis Services data source:

1. On the **New connection** screen for your on-premises data gateway, select **Analysis Services** for **Connection type**. For more information about how to add a data source, see [Add a data source](service-gateway-data-sources.md#add-a-data-source).

   :::image type="content" source="media/service-gateway-enterprise-manage-ssas/new-data-source.png" alt-text=" Screenshot of adding the Analysis Services data type." :::

1. Fill in the information for the data source, which includes **Server** and **Database**. The gateway uses the information you enter for **Username** and **Password** to connect to the Analysis Services instance.

   :::image type="content" source="media/service-gateway-enterprise-manage-ssas/data-source-credentials.png" alt-text=" Screenshot that shows the data source credentials settings." :::

   > [!NOTE]
   > The Windows account you enter must be a member of the Server Administrator role on the Analysis Services instance you're connecting to. If this account's password is set to expire, users get a connection error unless you update the data source password. For more information about how credentials are stored, see [Store encrypted credentials in the cloud](service-gateway-data-sources.md#store-encrypted-credentials-in-the-cloud).
   
1. Configure the **Privacy level** for your data source. This setting controls how data can be combined for scheduled refresh. The privacy-level setting doesn't apply to live connections. To learn more about privacy levels for your data source, see [Set privacy levels (Power Query)](https://support.office.com/article/Privacy-levels-Power-Query-CC3EDE4D-359E-4B28-BC72-9BEE7900B540).

   :::image type="content" source="media/service-gateway-enterprise-manage-ssas/privacy-level-setting.png" alt-text="Screenshot of the Privacy level setting." :::

1. Optionally, you can configure user name mapping now. For instructions, see [Manual user name remapping](#manual-user-name-remapping).

1. After you complete all the fields, select **Create**.

You can now use this data source for scheduled refresh or live connections against an on-premises Analysis Services instance.

## User names for Analysis Services

To learn about authentication with Analysis Services live connections in Power BI, watch this video:

> [!NOTE]  
> This video might use earlier versions of Power BI Desktop or the Power BI service.

> [!VIDEO https://www.youtube.com/embed/Qb5EEjkHoLg]

Each time a user interacts with a report connected to Analysis Services, the effective user name passes to the gateway and then passes on to your on-premises Analysis Services server. The email address that you use to sign in to Power BI passes to Analysis Services as the effective user in the [EffectiveUserName](/analysis-services/instances/connection-string-properties-analysis-services#effectiveusername) connection property.

The email address must match a defined user principal name (UPN) within the local Active Directory (AD) domain. The UPN is a property of an AD account. The Windows account must be present in an Analysis Services role. If a match can't be found in AD, the sign-in isn't successful. To learn more about AD and user naming, see [User naming attributes](/windows/win32/ad/naming-properties).

## Map user names for Analysis Services data sources

You can also map your Power BI sign-in name to a local directory UPN. To learn about UPN mapping in Power BI, watch this video:

> [!NOTE]  
> This video might use earlier versions of Power BI Desktop or the Power BI service.

> [!VIDEO https://www.youtube.com/embed/eATPS-c7YRU]

Power BI allows mapping user names for Analysis Services data sources. You can configure rules to map a Power BI sign-in user name to an `EffectiveUserName` that passes to the Analysis Services connection. This feature is a great workaround when your Microsoft Entra user name doesn't match a UPN in your local Active Directory instance. For example, if your email address is `meganb@contoso.onmicrosoft.com`, you can map it to `meganb@contoso.com`, and that value passes on to the gateway.

You can map user names for Analysis Services in two different ways:

- Manual user remapping in Power BI
- Active Directory lookup mapping, which uses on-premises AD property lookup to remap Microsoft Entra UPNs to on-premises AD users.

Manual mapping by using on-premises AD property lookup is possible, but is time consuming and difficult to maintain, especially when pattern matching isn't enough. For example, domain names or user account names might be different between Microsoft Entra ID and on-premises AD. Therefore, manual mapping with the second approach isn't recommended.

The following sections describe the two mapping approaches.

<a name="manual-user-name-remapping"></a>
### Manual user remapping in Power BI

You can configure custom UPN rules in Power BI for Analysis Services data sources. Custom rules help if your Power BI service sign-in name doesn't match your local directory UPN. For example, if you sign in to Power BI with `meganb@contoso.com` but your local directory UPN is `meganb@contoso.local`, you can configure a mapping rule to pass `meganb@contoso.local` to Analysis Services.

> [!IMPORTANT]
> The mapping works for the specific data source that's being configured. It's not a global setting. If you have multiple Analysis Services data sources, you have to map the users for each data source.

To do manual UPN mapping, follow these steps:

1. Under the Power BI gear icon, select **Manage gateways and connections**.
1. Select the data source, and then select **Settings** from the top menu.
1. On the **Settings** screen, in the **Map user names** box, make sure **EffectiveUserName** is selected and then select **Add new rule**.

   :::image type="content" source="media/service-gateway-enterprise-manage-ssas/map-user-names.png" alt-text=" Screenshot of the UPN mapping screen.":::

1. Under **Map user names**, for each user name to map, enter values for **Original name** and **New name**, and then select **Add new rule**. The **Replace** value is the sign-in address for Power BI, and the **With** value is the value to replace it with. The replacement passes to the `EffectiveUserName` property for the Analysis Services connection.

   :::image type="content" source="media/service-gateway-enterprise-manage-ssas/add-new-rules.png" alt-text="Screenshot of Add new rule in the Map user names box.":::

   For example:

   :::image type="content" source="media/service-gateway-enterprise-manage-ssas/replace-with-rule.png" alt-text="Screenshot of example mapping rules." :::

   > [!NOTE]
   > Be sure not to change users that you don't intend to change. For example, if you replace the **Original name** of `contoso.com` with a **New name** of `@contoso.local`, all user sign-ins that contain `@contoso.com` are replaced with `@contoso.local`. Also, if you replace an **Original name** of `meganb@contoso.com` with a **New name** of `meganb@contoso.local`, a sign-in of `v-meganb@contoso.com` is sent as `v-meganb@contoso.local`.

   You can select an item in the list and reorder it by dragging and dropping, or delete an entry by selecting the garbage can icon.

#### Use a wildcard

You can use a \* wildcard for your **Replace** (original name) string. You can only use the wildcard on its own and not with any other string part. Use a wildcard if you want to replace all users with a single value to pass to the data source. This approach is useful when you want all users in an organization to use the same user in your local environment.

#### Test the mapping rule

To validate the name replacement, enter a value for **Original name**, and select **Test rule**.

:::image type="content" source="media/service-gateway-enterprise-manage-ssas/test-rule.png" alt-text=" Screenshot of testing a mapping rule." :::

> [!NOTE]
> The saved rules work immediately in the browser. It take a few minutes before the Power BI service starts to use the saved rules.

### Active Directory lookup mapping

This section describes how to do an on-premises Active Directory property lookup to remap Microsoft Entra UPNs to AD users. First, review how this remapping works.

Each query by a Power BI Microsoft Entra user to an on-premises SSAS server passes along a UPN string such as `firstName.lastName@contoso.com`.

Lookup mapping in an on-premises data gateway with configurable custom user mapping follows these steps:

1. Find the Active Directory to search. You can use automatic or configurable.
2. Look up the attribute of the Active Directory user, such as **Email**, from the Power BI service. The attribute is based on an incoming UPN string like `firstName.lastName@contoso.com`.
3. If the Active Directory lookup fails, it attempts to pass along the UPN to SSAS as the `EffectiveUserName`.
4. If the Active Directory lookup succeeds, it retrieves the `UserPrincipalName` of that Active Directory user.
5. The mapping passes the `UserPrincipalName` email, such as `Alias@corp.on-prem.contoso`, to SSAS as the `EffectiveUserName`.

> [!NOTE]
> Any manual UPN user mappings defined in the Power BI data source gateway configuration are applied before sending the UPN string to the on-premises data gateway.

For the Active Directory lookup to work properly at runtime, you must change the on-premises data gateway service to run with a domain account instead of a local service account.

1. Make sure to [download and install the latest gateway](/data-integration/gateway/service-gateway-install).

2. In the [On-premises data gateway](/data-integration/gateway/service-gateway-app) app on your machine, go to **Service settings** > **Change service account**. Make sure you have the recovery key for the gateway, because you need to restore it on the same machine unless you want to create a new gateway. You must restart the gateway service for the change to take effect.

3. Go to the gateway's installation folder, *C:\Program Files\On-premises data gateway*, as an administrator to ensure that you have write permissions. Open the *Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config* file.

4. Edit the `ADUserNameLookupProperty` and the `ADUserNameReplacementProperty` values according to the AD attribute configurations for your AD users. The values in the following image are examples. These configurations are case sensitive, so make sure they match the values in AD.

   :::image type="content" source="media/service-gateway-enterprise-manage-ssas/gateway-enterprise-map-user-names_03.png" alt-text="Screenshot of Active Directory settings.":::

   If the file provides no value for the `ADServerPath` configuration, the gateway uses the default global catalog. You can specify multiple values for the `ADServerPath`. The values must be separated by semicolons, as in the following example:

   ```xml
   <setting name="ADServerPath" serializeAs="String">
       <value> GC://serverpath1; GC://serverpath2;GC://serverpath3</value>
   </setting>
   ```

   The gateway parses the values for `ADServerPath` from left to right until it finds a match. If the gateway doesn't find a match, it uses the original UPN. Make sure the account that runs the gateway service, PBIEgwService, has query permissions to all AD servers that you specify in `ADServerPath`.

   The gateway supports two types of `ADServerPath`:

   - For WinNT: `<value="WinNT://usa.domain.corp.contoso.com,computer"/>`
   - For global catalog (GC): `<value> GC://USA.domain.com </value>`

5. Restart the on-premises data gateway service for the configuration change to take effect.

## Authentication to a live Analysis Services data source

Each time a user interacts with Analysis Services, the effective user name is passed to the gateway and then to the on-premises Analysis Services server. The UPN, which is typically the email address you use to sign in to the cloud, is passed to Analysis Services as the effective user in the `EffectiveUserName` connection property.

When the dataset is in Import Mode, the gateway will send the EffectiveUserName of the UPN of the dataset owner. This means that the UPN of the dataset owner will be passed to Analysis Services as the effective user in the `EffectiveUserName` connection property.

This email address should match a defined UPN within the local Active Directory domain. The UPN is a property of an AD account. A Windows account must be present in an Analysis Services role to have access to the server. If no match is found in Active Directory, the sign-in won't be successful.

<a name="role-based-security"></a>
<a name="row-level-security"></a>
### Role-based and row-level security

Analysis Services can also provide filtering based on the Active Directory account. The filtering can use role-based security or row-level security. A user's ability to query and view model data depends on the roles that their Windows user account belongs to, and on dynamic row-level security if it's configured.

- **Role-based security.** Models provide security based on user roles. You can define roles for a particular model project during authoring in SQL Server Data Tools Business Intelligence tools. After a model is deployed, you can define roles by using SQL Server Management Studio. Roles contain members assigned by Windows user name or by Windows group.

  Roles define the permissions users have to query or take actions on the model. Most users belong to a role with read permissions. Other roles give administrators permissions to process items, manage database functions, and manage other roles.

- **Row-level security.** Models can provide dynamic row-level security. Any defined row-level security is specific to Analysis Services. For role-based security, every user must have at least one role, but no tabular model requires dynamic row-level security.

  At a high level, dynamic security defines a user's read access to data in particular rows in particular tables. Similar to roles, dynamic row-level security relies on a user's Windows user name.

Implementing role and dynamic row-level security in models is beyond the scope of this article. For more information, see [Roles in tabular models](/analysis-services/tabular-models/roles-ssas-tabular) and [Security roles (Analysis Services - Multidimensional data)](/analysis-services/multidimensional-models/olap-logical/security-roles-analysis-services-multidimensional-data). For the most in-depth understanding of tabular model security, download the [Securing the tabular BI semantic model](https://download.microsoft.com/download/D/2/0/D20E1C5F-72EA-4505-9F26-FEF9550EFD44/Securing%20the%20Tabular%20BI%20Semantic%20Model.docx) whitepaper.

<a name='azure-ad-authentication'></a>

### Microsoft Entra authentication

Microsoft cloud services use [Microsoft Entra ID](/azure/active-directory/fundamentals/active-directory-whatis) to authenticate users. Microsoft Entra ID is the tenant that contains user names and security groups. Typically, the email address a user signs in with is the same as the UPN of the account.

### Roles in the local Active Directory instance

For Analysis Services to determine if a user belongs to a role with permissions to read data, the server needs to convert the effective user name passed from Microsoft Entra ID to the gateway and on to the Analysis Services server. The Analysis Services server passes the effective user name to a Windows Active Directory domain controller (DC). The Active Directory DC then validates that the effective user name is a valid UPN on a local account. The DC returns the user's Windows user name back to the Analysis Services server.

You can't use `EffectiveUserName` on a non-domain joined Analysis Services server. The Analysis Services server must be joined to a domain to avoid sign-in errors.

### Identify your UPN

You might not know what your UPN is, and you might not be a domain administrator. You can use the following command from your workstation to find out the UPN for your account:

```cmd
whoami /upn
```

The result looks similar to an email address, but is the UPN that's on your domain account. If you use an Analysis Services data source for live connections, and this UPN doesn't match the email address you use to sign in to Power BI, you might need to [map your user name](#map-user-names-for-analysis-services-data-sources).

<a name='synchronize-an-on-premises-ad-with-azure-ad'></a>

### Synchronize an on-premises AD with Microsoft Entra ID

If you plan to use Analysis Services live connections, your local AD accounts must match Microsoft Entra ID. The UPN must match between the accounts.

Cloud services only use accounts within Microsoft Entra ID. If you add an account in your local AD instance that doesn't exist in Microsoft Entra ID, you can't use the account. There are several ways you can match your local AD accounts with Microsoft Entra ID:

- Add accounts manually to Microsoft Entra ID.

  Create an account on the Azure portal, or within the Microsoft 365 admin center, with an account name that matches the UPN of the local AD account.

- Use [Microsoft Entra Connect Sync](/azure/active-directory/hybrid/how-to-connect-sync-whatis) to synchronize local accounts to your Microsoft Entra tenant.

  Microsoft Entra Connect ensures that the UPN matches between Microsoft Entra ID and your local AD instance. The Microsoft Entra Connect tool provides options for directory synchronization and setting up authentication. Options include password hash sync, pass-through authentication, and federation. If you're not an admin or a local domain administrator, contact your IT admin to help with configuration.

  > [!NOTE]
  > Synchronizing accounts with Microsoft Entra Connect Sync creates new accounts within your Microsoft Entra tenant.

## Use the data source

After you add the SSAS data source, it's available to use with either live connections or through scheduled refresh.

> [!NOTE]
> The server and database name must match between Power BI Desktop and the data source within the on-premises data gateway.

The link between your dataset and the data source within the gateway is based on your server name and database name. These names must match. For example, if you supply an IP address for the server name within Power BI Desktop, you must use the IP address for the data source within the gateway configuration. If you use *SERVER\INSTANCE* in Power BI Desktop, you also must use *SERVER\INSTANCE* within the data source configured for the gateway. This requirement holds for both live connections and scheduled refresh.

### Use the data source with live connections

You can use a live connection against tabular or multidimensional instances. You select a live connection in Power BI Desktop when you first connect to the data. Make sure that the server and database name matches between Power BI Desktop and the configured data source for the gateway. Also, to be able to publish live connection datasets, your users must appear under **Users** in the data source list.

After you publish reports, either from Power BI Desktop or by getting data in the Power BI service, your data connection should start to work. It might take several minutes after you create the data source in the gateway before you can use the connection.

### Use the data source with scheduled refresh

If you're listed in the **Users** tab of the data source configured within the gateway, and the server and database name match, you see the gateway as an option to use with scheduled refresh.

:::image type="content" source="media/service-gateway-enterprise-manage-ssas/powerbi-gateway-enterprise-schedule-refresh.png" alt-text="Screenshot of selecting the on-premises gateway to use for scheduled refresh." :::

### Limitations of Analysis Services live connections

- Cell level formatting and translation features aren't supported.

- Actions and named sets aren't exposed to Power BI. You can still connect to multidimensional cubes that contain actions or named sets to create visuals and reports.

#### SKU requirements

| **Server version** | **Required SKU** |
| --- | --- |
| 2014 |Business Intelligence and Enterprise SKU |
| 2016 |Standard SKU or higher |
| 2017 |Standard SKU or higher |
| 2019 |Standard SKU or higher |
| 2022 |Standard SKU or higher |

## Related content

* [Troubleshoot the on-premises data gateway](/data-integration/gateway/service-gateway-tshoot)
* [Troubleshoot gateways - Power BI](service-gateway-onprem-tshoot.md)

More questions? Try the [Power BI Community](https://community.powerbi.com/).
