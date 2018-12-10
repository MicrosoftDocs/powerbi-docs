---
title: Troubleshooting unsupported data source for refresh
description: Troubleshooting unsupported data source for refresh
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 12/06/2017
ms.author: mblythe
ms.custom: seodec18

LocalizationGroup: Troubleshooting
---
# Troubleshooting unsupported data source for refresh
You may see an error when trying to configured a dataset for scheduled refresh.

        You cannot schedule refresh for this dataset because it gets data from sources that currently don’t support refresh.

This happens when the data source you used, within Power BI Desktop, isn’t supported for refresh. You will need to find the data source that you are using and compare that against the list of supported data sources at [Refresh data in Power BI](refresh-data.md). 

## Find the data source
If you aren’t sure what data source was used, you can find that using the following steps within Power BI Desktop.  

1. In Power BI Desktop, make sure you are on the **Report** pane.  
   ![Desktop report pane](media/service-admin-troubleshoot-unsupported-data-source-for-refresh/tshoot-report-pane.png)
2. Select **Edit Queries** from the ribbon bar.  
   ![Edit queries](media/service-admin-troubleshoot-unsupported-data-source-for-refresh/tshoot-edit-queries.png)
3. Select **Advanced Editor**.  
   ![Advance editor](media/service-admin-troubleshoot-unsupported-data-source-for-refresh/tshoot-advanced-editor.png)
4. Make note of the provider listed for the source.  In this example, the provider is ActiveDirectory.  
   ![Data source provider](media/service-admin-troubleshoot-unsupported-data-source-for-refresh/tshoot-provider.png)
5. Compare the provider with the list of supported data sources found within [Refresh data in Power BI](refresh-data.md).  You will find that Active Directory is not a supported data source for refresh.  

## Next steps
[Data Refresh](refresh-data.md)  
[Power BI Gateway - Personal](service-gateway-personal-mode.md)  
[On-premises data gateway](service-gateway-onprem.md)  
[Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md)  
[Troubleshooting the Power BI Gateway - Personal](service-admin-troubleshooting-power-bi-personal-gateway.md)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

