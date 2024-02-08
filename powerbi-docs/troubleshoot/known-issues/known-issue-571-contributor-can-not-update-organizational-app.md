---
title: Known issue - Contributor can't update organizational app
description: A known issue is posted where a contributor can't update organizational app
author: mihart
ms.author: jessicamo
ms.topic: troubleshooting
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 01/11/2024
ms.custom: known-issue-571
---

# Known issue - Contributor can't update organizational app

Workspace admins can grant users with the **Contributor** role the ability to update the organizational app for the workspace.  A recent regression now prevents the contributor from performing updates to the organizational app, even when explicitly permitted by the administrator.

**APPLIES TO:** ✔️ Power BI

**Status:** Fixed: January 11, 2024

**Problem area:** Share and Collaborate

## Symptoms

You were assigned the **Contributor** role to the workspace associated with the organizational app. The workspace has the **Allow contributors to update the app** setting enabled. When you try to update the organizational app, you receive the following error message: `"Permissions changed. You no longer have permission to edit this app. Contact the workspace admin for details."`

## Solutions and workarounds

To work around this issue by giving you access to update the organizational app, a workspace admin can temporarily grant you **Member** or **Admin** permissions on the workspace.

## Related content

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
