---
title: Optimize Your Semantic Model for Copilot in Power BI
description: Before you start using Copilot with your semantic model, evaluate your data model to improve its performance by defining clear relationships, standardized calculations, proper naming conventions, and comprehensive metadata documentation.
author: julcsc
ms.author: juliacawthra
ms.reviewer: guptamaya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 10/01/2025
ai-usage: ai-assisted
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
---

# Optimize your semantic model for Copilot in Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

We recommend that you evaluate your data before you start using Copilot with your semantic model. You might need to clean up your semantic model so that Copilot can derive insights from it.

[!INCLUDE [copilot-notes](../includes/copilot-notes.md)]

## Considerations for semantic models for Copilot use

You can create accurate reports with Copilot by using the criteria in the following table. These recommendations can help you to generate accurate Power BI reports.  

|Element  | Consideration  | Description  | Where to apply  | Example  |
|---------|---------|---------|---------|-----|
|Table linking  | Define clear relationships  | Ensure that all relationships between tables are clearly defined and logical. Indicate which are one-to-many, many-to-one, or many-to-many.  | In Model view, use Manage relationships | Create a one-to-many relationship from `Date[DateID]` to `Sales[DateID]` and verify the relationship is active. |
|Measures  | Standardized calculation logic  | Measures should have standardized, clear calculation logic that's easy to explain and understand.  | In measure definition and description property | Measure DAX: `Total Sales = SUM(Sales[SaleAmount])` and add description: "Sum of all sales amounts." |
|Measures  | Naming conventions  | Names for measures should clearly reflect their calculation and purpose.  | In measure name field when creating measures | Use descriptive name: `Average Customer Rating` instead of abbreviated: `AvgRating`. |
|Measures  | Predefined measures  | Include a set of predefined measures that users are most likely to request in reports.  | Create measures in your model that users commonly need | Add measures like `YTD Sales = TOTALYTD(SUM(Sales[SaleAmount]), 'Date'[Date])` or `MoM Growth = DIVIDE([This Month Sales] - [Last Month Sales], [Last Month Sales])`. |
|Fact tables  | Clear delineation  | Clearly delineate fact tables, which hold the measurable, quantitative data for analysis.  | In table properties and data model structure | Name tables explicitly as fact tables: `FactSales`, `FactTransactions`, `FactVisits`. |
|Dimension tables  | Supportive descriptive data  | Create dimension tables that contain the descriptive attributes related to the quantitative measures in fact tables.  | In table properties and data model structure | Create dimension tables like `DimProduct` with attributes (`ProductName`, `Category`, `Brand`) and `DimCustomer` with attributes (`CustomerName`, `City`, `Segment`). |
|Hierarchies  | Logical groupings  | Establish clear hierarchies within the data, especially for dimension tables that could be used to drill down in reports.  | In table context menu, select New hierarchy | In the `Date` table, create a hierarchy: `Year` > `Quarter` > `Month` > `Day`. In `Geography` table: `Country/Region` > `State` > `City`. |
|Column names  | Unambiguous labels  | Column names should be unambiguous and self-explanatory. Avoid the use of IDs or codes that require further lookup without context.  | Rename columns in Power Query Editor or Model view | Rename column from `ProdID` to `Product ID` or `Product Name`, and from `CustNo` to `Customer Number`. |
|Column data types  | Correct and consistent  | Apply correct and consistent data types for columns across all tables to ensure that measures calculate correctly and to enable proper sorting and filtering.  | In column properties, set Data type | Ensure `Sales[SaleAmount]` is Decimal Number (not Text), `Date[Date]` is Date (not Text), `Product[ProductID]` is Whole Number. |
|Relationship types  | Clearly specified  | To ensure accurate report generation, clearly specify the nature of relationships (active or inactive) and their cardinality.  | In relationship properties dialog | Set `Date` to `Sales` as Many-to-One (active), `Product` to `Sales` as Many-to-One (active), and mark role-playing relationships as inactive when appropriate. |
|Data consistency  | Standardized values  | Maintain standardized values within columns to ensure consistency in filters and reporting.  | Use Find and Replace or Power Query transformations | In `Status` column, ensure all values use consistent casing: `Open`, `Closed`, `Pending` (not mixed case like `open`, `CLOSED`). |
|Key performance indicators (KPIs)  | Predefined and relevant  | Establish a set of KPIs that are relevant to the business context and are commonly used in reports.  | Create measures for commonly tracked KPIs | Define measures like `ROI = DIVIDE([Profit], [Investment])`, `CAC = DIVIDE([Marketing Spend], [New Customers])`, `LTV = [Avg Order Value] * [Purchase Frequency] * [Customer Lifespan]`. |
|Refresh schedules  | Transparent and scheduled  | Clearly communicate the refresh schedules of the data to ensure users understand the timeliness of the data they're analyzing.  | In dataset settings and documentation | Add a text box or description stating: "Data refreshes daily at 6:00 AM UTC" or "Real-time data with 15-minute incremental refresh." |
|Security  | Role-level definitions  | Define security roles for different levels of data access if there are sensitive elements that not all users should see.  | In Model view, select Manage roles | Create role "Sales Team" with filter: `Sales[Region] = USERNAME()` and role "HR" with filter on employee data tables. |
|Metadata  | Documentation of structure  | For reference, document the structure of the data model, including tables, columns, relationships, and measures.  | Use description properties and external documentation | Add descriptions to tables and columns. Create a separate document with model diagram, data dictionary, and measure catalog. |

The following table lists other criteria that can help you create accurate [Data Analysis Expressions (DAX) queries with Copilot](/dax/dax-copilot). These recommendations can help you generate accurate DAX queries.

|Element  | Consideration  | Description  | Where to apply  | Example  |
|---------|---------|---------|---------|-----|
|Measures, tables, and columns  | Descriptions  | In the description property, define each element and how you intend to use it. Only the first 200 characters are used.  | In Properties pane, Description field for measures, tables, and columns | For measure `[YOY Sales]`, add description: "Year-over-year (YOY) difference in Orders. Use with the 'Date'[Year] column to show by years other than the latest year. Partial years compare to same period of the prior year." |
|Calculation groups | Descriptions | Calculation items aren't included in the model metadata. Use the description of the calculation group column to list and explain the use of the calculation items. Only the first 200 characters are used. | In Properties pane for the calculation group column | For [Time intelligence sample](/analysis-services/tabular-models/calculation-groups#time-intelligence-example) calculation group column, add description: "Use with measures and date table for Current: current value, MTD: month to date, QTD: quarter to date, YTD: year to date, PY: prior year, PY MTD, PY QTD, YOY: year over year change, YOY%: YOY as a %." For a measures table, add: "Measures are used to aggregate data. These measures can be shown as year-over-year by using this syntax CALCULATE([Measure Name], `Time intelligence`[Time calculation] = `YOY`)." |

## Related content

- [Overview of Copilot for Power BI](copilot-introduction.md)
- [Create a report with Copilot for Power BI](copilot-create-report.md)
