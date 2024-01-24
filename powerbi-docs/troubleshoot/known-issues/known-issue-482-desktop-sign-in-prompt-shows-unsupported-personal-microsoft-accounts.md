---
title: Known issue - Power BI Desktop sign-in prompt shows unsupported personal Microsoft accounts
description: A known issue is posted where Power BI Desktop sign-in prompt shows unsupported personal Microsoft accounts
author: mihart
ms.author: jessicamo
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.topic: troubleshooting
ms.date: 08/10/2023
ms.custom: known-issue-482
---

# Known issue - Power BI Desktop sign-in prompt shows unsupported personal Microsoft accounts

Power BI requires users to sign in with an organizational account, which are marked in the sign in prompt as **Work or school accounts**. However, the account list may also show personal **Microsoft accounts** on the device, which aren't supported. Users trying to sign in should select only **Work or school accounts**.

**APPLIES TO:** ✔️ Power BI Desktop

**Status:** Open

**Problem area:** Account & License

## Symptoms

When you try to sign in to Power BI Desktop, you may see personal accounts listed in the authentication UI that are different than the email address you originally typed to sign in. Trying to sign in with a **Microsoft account** results in an error like "Unable to sign in. We couldn't authenticate your sign-in request. To resolve this, retry again without Web Account Manager" or "You can't sign in here with a personal account. Use your work or school account instead."

## Solutions and workarounds

To sign in, select a **Work or school account** from the sign in screen.

## Related content

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
