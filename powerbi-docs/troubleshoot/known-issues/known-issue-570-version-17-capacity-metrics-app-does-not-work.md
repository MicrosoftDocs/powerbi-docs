---
title: Known issue - Version 17 of the Fabric Capacity Metrics app doesn't work
description: A known issue is posted where Version 17 of the Fabric Capacity Metrics app doesn't work
author: mihart
ms.author: jessicamo
ms.topic: troubleshooting
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 11/30/2023
ms.custom: known-issue-570
---

# Known issue - Version 17 of the Fabric Capacity Metrics app doesn't work

After installing or updating the Fabric Capacity Metrics app to version 17, you can't configure the app to start using it.

**APPLIES TO:** ✔️ Power BI

**Status:** Open

**Problem area:** Capacity Management

## Symptoms

On the **Apps** page in the Power BI service, you see an App named similar to **Microsoft Fabric Capacity Metrics**.  On the Metrics app row, you see **Version 17** under the Version column. When you open the Metrics app to connect to your data and enter your capacity ID, you receive the error message: "Something went wrong."

## Solutions and workarounds

To start using the Metrics app, you must uninstall version 17. Then you can install the latest Metrics app by using the **Get apps** button on the **Apps** page or by following the instructions to [install the Metrics app for the first time](/fabric/enterprise/metrics-app-install?tabs=1st).

## Related content

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
