---
title: Scale your Power BI Embedded capacity
description: This article walks through how to scale a Power BI Embedded capacity in Microsoft Azure.
author: KesemSharabi
ms.author: kesharab
services: power-bi-embedded
editor: ''
tags: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 06/30/2021
---

# Scale your Power BI Embedded capacity in the Azure portal

This article walks through how to scale a Power BI Embedded capacity in Microsoft Azure. Scaling allows you to increase or decrease the size of your capacity.

This assumes you have created a Power BI Embedded capacity. If you have not, see [Create Power BI Embedded capacity in the Azure portal](azure-pbie-create-capacity.md) to get started.

For information about autoscaling in Embedded Gen 2, see [Autoscaling in Embedded Gen 2](power-bi-embedded-generation-2.md#autoscaling-in-embedded-gen2).

> [!NOTE]
> A scaling operation can take about a minute. During this time, the capacity will not be available. Embedded content may fail to load.

## Scale a capacity

1. Sign into the [Azure portal](https://portal.azure.com/).

2. Select **All services** > **Power BI Embedded** to see your capacities.

    ![All services within Azure portal](media/azure-pbie-scale-capacity/azure-portal-more-services.png)

3. Select the capacity you want to scale. Notice that the current scale is listed under **SKU** for each capacity.

    ![Power BI Embedded capacity list within Azure portal](media/azure-pbie-scale-capacity/azure-portal-capacity-list.png)

    When you make your selection, information about the capacity is displayed on the right. This information again includes the current scaling under **SKU**.

    ![Essential information](media/azure-pbie-scale-capacity/azure-portal-capacity-info.png)

4. Select **Change size** under **Scale** within your capacity.

    ![Change size option under scale](media/azure-pbie-scale-capacity/azure-portal-scale-pricing-tier.png)

5. Select a scale and click **Resize**.

    ![New scale selection](media/azure-pbie-scale-capacity/azure-portal-scale-pricing-info.png

    Scaling your capacity may take a minute or two to complete.

6. Confirm your tier by viewing the overview tab. The current pricing tier is listed.

    ![Confirm current tier](media/azure-pbie-scale-capacity/azure-portal-confirm-tier.png)

## Next steps

To pause or start your capacity, see [Pause and start your Power BI Embedded capacity in the Azure portal](azure-pbie-pause-start.md).

To begin embedding Power BI content within your application, see [How to embed your Power BI dashboards, reports, and tiles](https://powerbi.microsoft.com/documentation/powerbi-developer-embedding-content/).

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
