---
title: Pause and start your Power BI Embedded capacity in the Azure portal
description: Learn how to pause and start your Power BI Embedded capacity in the Microsoft Azure portal to pause billing when the capacity isn't needed.
author: mberdugo
ms.author: monaberdugo
services: power-bi-embedded
editor: ''
tags: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 01/19/2025
#customer intent: As a Power BI Embedded capacity admin, I want to learn how to pause and start my capacity in the Azure portal to prevent billing when the capacity isn't needed.
---

# Pause and start your Power BI Embedded capacity in the Azure portal

This article walks through how to pause and start a Power BI Embedded capacity in Microsoft Azure. This article assumes you have a Power BI Embedded capacity. If you haven't, see [Create Power BI Embedded capacity in the Azure portal](azure-pbie-create-capacity.md) to get started.

This information only applies to A SKU embedded capacities. EM SKU embedded capacities cannot be paused in the same fashion. For information on pausing F SKU capacities, see [Pause and resume your capacity](/fabric/enterprise/pause-resume).

If you don't have an Azure subscription, create a [free account](https://azure.microsoft.com/free/) before you begin.

## Pause your capacity

Pausing your capacity prevents you from being billed. Pausing your capacity is great if you don't need to use the capacity for some time. Use the following steps to pause your capacity.

> [!NOTE]
> Pausing a capacity can prevent content from being available within Power BI. Make sure to unassign workspaces from your capacity before pausing the capacity to prevent workspace interruption.

1. Sign into the [Azure portal](https://portal.azure.com/).

2. Under **Azure services**, select **Power BI Embedded** to see your capacities.

    :::image type="content" source="media/azure-pbie-pause-start/azure-portal-more-services.png" alt-text="Screenshot of the Azure portal, which shows the Azure services list.":::

3. Select the capacity you want to pause.

    :::image type="content" source="media/azure-pbie-pause-start/azure-portal-capacity-list-active.png" alt-text="Screenshot of the Azure portal, which shows the Power BI Embedded capacity list.":::

4. Select **Pause** above the capacity details.

    :::image type="content" source="media/azure-pbie-pause-start/azure-portal-pause-capacity.png" alt-text="Screenshot of the Azure portal, which shows the highlighted Pause button.":::

5. Select **Yes** to confirm you want to pause the capacity.

    :::image type="content" source="media/azure-pbie-pause-start/azure-portal-confirm-pause.png" alt-text="Screenshot of the Azure portal, which shows the highlighted Yes button in the pause capacity dialog.":::

## Start your capacity

Resume usage by starting your capacity. Starting your capacity also resumes billing.

1. Sign into the [Azure portal](https://portal.azure.com/).

2. Select **All services** > **Power BI Embedded** to see your capacities.

    :::image type="content" source="media/azure-pbie-pause-start/azure-portal-more-services.png" alt-text="Screenshot of the Azure portal, which shows the list of Azure services.":::

3. Select the capacity you want to start.

    :::image type="content" source="media/azure-pbie-pause-start/azure-portal-capacity-list.png" alt-text="Screenshot of the Azure portal, which shows the list of Power BI Embedded capacities.":::

4. Select **Start** above the capacity details.

    :::image type="content" source="media/azure-pbie-pause-start/azure-portal-start-capacity.png" alt-text="Screenshot of the Azure portal, which shows the highlighted Start button.":::

5. Select **Yes** to confirm you want to start the capacity.

    :::image type="content" source="media/azure-pbie-pause-start/azure-portal-confirm-start.png" alt-text="Screenshot of the Azure portal, which shows the highlighted Yes button in the start capacity dialog.":::

If any content is assigned to this capacity, the content becomes available once the capacity is started.

## Use CLI to start or pause your capacity

You can also start or pause your capacity from the command line using:

* [Azure Resource Manager API references](/rest/api/power-bi-embedded/capacities)
* [PowerShell references](/powershell/module/az.powerbiembedded)
  * [Suspend](/powershell/module/az.powerbiembedded/suspend-azpowerbiembeddedcapacity)
  * [Resume](/powershell/module/az.powerbiembedded/resume-azpowerbiembeddedcapacity)

## Related content

* [Scale your Power BI Embedded capacity](azure-pbie-scale-capacity.md).
* [How to embed your Power BI dashboards, reports and tiles](https://powerbi.microsoft.com/documentation/powerbi-developer-embedding-content/).

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
