---
title: Known issue - Duplicate or erroneous email may be received during classic workspace upgrade
description: A known issue is posted where you may receive duplicate or erroneous emails during the global classic workspace upgrade.
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 08/03/2022
ms.custom: known-issue-185
---
# Description of problem

During the global classic (v1) workspace upgrade, workspace admins will receive an email when their workspace has been upgraded.  If you're a workspace admin, you may receive duplicate or erroneous emails. The sent emails happen primarily when a tenant remap occurred before the tenant migration or a tenant’s data exists on more than one cluster.

**APPLIES TO:** ✔️ Classic Workspaces

**Status:** Fixed: July 6, 2022

**Problem area:** Share and Collaborate


## Symptoms

You'll receive duplicate emails informing you the same workspace has been upgraded or an erroneous email informing you a workspace has been upgraded that has already been upgraded.

## Solutions and workarounds

We're working on a fix to reduce the number of emails sent. If you receive too many emails before the fix is deployed, you can turn off the emails entirely via the admin portal tenant settings page for workspace upgrade.

## Next steps

- [Upgrade classic workspaces to the new workspaces in Power BI](/power-bi/collaborate-share/service-upgrade-workspaces)
- [About known issues](power-bi-known-issues.md)
