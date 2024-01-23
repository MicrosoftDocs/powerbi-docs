---
title: "New name for Power BI datasets"
description: "Microsoft has renamed the Power BI dataset content type to semantic model."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: painbar
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 11/14/2023
LocalizationGroup: Share your work
---

# New name for Power BI datasets

Microsoft has renamed the Power BI _dataset_ content type to _semantic model_.

The rename was necessary for two main reasons.

- The term _dataset_ is considered too generic. It has different meanings in the context of other data-related activities, especially now that Power BI is one of many experiences in [Microsoft Fabric](/fabric/get-started/microsoft-fabric-overview).
- The term _semantic model_ better reflects the rich functionality of Analysis Services data models, upon which Power BI reports are based.

> [!IMPORTANT]
> This change is a rename only. There's no interruption to usage or service. You can expect a continuation of service because administrators, developers, and other users aren't required to make any changes.

> [!TIP]
> To avoid confusion and support requests, be sure to notify your [community of practice](../guidance/fabric-adoption-roadmap-community-of-practice.md) of this change.

## Name changes

Here are some examples of name changes.

| Old name | New name |
| --- | --- |
| Dataset | Semantic model |
| Shared dataset | Shared semantic model |
| Import dataset | Import semantic model |
| DirectQuery dataset | DirectQuery semantic model |
| Composite dataset | Composite semantic model |
| Live connection dataset | Live connection semantic model |
| On-premises dataset | On-premises semantic model |
| Dataset owner | Semantic model owner |
| Large dataset | Large semantic model |

> [!NOTE]
> The name change has been rolled out in the Power BI service and in documentation, though there might be some instances where the change hasn't occurred yet.

## Name change exceptions

The following concepts aren't affected.

- Generic references to datasets
- [Power BI paginated report dataset](../paginated-reports/report-data/report-data.md)
- [Power BI real-time dataset](service-real-time-streaming.md), including:
  - Push dataset
  - Streaming dataset
  - Hybrid dataset
  - PubNub dataset
- All [Power BI REST API operations](/rest/api/power-bi/) related to datasets
- [Power BI activity log operations](/fabric/admin/track-user-activities)
- Other types of datasets that aren't related to Power BI, for example, [Azure Open Datasets](/azure/open-datasets/dataset-catalog)

## Related content

For more information related to this article, check out the following resources.

- Blog post: [Datasets renamed to semantic models](https://aka.ms/DatasetRename)
- Questions? Try asking the [Fabric Community](https://community.fabric.microsoft.com/).
- Suggestions? [Contribute ideas to improve Fabric](https://ideas.fabric.microsoft.com/).
