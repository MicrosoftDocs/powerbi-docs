<properties 
   pageTitle="Troubleshooting refresh scenarios"
   description="Troubleshooting refresh scenarios"
   services="powerbi" 
   documentationCenter="" 
   authors="guyinacube" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="12/02/2015"
   ms.author="asaxton"/>

# Troubleshooting refresh scenarios  

Here you can find information regarding different scenarios you may face when refreshing data within the Power BI service.

## Unsupported data source for refresh  
[Troubleshooting unsupported data source for refresh](powerbi-admin-troubleshoot-unsupported-data-source-for-refresh.md)

## Dashboard doesn't reflect changes after refresh  
Please wait about 10-15 minutes for refresh to be reflected in the dashboard tiles.  If it is still not showing up, re-pin the visualization to the dashboard.

## GatewayNotReachable when setting credentials  
You may encounter GatewayNotReachable when trying to set credentials for a data source. This could be the result of an outdated Personal Gateway.  Install the latest gateway and try again.

## Processing Error: The following system error occurred: Type Mismatch  
This could be an issue with your M script within your Power BI Desktop file or Excel Workbook.  It could also be due to an out of date Power BI Desktop version.

## Tile refresh errors
You can use the following article to troubleshoot refresh issues with tiles.

[Troubleshooting tile errors](powerbi-refresh-troubleshooting-tile-errors.md)

## See Also  

[Data Refresh](powerbi-refresh-data.md)  

[Tools for troubleshooting refresh issues](powerbi-refresh-tools-for-troubleshooting-issues.md)  

[Troubleshooting the Power BI Gateway - Personal](powerbi-admin-troubleshooting-power-bi-personal-gateway.md)

[Troubleshooting the Power BI Gateway - Enterprise (Preview)](powerbi-gateway-enterprise-tshoot.md)