---
title: Troubleshooting tile errors
description: Common errors that may be encountered when a tile tries to refresh in Power BI
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.custom: seodec18
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 12/06/2018
ms.author: davidi

LocalizationGroup: Troubleshooting
---
# Troubleshooting tile errors
Below are the common errors you may encounter with tiles along with an explanation.

> [!NOTE]
> If you encounter an error that is not listed below, and it is causing you issues, you can ask for further assistance on the [community site](http://community.powerbi.com/), or you can create a [support ticket](https://powerbi.microsoft.com/support/).
> 
> 

## Errors
**Power BI encountered an unexpected error while loading the model. Please try again later.**
or
**Couldn't retrieve the data model. Please contact the dashboard owner to make sure the data sources and model exist and are accessible.**

We weren't able to access your data because the data source wasn't reachable. This issue could happen if the data source was removed, renamed, moved, offline, or permissions have changed. Check that the source is still in the location we are pointing to and you still have permission to access it. If that isn't the issue, the source may be slow. Try again later during a time when the load on the source is smaller. If it is an on-premises source, the data source owner may be able to provide more information.

**You don’t have permission to view this tile or open the workbook.**

Contact the dashboard owner to make sure the data sources and model exist and are accessible for your account.

**Custom visuals have been disabled by your administrator.**

Your Power BI administrator has disabled the usage of custom visuals for your organization or your security group. 
You will not be able to use custom visuals from the [Microsoft marketplace](https://appsource.microsoft.com/en-us/marketplace/apps?page=1&product=power-bi-visuals) or import private visuals from a file. You will be able to use only the pre-packed set of visuals.


**Data shapes must contain at least one group or calculation that outputs data. Please contact the dashboard owner.**

We don't have any data to display because the query is empty. Try adding some fields from the field list to your visual and repinning it.

**Can't display the data because Power BI can't determine the relationship between two or more fields.**

You are trying to use two or more fields from tables that are not related. You need to remove the unrelated fields from the visual and then create a relationship between the tables. Once you have done this change, you can add the fields back to the visual. This can be done in Power BI Desktop or Power Pivot for Excel. [Learn more](desktop-create-and-manage-relationships.md)

**The groups in the primary axis and the secondary axis overlap. Groups in the primary axis can't have the same keys as groups in the secondary axis.**

It is usually a transient issue. This will typically happen when you are moving groups from rows to columns. In this case, the error should disappear when you finish moving all the groups. If you still see the message, try switching fields between the rows and columns or the axis legend or removing fields from the visual.  

**This visual has exceeded the available resources. Try filtering to decrease the amount of data displayed.**

Your visual has attempted to query too much data for us to complete the result with the available resources. Try filtering the visual to reduce the amount of data in the result.

**We are not able to identify the following fields: {0}. Please update the visual with fields that exist in the dataset.**

The field was likely deleted or renamed. You can remove the broken field from the visual, add a different field, and repin it.

**Couldn't retrieve the data for this visual. Please try again later.**

This is usually a transient issue. If you try again later and you still see this message, contact support.

## Contact support
If you are still having an issue, [contact support](https://support.powerbi.com) to investigate further.

## Next steps
[Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md)  
[Troubleshooting Power BI Personal Gateway](service-admin-troubleshooting-power-bi-personal-gateway.md)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)

