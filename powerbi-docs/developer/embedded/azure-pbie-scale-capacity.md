---
title: Scale your Power BI Embedded capacity
description: This article walks through how to scale a Power BI Embedded capacity in Microsoft Azure.
author: mberdugo
ms.author: monaberdugo
services: power-bi-embedded
editor: ''
tags: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 06/27/2022
---

# Scale your Power BI Embedded capacity in the Azure portal

This article walks through how to scale a Power BI Embedded capacity in Microsoft Azure. Scaling allows you to increase or decrease the size of your capacity.

This assumes you created a Power BI Embedded capacity (**A SKU**). If you haven't, see [Create Power BI Embedded capacity in the Azure portal](azure-pbie-create-capacity.md) to get started.

> [!NOTE]
>
> * With Gen1 capacities, a scaling operation can take about a minute. During this time, the capacity won't be available and embedded content may fail to load. With [Embedded Gen2](power-bi-embedded-generation-2.md) capacities, you can scale your Power BI Embedded resource without experiencing any downtime.
> * To autoscale a gen2 capacity see [Autoscaling](#autoscaling).

## Scale a capacity

1. Sign into the [Azure portal](https://portal.azure.com/).

2. Under **Azure services**, select **Power BI Embedded** to see your capacities.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of Azure services in Azure portal.](media/azure-pbie-scale-capacity/azure-portal-more-services.png)

3. Select the capacity you want to scale. Notice that the current scale for each capacity is listed under **SKU**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of Power BI Embedded capacity list in Azure portal.](media/azure-pbie-scale-capacity/azure-portal-capacity-list.png)

    When you make your selection, information about that capacity is displayed next to it. This information again includes the current scaling under **SKU**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of essential information about capacity.](media/azure-pbie-scale-capacity/azure-portal-capacity-details.png)

4. Under **Scale**, select **Change size**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of Change size option.](media/azure-pbie-scale-capacity/azure-portal-change-size.png)

5. Select a scale and click **Resize**.

    > [!div class="mx-imgBorder"]
    > ![Sceenshot of new scale selection.](media/azure-pbie-scale-capacity/azure-portal-scale-pricing-info.png)

   For Gen1 capacities, scaling might take a minute or two to complete.

6. Confirm your tier by viewing the overview tab. The current pricing tier is listed.

    > [!div class="mx-imgBorder"]
    > ![Screenshot current tier information.](media/azure-pbie-scale-capacity/azure-portal-confirm-tier.png)

## Autoscaling

Embedded Gen2 does not provide an out-of-the-box vertical autoscale feature. Instead, you can increase or decrease the size of your gen2 capacity using one of these options:

* [Power BI Embedded Azure Resource Manager REST APIs](/rest/api/power-bi-embedded/), for example [Capacities - Update](/rest/api/power-bi-embedded/capacities/update).

* Power BI Embedded Gen2 [capacity metrics](monitor-power-bi-embedded-reference.md#capacities) such as *CPU*, *CPU Per Workload*, and *Overload*.

* [Azure alerts](/azure/azure-monitor/alerts/alerts-overview). You can use the Power BI Embedded [sample script](monitor-power-bi-embedded-reference.md#example-script-for-scaling-a-capacity) as a reference for scaling a capacity.

## Next steps

* [Pause and start your Power BI Embedded capacity in the Azure portal](azure-pbie-pause-start.md)
* [How to embed your Power BI dashboards, reports, and tiles](https://powerbi.microsoft.com/documentation/powerbi-developer-embedding-content/).

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
