---
title: Gen2 Premium explained in Power BI embedded analytics enabling better embedded BI insights
description: Learn about the Gen2 Premium offering in Power BI embedded analytics, which enable better embedded BI insights.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: tutorial
ms.custom: seodec18, devx-track-js
ms.date: 06/01/2021
---

# Power BI Embedded Premium Generation 2 (preview)

Power BI Embedded recently released a new version of Power BI Embedded, **Power BI Embedded Generation 2**, referred to as **Embedded Gen2** for convenience. Embedded Gen2 is currently in preview, and is available for Embedded subscribers to use during the preview period. You can still create the original version of Power BI Embedded resource, called Embedded Gen 1, or create a new Embedded Gen 2 resource. During the preview period, you can run both types of Power BI Embedded resources in parallel, each assigned to a different workspace.

>[!NOTE]
>This article lists the **Power BI Embedded** Premium Gen2 enhancements. To review all the Power BI Premium Gen2 benefits, refer to [Power BI Premium Generation 2](../../admin/service-premium-what-is.md#power-bi-premium-generation-2-preview). 

Embedded Gen2 capacity resource provides the following updates and improved experience:

* **Enhanced performance** - Better performance on any capacity size, anytime. Analytics operations run up to 16 times faster on Embedded Gen2. Operations will always perform at top speed and won't slow down when the load on the capacity approaches the capacity limits.

* **Greater scale**
    * **No limits** on refresh concurrency. You no longer need to track schedules for datasets being refreshed on your capacity
    * **Fewer memory restrictions**
    * **Complete separation** between report interaction and scheduled refreshes.

* **Lower entry level for paginated reports and AI workloads** – Start with an *A1* SKU and grow as you need.

* **Scaling a resource instantly** - Instantly scale your Power BI Embedded resource.

* **Scaling without downtime** - Scale your Power BI Embedded resource without experiencing downtime.

* **Improved metrics** - Including clear and normalized capacity utilization data, depending only on the complexity of analytics operations the capacity performs. Metrics are not impacted by other factors such as the size of the capacity, and the level of load on the system while performing analytics. 

    When using the improved metrics, you can clearly see the following using the built-in reporting:
    * Utilization analysis
    * Budget planning
    * Chargebacks
    * The need to upgrade your capacity

    >[!NOTE]
    >Improved metrics will be made available later in the preview period. Customers seeking access to utilization metrics for the past seven days, can do so by contacting customer support.

## Using Embedded Gen2

Create an Embedded Gen2 capacity resource to take advantage of its updates. To create an Embedded Gen2 capacity resource, follow the instructions in [Create Power BI Embedded capacity in the Azure portal](azure-pbie-create-capacity.md).




## Next steps

* A sample application is available on GitHub for you to review. The above examples are based on that sample. For more information, see [Embedding for your organization sample](https://github.com/microsoft/PowerBI-Developer-Samples/tree/master/.NET%20Core/Embed%20for%20your%20customers/AppOwnsData).

* For more information about JavaScript API, reference [Power BI JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript).

* For more information about for Power BI for Germany cloud, reference [Power BI for Germany cloud FAQ](../../admin/service-govde-faq.md)

* [How to migrate Power BI Workspace Collection Workspace Collection content to Power BI](migrate-from-powerbi-embedded.md)

Considerations and limitations

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
