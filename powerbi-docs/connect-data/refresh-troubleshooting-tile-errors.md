---
title: Troubleshooting tile errors
description: See explanations and solutions for common errors you might see with tile refresh in Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: kayu
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: troubleshooting
ms.date: 11/10/2023
LocalizationGroup: Troubleshooting
---
# Troubleshoot tile errors

This article lists and explains the common errors that can occur with tile refresh in Power BI. If an error that's not listed causes you problems, you can ask for assistance on the [Power BI community site](https://community.powerbi.com/) or file a [support ticket](https://powerbi.microsoft.com/support).

## Error list

The following list explains and offers solutions for common tile refresh errors.

- **Power BI encountered an unexpected error while loading the model. Please try again later.**

  or

  **Couldn't retrieve the data model. Please contact the dashboard owner to make sure the data sources and model exist and are accessible.**

  Power BI couldn't access your data because the data source wasn't reachable. This issue can happen if the data source was removed, renamed, or moved, if the source is offline, or if permissions have changed. Check that the source is still in the specified location and you still have permission to access it. If that isn't the problem, the source might be slow. Try again later during a time when the load on the source is less. If it's an on-premises source, the data source owner might be able to provide more information.

- **You don't have permission to view this tile or open the workbook.**

  Contact the dashboard owner to make sure the data sources and model exist and are accessible for your account.

- **Power BI visuals have been disabled by your administrator.**

  Your Power BI administrator has disabled using Power BI visuals for your organization or your security group. You can't use Power BI visuals from the [Microsoft marketplace](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals) or import private visuals from a file. You can use only the pre-packed set of visuals.

- **Data shapes must contain at least one group or calculation that outputs data. Please contact the dashboard owner.**

  There's no data to display because the query is empty. Try adding some fields from the field list to the visual and repinning it.

- **Can't display the data because Power BI can't determine the relationship between two or more fields.**

  You'e trying to use two or more fields from tables that aren't related. You need to remove the unrelated fields from the visual and then create a relationship between the tables. Once you create the relationship, you can add the fields back to the visual. You can use Power BI Desktop or Power Pivot for Excel for this process. For more information, see [Create and manage relationships in Power BI Desktop](../transform-model/desktop-create-and-manage-relationships.md).

- **The groups in the primary axis and the secondary axis overlap. Groups in the primary axis can't have the same keys as groups in the secondary axis.**

  This issue is usually transient, and typically happens when you're moving groups from rows to columns. The error should disappear when you finish moving all the groups. If you still see the message, try switching fields between the rows, columns, or axis legend, or removing fields from the visual.

- **This visual has exceeded the available resources. Try filtering to decrease the amount of data displayed.**

  The visual has tried to query too much data for Power BI to complete the result with available resources. Try filtering the visual to reduce the amount of data in the result.

- **We are not able to identify the following fields: {0}. Please update the visual with fields that exist in the semantic model.**

  The field was probably deleted or renamed. You can remove the broken field from the visual, add a different field, and repin it.

- **Couldn't retrieve the data for this visual. Please try again later.**

  This issue is usually transient. If you try again later and still see this message, [contact support](https://support.powerbi.com).

- Tiles continue to show unfiltered data after you enable single-sign on (SSO).

  This issue can happen if the underlying semantic model uses DirectQuery mode or a Live Connection to Analysis Services through an on-premises data gateway. In this issue, the tiles continue to show unfiltered data after you enable SSO for the data source, until the next tile refresh. At the next tile refresh, Power BI uses SSO as configured, and the tiles show the data filtered according to the user identity.

  To see the filtered data immediately, you can force a tile refresh. Select the **Refresh** icon at the upper right of a Power BI dashboard.

  As a semantic model owner, you can also increase the tile refresh frequency to 15 minutes to accelerate tile refresh. Select the gear icon in the upper right corner of the Power BI service, and then select **Settings**. On the **Semantic models** tab, expand **Scheduled refresh**, and under **Automatic dashboard tile and metric refresh**, change **Refresh frequency**. Make sure you reset the configuration to the original refresh frequency after Power BI does the next tile refresh.

  > [!NOTE]
  > **Automatic dashboard tile and metric refresh** is available only for semantic models in DirectQuery or Live Connection modes. Semantic models in Import mode don't need a separate tile refresh because the tiles refresh automatically during the next scheduled data refresh.

## Support contact

If you're still having problems, [contact support](https://support.powerbi.com) and ask them to investigate further.

## Related content

- [Troubleshoot the on-premises data gateway](service-gateway-onprem-tshoot.md)
- [Troubleshoot Power BI personal gateway](service-admin-troubleshooting-power-bi-personal-gateway.md)
- More questions? [Try the Power BI community site.](https://community.powerbi.com)
