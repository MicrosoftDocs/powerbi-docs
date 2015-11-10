<properties
   pageTitle="Troubleshooting unsupported data source for refresh"
   description="Troubleshooting unsupported data source for refresh"
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
   ms.date="11/03/2015"
   ms.author="asaxton"/>

# Troubleshooting unsupported data source for refresh  

You may see an error when trying to configured a dataset for scheduled refresh.

		You cannot schedule refresh for this dataset because it gets data from sources that currently don’t support refresh.

This happens when the data source you used, within Power BI Desktop, isn’t supported for refresh. You will need to find the data source that you are using and compare that against the list of supported data sources at [Refresh data in Power BI](powerbi-refresh-data.md). 

## Find the data source  
If you aren’t sure what data source was used, you can find that using the following steps within Power BI Desktop.  

1.  In Power BI Desktop, make sure you are on the **Report** pane.  
    ![](media/powerbi-admin-troubleshoot-unsupported-data-source-for-refresh/tshoot-report-pane.png)

2.  Select **Edit Queries** from the ribbon bar.  
    ![](media/powerbi-admin-troubleshoot-unsupported-data-source-for-refresh/tshoot-edit-queries.png)

3.  Select **Advanced Editor**.  
    ![](media/powerbi-admin-troubleshoot-unsupported-data-source-for-refresh/tshoot-advanced-editor.png)

4.  Make note of the provider listed for the source.  In this example, the provider is ActiveDirectory.  
    ![](media/powerbi-admin-troubleshoot-unsupported-data-source-for-refresh/tshoot-provider.png)

5.  Compare the provider with the list of supported data sources found within [Refresh data in Power BI](powerbi-refresh-data.md).  You will find that Active Directory is not a supported data source for refresh.  

## See Also  
[Data Refresh](powerbi-refresh-data.md)  
[Tools for troubleshooting refresh issues](powerbi-refresh-tools-for-troubleshooting-issues.md)  
