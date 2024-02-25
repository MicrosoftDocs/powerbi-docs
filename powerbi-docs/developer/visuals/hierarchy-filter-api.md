---
title: The hierarchical identity Filters API for better embedded BI insights
description: This article discusses how Power BI visuals can filter visuals based on several attributes.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 06/19/2022
---

# The hierarchical identity filters API in Power BI visuals

The *hierarchical identity filters API* allows you to filter data in Power BI visuals using several different attributes at once.

To enable filtering for the visual, the *capabilities.json* file should contain a `filter` object in the `general` section.