---
title: Power BI REST APIs push semantic model limitations
description: This article lists the Power BI REST APIs push semantic model limitations that the user should be aware of before using the APIs.
author: mberdugo
ms.author: monaberdugo
services: power-bi-embedded
reviewer: Eklavya Mirani
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: reference
ms.date: 06/04/2024
---

# Push semantic model limitations

This article lists limitations of the Power BI REST APIs [Push semantic models](/rest/api/power-bi/push-datasets).

> [!NOTE]
> Real-time streaming in Power BI is scheduled for deprecation. For more information and recommended alternatives, see [Announcing the retirement of real-time streaming in Power BI](https://powerbi.microsoft.com/blog/announcing-the-retirement-of-real-time-streaming-in-power-bi/).

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
