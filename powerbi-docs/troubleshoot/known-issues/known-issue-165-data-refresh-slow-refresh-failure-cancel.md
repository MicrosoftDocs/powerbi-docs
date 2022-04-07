---
title: Data refresh may have slow refresh or failure to cancel - known issue
description: Starting 2022-01-31, Power BI Premium customers may have intermittently experienced issues with long running refreshes, or refreshes that could not be cancelled
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.date: 04/05/2022
ms.custom: known-issue-165
---

# Data refresh may have slow refresh or failure to cancel - known issue

**APPLIES TO:** ✔️ Power BI Premium Service ✔️ Power BI Dataflow

**Status:** Open

**Problem area:** Refresh Data

## Description of problem

You will encounter either a long running dataflow refresh or a dataflow refresh that is stuck in canceling. In some rare cases your dataflow fails and you will an error message “Your (...) dataflow couldn’t be refreshed because there was a problem with one or more entities, or because dataflow capabilities were unavailable.”

## Symptoms

Refreshing a dataflow will have one of the following symptoms:

- Stuck in canceling
- Long running dataflow
- Failed dataflow

## Solutions and workarounds

The Power BI team is working to continually improve dataflow reliability. As part of that, the team is working on several efforts that will be available in the months ahead. </br>

It is also recommended to follow the suggestions within [Best practices for designing and developing complex dataflows](https://docs.microsoft.com/en-us/power-query/dataflows/best-practices-developing-complex-dataflows). Reviewing refresh schedules and potentially moving refresh times around could help to avoid contention that leads to these issues. </br>

As a last resource, you can try swapping the workspace out of Premium to Pro and wait a few minutes. Then switch the workspace back to Premium. This may help to provide relief, but the issue could recur. </br>

## Additional information

We continuously take steps to improve processes for Microsoft's Power BI Platform to ensure similar incidents do not occur in the future. In this case, this includes (but is not limited to):

- Improve logging to more quickly determine similar issues in the future (Completed)
- Correct dataflow model refresh edge case behavior
- Limit concurrent update status requests to prevent exceeding timeout periods
- Update Power BI service refresh status check to proactively verify current status with Premium

## Next steps

- [About known issues](../../power-bi-known-issues.md)
