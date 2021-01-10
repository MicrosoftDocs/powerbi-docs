---
title: Power BI Embedded Gen2 explained as part of Power BI embedded analytics enabling better embedded BI insights
description: Learn about the Power BI Embedded Gen2 offering in Power BI embedded analytics, which enable better embedded BI insights.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: tutorial
ms.date: 01/06/2021
---

# Power BI Embedded Generation 2 (preview)

Power BI Embedded recently released a new version of Power BI Embedded, **Power BI Embedded Generation 2**, referred to as **Embedded Gen2** for convenience. Embedded Gen2 is currently in preview, and is available for embedded subscribers to use during the preview period. You can still create the original version of the Power BI Embedded resource, called *Embedded Gen 1*, or create a new *Embedded Gen 2* resource. During the preview period, you can run both types of Power BI Embedded resources in parallel, each assigned to a different workspace.

All of the Power BI Embedded Gen 1 capabilities such as pausing and resuming the capacity, are preserved in Gen 2. In addition, the Gen 2 capacity resource provides the following updates and improved experience:

* **Enhanced performance** - Better performance on any capacity size, anytime. BI analysis operations run up to 16 times faster on Embedded Gen2. Operations will always perform at top speed and won't slow down when the load on the capacity approaches the capacity limits.

* **Greater scale** - Including the following enhancements:

    * *No limits on refresh concurrency* - You no longer need to track schedules for datasets being refreshed on your capacity

    * *Fewer memory restrictions*

    * *Complete separation between report interaction and scheduled refreshes*

* **Lower entry level for paginated reports and AI workloads** – Start with an *A1* SKU and grow as you need.

* **Scaling a resource instantly** - Instantly scale your Power BI Embedded resource. From scaling a Gen1 resource in minutes, to scaling a Gen2 resource in seconds.

* **Scaling without downtime** - With Embedded Gen2 you can scale your Power BI Embedded resource without experiencing any downtime. From minutes for scaling a classic Power BI Embedded resource, to seconds for scaling an Embedded Gen 2 resource.

* **Improved metrics** - Including clear and normalized capacity utilization data, depending only on the complexity of the analysis operations the capacity performs. Metrics are not impacted by other factors such as the size of the capacity, and the level of load on the system while performing analytics. When using the improved metrics, the built-in reporting tool allows you to clearly see:
    * Utilization analysis
    * Budget planning
    * Chargebacks
    * The need to upgrade your capacity

    >[!NOTE]
    >Improved metrics will be made available later in the preview period. Customers seeking access to utilization metrics for the past seven days, can do so by contacting customer support.

## Using Embedded Gen2

Create an Embedded Gen2 capacity resource to take advantage of its updates. To create an Embedded Gen2 capacity resource, follow the instructions in [Create Power BI Embedded capacity in the Azure portal](azure-pbie-create-capacity.md).

## Known limitations

* Embedded Gen2 capacity utilization can't be tracked in the metrics app.

* Memory allocation settings for specific workloads don't apply to Embedded Gen2 capacities.

* If you're using XMLA with Embedded Gen2, make sure you're using the most recent versions of the data modeling and management tools.

* Analysis services features in Embedded Gen2 are only supported on the latest client libraries. Estimated release dates for dependent tools to support this requirement are listed in [Known limitations in Premium Gen2](../../admin/service-premium-what-is.md#known-limitations-in-premium-gen2).

## Next steps

> [!div class="nextstepaction"]
> [Create Power BI Embedded capacity in the Azure portal](azure-pbie-create-capacity.md)

> [!div class="nextstepaction"]
> [Capacity and SKUs in Power BI embedded analytics](embedded-capacity.md)

> [!div class="nextstepaction"]
> [What is Power BI Premium?](../../admin/service-premium-what-is.md)

> [!div class="nextstepaction"]
>[Embed for your customers](embed-sample-for-customers.md)

> [!div class="nextstepaction"]
>[Embed for your organization](embed-sample-for-your-organization.md)