---
title: Known issue - Tenant migrations paused
description: A known issue is posted where tenant migrations are paused
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 03/09/2022
ms.custom: known-issue-308
---

# Known issue - Tenant Migrations Paused

For customers who have a tenant migration already in the queue, tenant migrations have been paused.  For customers who want to request a new tenant migration, we aren't accepting new cases.

**APPLIES TO:** ✔️ Power BI Service

**Status:** Open

**Problem area:** Account and License

## Additional information

**Existing tenant migration requests**

We've investigated and identified the issues blocking tenant migrations:
1. When a customer deletes Premium capacities to prepare for tenant migration, the workspaces are migrated to Shared capacity as a temporary holding space. We discovered that the datamarts cache the capacity ID from the original capacity and stopped working after the migration.
1. We also discovered a resource-contention issue that can affect the temporary move to Shared capacity and thus block a migration. While the migration logic attempts to move the workspaces temporarily to Shared capacity, the workspace move may be blocked because tenant migration is in progress.

We're preparing to release code fixes for both issues. These changes require especially thorough testing in preproduction environments. The present ETA for resuming migrations is March 31. Out of an abundance of caution, we note this date could change if unexpected results are discovered during testing. We apologize for the inconvenience of our current inability to provide a guaranteed migration timeline.

**New tenant migration requests**

For customers who want to request a new tenant migration, we aren't accepting new cases.  We're currently experiencing technical difficulties with executing tenant migration. As a result, and to ensure that we can support customers' migration request appropriately, we aren't accepting new requests. We'll resume offering the service once we reach satisfied reliability levels.

## Next steps

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
