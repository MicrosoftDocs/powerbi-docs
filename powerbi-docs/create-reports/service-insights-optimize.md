---
title: Optimize your data for Power BI Quick Insights
description: Learn how to optimize your data for Power BI Quick Insights and what to do if Power BI doesn't find insights in your data.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 02/28/2023
LocalizationGroup: Dashboards
---
# Optimize your data for Power BI Quick Insights

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Want to improve Quick Insights results? If you're a semantic model owner, try these suggestions:

* Hide or unhide columns in your semantic model. Power BI Quick Insights doesn't search hidden columns, so hide duplicate or unnecessary columns, and unhide interesting columns.
* Use a mix of data types such as names, times, dates, and numbers.
* Avoid or hide columns with duplicate information. Duplicate data takes valuable time away from searching for meaningful patterns. For example, one column with state names spelled out and another column with state name abbreviations.
* Do you get an error message stating that your data isn't statistically significant? Quick Insights might generate that message in one of these instances:
  * Data models that are simple.
  * Data models that don't have much data.
  * Data models that don't have date or numeric columns.

## Related content

* [Power BI quick insights](../consumer/end-user-insights.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
