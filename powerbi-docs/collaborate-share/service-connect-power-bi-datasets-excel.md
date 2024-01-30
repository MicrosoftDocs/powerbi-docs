---
title: Connect Excel to Power BI semantic models 
description: Power BI makes it easy for you to discover and connect to centralized and secure data from wherever you work, including Microsoft Excel and Microsoft Teams.
author: ajburnle
ms.author: ajburnle
ms.reviewer: ikedeagu
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 02/13/2023
LocalizationGroup: Share your work
---
# Connect Excel to Power BI semantic models

Microsoft Excel is arguably the most common data analysis tool for information workers and organizations across the globe. Part of Excel’s appeal is that you can start your data journey in a few clicks, with quick calculations, data visualizations, and ad-hoc analysis.

You can discover, connect to, and explore centralized Power BI data inside the spreadsheet grid of Microsoft Excel. The versatility of Excel and the unified governance and security standards of Power BI ensures you're using the right data to make better decisions that support business goals and fosters an enhanced data culture.

:::image type="content" source="media/service-connect-power-bi-datasets-excel/connected-excel-table.png" alt-text="Screenshot of Power BI semantic models in Excel." lightbox="media/service-connect-power-bi-datasets-excel/connected-excel-table.png":::

## Access Power BI semantic models in Excel 

When you access Power BI semantic models in Excel, the semantic models inherit properties. Inherited properties, like endorsement labels and sensitivity labels from Microsoft Purview Information Protection, help make sure that the data stays secure. Semantic models tagged with the labels Certified or Promoted are likely to be better quality and more authoritative than semantic models without a label.

Connect to Power BI semantic models in Excel by starting in the Power BI service or in Excel for the web or the Excel desktop app.  

- Start in Power BI with [Analyze in Excel](service-analyze-in-excel.md). 
- Start in [Excel for the web or the Excel desktop app](service-connect-excel-power-bi-datasets.md).
- After you've connected, you can [design refreshable reports with Power BI data](service-analyze-power-bi-datasets-excel.md) in an Excel PivotTable or a table.
- For Power BI admins, you can [monitor usage of Power BI semantic models in Excel](service-monitor-usage-power-bi-datasets-excel.md).

## Prerequisites

Here are things to keep in mind when you connect to Power BI semantic models in Excel:

- Your organization’s tenant administrator must enable the **Users can work with Power BI semantic models in Excel using a live connection** tenant setting. Learn more about the [Excel live connection](/fabric/admin/service-admin-portal-export-sharing#users-can-work-with-power-bi-datasets-in-excel-using-a-live-connection) tenant setting in the admin portal documentation.
- For on-premises datasets, your organization’s tenant administrator also must enable the **Allow XMLA endpoints and Analyze in Excel with on-premises datasets** tenant setting. Learn more about the [Allow XMLA endpoints](/fabric/admin/service-admin-portal-integration#allow-xmla-endpoints-and-analyze-in-excel-with-on-premises-datasets) tenant setting in the admin portal documentation.
- You must have **Build** permission to the Power BI semantic model or have at least a **Contributor** role in the Power BI workspace containing your semantic model.
- You must have a Fabric license: Fabric (free), Pro or Premium Per User (PPU). Fabric free license users can only work with datasets in My workspace or a Power BI Premium capacity or Fabric F64 or greater capacity. Learn more about [Power BI licenses](../fundamentals/service-features-license-type.md).
- You can use Excel workbooks containing refreshable Power BI data in both Excel Desktop and Excel for the web.

## Related content

- [Create Excel workbooks with refreshable Power BI data](service-analyze-in-excel.md)
- [Design refreshable reports in Excel with Power BI data](service-analyze-power-bi-datasets-excel.md)
- [Monitor usage of Power BI semantic models in Excel](service-monitor-usage-power-bi-datasets-excel.md)
- Read about [using Excel data types from Power BI](https://support.office.com/article/use-excel-data-types-from-power-bi-preview-cd8938ce-f963-444d-b82a-7140848241e9) in the Excel documentation.
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
