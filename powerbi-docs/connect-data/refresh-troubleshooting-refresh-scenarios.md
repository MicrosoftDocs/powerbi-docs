---
title: Troubleshoot refresh scenarios
description: This article provides ways to troubleshoot issues with refreshing data within the Power BI service, for various data sources and conditions.
author: davidiseminger
ms.author: davidi
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: troubleshooting
ms.date: 08/13/2024
LocalizationGroup: Data refresh
---

# Troubleshoot refresh scenarios

This article describes different scenarios you might encounter when refreshing data within the Power BI service.

> [!NOTE]
> If you encounter a scenario that's not listed in this article, and if it's causing issues, you can ask for further assistance on the [community site](https://community.powerbi.com/), or you can create a [support ticket](https://powerbi.microsoft.com/support/).

You should always ensure that basic requirements for refresh are met and verified:

* Verify the gateway version is up to date.
* Verify the report has a gateway selected. If there's no gateway selected, the data source might have changed or might be missing.

After you confirm the requirements are met, take a look through the following sections for more troubleshooting.

## Email notifications

If you're coming to this article from an email notification, and you no longer want to receive emails about refresh issues, contact your Power BI admin. Ask them to remove your email, or an email list you're subscribed to, from the appropriate semantic models in Power BI. An admin uses the following area in the semantic model settings.

:::image type="content" source="media/refresh-troubleshooting-refresh-scenarios/refresh-email.png" alt-text="Screenshot of the section in the semantic model settings for changing Power BI email refresh notifications.":::

## Refresh using Web connector doesn't work properly

If you have a Web connector script that's using the [**Web.Page**](/powerquery-m/web-page) function, and you've updated your semantic model or report after November 18, 2016, you must use a gateway for refresh to work properly.

## Unsupported data source for refresh

When you configure a semantic model, you might get an error indicating the semantic model uses an unsupported data source for refresh. For details, see
[Troubleshooting unsupported data source for refresh](service-admin-troubleshoot-unsupported-data-source-for-refresh.md).

## Dashboard doesn't reflect changes after refresh

Wait 10-15 minutes for a refresh to be reflected in the dashboard tiles. If it still doesn't show up, repin the visualization to the dashboard.

## GatewayNotReachable when setting credentials

You might encounter a `GatewayNotReachable` error when you try to set credentials for a data source, which can be the result of an outdated gateway. [Install the latest gateway](/data-integration/gateway/service-gateway-install) and try again.

## Processing Error: The following system error occurred: Type Mismatch

This error could be an issue with your [M script](/powerquery-m/m-spec-introduction) within your Power BI Desktop file or Excel workbook. It can also be due to an out-of-date Power BI Desktop version.

## Tile refresh errors

For a list of errors you might encounter with dashboard tiles, and explanations, see [Troubleshoot tile errors](refresh-troubleshooting-tile-errors.md).

<a name='refresh-fails-when-updating-data-from-sources-that-use-azure-ad-oauth'></a>

## Refresh fails when updating data from sources that use Microsoft Entra ID OAuth

The Microsoft Entra ID OAuth token, used by many different data sources, expires in approximately one hour. Sometimes that token expires before the data has finished loading, since the Power BI service waits for up to two hours when loading data. In that situation, the data loading process can fail with a credentials error.

Data sources that use Microsoft Entra ID OAuth include **Microsoft Dynamics CRM Online**, **SharePoint Online** (SPO), and others. If you’re connecting to such data sources, and get a credentials failure when loading data takes more than an hour, OAuth might be the reason.

Microsoft is investigating a solution that allows the data loading process to refresh the token and continue. However, if your Dynamics CRM Online or SPO instance is so large that it runs over the two-hour data-load threshold, the Power BI service might report a data load time-out. This data load time-out also applies to other Microsoft Entra ID OAuth data sources.

For refresh to work properly when connecting to an **SPO** data source by using Microsoft Entra ID OAuth, you must use the same account that you use to sign in to the **Power BI service**.

If you want to connect to a data source from the Power BI service by using OAuth2, the data source must be in the same tenant as the Power BI service. Currently, multitenant connection scenarios aren’t supported with OAuth2.

## Uncompressed data limits for refresh

The maximum size for semantic models imported into the **Power BI service** is 1 GB. These semantic models are heavily compressed to ensure high performance. In addition, in shared capacity, the service places a limit of 10 GB on the amount of uncompressed data that is processed during refresh. This limit accounts for the compression, and therefore is higher than the 1-GB maximum semantic model size. Semantic models in Power BI Premium aren't subject to these limits. If refresh in the Power BI service fails for this reason, reduce the amount of data being imported to Power BI and try again.

## Scheduled refresh time-out

Scheduled refreshes for imported semantic models time out after two hours. This time-out is increased to five hours for semantic models in Premium workspaces. If you encounter this limit, consider reducing the size or complexity of your semantic model, or consider refactoring the large semantic model into multiple smaller semantic models.

## Scheduled refresh disabled

If a scheduled refresh fails four times in a row, Power BI disables the refresh. Address the underlying problem, and then re-enable the scheduled refresh.

However, if the semantic model resides in a workspace under Embedded capacity, and that capacity is switched off, the *first* attempt at refresh will fail (since the capacity is switched off), and in this circumstance its scheduled refresh is immediately disabled.

## Access to the resource is forbidden  

This error can occur because of expired cached credentials. Clear your internet browser cache, then sign in to Power BI and go to `https://app.powerbi.com?alwaysPromptForContentProviderCreds=true` to force an update of your credentials.

## Data refresh failure because of password change or expired credentials

Data refresh can also fail due to expired cached credentials. Clear your internet browser cache, then sign in to Power BI and go to `https://app.powerbi.com?alwaysPromptForContentProviderCreds=true`, which forces an update of your credentials.

## Refresh a column of the ANY type that contains TRUE or FALSE results in unexpected values

When you create a report in Power BI Desktop that has an ANY data type column containing TRUE or FALSE values, the values of that column can differ between Power BI Desktop and the Power BI service after a refresh. In Power BI Desktop, the underlying engine converts the boolean values to strings, retaining TRUE or FALSE values. In the Power BI service, the underlying engine converts the values to objects, and then converts the values to -1 or 0.

Visuals created in Power BI Desktop by using such columns might behave or appear as designed prior to a refresh event, but might change (due to TRUE/FALSE being converted to -1/0) after the refresh event.

## Resolve the error: Container exited unexpectedly with code 0x0000DEAD

If you get the **Container exited unexpectedly with code 0x0000DEAD** error, try to disable the scheduled refresh and republish the semantic model.

## Refresh operation throttled by Power BI Premium

A Premium capacity might throttle data refresh operations when too many semantic models are being processed concurrently. [Throttling](/fabric/enterprise/throttling) can occur in Power BI Premium capacities. When a refresh operation is canceled, the following error messages are logged into the refresh history:

*You've exceeded the capacity limit for semantic model refreshes. Try again when fewer semantic models are being processed.*
 
If the error occurs frequently, use the [schedule view](refresh-summaries.md#refresh-schedule) to determine whether the scheduled refresh events are properly spaced. To understand the maximum number of concurrent refreshes allowed per SKU, review the [Capacities and SKUs](../enterprise/service-premium-what-is.md#capacities-and-skus) table.

To resolve this error, you can modify your refresh schedule to perform the refresh operation when fewer semantic models are being processed. You can also increase the time between refresh operations for all semantic models in your refresh schedule on the affected Premium capacity. You can retry the operation if you're using custom [XMLA operations](/analysis-services/xmla/xml-for-analysis-xmla-reference).

*Capacity level limit exceeded.*
 
This error indicates you have too many semantic models running refresh at the same time, based on the capacity your organization has purchased. You can retry the refresh operation, or reschedule the refresh time to address this error.

*Node level limit exceeded.*
 
This error indicates a system error in Power BI Premium based on semantic models residing on a given physical node. You can retry the refresh operation, or reschedule the refresh time to address this error.

## Dataflows or datamart failures in Premium workspaces

Some connectors aren't supported for dataflows and datamarts in Premium workspaces. When using an unsupported connector, you might receive the following error: *Expression.Error: The import "<"connector name">"* matches no exports. Did you miss a module reference?

The following connectors aren't supported for dataflows and datamarts in Premium workspaces:

* Linkar
* Actian
* AmazonAthena
* AmazonOpenSearchService
* BIConnector
* DataVirtuality
* DenodoForPowerBI
* Exasol
* Foundry
* Indexima
* IRIS
* JethroODBC
* Kyligence
* MariaDB
* MarkLogicODBC
* OpenSearchProject
* QubolePresto
* SingleStoreODBC
* StarburstPresto
* TibcoTdv

The use of the previous list of connectors with dataflows or datamarts is only supported in workspaces that are not Premium.

## There was a problem refreshing the dataflow, the gateway version you are using is not supported

This error occurs if the version of the on-premises data gateway being used to refresh your dataflow (Gen1 or Gen2) is out of support. Currently Microsoft supports only the [last six versions of the on-premises data gateway](/data-integration/gateway/service-gateway-monthly-updates). Update your gateway to the latest version, or to a supported version to resolve this issue. Use the [update an on-premises data gateway](/data-integration/gateway/service-gateway-update) article for guidance on updating gateways.

## Circular Dependency error related to Calculated Table utilize SummarizeColumns

Since September 5th, we enabled a feature that allows SummarizeColumns to be placed inside measure and to be evaluated within any external filter context. This feature might introduced new dependencies if summarizecolumns is used in CalculateTable. Those newly introduced dependencies might cause circluar dependency error during model refresh. 

In case of this error please apply following steps to mitigate the issue:

#### a. Identify all CalculateTables that utilize summarizecolumns 

#### b. For each summarizecolumns expression make following changes:
For a summarizecolumns expression with GB on "Product" and "Geography" for example:
```
SummarizeColumns(
Product[Color],
Geography[Country],
...
)
```
Add "Product" and "Geography" as filters into summarizecolumns, so it becames:
```
SummarizeColumns(
Product[Color],
Geography[Country],
Product, 
Geography,
...
)
```
This will remove the introduced blankrow and restore original behavior. In case of you have multiple calculated tables that employees SummarizeColumns, changes for all the tables should be submit together in a single transaction, in that case you will need to use Tabular Editor: https://www.sqlbi.com/tools/tabular-editor/ to make the modification since PowerBI Desktop lacks the ability to batch multiple table changes together into one transaction.

## Related content

* [Data refresh in Power BI](refresh-data.md)  
* [Configure scheduled refresh](refresh-scheduled-refresh.md)
* [Troubleshoot gateways - Power BI](service-gateway-onprem-tshoot.md)  
* [Troubleshooting the Power BI gateway (personal mode)](service-admin-troubleshooting-power-bi-personal-gateway.md)  

More questions? [Try asking the Microsoft Power BI Community](https://community.powerbi.com/).
