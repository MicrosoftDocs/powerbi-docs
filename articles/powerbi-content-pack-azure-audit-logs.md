<properties 
   pageTitle="Azure Audit Logs content pack for Power BI"
   description="Azure Audit Logs content pack for Power BI"
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
   ms.date="10/16/2015"
   ms.author="jastru"/>

# Azure Audit Logs content pack for Power BI  
[← Services in Power BI](https://support.powerbi.com/knowledgebase/topics/88770-services-in-power-bi)

With the Azure Audit Logs content pack you can analyze and visualize the information stored in the audit logs. Power BI retrieves your data, builds an out-of-the box dashboard, and creates reports based on that data.

[Connect to the Azure Audit Logs content pack for Power BI](https://app.powerbi.com/getdata/services/azure-audit-logs)

1. Select Get Data at the bottom of the left navigation pane.  
	![](media/powerbi-content-pack-azure-audit-logs/getdata.png)

2. In the Services box, select Get.  
	![](media/powerbi-content-pack-azure-audit-logs/services.PNG) 

3. Select Azure Audit Logs, then select Connect.  
	![](media/powerbi-content-pack-azure-audit-logs/getdata(1).png)

4. When prompted, enter your Azure Subscription ID. See details on finding your subscription ID below.   
	![](media/powerbi-content-pack-azure-audit-logs/parameters.png)

5. Select Authentication Method: oAuth2, click Sign In.   
	![](media/powerbi-content-pack-azure-audit-logs/creds.png)

6. Enter your account credentials to finish the sign in process.  
	![](media/powerbi-content-pack-azure-audit-logs/login.png)

7. Power BI will retrieve your Azure Audit Log data and create a ready-to-use dashboard and report.   
	![](media/powerbi-content-pack-azure-audit-logs/dashboard.png)

###  Finding you Azure Subscription ID  
There are two easy ways to find your Subscription Id.

1.  From https://portal.azure.com -&gt; Browse -&gt; Subscriptions -&gt; Subscription Id
2.  From https://manage.windowsazure.com -&gt; Settings  -&gt; Subscription Id

Your subscription ID will be long set of numbers and characters, similar to the example in Step \#4 above. 

## See Also  
[Get started with Power BI](http://support.powerbi.com/knowledgebase/articles/430814-get-started-with-power-bi)  
[Power BI - Basic Concepts](http://support.powerbi.com/knowledgebase/articles/487029-power-bi-preview-basic-concepts)  