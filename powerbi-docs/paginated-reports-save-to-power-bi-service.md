---
title: "Publish a paginated report to the Power BI service | Microsoft Docs"
description: In this tutorial, you learn to publish a paginated report to the Power BI service by uploading it from your local computer.  
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: report-builder
ms.topic: conceptual
ms.date: 08/24/2018
ms.author: maggies
---

# Publish a paginated report to the Power BI service

In this article, you learn about publishing a paginated report to the Power BI service by uploading it from your local computer. You can upload paginated reports to your My Workspace or any other workspace, as long as the worksapce is in a Premium capacity. Look for the diamond icon ![Power BI Premium capacity diamond icon](media/paginated-reports-save-to-power-bi-service/premium-diamond.png) next to the workspace name. 

If your report data source is on premises, then you need to create a gateway after you upload the report.

## Upload a paginated report to the Power BI service

1. Create your paginated report in Report Builder and save it to your local computer.

1. Open the Power BI service in a browser and browse to the Premium workspace where you want to publish the report. Note the diamond icon ![Power BI Premium capacity diamond icon](media/paginated-reports-save-to-power-bi-service/premium-diamond.png) next to the name. 

1. Select **Get Data**.

    ![Power BI Get Data](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-get-data.png)

1. In the **Files** box, select **Get**.

    ![Power BI Get Files](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-files-get.png)

1. Select **Local file** > browse to the paginated report > **Open**.

    ![Select Local File](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-local-file.png)

1. Select **Continue** > **Edit credentials**.

    ![Select Edit credentials](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-select-edit-credentials.png)

1. Configure your credentials > **Sign in**.

    ![Edit credentials](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-credentials.png)

   You see your report in the list of reports.

    ![Paginated report in Reports list](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-wwi-report.png)

1. Select it to open it in the Power BI service. It if has parameters, you need to select them before you can view the report.
 
    ![Select parameters](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-select-parameters.png)

## Create a gateway to an on-premises data source

Just like any other Power BI report, if the report data source is on premises, then you need to create or connect to a gateway to access the data.

1. Next to the report name, select **Manage**.

   ![Manage the paginated report](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-manage.png)

1. See the Power BI service article [Install a gateway](service-gateway-install.md) for details and next steps.


## Next steps

- [What are paginated reports in Power BI Premium? (Preview)](paginated-reports-report-builder-power-bi.md)

