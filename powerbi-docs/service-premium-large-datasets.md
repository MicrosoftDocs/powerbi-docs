---
title: Power BI Premium support for large datasets
description: Power BI Premium now supports datasets up to 10 GB.
services: powerbi
documentationcenter: ''
author: MarkMcGeeAtAquent
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 12/11/2017
ms.author: v-mamcge

---

# Power BI Premium support for large datasets

Power BI Premium supports datasets up to 10 GB in size. To use a large dataset, publish it to a workspace that is assigned to Premium capacity. Everything else stays the same, and all other Power BI features work as expected.
 
## Best practices

This section describes best practices for working with large datasets.

**Large models can be very resource-intensive** on your capacity; we recommend at least a P1 SKU for any models larger than 1 GB. The following table describes recommended SKUs for various .pbix sizes:


   |SKU  |Size of .pbix   |
   |---------|---------|
   |P1    | < 3 GB        |
   |P2    | < 6 GB        |
   |P3    | up to 10 GB   |



**Your .pbix files represent data in a highly compressed state**. The data will likely expand several times when loaded in memory, and from there it may expand several more times during data refresh.

**Scheduled refresh of large datasets can take a long time** and be very resource-intensive. Accordingly, do not schedule too many overlapping refreshes. Notice also that the timeout for scheduled refresh jobs has been doubled to four hours for all datasets in this capacity.

**The initial report load of large datasets can take a long time** if it has been a while since the last time the dataset was used, because the model is loaded into memory of your Premium capacity. A loading bar for longer-loading reports displays the load progress.

**If you remove the workspace from Premium capacity**, the model and all associated reports and dashboards will not work.

**While the per-query memory and time constraints are much higher in Premium capacity**, it is highly recommended you use filters and slicers to limit visuals to display only what is necessary.

## Next steps
[Power BI Premium - what is it?](service-premium.md)  
[Power BI Premium release notes](service-premium-release-notes.md)  
[Microsoft Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)  
[Planning a Power BI Enterprise Deployment whitepaper](https://aka.ms/pbienterprisedeploy)  
[Extended Pro Trial activation](service-extended-pro-trial.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
