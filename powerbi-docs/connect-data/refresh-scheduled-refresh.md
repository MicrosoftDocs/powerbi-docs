---
title: Configure scheduled refresh
description: Learn how to select a gateway connection and configure scheduled refresh for a semantic model in the Power BI service.
author: kgremban
ms.author: kgremban
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 02/13/2026
LocalizationGroup: Data refresh
ms.custom: sfi-image-nochange
ai-usage: ai-assisted
#customer intent: As a Power BI user, I want to learn how to configure scheduled refresh for a semantic model in the Power BI service so that I can keep my data up to date and ensure accurate insights in my reports and dashboards.
---

# Configure scheduled refresh

> [!NOTE]
> Scheduled refresh is automatically paused after a period of inactivity. For details (including what counts as activity and how to resume), see the inactivity note in the [Scheduled refresh](#scheduled-refresh) section.

This article describes the options available for scheduled refresh for the [On-premises data gateway (personal mode)](service-gateway-personal-mode.md) and the [On-premises data gateway](service-gateway-onprem.md). You specify refresh options in the following areas of the Power BI service: **Gateway connection**, **Data source credentials**, and **Schedule refresh**. We'll look at each in turn. For more information about data refresh, including limitations on refresh schedules, see [Data refresh](refresh-data.md#data-refresh). 

> [!NOTE]
> You can configure semantic model refresh with **Fabric Data Pipelines** using refresh templates (**Fabric required**). Examples include scheduled monthly refreshes and cascading refresh workflows. Refresh templates offer **additional capabilities beyond the standard Scheduled refresh**, making it easier to manage complex scenarios. See [Refresh templates](data-pipeline-templates.md) for details.

To get to the **Schedule refresh** screen:

1. Go to the workspace and select a semantic model from the workspace content list.

1. On the semantic model details page, select **Refresh** > **Schedule refresh**.

    :::image type="content" source="media/refresh-scheduled-refresh/semantic-model-schedule-refresh.png" alt-text="Screenshot of schedule refresh menu option on a semantic model details page in the Power BI service.":::

## Scheduled refresh

The **Refresh** section is where you define the frequency and time slots to refresh the semantic model. Some data sources don't require a gateway to be configurable for refresh, while other data sources require a gateway.

In a DirectQuery or live connection scenario, most source data isn't imported and therefore doesn't rely on scheduled refresh. However, some metadata (for example, role security updates) can still require the service to process the model. When a semantic model qualifies for performance optimization, **Refresh** can appear under the **Optimize performance** section.

Set the **Configure a refresh schedule** slider to **On** to configure the settings.

> [!NOTE]
> The target is to initiate the refresh within 15 minutes of the scheduled time slot, but a delay of up to one hour can occur if the service can't allocate the required resources sooner. Refresh can begin as early as five minutes before the scheduled refresh time.

:::image type="content" source="media/refresh-scheduled-refresh/scheduled-refresh.png" alt-text="Screenshot of scheduled refresh settings showing frequency and time slots for a semantic model.":::

> [!NOTE]
> Inactivity pause: After two months of inactivity, scheduled refresh on your semantic model is paused. A semantic model is considered inactive when no user has visited any dashboard or report built on it. Any view by any user (including via an app or Embedded scenario) resets the inactivity counter. When scheduled refresh is paused, the semantic model owner is emailed and the refresh schedule is displayed as **Disabled**. To resume, open any report or dashboard that uses the semantic model, then re-enable the schedule if needed.

### Refresh frequency limits

The maximum number of scheduled refreshes per day depends on the license/capacity:

* Power BI Pro: Up to 8 scheduled refreshes per day.
* Power BI Premium per user (PPU) and Premium / Fabric capacity (F SKU / EM / P / Fabric capacity): Up to 48 scheduled refreshes per day.
* Additional on-demand (manual or API) refreshes also count toward resource usage; see limits in [Data refresh](refresh-data.md#data-refresh).

For Fabric capacities, consider orchestrating complex refresh patterns with Data Factory pipelines or notebook jobs when you need dependencies or monthly cadence.

## Gateway and cloud connections

You'll see different options here depending on whether you have a personal gateway or enterprise gateway online and available.

If no gateway is available, you'll see **Gateway connection** disabled. You'll also see a message indicating how to install the personal gateway.

If you have a personal gateway configured and it's online, it's available to select. It shows offline if it's not available.

:::image type="content" source="media/refresh-scheduled-refresh/gateway-connection.png" alt-text="Screenshot of gateway connection section showing available personal and on-premises data gateways.":::

You can also select the enterprise gateway if one is available for you. You only see an enterprise gateway available if your account is listed in the **Users** tab of the data source configured for a given gateway.

## Data source credentials

### On-premises data gateway (personal mode)

If you're using the personal gateway to refresh data, you must supply the credentials to connect to the back-end data source. If you connected to an app from an online service, the credentials you entered to connect are carried over for scheduled refresh.

:::image type="content" source="media/refresh-scheduled-refresh/data-source-credentials-pgw.png" alt-text="Screenshot of data source credentials dialog for a semantic model using a personal gateway.":::

You're only required to sign in to a data source the first time you use refresh on that semantic model. Once entered, those credentials are retained with the semantic model.

> [!NOTE]
> For some authentication methods, if the password you use to sign in to a data source expires or is changed, you need to change it for the data source in **Data source credentials** too.

If there's a problem, typically it's either the gateway is offline because it couldn't sign in to Windows and start the service, or Power BI couldn't sign in to the data sources to query for updated data. If refresh fails, check the semantic model settings. If the gateway service is offline, **Status** is where you see the error. If Power BI can't sign in to the data sources, you see an error in Data source credentials.

### On-premises data gateway

If you're using the on-premises data gateway to refresh data, you don't need to supply credentials, as they're defined for the data source by the gateway administrator.

:::image type="content" source="media/refresh-scheduled-refresh/data-source-credentials-egw.png" alt-text="Screenshot of data source credentials section grayed out when using an on-premises data gateway managed by gateway admins.":::

> [!NOTE]
> When connecting to on-premises SharePoint for data refresh, Power BI supports only *Anonymous*, *Basic*, and *Windows (NTLM/Kerberos)* authentication mechanisms. Power BI does not support *ADFS* or any *Forms-Based Authentication* mechanisms for data refresh of on-premises SharePoint data sources.

## What's supported?

> [!TIP]
> Power BI does not have a monthly refresh interval option. However, you can use Power Automate (formerly Microsoft Flow) to create a custom refresh interval that occurs monthly, as described in this [blog post](https://powerbi.microsoft.com/blog/refresh-your-power-bi-dataset-using-microsoft-flow/).

Certain semantic models are supported against different gateways for scheduled refresh.

### On-premises data gateway (personal mode) support matrix

#### Power BI Desktop

* All online data sources shown in Power BI Desktop **Get data** and **Power Query Editor**.
* All on-premises data sources shown in Power BI Desktop **Get data** and **Power Query Editor** except for Hadoop files (HDFS) and Microsoft Exchange.

#### Excel

* All online data sources shown in Power Query.
* All on-premises data sources shown in Power Query except for Hadoop files (HDFS) and Microsoft Exchange.
* All online data sources shown in Power Pivot.
* All on-premises data sources shown in Power Pivot except for Hadoop files (HDFS) and Microsoft Exchange.

> [!NOTE]
> In Excel 2016 and later, **Launch Power Query Editor** is available from **Get Data** in the **Data** ribbon. Exchange Online requires the standard on-premises data gateway and isn't supported in personal mode.

### On-premises data gateway (enterprise) support matrix

For information about supported data sources, see [Power BI data sources](power-bi-data-sources.md).

## Troubleshooting

Sometimes refreshing data might not go as expected, typically due to an issue connected with a gateway. To diagnose refresh issues:

1. **View refresh history**: Go to the workspace, select the semantic model, then select **Refresh** > **Refresh history**. You can see the status, start time, duration, and error message for each refresh attempt.
1. **Check the gateway status**: In the semantic model settings, open the **Gateway and cloud connections** section to confirm your gateway is online.
1. **Update credentials**: If credentials have expired or changed, go to **Data source credentials** in the semantic model settings and re-enter them.

> [!NOTE]
> Power BI deactivates your refresh schedule after four consecutive failures or when the service detects an unrecoverable error that requires a configuration update, such as invalid or expired credentials. It is not possible to change the consecutive failures threshold.
>
> **To re-enable refresh after consecutive failures:**
>
> 1. Go to the semantic model settings and select **Refresh** > **Schedule refresh**.
> 1. Resolve the underlying issue (for example, update expired credentials in **Data source credentials**).
> 1. Set the **Configure a refresh schedule** slider back to **On** and select **Apply**.
>
> To view failure details, select the semantic model, then select **Refresh** > **Refresh history**. The refresh history shows the status, duration, and error messages for each refresh attempt.

For more gateway-specific troubleshooting, see these articles:

* [Troubleshoot the on-premises data gateway](service-gateway-onprem-tshoot.md)
* [Troubleshoot Power BI gateway (personal mode)](service-admin-troubleshooting-power-bi-personal-gateway.md)
* [Troubleshoot refresh scenarios](refresh-troubleshooting-refresh-scenarios.md)

## Related content

* [Data refresh in Power BI](refresh-data.md)  
* [Use a personal gateway in Power BI](service-gateway-personal-mode.md)  
* [On-premises data gateway (overview)](service-gateway-onprem.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
