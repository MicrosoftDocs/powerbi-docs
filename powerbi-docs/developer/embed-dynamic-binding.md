---
title: Dynamic binding
description: Learn how to embed, a report using dynamic binding.
author: KesemSharabi
ms.author: kesharab
manager: rkarlin
ms.topic: conceptual
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 09/25/2019
---

# Dynamic binding

Dynamic binding allows embedding one report across multiple datasets with the same data schema. When using dynamic binding the report is dynamically connected to multiple datasets, and it displays different results for end users, depending on the dataset it's connected to. 

## Generate a token
Use the instructions in [Get an Azure AD access token for your Power BI application](get-azuread-access-token.md), to generate a token.

The following table lists the considerations you need to take into account when generating the token.


| Solution type                   | Token                               | Requirements                                                                                                                                                  |
|---------------------------------|-------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| *Embedding for your organization* | Access token for Power BI users     | The user who’s Azure AD token is used, must have appropriate permissions for all artifacts                                                                    |
| *Embedding for your customers*    | Access token for non-Power BI users | Must include permissions for both the report and the dynamically bound dataset. Use the new API to generate an embed token which supports multiple artifacts. |
## Adjust the config objexct
Add `datasetBinding` to the config object. Use the example at the bottom of the page as a reference.

If you're new to embedding in Power BI, review these tutorials to learn how to embed your Power BI content:
* [Embed Power BI content into an application for your customers](embed-sample-for-customers.md)
* [Tutorial: Embed Power BI content into an application for your organization](embed-sample-for-your-organization.md)

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