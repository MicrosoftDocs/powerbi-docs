---
title: Technical configuration of Power BI visual offer
description: Learn how to define the technical configuration of custom visual offer when submitting it to the Commercial Marketplace for others to discover and use.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 08/14/2021
---

# Technical configuration of the Power BI visual offer

On the Technical configuration tab, you provide the necessary files to upload your Power BI visual offer.

:::image type="content" source="media/technical-configuration/technical-configuration-packages.png" alt-text="Screenshot of technical configuration tab of offer submission.":::

These files are:

* **Pbix package** (required) – Pack your Power BI visual into a Pbiviz package containing all the required metadata:

  * Visual name
  * Display name
  * GUID
  * Version
  * Description
  * Author name and email

* **Pbiviz package** (required) – To showcase your visual, you should help users to get familiar with the visual. Highlight the value that the visual brings to the user and give examples of usage and formatting options. You can also add a "hints" page at the end with some tips and tricks and things to avoid.
The sample *.pbix* report file must work offline, without any external connections.

Select **Save draft** before continuing to the next tab, [**Properties**](offer-properties.md).
