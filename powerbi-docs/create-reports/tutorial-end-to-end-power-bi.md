---
title: "End-to-end: From raw data to a shared Power BI app"
description: Follow a full end-to-end scenario in Power BI - from raw source data through transforming, modeling, building a report, and sharing it as an app.
author: julcsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: tutorial
ms.date: 07/14/2026
LocalizationGroup: Create reports
ms.custom: references_regions
ai-usage: ai-assisted
#customer intent: As a Power BI report creator, I want to follow a single end-to-end scenario that spans ingestion, modeling, report building, and distribution so that I understand the full journey and the role each tool plays.
---

# End-to-end: From raw data to a shared Power BI app

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In this tutorial, you walk through the complete report creation journey in Power BI - from raw data sitting in storage, through a reusable semantic model, to a polished report that you publish, package as an app, and hand off to a business audience. Each phase calls out which tool you use and why, so you understand how Power BI Desktop and the Power BI service fit together.

You play the role of a sales analyst at Adventure Works Cycles. Your sales leadership team needs a trusted weekly view of revenue, profitability, and reseller performance. Today the data lives in a spreadsheet that someone emails around. By the end of this scenario, the same numbers come from a governed semantic model, surface in a published report, and reach the leadership team through an app they can open from anywhere.

## What you build in this end-to-end Power BI tutorial

By the end of this scenario, you have a working Power BI solution with the following flow:

:::image type="complex" source="media/tutorial-end-to-end-power-bi/end-to-end-flow.svg" lightbox="media/tutorial-end-to-end-power-bi/end-to-end-flow.svg" alt-text="End-to-end Power BI flow from raw data to a shared app.":::
   The diagram shows a linear flow: Raw data in storage feeds Power BI Desktop, which loads, transforms, models, and designs the data into a semantic model. The semantic model is the reusable layer that a Power BI report is built on. The report is published to a Power BI service workspace, packaged as an app, and opened by business consumers. The same semantic model is also reused by other reports, paginated reports, Excel analyses, and AI experiences such as Copilot in Power BI and the Power BI MCP servers - so each one builds on the same model without reimplementing the data logic.
:::image-end:::

In this tutorial, you:

> [!div class="checklist"]
>
> - Load your source data into Power BI Desktop using Power Query.
> - Transform the data with Power Query in Power BI Desktop.
> - Build a semantic model designed for reuse.
> - Create a report that answers your leadership team's questions.
> - Publish the report to a workspace in the Power BI service.
> - Package and distribute the content as an app.
> - Optionally, layer in AI-assisted authoring with Copilot or the Power BI MCP server.

Plan for about an hour if you're comfortable in Power BI Desktop, or slightly longer if you're newer to it.

## Prerequisites

- [Power BI Desktop](../fundamentals/desktop-get-the-desktop.md) installed on your computer. Use the May 2026 release or later. UI labels in this tutorial reflect the Power BI Desktop and Power BI service experiences current as of this article's publication date.
- A Power BI account. If you don't have one, [sign up for a free trial](../fundamentals/service-self-service-signup-for-power-bi.md).

### License and role requirements

Different phases of this tutorial need different licenses and workspace roles. Make sure you have what you need before you start:

- **Power BI Desktop (Phases 1–4)**: No license required.
- **Publishing reports and creating workspaces (Phase 5)**: A Power BI **Pro** license. To publish into an existing workspace, you need at least the **Contributor** role. To create a new workspace, you need workspace-creation rights from your admin.
- **Publishing and distributing apps (Phase 6)**: A Power BI **Pro** license, and at least the **Member** role in the workspace.
- **App consumers**: For apps in a workspace assigned to a **Fabric capacity of F64 or larger**, a **Free** Power BI license with the Viewer role is sufficient. For apps in a workspace on a smaller capacity (F2 through F32) or no capacity, consumers need a **Pro** or **Premium Per User (PPU)** license.

### Tenant admin settings to check

Some steps depend on tenant-level settings that only a Power BI or Fabric admin can change. Confirm with your admin (or check yourself in the [admin portal](../admin/service-admin-portal.md)) that the following settings are enabled before you start:

