<properties 
   pageTitle="Salesforce content pack for Power BI"
   description="Salesforce content pack for Power BI"
   services="powerbi" 
   documentationCenter="" 
   authors="v-anpasi" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/18/2015"
   ms.author="v-anpasi"/>
# Salesforce content pack for Power BI

[← Services in Power BI](https://support.powerbi.com/knowledgebase/topics/88770-services-in-power-bi)

With Power BI, you can easily connect to your Salesforce.com account. Creating this connection retrieves your data and automatically provides a dashboard and related reports based on your data.

Connect to the [Salesforce content pack](https://app.powerbi.com/getdata/services/salesforce) for Power BI.

![](media/powerbi-content-pack-salesforce/PBI_GetDataSalesforceDash.png)

After you have a connection to your Salesforce account, you can explore your data and change the dashboard to meet your needs. The data is refreshed automatically once a day.

1.  Select **Get Data** at the bottom of the left navigation pane.

	![](media/powerbi-content-pack-salesforce/PBI_GetData.png) 

2.  In the **Services** box, select **Get**.

	![](media/powerbi-content-pack-salesforce/PBI_GetServices.png) 

3.  Click **Salesforce** and select **Connect**.  

4.   ![](media/powerbi-content-pack-salesforce/PBI_SalesforceConnect.png)

5.  When prompted, enter your Salesforce credentials. Click **Allow** so Power BI can access your basic Salesforce information and data.

	![](media/powerbi-content-pack-salesforce/SF_authorize.png)

6.	Configure what you'd like to import into Power BI using the dropdown option:

	-  **Dashboard**

     Select a predefined dashboard based on a persona (such as **Sales Manager**). These dashboards bring in a specific set of standard data from Salesforce and will not include custom fields.

		![](media/powerbi-content-pack-salesforce/PBI_SalesforceChooseRole.png)

	-	**Reports**

		Select one or more custom reports from your Salesforce account. These reports will match your views in Salesforce and can include data from custom fields or objects.

		![](media/powerbi-content-pack-salesforce/PBI_SalesforceReports.png)

		If you don't see any reports, add or create them in your Salesforce account and try connecting again.

7.  Click **Connect** to begin the import process. 

During the import you see a notification showing the import is in progress. When the import is complete, you see a dashboard, report, and dataset for your Salesforce data listed in the navigation pane on the left.

You can change this dashboard to display your data any way you want. You can ask questions with Q&A - see [ask the right questions of Salesforce data](http://support.powerbi.com/knowledgebase/articles/475138-ask-the-right-questions-of-salesforce-data) for suggestions. Or click a tile to [open the underlying report](http://support.powerbi.com/knowledgebase/articles/425669-tiles-in-power-bi) and [change the tiles](http://support.powerbi.com/knowledgebase/articles/424878-edit-a-tile-resize-move-rename-delete) in the dashboard.


Requirements:

-   Connected with a Salesforce account that has API access enabled.

-   Permission granted to the Power BI app during log-in.

-   The account has sufficient API calls available to pull and refresh the data.

-   A valid authentication token is required for refresh. Ensure you have 5 or less Salesforce data sets imported, as Salesforce has a limit of 5 authentication tokens per application.

-   The ability to log in through login.salesforce.com, as custom or sandbox domains, is not currently supported.

### See also

[Ask the right questions of Salesforce data](http://support.powerbi.com/knowledgebase/articles/475138-ask-the-right-questions-of-salesforce-data)

[Get Started with Power BI](http://support.powerbi.com/knowledgebase/articles/430814-get-started-with-power-bi-preview)

[Get Data](http://support.powerbi.com/knowledgebase/topics/63369-get-data)

