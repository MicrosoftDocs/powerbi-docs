---
title: Known issue - Tenant Settings show as keys instead of descriptions
description: A known issue is posted where the tenant settings show as keys instead of long descriptions
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 05/12/2023
ms.custom: known-issue-407
---

# Known issue - Tenant Settings show as keys instead of descriptions

You may see a localization bug whenever the customer has a browser locale that is unsupported by Power BI where the tenant settings show as keys instead of long descriptions.

**APPLIES TO:** ✔️ Power BI Service

**Status:** Open

**Problem area:** Administration

## Symptoms

In Power BI Service, under the tenant settings, the settings are shown as keys.  As an example, you see **TenantSetting_TenantSettingPublishGetHelpInfo_Title** rather than the long description of **Publish "Get Help" information**.

## Solutions and workarounds

As a workaround for this issue, either:

1. Update the Power BI setting to choose a Display Language from the dropdown and bypass the browser locale
or
1. Update the Browser locale to English (US)

## Next steps

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
