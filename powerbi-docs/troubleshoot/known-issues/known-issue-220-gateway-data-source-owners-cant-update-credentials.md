---
title: Known issue - Gateway data source owners can't update data source credentials
description: A known issue is posted where you may not be able to update the credentials for that data source even with owner permission.
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 08/03/2022
ms.custom: known-issue-220
---

# Description of problem

If you have owner permission but no gateway level permission on a data source, you may not be able to update the credentials for that data source.  The page will just show as loading and the credentials won't update.

**APPLIES TO:** ✔️ Power BI Gateway

**Status:** Open

**Problem area:** Gateway

## Symptoms

To update the credentials for a data source, you go to **Settings** for the data source.  When you select the **Save** button, the page shows the spinning loading wheel, and doesn't change the credentials.

## Solutions and workarounds

As a workaround, grant the affected user gateway admin permission to allow them to update credentials. When the fix is released, this article will be updated.

## Next steps

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
