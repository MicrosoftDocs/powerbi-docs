---
title: "Tutorial: Connect to on-premises data in SQL Server"
description: Learn how to use SQL Server as a gateway data source, including how to refresh data.
services: powerbi
documentationcenter: ''
author: mgblythe
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: tutorial
ms.tgt_pltfrm: na
ms.workload: powerbi
ms.date: 05/03/2018
ms.author: mblythe

LocalizationGroup: Gateways
---

# Tutorial: Connect to on-premises data in SQL Server

An on-premises data gateway is software that you install within an on-premises network; it facilitates access to data in that network. In this tutorial you build a report in Power BI Desktop based on sample data in SQL Server. You then publish the report to the Power BI service, and configure a gateway so the the service can access the on-premises data. This access means the service can refresh the data to keep the report up to date.

If you're not signed up for Power BI, [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web) before you begin.

In this tutorial, you learn how to:
> [!div class="checklist"]
> * Create a report from data in SQL Server
> * Publish the report to the Power BI Service
> * Add SQL Server as a gateway data source
> * Schedule refresh for the SQL Server data


## Prerequisites

* [Install SQL Server](https://docs.microsoft.com/sql/database-engine/install-windows/install-sql-server) on a local computer 
* [Install an on-premises data gateway](service-gateway-install.md) on the same local computer (in production, it would typically be a different computer)


## Set up sample data

You start by adding sample data to SQL Server, so you can use that data in the rest of the tutorial.

1. In SQL Server Management Studio (SSMS), connect to your instance of SQL Server and create a test database.

    ```sql
    CREATE DATABASE TestGatewayDocs
    ```

2. In the database you created, add a table and insert data.

    ```sql
    USE TestGatewayDocs

    CREATE TABLE Product (
        SalesDate DATE,
        Product VARCHAR(100),
        Category  VARCHAR(100),
        Sales MONEY,
        Quantity INT
    )

    INSERT INTO Product VALUES('2018-05-05','Accessories','Carrying Case',9924.60,68)
    INSERT INTO Product VALUES('2018-05-06','Accessories','Tripod',1350.00,18)
    INSERT INTO Product VALUES('2018-05-11','Accessories','Lens Adapter',1147.50,17)
    INSERT INTO Product VALUES('2018-05-05','Accessories','Mini Battery Charger',1056.00,44)
    INSERT INTO Product VALUES('2018-05-06','Accessories','Telephoto Conversion Lens',1380.00,18)
    INSERT INTO Product VALUES('2018-05-06','Accessories','USB Cable',780.00,26)
    INSERT INTO Product VALUES('2018-05-08','Accessories','Budget Movie-Maker',3798.00,9)
    INSERT INTO Product VALUES('2018-05-09','Digital video recorder','Business Videographer',10400.00,13)
    INSERT INTO Product VALUES('2018-05-10','Digital video recorder','Social Videographer',3000.00,60)
    INSERT INTO Product VALUES('2018-05-11','Digital','Advanced Digital',7234.50,39)
    INSERT INTO Product VALUES('2018-05-07','Digital','Compact Digital',10836.00,84)
    INSERT INTO Product VALUES('2018-05-08','Digital','Consumer Digital',2550.00,17)
    INSERT INTO Product VALUES('2018-05-05','Digital','Slim Digital',8357.80,44)
    INSERT INTO Product VALUES('2018-05-09','Digital SLR','SLR Camera 35mm',18530.00,34)
    INSERT INTO Product VALUES('2018-05-07','Digital SLR','SLR Camera',26576.00,88)
    ```

3. Select the data from the table to verify what you inserted.

    ```sql
    SELECT * FROM Product
    ```

    ![Query results](media/service-gateway-sql-tutorial/query-results.png)


## Build and publish a report

Now that you have sample data in SQL Server, you connect to SQL Server in Power BI Desktop and build a report based on that data. You then publish the report to the Power BI service.

Connect to data and import
Build a report with one chart
Publish to the service


## Add SQL Server as a data source


## Configure and use data refresh

Set up scheduled refresh
Update the data / refresh (does on-demand refresh work with gateways?)


## Clean up resources
If you don't want to use the sample data anymore, use `DROP DATABASE TestGatewayDocs` in SSMS. If you don't want to use the SQL Server data source, [remove the data source](service-gateway-manage.md#remove-a-data-source). 


## Next steps
In this tutorial, you learned how to:
> [!div class="checklist"]
> * Create a report from data in SQL Server
> * Publish the report to the Power BI Service
> * Add SQL Server as a gateway data source
> * Schedule refresh for the SQL Server data

Advance to the next article to learn more
> [!div class="nextstepaction"]
> [Manage a Power BI gateway](service-gateway-manage.md)

