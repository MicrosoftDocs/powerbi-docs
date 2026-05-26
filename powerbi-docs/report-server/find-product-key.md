---
title: "Find your Power BI Report Server product key"
description: "Find your Power BI Report Server product key for production installation. Learn where to locate it based on your license type and start installing today."
author: JulCsc
ms.author: juliacawthra
ms.reviewer: petebro, denyse.niwenshuti
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: how-to
ms.custom: video-removed
ms.date: 05/26/2026
ai-usage: ai-assisted
---
# How to find your Power BI Report Server product key

Power BI Report Server requires a product key for production installation. Where you find that key depends on your license type: [Power BI Premium](#power-bi-premium), [Fabric F64+](#fabric-f64), or SQL Server ([SQL Server 2025 Enterprise and Standard editions](#sql-server-2025-enterprise-and-standard-editions); [SQL Server 2022 and earlier Enterprise Edition](#sql-server-2022-and-earlier-enterprise-edition)).
  
> [!NOTE]
> You can't use a developer product key in a production environment.

## Power BI Premium

Only users with Fabric admin or Power BI Premium capacity admin privileges can access the key.

1. In the [admin portal](/fabric/admin/admin-center#how-to-get-to-the-admin-portal), go to the **Premium Settings** tab.

    :::image type="content" source="./media/find-product-key/pbirs-product-key.png" alt-text="Screenshot of the Power BI Report Server product key location within the Premium Settings tab in the Power BI admin portal." lightbox="./media/find-product-key/pbirs-product-key.png":::

1. Select **Power BI Report Server key** to open a dialog containing your product key.

    :::image type="content" source="./media/find-product-key/pbirs-product-key-dialog.png" alt-text="Screenshot of the dialog box displaying the Power BI Report Server product key that can be copied for installation.":::

1. Copy the key and use it with the installation.

## Fabric F64+

Only users with Fabric admin or Power BI Premium capacity admin privileges can access the key.

1. In the [admin portal](/fabric/admin/admin-center#how-to-get-to-the-admin-portal), go to the **Capacity Settings** tab.

    :::image type="content" source="./media/find-product-key/fabric-pbirs-product-key.png" alt-text="Screenshot of the Power BI Report Server product key location within the Capacity Settings tab in the Fabric admin portal." lightbox="./media/find-product-key/fabric-pbirs-product-key.png":::

1. Select **Power BI Report Server key** to open a dialog containing your product key.
1. Copy the key and use it with the installation.

## SQL Server

How you get your product key depends on your SQL Server version. SQL Server 2025 customers use their SQL Server product key directly - no separate key is issued. For SQL Server 2022 and earlier, the Microsoft 365 admin center or Visual Studio Subscriptions provides a separate Power BI Report Server key, depending on your license type.

> [!NOTE]
> If you purchased your SQL Server Enterprise license from a Cloud Solution Partner (CSP), contact the partner to get access to the Power BI Report Server key.

For full licensing terms that govern use of Power BI Report Server, see the "Use of Power BI Report Server" section in [SQL Server licensing](https://www.microsoft.com/licensing/terms/productoffering/SQLServer/EAEAS).

### SQL Server 2025 Enterprise and Standard editions

Starting with SQL Server 2025, Power BI Report Server is the default reporting solution and is bundled with all paid SQL Server licenses. There's no separate Power BI Report Server product key. Use the same product key you received with your SQL Server 2025 license — this applies to both Enterprise and Standard editions.

The installation wizard embeds the SQL Server product key and automatically detects it during installation. If you need to locate the key manually, find it in the [Microsoft 365 admin center](https://admin.microsoft.com/#/subscriptions):

1. Go to **Billing** > **Your products**, and then select the **Volume licensing** tab.
1. In the **Products and services** section, select **View downloads and keys**.
1. Find SQL Server in the product list, and then select the **View downloads** icon.
1. In the product details panel, select one or more **Components**, and then select **Download**.
1. On your computer, open the downloaded file, and then open the **x64** folder.
1. Open the **DefaultSetup.ini** file. Your SQL Server product key is displayed in this file.

### SQL Server 2022 and earlier Enterprise Edition

For SQL Server 2022 and earlier versions, get your Power BI Report Server key through the Microsoft 365 admin center (for Software Assurance customers) or Visual Studio Subscriptions (for Enterprise Subscription customers).

#### Microsoft 365 admin center

If you have a SQL Server Enterprise Software Assurance agreement for SQL Server 2022 and earlier versions, get your product key from the [Microsoft 365 admin center](https://admin.microsoft.com/#/subscriptions):

1. Go to **Billing** > **Your products**, and then select the **Volume licensing** tab.
1. Select **View downloads and keys**.
1. Find SQL Server in the list, and then select **View downloads**.

    :::image type="content" source="media/find-product-key/m365-choose-version.png" alt-text="Screenshot of SQL Server in the Volume licensing downloads list.":::

1. Under **Downloads**, select the **View additional instructions** link.

    :::image type="content" source="media/find-product-key/m365-downloads.png" alt-text="Screenshot of Additional instructions dialog.":::

1. Copy the Power BI Report Server product key displayed in the **Additional instructions** section.

    :::image type="content" source="media/find-product-key/m365-additional-instructions.png" alt-text="Screenshot of the Additional instructions section showing the Power BI Report Server product key.":::

#### Visual Studio Subscriptions

If you have a SQL Server Enterprise subscription, find the product key under [Visual Studio Subscriptions](https://my.visualstudio.com/downloads). Find your product key by choosing a SQL Server version and then clicking the **info** link.

1. Select the info shortcut next to the version of the software that you have.

    :::image type="content" source="media/find-product-key/visual-studio-downloads-list.png" alt-text="Screenshot of the Visual Studio Subscriptions downloads list showing the info shortcut next to each SQL Server version.":::

1. Copy the Power BI Report Server product key displayed with your license information.

    :::image type="content" source="media/find-product-key/visual-studio-downloads-info.png" alt-text="Screenshot of the Power BI Report Server product key displayed in the Visual Studio Subscriptions info section.":::

## Related content

- [Install Power BI Report Server](install-report-server.md)  
- [Install Power BI Desktop for Power BI Report Server](install-powerbi-desktop.md)  
- [Download SQL Server Data Tools (SSDT)](/sql/ssdt/download-sql-server-data-tools-ssdt)
- [How to get to the admin portal](/fabric/admin/admin-center#how-to-get-to-the-admin-portal)
