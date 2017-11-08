---
title: Embed a report using an iFrame
description: Installing Power BI Reports Server itself is very quick. From downloading, to installing and configuring, you should be up and running within a few minutes.
services: powerbi
documentationcenter: ''
author: guyinacube
manager: erikre
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 09/05/2017
ms.author: asaxton

---
# Quickstart: Embed a report using an iFrame
You can embed any report by using an iFrame in your application. 

## URL parameter
For any URl to a report, you can add a querystring parameter of `?rs:Embed=true`.

For example:

```
http://myserver/reports/powerbi/Sales?rs:embed=true
```

This will work on all report types within Power BI Report Server.

## iFrame
Once you have your URL, you can create an iFrame within a web page, to host the report.

For example:

```
<iframe width="800" height="600" src="http://myserver/reports/powerbi/Sales?rs:embed=true" frameborder="0" allowFullScreen="true"></iframe>
```

## Next steps
[Quickstart: Create a Power BI report for Power BI Report Server](reportserver-quickstart-powerbi-report.md)  
[Quickstart: Create a paginated report for Power BI Report Server](reportserver-quickstart-paginated-report.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

