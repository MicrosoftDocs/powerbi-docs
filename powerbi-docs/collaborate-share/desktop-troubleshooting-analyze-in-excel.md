---
title: Troubleshoot connecting Excel to Power BI data
description: Solutions to common issues for analyzing Power BI data in Excel
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: troubleshooting
ms.date: 05/12/2022
LocalizationGroup: Troubleshooting
---

# Troubleshoot connecting Excel to Power BI data

There may be times when connecting Excel to Power BI data that you get an unexpected result, or the feature doesn't work as you expected. This page provides solutions for common issues when analyzing Power BI data in Excel.

> [!NOTE]
> There are separate pages that describe:
>
> - [Starting in Power BI with Analyze in Excel](service-analyze-in-excel.md).
> - [Starting in Excel to connect to Power BI data](service-connect-excel-power-bi-datasets.md).
>
> If you encounter a scenario that is not listed below, you can ask for assistance on the [Power BI community site](https://community.powerbi.com/), or create a [support ticket](https://powerbi.microsoft.com/support/).

This article contains the following troubleshooting sections.

Troubleshooting Power BI data in Excel, in general:

* [Forbidden](#forbidden-error) error
* [Unable to access on-premises Analysis services](#unable-to-access-on-premises-analysis-services)
* [Can't drag anything to the PivotTable Values area](#cant-drag-anything-to-the-pivottable-values-area-no-measures) (no measures)

Troubleshoot starting in Power BI with Analyze in Excel, specifically:

* [Connection cannot be made](#connection-cannot-be-made-error) error
* [No data models](#no-data-models)
* [Token expired](#token-expired-error) error


## Forbidden error
Some users have more than one Power BI account, and when Excel attempts to connect to Power BI using existing credentials, it may use credentials that do not have access to the dataset or report you want to access.

When this occurs, you may  receive an error titled **Forbidden**, which means you may be signed into Power BI with credentials that do not have permissions to the dataset. After encountering the **forbidden** error, when prompted to enter your credentials, use the credentials that have permission to access the dataset you're trying to use.

If you still run into errors, log into Power BI with the account that has permission, and verify that you can view and access the dataset in Power BI that you're attempting to access in Excel.

## Unable to access on-premises Analysis Services
If you're trying to access a dataset that has a live connection to SQL Server Analysis Services or Azure Analysis Services data, you may receive an error message. Connecting to Power BI datasets that are built on live connections to Analysis Services is not supported unless the user has read access to the data in Analysis Services in addition to the datasets permissions in Power BI.

## Can't drag anything to the PivotTable Values area (no measures)
When your Power BI dataset connects to an external OLAP model (which is how Excel connects to Power BI), the *PivotTable* requires **measures** to be defined in the external model, since all calculations are performed on the server. This is different from working with a local data source (such as tables in Excel, or working with datasets in **Power BI Desktop** or the **Power BI service**). In those cases, the tabular model is available locally, and [you can use implicit measures](https://support.microsoft.com/en-us/office/measures-in-power-pivot-86484821-a324-4da3-803b-82fd2e5033f4). Implicit measures are generated dynamically, and not stored in the data model. In these cases, the behavior in Excel is different from the behavior in **Power BI Desktop** or the **Power BI service**: there may be columns in the data that can be treated as measures in Power BI, but can't be used as values (measures) in Excel.

To address this issue, you have a few options:

1. Create [measures in your data model in **Power BI Desktop**](../transform-model/desktop-tutorial-create-measures.md), then publish the data model to the **Power BI service** and access that published dataset from Excel.
2. Create [measures in your data model from Excel PowerPivot](https://support.office.com/article/Create-a-Measure-in-Power-Pivot-d3cc1495-b4e5-48e7-ba98-163022a71198).
3. If you imported data from an Excel workbook that had only tables (and no data model), then you can [add the tables to the data model](https://support.office.com/article/Add-worksheet-data-to-a-Data-Model-using-a-linked-table-d3665fc3-99b0-479d-ba09-a37640f5be42), then follow the steps in option 2, directly above, to create measures in your data model.

Once your measures are defined in the model in the Power BI service, you'll be able to use them in the **Values** area in Excel PivotTables.

## Connection cannot be made error
The primary cause for a *connection cannot be made* error is that your computer's OLE DB provider client libraries are not current. For information about how to determine the correct update, and for download links, see **Update Excel libraries for the OLE DB provider** earlier in this article.

## No data models
If you encounter an error that states **Can't find OLAP cube model**, then the dataset you're trying to access has no data model, and therefore cannot be analyzed in Excel.

## Token expired error
If you receive a **token expired** error, it means you haven't recently used the **Analyze in Excel** feature on the computer you're using. Simply re-enter your credentials, or reopen the file, and the error should go away.

## Next steps
[Analyze in Excel](service-analyze-in-excel.md)

[Tutorial: Create your own measures in Power BI Desktop](../transform-model/desktop-tutorial-create-measures.md)

[Measures in PowerPivot](https://support.microsoft.com/en-us/office/measures-in-power-pivot-86484821-a324-4da3-803b-82fd2e5033f4)

[Create a Measure in PowerPivot](https://support.office.com/article/Create-a-Measure-in-Power-Pivot-d3cc1495-b4e5-48e7-ba98-163022a71198)

[Add worksheet data to a Data Model using a linked table](https://support.office.com/article/Add-worksheet-data-to-a-Data-Model-using-a-linked-table-d3665fc3-99b0-479d-ba09-a37640f5be42)
