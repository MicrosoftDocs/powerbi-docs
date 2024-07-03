---
title: "Add or remove a gateway data source"
description: Learn how to add data sources to an on-premises gateway in Power BI.
author: miquelladeboer
ms.author: mideboer
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 06/28/2024
ms.custom: ''
LocalizationGroup: Gateways
---

# Add or remove a gateway data source

[!INCLUDE [gateway-rewrite](../includes/gateway-rewrite.md)]

Power BI supports many [on-premises data sources](power-bi-data-sources.md), and each source has its own requirements. You can use a gateway for a single data source or multiple data sources. For this example, you learn how to add SQL Server as a data source. The steps are similar for other data sources.

You can also do most data source management operations by using APIs. For more information, see [REST APIs (Gateways)](/rest/api/power-bi/gateways).

If you don't have a gateway installed, [install an on-premises data gateway](/data-integration/gateway/service-gateway-install) to get started.

## Add a data source

1. From the page header in the Power BI service, select the **Settings** ![Settings gear icon](media/service-gateway-data-sources/icon-gear.png) icon, and then select **Manage connections and gateways**.

   :::image type="content" source="media/service-gateway-data-sources/manage-gateways.png" alt-text="Screenshot that shows selecting Manage connections and gateways.":::

2. Select **New** at the top of the screen to add a new data source.

3. On the **New connection** screen, select **On-premises**, provide the **Gateway cluster name** you want to create the connection on, provide a **Connection name**, and select the **Data Source Type**. For this example, choose **SQL Server**.

4. Enter information about the data source. For SQL Server, provide the **Server** and **Database**.

   :::image type="content" source="media/service-gateway-data-sources/server-database.png" alt-text="Screenshot of how to fill in data source settings.":::

   > [!NOTE]
   > To use the data source for Power BI reports and dashboards, the server and database names must match between Power BI Desktop and the data source you add to the gateway.

5. Select an **Authentication Method** to use when connecting to the data source, **Basic**, **Windows**, or **OAuth2**. For SQL Server, choose **Windows** or **Basic** (SQL Authentication). Enter the credentials for your data source.

   :::image type="content" source="media/service-gateway-data-sources/authentification.png" alt-text="Screenshot of how to fill out authentication settings.":::

   If you selected **OAuth2** authentication method:
   - Any query that runs longer than the OAuth token expiration policy might fail.
   - Cross-tenant Microsoft Entra accounts aren't supported.
   
   If you selected **Windows** authentication method, make sure that account has access on the machine. If you're not sure, make sure to add *NT-AUTHORITY\\Authenticated Users (S-1-5-11)* to the local machine **Users** group.

