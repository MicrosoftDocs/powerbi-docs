---
title: "Embed a paginated report"
description: Learn how to embed a Power BI paginated report
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 01/31/2023
---

# Embed a paginated report

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)] 

This article provides an overview of the differences between embedding a Power BI report, and embedding a Power BI paginated report. The article is aimed at developers using Power BI [embedded analytics](/power-bi/developer/embedded/) to embed a paginated report.

## Semantic model considerations

A Power BI report is always bound to a single data source. However, a paginated report doesn't require a Power BI semantic model as a data source. A paginated report can also be built on multiple semantic models. This means you cannot rely on the `datasetId` property of a report object, when embedding a paginated report.

## Token considerations

There are some special considerations when generating an embed token for a paginated report with an [Embed for your customers](../developer/embedded/embedded-analytics-power-bi.md#embed-for-your-customers) solution. If the paginated report has one or more Power BI semantic models configured as its data sources, you must create a [GenerateTokenRequestV2Dataset](/rest/api/power-bi/embed-token/generate-token#generatetokenrequestv2dataset) object for each semantic model, with the following parameters:

* `xmlaPermissions` must be set to `ReadOnly`

* `allowEdit` must be set to `false`
 
## Unsupported features

Before embedding a paginated report, consider the following Power BI features which aren't supported:

* Edit mode or any type of self-service authoring

* Client-side [events](/javascript/api/overview/powerbi/handle-events) such as `loaded` and `rendered`

* [Dynamic binding](/javascript/api/overview/powerbi/bind-report-datasets)

* Reading or updating [filter settings](/javascript/api/overview/powerbi/control-report-filters)

* [Page navigation](/javascript/api/overview/powerbi/page-navigation)

* Retrieving a parameter value that’s been updated by the user using an API
 
## Code example

The following code listing demonstrates generating an embed token to embed a paginated report built on top of a Power BI semantic model.

```javascript
string datasetId = "11111111-1111-1111-1111-111111111111";
Guid reportId = new Guid("22222222-2222-2222-2222-222222222222");

// create semantic model request for embed token with XmlaPermissions.ReadOnly
var datasetRequests = new List<GenerateTokenRequestV2Dataset> {
  new GenerateTokenRequestV2Dataset(datasetId, xmlaPermissions: XmlaPermissions.ReadOnly)
};

// create report request for embed token with allowEdit set to false
var reportRequests = new List<GenerateTokenRequestV2Report>{
  new GenerateTokenRequestV2Report(reportId, allowEdit: false)
};

// create token request
var tokenRequest = new GenerateTokenRequestV2 {
  Datasets = datasetRequests,
  Reports = reportRequests,
};

// call GenerateToken to retrieve embed token from Power BI REST API
var EmbedTokenResult = pbiClient.EmbedToken.GenerateToken(tokenRequest);

// extract embed token for embed token result
var embedToken = EmbedTokenResult.Token;
```

## Related content 

> [!div class="nextstepaction"]
> [Using the Power BI REST APIs](/rest/api/power-bi/)

> [!div class="nextstepaction"]
> [Power BI embedded analytics Client APIs](/javascript/api/overview/powerbi/)
