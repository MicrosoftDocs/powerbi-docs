---
title: "Publish a paginated report to the Power BI service | Microsoft Docs"
description: In this tutorial, you learn to publish a paginated report to the Power BI service by uploading it from your local computer.  
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: report-builder
ms.topic: conceptual
ms.date: 08/21/2018
ms.author: maggies
---

# Publish a paginated report to the Power BI service

In this article, you learn about publishing a paginated report to the Power BI service by uploading it from your local computer. You can upload paginated reports to your My Workspace or any other workspace, as long as the worksapce is in a Premium capacity. Look for the diamond icon ![Power BI Premium capacity diamond icon](media/paginated-reports-save-to-power-bi-service/premium-diamond.png) next to the workspace name. 

If your report data source is on premises, then you need to create a gateway after you upload the report.

## Upload a paginated report to the Power BI service

1. Create your paginated report in Report Builder and save it to your local computer.

1. Open the Power BI service in a browser and browse to the Premium workspace where you want to publish the report. Note the diamond icon ![Power BI Premium capacity diamond icon](media/paginated-reports-save-to-power-bi-service/premium-diamond.png) next to the name. 

1. Select **Get Data**.

1. In the **Files** box, select **Get**.

1. Select **Local file** > browse to the paginated report > **Open**.

1. Select **Continue** > **Edit credentials**.

1. Configure your credentials > **Sign in**.

   You see your report in the list of reports.

1. Select it to open it in the Power BI service.

## Create a gateway to an on-premises data source

Just like any other Power BI report, if the report data source is on premises, then you need to create or connect to a gateway to access the data.

1. Next to the report name, select **Manage**.

   ![Manage the paginated report](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-manage.png)

1. See the Power BI service article [Install a gateway](service-gateway-install.md) for details and next steps.


## Next steps

[What are paginated reports in Power BI Premium? (Preview)](paginated-reports-report-builder-power-bi.md)
