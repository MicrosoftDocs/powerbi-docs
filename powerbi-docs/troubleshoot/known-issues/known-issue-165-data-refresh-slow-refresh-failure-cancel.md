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

**Problem area**: Refresh Data

## Description of problem

You may intermittently experience issues with long running refreshes or failure to cancel.

## Symptoms

The Power BI service will display dataflow refreshes that appear to be running for hours and are unable to be cancelled or retried.

## Solutions and workarounds

This issue is intermittent and may run successfully during the next run. </br>
Service engineers were able to apply a manual mitigation to affected Premium dataflow refreshes until long term code corrections can be deployed.

## Additional information

We continuously take steps to improve processes for Microsoft's Power BI Platform to ensure similar incidents do not occur in the future. In this case, this includes (but is not limited to):

- Improve logging to more quickly determine similar issues in the future (Completed)
- Correct dataflow model refresh edge case behavior
- Limit concurrent update status requests to prevent exceeding timeout periods
- Update Power BI service refresh status check to proactively verify current status with Premium

## Next steps

- [About known issues](../../power-bi-known-issues.md)