- **Map and filled map visuals** - required for the map visual in [Phase 4](#phase-4-build-the-power-bi-report-in-report-view).
- **Create workspaces** - required to create the workspace in [Phase 5](#phase-5-publish-the-report-to-the-power-bi-service).
- **Copilot in Fabric** and **Users can interact with Copilot** - required for the optional Copilot and MCP scenarios.

## Start state and end state

| Dimension | Today | After this scenario |
| --- | --- | --- |
| **Where data lives** | A spreadsheet on someone's laptop | A governed storage location refreshed on a schedule |
| **Who can recreate the numbers** | One analyst with the file | Anyone with access to the semantic model |
| **How leadership sees it** | Static PDF or email | Interactive report inside a branded app |
| **How AI fits in** | Not used | Copilot and MCP-based agents read from the same semantic model |

## Where your Power BI data lives in production solutions

In a real Power BI solution, your raw data typically lives in one of these places:

- A **file** (Excel, CSV, JSON) in OneDrive, SharePoint, or local storage.
- A **database** such as SQL Server, Azure SQL, or PostgreSQL.
- A **Fabric Lakehouse** or **data warehouse** for governed, refreshable analytics storage.
- A **software-as-a-service connector** such as Dynamics 365, Salesforce, or Google Analytics.

Power BI Desktop connects to all of these through **Power Query**. For an overview of the available connectors, see [Data sources in Power BI Desktop](../connect-data/desktop-data-sources.md). For production solutions, a [Fabric Lakehouse](/fabric/data-engineering/lakehouse-overview) gives you a single, governed storage layer that any Fabric workload - including Power BI - can read from.

This tutorial demonstrates an **import** scenario where data is loaded into Power BI's columnar storage. For other storage modes, use **Direct Lake** when your data lives in OneLake in a Fabric Lakehouse or data warehouse (Power BI reads directly from the lake without importing), or use **DirectQuery** for SQL Server, Azure SQL, or Kusto (KQL) databases when you need real-time data or datasets too large to import. To learn more about storage modes, see [Dataset modes in the Power BI service](../connect-data/service-dataset-modes-understand.md).

To keep this tutorial self-contained - independent of files, databases, and other external sources - you create the source tables directly in Power Query by pasting [Power Query M](/powerquery-m/) code into blank queries. Treat each Power Query query as if it could come from any of these data sources - from one or more source tables - with each query resulting in a single table in your semantic model. Power Query M queries commonly combine multiple source tables, which is typical in Power BI. Many relational databases use normalized schemas (row storage, minimal duplication), but Power BI uses columnar storage where duplicate values in a column compress efficiently and perform well, so flattening or denormalizing data during the Power Query step is a common practice. The transformation, modeling, reporting, and distribution phases that follow work the same way regardless of where the data actually comes from.

## Fast path: build Phases 1-3 with a TMDL script

If you want the finished semantic model in seconds - source queries, relationships, hidden columns, measures, a date hierarchy, and format strings - paste the TMDL script below into a blank Power BI Desktop report. Otherwise, skip this section and follow the phase-by-phase steps starting at [Phase 1](#phase-1-get-your-data-with-power-query-in-power-bi-desktop) to see how each piece is built by hand.

To use the script:

1. Open Power BI Desktop and create a new blank report.
1. Select the **Model** tab on the ribbon, then select **TMDL view**.
1. Paste the entire script below into the TMDL editor.
1. Select **Apply**.

Power BI Desktop materializes the semantic model - identical to what you'd get from Phases 1-3 by hand. When it finishes, continue at [Phase 4](#phase-4-build-the-power-bi-report-in-report-view) to build the report.

> [!TIP]
> TMDL is especially useful when working with the [Power BI Modeling MCP Server](../developer/mcp/mcp-servers-overview.md), which lets AI agents read and modify semantic models using TMDL. For more on TMDL and Power BI project formats, see [Power BI Project (PBIP) and Power BI Report (PBIR) file formats](/power-bi/developer/projects/projects-report).

```tmdl
createOrReplace

  model Model
    culture: en-US
    defaultPowerBIDataSourceVersion: powerBI_V3
    sourceQueryCulture: en-US
    valueFilterBehavior: independent
    dataAccessOptions
      legacyRedirects
      returnErrorValuesAsNull

    table Customer
      lineageTag: cd32114b-60f3-4be7-9f5c-611bae329a82

      column 'Customer Key'
        dataType: int64
        isHidden
        formatString: 0
        lineageTag: 6da29b0f-e4cc-4d00-8928-3e9fbac3f1b5
        summarizeBy: none
        sourceColumn: Customer Key

        changedProperty = IsHidden

        annotation SummarizationSetBy = Automatic

      column 'Customer Name'
        dataType: string
        lineageTag: f16a6d83-2323-499b-a9d0-03dbdf1b8765
        summarizeBy: none
        sourceColumn: Customer Name

        annotation SummarizationSetBy = Automatic

      column Country
        dataType: string
        lineageTag: aa892521-9a91-485c-b3d8-22aa1b7b6a56
        dataCategory: Country
        summarizeBy: none
        sourceColumn: Country

        annotation SummarizationSetBy = Automatic

      partition Customer = m
        mode: import
        source =
            let
                Source = #table(
                    type table [CustomerKey = Int64.Type, CustomerName = text, Country = text],
                    {
                        {1, "Contoso Ltd",           "United States"},
                        {2, "Fabrikam Inc",          "United States"},
                        {3, "Tailwind Traders",      "United States"},
                        {4, "Wide World Importers",  "Canada"},
                        {5, "Lakeshore Retail",      "Canada"},
                        {6, "Tailspin Toys",  "United Kingdom"},
                        {7, "Wingtip Toys",   "United Kingdom"},
                        {8, "Zava Inc",         "Australia"}
                    }
                ),
                #"Fix column names" = Table.TransformColumnNames(
             Source,
             each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
            )
            in
                #"Fix column names"

      annotation PBI_NavigationStepName = Navigation

      annotation PBI_ResultType = Table

    table Product
      lineageTag: da967a69-a04a-47a8-bb45-eef9ec4141b3

      column 'Product Key'
        dataType: int64
        isHidden
        formatString: 0
        lineageTag: 47a00131-d83e-458e-91da-b2c96f01e232
        summarizeBy: none
        sourceColumn: Product Key

        changedProperty = IsHidden

        annotation SummarizationSetBy = Automatic

      column 'Product Name'
        dataType: string
        lineageTag: 448c1e2d-9613-4f07-8d66-7df4bf3a6026
        summarizeBy: none
        sourceColumn: Product Name

        annotation SummarizationSetBy = Automatic

      column Category
        dataType: string
        lineageTag: 69148163-bb37-4132-8a30-e5393783303b
        summarizeBy: none
        sourceColumn: Category

        annotation SummarizationSetBy = Automatic

      partition Product = m
        mode: import
        source =
            let
                Source = #table(
                    type table [ProductKey = Int64.Type, ProductName = text, Category = text],
                    {
                        {1, "Mountain-200 Bike",  "Bikes"},
                        {2, "Road-150 Bike",      "Bikes"},
                        {3, "Touring-1000 Bike",  "Bikes"},
                        {4, "HL Mountain Frame",  "Components"},
                        {5, "Brake Set",          "Components"},
                        {6, "Cycling Jersey",     "Clothing"},
                        {7, "Cycling Gloves",     "Clothing"},
                        {8, "Water Bottle",       "Accessories"}
                    }
                ),
                #"Lowercased Text" = Table.TransformColumnNames(
             Source,
             each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
            ),
                #"Fix column names" = Table.TransformColumnNames(
             Source,
             each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
            )
            in
                #"Fix column names"

      annotation PBI_NavigationStepName = Navigation

      annotation PBI_ResultType = Table

    table Reseller
      lineageTag: 9d40caab-3349-4d6f-a154-c986c8501426

      column 'Reseller Key'
        dataType: int64
        isHidden
        formatString: 0
        lineageTag: ca8c940b-1ae4-4c40-86c0-b64ee1da1614
        summarizeBy: none
        sourceColumn: Reseller Key

        changedProperty = IsHidden

        annotation SummarizationSetBy = Automatic

      column 'Reseller Name'
        dataType: string
        lineageTag: a663505a-145b-4759-846e-a689ad714611
        summarizeBy: none
        sourceColumn: Reseller Name

        annotation SummarizationSetBy = Automatic

      column 'Business Type'
        dataType: string
        lineageTag: 39d0a2f7-1c03-4744-8cd6-356a98713bc0
        summarizeBy: none
        sourceColumn: Business Type

        annotation SummarizationSetBy = Automatic

      partition Reseller = m
        mode: import
        source =
            let
                Source = #table(
                    type table [ResellerKey = Int64.Type, ResellerName = text, #"Business Type" = text],
                    {
                        {1, "Northwind Traders",      "Specialty Bike Shop"},
                        {2, "Wingtip Toys",           "Specialty Bike Shop"},
                        {3, "VanArsdel Ltd",              "Value Added Reseller"},
                        {4, "Proseware Inc",          "Value Added Reseller"},
                        {5, "Consolidated Messenger", "Warehouse"},
                        {6, "Adatum Corporation",   "Warehouse"}
                    }
                ),
                #"Calculated Text Length" = Table.TransformColumnNames(
             Source,
             each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
            ),
                #"Fix column names" = Table.TransformColumnNames(
             Source,
             each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
            )
            in
                #"Fix column names"

      annotation PBI_NavigationStepName = Navigation

      annotation PBI_ResultType = Table

    table SalesTerritory
      lineageTag: 1d0b1532-dbda-43e3-a22b-da4250b76715

      column 'Sales Territory Key'
        dataType: int64
        isHidden
        formatString: 0
        lineageTag: 43452ce0-072c-4a1a-8b89-09cfd23ec56a
        summarizeBy: none
        sourceColumn: Sales Territory Key

        changedProperty = IsHidden

        annotation SummarizationSetBy = Automatic

      column Country
        dataType: string
        lineageTag: efc3bd17-c6b5-4fbd-9c9d-0603a63a3ac0
        dataCategory: Country
        summarizeBy: none
        sourceColumn: Country

        annotation SummarizationSetBy = Automatic

      column Region
        dataType: string
        lineageTag: 9092dc1d-df49-40a5-a1e7-63d6fd8bd52f
        summarizeBy: none
        sourceColumn: Region

        annotation SummarizationSetBy = Automatic

      column Group
        dataType: string
        lineageTag: c8ef5671-4a9b-4af7-b4f5-c2b0b117e39c
        summarizeBy: none
        sourceColumn: Group

        annotation SummarizationSetBy = Automatic

      partition SalesTerritory = m
        mode: import
        source =
            let
                Source = #table(
                    type table [SalesTerritoryKey = Int64.Type, Country = text, Region = text, Group = text],
                    {
                        {1, "United States",  "Northwest",      "North America"},
                        {2, "United States",  "Southwest",      "North America"},
                        {3, "Canada",         "Canada",         "North America"},
                        {4, "United Kingdom", "United Kingdom", "Europe"},
                        {5, "Australia",      "Australia",      "Pacific"}
                    }
                ),
                #"Lowercased Text" = Table.TransformColumnNames(
             Source,
             each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
            ),
                #"Fix column names" = Table.TransformColumnNames(
             Source,
             each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
            )
            in
                #"Fix column names"

      annotation PBI_NavigationStepName = Navigation

      annotation PBI_ResultType = Table

    table Date
      lineageTag: 8d115245-8cea-4f85-8531-09cccc169eb8
      dataCategory: Time

      column Date
        dataType: dateTime
        isKey
        formatString: yyyy-mm-dd
        lineageTag: 7e02b692-0cb3-42a8-ba2e-fd4cac3fee1a
        summarizeBy: none
        sourceColumn: Date

        annotation SummarizationSetBy = Automatic

        annotation UnderlyingDateTimeDataType = Date

        annotation PBI_FormatHint = {"isDateTimeCustom":true}

      column Year
        dataType: int64
        formatString: 0
        lineageTag: b22e7b75-cc4e-4984-b160-b72c0fd4471d
        summarizeBy: none
        sourceColumn: Year

        annotation SummarizationSetBy = User

      column 'Month Number'
        dataType: int64
        isHidden
        formatString: 0
        lineageTag: 2db8eec9-04a6-43df-829e-52996072bc72
        summarizeBy: none
        sourceColumn: Month Number

        changedProperty = IsHidden

        annotation SummarizationSetBy = Automatic

      column Month
        dataType: string
        lineageTag: 61fd3209-6516-4208-818e-5ba57334bc33
        summarizeBy: none
        sourceColumn: Month
        sortByColumn: 'Month Number'

        changedProperty = SortByColumn

        annotation SummarizationSetBy = Automatic

      column Monthly
        dataType: dateTime
        formatString: mmm, yyyy
        lineageTag: d6622bf4-d01a-4736-8981-661ee1cf26d5
        summarizeBy: none
        sourceColumn: Monthly

        annotation SummarizationSetBy = Automatic

        annotation UnderlyingDateTimeDataType = Date

        annotation PBI_FormatHint = {"isCustom":true}

      column Quarter
        dataType: string
        lineageTag: 7fd4d215-7835-4bb7-873b-21d44b65c8b7
        summarizeBy: none
        sourceColumn: Quarter

        annotation SummarizationSetBy = Automatic

      hierarchy 'Date Hierarchy'
        lineageTag: d7593e08-07d6-43a3-aeb5-88607330cb35

        level Year
          lineageTag: d9b70a87-a590-4dc7-a814-dbefd9806acc
          column: Year

        level Quarter
          lineageTag: 4eca70a9-2eeb-4d3a-bc77-fd85272875c5
          column: Quarter

        level Month
          lineageTag: 0ccfa4eb-b3e3-46ec-ad7e-ba59e4b6e57d
          column: Month

        level Date
          lineageTag: 36a677d7-1730-4fd5-afe1-26aaffc8f9ed
          column: Date

      partition Date = m
        mode: import
        source =
            let
             CurrentYear = Date.Year(DateTime.LocalNow()),
             LastYear = CurrentYear - 1,
             StartDate = #date(LastYear, 1, 1),
             EndDate = #date(CurrentYear, 12, 31),
             DayCount = Duration.Days(EndDate - StartDate) + 1,
             DateList = List.Dates(StartDate, DayCount, #duration(1, 0, 0, 0)),
             Source = Table.FromList(DateList, Splitter.SplitByNothing(), {"Date"}),
             TypedDate = Table.TransformColumnTypes(Source, {{"Date", type date}}),
             AddYear = Table.AddColumn(TypedDate, "Year", each Date.Year([Date]), Int64.Type),
             AddMonthNumber = Table.AddColumn(AddYear, "MonthNumber", each Date.Month([Date]), Int64.Type),
             AddMonth = Table.AddColumn(AddMonthNumber, "Month", each Date.MonthName([Date]), type text),
             AddMonthly = Table.AddColumn(AddMonth, "Monthly", each Date.StartOfMonth([Date]), type date),
             #"Fix column names" = Table.TransformColumnNames(
             AddMonthly,
             each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
            ),
                #"Added Custom" = Table.AddColumn(#"Fix column names", "Quarter", each "Q" & Number.ToText(Date.QuarterOfYear([Date])))
            in
                #"Added Custom"

      annotation PBI_NavigationStepName = Navigation

      annotation PBI_ResultType = Table

    table Sales
      lineageTag: 2a2513c4-1c06-43a7-9410-3d0870d3b58b

      /// Calculates the total sales amount by summing the 'Sales'[Sales Amount] column.
      measure 'Total Sales' = ```

              SUM ( 'Sales'[Sales Amount] )
          ```
        formatString: \$#,0;(\$#,0);\$#,0
        lineageTag: 48fa767c-ee30-442f-bc9f-ae6c62436278

        annotation PBI_FormatHint = {"currencyCulture":"en-US"}

      /// Sums the Total Product Cost column in the Sales table to return the overall total cost of sales.
      measure 'Total Cost' = ```

              SUM ( 'Sales'[Total Product Cost] )
          ```
        formatString: \$#,0;(\$#,0);\$#,0
        lineageTag: c5d42c85-1bbf-4f25-b147-ae59cb930969

        annotation PBI_FormatHint = {"currencyCulture":"en-US"}

      /// Calculates profit as the difference between Total Sales and Total Cost.
      measure Profit = ```

              [Total Sales] - [Total Cost]
          ```
        formatString: \$#,0;(\$#,0);\$#,0
        lineageTag: c6c0f749-28ad-4a61-84d4-3e55d1c55f0d

        annotation PBI_FormatHint = {"currencyCulture":"en-US"}

      /// Calculates the profit margin by dividing Profit by Total Sales.
      measure 'Profit Margin' = ```

              DIVIDE ( [Profit], [Total Sales] )
          ```
        formatString: 0%;-0%;0%
        lineageTag: adb2a370-f82f-4dc8-87ab-e5fc0d20e13f

      column 'Order Date'
        dataType: dateTime
        isHidden
        formatString: Long Date
        lineageTag: b45885c8-ab42-4773-9085-caa7f9d44bd5
        summarizeBy: none
        sourceColumn: Order Date

        changedProperty = IsHidden

        annotation SummarizationSetBy = Automatic

        annotation UnderlyingDateTimeDataType = Date

      column 'Customer Key'
        dataType: int64
        isHidden
        formatString: 0
        lineageTag: 19eb48cd-ded1-46b8-9b38-38656edfbad3
        summarizeBy: none
        sourceColumn: Customer Key

        changedProperty = IsHidden

        annotation SummarizationSetBy = Automatic

      column 'Product Key'
        dataType: int64
        isHidden
        formatString: 0
        lineageTag: fa7c182b-48f8-482b-b469-e4f0e0f60b0a
        summarizeBy: none
        sourceColumn: Product Key

        changedProperty = IsHidden

        annotation SummarizationSetBy = Automatic

      column 'Reseller Key'
        dataType: int64
        isHidden
        formatString: 0
        lineageTag: faa5e9ce-2aee-45e0-9e41-2557477bb473
        summarizeBy: none
        sourceColumn: Reseller Key

        changedProperty = IsHidden

        annotation SummarizationSetBy = Automatic

      column 'Sales Territory Key'
        dataType: int64
        isHidden
        formatString: 0
        lineageTag: 8602ccdc-1dc2-4fe4-b4a5-cdef7b0e6c8b
        summarizeBy: none
        sourceColumn: Sales Territory Key

        changedProperty = IsHidden

        annotation SummarizationSetBy = Automatic

      column 'Sales Amount'
        dataType: decimal
        isHidden
        formatString: \$#,0.###############;(\$#,0.###############);\$#,0.###############
        lineageTag: 9c599965-24f9-4d7c-88a3-551fa4737c28
        summarizeBy: sum
        sourceColumn: Sales Amount

        changedProperty = IsHidden

        annotation SummarizationSetBy = Automatic

        annotation PBI_FormatHint = {"currencyCulture":"en-US"}

      column 'Total Product Cost'
        dataType: decimal
        isHidden
        formatString: \$#,0.###############;(\$#,0.###############);\$#,0.###############
        lineageTag: 7cefbb7f-d0e5-425b-b350-0da2d6faca32
        summarizeBy: sum
        sourceColumn: Total Product Cost

        changedProperty = IsHidden

        annotation SummarizationSetBy = Automatic

        annotation PBI_FormatHint = {"currencyCulture":"en-US"}

      partition Sales = m
        mode: import
        source =
            let
             CurrentYear = Date.Year(DateTime.LocalNow()),
             LastYear = CurrentYear - 1,
             Source = #table(
             {"OrderDate", "CustomerKey", "ProductKey", "ResellerKey", "SalesTerritoryKey", "Sales Amount", "Total Product Cost"},
             {
             {#date(LastYear, 1, 15), 1, 1, 1, 1, 2200.00, 1500.00},
             {#date(LastYear, 2, 10), 2, 6, 2, 2, 95.00, 35.00},
             {#date(LastYear, 3, 5), 3, 4, 3, 1, 1450.00, 900.00},
             {#date(LastYear, 4, 20), 4, 2, 4, 3, 1800.00, 1100.00},
             {#date(LastYear, 5, 8), 5, 7, 5, 3, 65.00, 25.00},
             {#date(LastYear, 6, 12), 6, 8, 6, 4, 18.00, 7.00},
             {#date(LastYear, 7, 22), 7, 5, 1, 4, 380.00, 240.00},
             {#date(LastYear, 8, 14), 8, 3, 2, 5, 2400.00, 1650.00},
             {#date(LastYear, 9, 18), 1, 6, 3, 1, 110.00, 45.00},
             {#date(LastYear, 10, 25), 2, 4, 4, 2, 1500.00, 920.00},
             {#date(LastYear, 11, 3), 3, 1, 5, 1, 2350.00, 1580.00},
             {#date(LastYear, 12, 9), 4, 8, 6, 3, 22.00, 8.50},
             {#date(CurrentYear, 1, 7), 5, 2, 1, 3, 1750.00, 1080.00},
             {#date(CurrentYear, 2, 19), 6, 7, 2, 4, 70.00, 27.00},
             {#date(CurrentYear, 3, 21), 7, 5, 3, 4, 410.00, 255.00},
             {#date(CurrentYear, 4, 4), 8, 1, 4, 5, 2280.00, 1530.00},
             {#date(CurrentYear, 5, 11), 1, 8, 1, 1, 20.00, 8.00},
             {#date(CurrentYear, 6, 28), 2, 3, 6, 2, 2500.00, 1700.00},
             {#date(CurrentYear, 7, 16), 3, 6, 1, 1, 115.00, 48.00},
             {#date(CurrentYear, 8, 6), 4, 4, 2, 3, 1380.00, 860.00},
             {#date(CurrentYear, 9, 13), 5, 7, 3, 3, 75.00, 30.00},
             {#date(CurrentYear, 10, 2), 6, 2, 4, 4, 1900.00, 1180.00},
             {#date(CurrentYear, 11, 24), 7, 8, 3, 4, 19.50, 7.50},
             {#date(CurrentYear, 12, 17), 8, 5, 6, 5, 395.00, 250.00}
             }
             ),
             Typed = Table.TransformColumnTypes(Source, {
             {"OrderDate", type date},
             {"CustomerKey", Int64.Type},
             {"ProductKey", Int64.Type},
             {"ResellerKey", Int64.Type},
             {"SalesTerritoryKey", Int64.Type},
             {"Sales Amount", Currency.Type},
             {"Total Product Cost", Currency.Type}
             }),
                #"Fix column names" = Table.TransformColumnNames(
             Typed,
             each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
            )
            in
                #"Fix column names"

      annotation PBI_NavigationStepName = Navigation

      annotation PBI_ResultType = Table

    relationship AutoDetected_06eb4d5b-b013-4409-848a-ab5a08e72cdb
      fromColumn: Sales.'Customer Key'
      toColumn: Customer.'Customer Key'

    relationship AutoDetected_7f739f03-44b0-42a1-afb5-6c94f89dd819
      fromColumn: Sales.'Product Key'
      toColumn: Product.'Product Key'

    relationship AutoDetected_c894e0eb-2371-43ab-9429-70ebed529585
      fromColumn: Sales.'Reseller Key'
      toColumn: Reseller.'Reseller Key'

    relationship AutoDetected_c1eb0afb-666a-48c9-adfa-a31114a2227a
      fromColumn: Sales.'Sales Territory Key'
      toColumn: SalesTerritory.'Sales Territory Key'

    relationship 026e5bd2-447e-7a43-520d-5803ceb289fb
      fromColumn: Sales.'Order Date'
      toColumn: Date.Date

    cultureInfo en-US

    annotation __PBI_TimeIntelligenceEnabled = 1

    annotation PBI_QueryOrder = ["Customer","Product","Reseller","SalesTerritory","Date","Sales"]

    annotation PBI_ProTooling = ["DaxCopilot_Change_Accepted_In_Desktop","DaxQueryView_Desktop","Copilot","CopilotMeasureDescriptions","TMDLView_Desktop"]
```

## Phase 1: Get your data with Power Query in Power BI Desktop

**Tool**: Power BI Desktop - Power Query.

In this phase, you create six source queries in Power Query - one for each table in the Adventure Works Cycles Sales model: `Customer`, `Product`, `Reseller`, `SalesTerritory`, `Date`, and `Sales`. Power Query lets you paste all six in a single step by using `// <TableName>` comments as separators.

> [!TIP]
> Rename columns to user-friendly names with spaces (for example, "Sales Amount" instead of "SalesAmount") as early as possible in Power Query. Some data sources - such as Fabric Lakehouses - don't allow spaces in column names, so a Power Query rename step is where you introduce the spacing that Power BI report users expect. Clear names here flow through to the semantic model and make the report easier to build. The M script below uses `Table.TransformColumnNames` with `Splitter.SplitTextByCharacterTransition` to split camelCase names into words separated by spaces - a compact way to rename many columns at once.

1. Open Power BI Desktop and create a new blank report.
1. On the **Home** ribbon, select **Transform data** to open Power Query Editor.
1. In the **Queries** pane on the left, right-click and select **Paste**. Paste the entire M script below. Power Query creates one query per `// <TableName>` block.
1. Confirm six queries appear in the **Queries** pane: `Customer`, `Product`, `Reseller`, `SalesTerritory`, `Date`, and `Sales`.

If your version of Power Query doesn't accept a multi-query paste, add each query individually: for each of the six `let ... in ...` blocks in the script, select **Home** > **New Query** > **Blank Query**, open **Advanced Editor**, paste just that block, select **Done**, and rename the query to match its `// <TableName>` comment.

```powerquery-m
// Customer
let
    Source = #table(
        type table [CustomerKey = Int64.Type, CustomerName = text, Country = text],
        {
            {1, "Contoso Ltd",           "United States"},
            {2, "Fabrikam Inc",          "United States"},
            {3, "Tailwind Traders",      "United States"},
            {4, "Wide World Importers",  "Canada"},
            {5, "Lakeshore Retail",      "Canada"},
            {6, "Tailspin Toys",         "United Kingdom"},
            {7, "Wingtip Toys",          "United Kingdom"},
            {8, "Zava Inc",              "Australia"}
        }
    ),
    #"Fix column names" = Table.TransformColumnNames(
        Source,
        each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
    )
in
    #"Fix column names"

// Product
let
    Source = #table(
        type table [ProductKey = Int64.Type, ProductName = text, Category = text],
        {
            {1, "Mountain-200 Bike",  "Bikes"},
            {2, "Road-150 Bike",      "Bikes"},
            {3, "Touring-1000 Bike",  "Bikes"},
            {4, "HL Mountain Frame",  "Components"},
            {5, "Brake Set",          "Components"},
            {6, "Cycling Jersey",     "Clothing"},
            {7, "Cycling Gloves",     "Clothing"},
            {8, "Water Bottle",       "Accessories"}
        }
    ),
    #"Lowercased Text" = Table.TransformColumnNames(
        Source,
        each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
    ),
    #"Fix column names" = Table.TransformColumnNames(
        Source,
        each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
    )
in
    #"Fix column names"

// Reseller
let
    Source = #table(
        type table [ResellerKey = Int64.Type, ResellerName = text, #"Business Type" = text],
        {
            {1, "Northwind Traders",      "Specialty Bike Shop"},
            {2, "Wingtip Toys",           "Specialty Bike Shop"},
            {3, "VanArsdel Ltd",              "Value Added Reseller"},
            {4, "Proseware Inc",          "Value Added Reseller"},
            {5, "Consolidated Messenger", "Warehouse"},
            {6, "Adatum Corporation",   "Warehouse"}
        }
    ),
    #"Calculated Text Length" = Table.TransformColumnNames(
        Source,
        each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
    ),
    #"Fix column names" = Table.TransformColumnNames(
        Source,
        each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
    )
in
    #"Fix column names"

// SalesTerritory
let
    Source = #table(
        type table [SalesTerritoryKey = Int64.Type, Country = text, Region = text, Group = text],
        {
            {1, "United States",  "Northwest",      "North America"},
            {2, "United States",  "Southwest",      "North America"},
            {3, "Canada",         "Canada",         "North America"},
            {4, "United Kingdom", "United Kingdom", "Europe"},
            {5, "Australia",      "Australia",      "Pacific"}
        }
    ),
    #"Lowercased Text" = Table.TransformColumnNames(
        Source,
        each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
    ),
    #"Fix column names" = Table.TransformColumnNames(
        Source,
        each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
    )
in
    #"Fix column names"

// Date
let
    CurrentYear = Date.Year(DateTime.LocalNow()),
    LastYear = CurrentYear - 1,
    StartDate = #date(LastYear, 1, 1),
    EndDate = #date(CurrentYear, 12, 31),
    DayCount = Duration.Days(EndDate - StartDate) + 1,
    DateList = List.Dates(StartDate, DayCount, #duration(1, 0, 0, 0)),
    Source = Table.FromList(DateList, Splitter.SplitByNothing(), {"Date"}),
    TypedDate = Table.TransformColumnTypes(Source, {{"Date", type date}}),
    AddYear = Table.AddColumn(TypedDate, "Year", each Date.Year([Date]), Int64.Type),
    AddMonthNumber = Table.AddColumn(AddYear, "MonthNumber", each Date.Month([Date]), Int64.Type),
    AddMonth = Table.AddColumn(AddMonthNumber, "Month", each Date.MonthName([Date]), type text),
    AddMonthly = Table.AddColumn(AddMonth, "Monthly", each Date.StartOfMonth([Date]), type date),
    #"Fix column names" = Table.TransformColumnNames(
        AddMonthly,
        each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
    )
in
    #"Fix column names"

// Sales
let
    CurrentYear = Date.Year(DateTime.LocalNow()),
    LastYear = CurrentYear - 1,
    Source = #table(
        {"OrderDate", "CustomerKey", "ProductKey", "ResellerKey", "SalesTerritoryKey", "Sales Amount", "Total Product Cost"},
        {
            {#date(LastYear, 1, 15),     1, 1, 1, 1, 2200.00, 1500.00},
            {#date(LastYear, 2, 10),     2, 6, 2, 2,   95.00,   35.00},
            {#date(LastYear, 3, 5),      3, 4, 3, 1, 1450.00,  900.00},
            {#date(LastYear, 4, 20),     4, 2, 4, 3, 1800.00, 1100.00},
            {#date(LastYear, 5, 8),      5, 7, 5, 3,   65.00,   25.00},
            {#date(LastYear, 6, 12),     6, 8, 6, 4,   18.00,    7.00},
            {#date(LastYear, 7, 22),     7, 5, 1, 4,  380.00,  240.00},
            {#date(LastYear, 8, 14),     8, 3, 2, 5, 2400.00, 1650.00},
            {#date(LastYear, 9, 18),     1, 6, 3, 1,  110.00,   45.00},
            {#date(LastYear, 10, 25),    2, 4, 4, 2, 1500.00,  920.00},
            {#date(LastYear, 11, 3),     3, 1, 5, 1, 2350.00, 1580.00},
            {#date(LastYear, 12, 9),     4, 8, 6, 3,   22.00,    8.50},
            {#date(CurrentYear, 1, 7),   5, 2, 1, 3, 1750.00, 1080.00},
            {#date(CurrentYear, 2, 19),  6, 7, 2, 4,   70.00,   27.00},
            {#date(CurrentYear, 3, 21),  7, 5, 3, 4,  410.00,  255.00},
            {#date(CurrentYear, 4, 4),   8, 1, 4, 5, 2280.00, 1530.00},
            {#date(CurrentYear, 5, 11),  1, 8, 1, 1,   20.00,    8.00},
            {#date(CurrentYear, 6, 28),  2, 3, 6, 2, 2500.00, 1700.00},
            {#date(CurrentYear, 7, 16),  3, 6, 1, 1,  115.00,   48.00},
            {#date(CurrentYear, 8, 6),   4, 4, 2, 3, 1380.00,  860.00},
            {#date(CurrentYear, 9, 13),  5, 7, 3, 3,   75.00,   30.00},
            {#date(CurrentYear, 10, 2),  6, 2, 4, 4, 1900.00, 1180.00},
            {#date(CurrentYear, 11, 24), 7, 8, 3, 4,   19.50,    7.50},
            {#date(CurrentYear, 12, 17), 8, 5, 6, 5,  395.00,  250.00}
        }
    ),
    Typed = Table.TransformColumnTypes(Source, {
        {"OrderDate", type date},
        {"CustomerKey", Int64.Type},
        {"ProductKey", Int64.Type},
        {"ResellerKey", Int64.Type},
        {"SalesTerritoryKey", Int64.Type},
        {"Sales Amount", Currency.Type},
        {"Total Product Cost", Currency.Type}
    }),
    #"Fix column names" = Table.TransformColumnNames(
        Typed,
        each Text.Combine(Splitter.SplitTextByCharacterTransition({"a".."z"}, {"A".."Z"})(_), " ")
    )
in
    #"Fix column names"
```

**Verify**: Power Query Editor shows six queries in the **Queries** pane: `Customer`, `Product`, `Reseller`, `SalesTerritory`, `Date`, and `Sales`. Selecting each one previews its rows in the center pane.

**Hand-off to Phase 2**: With the source queries in place, you can review them and load the tables into the Power BI semantic model.

## Phase 2: Transform your data in Power Query Editor

**Tool**: Power BI Desktop - Power Query Editor.

The Power Query M code you pasted in Phase 1 already types the columns and adds the calendar fields (`Year`, `Month`, `MonthNumber`, `Monthly`, `Quarter`) to the **Date** query. In this phase, you verify the queries look right, optionally adjust column names, and load the shaped tables into the Power BI semantic model.

1. In Power Query Editor, select each query in the **Queries** pane, and review the column types and rows in the center preview pane.
1. Confirm the column data types. The icon to the left of each column header indicates its type - `123` for whole number, `1.2` for decimal, the calendar icon for date, and `ABC` for text. The types should match the schema each table needs:
   - **Date columns** (for example, `Date[Date]`, `Date[Monthly]`, and `Sales[Order Date]`): **Date**.
   - **Key columns** (`Customer Key`, `Product Key`, `Reseller Key`, `Sales Territory Key`): **Whole Number**.
   - **Amount columns** (`Sales Amount`, `Total Product Cost`): **Fixed decimal number** or **Decimal Number**.

   If you change a type, Power Query records it as a new entry in the **Applied Steps** pane, which you can review or remove later.

1. Rename any column whose meaning isn't obvious from its name. Short, clear column names show up in your Power BI report later, so fix them before modeling.
1. On the **Home** tab, select **Close & Apply** to load the shaped tables into the Power BI semantic model.

To add calendar fields to a date column in a different scenario, use the built-in transformations under **Add Column** > **Date**. They create **Year**, month name, and month number columns from any date column. The Date query in this tutorial uses M code that produces those columns in a single step. The **Quarter** column demonstrates custom column creation in Power Query - in your own projects, add a Quarter column by selecting **Add Column** > **Custom Column**, naming it "Quarter", and using the formula `"Q" & Text.From(Date.QuarterOfYear([Date]))`. Create a **hierarchy** in Model view by right-clicking the **Year** column and selecting **Create hierarchy**, then dragging **Quarter**, **Month**, and **Date** into the hierarchy levels.

**Verify**: After **Close & Apply**, Power BI Desktop returns to the main view. Switch to **Model view** on the left and confirm you see six tables: `Customer`, `Product`, `Reseller`, `SalesTerritory`, `Sales`, and `Date`. Expand the `Date` table and confirm it includes `Date`, `Year`, `Month`, `MonthNumber`, `Monthly`, and `Quarter`.

**Hand-off to Phase 3**: The tables are loaded in Power BI Desktop and ready to be related in the semantic model.

## Phase 3: Build the Power BI semantic model in Model view

**Tool**: Power BI Desktop - Model view.

The Power BI semantic model is the reusable foundation that reports, paginated reports, Excel PivotTables, Copilot in Power BI, and agents that use the [Power BI MCP servers](../developer/mcp/mcp-servers-overview.md) all read from. Modeling work in this phase carries forward to every downstream Power BI experience.

Aim for a [star schema](../guidance/star-schema.md): one or more fact tables in the middle, surrounded by dimension tables.

1. In Power BI Desktop, select **Model view** on the left.
1. Confirm the relationships. Power BI Desktop usually auto-detects relationships when key columns share names and compatible types, so most relationships might already be in place. If any are missing, drag matching key columns between tables to create them. The **Sales** fact table connects to dimension tables on `Customer Key`, `Product Key`, `Reseller Key`, and `Sales Territory Key`. The **Date** dimension connects to **Sales** by dragging `Date[Date]` onto `Sales[Order Date]`.

   > [!TIP]
   > Use the **Model Explorer** pane (on the **Model** tab in the **Data** pane) to quickly navigate your semantic model. You can click on any relationship in the Model Explorer to view and edit its properties in the properties pane on the right, without having to locate the visual relationship line in the diagram.

1. Check relationship cardinality. When you drag `Date[Date]` to `Sales[Order Date]`, Power BI might create a **1:1** relationship if the sample data happens to have only one sale per date. Change this to **Many-to-1** with the **Many** side on the **Sales** table. Select the relationship line (or click it in Model Explorer), then in the properties pane set **Cardinality** to **Many to one (\*:1)** with the many side pointing to Sales.
1. Open **Manage relationships** on the **Modeling** ribbon to verify all the expected relationships exist. Add any that are missing.
1. Mark your **Date** table as a date table so time intelligence functions such as `TOTALYTD` work correctly. In **Model view**, right-click the **Date** table, select **Mark as date table**, toggle the setting to **On**, and choose `Date` as the date column. For details, see [Set and use date tables in Power BI Desktop](../transform-model/desktop-date-tables.md).
1. Hide foreign key columns from the report view so report creators see business-friendly fields instead of join keys. The easiest way: in the **Data** pane, search for "Key" to show all key columns, hold Ctrl to multiselect them, then in the properties pane toggle **Is hidden** to On. Hidden columns still participate in relationships - they just don't show up in the report field list.
1. Hide all base columns in the **Sales** table (not the measures). This step promotes the use of measures and declutters report view. Select all non-measure columns in the Sales table (Order Date, Customer Key, Product Key, Reseller Key, Sales Territory Key, Sales Amount, Total Product Cost) and toggle **Is hidden** to On in the properties pane. When done correctly, **Sales** becomes a measure table with a new icon and moves to the top of the table list in the Data pane.
1. Set the **Country** column data category. In the **Customer** table, select the **Country** column, then in the properties pane under **Advanced** set **Data category** to **Country/Region**. This setting helps map visuals recognize the column as a geographic field.
1. Sort the **Month** column by month number so months display in calendar order (January, February, March…) instead of alphabetically. Select the `Month` column in the Date table, then in the properties pane under **Advanced** set **Sort by column** to **MonthNumber**.
1. Hide the **MonthNumber** column since it's not useful for reporting (it's only there to sort the Month column). Select `MonthNumber` and toggle **Is hidden** to On.
1. Set date and time formats for clarity:
   - Select the **Monthly** column in the Date table. In the properties pane, set **Date time format** to **Custom**, then enter `mmm yyyy` in the **Custom format** field.
   - Select the **Date** column in the Date table. Set **Date time format** to a format without a time component (for example, `yyyy-MM-dd` for international audiences).
1. Create a date hierarchy. Right-click the **Year** column in the Date table and select **Create hierarchy**. Name it **Date Hierarchy**. Drag **Quarter**, **Month**, and **Date** into the hierarchy levels below Year.
1. Create the measures your report needs. You have two options:
   - **DAX query view (recommended)**: Select **DAX query view** from the bottom of the screen (or the **Home** tab). Paste the query below into the query pane and select **Run** to preview the results. Then select each measure in the query and choose **Update model: Add new measure** on the ribbon (or right-click the measure and select the equivalent option) to add all four measures to the Sales table at once.

     ```dax
     // Define measures on the 'Sales' table
     DEFINE
       // Total revenue from sales
       MEASURE 'Sales'[Total Sales] =
         SUM ( 'Sales'[Sales Amount] )

       // Total cost of products sold
       MEASURE 'Sales'[Total Cost] =
         SUM ( 'Sales'[Total Product Cost] )

       // Profit = Sales - Cost
       MEASURE 'Sales'[Profit] =
         [Total Sales] - [Total Cost]

       // Profit Margin = Profit / Sales
       MEASURE 'Sales'[Profit Margin] =
         DIVIDE ( [Profit], [Total Sales] )

     // Return the four measures by product name
     EVALUATE
       SUMMARIZECOLUMNS(
         'Product'[Product Name],
         "Total Sales",   [Total Sales],
         "Total Cost",    [Total Cost],
         "Profit",        [Profit],
         "Profit Margin", [Profit Margin]
       )
       ORDER BY
         'Product'[Product Name] ASC
     ```

   - **New measure (one at a time)**: In **Model view**, right-click the **Sales** table, select **New measure**, and paste each formula below into the formula bar one at a time (press Enter after each):

     ```dax
     Total Sales = SUM(Sales[Sales Amount])
     ```

     ```dax
     Total Cost = SUM(Sales[Total Product Cost])
     ```

     ```dax
     Profit = [Total Sales] - [Total Cost]
     ```

     ```dax
     Profit Margin = DIVIDE([Profit], [Total Sales])
     ```

   > [!TIP]
   > If you have access to Fabric, Copilot is available in DAX query view to help you create measures or query the data with natural language. For details, see [Write DAX queries with Copilot](/dax/dax-copilot).

1. Add measure descriptions so Copilot and report creators understand what each measure does. For each measure, select it in the **Data** pane, then in the properties pane enter a description such as "Total revenue from all sales transactions" for `Total Sales`.

For deeper modeling guidance - hierarchies, calculation groups, and DAX patterns - see the [dimensional model tutorial](desktop-dimensional-model-report.md#model-your-data).

> [!IMPORTANT]
> Treat this model as a product. Name fields clearly, write descriptions on measures, and remove anything a report creator shouldn't see. The same model can serve many reports and many AI experiences, so polish here scales further than polish anywhere else in the journey.

**Verify**: In **Model view**, you should see relationship lines connecting **Sales** to each dimension table with **Many-to-1** cardinality, the four new measures (`Total Sales`, `Total Cost`, `Profit`, `Profit Margin`) listed under the **Sales** table, a date-table icon on the **Date** table, and a date hierarchy visible in the Data pane. Most key columns should be hidden, and the Sales table should appear as a measure table at the top of the Data pane.

**Hand-off to Phase 4**: With the semantic model in place, move to Report view and start building Power BI visuals.

## Phase 4: Build the Power BI report in Report view

**Tool**: Power BI Desktop - Report view.

Your leadership team has three questions. Each one maps to a visual on the report page.

1. Select **Report view** on the left.
1. Add a **Card** visual at the top to serve as an executive summary:
   1. In the **Visualizations** pane, select the **Card** icon.
   1. Drag all four measures (`Total Sales`, `Total Cost`, `Profit`, `Profit Margin`) into the **Fields** well for the card.
   1. With the card selected, in the **Format** pane (paint roller icon), expand **Callout values** or **Title** and change the title to **Adventure Works Cycles Sales - Executive Summary**, set the font size to **20**, and toggle **Bold** to **On**.

   > [!TIP]
   > Use the new **modern visual defaults** (GA in August 2026) to match the polished look of this report. On the **View** tab, select **Modern visual defaults**.

1. Add three visuals that answer the leadership questions. The table shows the visual type and field assignments for each:

   | Leadership question | Visual to use | Fields | Visual enhancements |
   | --- | --- | --- | --- |
   | Which month had the most sales? | **Clustered column chart** | X-axis: `Date Hierarchy` (collapse to Year and Month levels), Y-axis: `[Total Sales]` | Add conditional formatting (Column > Color > Conditional formatting > Gradient), add a max line (Analytics pane), add the question as the title (General > Title), use the **With data labels** style preset to show labels instead of an axis |
   | Which country/region performs best? | **Azure map** | Location: `SalesTerritory[Country]`, Legend: `SalesTerritory[Group]`, Bubble size: `[Total Sales]` | Add the question as the title |
   | Which product and reseller type should we keep investing in? | **Matrix** | Rows: `Product[Category]`, Columns: `Reseller[Business Type]`, Values: `[Profit Margin]` | Add the question as the title, add conditional formatting (Cell elements > Background color > toggle on), make column widths uniform (Layout > Auto-size behavior > Fixed width > toggle off custom widths > set default width to 100px) |

   **For the clustered column chart**:
   1. Add the visual and drag the **Date Hierarchy** (not just Month) to the X-axis. Collapse the hierarchy up one level so it shows Year and Month (not individual dates), which prevents misleading aggregation across multiple years' worth of the same month.
   1. To highlight which month had the highest sales, select the visual, go to the **Format** pane, expand **Columns**, expand **Colors**, select **Conditional formatting (fx)**, choose **Gradient**, and select **OK**. You can adjust the colors or min/max values if needed.
   1. Add a max line by selecting the visual, opening the **Analytics** pane (magnifying glass icon), and adding a **Max line**.
   1. Add the question as the subtitle: in the **Format** pane, expand **General** > **Title** and add the question text in the **Subtitle** field.
   1. Apply the **With data labels** style preset to show values on bars instead of an axis: in the **Format** pane, expand **Visual** > **Style presets** and select **With data labels**.

   **For the Azure map** (Bing map is being removed):
   1. Add the Azure map visual and drag `SalesTerritory[Country]` to **Location**, `SalesTerritory[Group]` to **Legend**, and `[Total Sales]` to **Bubble size**.
   1. Add the question as the title in the **Format** pane under **General** > **Title**.

   **For the matrix**:
   1. Add the matrix visual and drag `Product[Category]` to **Rows**, `Reseller[Business Type]` to **Columns**, and `[Profit Margin]` to **Values**.
   1. Add the question as the title.
   1. Add conditional formatting to highlight the cells you want to pay attention to: in the **Format** pane, expand **Cell elements**, expand **Background color**, and toggle it on. A gradient is applied automatically. You can click **fx** to modify it to include totals if you want, or adjust the min or max to white to highlight only low or only high values.
   1. Make the column widths uniform: in the **Format** pane, expand **Layout** > **Auto-size behavior**, select **Fixed width**, toggle off **Custom widths**, and set **Default width** to **100px**.

1. Add a **Button slicer** to filter by reseller and also display profit:
   1. In the **Visualizations** pane, select the **Button slicer** icon.
   1. Drag `Reseller[Reseller Name]` into the **Field** well.
   1. Drag `[Profit]` into the **Values** well to show profit alongside each reseller name.

1. Add a **Year slicer** for `Date[Year]` so consumers can filter the page to a single year. In the **Visualizations** pane, select the **Slicer** icon, then drag `Date[Year]` into the slicer's **Field** well.
1. Apply a theme so the page looks finished. On the **View** tab, pick a built-in theme or import a custom one. See [Use report themes](desktop-report-themes.md).
1. Save the file as `Adventure Works Cycles Sales.pbix`. The file name (without the `.pbix` extension) becomes the report's name in the Power BI service, so users see and search for it as *Adventure Works Cycles Sales*.

For richer page design - bookmarks, drillthrough, page tooltips, and conditional formatting - see [Create reports](power-bi-reports-overview.md) and [Tips for creating reports](desktop-tips-and-tricks-for-creating-reports.md).

**Verify**: Your Power BI report page shows a card with four measures at the top, three visuals (column chart with conditional formatting and a max line, Azure map, matrix with conditional formatting and uniform column widths), a button slicer showing profit by reseller, and a year slicer. When you change the year slicer, all visuals update. The column chart highlights the highest-sales month, and the matrix uses conditional formatting to draw attention to high and low profit margins.

**Hand-off to Phase 5**: The Power BI report is ready locally in the `.pbix` file. Next, you publish it to the Power BI service so other people can see it.

## Phase 5: Publish the report to the Power BI service

**Tool**: Power BI Desktop and the Power BI service.

When you publish, you move both the semantic model and the report into a workspace. Collaborators see your work in the workspace, but business consumers don't see it yet. That happens in Phase 6.

1. In the Power BI service, [create a workspace](../collaborate-share/service-create-the-new-workspaces.md) named something like *Adventure Works Cycles Sales - Dev*.
1. Back in Power BI Desktop, on the **Home** ribbon, select **Publish**.
1. Select the workspace you created and select **Select**.
1. When the publish finishes, open the link to view the report in the service.

**Alternative publishing options**: Use **Git integration** to publish with source control by enabling Git integration on the workspace to track changes and collaborate with version control (see [Get started with Git integration](/fabric/cicd/git-integration/intro-to-git-integration)). Use **deployment pipelines** to publish to a development workspace first, then push to production for a formal dev-test-prod pipeline (see [Get started with deployment pipelines](/fabric/cicd/deployment-pipelines/get-started-with-deployment-pipelines)). Or use **import in the workspace** if you already have a `.pbix` file saved on your computer - in the workspace, select **Upload** > **Browse** and choose the file.

1. In the workspace items list, locate the **semantic model** that you created alongside the report. (Depending on your tenant, it appears under a **Semantic models** filter or in the combined items list, with a semantic-model icon.) In a production solution, this is where you configure **scheduled refresh** so the data stays current as your source updates. The semantic model in this tutorial uses inline data that doesn't change, but the same setup applies to models that read from databases, lakehouses, or files. For details, see [Configure scheduled refresh](../connect-data/refresh-scheduled-refresh.md).
1. *Optional but recommended*: Promote the semantic model so other report creators can find and trust it. (Certification requires permission from your Power BI admin.) See [Endorse your content](../collaborate-share/service-endorse-content.md).

**Verify**: In the workspace items list, you should see both the Power BI report and the semantic model. Open the semantic model's settings and find the **Scheduled refresh** section - this is where you'd set a refresh schedule for models that read from real sources. Open the report and confirm the visuals from Phase 4 (card, column chart with conditional formatting, Azure map, matrix with conditional formatting, button slicer, year slicer) render with the published data.

**Hand-off to Phase 6**: The Power BI content is in the service and ready to package as an app for distribution.

## Phase 6: Distribute the content through a Power BI app

**Tool**: Power BI service.

A Power BI **app** is the supported way to hand polished content to a business audience. Workspace access is for the people who *build* the Power BI solution; app access is for the people who *consume* it. Power BI apps give you per-audience visibility, a branded landing page, and a stable URL to share.

1. In your workspace, select **Create app** in the upper-right.
1. On the **Setup** tab, give the app a clear name (*Adventure Works Cycles Sales*), a one-line description, and a logo or color.
1. On the **Content** tab, confirm that the report and semantic model from Phase 5 are included. Hide anything that's still work-in-progress.
1. On the **Audience** tab, create at least one audience (for example, *Sales leadership*) and add the security groups or individuals who should see the app. You can create multiple audiences if different groups need different content. For details, see [Create and manage multiple audiences](../collaborate-share/service-create-distribute-apps.md#create-and-manage-multiple-audiences).

   > [!IMPORTANT]
   > When you give users permission to access the report in the app, also give them **Build** permission on the underlying semantic model. Without Build permission, they can't reuse the semantic model for their own reports or Excel analyses. To set Build permission, go to the semantic model's settings in the workspace, select **Manage permissions**, and grant Build access to the relevant security groups.

1. Select **Publish app**. Copy the app link from the confirmation dialog.
1. Share the link with your audience. Consumers open the app from the Power BI **Apps** page or from the link you sent.

When you make changes later (add a visual, update a measure, refresh data), publish them to your audience by selecting **Update app** in the workspace. The **Update app** button appears in the upper-right of the workspace in place of **Create app** after the app exists.

For more on Power BI app distribution patterns, see [Publish an app in Power BI](../collaborate-share/service-create-distribute-apps.md). **Organizational apps** are also available, and unlike the single workspace app, a workspace can contain more than one organizational app. Each organizational app appears in the **Apps from my organization** section of the Power BI service. For details, see [Get started with org apps](../explore-reports/org-app-items.md).

**Verify**: In the Power BI service, open **Apps** from the left navigation. Your app appears with the name, description, and logo you configured. Open the app as a test audience member - the report displays with the year slicer and button slicer functional, and all visuals render correctly.

**Hand-off to consumers**: Sales leadership now has a stable, governed Power BI report they can open from anywhere they use Power BI.

## Troubleshoot common Power BI publish and distribution issues

If you encounter one of these blockers in the Power BI service, try the following fixes:

| Problem | Cause | Try this |
| --- | --- | --- |
| **Publish** is disabled or fails | You don't have a Pro license, or you lack the Member role in the destination workspace | Verify your license in the Power BI service under **Settings** > **Account**. Confirm your workspace role under the workspace's **Manage access** menu. |
| Relationships didn't auto-detect when you connected the tables | Column names or types don't match exactly across tables | In **Model view**, manually drag matching key columns between tables. See [Create and manage relationships in Power BI Desktop](../transform-model/desktop-create-and-manage-relationships.md). |
| The map visual shows a blank or disabled state | The **Map and filled map visuals** tenant setting is off | Ask your Power BI or Fabric admin to enable **Map and filled map visuals** in the admin portal. See [About admin settings](../admin/service-admin-portal-about-tenant-settings.md). |
| App consumers can't open the app | They're not in an audience, or they're on a Free license in a workspace that's not on an F64-or-larger Fabric capacity | Confirm they're added to an audience on the app's **Audience** tab, and check the [License and role requirements](#license-and-role-requirements) for the workspace's capacity. |
| Copilot in Power BI or the Power BI MCP servers aren't available | Your workspace isn't on a Fabric capacity | Assign the workspace to a Fabric capacity, or start a free [Fabric trial](/fabric/fundamentals/fabric-trial). |

## Consume the published Power BI app

To experience the Power BI app from a consumer's point of view:

1. Open the app link in a browser as an audience member would.
1. Use the year slicer and button slicer to explore the data by year and reseller. All visuals update with the filtered data.
1. **Personalize visuals**: Right-click a visual (or select **More options (…)**) and choose **Personalize this visual** to customize fields, filters, and visual type without editing the underlying report. For details, see [Personalize visuals in a report](../consumer/end-user-personalize-visuals.md).
1. **Explore data**: Right-click any data point on a visual and select **Explore** to see a contextual chart with additional insights. For details, see [View data insights on dashboard tiles](../explore-reports/end-user-insights.md).
1. Subscribe to the report so a snapshot lands in your inbox on a schedule. See [Subscribe to reports and dashboards](../collaborate-share/end-user-subscribe.md).
1. **Pin to PowerPoint**: Select a visual, then select **More options (…)** > **Pin to PowerPoint** to add a live visual to a PowerPoint slide. The visual in PowerPoint updates as the data refreshes in Power BI. For details, see [Pin a Power BI report page or visual to PowerPoint (preview)](../collaborate-share/service-power-bi-powerpoint-add-in-view-present.md).
1. To pull the same semantic model into Excel for ad-hoc analysis, open the report in the Power BI service and select **Export** > **Analyze in Excel**. You can also start from the semantic model directly - in the workspace items list, open the semantic model's overflow menu (**…**) and select **Analyze in Excel**.
1. **Run ad hoc DAX queries**: Consumers with Build permission can open the semantic model from the workspace, select **Open** > **DAX query view**, and write or paste DAX queries to explore data directly without building a report. This is useful for data verification, measure testing, and extracting specific slices. For details, see [DAX query view in Power BI Desktop](../transform-model/dax-query-view.md).

The same Power BI semantic model is also what AI-assisted experiences (Copilot and the MCP servers) read from - covered next.

## Optional path: Add Copilot and MCP servers for AI-assisted authoring in Power BI

The Power BI semantic model you built in Phase 3 powers AI-assisted authoring and consumption. You can add these features at any point after the model exists; they don't replace the journey described earlier.

> [!NOTE]
> Several Power BI AI features in this optional path are in preview. **Copilot in Power BI**, the **remote Power BI MCP server**, the **Power BI Modeling MCP Server (local)**, and **Prep data for AI** all have preview-status features that are subject to change. Check each linked article for current status, capacity requirements, and regional availability. Copilot in Power BI and the Power BI MCP servers also require your workspace to be assigned to a **Fabric** capacity (a Fabric trial capacity is sufficient for evaluation).

| If you want to… | Use this | Start with |
| --- | --- | --- |
| Generate report pages, narratives, and summaries from natural language | **Copilot in Power BI (report view)** | [Copilot in Power BI tutorial: End-to-end overview](tutorial-copilot-power-bi-introduction.md) |
| Write DAX measures or queries with Copilot in Desktop or the web | **Copilot in DAX query view** | [Write DAX queries with Copilot](/dax/dax-copilot) |
| Generate measure descriptions with Copilot | **Copilot for measure descriptions** | Select a measure in Model view, then select **Copilot** in the properties pane to auto-generate a description. For details, see [Use Copilot to create measure descriptions](../transform-model/desktop-measure-copilot-descriptions.md) |
| Edit the semantic model with Copilot in the Power BI service | **Copilot for web modeling** | Available in the Power BI service for Fabric capacities. Select **Edit** on a published semantic model to open web modeling, then use Copilot to create or modify measures, tables, and relationships. For details, see [Edit semantic models in the Power BI service](../transform-model/service-edit-data-models.md) |
| Prepare a semantic model so Copilot and agents give better answers | **Prep data for AI** | [Prepare your data for Copilot](copilot-prepare-data-ai.md) |
| Let an AI agent or chat client query the model with DAX | **Remote Power BI MCP server** | [Get started with the remote Power BI MCP server](../developer/mcp/remote-mcp-server-get-started.md) |
| Author or refactor the semantic model itself with an agent | **Power BI Modeling MCP Server** (local) | [What are the Power BI MCP servers?](../developer/mcp/mcp-servers-overview.md) |
| Enable agentic workflows with Power BI report projects (PBIR) | **Agentic skills for PBIR** | Power BI report projects (.pbir) enable version control and agent-friendly authoring. For details, see [Power BI Project (PBIP) and Power BI Report (PBIR) file formats](/power-bi/developer/projects/projects-report) |

**Verify**: You know each Power BI AI experience is working when:

- **Copilot in Power BI (report view)**: The **Copilot** button appears in the report editor toolbar, and asking *"Summarize sales by country or region"* returns a narrative grounded in your semantic model.
- **Copilot in DAX query view**: In DAX query view (Desktop or web), the Copilot pane appears, and you can ask *"Write a measure for year-over-year growth"* to generate DAX code.
- **Copilot for measure descriptions**: Selecting a measure and choosing **Copilot** in the properties pane generates a description based on the DAX formula.
- **Copilot for web modeling**: Opening a semantic model in the Power BI service shows a **Copilot** button, and you can ask Copilot to create or modify semantic model objects.
- **Prep data for AI**: Your semantic model's settings show **Q&A and Copilot** enabled, and key tables have synonyms and descriptions populated.
- **Remote Power BI MCP server**: A connected MCP client (such as Visual Studio Code with the MCP extension or Claude Desktop) lists your semantic model as an available tool and returns DAX query results.
- **Power BI Modeling MCP Server (local)**: The local server runs without errors, connects to your `.pbix` file, and an agent can read or propose changes to measures and tables.
- **Agentic skills for PBIR**: Your Power BI report is saved in `.pbir` format, enabling source control and allowing agents to read and propose changes to report JSON and TMDL files.

The Power BI AI experiences read from your semantic model, so the modeling work you did in [Phase 3](#phase-3-build-the-power-bi-semantic-model-in-model-view) directly shapes how good their answers are. Clear field names, well-written measure descriptions, and a clean star schema all make Copilot in Power BI and Power BI MCP-based agents more accurate.

## Recap: How the Power BI tools fit together across the end-to-end journey

| Phase | Tool | What lives here after this phase |
| --- | --- | --- |
| 1. Get data | Power BI Desktop (Power Query) | Source queries that load the model's tables |
| 2. Transform | Power BI Desktop (Power Query) | Cleaned, typed tables |
| 3. Model | Power BI Desktop (Model view) | Reusable semantic model with measures |
| 4. Report | Power BI Desktop (Report view) | A `.pbix` file with finished visuals |
| 5. Publish | Power BI service (workspace) | Published semantic model and report in a workspace |
| 6. Distribute | Power BI service (app) | A branded experience for consumers |
| Optional AI | Copilot in Power BI, Power BI MCP servers | Natural-language and agent access to the same semantic model |

## Clean up resources

When you finish the tutorial, remove the items you created so they don't accumulate in your workspace:

1. In the Power BI service, open the workspace you created in [Phase 5](#phase-5-publish-the-report-to-the-power-bi-service).
1. Unpublish the app: in the workspace items list, find the app entry, open its overflow menu (**…**), and select **Unpublish app**.
1. Delete the report and the semantic model from the workspace items list.
1. If the workspace no longer contains anything you want to keep, delete the workspace itself from **Workspace settings** > **Other** > **Delete this workspace**.
1. On your computer, delete the local `Adventure Works Cycles Sales.pbix` file if you no longer need it.

> [!WARNING]
> Deletion is permanent. Deleted workspaces, reports, and semantic models can't be recovered.

## Related content

- [Tutorial: From dimensional model to stunning report in Power BI Desktop](desktop-dimensional-model-report.md) - deep dive on the modeling phase
- [Tutorial: Create a report from an Excel workbook in Power BI](desktop-excel-stunning-report.md) - simpler single-file path
- [Copilot in Power BI tutorial: End-to-end overview](tutorial-copilot-power-bi-introduction.md) - hands-on AI-assisted authoring scenario
- [Understand star schema and the importance for Power BI](../guidance/star-schema.md) - modeling reference
- [Publish an app in Power BI](../collaborate-share/service-create-distribute-apps.md) - distribution reference
- [Tour the report editor](service-the-report-editor-take-a-tour.md) - next stop for new report creators
