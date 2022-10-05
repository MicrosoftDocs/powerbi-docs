---
title: Publish reports from Power BI Report Server to the Power BI service
description: This article targets Power BI Report Server report authors and Power BI administrators. It provides you with guidance to help you migrate your Report Definition Language (.rdl) reports to Power BI, and shows you how to use the simple migration tool.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: 'cookiemccray'
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 09/29/2022
ms.custom: 
---

# Publish reports from Power BI Report Server to the Power BI service

Do you have Report Definition Language (.rdl) paginated reports in Power BI Report Server, and you want to migrate them to the Power BI service? This article shows you how to use the simple migration tool.

:::image type="content" source="media/whats-new/report-server-publish-migrate.png" alt-text="Screenshot showing Power BI Report Server Migration option.":::

You can migrate reports without downtime to your Power BI Report Server servers or disruption to your report users. It's important to understand that you don't need to remove any data or reports. You can keep your current environment in place until you're ready for it to be retired.  

## Prerequisites

You can publish and share paginated reports in your My Workspace or in other workspaces, as long as these prerequisites are met:

- You have a Power BI Pro or Premium Per User license.
- The workspace is in a Power BI Premium capacity.
- You have write access to the workspace.

See [What is Power BI Premium?](../enterprise/service-premium-what-is.md) for details.

## Supported versions 

You can migrate reports from Power BI Report Server instances running on-premises or on virtual machines hosted by cloud providers like Azure.

The following list describes the SQL Server versions supported for migration to Power BI:

- SQL Server 2017
- SQL Server 2019
- SQL Server 2022 RC0

This publishing tool is designed to help customers migrate Power BI Report Server paginated reports (.rdl files) from their local servers to a Power BI workspace in their tenant. As part of the migration process, the tool also:

- Checks for unsupported data sources or report components when uploading to Power BI.
- Saves the converted files that pass these checks to a specified Power BI workspace.
- Provides a summary of the successful and unsuccessful assets migrated.

Only .rdl reports can be migrated from your Power BI Report Server servers to Power BI. Each migrated .rdl report becomes a Power BI paginated report.

You can publish folder content or individual .rdl reports from the Power BI Report Server web portal to the Power BI service. Read on to learn how to publish .rdl reports to Power BI.

## Step 1: Set site properties  

The first step to publishing .rdl files to the Power BI service is to set system properties on the report server. Read more about them in the SQL Server Reporting Services article, [Server Properties Advanced Page - Power BI Report Server & Reporting Services](/sql/reporting-services/tools/server-properties-advanced-page-reporting-services).

- [EnablePowerBIReportMigrate](/sql/reporting-services/tools/server-properties-advanced-page-reporting-services#enablepowerbireportmigrate) and 
- [PowerBIMigrateUrl](/sql/reporting-services/tools/server-properties-advanced-page-reporting-services#powerbimigrateurl)

:::image type="content" source="media/report-server-migration-tool/power-bi-report-server-set-server-properties.png" alt-text="Screenshot of setting report server properties.":::

## Step 2: Browse to reports 

Select **Publish** to find the .rdl files you want to publish from Power BI Report Server to the Power BI service.

:::image type="content" source="media/report-server-migration-tool/report-server-publish-migrate.png" alt-text="Screenshot showing Migrate options in the report server.":::

- Select **Publish all reports** to select all the .rdl files in the current folder and start the migration.
- Select **Select reports to publish** to open a list view of all .rdl files in the current folder. You select which of the reports and folders you want to migrate.
 
You can also publish individual articles.

- On the **More info** menu next to an .rdl report, select **Publish**.

    :::image type="content" source="media/report-server-migration-tool/power-bi-report-server-individual-publish.png" alt-text="Screenshot showing More options to Publish.":::

### Step 2b: Select reports

If you chose **Select reports to publish**, the next step is to **Select reports to publish to Power BI**.

:::image type="content" source="media/report-server-migration-tool/power-bi-report-server-select-reports.png" alt-text="Screenshot showing selecting reports to publish.":::

Items that you can migrate now:

- The .rdl files
- Linked reports (.rdl files)
- Folders (all .rdl reports from the folder are migrated)


## Step 3: Sign in/Sign up 

### Sign in

If you already have a Power BI license, after you've selected the reports you want to publish, it's time to **Sign in** to the Power BI service.

:::image type="content" source="media/report-server-migration-tool/power-bi-report-server-sign-in.png" alt-text="Screenshot showing signing in to the Power B I service."::: 

### Sign up

If you don't have a Power BI license yet, you can still publish reports to the Power BI service. The [Auto-License Assignment Service](https://powerbi.visualstudio.com/PowerBIClients/_git/PowerBIClients?path=/src/Modern/Shared/Licensing/services/auto-license-assignment.service.ts&_a=contents&version=GBmaster) in Visual Studio can assign you a free license for personal use.

If we're successful at assigning the license, we show a success message. If we can't assign a license because you don't have  an associated tenant, or license assignment fails, we show a message that you don't have a Power BI license. Then you can go to the [Power BI service sign-up page](https://app.powerbi.com/singleSignOn) to create an account.

The current sign-in flow doesn't allow non-Azure Active Directory (AAD) users to sign up, so if you've never used the Power BI service and never signed in to AAD, you should sign up for Power BI in the [Power BI service](https://app.powerbi.com) first before starting the migration tool.   

## Step 4: Choose a workspace  

Now that you're signed in, select the dropdown arrow to find and **Select a workspace**.

:::image type="content" source="media/report-server-migration-tool/power-bi-report-server-select-workspace.png" alt-text="Screenshot showing selecting a workspace in the Power B I service.":::

## Step 5: View reports  

In the Power BI service, navigate to the workspace where you saved the reports.

:::image type="content" source="media/report-server-migration-tool/paginated-reports-power-bi-service.png" alt-text="Screenshot showing paginated reports in Power B I service.":::

## Limitations and considerations

### Supported and unsupported item types

You can only migrate .rdl reports from your Power BI Report Server servers to the Power BI service. Each migrated .rdl report becomes a Power BI paginated report.

You can't migrate the following item types to the Power BI service:

- Shared data sources
- Shared datasets
- Resources such as image files
- KPIs
- Mobile reports (discontinued)
- Report models (discontinued)
- Report parts (discontinued)

### Unsupported report features

Some paginated report features in Power BI Report Server aren't yet supported in the Power BI service. Paginated reports don't support the following items:

- Shared data sources
- Shared datasets
- Drillthrough and click-through to other reports
- Custom fonts

You get an error message if you try to upload a file that has an unsupported feature in the Power BI service.

## Next steps

Check these sources to keep up-to-date on new features in Power BI Report Server.

- [Microsoft Power BI blog](https://powerbi.microsoft.com/blog/)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
