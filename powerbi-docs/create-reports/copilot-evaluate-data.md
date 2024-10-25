---
title: Update your data model to work well with Copilot for Power BI
description: Before you start using Copilot with your semantic model, evaluate your data to see if there are ways you can improve its performance.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: guptamaya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 01/23/2024
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
---

# Update your data model to work well with Copilot for Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Before you start using Copilot with your semantic model, evaluate your data. You may need to do some clean-up work on your semantic model so that Copilot can derive insights from it.

[!INCLUDE [copilot-notes](../includes/copilot-notes.md)]

## Considerations for semantic models for Copilot use

The following table lists the criteria to help you create accurate reports with Copilot. These items are recommendations that can help in generating accurate Power BI reports.  

|Element  | Consideration  | Description  | Example  |
|---------|---------|---------|-----|
|Table Linking  | Define Clear Relationships  | Ensure that all relationships between tables are clearly defined and logical, indicating which are one-to-many, many-to-one, or many-to-many.  | "Sales" table connected to "Date" table by "DateID" field.  |
|Measures  | Standardized Calculation Logic  | Measures should have standardized, clear calculation logic that is easy to explain and understand.  | "Total Sales" calculated as the sum of "SaleAmount" from the "Sales" table.  |
|Measures  | Naming Conventions  | Names for measures should clearly reflect their calculation and purpose.  | Use "Average_Customer_Rating" instead of "AvgRating".  |
|Measures  | Predefined Measures  | Include a set of predefined measures that users are most likely to request in reports.  | "Year_To_Date_Sales", "Month_Over_Month_Growth", etc.  |
|Fact Tables  | Clear Delineation  | Clearly delineate fact tables, which hold the measurable, quantitative data for analysis.  | "Transactions", "Sales", "Visits".  |
|Dimension Tables  | Supportive Descriptive Data  | Create dimension tables that contain the descriptive attributes related to the quantitative measures in fact tables.  | "Product_Details", "Customer_Information".  |
|Hierarchies  | Logical Groupings  | Establish clear hierarchies within the data, especially for dimension tables that could be used to drill down in reports.  | A "Time" hierarchy that breaks down from "Year" to "Quarter" to "Month" to "Day".  |
|Column Names  | Unambiguous Labels  | Column names should be unambiguous and self-explanatory, avoiding the use of IDs or codes that require further lookup without context.  | Use "Product_Name" instead of "ProdID".  |
|Column Data Types  | Correct and Consistent  | Apply correct and consistent data types for columns across all tables to ensure that measures calculate correctly and to enable proper sorting and filtering.  | Ensure numeric columns used in calculations are not set as text data types.  |
|Relationship Types  | Clearly Specified  | To ensure accurate report generation, clearly specify the nature of relationships (active or inactive) and their cardinality.  | Mark whether a relationship is "One-to-One", "One-to-Many", or "Many-to-Many".  |
|Data Consistency  | Standardized Values  | Maintain standardized values within columns to ensure consistency in filters and reporting.  | If you have a "Status" column, consistently use "Open", "Closed", "Pending", etc.  |
|Key Performance Indicators (KPIs)  | Predefined and Relevant  | Establish a set of KPIs that are relevant to the business context and are commonly used in reports.  | "Return on Investment (ROI)", "Customer Acquisition Cost (CAC)", "Lifetime Value (LTV)".  |
|Refresh Schedules  | Transparent and Scheduled  | Clearly communicate the refresh schedules of the data to ensure users understand the timeliness of the data they are analyzing.  | Indicate if the data is real-time, daily, weekly, etc.  |
|Security  | Role-Level Definitions  | Define security roles for different levels of data access if there are sensitive elements that not all users should see.  | Sales team members can see sales data but not HR data.  |
|Metadata  | Documentation of Structure  | Document the structure of the data model, including tables, columns, relationships, and measures, for reference.  | A data dictionary or model diagram provided as a reference.  |

The following table lists additional criteria to help you create accurate [DAX queries with Copilot](/dax/dax-copilot). These items are recommendations that can help in generating accurate DAX queries. 

|Element  | Consideration  | Description  | Example  |
|---------|---------|---------|-----|
|Measures, tables, and columns  | Descriptions  | Include what it is and how you intend each element to be used in the description property. Note: Only first 200 characters are used.  | [YOY Sales] description could be "Year-over-year (YOY) difference in Orders. Use with the 'Date'[Year] column to show by years other than the latest year. Partial years will compare to same period of prior year." |
|Calculation groups | Descriptions | Calculation items are not included in the model metadata. Use the description of the calculation group column to list and explain the use of the calculation items. Note: Only first 200 characters are used. | For example, the [Time intelligence sample](/analysis-services/tabular-models/calculation-groups?view=asallproducts-allversions#time-intelligence-example) calculation group column could have this description: "Use with measures & date table for Current: current value, MTD: month to date, QTD: quarter to date, YTD: year to date, PY: prior year, PY MTD, PY QTD, YOY: year over year change, YOY%: YOY as a %" and on a table with measures could expand on the usage a description such as "Measures are used to aggregate data. These measures can shown as year-over-year by using this syntax CALCULATE([Measure Name], 'Time intelligence'[Time calculation] = "YOY")" |

## Related content

- [Overview of Copilot for Power BI](copilot-introduction.md)
- [Create a report with Copilot for Power BI](copilot-create-report-service.md)
