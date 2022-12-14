---
title: Plan your transition to Power BI Premium Gen2
description: Learn how customers using Power BI Premium Gen1 will migrate to Premium Gen2 and key dates to plan for.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: david.magar
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 08/01/2022
LocalizationGroup: Premium
---

# Plan your transition to Power BI Premium Gen2

This article provides information about key dates for migrating Power BI Premium capacity to the latest platform.

Over the last several months, we've been working to make many improvements to Power BI Premium. Changes include updates to licensing, performance, scaling, management overhead, and improved insight to utilization metrics. This next generation of Power BI Premium, referred to as Power BI Premium Gen2, has officially moved from preview to general availability as of October 4, 2021. You can learn more about the Premium Gen2 enhancements in the [Gen2 fundamentals and capacity analytics deep dive](https://go.microsoft.com/fwlink/?linkid=2202475) webinar.

If your organization is using the [original version](service-premium-what-is.md) of Power BI Premium, you're required to migrate to the modern Gen2 platform. Microsoft began migrating all Premium capacities to Gen2. If you have a Premium capacity that requires migrating, **you’ll receive an email notification 60 days before the migration is scheduled to start**.

## Premium Gen2 prerequisites

Power BI Premium Gen2 and [Embedded Gen2](../developer/embedded/embedded-analytics-power-bi.md) support open-platform connectivity from Microsoft and third-party client applications and tools by using XMLA endpoints.

The article [Dataset connectivity with the XMLA endpoint](service-premium-connect-tools.md) lists the minimum requirements for Power BI Premium, Premium Per User (PPU) and Embedded connectivity. In addition to these requirements, for dataset connectivity in Premium Gen2, you need to have the following:

* **Microsoft Excel** - Version **16.0.13612.10000** or higher

* **PowerShell cmdlets** - Version **21.1.18256** or higher

* **Server Profiler** - Version **18.9** or higher

* **SQL Server Management Studio (SSMS)** - Version **18.9** or higher

* **Visual Studio with Analysis Services projects (SSDT)** - Version **2.9.16** or higher

You also need to use the following [client libraries](service-premium-connect-tools.md#client-libraries) when working with Gen2 capacities:

* **ADOMD** - Version **19.12.7.0** or higher

* **AMO** - Version **19.12.7.0** or higher

* **MSOLAP** - Version **15.1.65.22** or higher

## Self-migration to Premium Generation 2

If you want to perform your own migration to the latest platform, it's easy to transition. You simply need to enable Premium Gen2 in the Power BI admin portal. Migrating doesn't interrupt your Power BI service and doesn't involve any additional costs. The change typically completes within a minute.

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

## National cloud supportability

The following table describes Gen2 national cloud supportability. If a certain cloud environment has unsupported Gen2 features, they're also listed in the table.

>[!IMPORTANT]
>China North isn't supported for any Gen2 features.

|Environment |Supported |Unsupported features |
|------------|----------|---------------------|
|U.S. Government Community Cloud (GCC)            |✔️ |Autoscale |
|U.S. Government Community Cloud High (GCC High) |✔️ |          |

## Frequently asked questions

This section answers frequently asked questions related to the migration.

* **Can I go back to Gen1?**

    No.

* **Will I notice downtime during the migration?**

    No downtime is expected. During a short interval that could last up to a minute, queries may take longer to run. If you're running refresh operations during the migration, they will stop and run again after the migration.

* **Do I need to prepare anything or make any changes before the migration?**

    No. You don't need to move workspaces before the migration, or reassign workspaces after the migration.

* **Why do I need to change to Gen 2?**

    Power BI is migrating everyone to Gen2.

* **What differences in Power BI can I expect after the migration?**

    To see a full list of Gen2 benefits, see [What is Power BI Premium Gen2?](service-premium-gen2-what-is.md) and [Power BI Premium Gen2 architecture](service-premium-architecture.md).

* **Does Gen2 have limitations?**

    For a full list of considerations and limitations, see [Considerations and limitations](service-premium-gen2-what-is.md#considerations-and-limitations).

* **Do I need to update the capacity metrics app for Gen2?**

    Yes, the Premium Gen2 platform requires that you download and use the [Power BI Premium Utilization and Metrics app](service-premium-install-gen2-app.md).

## Next steps

>[!div class="nextstepaction"]
>[What is Power BI Premium Gen2?](service-premium-gen2-what-is.md)

>[!div class="nextstepaction"]
>[Using Autoscale with Power BI Premium](service-premium-auto-scale.md)

>[!div class="nextstepaction"]
>[Install the Gen2 metrics app](service-premium-install-gen2-app.md)
