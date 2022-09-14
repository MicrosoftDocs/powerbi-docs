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

The [new Power format pane](../../fundamentals/desktop-format-pane.md) will be supported for developers from API version 5.1. Developers can define the cards and their subcategories for any custom property in their custom visual, making it easier for report creators to use custom visuals.

The new API uses a **Formatting model** to customize parts of the format and analytics pane.

In the new API, `getFormattingModel` replaces `enumerateObjectInstances` from previous versions.

It requires to define/build new visuals `FormattingModel` for their CV formatting and analytics pane. 
`FormattingModel` covers old format pane capabilities, In addition it supports new format pane capabilities, new properties and new hierarchies.

To upgrade to API version 5.0.0+, set the `apiVersion` in your *pbiviz.json* file to `5.0.0` or later.

## Upgrade to Modern format pane

To customize settings in the new format pane:
 
* In your *capabilities.json* file:
  Capabilities `objects` is required, But now it’s only requires to add object name, Property name and property type in capabilities `objects`, no more. 
  DisplayName, description and other parameters are now optional to add in capabilities.json.
-	Build custom visual formatting model.
The developers now are required to define the design of their CV formatting model and build it using code (not JSON).
-	Implement `getFormattingModel` API to custom visual class that returns custom visual formatting model. (This API replaces the `enumerateObjectInstances` that was used in previous versions)

* Formatting model