---
title: Troubleshoot Power BI Tile Refresh Errors
description: "Learn how to troubleshoot common tile refresh errors in Power BI. Find explanations and solutions for issues like data access problems, permission errors, and visual resource limits. Get help resolving tile errors today."
author: kgremban
ms.author: kgremban
ms.reviewer: kayu
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: troubleshooting
ms.date: 10/01/2025
ai-usage: ai-assisted
LocalizationGroup: Troubleshooting
---
# Troubleshoot Power BI tile refresh errors

Tile refresh errors in Power BI can prevent your dashboards from displaying current data. This article lists and explains common tile refresh errors you might encounter in the Power BI service, providing solutions to help you quickly resolve issues and restore your dashboard functionality.

## Need help?

If an error that's not listed causes you problems or you need additional assistance:

- Ask for help on the [Power BI community site](https://community.powerbi.com/)
- File a [support ticket](https://powerbi.microsoft.com/support)
- Learn how to [create a support ticket](/power-bi/support/create-support-ticket)

## Error list

The following list explains and offers solutions for common tile refresh errors.

- **Power BI encountered an unexpected error while loading the model. Please try again later.**

  or

  **Couldn't retrieve the data model. Please contact the dashboard owner to make sure the data sources and model exist and are accessible.**

  Power BI couldn't access your data because the data source wasn't reachable. This issue can happen if the data source was removed, renamed, or moved, if the source is offline, or if permissions have changed. Check that the source is still in the specified location and you still have permission to access it. If that isn't the problem, the source might be slow. Try again later during a time when the load on the source is less. If it's an on-premises source, the data source owner might be able to provide more information.

- **You don't have permission to view this tile or open the workbook.**

  Contact the dashboard owner to make sure the data sources and model exist and your account has access to them.

- **Power BI visuals have been disabled by your administrator.**

  Your Power BI administrator has disabled using Power BI visuals for your organization or your security group. You can't use Power BI visuals from the [Microsoft marketplace](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals) or import private visuals from a file. You can use only the pre-packed set of visuals.

- **Data shapes must contain at least one group or calculation that outputs data. Please contact the dashboard owner.**

  There's no data to display because the query is empty. Try adding some fields from the field list to the visual and repinning it.

- **Can't display the data because Power BI can't determine the relationship between two or more fields.**

  You're trying to use two or more fields from tables that aren't related. You need to remove the unrelated fields from the visual and then create a relationship between the tables. After you create the relationship, you can add the fields back to the visual. You can use Power BI Desktop or Power Pivot for Excel for this process. For more information, see [Create and manage relationships in Power BI Desktop](../transform-model/desktop-create-and-manage-relationships.md).

- **The groups in the primary axis and the secondary axis overlap. Groups in the primary axis can't have the same keys as groups in the secondary axis.**

  This issue is usually transient, and typically happens when you're moving groups from rows to columns. The error should disappear when you finish moving all the groups. If you still see the message, try switching fields between the rows, columns, or axis legend, or try removing fields from the visual.

- **This visual has exceeded the available resources. Try filtering to decrease the amount of data displayed.**

  The visual has tried to query too much data for Power BI to complete the result with available resources. To resolve this issue:

  1. Add filters to the visual to limit the date range or reduce the number of categories displayed.
  1. Remove unnecessary fields from the visual that aren't essential to your analysis.
  1. Use aggregated data instead of detailed row-level data when possible.
  1. Consider breaking the visual into multiple smaller visuals, each showing a subset of the data.
  1. If the visual displays data from a large semantic model, work with the semantic model owner to optimize the data model or add aggregations.

  For more information about optimizing visual performance, see [Optimization guide for Power BI](/power-bi/guidance/power-bi-optimization).

  > [!TIP]
  > Power BI has resource limits to ensure optimal performance. Visuals that attempt to return very large datasets may exceed these limits. Design your visuals to query only the data you need.

- **We are not able to identify the following fields: {0}. Please update the visual with fields that exist in the semantic model.**

  The field was probably deleted or renamed. You can remove the broken field from the visual, add a different field, and repin the tile.

- **Couldn't retrieve the data for this visual. Please try again later.**

  This issue is usually transient. If you try again later and still see this message, [contact support](https://support.powerbi.com).

- Tiles continue to show unfiltered data after you enable single sign-on (SSO).

  This issue can happen if the underlying semantic model uses DirectQuery mode or a Live Connection to Analysis Services through an on-premises data gateway. In this case, the tiles continue to show unfiltered data after you enable SSO for the data source until the next tile refresh. At the next tile refresh, Power BI uses SSO as configured, and the tiles show the data filtered according to the user identity.

  To see the filtered data immediately, you can force a tile refresh. Select the **Refresh** icon at the upper right of a Power BI dashboard.

  As a semantic model owner, you can also increase the tile refresh frequency to 15 minutes to accelerate tile refresh. Go to the workspace for the dashboard and locate the associated semantic model. Next to the semantic model's name, select the three horizontal dots icon to open the **More options** menu, then select **Settings**. On the **Semantic models** tab, expand **Refresh**, and under **Automatic dashboard tile and metric refresh**, change **Refresh frequency**. Make sure you reset the configuration to the original refresh frequency after Power BI does the next tile refresh.

  > [!NOTE]
  > **Automatic dashboard tile and metric refresh** is available only for semantic models in DirectQuery or Live Connection modes. Semantic models in Import mode don't need a separate tile refresh because the tiles refresh automatically during the next scheduled data refresh.

## Need to download or export reports?

If you're looking to download reports or export data rather than troubleshoot tile errors, see:

- [Download a report from the Power BI service to Power BI Desktop](/power-bi/create-reports/service-export-to-pbix)
- [Export reports to file](/power-bi/developer/embedded/export-to)
- [Export data from Power BI visuals](/power-bi/visuals/power-bi-visualization-export-data)

## Support contact

If you're still having problems, [contact support](https://support.powerbi.com) and ask them to investigate further.

## Related content

- [Troubleshoot the on-premises data gateway](service-gateway-onprem-tshoot.md)
- [Troubleshoot Power BI personal gateway](service-admin-troubleshooting-power-bi-personal-gateway.md)
- More questions? [Try the Power BI community site.](https://community.powerbi.com)
