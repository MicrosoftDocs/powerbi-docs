---
title: Troubleshoot scheduled refresh for Azure SQL databases
description: Learn how to troubleshoot an error with credentials in a scheduled refresh for Azure SQL databases in Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: troubleshooting
ms.date: 10/08/2024
ms.custom: ''
LocalizationGroup: Troubleshooting
---

# Troubleshoot scheduled refresh for Azure SQL databases in Power BI

This article provides steps to troubleshoot errors encountered during scheduled refresh for Azure SQL databases in Power BI. For detailed information about refresh, see [Data refresh in Power BI](refresh-data.md) and [Configure scheduled refresh](refresh-scheduled-refresh.md).

While you set up scheduled refresh for an Azure SQL database, if you get an error with error code 400 when editing the credentials, try these steps to configure the correct firewall rule:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to the Azure SQL database for which you're configuring refresh.

1. On the **Overview** page, select **Set server firewall**.

1. On the **Networking** page, select **Allow Azure services and resources to access this server** and choose **Save**.

:::image type="content" source="media/service-admin-troubleshooting-scheduled-refresh-azure-sql-databases/azurerefresh.png" alt-text="A screenshot that shows the Azure allowed services access option.":::

More questions? [Ask the Power BI Community](https://community.powerbi.com/).
