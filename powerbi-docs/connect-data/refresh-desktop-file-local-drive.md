---
title: Refresh a dataset created from a Power BI Desktop file - local
description: Refresh a dataset created from a Power BI Desktop file on a local drive
author: davidiseminger
ms.author: davidi
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 05/21/2021
LocalizationGroup: Data refresh
---
# Refresh a dataset created from a Power BI Desktop file on a local drive

## What’s supported?

In Power BI, Refresh Now and Schedule Refresh is supported for datasets created from Power BI Desktop files imported from a local drive where Get Data/Power Query Editor is used to connect to and load data from any of the following data sources:

### Power BI Gateway - Personal

- All online data sources shown in Power BI Desktop’s Get data and Power Query Editor.
- All on-premises data sources shown in Power BI Desktop’s Get data and Power Query Editor except for Hadoop file (HDFS) and Microsoft Exchange.

<!-- Refresh Data sources-->
[!INCLUDE [refresh-datasources](../includes/refresh-datasources.md)]

> [!NOTE]
> A gateway must be installed and running in order for Power BI to connect to on-premises data sources and refresh the dataset.
>
>

You can perform a one-time, manual refresh in Power BI Desktop by selecting **Refresh** on the Home ribbon. When you select **Refresh** here, the data in the *file’s* model is refreshed with updated data from the original data source. This kind of refresh, entirely from within the Power BI Desktop application itself, is different from manual or scheduled refresh in Power BI, and it’s important to understand the distinction.

![Refresh](media/refresh-desktop-file-local-drive/pbix-refresh.png)

When you import your Power BI Desktop file from a local drive, data, along with other information about the model, is loaded into a dataset in the Power BI service. In the Power BI service, not Power BI Desktop, you want to refresh data in the dataset because that is what your reports, in the Power BI service, are based on. Because the data sources are external, you can manually refresh the dataset by using **Refresh now** or you can set up a refresh schedule by using **Schedule refresh**.

When you refresh the dataset, Power BI does not connect to the file on the local drive to query for updated data. It uses information in the dataset to connect directly to the data sources to query for updated data it then loads into the dataset.

> [!NOTE]
> Refreshed data in the dataset is not synchronized back to the file on the local drive.
>
>

## How do I schedule refresh?

When you set up a refresh schedule, Power BI connects directly to the data sources using connection information and credentials in the dataset to query for updated data, then loads the updated data into the dataset. Any visualizations in reports and dashboards based on that dataset in the Power BI service are also updated.

For details on how to set up scheduled refresh, see [Configure scheduled refresh](refresh-scheduled-refresh.md).

## When things go wrong

When things go wrong, it’s usually because Power BI can’t sign into data sources, or if the dataset connects to an on-premises data source, the gateway is offline. Make sure Power BI can sign into data sources. If a password you use to sign into a data source changes, or Power BI gets signed out from a data source, be sure to try signing into your data sources again in Data Source Credentials.

Be sure to leave the **Send refresh failure notification email to me** checked. You’ll want to know right away if a scheduled refresh fails.

## Troubleshooting

Sometimes refreshing data may not go as expected. Typically this is an issue connected with a gateway. Take a look at the gateway troubleshooting articles for tools and known issues.

- [Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md)
- [Troubleshooting the Power BI Gateway - Personal](service-admin-troubleshooting-power-bi-personal-gateway.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
