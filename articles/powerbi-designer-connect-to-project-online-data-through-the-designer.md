<properties pageTitle="Connect to Project Online data through the Power BI Designer" description="Connect to Project Online data through the Power BI Designer" services="powerbi" documentationCenter="" authors="v-anpasi" manager="mblythe" editor=""/>
<tags ms.service="powerbi" ms.devlang="NA" ms.topic="article" ms.tgt_pltfrm="NA" ms.workload="powerbi" ms.date="06/26/2015" ms.author="v-anpasi"/>
#Connect to Project Online data through the Power BI Designer

[← Services in Power BI](https://support.powerbi.com/knowledgebase/topics/88770-services-in-power-bi)

You can connect to data in Project Online through the Power BI Designer.
###Step 1: Download the Power BI Designer

1.  Download the Power BI Designer from the following link.  
    [﻿http://powerbi.com/dashboards/downloads/designer/](http://powerbi.com/dashboards/downloads/designer/)
2.  Run the installer and follow the instructions.

###Step 2: Connect to Project Online with OData

1.  Open the Power BI Designer on your computer.
2.  On the Welcome screen, click **﻿Get Data.**﻿
3.  Choose **﻿OData feed**﻿ and click **﻿Connect**﻿.
4.  ﻿Enter the address for your OData feed in the URL box, and then click OK.  

    If the address for your Project Web App site resembles https://\<tenantname\>.sharepoint.com/sites/pwa, the address you’ll enter for your OData Feed is https://\<tenantname\>.sharepoint.com/sites/pwa/\_api/Projectdata.
    
    For our example, we’re using https://contoso.sharepoint.com/sites/pwa/default.aspx
    
5.  The Designer will prompt you to authenticate with your Office 365 account. Select Organizational account and then enter your credentials.

    ![](media/powerbi-designer-connect-to-project-online-data-through-the-designer/image.png)

From here, you can choose which tables you would like to connect to and build a query.  Want an idea of how to get started?  The following blog post shows how to build a burndown chart from your Project Online data.  The blog post refers to using Power Query to connect to Project Online, but this applies to the Power BI Designer as well.

[Creating burndown charts for Project using Power Pivot and Power Query](http://blogs.office.com/2014/03/24/creating-burndown-charts-for-project-using-power-pivot-and-power-query/)