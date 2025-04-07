---
title: Manage your data source - SAP HANA
description: How to manage the on-premises data gateway and data sources that belong to that gateway. This article is specific to SAP HANA. 
author: arthiriyer
ms.author: arthii
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 02/02/2023
LocalizationGroup: Gateways
---

# Manage your data source - SAP HANA

[!INCLUDE [gateway-rewrite](../includes/gateway-rewrite.md)]

After you [install the on-premises data gateway](/data-integration/gateway/service-gateway-install), you need to [add data sources](service-gateway-data-sources.md#add-a-data-source) that can be used with the gateway. This article looks at how to work with gateways and SAP HANA data sources that are used either for scheduled refresh or for DirectQuery.

## Add a data source

For more information about how to add a data source, see [Add a data source](service-gateway-data-sources.md#add-a-data-source). Under **Connection type**, select **SAP HANA**.

:::image type="content" source="media/service-gateway-enterprise-manage-sap/new-data-source-sap.png" alt-text=" Screenshot of Add the SAP HANA data source.":::

After you select the SAP HANA data source type, fill in the **Server**, **Username**, and **Password** information for the data source.

> [!NOTE]
> All queries to the data source run using these credentials. To learn more about how credentials are stored, see [Store encrypted credentials in the cloud](service-gateway-data-sources.md#store-encrypted-credentials-in-the-cloud).

:::image type="content" source="media/service-gateway-enterprise-manage-sap/sap-credentials.png" alt-text=" Screenshot of Filling in the data source settings.":::

After you fill in everything, select **Create**. You can now use this data source for scheduled refresh or DirectQuery against an SAP HANA server that is on-premises. You see *Created New data source* if it succeeded.

:::image type="content" source="media/service-gateway-enterprise-manage-sap/data-source-succesful-sap.png" alt-text=" Screenshot of Displaying the connection status.":::

### Advanced settings

Optionally, you can configure the privacy level for your data source. This setting controls how data can be combined. It's only used for scheduled refresh. The privacy-level setting doesn't apply to DirectQuery. To learn more about privacy levels for your data source, see [Set privacy levels (Power Query)](https://support.office.com/article/Privacy-levels-Power-Query-CC3EDE4D-359E-4B28-BC72-9BEE7900B540).

:::image type="content" source="media/service-gateway-enterprise-manage-sap/privacy-level-sap.png" alt-text=" Screenshot of Setting the privacy level.":::

## Use the data source

After you create the data source, it's available to use with either DirectQuery connections or through scheduled refresh.

> [!NOTE]
> The server and database names must match between Power BI Desktop and the data source within the on-premises data gateway.

The link between your dataset and the data source within the gateway is based on your server name and database name. These names must match. For example, if you supply an IP address for the server name within Power BI Desktop, you must use the IP address for the data source within the gateway configuration. If you use *SERVER\INSTANCE* in Power BI Desktop, you also must use it within the data source configured for the gateway.

This requirement is the case for both DirectQuery and scheduled refresh.

### Use the data source with DirectQuery connections

Make sure that the server and database names match between Power BI Desktop and the configured data source for the gateway. You also need to make sure your user is listed in the **Users** tab of the data source to publish DirectQuery datasets. The selection for DirectQuery occurs within Power BI Desktop when you first import data. For more information about how to use DirectQuery, see [Use DirectQuery in Power BI Desktop](desktop-use-directquery.md).

After you publish, either from Power BI Desktop or **Get Data**, your reports should start to work. It might take several minutes after you create the data source within the gateway for the connection to be usable.

### Use the data source with scheduled refresh

If you're listed in the **Users** tab of the data source configured within the gateway and the server name and database name match, you see the gateway as an option to use with scheduled refresh.

:::image type="content" source="media/service-gateway-enterprise-manage-sap/powerbi-gateway-enterprise-schedule-refresh.png" alt-text="Screenshot displays the users in the Gateway connection dialog.":::

## Related content

* [Troubleshoot the on-premises data gateway](/data-integration/gateway/service-gateway-tshoot)
* [Troubleshoot gateways - Power BI](service-gateway-onprem-tshoot.md)

More questions? Try asking the [Power BI Community](https://community.powerbi.com/).
