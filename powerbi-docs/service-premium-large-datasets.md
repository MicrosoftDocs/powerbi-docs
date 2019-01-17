---
title: Power BI Premium support for large datasets
description: Power BI Premium now supports datasets up to 10 GB.
author: jocaplan
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 10/18/2018
ms.author: jocaplan

LocalizationGroup: Premium
---

# Power BI Premium support for large datasets

Power BI Premium supports uploads of Power BI Desktop (.pbix) files that are up to 10 GB in size. Once uploaded, a dataset can be refreshed to up to 12 GB in size. To use a large dataset, publish it to a workspace that is assigned to Premium capacity.
 
## Best practices

This section describes best practices for working with large datasets.

**Large models can be very resource-intensive** on your capacity. We recommend at least a P1 SKU for any models larger than 1 GB. Although publishing large models to workspaces backed by A SKUs up to A3 might work, refreshing them will not.

The following table describes recommended SKUs for various .pbix sizes:

   |SKU  |Size of .pbix   |
   |---------|---------|
   |P1    | < 3 GB        |
   |P2    | < 6 GB        |
   |P3, P4, P5    | up to 10 GB   |

The Power BI Embedded A4 SKU is equal to the P1 SKU, A5 = P2 and A6 = P3. Note that publishing large models to A and EM SKUs might return errors that aren't specific to the model size limitation error in the shared capacity. Refresh errors for large models in A and EM SKUs are likely to point to timeouts. We are working on improving the error messages for these scenarios.

**Your .pbix files represent data in a highly compressed state**. The data will likely expand several times when loaded in memory, and from there it may expand several more times during data refresh.

**Scheduled refresh of large datasets can take a long time** and be very resource-intensive. Accordingly, do not schedule too many overlapping refreshes. Notice also that the timeout for scheduled refresh jobs has been doubled to four hours for all datasets in this capacity. We recommend [incremental refresh](service-premium-incremental-refresh.md), because it's faster, more reliable, and consumes fewer resources.

**The initial report load of large datasets can take a long time** if it has been a while since the last time the dataset was used, because the model is loaded into memory of your Premium capacity. A loading bar for longer-loading reports displays the load progress.

**If you remove the workspace from Premium capacity**, the model and all associated reports and dashboards will not work.

**While the per-query memory and time constraints are much higher in Premium capacity**, it is highly recommended that you use filters and slicers to limit visuals to display only what is necessary.

**Next steps**

[What is Power BI Premium?](service-premium.md)
[Power BI Premium release notes](service-premium-release-notes.md)
[Microsoft Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)
[Planning a Power BI Enterprise Deployment whitepaper](https://aka.ms/pbienterprisedeploy)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
