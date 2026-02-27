---
title: Connect Excel to Power BI Semantic Models 
description: Power BI makes it easy for you to discover and connect to centralized and secure data from wherever you work, including Microsoft Excel and Microsoft Teams.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ikedeagu
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: concept-article
ms.date: 12/01/2025
ai-usage: ai-assisted
LocalizationGroup: Share your work
#customer intent: 
---
# Connect Excel to Power BI semantic models

Microsoft Excel is arguably the most common data analysis tool for information workers and organizations across the globe. Part of Excel’s appeal is that you can start your data journey in a few clicks, with quick calculations, data visualizations, and ad-hoc analysis.

You can discover, connect to, and explore centralized Power BI data inside the spreadsheet grid of Microsoft Excel. The versatility of Excel and the unified governance and security standards of Power BI ensures you're using the right data to make better decisions that support business goals and fosters an enhanced data culture.

:::image type="content" source="media/service-connect-power-bi-datasets-excel/connected-excel-table.png" alt-text="Screenshot of Power BI semantic models in Excel." lightbox="media/service-connect-power-bi-datasets-excel/connected-excel-table.png":::

## Access Power BI semantic models in Excel

When you access Power BI semantic models in Excel, the Excel file automatically inherits properties, like endorsement labels and sensitivity labels from Microsoft Purview Information Protection, to help make sure that the data stays secure. Semantic models tagged with the labels Certified or Promoted are likely to be better quality and more authoritative than semantic models without a label.

## Benefits of using Power BI semantic models in Excel

Using Power BI semantic models in Excel allows you to leverage the powerful data analysis capabilities of Excel while ensuring data governance and security provided by Power BI. This integration helps you make better decisions and supports business goals by using accurate and authoritative data.

## How to connect Excel to Power BI semantic models

You can connect to Power BI semantic models in Excel by starting in the Power BI service or in Excel for the web or the Excel desktop app. Here are the primary methods:

### Connect from the Power BI service

1. Open the Power BI service (app.powerbi.com) and navigate to the semantic model you want to connect to.
1. Select the **More options (...)** menu for the semantic model.
1. Select **Analyze in Excel**.
1. Power BI generates an Excel file with a live connection to the semantic model and downloads it to your computer.
1. Open the downloaded file in Excel to start analyzing your data.

### Connect from Excel

1. Open Excel (desktop or web).
1. Go to the **Data** tab and select **Get Data** > **From Power BI**.
1. Browse or search for the semantic model you want to connect to.
1. Select the semantic model and choose **Connect**.
1. Use PivotTables or tables to explore and analyze the data.

For detailed instructions, see the following resources:  

- Start in Power BI with [Analyze in Excel](service-analyze-in-excel.md).
- Start in [Excel for the web or the Excel desktop app](service-connect-excel-power-bi-datasets.md).
- After you connect, you can [design refreshable reports with Power BI data](service-analyze-power-bi-datasets-excel.md) in an Excel PivotTable or a table.
- For Power BI admins, you can [monitor usage of Power BI semantic models in Excel](service-monitor-usage-power-bi-datasets-excel.md).

## Connectivity improvements

Excel with Build number 16.0.18129.x or higher, using MSOLAP version 160.139.29 or higher, can connect to Power BI semantic models through the [XMLA endpoint](../enterprise/service-premium-connect-tools.md), by default. Older Excel versions connect by default through a legacy endpoint for Analyze in Excel (AIXL).

Even the most recent versions of Excel and Power BI Desktop in Live Connect mode might fall back to the legacy AIXL endpoint if Read access to your XMLA endpoint isn't enabled. Given the broad adoption of the XMLA endpoint, and its improved performance, functionality, and reliability in comparison to the AIXL endpoint, enable at least Read access to your XMLA endpoint and update to the latest Excel version for the following reasons:

- The XMLA endpoint provides better performance than the AIXL endpoint.
- The XMLA endpoint is more resilient than the AIXL endpoint. For example, long-running queries might fail with AIXL but are supported over XMLA.
- DAX Info functions are available over XMLA endpoint while AIXL doesn't support the DAX Info functions.

To check the Build number of your Excel version, click on File, select Account, and then click on the About Excel button. The About Excel dialog box displays version information together with the Build number above the licensing information, such as (Version 2506 Build 16.0.18925.20022).

## Prerequisites

Here are things to keep in mind when you connect to Power BI semantic models in Excel:

- Your organization’s tenant administrator must enable the **Users can work with Power BI semantic models in Excel using a live connection** tenant setting. Learn more about the [Excel live connection](/fabric/admin/service-admin-portal-export-sharing#users-can-work-with-power-bi-datasets-in-excel-using-a-live-connection) tenant setting in the admin portal documentation.
- For on-premises semantic models, your organization's tenant administrator also must enable the **Allow XMLA endpoints and Analyze in Excel with on-premises datasets** tenant setting. Learn more about the [Allow XMLA endpoints](/fabric/admin/service-admin-portal-integration#allow-xmla-endpoints-and-analyze-in-excel-with-on-premises-datasets) tenant setting in the admin portal documentation.
- You must have **Build** permission to the Power BI semantic model or have at least a **Contributor** role in the Power BI workspace containing your semantic model.
- When connecting through the XMLA endpoint to a composite Power BI semantic model that relies on other semantic models downstream, you must have **Build** permission or **Contributor** rights to all the semantic models. The AIXL endpoint, on the other hand, enforces **Build** permissions or **Contributor** rights only on the composite model.
- You must have a Power BI license to connect Excel to Power BI semantic models. Learn more about [Power BI licenses](../fundamentals/service-features-license-type.md).
- You can use Excel workbooks containing refreshable Power BI data in both Excel Desktop and Excel for the web.

## Related content

- [Create Excel workbooks with refreshable Power BI data](service-analyze-in-excel.md)
- [Design refreshable reports in Excel with Power BI data](service-analyze-power-bi-datasets-excel.md)
- [Monitor usage of Power BI semantic models in Excel](service-monitor-usage-power-bi-datasets-excel.md)
- Read about [using Excel data types from Power BI](https://support.microsoft.com/office/use-excel-data-types-from-power-bi-cd8938ce-f963-444d-b82a-7140848241e9) in the Excel documentation.
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
