---
title: "Publish a paginated report to the Power BI service"
description: In this tutorial, you learn to publish a paginated report to the Power BI service by uploading it from your local computer.  
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 10/27/2022
---

# Publish a paginated report to the Power BI service

[!INCLUDE [applies-yes-paginated-yes-service-no-desktop](../includes/applies-yes-paginated-yes-service-no-desktop.md)] 

In this article, you learn about publishing a paginated report to the Power BI service by uploading it from your local computer.

## Requirements

- To publish a Power BI paginated report to the Power BI service, you need a [Power BI Pro](../fundamentals/service-self-service-signup-for-power-bi.md) license, or [Premium Per User (PPU)](../enterprise/service-premium-per-user-faq.yml) license.
- You can publish to My Workspace, or you need at least a [Contributor role](../collaborate-share/service-roles-new-workspaces.md#workspace-roles) for any other workspace.
- If your report data source is on premises, you need to install a gateway. Read more about [on-premises gateways](../connect-data/service-gateway-onprem.md). After you upload the report, you connect to the on-premises data source by using the gateway.

## From Report Builder, publish a paginated report to the Power BI service

1. Create a new paginated report or open an existing paginated report from the Power BI Service in Report Builder. If you open an existing paginated report from the service, the **Save** option is disabled because you're updating a report that's live in the Power BI Service.

1. On the Report Builder **File** menu, select **Publish**.

    ![Screenshot showing Select the File menu, then Publish.](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-save-as.png)

    If you aren't signed in to Power BI yet, you need to sign in or create an account now. In the upper-right corner of Report Builder, select **Sign in** and complete the steps.

1. In the list of workspaces on the left, select a workspace. Type a **File name** in the box > **Save**.

    ![Screenshot showing Select a workspace.](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-select-workspace.png)

1. Open the Power BI service in a browser and browse to the workspace where you published the paginated report. On the **Reports** tab, you see your report.

    ![Screenshot showing Paginated report in Reports list.](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-wwi-report.png)

5. Select the paginated report to open it in the Power BI service. If it has parameters, you need to select them before you can view the report.

    ![Screenshot showing Select parameters.](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-select-parameters.png)

6. If your report data source is on premises, read about how to [connect to a gateway](#connect-to-a-gateway) in this article to access the data source.

## From the Power BI service, upload a paginated report

You can also start from the Power BI service and upload a paginated report.

1. Create your paginated report in Report Builder and save it to your local computer.

1. Open the Power BI service in a browser and browse to the workspace where you want to publish the report.

1. Select **Get data** at the bottom of the nav pane. 

   :::image type="content" source="../media/power-bi-get-data.png" alt-text="Select Get data.":::

1. In the **Files** box, select **Get**.

    ![Screenshot showing Power BI Get Files.](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-files-get.png)

1. Select **Local file** > browse to the paginated report > **Open**.

    ![Screenshot showing Select Local File.](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-local-file.png)

1. Select **Continue** > **Edit credentials**.

    ![Screenshot showing Select Edit credentials.](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-select-edit-credentials.png)

1. Configure your credentials > **Sign in**.

    ![Screenshot showing Edit credentials.](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-credentials.png)

   On the **Reports** tab, you see your report.

    ![Screenshot showing Paginated report in Reports list.](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-wwi-report.png)

1. Select it to open it in the Power BI service. If it has parameters, you need to select them before you can view the report.
 
    ![Screenshot showing Select parameters.](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-select-parameters.png)

6. If your report data source is on premises, read about how to [connect to a gateway](#connect-to-a-gateway) in this article to access the data source.

## Connect to a gateway

As with any other Power BI report, if the paginated report data source is on premises, then you need to create or connect to a gateway to access the data.

1. Next to the report name, select **Manage**.

   ![Screenshot showing Manage the paginated report.](media/paginated-reports-save-to-power-bi-service/power-bi-paginated-manage.png)

1. See the Power BI service article [What is an on-premises data gateway](../connect-data/service-gateway-onprem.md) for details and next steps.

## Next steps

- [View a paginated report in the Power BI service](../consumer/paginated-reports-view-power-bi-service.md)
- [What are paginated reports in Power BI?](paginated-reports-report-builder-power-bi.md)
- [Embed Power BI paginated reports](../developer/embedded/embed-paginated-reports.md)
