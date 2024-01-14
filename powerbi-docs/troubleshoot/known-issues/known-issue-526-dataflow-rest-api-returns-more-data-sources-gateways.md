---
title: Known issue - Dataflow REST API returns more data sources and gateways than expected
description: A known issue is posted where a dataflow REST API returns more data sources and gateways than expected
author: mihart
ms.author: jessicamo
ms.topic: troubleshooting
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 10/18/2023
ms.custom: known-issue-526
---

# Known issue - Dataflow REST API returns more data sources and gateways than expected

When you call the Dataflow REST API, [**Dataflows - Get Dataflow Data Sources**](/rest/api/power-bi/dataflows/get-dataflow-data-sources), the response presents more data sources and gateways than the ones bound to the dataflow being queried.

**APPLIES TO:** ✔️ Power BI

**Status:** Open

**Problem area:** Embedded REST API or PowerShell

## Symptoms

In the API response, you see other data sources and gateways available, not only the ones expected for the queried dataflow.

## Solutions and workarounds

No workarounds at this time. This article will be updated when the fix is released.

## Related content

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
