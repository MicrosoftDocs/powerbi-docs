---
title: Troubleshooting Analyze in Excel in Power BI Desktop
description: Solutions to common issues for Analyze in Excel
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: troubleshooting
ms.date: 04/20/2021
LocalizationGroup: Troubleshooting
---

# Troubleshooting Analyze in Excel

There may be times when using Analyze in Excel that you get an unexpected result, or the feature doesn't work as you expected. This page provides solutions for common issues when using Analyze in Excel.

> [!NOTE]
> There's a separate page dedicated to describing and enabling [Analyze in Excel](service-analyze-in-excel.md).
> 
> If you encounter a scenario that is not listed below, and it is causing you issues, you can ask for further assistance on the [community site](https://community.powerbi.com/), or you can create a [support ticket](https://powerbi.microsoft.com/support/).
> 
> 

This article contains the following troubleshooting sections:

* Update Excel libraries for the OLE DB provider
* Determining whether you need to update your Excel libraries
* Connection cannot be made error
* Forbidden error
* No data models
* Token expired error
* Unable to access on-premises Analysis services
* Can't drag anything to the PivotTable Values area (no measures)

## Update Excel libraries for the OLE DB provider
To use **Analyze in Excel**, your computer must have a current AS OLE DB provider installed. This [community post](https://community.powerbi.com/t5/Service/Analyze-in-Excel-Initialization-of-the-data-source-failed/m-p/30837#M8081) is a great source to verify your installation of the OLE DB provider, or to download a recent version.

The Excel libraries need to match your version of Windows in terms of its bit-level. If you have 64-bit Windows installed, you need to install the 64-bit OLE DB provider.

To download the latest Excel libraries, visit Power BI and select the **down arrow** in the upper right corner of the Power BI service, then select **Analyze in Excel updates**.

![Screenshot of down arrow menu option in the upper right corner, to select Analyze in Excel updates.](media/desktop-troubleshooting-analyze-in-excel/tshoot-analyze-excel_1.png)

In the dialog that appears, select **Download**.

![Screenshot of Analyze in Excel updates dialog to select Download or preview button.](media/desktop-troubleshooting-analyze-in-excel/tshoot-analyze-excel_2.png)

## Determining whether you need to update your Excel libraries
You can download the most recent version of the Excel OLE DB provider libraries from the links in the previous section. Once you download the appropriate OLD DB provider library and begin installation, checks are performed against your current installed version.

If your Excel OLE DB provider client libraries are up to date, you'll be presented with a dialog that looks like the following:

![Screenshot of dialog asking to update if a newer version of Excel O L E D B provider client library is available.](media/desktop-troubleshooting-analyze-in-excel/troubleshoot-analyze-excel_3.png)

Alternatively, if the new version you are installing is newer than the version on your computer, the following dialog appears:

![Screenshot of dialog to confirm an upgrade during installation of Excel O L E D B provider client libraries.](media/desktop-troubleshooting-analyze-in-excel/troubleshoot-analyze-excel_2.png)

If you see the dialog prompting you to upgrade, you should continue with the installation to get the most recent version of the OLE DB provider installed in your computer.

## Connection cannot be made error
The primary cause for a *connection cannot be made* error is that your computer's OLE DB provider client libraries are not current. For information about how to determine the correct update, and for download links, see **Update Excel libraries for the OLE DB provider** earlier in this article.

## Forbidden error
Some users have more than one Power BI account, and when Excel attempts to connect to Power BI using existing credentials, it may use credentials that do not have access to the dataset or report you want to access.

When this occurs, you may  receive an error titled **Forbidden**, which means you may be signed into Power BI with credentials that do not have permissions to the dataset. After encountering the **forbidden** error, when prompted to enter your credentials, use the credentials that have permission to access the dataset you're trying to use.

If you still run into errors, log into Power BI with the account that has permission, and verify that you can view and access the dataset in Power BI that you're attempting to access in Excel.

## No data models
If you encounter an error that states **Can't find OLAP cube model**, then the dataset you're trying to access has no data model, and therefore cannot be analyzed in Excel.

## Token expired error
If you receive a **token expired** error, it means you haven't recently used the **Analyze in Excel** feature on the computer you're using. Simply re-enter your credentials, or reopen the file, and the error should go away.

## Unable to access on-premises Analysis Services
If you're trying to access a dataset that has connections to on-premises Analysis Services data, you may receive an error message. **Analyze in Excel** does support connecting to datasets and reports on on-premises **Analysis Services** with a connection string, as long as your computer is on the same domain as the **Analysis Services** server, and your account has access to that **Analysis Services** server.

## Can't drag anything to the PivotTable Values area (no measures)
When **Analyze in Excel** connects to an external OLAP model (which is how Excel connects to Power BI), the *PivotTable* requires **measures** to be defined in the external model, since all calculations are performed on the server. This is different than when you work with a local data source (such as tables in Excel, or when you're working with datasets in **Power BI Desktop** or the **Power BI service**), in which case the tabular model is available locally, and [you can use implicit measures](https://support.microsoft.com/en-us/office/measures-in-power-pivot-86484821-a324-4da3-803b-82fd2e5033f4), which are measures that are generated dynamically and are not stored in the data model. In these cases, the behavior in Excel is different from the behavior in **Power BI Desktop** or the **Power BI service**: there may be columns in the data that can be treated as measures in Power BI, but can't be used as values (measures) in Excel.

To address this issue, you have a few options:

1. Create [measures in your data model in **Power BI Desktop**](../transform-model/desktop-tutorial-create-measures.md), then publish the data model to the **Power BI service** and access that published dataset from Excel.
2. Create [measures in your data model from Excel PowerPivot](https://support.office.com/article/Create-a-Measure-in-Power-Pivot-d3cc1495-b4e5-48e7-ba98-163022a71198).
3. If you imported data from an Excel workbook that had only tables (and no data model), then you can [add the tables to the data model](https://support.office.com/article/Add-worksheet-data-to-a-Data-Model-using-a-linked-table-d3665fc3-99b0-479d-ba09-a37640f5be42), then follow the steps in option 2, directly above, to create measures in your data model.

Once your measures are defined in the model in the Power BI service, you'll be able to use them in the **Values** area in Excel PivotTables.

## Next steps
[Analyze in Excel](service-analyze-in-excel.md)

[Tutorial: Create your own measures in Power BI Desktop](../transform-model/desktop-tutorial-create-measures.md)

[Measures in PowerPivot](https://support.microsoft.com/en-us/office/measures-in-power-pivot-86484821-a324-4da3-803b-82fd2e5033f4)

[Create a Measure in PowerPivot](https://support.office.com/article/Create-a-Measure-in-Power-Pivot-d3cc1495-b4e5-48e7-ba98-163022a71198)

[Add worksheet data to a Data Model using a linked table](https://support.office.com/article/Add-worksheet-data-to-a-Data-Model-using-a-linked-table-d3665fc3-99b0-479d-ba09-a37640f5be42)
