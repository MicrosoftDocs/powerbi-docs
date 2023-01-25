---
title: Power BI REST APIs push datasets limitations
description: This article lists the Power BI REST APIs push datasets limitations
author: mberdugo
ms.author: monaberdugo
services: power-bi-embedded
editor: ''
tags: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: reference
ms.date: 06/27/2022
---

# Push datasets limitations

[Push datasets](/rest/api/power-bi/push-datasets) are **very limited** in their functionality. They're designed *only* for a near real-time streaming scenario to be consumed by a streaming tile in a dashboard, and not by a Power BI report.  
This article lists limitations of the Power BI REST APIs [push datasets](/rest/api/power-bi/push-datasets).

## Limitations

Review the following list of limitations before using the *push datasets* APIs.

* 75 max columns

* 75 max tables

* 10,000 max rows per single POST rows request

* 1,000,000 rows added per hour per dataset

* 5 max pending POST rows requests per dataset

* 120 POST rows requests per minute per dataset

* If table has 250,000 or more rows, 120 POST rows requests per hour per dataset

* 200,000 max rows stored per table in FIFO dataset

* 5,000,000 max rows stored per table in 'none retention policy' dataset

* 4,000 characters per value for string column in POST rows operation

* 75 max relationships

## Next steps

* [Power BI REST APIs](/rest/api/power-bi/).
* [Push datasets](/rest/api/power-bi/push-datasets).
