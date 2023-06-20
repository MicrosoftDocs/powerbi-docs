---
title: Known issue - Upload from SharePoint/OneDrive For Business greyed out
description: A known issue is posted where a customer can't upload from SharePoint/OneDrive for Business
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 05/12/2023
ms.custom: known-issue-398
---

# Known issue - Upload from SharePoint/OneDrive For Business greyed out

Although you have a SharePoint license, you can't use the Upload option from SharePoint or OneDrive For Business in Power BI.  The option was available previously, but now is greyed out.

**APPLIES TO:** ✔️ Power BI Service

**Status:** Open

**Problem area:** Consume and View

## Symptoms

When you try to upload a file from SharePoint or OneDrive For Business in Power BI, the options are greyed out.

## Solutions and workarounds

You can try two options to work around this issue:

1. Try to disable MCAS by accessing Power BI using https://app.powerbi.com instead of https://app.powerbi.com.mcas.ms
1. Try to disable the **useRootUrlFilePicker** feature switch by adding **?useRootUrlFilePicker=0** to the url

## Next steps

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
