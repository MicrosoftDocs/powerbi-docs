---
title: Configure scheduled refresh
description: This covers the steps to select a gateway and configure scheduled refresh.
author: maggiesMSFT
ms.reviewer: kayu

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 06/06/2019
ms.author: maggies

LocalizationGroup: Data refresh
---

# Configure scheduled refresh

>[!NOTE]
>After two months of inactivity, scheduled refresh on your dataset is paused. For more information, see [*Scheduled refresh*](#scheduled-refresh) later in this article.

This article describes the options available for scheduled refresh for the [On-premises data gateway (personal mode)](service-gateway-personal-mode.md) and the [On-premises data gateway](service-gateway-onprem.md). You specify refresh options in the following areas of the Power BI service: **Gateway connection**, **Data source credentials**, and **Scheduled refresh**. We'll look at each in turn. For more information about data refresh, including limitations on refresh schedules, see [Data refresh](refresh-data.md#data-refresh).

To get to the **Scheduled refresh** screen:

1. In the navigation pane, under **Datasets**, select **More options** (...) next to a dataset listed .
2. Select **Schedule Refresh**.

    ![Schedule Refresh](media/refresh-scheduled-refresh/dataset-menu.png)

## Gateway connection

You will see different options here depending on whether you have a personal, or enterprise, gateway online and available.

If no gateway is available, you will see **Gateway connection** disabled. You will also see a message indicating how to install the personal gateway.

![Gateway not configured](media/refresh-scheduled-refresh/gateway-not-configured.png)

If you have a personal gateway configured, it is available to select if it is online. It will show offline if it is not available.

![Gateway connection](media/refresh-scheduled-refresh/gateway-connection.png)

You can also select the enterprise gateway if one is available for you. You will only see an enterprise gateway available if your account is listed in the **Users** tab of the data source configured for a given gateway.

## Data source credentials

### Power BI Gateway - Personal

If you are using the personal gateway to refresh data, you must supply the credentials to connect to the back-end data source. If you connected to a content pack from an online service, the credentials you entered to connect are carried over for scheduled refresh.

![Data source credentials](media/refresh-scheduled-refresh/data-source-credentials-pgw.png)

You’re only required to sign in to a data source the first time you use refresh on that dataset. Once entered, those credentials are retained with the dataset.

> [!NOTE]
> For some authentication methods, if the password you use to sign into a data source expires or is changed, you'll need to change it for the data source in **Data source credentials** too.

When things go wrong, the problem usually has something to do with either the gateway being offline because it could not sign in to Windows and start the service, or Power BI could not sign in to the data sources in order to query for updated data. If refresh fails, check the dataset’s settings. If the gateway service is offline, **Status** is where you’ll see the error. If Power BI cannot sign into the data sources, you’ll see an error in Data Source Credentials.

### On-premises data gateway

If you are using the On-premises data gateway to refresh data, you do not need to supply credentials, as they are defined for the data source by the gateway administrator.

![Schedule Refresh command](media/refresh-scheduled-refresh/data-source-credentials-egw.png)

> [!NOTE]
> When connecting to on-premises SharePoint for data refresh, Power BI supports only *Anonymous*, *Basic*, and *Windows (NTLM/Kerberos)* authentication mechanisms. Power BI does not support *ADFS* or any *Forms-Based Authentication* mechanisms for data refresh of on-premises SharePoint data sources.

## Scheduled refresh

The **Scheduled refresh** section is where you define the frequency and time slots to refresh the dataset. Some data sources do not require a gateway to be configurable for refresh; other data sources require a gateway.

Set the **Keep your data up to date** slider to **On** to configure the settings.

> [!NOTE]
> The target is to initiate the refresh within 15 minutes of the scheduled time slot, but a delay of up to one hour can occur if the service can't allocate the required resources sooner.

![Scheduled refresh dialog box](media/refresh-scheduled-refresh/scheduled-refresh.png)

> [!NOTE]
> After two months of inactivity, scheduled refresh on your dataset is paused. A dataset is considered inactive when no user has visited any dashboard or report built on the dataset. At that time, the dataset owner is sent an email indicating the scheduled refresh is paused. The refresh schedule for the dataset is then displayed as **disabled**. To resume scheduled refresh, simply revisit any dashboard or report built on the dataset.

## What’s supported?

Certain datasets are supported against different gateways for scheduled refresh. Here is a reference to understand what is available.

### Power BI Gateway - Personal

**Power BI Desktop**

* All online data sources shown in Power BI Desktop’s **Get Data** and Query Editor.
* All on-premises data sources shown in Power BI Desktop’s **Get Data** and Query Editor except for Hadoop file (HDFS) and Microsoft Exchange.

**Excel**

* All online data sources shown in Power Query.
* All on-premises data sources shown in Power Query except for Hadoop file (HDFS) and Microsoft Exchange.
* All online data sources shown in Power Pivot.
* All on-premises data sources shown in Power Pivot except for Hadoop file (HDFS) and Microsoft Exchange.

> [!NOTE]
> In Excel 2016 and later, Power Query is listed on the **Data** section of the ribbon, under **Get & Transform Data**.

### Power BI Gateway

For information about supported data sources, see [Power BI data sources](power-bi-data-sources.md).

## Troubleshooting
Sometimes refreshing data may not go as expected. Typically this will be an issue connected with a gateway. Take a look at the gateway troubleshooting articles for tools and known issues.

- [Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md)
- [Troubleshooting the Power BI Gateway - Personal](service-admin-troubleshooting-power-bi-personal-gateway.md)

## Next steps

- [Data refresh in Power BI](refresh-data.md)  
- [Power BI Gateway - Personal](service-gateway-personal-mode.md)  
- [On-premises data gateway (personal mode)](service-gateway-onprem.md)  
- [Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md)  
- [Troubleshooting the Power BI Gateway - Personal](service-admin-troubleshooting-power-bi-personal-gateway.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)