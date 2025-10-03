---
title: "Add or remove a gateway data source"
description: Learn how to add or remove data sources to an on-premises gateway in Power BI. Get tips for managing your data sources efficiently.
author: miquelladeboer
ms.author: mideboer
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 09/30/2025
ai-usage: ai-assisted
LocalizationGroup: Gateways
ms.custom:
  - ''
  - sfi-image-nochange
#customer intent: As a Power BI user, I want to learn how to add or remove a gateway data source so that I can efficiently manage my data sources and include them in my Power BI dashboards and reports.
---

# Add or remove a gateway data source

[!INCLUDE [gateway-rewrite](../includes/gateway-rewrite.md)]

Power BI supports many [on-premises data sources](power-bi-data-sources.md), and each source has its own requirements. Use a gateway for one data source or many. In this article, you add SQL Server as a data source. Steps are similar for other sources. This article shows you how to add and remove a data source, use it with scheduled refresh or DirectQuery, and manage user access.

Do most data source management tasks with APIs. Learn more in [REST APIs (Gateways)](/rest/api/power-bi/gateways).

If you don't have a gateway, [install an on-premises data gateway](/data-integration/gateway/service-gateway-install) to get started.

## Add a data source

1. In the Power BI service header, select the **Settings** icon > **Manage connections and gateways**.

   :::image type="content" source="media/service-gateway-data-sources/manage-gateways.png" alt-text="Screenshot of selecting Manage connections and gateways.":::

1. Select **New** at the top of the screen to add a new data source.
1. On the **New connection** screen, select **On-premises**, enter the **Gateway cluster name** for the connection, enter a **Connection name**, and select the **Data Source Type**. For this example, select **SQL Server**.
1. Enter the data source information. For SQL Server, enter the **Server** and **Database** names.

   :::image type="content" source="media/service-gateway-data-sources/server-database.png" alt-text="Screenshot of completed data source settings.":::

   > [!NOTE]
   > To use the data source for Power BI reports and dashboards, the server and database names must match between Power BI Desktop and the data source you add to the gateway.

1. Select an **Authentication method** to use when connecting to the data source: **Basic**, **Windows**, or **OAuth2**. For SQL Server, choose **Windows** or **Basic** (SQL Authentication). Enter the credentials for your data source.

   :::image type="content" source="media/service-gateway-data-sources/authentification.png" alt-text="Screenshot of authentication settings fields.":::

   If you selected **OAuth2** authentication method:
   - Any query that runs longer than the OAuth token expiration policy might fail.
   - Cross-tenant Microsoft Entra accounts aren't supported.

   If you select **Windows**, make sure the account has access on the machine. If you're not sure, add *NT-AUTHORITY\\Authenticated Users (S-1-5-11)* to the local **Users** group.

