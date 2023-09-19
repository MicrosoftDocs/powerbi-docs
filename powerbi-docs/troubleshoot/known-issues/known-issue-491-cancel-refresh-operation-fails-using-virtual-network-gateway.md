---
title: Known issue - Cancel refresh operation fails using virtual network gateway
description: A known issue is posted where the cancel refresh operation fails using virtual network gateway
author: mihart
ms.author: jessicamo
ms.topic: troubleshooting
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 09/18/2023
ms.custom: known-issue-491
---

# Known issue - Cancel refresh operation fails using virtual network gateway

When you try to cancel a hung data refresh through a virtual network data gateway, you may not be able to cancel the data refresh.  You consistently receive an error message that says the refresh is already being canceled.

**APPLIES TO:** ✔️ Virtual network data gateway

**Status:** Fixed: September 18, 2023

**Problem area:** Gateway

## Symptoms

When trying to cancel the data refresh, you see an error similar to "Something went wrong. The cancel refresh operation failed. The in-progress refresh of the selected dataset is already being canceled."

## Solutions and workarounds

Until a fix has been deployed, a workaround is to use the on-premises data gateway instead of the virtual network data gateway.

## Next steps

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
