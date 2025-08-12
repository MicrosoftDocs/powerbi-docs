---
title: Refresh Metrics and Scorecards in the Power BI Service Automatically
description: Learn how to refresh Power BI metrics and scorecards automatically using scripts and Power Automate. Keep your KPIs updated with the latest data.
author: julcsc
ms.author: juliacawthra
ms.reviewer: cnews
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 08/12/2025
ai-usage: ai-assisted
---

# Refresh metrics and scorecards in the Power BI service automatically

Metrics and scorecards in Power BI help organizations track key performance indicators (KPIs) and business goals. While manual updates are supported, many users rely on automated refreshes to keep metrics aligned with the latest data.

This article shows you how to:

- Set up automatic refresh for metrics and scorecards
- Use PowerShell scripts to refresh all metrics in a workspace
- Integrate Power Automate for event-based updates
- Troubleshoot common refresh issues

## Refresh metrics

Metrics connected to a semantic model or report visual can be refreshed automatically when the underlying dataset is refreshed. However, in some cases, metrics might not update as expected due to configuration or timing issues.

### Common scenarios

- **Connected metrics not updating**: If your scorecard metric is linked to a report visual, ensure the dataset refresh is complete and the metric is properly bound.
- **Manual refresh**: You can manually trigger a refresh from the scorecard UI, but doing this might not resolve issues with stale data.

### Automate bulk refresh with PowerShell

To refresh all metrics in a workspace automatically, use the PowerShell script from the [Power BI community blog](https://community.fabric.microsoft.com/t5/Power-BI-Community-Blog/Power-BI-Metrics-Pro-Tip-Refresh-all-metrics-script/ba-p/3139257).

This script helps you:

- Refresh multiple metrics simultaneously
- Schedule automated updates
- Reduce manual maintenance overhead

## Refresh scorecards

Scorecards aggregate multiple metrics and might require a coordinated refresh strategy.

### PowerShell automation

To automate scorecard refreshes across workspaces, use the PowerShell script from the [developer community blog](https://community.fabric.microsoft.com/t5/Developer/Powershell-script-to-automatically-refresh-scorecards/m-p/3494120).

Key benefits:

- Refresh scorecards across multiple workspaces
- Schedule regular updates without manual intervention
- Integrate with existing automation workflows

### Power Automate integration

You can also use [Power Automate](service-metrics-power-automate.md) to trigger metric updates based on events like dataset refresh, status changes, or check-ins.

## Best practices

- Ensure semantic models are refreshed before triggering metric updates.
- Use service principals or managed identities for automation scripts.
- Monitor refresh logs and error messages for troubleshooting.

## Related content

- [Create scorecards and manual metrics](service-goals-create.md)
- [Use Power Automate to update metrics automatically](service-metrics-power-automate.md)
- [Get started with metrics in Power BI](service-goals-introduction.md)
- [Create connected metrics in Power BI](service-goals-create-connected.md)
- [Stay on top of your metrics in Power BI](service-goals-check-in.md)
