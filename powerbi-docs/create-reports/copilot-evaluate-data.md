---
title: Optimize Your Semantic Model for Copilot in Power BI
description: Before you start using Copilot with your semantic model, evaluate your data to see if you can improve its performance.
author: julcsc
ms.author: juliacawthra
ms.reviewer: guptamaya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 01/23/2024
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

|Element  | Consideration  | Description  | Example  |
|---------|---------|---------|-----|
|Table linking  | Define clear relationships  | Ensure that all relationships between tables are clearly defined and logical. Indicate which are one-to-many, many-to-one, or many-to-many.  | The `Sales` table is connected to the `Date` table by the `DateID` field.  |
|Measures  | Standardized calculation logic  | Measures should have standardized, clear calculation logic that's easy to explain and understand.  | `Total Sales` is calculated as the sum of the `SaleAmount` field from the `Sales` table.  |
|Measures  | Naming conventions  | Names for measures should clearly reflect their calculation and purpose.  | Use `Average_Customer_Rating` instead of `AvgRating`.  |
|Measures  | Predefined measures  | Include a set of predefined measures that users are most likely to request in reports.  | Like `Year_To_Date_Sales` or `Month_Over_Month_Growth`.  |
|Fact tables  | Clear delineation  | Clearly delineate fact tables, which hold the measurable, quantitative data for analysis.  | `Transactions`, `Sales`, and `Visits`.  |
|Dimension tables  | Supportive descriptive data  | Create dimension tables that contain the descriptive attributes related to the quantitative measures in fact tables.  | `Product_Details` and `Customer_Information`.  |
|Hierarchies  | Logical groupings  | Establish clear hierarchies within the data, especially for dimension tables that could be used to drill down in reports.  | A `Time` hierarchy that breaks down from `Year` to `Quarter` to `Month` to `Day`.  |
|Column names  | Unambiguous labels  | Column names should be unambiguous and self-explanatory. Avoid the use of IDs or codes that require further lookup without context.  | Use `Product_Name` instead of `ProdID`.  |
|Column data types  | Correct and consistent  | Apply correct and consistent data types for columns across all tables to ensure that measures calculate correctly and to enable proper sorting and filtering.  | Ensure numeric columns used in calculations aren't set as text data types.  |
|Relationship types  | Clearly specified  | To ensure accurate report generation, clearly specify the nature of relationships (active or inactive) and their cardinality.  | Mark whether a relationship is `One-to-One`, `One-to-Many`, or `Many-to-Many`.  |
|Data consistency  | Standardized values  | Maintain standardized values within columns to ensure consistency in filters and reporting.  | If you have a `Status` column, consistently use filters like `Open`, `Closed`, or `Pending`.  |
|Key performance indicators (KPIs)  | Predefined and relevant  | Establish a set of KPIs that are relevant to the business context and are commonly used in reports.  | `Return on Investment (ROI)`, `Customer Acquisition Cost (CAC)`, or `Lifetime Value (LTV)`.  |
|Refresh schedules  | Transparent and scheduled  | Clearly communicate the refresh schedules of the data to ensure users understand the timeliness of the data they're analyzing.  | Indicate if the data is real-time, daily, weekly, and so on.  |
|Security  | Role-level definitions  | Define security roles for different levels of data access if there are sensitive elements that not all users should see.  | Sales team members can see sales data but not HR data.  |
|Metadata  | Documentation of structure  | For reference, document the structure of the data model, including tables, columns, relationships, and measures.  | A data dictionary or model diagram provided as a reference.  |

The following table lists other criteria that can help you create accurate [Data Analysis Expressions (DAX) queries with Copilot](/dax/dax-copilot). These recommendations can help you generate accurate DAX queries.

|Element  | Consideration  | Description  | Example  |
|---------|---------|---------|-----|
|Measures, tables, and columns  | Descriptions  | In the description property, define each element and how you intend to use it. Note: Only the first 200 characters are used.  | [YOY Sales] description could be: Year-over-year (YOY) difference in Orders. Use with the `'Date'[Year]` column to show by years other than the latest year. Partial years compare to same period of the prior year. |
|Calculation groups | Descriptions | Calculation items aren't included in the model metadata. Use the description of the calculation group column to list and explain the use of the calculation items. Note: Only the first 200 characters are used. | For example, the [Time intelligence sample](/analysis-services/tabular-models/calculation-groups#time-intelligence-example) calculation group column could have this description: Use with measures and date table for Current: current value, MTD: month to date, QTD: quarter to date, YTD: year to date, PY: prior year, PY MTD, PY QTD, YOY: year over year change, YOY%: YOY as a %. A table with measures could expand on the usage with a description like: Measures are used to aggregate data. These measures can be shown as year-over-year by using this syntax CALCULATE([Measure Name], `Time intelligence`[Time calculation] = `YOY`) |

## Related content

- [Overview of Copilot for Power BI](copilot-introduction.md)
- [Create a report with Copilot for Power BI](copilot-create-report-service.md)
