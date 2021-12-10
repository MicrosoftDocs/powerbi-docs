---
title: Connect Excel to Power BI datasets 
description: Power BI makes it easy for you to discover and connect to centralized and secure data from wherever you work, including Microsoft Excel and Microsoft Teams.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ikedeagu
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 12/09/2021
LocalizationGroup: Share your work
---
# Connect Excel to Power BI datasets

Microsoft Excel is the most common data analysis tool for information workers and organizations across the globe. Part of Excel’s appeal is that you can start your data journey in a few clicks, with quick calculations, data visualizations, and ad-hoc analysis. 

In many organizations, data sits in multiple silos, including in Excel workbooks, across the enterprise. These silos make it hard for users to find the data they need, resulting in potential business losses.

You can discover and connect to centralized, secure data in Power BI from wherever you work, including in Microsoft Excel and Microsoft Teams. Excel and Power BI combine the versatility of Excel with the governance and security standards of Power BI. This pairing ensures that workers use the right data, securely. They can make better decisions to achieve business goals, and foster an enhanced data culture.

## Access Power BI datasets in Excel 

When you access Power BI datasets in Excel, the datasets inherit properties such as endorsement labels and Microsoft Information Protection labels, so the data stays secure. Datasets tagged with the labels Certified or Promoted are likely to be of better quality and more authoritative than datasets without a label.

You can connect to Power BI datasets in Excel by starting in the Power BI service or in Excel for the web or the Excel desktop app.  

- Start from Power BI with [Analyze in Excel](service-analyze-in-excel.md) 
- Start from [Excel for the web or the Excel desktop app](service-connect-excel-power-bi-datasets.md).
- After you've connected, you can [analyze your Power BI data](service-analyze-power-bi-datasets-excel.md) in an Excel PivotTable.

## Considerations

Here are the requirements for connecting to Power BI datasets in Excel:

* Analyzing Power BI data in Excel is supported for Microsoft Excel 2010 SP1 and later.
* Excel PivotTables don't support drag-and-drop aggregation of numeric fields. Your dataset in Power BI *must have pre-defined measures*. Read about [creating measures](../transform-model/desktop-measures.md).
* Analyzing Power BI data in Excel requires that the dataset be in a Power BI Premium workspace or that you have a Power BI Pro or Premium Per User (PPU) license. To learn more about the differences in functionality between license types, take a look at the _Power BI features comparison_ section of [Power BI pricing](https://powerbi.microsoft.com/pricing/).
* You can connect to Power BI datasets in Excel if you have permission for the underlying dataset. You could have this permission in a few ways. You could have the Member role in the workspace containing the dataset, or have Build permission for a dataset in a workspace, or in an app that contains the dataset. Read more about [Build permission](../connect-data/service-datasets-build-permissions.md) for Power BI datasets.
* Guest users can't analyze Power BI data in Excel for datasets sent from (originating from) another tenant. 
* Analyzing Power BI data in Excel is a Power BI service feature. You can't analyze Power BI data in Excel from Power BI Report Server or Power BI Embedded.
* You can only analyze Power BI data in Excel on computers running Microsoft Windows.

## Next steps

- [Start in Power BI to analyze in Excel](service-analyze-in-excel.md)
- [Analyze Power BI datasets in Excel](service-analyze-power-bi-datasets-excel.md)
- Read about [using Excel data types from Power BI](https://support.office.com/article/use-excel-data-types-from-power-bi-preview-cd8938ce-f963-444d-b82a-7140848241e9) in the Excel documentation.
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
