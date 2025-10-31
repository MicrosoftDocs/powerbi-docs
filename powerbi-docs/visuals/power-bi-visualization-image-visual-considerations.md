---
title: Image visual considerations and limitations
description: This document outlines all the considerations and limitations for the Image visual in Power BI Desktop and Power BI service.
author: jacinda-eng
ms.author: jacindaeng
ms.reviewer: JulCsc
ms.custom: sample-Retail-Analysis
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/30/2025
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to understand all the considerations and limitions for the Image visual so that I can effectively and more easily build Image visuals in Power BI Desktop and Power BI service.
---
# Image visual considerations and limitations

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

As a Power BI user, the awareness of any Image visual considerations and limitations is helpful when creating effective and visually appealing visualizations.

Understanding the considerations and limitations allow you to make informed decisions and leverage the full potential of Power BI Image visuals. Whether you're a novice or an experienced user, this article aims to enhance your experience by keeping you up-to-date with practical insights and tips for any known issues.

## Considerations and limitations

This article provides an updated list of any known considerations and limitations for  the Image visual, designed to help you navigate the nuances of image visuals in both Power BI Desktop and the Power BI service.

### X-axis

#### Default scrolling position

In Power BI, when the categorical axis is set as the X-axis, users may encounter inconvenience with the scrollbar starting on the left, particularly when displaying date/time values. This issue arises because there is no setting available to control the default scrolling position, which can be problematic when users wish to view dates from earliest to latest. It is recommended to use a continuous axis instead of a categorical axis when working with date/time values. This will allow for a more intuitive display of data over time, with the scrollbar beginning at the earliest date as expected.

#### Intervals

Users have expressed a need to control intervals for numerical or date/time values on a continuous axis in Power BI. Unfortunately, there are currently no settings available to manage these intervals directly. The intervals on a continuous axis are automatically determined by Power BI based on the data points visible and the size of the visual container. This automatic adjustment is designed to optimize the display of data within the available space. As of now, there is no workaround to manually set these intervals. Users must rely on the automatic interval settings determined by Power BI.

## Related content

* [Create an Image visual](power-bi-visualization-image-visual.md)
* [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
* [Combo charts in Power BI](power-bi-visualization-combo-chart.md)
* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
