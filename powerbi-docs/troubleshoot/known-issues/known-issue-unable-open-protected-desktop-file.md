---
title: Known issue - Unable to open protected Power BI Desktop file
description: A known issue is posted where you may be unable to open a protected Power BI Desktop file.
author: jessicamo
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 09/02/2022
ms.custom: known-issue-151
---
# Known issue #151 - Unable to open protected Power BI Desktop file

You won't be able to open a [protected](/power-bi/enterprise/service-security-data-protection-overview) Power BI Desktop (.pbix) file and will receive an "Unable to open document" error message.  The impacted file has a label that hasn't been published to you, even though you have full control for the relevant label.

**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false"::: Power BI Desktop

**Status:** Fixed: September 2, 2022

**Problem area:** Publish Content

## Symptoms

When opening a Power BI Desktop (.pbix) file, you'll receive the error message:
> **Unable to open document**
> The protection setting applied to the file caused an error that prevented it from opening. Try opening the file again.  

## Solutions and workarounds

The recommended workaround to ask your organization's security team to publish the impacted Desktop file's label to the user in the Microsoft Purview compliance portal.

## Next steps

- [About known issues](power-bi-known-issues.md)
