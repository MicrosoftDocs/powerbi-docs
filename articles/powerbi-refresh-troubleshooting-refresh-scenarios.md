<properties
   pageTitle="Troubleshooting refresh scenarios"
   description="Troubleshooting refresh scenarios"
   services="powerbi"
   documentationCenter=""
   authors="guyinacube"
   manager="erikre"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="01/09/2017"
   ms.author="asaxton"/>

# Troubleshooting refresh scenarios  

Here you can find information regarding different scenarios you may face when refreshing data within the Power BI service.

> [AZURE.NOTE] If you encounter a scenario that is not listed below, and it is causing you issues, you can ask for further assistance on the [community site](http://community.powerbi.com/), or you can create a [support ticket](https://powerbi.microsoft.com/support/).

## Refresh using Web connector doesn't work properly
If you have a web connector script that's using the [**Web.Page**](https://msdn.microsoft.com/library/mt260924.aspx) function, and you have updated your dataset or report after  November 18th, 2016, you need to use a gateway in order for refresh to work properly.

## Unsupported data source for refresh
When configuring a dataset, you may get an error indicating the dataset uses an unsupported data source for refresh. For details, see
[Troubleshooting unsupported data source for refresh](powerbi-admin-troubleshoot-unsupported-data-source-for-refresh.md)

## Dashboard doesn't reflect changes after refresh  
Please wait about 10-15 minutes for refresh to be reflected in the dashboard tiles.  If it is still not showing up, re-pin the visualization to the dashboard.

## GatewayNotReachable when setting credentials  
You may encounter GatewayNotReachable when trying to set credentials for a data source. This could be the result of an outdated gateway.  Install the latest gateway and try again.

## Processing Error: The following system error occurred: Type Mismatch  
This could be an issue with your M script within your Power BI Desktop file or Excel Workbook.  It could also be due to an out of date Power BI Desktop version.

## Tile refresh errors
For a list of errors you may encounter with dashboard tiles, and explanations, see [Troubleshooting tile errors](powerbi-refresh-troubleshooting-tile-errors.md).

## See Also  

[Data Refresh](powerbi-refresh-data.md)  
[Troubleshooting the On-premises Data Gateway](powerbi-gateway-onprem-tshoot.md)  
[Troubleshooting the Power BI Gateway - Personal](powerbi-admin-troubleshooting-power-bi-personal-gateway.md)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)
