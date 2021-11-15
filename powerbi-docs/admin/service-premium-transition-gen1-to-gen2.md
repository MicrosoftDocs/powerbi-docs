---
title: Plan your transition to Power BI Premium Gen2
description: Learn how customers using Power BI Premium Gen1 will migrate to Premium Gen2 and key dates to plan for.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: david.magar
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 11/14/2021
LocalizationGroup: Premium
---

# Plan your transition to Power BI Premium Gen2

This article provides information about key dates for migrating Power BI Premium capacity to the latest platform.

Over the last several months, we've been working to make many improvements to Power BI Premium. Changes include updates to licensing, performance, scaling, management overhead, and improved insight to utilization metrics. This next generation of Power BI Premium, referred to as Power BI Premium Gen2, has officially moved from preview to general availability as of October 4, 2021. You can read the announcement about this release in the [Power BI blog](https://powerbi.microsoft.com/blog/).

If your organization is using the previous version of Power BI Premium, you're required to migrate capacities to the modern Gen2 platform. The key dates for you to be aware of are listed below:

* **October 4, 2021** - Power BI Premium Gen2 is generally available.
* **November 15, 2021** - We start sending notifications reminding customers to migrate.
* **January 15, 2022** - Microsoft begins migration of Premium capacities to the modern Gen2 platform for all organizations.

## Premium Gen2 prerequisites

Power BI Premium Gen2 and [Embedded Gen2](./../developer/embedded/power-bi-embedded-generation-2.md) support open-platform connectivity from Microsoft and third-party client applications and tools by using XMLA endpoints.

The article [Dataset connectivity with the XMLA endpoint](./../admin/service-premium-connect-tools.md) lists the minimum requirements for Power BI Premium, Premium Per User (PPU) and Embedded connectivity. In addition to these requirements, for dataset connectivity in Premium Gen2, you need to have the following:

* **PowerShell cmdlets** - Version **21.1.18256** or higher

* **Visual Studio with Analysis Services projects** - Version **2.9.16** or higher

* **SQL Server Management Studio (SSMS)** - Version **18.9** or higher

## Self-migration to Premium Generation 2

If you want to perform your own migration to the latest platform before January 15, 2022, it's easy to transition. You simply need to enable Premium Gen2 in the Power BI admin portal. Migrating doesn't interrupt your Power BI service. The change typically completes within a minute and won't take more than 10 minutes.

Ready for the next generation? Follow these steps:

1. Sign in to the [Power BI service](https://app.powerbi.com) as a Power BI capacity admin.
2. From the navigation bar, select **Settings** > **Admin portal** > **Capacity settings**.

    :::image type="content" source="media/service-premium-transition-gen1-to-gen2/gen1-to-gen2-migration-capacity-settings.png" alt-text="Screen capture showing how to get to capacity settings.":::

3. Select **Power BI Premium**.
4. If you have already allocated capacity, select it.
5. The section **Premium Generation 2** appears.
6. Select the slider to switch the setting to **Enabled**. This step is demonstrated in the following animation:

    ![Enabling Premium Generation 2](media/service-premium-what-is/enable-premium-gen2.gif#lightbox) 

## Transition from preview to Premium Gen 2 general availability

Customers using Power BI Premium Gen2 in preview don't need to take any action to transition to the general availability release. However, there are some key dates to consider if you've been using **Autoscale** to balance your capacity needs.

To date, organizations that have enabled Autoscale for capacities have gotten the burst processing benefits of Autoscale for free. Beginning **November 4, 2021** we'll begin charging for Autoscale cores. Take one of the following actions:

* You can continue to use Autoscale to enable the automatic use of additional cores during periods of higher-than normal demand on your capacities. Review the [pricing details for Premium per capacity add-ons](https://powerbi.microsoft.com/pricing/#premium-add-on-card-autoscale) so that you're aware of upcoming charges.
* Or, to avoid Autoscale charges, disable the feature. Autoscale is an optional feature and benefit of the Premium Gen2 platform. You can choose to not use it.

## Migration notification

Following the general availability of gen2, we’ll begin to notify affected customers so that you can prepare your organization for changes. We’ll post additional awareness, along with specific migration timelines to Microsoft 365 Message Center. Admins will receive 60 days advance notice of changes. The timeline will vary by cloud.

## Next steps

* [What is Power BI Premium Gen2?](service-premium-gen2-what-is.md)
* [Using Autoscale with Power BI Premium](service-premium-auto-scale.md)
* [Install the Gen2 metrics app](service-premium-install-gen2-app.md)
