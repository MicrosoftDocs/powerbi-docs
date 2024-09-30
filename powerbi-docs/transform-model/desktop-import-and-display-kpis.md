---
title: Import and display KPIs in Power BI
description: Learn how to import KPIs from an excel workbook and display them in Power BI Desktop to highlight trends, progress, or other important indicators.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 09/30/2024
LocalizationGroup: Model your data
ms.custom: FY25Q1-Linter
#customer intent: As a Power BI user I want to learn how to import KPIs from an Excel workbook.
---

# Import and display KPIs in Power BI

With **Power BI Desktop**, you can import and display KPIs in tables, matrices, and cards.

To import and display KPIs:

1. Start with an Excel workbook that has a Power Pivot model and KPIs.

1. Import the Excel workbook into Power BI, by using **File -> Import ->  Power Query, Power Pivot, Power View**. You can also [learn how to import workbooks](../connect-data/desktop-import-excel-workbooks.md).

1. After import into Power BI, your KPI will appear in the **Fields** pane, marked with the ![traffic light](media/desktop-import-and-display-kpis/traffic.png) icon. To use a KPI in your report, be sure to expand its contents, exposing the **Value**, **Goal**, and **Status** fields.

    :::image type="content" source="media/desktop-import-and-display-kpis/desktoppreviewfeatureon2.png" alt-text="Screenshot of Power BI Desktop showing Delta KPI expanded in Fields pane.":::

1. Imported KPIs are best used in standard visualization types, such as the **Table** type. Power BI also includes the **KPI** visualization type, which should only be used to create new KPIs.

    :::image type="content" source="media/desktop-import-and-display-kpis/desktoppreviewfeatureon3.png" alt-text="Screenshot of Power BI Desktop showing Table1 fields selected in Field pane.":::

You can use KPIs to highlight trends, progress, or other important indicators.
