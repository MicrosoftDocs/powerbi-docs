---
title: Known issue - Datamart editor doesn't allow saving row-level security (RLS) rules that contain double quotes in the string filter
description: A known issue is posted where including a double quote in the string filter of a row-level security (RLS) rule prevents you from saving the filter.
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 08/03/2022
ms.custom: known-issue-208
---
# Known issue #208 - Datamart editor doesn't allow saving row-level security (RLS) rules that contain double quotes in the string filter

When using the Datamart editor, you can create rules for row-level security (RLS) to specify security roles that will restrict the data shown.  In **Manage Roles** > **Row security settings** > **Create** > **Add filters**, you create a rule that uses a string filter.  If you include a double quote in the string filter, you can't save the filter.

**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false"::: Power BI Service :::image type="icon" source="../../includes/media/yes-icon.svg" border="false"::: Datamarts

**Status:** Fixed: July 25, 2022

**Problem area:** Create and Author Data


## Symptoms

If you have a double quote in the string filter, you can't save the filter.

## Solutions and workarounds

To avoid this issue, remove the double quote (") mark from the string filter.

## Next steps

- [Control access to datamarts](/power-bi/transform-model/datamarts/datamarts-access-control)
- [About known issues](power-bi-known-issues.md)
