---
title: Dynamic binding
description: Learn how to embed, a report using dynamic binding.
author: KesemSharabi
ms.author: kesharab
manager: rkarlin
ms.topic: conceptual
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 25/09/2019
---

# Dynamic binding

Dynamic binding allows embedding one report across multiple datasets with the same data schema. When using dynamic binding the report is dynamically connected to multiple datasets, and it displays different results for end users, depending on the dataset it's connected to. 

## Embedding using dynamic binding

1. Generate a token. For step-by-step instructions, see [Get an Azure AD access token for your Power BI application](get-azuread-access-token.md).
>> [!NOTE]
>> There are two types of tokens:
>> * **Access token for Power BI users** - use if you're solution requires *embedding for your organization*
>> * **Access token for non-Power BI users** - use if your solution requires *embedding for your customers*
2. Add `datasetBinding` to the config object. Use the example at the bottom of the page as a reference.
> [!NOTE]
> If you're new to embedding in Power BI, review these tutorials to learn how to embed your Power BI content:
> * [Embed Power BI content into an application for your customers](embed-sample-for-customers.md)
> * [Tutorial: Embed Power BI content into an application for your organization](embed-sample-for-your-organization.md)

 ### Example
```javascript
var config = {
    type: 'report',
    tokenType: models.TokenType.Embed,
    accessToken: accessToken,
    embedUrl: embedUrl,
    id: "reportId", // The wanted report id
    permissions: permissions,
    datasetBinding: {
		datasetId: "notOriginalDatasetId", // The wanted dataset id
	}
};

// Get a reference to the embedded report HTML element
var embedContainer = $('#embedContainer')[0];

// Embed the report and display it within the div container
var report = powerbi.embed(embedContainer, config);
```