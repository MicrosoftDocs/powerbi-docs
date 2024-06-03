---
title: Connect a Power BI report to a dataset using dynamic binding
description: Learn how to embed a Power BI report using dynamic binding.
author: mberdugo
ms.author: monaberdugo
ms.topic: conceptual
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 06/03/2024
---

# Connect a report to a semantic model using dynamic binding

**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::&nbsp;App&nbsp;owns&nbsp;data :::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::&nbsp;User&nbsp;owns&nbsp;data

When a report is connected to a semantic model, you can use dynamic binding. The connection between the report and the semantic model, is known as *binding*. When the binding is determined at the point of embedding, as opposed to being predetermined earlier, the binding is known as dynamic binding.

When embedding a Power BI report using *dynamic binding*, you can connect the same report to different semantic models depending on the user's credentials.

This means that you can use one report to display different information, depending on the semantic model it's connected to. For example, a report showing retail sale values can be connected to different retailer semantic models, and produce different results, depending on the semantic model of the retailer it's connected to.

The report and the semantic model don't need to reside in the same workspace. Both workspaces (the one containing the report, and the one containing the semantic model) must be assigned to a [capacity](azure-pbie-create-capacity.md).

As part of the embedding process, make sure you *generate a token with sufficient permissions*, and *adjust the config object*.

## Generating a token with sufficient permissions

Dynamic binding is supported for both *Embedding for your organization* and *Embedding for your customers* scenarios. The table below describes the considerations for each scenario.

|Scenario  |Data ownership  |Token  |Requirements  |
|---------|---------|---------|---------|
|*Embedding for your organization*    |User owns data         |Access token for Power BI users         |The user whose Microsoft Entra token is used, must have appropriate permissions for all items (reports, semantic models, etc.).         |
|*Embedding for your customers*     |App owns data         |Access token for non-Power BI users         |Must include permissions for both the report and the dynamically bound semantic model. Use the [API for generating an embed token for multiple items](/rest/api/power-bi/embed-token/generate-token), to generate an embed token that supports multiple items.         |

>[!NOTE]
> The maximum number of data sources allowed per user is 1000. This limit implies that the combined number of datas sources used in the dynamic binding between reports and semantic modelts by this user cannot exceed 1000.

## Adjusting the config object

For dynamic binding to work, you need to add `datasetBinding` to the config object. To learn how this is done, see [Bind datasets dynamically to a report](/javascript/api/overview/powerbi/bind-report-datasets).

## Related content

If you're new to embedding in Power BI, review these tutorials to learn how to embed your Power BI content.

* [Embed Power BI content into an application for your customers](embed-sample-for-customers.md)
* [Embed Power BI content into an application for your organization](embed-sample-for-your-organization.md)
