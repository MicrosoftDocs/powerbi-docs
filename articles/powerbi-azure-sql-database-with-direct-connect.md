<properties pageTitle="Azure SQL Database With Direct Connect" description="Azure SQL Database With Direct Connect" services="powerbi" documentationCenter="" authors="v-anpasi" manager="mblythe" editor=""/>
<tags ms.service="powerbi" ms.devlang="NA" ms.topic="article" ms.tgt_pltfrm="NA" ms.workload="powerbi" ms.date="06/25/2015" ms.author="v-anpasi"/>
# Azure SQL Database With Direct Connect

[← Big data and more](https://support.powerbi.com/knowledgebase/topics/88773-big-data-and-more)

Azure SQL Database with Direct Connect allows you to create dynamic reports based on data and metric you already have in your Azure SQL Database. With Direct Connect, queries are sent back to your Azure SQL Database as you explore the data in the report view. This experience is suggested for users who are familiar with the databases and entities they connect to.

Notes:
-   Specify the fully qualified server name when connecting (see below for more details)
-   Ensure firewall rules for the database are configured to "[Allow access to Azure services](https://msdn.microsoft.com/library/azure/ee621782.aspx)".
-   Every action such as selecting a column or adding a filter will send a query back to the database
-   Tiles are refreshed approximately every 15 mins (refresh does not need to be scheduled)
-   Q&A is not available for Direct Connect datasets
-   Schema changes are not picked up automatically

These restrictions and notes may change as we continue to improve the experiences. The steps to connect are detailed below. 

 
1.  Click **Get Data** at the top of the navigation pane.
    
    ![](media/powerbi-azure-sql-database-with-direct-connect/PBI_GetData.png)

2.  Select **Big Data & More**.
    
    ![](media/powerbi-azure-sql-database-with-direct-connect/PBI_ConnectBigData.png)

3.  Select the **Azure SQL Database** \> **connect**. 
    
    ![](media/powerbi-azure-sql-database-with-direct-connect/PBI_AzureSQLDbConnect.png)

4.  Enter the name of the **server** (fully qualified, such as name.database.windows.net) and **database** you want to connect to, as well as your **username** and **password**. These parameters can be found in the Azure Portal, see more details below about finding the parameter values.

5.  After you've connected, you'll see a new dataset with the same name as the database you connected to. You can also access the dataset through the placeholder tile for the dataset, created on the dashboard.    

    ![](media/powerbi-azure-sql-database-with-direct-connect/PBI_AzureSQLbNewDataset.png)

6.  Selecting the placeholder tile for the dataset opens a new report, where you can explore all of the tables and columns in your database. Selecting a column will send a query back to the source, dynamically creating your visual. These visuals can be saved in a new report, and pinned back to your dashboard.

![](media/powerbi-azure-sql-database-with-direct-connect/Visuals.png)

### Finding Parameter Values

Your fully qualified server name and database name can be found in the Azure Portal.

![](media/powerbi-azure-sql-database-with-direct-connect/AzurePortNew_update.png)


![](media/powerbi-azure-sql-database-with-direct-connect/AzurePortal_update.png)

## See Also:

[Get started with Power BI Preview](http://support.powerbi.com/knowledgebase/articles/430814-get-started-with-power-bi)  
[Get Data for Power BI Preview](http://support.powerbi.com/knowledgebase/articles/434354-get-data)