6. Optionally, under **Single sign-on**, you can configure [single sign-on (SSO)](service-gateway-sso-overview.md) for your data source. Depending on your organization settings, for DirectQuery-based reports, you can configure **Use SSO via Kerberos for DirectQuery queries**,  **Use SSO via Kerberos for DirectQuery And Import queries** or **Use SSO via Microsoft Entra ID for DirectQuery queries**. You can configure **Use SSO via Kerberos for DirectQuery And Import queries** for refresh-based reports.

   If you use **Use SSO via Kerberos for DirectQuery queries** and use this data source for a DirectQuery-based report, the report uses the credentials of the user that signs in to the Power BI service. A refresh-based report uses the credentials that you enter in the **Username** and **Password** fields and the **Authentication** method you choose.

   When you use **Use SSO via Kerberos for DirectQuery And Import queries**, you don't need to provide any credentials. If this data source is used for DirectQuery-based reports, the report uses the user mapped to the Microsoft Entra user that signs in to the Power BI service. A refresh-based report uses the dataset owner's security context.

   For more information about **Use SSO via Kerberos for DirectQuery queries** and **Use SSO via Kerberos for DirectQuery And Import queries**, see [Overview of single sign-on (SSO) for gateways in Power BI](service-gateway-sso-overview.md).

   If you use **Use SSO via Microsoft Entra ID for DirectQuery queries** and use this data source for a DirectQuery-based report, the report uses the Microsoft Entra token of the user who signs into the Power BI service. A refresh-based report uses the credentials that you enter in the **Username** and **Password** fields and the **Authentication** method you choose. The **Use SSO via Microsoft Entra ID for DirectQuery queries** option is available only if the tenant admin allows Microsoft Entra SSO via the on-premises data gateway, and for the following data sources:

   * SQL Server
   * Azure Data Explorer
   * Snowflake

   For more information about **Use SSO via Microsoft Entra ID for DirectQuery queries**, see [Microsoft Entra single sign-on (SSO) for Gateway](/fabric/admin/service-admin-portal-integration#azure-ad-single-sign-on-sso-for-gateway).

    >[!NOTE]
    > SSO for Import queries is available only for the SSO data sources that use [Kerberos constrained delegation](service-gateway-sso-kerberos.md).

7. Under **General** > **Privacy level**, optionally configure a [privacy level](https://support.office.com/article/Privacy-levels-Power-Query-CC3EDE4D-359E-4B28-BC72-9BEE7900B540) for your data source. This setting doesn't apply to [DirectQuery](desktop-directquery-about.md).

    :::image type="content" source="media/service-gateway-data-sources/privacy-level.png" alt-text="Screenshot of the Privacy level selections for data sources.":::


8. Select **Create**. Under **Settings**, you see **Created new connection** if the process succeeds.

    :::image type="content" source="media/service-gateway-data-sources/data-source-succesful.png" alt-text="Screenshot of when the creation on connection is successful.":::

You can now use this data source to include data from SQL Server in your Power BI dashboards and reports.

## Remove a data source

You can remove a data source if you no longer use it. If you remove a data source, any dashboards and reports that rely on that data source stop working.

To remove a data source, select the data source from the **Connections** screen in **Manage connections and gateways**, and then select **Remove**.

:::image type="content" source="media/service-gateway-data-sources/data-source-remove.png" alt-text="Screenshot of how to remove a data source.":::

## Use the data source for scheduled refresh or DirectQuery

After you create the data source, it's available to use with DirectQuery connections or through scheduled refresh. You can learn more about setting up scheduled refresh in [Configure scheduled refresh](refresh-scheduled-refresh.md).

The link between your dataset and the data source in the gateway is based on your server name and database name. These names must match. For example, if you supply an IP address for the server name in Power BI Desktop, you must use the IP address for the data source in the gateway configuration. If you use `SERVER\INSTANCE` in Power BI Desktop, you must use the same format in the data source you configure for the gateway.

If your account is listed in the **Users** tab of the data source configured in the gateway, and the server and database name match, you see the gateway listed as **Running** under **Gateway connections** in the **Settings** for your data source. You can select **Scheduled refresh** to set up scheduled refresh for the data source.

:::image type="content" source="media/service-gateway-data-sources/gateway-connection.png" alt-text="Screenshot of how to create gateway connection.":::

> [!IMPORTANT]
> If your dataset contains multiple data sources, each data source must be added in the gateway. If one or more data sources aren't added to the gateway, you won't see the gateway as available for scheduled refresh.

## Manage users

After you add a data source to a gateway, you give users and security groups access to the specific data source, not the entire gateway. The access list for the data source controls only who is allowed to publish reports that include data from the data source. Report owners can create dashboards and apps, and then share those items with other users.

You can also give users and security groups administrative access to the gateway.

> [!NOTE]
> Users with access to the data source can associate datasets to the data source, and connect, based on either the stored credentials or SSO you selected while creating a data source.

### Add users to a data source

1. From the page header in the Power BI service, select the **Settings** icon, and then select **Manage connections and gateways**.
2. Select the data source where you want to add users.
3. Select **Manage users** from the top ribbon
4. On the **Manage users** screen, enter the users and/or security groups from your organization who can access the selected data source.
1. Select the new user name, and select the role to assign: **User**, **User with resharing**, or **Owner**.
1. Select **Share**, and the added member's name is added to the list of people who can publish reports that use this data source.

    :::image type="content" source="media/service-gateway-data-sources/manage-users.png" alt-text="Screenshot of Add user.":::

Remember that you need to add users to each data source that you want to grant access to. Each data source has a separate list of users. Add users to each data source separately.

### Remove users from a data source

On the **Manage Users** tab for the data source, you can remove users and security groups that use this data source.

## Store encrypted credentials in the cloud

When you add a data source to the gateway, you must provide credentials for that data source. All queries to the data source run by using these credentials. The credentials are encrypted securely with symmetric encryption, so that they can't be decrypted in the cloud. The credentials are sent to the machine that runs the on-premises gateway. This machine decrypts the credentials when the data sources are accessed.

## List of available data source types

For information about which data sources the on-premises data gateway supports, see [Power BI data sources](power-bi-data-sources.md).

   > [!NOTE]
   > MySQL is not supported on the personal on-premises data gateway.

## Related content

* [Manage your data source - Analysis Services](service-gateway-enterprise-manage-ssas.md)
* [Manage your data source - SAP HANA](service-gateway-enterprise-manage-sap.md)
* [Manage your data source - SQL Server](service-gateway-enterprise-manage-sql.md)
* [Manage your data source - Oracle](service-gateway-onprem-manage-oracle.md)
* [Manage your data source - Import/scheduled refresh](service-gateway-enterprise-manage-scheduled-refresh.md)
* [Guidance for deploying a data gateway](service-gateway-deployment-guidance.md)

More questions? Try the [Power BI Community](https://community.powerbi.com/).
