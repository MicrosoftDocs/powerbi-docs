---
title: How to find your report server product key
description: Learn how you can find your Power BI Report Server product key to install your server in a production environment.

author: petebro-MSFT
ms.author: petebro
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: how-to
ms.custom: video-removed
ms.date: 12/04/2024
---
# How to find your report server product key

Learn how you can find your Power BI Report Server product key to install your server in a production environment.

You downloaded [Power BI Report Server](get-started.md), and you have a SQL Server Enterprise Software Assurance agreement. Or you purchased [Power BI Premium](../enterprise/service-premium-what-is.md). You want to install the server in a production environment, but you need a product key in order to do that. Where is the product key? The product key is in one of these places, depending on what you purchased:

- Purchased [Power BI Premium](#purchased-power-bi-premium)
- Purchased [F64+ Reserved Instance](#purchased-f64-reserved-instance)
- Purchased [Software Assurance agreement](#purchased-software-assurance-agreement)

> [!NOTE]
> You can't use a developer product key in a production environment.
>
> For more details, see the section "Use of Power BI Report Server – SQL Server Enterprise Edition" in [SQL Server licensing](https://www.microsoft.com/licensing/terms/productoffering/SQLServer/EAEAS).

## Purchased Power BI Premium
If your organization has purchased Power BI Premium capacity, you can get the key for Power BI Report Server from the **Premium Settings** tab in the [admin portal](/fabric/admin/admin-center#how-to-get-to-the-admin-portal). The key is accessible to only users with Fabric admin or Power BI Premium capacity admin privileges.

:::image type="content" source="./media/find-product-key/pbirs-product-key.png" alt-text="Screenshot of Power BI Report Server key within Premium settings." lightbox="./media/find-product-key/pbirs-product-key.png":::

Selecting **Power BI Report Server key** will display a dialog contain your product key. You can copy it and use it with the installation.

:::image type="content" source="./media/find-product-key/pbirs-product-key-dialog.png" alt-text="Screenshot of Power BI Report Server product key.":::

## Purchased F64+ Reserved Instance
If your organization has purchased F64 SKU and above reserved instances, you can get the key for Power BI Report Server from the **Capacity Settings** tab in the [admin portal](/fabric/admin/admin-center#how-to-get-to-the-admin-portal). The key is only accessible to users with Fabric admin or Power BI Premium capacity admin privileges.

:::image type="content" source="./media/find-product-key/fabric-pbirs-product-key.png" alt-text="Screenshot of Power BI Report Server key within Fabric settings." lightbox="./media/find-product-key/fabric-pbirs-product-key.png":::

Select **Power BI Report Server key** to display a dialog contain your product key. You can copy it and use it with the installation.

## Purchased Software Assurance agreement

### Microsoft Admin Center
If you have a SQL Server Enterprise SA agreement, you can get your product key from the [Microsoft Admin Center](https://admin.microsoft.com/#/subscriptions). You can find your product key by choosing a SQL Server version and then looking under the **View Downloads** section. 

Check in **Billing** > **Your Products** > **Volume Licensing** > **View Downloads and Keys** > **Find SQL Server** > **View Downloads** > **View additional instructions**:

1. Select the key next to the version of the software that you have.

    :::image type="content" source="media/find-product-key/m365-choose-version.png" alt-text="Screenshot of the key next to the version of the software that you have.":::

1. Under Downloads, select the **View additional instructions** link.

    :::image type="content" source="media/find-product-key/m365-downloads.png" alt-text="Screenshot of Additional instructions dialog.":::

1. Find the Power BI Report Server Software Assurance information displayed with your license key.

    :::image type="content" source="media/find-product-key/m365-additional-instructions.png" alt-text="Screenshot of View additional instructions.":::

### Visual Studio Subscriptions
If you have SQL Server Enterprise subscription the product key can be found under [Visual Studio Subscriptions](https://my.visualstudio.com/downloads). You can find your product key by choosing a SQL Server version and then clicking the **info** link.

1. Select the info shortcut next to the version of the software that you have.

    :::image type="content" source="media/find-product-key/visual-studio-downloads-list.png" alt-text="Screenshot of the info next to the version of the software that you have.":::

1. Find the Power BI Report Server Software Assurance information displayed with your license key.

    :::image type="content" source="media/find-product-key/visual-studio-downloads-info.png" alt-text="Screenshot of the info section after it is clicked.":::

## Related content

* [Install Power BI Report Server](install-report-server.md)  
* [Install Power BI Desktop for Power BI Report Server](install-powerbi-desktop.md)  
* [Download Report Builder](https://www.microsoft.com/download/details.aspx?id=53613)  
* [Download SQL Server Data Tools (SSDT)](/sql/ssdt/download-sql-server-data-tools-ssdt)
* [How to get to the admin portal](/fabric/admin/admin-center#how-to-get-to-the-admin-portal)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
