---
title: Refresh goals and scorecards in the Power BI Service Automatically
description: Learn how to refresh Power BI goals and scorecards automatically using scripts and Power Automate. Keep your KPIs updated with the latest data.
author: kgremban
ms.author: kgremban
ms.reviewer: cnews
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 08/12/2025
ai-usage: ai-assisted
---

# Refresh goals and scorecards in the Power BI service automatically

Goals and scorecards in Power BI help organizations track key performance indicators (KPIs) and business goals. While you can update them manually, many users rely on automated refreshes to keep goals aligned with the latest data.

This article shows you how to:

- Set up automatic refresh for goals and scorecards
- Use PowerShell scripts to refresh all goals in a workspace
- Integrate Power Automate for event-based updates
- Troubleshoot common refresh problems

## Refresh goals

You can automatically refresh goals connected to a semantic model or report visual when the underlying dataset refreshes. However, configuration or timing problems might prevent goals from updating as expected.

If connected goals aren't updating:

- If your scorecard goal is linked to a report visual, ensure the dataset refresh is complete and the goal is properly bound.
- You can manually trigger a refresh from the scorecard UI, but this action might not resolve problems with stale data.

### Automate goal refresh with PowerShell

To automatically refresh all goals in a workspace, use the PowerShell script from the [Power BI community blog](https://community.fabric.microsoft.com/t5/Power-BI-Community-Blog/Power-BI-Metrics-Pro-Tip-Refresh-all-metrics-script/ba-p/3139257).

This script helps you:

- Refresh multiple goals simultaneously.
- Schedule automated updates.
- Reduce manual maintenance overhead.

## Refresh scorecards

Scorecards aggregate multiple goals and might require a coordinated refresh strategy.

### Automate scorecard refresh with PowerShell

To automate scorecard refreshes across workspaces, use the PowerShell script from the [developer community blog](https://community.fabric.microsoft.com/t5/Developer/Powershell-script-to-automatically-refresh-scorecards/m-p/3494120).

This script helps you:

- Refresh scorecards across multiple workspaces.
- Schedule regular updates without manual intervention.
- Integrate with existing automation workflows.

## Power Automate integration

You can also use [Power Automate](service-metrics-power-automate.md) to trigger goals updates based on events like dataset refresh, status changes, or check-ins.

## Best practices

- Ensure semantic models are refreshed before triggering goals updates.
- Use service principals or managed identities for automation scripts.
- Monitor refresh logs and error messages for troubleshooting.

## Related content

- [Use Power Automate to update goals automatically](service-metrics-power-automate.md)
- [Stay on top of your goals in Power BI](service-goals-check-in.md)
