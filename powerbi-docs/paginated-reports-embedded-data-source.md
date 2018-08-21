---
title: "Embedded data sources for paginated reports in the Power BI service | Microsoft Docs"
description: In this article, you learn how to create and modify an embedded data source in a paginated report in the Power BI service.
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: report-builder
ms.topic: conceptual
ms.date: 08/20/2018
ms.author: maggies
---
# Create and modify an embedded data source for paginated reports in the Power BI service
In this article, you learn how to create and modify an embedded data source in a paginated report in the Power BI service. An embedded data source is defined in a report definition and used only by that report.  

  
1. Open Report Builder.

1. On the toolbar in the Report Data pane, click **New**, and then click **Data Source**. The **Data Source Properties** dialog box opens.  
  
2.  In the **Name** text box, type a name for the data source or accept the default.  
  
3.  Verify that **Use a connection embedded in my report** is selected.  
  
    1.  From the **Select connection type** drop-down list, select a data source type; for example, **Microsoft SQL Server** or **OLE DB**.  
  
    2.  Specify a connection string by using one of the following alternatives:  
  
        -   Type the connection string directly in the **Connection string** text box. For a list of example connection strings, see [Data Connections, Data Sources, and Connection Strings in Report Builder](http://msdn.microsoft.com/library/7e103637-4371-43d7-821c-d269c2cc1b34).  
  
        -   Click the expression (**fx)** button to create an expression that evaluates to a connection string. In the **Expression** dialog box, type the expression in the Expression pane. [!INCLUDE[clickOK](../../includes/clickok-md.md)]  
  
        -   Click **Build** to open the **Connection Properties** dialog box for the data source type that you chose in step 2.  
  
             Fill in the fields in the **Connection Properties** dialog box as appropriate for the data source type. Connection properties include the type of data source, the name of the data source, and the credentials to use. After you specify values in this dialog box, click **Test Connection** to verify that the data source is available and that the credentials you specified are correct.  
  
4.  Click **Credentials**.  
  
     Specify the credentials to use for this data source. The owner of the data source chooses the type of credentials that are supported. For more information, see [Specify Credentials in Report Builder](http://msdn.microsoft.com/library/7412ce68-aece-41c0-8c37-76a0e54b6b53).  
  
5.  [!INCLUDE[clickOK](../../includes/clickok-md.md)]  
  
     The data source appears in the Report Data pane.  
  

  
