---
title: Power BI REST APIs push semantic model limitations
description: This article lists the Power BI REST APIs push semantic model limitations that the user should be aware of before using the APIs.
author: mberdugo
ms.author: monaberdugo
services: power-bi-embedded
editor: ''
tags: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: reference
ms.date: 06/04/2024
---

# Push semantic model limitations

[Push semantic models](/rest/api/power-bi/push-datasets) are **very limited** in their functionality. They're designed *only* for a near real-time streaming scenario to be consumed by a streaming tile in a dashboard, and not by a Power BI report.  
This article lists limitations of the Power BI REST APIs [Push semantic models](/rest/api/power-bi/push-datasets).

## Limitations

Review the following list of limitations before using the *push semantic models* APIs.

* 75 max columns

* 75 max tables

* 10,000 max rows per single POST rows request

* 1,000,000 rows added per hour per semantic model

* 5 max pending POST rows requests per semantic model

* 120 POST rows requests per minute per semantic model

* If table has 250,000 or more rows, 120 POST rows requests per hour per semantic model

* 200,000 max rows stored per table in FIFO semantic model

* 5,000,000 max rows stored per table in 'none retention policy' semantic model

* 4,000 characters per value for string column in POST rows operation

* 75 max relationships

* Doesn't work with service principal profiles

## Related content

* [Power BI REST APIs](/rest/api/power-bi/).
* [Push semantic models](/rest/api/power-bi/push-datasets).
