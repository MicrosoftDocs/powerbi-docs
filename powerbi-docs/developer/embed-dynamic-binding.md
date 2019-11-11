---
title: Connecting a report to a dataset using dynamic binding 
description: Learn how to embed a report using dynamic binding.
author: KesemSharabi
ms.author: kesharab
ms.topic: conceptual
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 11/07/2019
---

# Connecting a report to a dataset using dynamic binding 

Using dynamic binding is only relevant when a report is connected to a dataset. The connection between the report and the dataset, is known as *binding*. When the binding is determined at the point of embedding, as opposed to being predetermined earlier, the binding is known as [dynamic binding](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FLate_binding&data=02%7C01%7CKesem.Sharabi%40microsoft.com%7C5d5b0d2d62cf4818f0c108d7635b151e%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637087115150775585&sdata=AbEtdJvgy4ivi4v4ziuui%2Bw2ibTQQXBQNYRKbXn5scA%3D&reserved=0).
 
When embedding a Power BI report using *dynamic binding*, you can connect the same report to different datasets depending on the user’s credentials.
 
This means that you can use one report to display different information, depending on the dataset it’s connected to. For example, a report showing retail sale values can be connected to different retailer datasets, and produce different results, depending on the dataset of the retailer it’s connected to.
 
The report and the dataset don't need to reside in the same workspace. Both workspaces (the one containing the report, and the one containing the dataset) must be assigned to a [capacity](azure-pbie-create-capacity.md).

As part of the embedding process, make sure you *generate a token with sufficient permissions*, and *adjust the config object*.


## Generating a token with sufficient permissions

Dymanic binding is supported for both *Embedding for your organization* and *Embedding for your customers* scenarios. The table below describes the considerations for each scenario.


|Scenario  |Data ownership  |Token  |Requirements  |
|---------|---------|---------|---------|
|*Embedding for your organization*    |User owns data         |Access token for Power BI users         |The user who’s Azure AD token is used, must have appropriate permissions for all artifacts.         |
|*Embedding for your customers*     |App owns data         |Access token for non-Power BI users         |Must include permissions for both the report and the dynamically bound dataset. Use the [API for generating an embed token for multiple items](embed-sample-for-customers.md#multiEmbedToken), to generate an embed token that supports multiple artifacts.         |

## Adjusting the config object
Add `datasetBinding` to the config object. Use the example below as a reference.

```javascript
var config = {
    type: 'report',
    tokenType: models.TokenType.Embed,
    accessToken: accessToken,
    embedUrl: embedUrl,
    id: "reportId", // The wanted report id
    permissions: permissions,

    // -----  Adjustment required for dynamic binding ---- //
    datasetBinding: {
		datasetId: "notOriginalDatasetId",  // </The wanted dataset id
	}
    // ---- End of dynamic binding adjustment ---- //
};

// Get a reference to the embedded report HTML element
var embedContainer = $('#embedContainer')[0];

// Embed the report and display it within the div container
var report = powerbi.embed(embedContainer, config);
```

## Next steps

If you're new to embedding in Power BI, review these tutorials to learn how to embed your Power BI content:
* [Tutorial: Embed Power BI content into an application for your customers](embed-sample-for-customers.md)
* [Tutorial: Embed Power BI content into an application for your organization](embed-sample-for-your-organization.md)