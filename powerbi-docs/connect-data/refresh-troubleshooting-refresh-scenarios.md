---
title: Troubleshoot refresh scenarios
description: This article provides ways to troubleshoot issues with refreshing data within the Power BI service, for various data sources and conditions.
author: davidiseminger
ms.author: davidi
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: troubleshooting
ms.date: 11/01/2022
LocalizationGroup: Data refresh
---

# Troubleshoot refresh scenarios

This article describes different scenarios you might encounter when refreshing data within the Power BI service.

> [!NOTE]
> If you encounter a scenario that's not listed in this article, and if it's causing issues, you can ask for further assistance on the [community site](https://community.powerbi.com/), or you can create a [support ticket](https://powerbi.microsoft.com/support/).

You should always ensure that basic requirements for refresh are met and verified:

* Verify the gateway version is up to date.
* Verify the report has a gateway selected. If there is no gateway selected, the data source might have changed or might be missing.

After you've confirmed these requirements are met, take a look through the following sections for more troubleshooting. 

## Email notifications

If you're coming to this article from an email notification, and you no longer want to receive emails about refresh issues, contact your Power BI admin. Ask them to remove your email, or an email list you're subscribed to, from the appropriate datasets in Power BI. An admin uses the following area in the Power BI admin portal.

:::image type="content" source="media/refresh-troubleshooting-refresh-scenarios/refresh-email.png" alt-text="Screenshot of admin area for changing Power BI email refresh notifications.":::


## Refresh using Web connector doesn't work properly

If you have a Web connector script that's using the [**Web.Page**](/powerquery-m/web-page) function, and you've updated your dataset or report after November 18, 2016, you must use a gateway for refresh to work properly.

## Unsupported data source for refresh

When you configure a dataset, you might get an error indicating the dataset uses an unsupported data source for refresh. For details, see
[Troubleshooting unsupported data source for refresh](service-admin-troubleshoot-unsupported-data-source-for-refresh.md).

## Dashboard doesn't reflect changes after refresh

Wait 10-15 minutes for a refresh to be reflected in the dashboard tiles. If it still doesn't show up, repin the visualization to the dashboard.

## GatewayNotReachable when setting credentials

You might encounter a `GatewayNotReachable` error when you try to set credentials for a data source, which can be the result of an outdated gateway. Install the latest gateway and try again.

## Processing Error: The following system error occurred: Type Mismatch

This error could be an issue with your [M script](/powerquery-m/m-spec-introduction) within your Power BI Desktop file or Excel workbook. It can also be due to an out-of-date Power BI Desktop version.

## Tile refresh errors

For a list of errors you might encounter with dashboard tiles, and explanations, see [Troubleshooting tile errors](refresh-troubleshooting-tile-errors.md).

## Refresh fails when updating data from sources that use Azure AD OAuth

The Azure Active Directory (**Azure AD**) OAuth token, used by many different data sources, expires in approximately one hour. Sometimes that token expires before the data has finished loading, since the Power BI service waits for up to two hours when loading data. In that situation, the data loading process can fail with a credentials error.

Data sources that use Azure AD OAuth include **Microsoft Dynamics CRM Online**, **SharePoint Online** (SPO), and others. If you’re connecting to such data sources, and get a credentials failure when loading data takes more than an hour, OAuth might be the reason.

Microsoft is investigating a solution that allows the data loading process to refresh the token and continue. However, if your Dynamics CRM Online or SharePoint Online instance is so large that it runs over the two-hour data-load threshold, the Power BI service might report a data load time-out. This data load time-out also applies to other Azure AD OAuth data sources.

For refresh to work properly when connecting to a **SharePoint Online** data source by using Azure AD OAuth, you must use the same account that you use to sign in to the **Power BI service**.

If you want to connect to a data source from Power BI service by using OAuth2, the data source must be in the same tenant as the Power BI service. Currently, multi-tenant connection scenarios aren’t supported with OAuth2.

## Uncompressed data limits for refresh

The maximum size for datasets imported into the **Power BI service** is 1 GB. These datasets are heavily compressed to ensure high performance. In addition, in shared capacity, the service places a limit of 10 GB on the amount of uncompressed data that's processed during refresh. This limit accounts for the compression, and therefore is much higher than the 1-GB maximum dataset size. Datasets in Power BI Premium aren't subject to these limits. If refresh in the Power BI service fails for this reason, reduce the amount of data being imported to Power BI and try again.

## Scheduled refresh time-out

Scheduled refresh for imported datasets time out after two hours. This time-out is increased to five hours for datasets in **Premium** workspaces. If you encounter this limit, consider reducing the size or complexity of your dataset, or consider refactoring the large dataset into multiple smaller datasets.

## Scheduled refresh disabled

If a scheduled refresh fails four times in a row, Power BI disables the refresh. Address the underlying problem, and then re-enable the scheduled refresh.

## Access to the resource is forbidden  

This error can occur because of expired cached credentials. Clear your internet browser cache, then sign in to Power BI and go to `https://app.powerbi.com?alwaysPromptForContentProviderCreds=true` to force an update of your credentials.

## Data refresh failure because of password change or expired credentials

Data refresh can also fail due to expired cached credentials. Clear your internet browser cache, then sign in to Power BI and go to `https://app.powerbi.com?alwaysPromptForContentProviderCreds=true`, which forces an update of your credentials.

## Refresh a column of the ANY type that contains TRUE or FALSE results in unexpected values

When you create a report in Power BI Desktop that has an ANY data type column containing TRUE or FALSE values, the values of that column can differ between Power BI Desktop and the Power BI service after a refresh. In Power BI Desktop, the underlying engine converts the boolean values to strings, retaining TRUE or FALSE values. In the Power BI service, the underlying engine converts the values to objects, and then converts the values to -1 or 0.

Visuals created in Power BI Desktop by using such columns might behave or appear as designed prior to a refresh event, but might change (due to TRUE/FALSE being converted to -1/0) after the refresh event.

## Resolve the error: Container exited unexpectedly with code 0x0000DEAD

If you get the **Container exited unexpectedly with code 0x0000DEAD** error, try to disable the scheduled refresh and republish the dataset.

## Refresh operation throttled by Power BI Premium

A Premium capacity might throttle data refresh operations when too many datasets are being processed concurrently. Throttling can occur in Power BI Premium capacities. When a refresh operation is canceled, the following error message is logged into the refresh history:

*The operation was throttled by Power BI Premium because there were too many datasets being processed concurrently.*
 
If the error occurs frequently, use the [schedule view](refresh-summaries.md#refresh-schedule) to determine whether the scheduled refresh events are properly spaced. To understand the maximum number of concurrent refreshes allowed per SKU, review the [Capacities and SKUs](../enterprise/service-premium-what-is.md#capacities-and-skus) table.

To resolve this error, you can modify your refresh schedule to perform the refresh operation when fewer datasets are being processed. You can also increase the time between refresh operations for all datasets in your refresh schedule on the affected Premium capacity. You can retry the operation if you're using custom [XMLA operations](/analysis-services/xmla/xml-for-analysis-xmla-reference).

## Next steps

- [Data refresh in Power BI](refresh-data.md)  
- [Troubleshoot the On-premises data gateway](service-gateway-onprem-tshoot.md)  
- [Troubleshooting the Power BI Gateway - Personal](service-admin-troubleshooting-power-bi-personal-gateway.md)  

More questions? [Try asking the Microsoft Power BI Community](https://community.powerbi.com/)
