---
title: Troubleshoot the connection from Excel to Power BI data 
description: Learn about troubleshooting problems that can occur when connecting Microsoft Excel to Power BI data.
author: ajburnle
ms.author: ajburnle
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: troubleshooting
ms.date: 12/01/2022
LocalizationGroup: Troubleshooting
---

# Troubleshoot the connection from Excel to Power BI data

There may be times when connecting Excel to Power BI data that you get an unexpected result, or the feature doesn't work as you expected. This page provides solutions for common issues when analyzing Power BI data in Excel.

> [!NOTE]
> There are separate articles for different connection types. Those articles are as follows:
>
> - [Start in Power BI with Analyze in Excel](service-analyze-in-excel.md).
> - [Start in Excel to connect to Power BI semantic models](service-connect-excel-power-bi-datasets.md).
>
> If you encounter a scenario that's not listed below, ask for assistance on the [Power BI community site](https://community.powerbi.com/), or create a [support ticket](https://powerbi.microsoft.com/support/).

If you need to troubleshoot an issue with Power BI data in Excel, see the following sections:

* [Forbidden error](#forbidden-error) 
* [Unable to access on-premises Analysis Services](#unable-to-access-on-premises-analysis-services)
* [Can't drag anything to the PivotTable Values area (no measures)](#cant-drag-anything-to-the-pivottable-values-area)

If you need to troubleshoot an issue in Power BI with Analyze in Excel, see the following sections:

* [Connection cannot be made error](#connection-cannot-be-made)
* [Can't find OLAP cube model error](#cant-find-olap-cube-model)
* [Token expired error](#token-expired-error)


## Forbidden error
A user may have more than one Power BI account. When Excel tries to connect to Power BI by using credentials from one of those accounts, it may attempt to use credentials that don't have access to the desired semantic model or report.

When this situation occurs, you may receive an error titled **Forbidden**. This error means you may be signed into Power BI with credentials that don't have permission to access the semantic model. After encountering the **Forbidden** error and when you see the prompt, type the credentials that have permission to access the semantic model you're trying to use.

If you still run into errors, log into Power BI with the account that has permission. Then, verify that you can view and access the semantic model in Power BI that you're attempting to access in Excel.

## Unable to access on-premises Analysis Services
If you're trying to access a semantic model that has a live connection to SQL Server Analysis Services or Azure Analysis Services data, you may receive an error message. This error may occur because a user can't connect to Power BI semantic models. This situation may happen when you build semantic models on live connections to Analysis Services unless the user has read access to the data in Analysis Services in addition to the semantic models permissions in Power BI.

## Can't drag anything to the PivotTable Values area
Excel connects to Power BI through an external OLAP model. When these applications connect, the *PivotTable* requires you to define **measures** in the external model because all calculations are performed on the server. This requirement is different from working with a local data source, such as tables in Excel and working with semantic models in **Power BI Desktop** or the **Power BI service**). In those cases, the tabular model is available locally, and [you can use implicit measures](https://support.microsoft.com/en-us/office/measures-in-power-pivot-86484821-a324-4da3-803b-82fd2e5033f4). Implicit measures are generated dynamically, and not stored in the data model. In these cases, the behavior in Excel is different from the behavior in **Power BI Desktop** or the **Power BI service**. For instance, there may be columns in the data that can be treated as measures in Power BI, but can't be used as measures, or values, in Excel.

To address this issue, you have a few options:

- [Create measures in your data model in **Power BI Desktop**](../transform-model/desktop-tutorial-create-measures.md). Then, publish the data model to the **Power BI service** and access that published semantic model from Excel.
- [Create measures in your data model from Excel PowerPivot](https://support.office.com/article/Create-a-Measure-in-Power-Pivot-d3cc1495-b4e5-48e7-ba98-163022a71198).
- If you imported data from an Excel workbook that had only tables and no data model, then you can [add the tables to the data model](https://support.office.com/article/Add-worksheet-data-to-a-Data-Model-using-a-linked-table-d3665fc3-99b0-479d-ba09-a37640f5be42). Then, follow the steps in the previous step to create measures in your data model.

Once you define your measures in the model in the Power BI service, you can use them in the **Values** area in Excel PivotTables.

## Connection cannot be made
The primary cause for a **Connection cannot be made** error is that your computer's OLE DB provider client libraries aren't current.

## Can't find OLAP cube model
The primary cause for a **Can't find OLAP cube model** error is that the semantic model you're trying to access has no data model, and therefore the semantic model can't be analyzed in Excel.

## Token expired error
The primary cause for a **Token expired** error is that you haven't recently used the **Analyze in Excel** feature on the computer you're using. To resolve this error, reenter your credentials or reopen the file, and the error should go away.

## Related content

- [Analyze in Excel](service-analyze-in-excel.md)

- [Tutorial: Create your own measures in Power BI Desktop](../transform-model/desktop-tutorial-create-measures.md)

- [Measures in PowerPivot](https://support.microsoft.com/en-us/office/measures-in-power-pivot-86484821-a324-4da3-803b-82fd2e5033f4)

- [Create a Measure in PowerPivot](https://support.office.com/article/Create-a-Measure-in-Power-Pivot-d3cc1495-b4e5-48e7-ba98-163022a71198)

- [Add worksheet data to a Data Model using a linked table](https://support.office.com/article/Add-worksheet-data-to-a-Data-Model-using-a-linked-table-d3665fc3-99b0-479d-ba09-a37640f5be42)
