---
title: Configure interaction settings
description: Learn how to override default interaction settings.
author: paulinbar
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: conceptual
ms.date: 01/16/2020
ms.author: painbar

---
# Configure interaction settings

## Overview

The Power BI mobile app has a number of configurable "interaction" settings that enable you to control how you interact with your data, and to define how some elements in the Power BI mobile app behave.

To get to the interaction settings, tap your profile picture to open the [side panel](./mobile-apps-home-page.md#header), choose **Settings**, and find the **Interaction** section.

![Interaction settings](./media/mobile-app-interaction-settings/powerbi-mobile-app-interactions-section.png)

## Single tap
The single tap setting defines whether you need a single tap or a double tap to start interacting with report data. When Single tap is on, you need only a single tap on a report visual, button, or slicer to start interacting with its data. When single tap is off, you tap once to select the item and then again to start the interaction.

By default Single tap is on.

## Report refresh

The report refresh setting defines how you want to refresh reports. You can either add a refresh button to all report headers and then use that to refresh reports, or you can use the pull-to-refresh action (pulling down slightly from top to bottom) on the report page to refresh the report.

By default a refresh button is added to report headers.

## Docked report footer

The docked report footer setting defines whether the report footer remains docked (fixed and always visible) at the bottom of the report, or hides and reappears based on your actions in the report, such as scrolling.

By default the report footer remain docked at the bottom of the report.
 
## Remote configuration
If an interaction default needs to be changed for a group or groups of users in the organization, IT administrators can configure interaction settings remotely using their organization’s MDM tool together with the app config file. See [](./mobile-app-configuration.md) for detail.

## Next steps
