---
title: Connect a Power BI report to a dataset using dynamic binding
description: Learn how to embed a Power BI report using dynamic binding.
author: mberdugo
ms.author: monaberdugo
ms.topic: conceptual
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 01/17/2021
---

# Connect a report to a dataset using dynamic binding 

When a report is connected to a dataset, you can use dynamic binding. The connection between the report and the dataset, is known as *binding*. When the binding is determined at the point of embedding, as opposed to being predetermined earlier, the binding is known as dynamic binding.

When embedding a Power BI report using *dynamic binding*, you can connect the same report to different datasets depending on the user's credentials.

This means that you can use one report to display different information, depending on the dataset it's connected to. For example, a report showing retail sale values can be connected to different retailer datasets, and produce different results, depending on the dataset of the retailer it's connected to.

The report and the dataset don't need to reside in the same workspace. Both workspaces (the one containing the report, and the one containing the dataset) must be assigned to a [capacity](azure-pbie-create-capacity.md).

As part of the embedding process, make sure you *generate a token with sufficient permissions*, and *adjust the config object*.

## Generating a token with sufficient permissions

Dynamic binding is supported for both *Embedding for your organization* and *Embedding for your customers* scenarios. The table below describes the considerations for each scenario.

|Scenario  |Data ownership  |Token  |Requirements  |
|---------|---------|---------|---------|
|*Embedding for your organization*    |User owns data         |Access token for Power BI users         |The user who's Azure AD token is used, must have appropriate permissions for all artifacts.         |
|*Embedding for your customers*     |App owns data         |Access token for non-Power BI users         |Must include permissions for both the report and the dynamically bound dataset. Use the [API for generating an embed token for multiple items](/rest/api/power-bi/embedtoken/generatetoken), to generate an embed token that supports multiple artifacts.         |

## Adjusting the config object

For dynamic binding to work, you need to add `datasetBinding` to the config object. To learn how this is done, see [Bind datasets dynamically to a report](/javascript/api/overview/powerbi/bind-report-datasets). 

## Next steps

If you're new to embedding in Power BI, review these tutorials to learn how to embed your Power BI content.

>[!div class="nextstepaction"]
>[Embed Power BI content into an application for your customers](embed-sample-for-customers.md)

>[!div class="nextstepaction"]
>[Embed Power BI content into an application for your organization](embed-sample-for-your-organization.md)