---
title: "Publish .rdl files to Power BI from Reporting Services | Microsoft Docs"
description: "This article provides step-by-step instructions for migrating .rdl files, or *paginated reports*, from SQL Server Reporting Services to the Power BI service."
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.date: 11/04/2022
ms.custom:
---

# Publish .rdl files to Power BI from Reporting Services

[!INCLUDE [applies-yes-paginated-yes-service-no-desktop](../includes/applies-yes-paginated-yes-service-no-desktop.md)] ✔️&nbsp;SQLServer&nbsp;2022&nbsp;Reporting&nbsp;Services
 
Do you have Report Definition Language (.rdl) paginated reports in SQL Server 2022 Reporting Services (SSRS), and you want to migrate them to the Power BI service? This article provides step-by-step instructions for migrating .rdl files, or *paginated reports*, from SQL Server 2022 Reporting Services to the Power BI service. 

> [!NOTE]
> If you're using a previous version of Reporting Services, continue to use the [RDL Migration Tool](https://github.com/microsoft/RdlMigration) for now.

You can migrate reports without downtime to your SQL Server Reporting Services servers or disruption to your report users. It's important to understand that you don't need to remove any data or reports. You can keep your current environment in place until you're ready for it to be retired.

## Prerequisites 

You can publish and share paginated reports in your My Workspace or in other workspaces, as long as you can meet these prerequisites: 

- You have a Power BI Pro or Premium Per User license.
- You have write access to the workspace.

## Supported versions 

You can migrate reports from SSRS instances running on-premises or on virtual machines hosted by cloud providers like Azure.

This publishing tool is designed to help customers migrate SSRS paginated reports (.rdl files) from their local servers to a Power BI workspace in their tenant. As part of the migration process, the tool also:

- Checks for unsupported data sources or report components when uploading to Power BI. 
- Saves the converted files that pass these checks to a Power BI workspace that you specify. 
- Provides a summary of the successful and unsuccessful assets migrated.

You can only migrate .rdl reports from your SSRS servers to Power BI. Each migrated .rdl report becomes a Power BI paginated report. 

You can publish individual .rdl reports or the contents of entire folders from the SSRS web portal to the Power BI service. Read on to learn how to publish .rdl reports to Power BI.

## Step 1: Set site properties 

The first step to publishing .rdl files to the Power BI service is to set system properties on the report server. Read more about them in the SQL Server Reporting Services article, [Server Properties Advanced Page - Power BI Report Server & Reporting Services](/sql/reporting-services/tools/server-properties-advanced-page-reporting-services).

- EnablePowerBIReportMigrate and 
- PowerBIMigrateUrl

:::image type="content" source="media/publish-reporting-services-power-bi-service/ssrs-system-settings.png" alt-text="Screenshot showing site properties.":::

## Step 2: Browse to reports 

Select **Publish** to find the .rdl files you want to publish from SSRS to the Power BI service. 

:::image type="content" source="media/publish-reporting-services-power-bi-service/rdl-select-publish.png" alt-text="Screenshot showing Publish.":::

- Select **Publish all reports** to select all the .rdl files in the current folder and start the migration. 
- Select **Select reports to publish** to open a list view of all .rdl files in the current folder. Select the reports and folders you want to migrate.

You can also publish individual articles.

- On the **More info** menu next to an .rdl report, select **Publish**. 

    :::image type="content" source="media/publish-reporting-services-power-bi-service/rdl-more-info-publish-power-bi.png" alt-text="Screenshot showing More info > Publish.":::

## Step 2b: Select reports 

If you chose **Select reports to publish**, the next step is to **Select reports to publish to Power BI**. 

:::image type="content" source="media/publish-reporting-services-power-bi-service/rdl-select-reports-publish.png" alt-text="Screenshot showing Select reports to publish to Power BI.":::

Items that you can migrate now: 

- The .rdl files 
- Linked reports (.rdl files) 
- Folders (all .rdl reports from the folder are migrated) 

## Step 3: Sign in/Sign up 

After you've selected the reports you want to publish, it's time to **Sign in** to the Power BI service.

:::image type="content" source="media/publish-reporting-services-power-bi-service/rdl-sign-in-power-bi.png" alt-text="Screenshot showing Sign in to Power BI.":::
 
## Step 4: Choose a workspace 

Next select the dropdown arrow to find and **Select a workspace**. 

:::image type="content" source="media/publish-reporting-services-power-bi-service/rdl-select-workspace.png" alt-text="Screenshot showing selecting a workspace.":::

## Step 5: View reports 

In the Power BI service, navigate to the workspace where you saved the reports. 

:::image type="content" source="media/publish-reporting-services-power-bi-service/paginated-reports-power-bi.png" alt-text="Screenshot showing paginated reports in a workspace.":::

Select a report to view it in the Power BI service.

## Limitations and considerations

### Unsupported item types

You can only migrate .rdl reports from your SSRS servers to the Power BI service. Each migrated .rdl report becomes a Power BI paginated report. You can't migrate the following item types to the Power BI service: 

- Shared data sources 
- Shared datasets 
- Resources such as image files 
- KPIs 
- Mobile reports (discontinued) 
- Report models (discontinued) 
- Report parts (discontinued) 

### Unsupported report features

Some paginated report features in SSRS aren't yet supported in the Power BI service. Paginated reports don't support the following items: 

- Shared data sources 
- Shared datasets 
- Drill through and click-through to other reports 
- Custom fonts 

You get an error message if you try to upload a file with features that are unsupported in the Power BI service.  

## Next steps

More questions? [Try asking the Reporting Services forum](/answers/search.html?c=&f=&includeChildren=&q=ssrs+OR+reporting+services&redirect=search%2fsearch&sort=relevance&type=question+OR+idea+OR+kbentry+OR+answer+OR+topic+OR+user)
