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
ms.date: 12/22/2021
---

# Push datasets limitations

This article lists the Power BI REST APIs [push datasets](/rest/api/power-bi/push-datasets) limitations.

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

## Next steps

>[!div class="nextstepaction"]
>[Power BI REST APIs](/rest/api/power-bi/).

>[!div class="nextstepaction"]
>[Push datasets](/rest/api/power-bi/push-datasets).
