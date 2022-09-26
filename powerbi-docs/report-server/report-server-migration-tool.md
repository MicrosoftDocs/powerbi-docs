---
title: Migration tool for migrating from Power BI Report Server
description: This article targets Power BI Report Server report authors and Power BI administrators. It provides you with guidance to help you migrate your Report Definition Language (.rdl) reports to Power BI.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: 'cookiemccray'
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 09/22/2022
ms.custom: 
---

# Migration tool for migrating from Power BI Report Server

This article targets Power BI Report Server paginated report authors and Power BI administrators who want to migrate your Report Definition Language (.rdl) paginated reports to Power BI.

:::image type="content" source="media/whats-new/report-server-publish-migrate.png" alt-text="Screenshot showing Power BI Report Server Migration option.":::

You can achieve migration without downtime to your Power BI Report Server servers, or disruption to your report users. It's important to understand that you don't need to removed any data or reports. You can keep your current environment in place until you're ready for it to be retired.  

## Supported versions 

You can migrate Power BI Report Server instances running on-premises or on virtual machines hosted by cloud providers like Azure.

The following list describes the SQL Server versions supported for migration to Power BI:

- SQL Server 2017
- SQL Server 2019
- SQL Server 2022 RC0

This tool is designed to help customers migrate Power BI Report Server paginated reports (.rdl files) from their local servers to a Power BI workspace in their tenant. As part of the migration process, the tool also: 

- Checks for unsupported data sources or report components when uploading to Power BI 
- Saves the converted files that pass these checks to a specified Power BI Workspace. 
- Provides a summary of the successful and unsuccessful assets migrated 

Only .rdl reports can be migrated from your Power BI Report Server servers to Power BI. Each migrated .rdl report becomes a Power BI paginated report.

You can publish folder content or individual reports. Read on to learn how to publish .rdl reports to Power BI. 

## Publish .rdl reports to Power BI  

You can publish .rdl reports from Power BI Report Server web portal to the Power BI service.  

### Step 1: Site settings  

The first step to publishing .rdl files is to set system properties on the report server:

- [EnablePowerBIReportMigrate](/sql/reporting-services/tools/server-properties-advanced-page-reporting-services#enablepowerbireportmigrate) and 
- [PowerBIMigrateUrl](/sql/reporting-services/tools/server-properties-advanced-page-reporting-services#powerbimigrateurl)

:::image type="content" source="media/report-server-migration-tool/power-bi-report-server-set-server-properties.png" alt-text="Screenshot of setting report server properties.":::

### Step 2: Browse reports 

Select **Publish** to publish .rdl files from Power BI Report Server to the Power BI service.

:::image type="content" source="media/report-server-migration-tool/report-server-publish-migrate.png" alt-text="Screenshot showing Migrate options in the report server.":::

- Select **Publish all reports** to select all the .rdl files in the current folder and start the migration.
- Select **Select reports to publish** to open a list view of all .rdl files in the current folder. You select which of the reports and folders you want to migrate.
 
You can also publish individual articles.

- On the **More info** next to an .rdl report, select **Publish** 

    :::image type="content" source="media/report-server-migration-tool/power-bi-report-server-individual-publish.png" alt-text="Screenshot showing More options to Publish.":::

### Step 3: Select reports 

If you chose **Select reports to publish**, the next step is to **Select reports to publish to Power BI**.

Items that can be migrated now:
RDLs
Linked reports (RDLs)
Folders (All reports from the folder will be migrated)

Graphical user interface, application, Teams

Description automatically generated 

### Step 4: Sign in/Sign up 

 

Graphical user interface, application, Teams

Description automatically generated 

### Step 5: choose a workspace  

Graphical user interface, application

Description automatically generated 

### Step 6: View reports  

A picture containing graphical user interface

Description automatically generated 


## Next steps

Check these sources to keep up-to-date on new features in Power BI Report Server.

- [Microsoft Power BI blog](https://powerbi.microsoft.com/blog/)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