1. Under **Single sign-on**, optionally configure [single sign-on (SSO)](service-gateway-sso-overview.md) for the data source. For DirectQuery-based reports, you can configure **Use SSO via Kerberos for DirectQuery queries**, **Use SSO via Kerberos for DirectQuery And Import queries**, or **Use SSO via Microsoft Entra ID for DirectQuery queries**. You can configure **Use SSO via Kerberos for DirectQuery And Import queries** for refresh-based reports.

   If you select **Use SSO via Kerberos for DirectQuery queries** for a DirectQuery-based report, the report uses the credentials of the user who signs in to the Power BI service. A refresh-based report uses the credentials you enter in the **Username** and **Password** fields and the **Authentication method** you choose.

   When you select **Use SSO via Kerberos for DirectQuery And Import queries**, you don't need to enter credentials. For DirectQuery-based reports, the report uses the user mapped to the Microsoft Entra user who signs in to the Power BI service. A refresh-based report uses the dataset owner's security context.

   For more information about **Use SSO via Kerberos for DirectQuery queries** and **Use SSO via Kerberos for DirectQuery And Import queries**, see [Overview of single sign-on (SSO) for on-premises data gateways in Power BI](service-gateway-sso-overview.md).

   If you select **Use SSO via Microsoft Entra ID for DirectQuery queries** for a DirectQuery-based report, the report uses the Microsoft Entra token of the user who signs in to the Power BI service. A refresh-based report uses the credentials you enter in the **Username** and **Password** fields and the **Authentication method** you choose. The **Use SSO via Microsoft Entra ID for DirectQuery queries** option is available only if the tenant admin allows Microsoft Entra SSO via the on-premises data gateway and only for the following data sources:

   - SQL Server
   - Azure Data Explorer
   - Snowflake

   For more information about **Use SSO via Microsoft Entra ID for DirectQuery queries**, see [Microsoft Entra single sign-on (SSO) for data gateway](/fabric/admin/service-admin-portal-integration#azure-ad-single-sign-on-sso-for-gateway).

    >[!NOTE]
    > SSO for Import queries is available only for the SSO data sources that use [Kerberos constrained delegation](service-gateway-sso-kerberos.md).

1. Under **General** > **Privacy level**, optionally set a [privacy level](https://support.office.com/article/Privacy-levels-Power-Query-CC3EDE4D-359E-4B28-BC72-9BEE7900B540) for the data source. This setting doesn't apply to [DirectQuery](desktop-directquery-about.md).

    :::image type="content" source="media/service-gateway-data-sources/privacy-level.png" alt-text="Screenshot of privacy level selections for data sources.":::

1. Select **Create**. Under **Settings**, you see **Created new connection** if creation succeeds.

    :::image type="content" source="media/service-gateway-data-sources/data-source-succesful.png" alt-text="Screenshot of confirmation message for new connection.":::

Use this data source to add SQL Server data to Power BI dashboards and reports.

## Remove a data source

Remove a data source if you no longer use it. Dashboards and reports that rely on it stop working.

- Select the data source on the **Connections** screen in **Manage Connections and Gateways**, and then select **Remove**.

:::image type="content" source="media/service-gateway-data-sources/data-source-remove.png" alt-text="Screenshot of the Manage Connections and Gateways Connections screen showing a selected data source with the Remove option.":::

## Use the data source for scheduled refresh or DirectQuery

After you create the data source, it's available for DirectQuery or scheduled refresh. Learn more in [Configure scheduled refresh](refresh-scheduled-refresh.md).

The link between the dataset and the gateway data source uses the server and database names. The names must match. For example, if you use an IP address for the server name in Power BI Desktop, use the same IP address in the gateway data source. If you use `SERVER\INSTANCE` in Power BI Desktop, use the same format in the gateway data source.

If your account is listed in the **Users** tab of the data source in the gateway, and the server and database names match, you see the gateway listed as **Running** under **Gateway connections** in **Settings** for the data source. Select **Scheduled refresh** to set up scheduled refresh.

:::image type="content" source="media/service-gateway-data-sources/gateway-connection.png" alt-text="Screenshot of gateway data source settings showing Running status under Gateway connections.":::

> [!IMPORTANT]
> If your dataset contains multiple data sources, add each one to the gateway. If a data source isn't added, you don't see the gateway as available for scheduled refresh.

## Manage users

After you add a data source to a gateway, give users and security groups access only to that data source, not the entire gateway. The data source access list controls who can publish reports that include its data. Report owners can create dashboards and apps, then share them with other users.

Also give users and security groups administrative access to the gateway.

> [!NOTE]
> Users with access to the data source can associate datasets with the data source and connect by using either the stored credentials or SSO you selected when you created the data source. Before you share a data source connection, make sure the user or group account you share with is trusted and has only the privileges it needs (ideally a service account with narrowly scoped rights).

### Add users to a data source

1. From the page header in the Power BI service, select the **Settings** icon, and then select **Manage connections and gateways**.
1. Select the data source to add users.
1. Select **Manage users**.
1. On the **Manage users** screen, enter the users or security groups in your organization that can access the data source.
1. Select the new user name, then select the role: **User**, **User with resharing**, or **Owner**.
1. Select **Share**. The member is added to the list of people who can publish reports that use the data source.

    :::image type="content" source="media/service-gateway-data-sources/manage-users.png" alt-text="Screenshot of the Manage users screen.":::

Add users to each data source you want to grant access to. Each data source has its own user list.

### Remove users from a data source

On the **Manage users** tab, remove users or security groups for the data source.

## Store encrypted credentials in the cloud

When you add a data source to the gateway, provide credentials for it. All queries to the data source use these credentials. The service encrypts the credentials with symmetric encryption so they can't be decrypted in the cloud. The service sends the encrypted credentials to the machine that runs the on-premises gateway. That machine decrypts the credentials only when the gateway accesses the data source.

## Available data source types

See [Power BI data sources](power-bi-data-sources.md) for supported data sources.

   > [!NOTE]
> The personal on-premises data gateway doesn't support MySQL.

## Related content

- [Manage your data source—Analysis Services](service-gateway-enterprise-manage-ssas.md)
- [Manage your data source—SAP HANA](service-gateway-enterprise-manage-sap.md)
- [Manage your data source—SQL Server](service-gateway-enterprise-manage-sql.md)
- [Manage your data source—Oracle](service-gateway-onprem-manage-oracle.md)
- [Manage your data source—import and scheduled refresh](service-gateway-enterprise-manage-scheduled-refresh.md)
- [Deploy a data gateway](service-gateway-deployment-guidance.md)

Have more questions? Go to the [Power BI Community](https://community.powerbi.com/).
