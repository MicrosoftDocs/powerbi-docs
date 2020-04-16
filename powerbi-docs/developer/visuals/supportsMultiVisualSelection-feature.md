---
title: supportsMultiVisualSelection feature
description: This article describes how to use supportsMultiVisualSelection feature in Power BI visuals.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: concepts
ms.date: 04/16/2020
---

# supportsMultiVisualSelection feature
This feature allows to use multi visual selection with multiple visuals in the report.

## Example
Select USA from one visual and multi select “2011” from the other visual. Result selection(both USA and 2011 year) would be applied on other visuals in the report, that supports this feature usage.

## Requirements
> This feature usage requires tools version 3.2.x and API 2.6 or higher.

This feature can be applied on all visuals except image visuals and several advanced visual (key driver, decomposition tree, Q&A visuals, textbox, gauge charts).

## Usage

To use `supportsMultiVisualSelection` feature you need to add the following code in your visual's `capabilities.json` file.
This capability allows the visual to receive focus through keyboard navigation.

```json
    {   
            ...
        "supportsMultiVisualSelection": true
            ...
    }
