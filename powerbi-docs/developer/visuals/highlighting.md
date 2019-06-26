---
title: Highlighting
description: Data points selections highlighting in Power BI Visuals
author: sranins
ms.author: rasala
manager: AviSander
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/18/2019
---

# Highlighting

By default whenever an element is selected the `values` array in the `dataView` object will be filtered to just the selected values. It will cause all other visuals on the page to display just the selected data.

![highlight `dataview` default behavior](./media/highlight-dataview.png)

## supportsHighlight property

If you set the `supportsHighlight` property in your `capabilities.json` to `true`, you'll receive the full unfiltered `values` array along with a `highlights` array. The `highlights` array will be the same length as the values array and any non-selected values will be set to `null`. With this property enabled it's the visual's responsibility to highlight the appropriate data by comparing the `values` array to the `highlights` array.

![highlight `dataview` supportshighlight](./media/highlight-dataview-supports.png)

In the example, you'll notice the 1 bar that is selected. And it's the only value in the highlights array. It's also important to note there could be multiple selections and partial highlight. There's the corresponding numeric value in the values and highlights arrays will be present but different.
