<properties 
   pageTitle="Data Management Gateway in Power BI for Office 365"
   description="Data Management Gateway in Power BI for Office 365"
   services="powerbi" 
   documentationCenter="" 
   authors="jastru" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="10/15/2015"
   ms.author="jastru"/>

# Data Management Gateway in Power BI for Office 365  

If you are a user of Power BI for Office 365, you may be familiar with the [Data Management Gateway](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&cad=rja&uact=8&ved=0CDgQFjAB&url=http%3A%2F%2Foffice.microsoft.com%2Fen-us%2Foffice365-sharepoint-online-enterprise-help%2Fintroduction-to-data-management-gateway-HA104079171.aspx&ei=N9fTVK-9G5e1oQSy7oEI&usg=AFQjCNHqjIu9Y-CXI7To2AUHOm4pxcxHyg&sig2=L9R4eBJ_ISpCxjg3cPcYxQ&bvm=bv.85464276,d.cGU) for refreshing on premises data.

At the moment, you can't refresh data using the Data Management Gateway in the Power BI service.  Existing Power BI for Office 365 users can continue to use the [Data Management Gateway from Power BI sites](https://support.office.com/article/Schedule-data-refresh-for-workbooks-in-Power-BI-for-Office-365-7d6d2816-7fb0-4c5f-a353-d5bd13124985). Use [Power BI Personal Gateway](powerbi-personal-gateway.md) for quick and secure data transfer between the new Power BI service and on-premises data sources that support refresh. 

If you are a Power BI for Office 365 user and would like to take advantage of the Data Management Gateway to refresh your Power BI dashboards and reports, you can try this technique:

1.  Upload an Excel workbook containing data connections that use the Data Management Gateway to OneDrive for Business.

2.  Configure [scheduled refresh for that workbook](https://support.office.com/article/Schedule-data-refresh-for-workbooks-in-Power-BI-for-Office-365-7d6d2816-7fb0-4c5f-a353-d5bd13124985).

3.  In Power BI, click Get Data and connect to the Excel workbook in OneDrive for Business.  