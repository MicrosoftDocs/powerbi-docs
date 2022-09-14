---
title: The Format pane in Power BI visuals
description: This article describes how to customize the new Format pane in Power BI visuals.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 09/14/2022
---

# The Format pane in Power BI visuals

Starting from API version 5.0, the Format pane 

Modern Format & Analytics Pane
The new API `getFormattingModel` is replacing `enumerateObjectInstances` old API.
It requires to define/build new visuals `FormattingModel` for their CV formatting and analytics pane. 
`FormattingModel` covers old format pane capabilities, In addition it supports new format pane capabilities, new properties and new hierarchies.

To upgrade to API version 5.0.0+, set the `apiVersion` in your *pbiviz.json* file to `5.0.0` or later.

## Upgrade to Modern format pane



* In your *capabilities.json* file:
  Capabilities `objects` is required, and it isn’t different than previous versions.
 But now it’s only requires to add object name, Property name and property type in capabilities `objects`, no more. 
DisplayName, description and other parameters are now optional to add in capabilities.json.
-	Build custom visual formatting model.
The developers now are required to define the design of their CV formatting model and build it using code (not JSON).
-	Implement `getFormattingModel` API to custom visual class that returns custom visual formatting model.
