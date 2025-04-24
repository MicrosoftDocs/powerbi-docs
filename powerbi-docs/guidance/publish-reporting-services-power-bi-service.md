---
title: "Publish .rdl files to Power BI from Power BI Report Server and Reporting Services"
description: "This article provides step-by-step instructions for migrating .rdl files, or *paginated reports*, from SQL Server Reporting Services to the Power BI service."
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: cookiemccray
ms.date: 04/11/2023
ms.custom:
---

# Publish .rdl files to Power BI from Power BI Report Server and Reporting Services

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)] :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::&nbsp;Power&nbsp;BI&nbsp;2022&nbsp;Report&nbsp;Server :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::&nbsp;SQL&nbsp;Server&nbsp;2022&nbsp;Reporting&nbsp;Services

Do you have Report Definition Language (.rdl) paginated reports in Power BI Report Server or SQL Server 2022 Reporting Services (SSRS) that you want to migrate to the Power BI service? This article provides step-by-step instructions for migrating .rdl files *and Power BI reports (.pbix files)* from Power BI Report Server and SQL Server 2022 Reporting Services to the Power BI service.

:::image type="content" source="media/publish-reporting-services-power-bi-service/report-server-publish-migrate.png" alt-text="Screenshot showing Power BI Report Server Migration option.":::

> [!NOTE]
> If you're using a previous version of Reporting Services, continue to use the [RDL Migration Tool](https://github.com/microsoft/RdlMigration) for now.

You can migrate reports without downtime to your report servers or disruption to your report users. It's important to understand that you don't need to remove any data or reports. You can keep your current environment in place until you're ready for it to be retired.

## Prerequisites

### Personal workspace

You can publish and share paginated reports to your My Workspace with a Fabric free license.

### Other workspaces

To publish to other workspaces, you need to meet these prerequisites:

- You have a Power BI Pro or Premium Per User license.
- You have write access to the workspace.

Read more about [Power BI licenses](../consumer/end-user-license.md).

## Supported versions

You can migrate reports from SSRS instances running on-premises or on virtual machines hosted by cloud providers like Azure.

This publishing tool is designed to help customers migrate SSRS paginated reports (.rdl files) from their local servers to a Power BI workspace in their tenant. As part of the migration process, the tool also:

- Checks for unsupported data sources or report components when uploading to Power BI.
- Saves the converted files that pass these checks to a Power BI workspace that you specify.
- Provides a summary of the successful and unsuccessful assets migrated.

You can only migrate .rdl reports from your SSRS servers to Power BI. Each migrated .rdl report becomes a Power BI paginated report.

You can publish individual .rdl reports or the contents of entire folders from the SSRS web portal to the Power BI service. Read on to learn how to publish .rdl reports to Power BI.

## Step 1: Browse to reports

# [SQL Server Reporting Services](#tab/reporting-services)

Select **Publish** to find the .rdl files you want to publish from SSRS to the Power BI service.

:::image type="content" source="media/publish-reporting-services-power-bi-service/rdl-select-publish.png" alt-text="Screenshot showing Publish.":::

- Select **Publish all reports** to select all the .rdl files in the current folder and start the migration. 
- Select **Select reports to publish** to open a list view of all .rdl files in the current folder. Select the reports and folders you want to migrate.

# [Power BI Report Server](#tab/powerbi-report-server)

Select **Publish** to find the .rdl files you want to publish from Power BI Report Server to the Power BI service.

:::image type="content" source="media/publish-reporting-services-power-bi-service/report-server-publish-migrate.png" alt-text="Screenshot showing Migrate options in the report server.":::

- Select **Publish all reports** to select all the .rdl files in the current folder and start the migration.
- Select **Select reports to publish** to open a list view of all .rdl files in the current folder. You select which of the reports and folders you want to migrate.

---

You can also publish individual articles.

- On the **More info** menu next to an .rdl report, select **Publish**.

    :::image type="content" source="media/publish-reporting-services-power-bi-service/power-bi-report-server-individual-publish.png" alt-text="Screenshot showing More options to Publish.":::

## Step 1b: Select reports

Items that you can migrate now:

