---
title: Troubleshoot scheduled refresh for Azure SQL databases
description: Troubleshoot scheduled refresh errors for Azure SQL databases in Power BI. Fix error code 400 and configure firewall rules for successful data refresh.
author: kgremban
ms.author: kgremban
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: troubleshooting
ms.date: 10/01/2025
ai-usage: ai-assisted
LocalizationGroup: Troubleshooting
ms.custom:
  - ''
  - sfi-image-nochange
---

# Troubleshoot scheduled refresh for Azure SQL databases in Power BI

When configuring scheduled refresh for Azure SQL databases in Power BI, you may encounter error code 400 related to credentials. This article provides troubleshooting steps to resolve this error by configuring firewall rules. For detailed information about refresh, see [Data refresh in Power BI](refresh-data.md) and [Configure scheduled refresh](refresh-scheduled-refresh.md).

While you set up scheduled refresh for an Azure SQL database, if you get an error with error code 400 when editing the credentials, try these steps to configure the appropriate firewall rule:

1. Sign in to the [Azure portal](https://portal.azure.com).
1. Go to the Azure SQL database for which you're configuring refresh.
1. On the **Overview** page, select **Set server firewall**.
1. On the **Networking** page, select **Allow Azure services and resources to access this server** and choose **Save**.

:::image type="content" source="media/service-admin-troubleshooting-scheduled-refresh-azure-sql-databases/azurerefresh.png" alt-text="Screenshot of the Azure allowed services access option.":::

More questions? [Ask the Power BI Community](https://community.powerbi.com/).
