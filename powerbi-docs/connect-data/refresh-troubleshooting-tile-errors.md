---
title: Troubleshooting tile errors
description: Common errors that may be encountered when a tile tries to refresh in Power BI
author: davidiseminger
ms.author: davidi
ms.reviewer: kayu
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: troubleshooting
ms.date: 12/06/2018
LocalizationGroup: Troubleshooting
---
# Troubleshooting tile errors
Below are the common errors you may encounter with tiles along with an explanation.

> [!NOTE]
> If you encounter an error that is not listed below, and it is causing you issues, you can ask for further assistance on the [community site](https://community.powerbi.com/), or you can create a [support ticket](https://powerbi.microsoft.com/support/).
> 
> 

## Errors
**Power BI encountered an unexpected error while loading the model. Please try again later.**
or
**Couldn't retrieve the data model. Please contact the dashboard owner to make sure the data sources and model exist and are accessible.**

We weren't able to access your data because the data source wasn't reachable. This issue could happen if the data source was removed, renamed, moved, offline, or permissions have changed. Check that the source is still in the location we are pointing to and you still have permission to access it. If that isn't the issue, the source may be slow. Try again later during a time when the load on the source is smaller. If it is an on-premises source, the data source owner may be able to provide more information.

**You don't have permission to view this tile or open the workbook.**

Contact the dashboard owner to make sure the data sources and model exist and are accessible for your account.

**Power BI visuals have been disabled by your administrator.**

Your Power BI administrator has disabled the usage of Power BI visuals for your organization or your security group.
You will not be able to use Power BI visuals from the [Microsoft marketplace](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals) or import private visuals from a file. You will be able to use only the pre-packed set of visuals.


**Data shapes must contain at least one group or calculation that outputs data. Please contact the dashboard owner.**

We don't have any data to display because the query is empty. Try adding some fields from the field list to your visual and repinning it.

**Can't display the data because Power BI can't determine the relationship between two or more fields.**

You are trying to use two or more fields from tables that are not related. You need to remove the unrelated fields from the visual and then create a relationship between the tables. Once you have done this change, you can add the fields back to the visual. This can be done in Power BI Desktop or Power Pivot for Excel. [Learn more](../transform-model/desktop-create-and-manage-relationships.md)

**The groups in the primary axis and the secondary axis overlap. Groups in the primary axis can't have the same keys as groups in the secondary axis.**

It is usually a transient issue. This will typically happen when you are moving groups from rows to columns. In this case, the error should disappear when you finish moving all the groups. If you still see the message, try switching fields between the rows and columns or the axis legend or removing fields from the visual.  

**This visual has exceeded the available resources. Try filtering to decrease the amount of data displayed.**

Your visual has attempted to query too much data for us to complete the result with the available resources. Try filtering the visual to reduce the amount of data in the result.

**We are not able to identify the following fields: {0}. Please update the visual with fields that exist in the dataset.**

The field was likely deleted or renamed. You can remove the broken field from the visual, add a different field, and repin it.

**Couldn't retrieve the data for this visual. Please try again later.**

This is usually a transient issue. If you try again later and you still see this message, contact support.

**Tiles continue to show unfiltered data after enabling single-sign on (SSO).**

This can happen if the underlying dataset is configured to use DirectQuery mode or a Live Connection to Analysis Services through an on-premises data gateway. In this case, the tiles continue to show the unfiltered data after enabling SSO for the data source until the next tile refresh is due. At the next tile refresh, Power BI uses SSO as configured, and the tiles show the data filtered according to the user identity. 

If you want to see the filtered data immediately, you can force a tile refresh by selecting **More options** (...) in the upper right of a dashboard and selecting **Refresh dashboard tiles**.

As a dataset owner, you can also change the tile refresh frequency and set it to 15 minutes to accelerate tile refresh. Select the gear icon in the upper right corner of the Power BI service, then select **Settings**. On the **Settings** page, select the **Datasets** tab. Expand **Scheduled cache refresh** and change **Refresh frequency**. Make sure you reset the configuration to the original refresh frequency after Power BI performs the next tile refresh.

> [!NOTE]
> The **Scheduled cache refresh** section is only available for datasets in DirectQuery/LiveConnection mode. Datasets in Import mode do not require a separate tile refresh because the tiles are refreshed automatically during the next scheduled data refresh.

## Contact support
If you are still having an issue, [contact support](https://support.powerbi.com) to investigate further.

## Next steps
[Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md)  
[Troubleshooting Power BI Personal Gateway](service-admin-troubleshooting-power-bi-personal-gateway.md)  
More questions? [Try the Power BI Community](https://community.powerbi.com/)