- The .rdl files
- Linked reports (.rdl files)
- Folders (all .rdl reports from the folder are migrated)

# [SQL Server Reporting Services](#tab/reporting-services)

If you chose **Select reports to publish**, the next step is to **Select reports to publish to Power BI**.

:::image type="content" source="media/publish-reporting-services-power-bi-service/rdl-select-reports-publish.png" alt-text="Screenshot showing Select reports to publish to Power BI.":::

# [Power BI Report Server](#tab/powerbi-report-server)

If you chose **Select reports to publish**, the next step is to **Select reports to publish to Power BI**.

:::image type="content" source="media/publish-reporting-services-power-bi-service/power-bi-report-server-select-reports.png" alt-text="Screenshot showing selecting reports to publish.":::

---

## Step 2: Sign in/Sign up

# [SQL Server Reporting Services](#tab/reporting-services)

After you've selected the reports you want to publish, it's time to **Sign in** to the Power BI service.

:::image type="content" source="media/publish-reporting-services-power-bi-service/rdl-sign-in-power-bi.png" alt-text="Screenshot showing Sign in to Power BI.":::

# [Power BI Report Server](#tab/powerbi-report-server)

After you've selected the reports you want to publish, it's time to **Sign in** to the Power BI service.

:::image type="content" source="media/publish-reporting-services-power-bi-service/power-bi-report-server-sign-in.png" alt-text="Screenshot showing signing in to the Power B I service.":::

---

## Step 3: Choose a workspace

# [SQL Server Reporting Services](#tab/reporting-services)

Now that you're signed in, select the dropdown arrow to find and **Select a workspace**.

:::image type="content" source="media/publish-reporting-services-power-bi-service/rdl-select-workspace.png" alt-text="Screenshot showing selecting a workspace.":::

# [Power BI Report Server](#tab/powerbi-report-server)

Now that you're signed in, select the dropdown arrow to find and **Select a workspace**.

:::image type="content" source="media/publish-reporting-services-power-bi-service/power-bi-report-server-select-workspace.png" alt-text="Screenshot showing selecting a workspace in the Power B I service.":::

---

## Step 4: View reports

In the Power BI service, navigate to the workspace where you saved the reports.

:::image type="content" source="media/publish-reporting-services-power-bi-service/paginated-reports-power-bi-service.png" alt-text="Screenshot showing paginated reports in Power B I service.":::

Select a report to view it in the Power BI service.

## Site properties

If you'd like to disable the migration setting, you need to update your report server. For more information on server properties, see the article [Server Properties Advanced Page - Power BI Report Server & Reporting Services](/sql/reporting-services/tools/server-properties-advanced-page-reporting-services):

- EnablePowerBIReportMigrate
- PowerBIMigrateCountLimit
- PowerBIMigrateUrl

For sovereign clouds, you can update the Power BI endpoints by changing the site settings in the web portal.  

## Limitations and considerations

You can migrate .rdl reports from your report servers to the Power BI service. Each migrated .rdl report becomes a Power BI paginated report.

### Converted report features

Shared data sources and datasets aren't yet supported in the Power BI service. When you migrate .rdl reports, the [RDL Migration Tool](https://github.com/microsoft/RdlMigration) automatically converts shared datasets and data sources to embedded datasets and data sources, provided they're using supported datasets and data sources.

### Unsupported item types

You can't migrate the following item types to the Power BI service:

- Resources such as image files
- KPIs
- Mobile reports (discontinued)
- Report models (discontinued)
- Report parts (discontinued)

### Unsupported report features

See [What paginated report features in SSRS aren't yet supported in Power BI?](../paginated-reports/paginated-reports-faq.yml#what-paginated-report-features-in-ssrs-aren-t-yet-supported-in-power-bi-) in the Paginated reports in Power BI FAQ for a complete list of unsupported report features.

## Related content

More questions? [Try asking the Reporting Services forum](/answers/search.html?c=&f=&includeChildren=&q=ssrs+OR+reporting+services&redirect=search%2fsearch&sort=relevance&type=question+OR+idea+OR+kbentry+OR+answer+OR+topic+OR+user)
