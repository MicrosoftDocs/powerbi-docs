---
title: Known issue - Unable to sign in on 32-bit Power BI Desktop
description: A known issue is posted where you're unable to sign in on 32-bit Power BI Desktop
author: mihart
ms.author: jessicamo
ms.topic: troubleshooting
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 11/15/2023
ms.custom: known-issue-533
---

# Known issue - Unable to sign in on 32-bit Power BI Desktop

You can't sign in using the Power BI Desktop 32-bit version 2.122.746.0.

**APPLIES TO:** ✔️ Power BI

**Status:** Fixed: November 15, 2023

**Problem area:** Account & License

## Symptoms

When you attempt to sign in, you get the following error: "Sorry, encountered an error while trying to sign you in. Details: Could not load file or assembly 'Microsoft.IdentityModel.Abstractions, Version=6.22.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35' or one of its dependencies. The located assembly's manifest definition does not match the assembly reference. (Exception from HRESULT: 0x80131040)".

## Solutions and workarounds

You can download and use the 64-bit version of Power BI Desktop or use the Power BI Desktop Microsoft Store App. If you're restricted to using the 32-bit version of the app, you can use the previous release, [September 2023 (2.121.644.0)](/power-bi/fundamentals/desktop-latest-update-archive?tabs=powerbi-desktop#september-2023-update-21216440).

## Next steps

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
