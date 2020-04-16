---
title: supportsMultiVisualSelection feature
description: This article describes how to use supportsMultiVisualSelection feature in Power BI visuals.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 04/16/2020
---

# supportsMultiVisualSelection feature
This feature allows you to use multi visual selection with multiple visuals in the report.

## Example
Select "USA" from one visual and multi select “2011” from the other visual. Result selection would be applied on other visuals in the report, that supports this feature usage. Result selection will include both "USA" and "2011".

## Requirements
> This feature usage requires Power BI visuals tools v3.2.x and API higher than v2.6. This feature is not available now.

This feature can be applied on all visuals except image visuals and several advanced visuals like key driver, decomposition tree, Q&A visuals, textbox, gauge charts and etc.

## Usage

To use `supportsMultiVisualSelection` feature you need to add the following code in your visual's `capabilities.json` file.
This capability allows the visual to receive focus through keyboard navigation.

```json
    {   
            ...
        "supportsMultiVisualSelection": true
            ...
    }
