---
title: How to Find Your Report Server Product Key
description: Learn how you can find your Power BI Report Server product key to install your server in a production environment.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: petebro
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: how-to
ms.custom: video-removed
ms.date: 12/01/2025
ai-usage: ai-assisted
---
# How to find your report server product key

Learn how you can find your Power BI Report Server product key to install your server in a production environment.

You downloaded [Power BI Report Server](get-started.md), and you have a [Fabric F64+ reserved instance](/fabric/enterprise/licenses), SQL Server Enterprise and Standard Editions for SQL2025, SQL Server Enterprise with Software Assurance for SQL2022 and earlier versions, or SQL Server Enterprise Subscriptions. You want to install the server in a production environment, but you need a product key in order to do that. Where is the product key? The product key is in one of these places, depending on what you purchased:

- Purchased [Power BI Premium](#purchased-power-bi-premium)
- Purchased [F64+ Reserved Instance](#purchased-f64-reserved-instance) (more details on [Fabric Capacity Reservation](/azure/cost-management-billing/reservations/fabric-capacity))
- Purchased [SQL Server 2025 Enterprise and Standard editions, or SQL Server 2022 and earlier Enterprise Edition with Software Assurance agreement or SQL Server Enterprise Subscription](#purchased-software-assurance-agreement)

> [!NOTE]
> If you purchased your SQL Server Enterprise license through a partner, reach out to the partner to get access to the Power BI Report Server key.

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

## Purchased SQL Server 2025 Enterprise or Standard Edition

## Purchased Software Assurance agreement

### Microsoft admin center

If you have a SQL Server Enterprise SA agreement for SQL Server 2022 and earlier versions, your volume licensing administrator can get your product key from the [Microsoft admin center](https://admin.microsoft.com/#/subscriptions). You can find your product key by choosing a SQL Server version and then looking under the **View Downloads** section.

Check in **Billing** > **Your Products** > **Volume Licensing** > **View Downloads and Keys** > **Find SQL Server** > **View Downloads** > **View additional instructions**:

1. Select the key next to the version of the software that you have.

    :::image type="content" source="media/find-product-key/m365-choose-version.png" alt-text="Screenshot of the key next to the version of the software that you have.":::

1. Under Downloads, select the **View additional instructions** link.

    :::image type="content" source="media/find-product-key/m365-downloads.png" alt-text="Screenshot of Additional instructions dialog.":::

1. Find the Power BI Report Server Software Assurance information displayed with your license key.

    :::image type="content" source="media/find-product-key/m365-additional-instructions.png" alt-text="Screenshot of View additional instructions.":::_Note: Starting with SQL Server 2025, there is no separate installation key for [Power BI Report Server](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.microsoft.com%2Fen-us%2Fpower-platform%2Fproducts%2Fpower-bi%2Freport-server&data=05%7C02%7CRory.Hogan%40microsoft.com%7C0ca7ebb55e3e4717a54308de2165c017%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638984918099587968%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=la3kvQ3wtNb%2F8hYHv161e3pT7DxeC59pKUJlehW2cGU%3D&reserved=0) (PBIRS). As the only reporting services offering, both Enterprise and Standard Edition customers can use the SQL Server product key to install Power BI Reports Server_
   
### Visual Studio Subscriptions

If you have SQL Server Enterprise subscription the product key can be found under [Visual Studio Subscriptions](https://my.visualstudio.com/downloads). You can find your product key by choosing a SQL Server version and then clicking the **info** link.

1. Select the info shortcut next to the version of the software that you have.

    :::image type="content" source="media/find-product-key/visual-studio-downloads-list.png" alt-text="Screenshot of the info next to the version of the software that you have.":::

1. Find the Power BI Report Server Software Assurance information displayed with your license key.

    :::image type="content" source="media/find-product-key/visual-studio-downloads-info.png" alt-text="Screenshot of the info section after it is clicked.":::

## Related content

- [Install Power BI Report Server](install-report-server.md)  
- [Install Power BI Desktop for Power BI Report Server](install-powerbi-desktop.md)  
- [Download Report Builder](https://www.microsoft.com/download/details.aspx?id=53613)  
- [Download SQL Server Data Tools (SSDT)](/sql/ssdt/download-sql-server-data-tools-ssdt)

- [How to get to the admin portal](/fabric/admin/admin-center#how-to-get-to-the-admin-portal)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
