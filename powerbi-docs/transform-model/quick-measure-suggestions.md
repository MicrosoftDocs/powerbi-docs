---
title: Quick measure suggestions with Copilot
description: Suggestions with Copilot to help the creation of DAX measures using natural language, making it easier and faster to generate DAX formulas.
author: Sujata994
ms.author: sunaraya
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: concept-article
ms.date: 11/27/2024
LocalizationGroup: Create reports
#customer intent: As a Power BI user I want to know more about DAX measures using natural language.
---
# Quick measure suggestions with Copilot
Quick measure suggestions assist creation of DAX measures using natural language instead of using templates or writing DAX from scratch. Quick measure suggestions with Copilot feature are no longer available in public preview.

:::image type="content" source="media/quick-measure-suggestions/copilot-summary-internet-sales.png" alt-text="Screenshot of the Copilot pane with an example." lightbox="media/quick-measure-suggestions/copilot-summary-internet-sales.png":::

This feature can be used to jump-start creation of common DAX measures scenarios, such as:

- Aggregated columns (Optional filters)
- Count of rows (Optional filters)
- Aggregate per category
- Mathematical operations
- Selected value
- If condition
- Text operations
- Time intelligence
- Relative time filtered value
- Most / least common value
- Top N filtered value
- Top N values for a category
- Information functions

## Enable measure suggestions

To enable the feature, navigate to the **Options** menu of Power BI Desktop and turn on the preview switch for **Quick measure suggestions**:

Quick measure suggestions to assist creation of DAX formulas for [model measures](/power-bi/transform-model/desktop-tutorial-create-measures) using natural language is available in [DAX query view](/power-bi/transform-model/dax-query-view) using [Microsoft Fabric Copilot to write and explain DAX queries](/dax/dax-copilot). You can create measures in a DAX query that can be added to your model when you're ready. 

In addition, there are other features available to aggregate data in a visual. [Quick measures](/power-bi/transform-model/desktop-quick-measures) can help you create DAX measures using a template approach for commonly used measures, such as month-over-month change. [Visual calculations](/power-bi/transform-model/desktop-visual-calculations-overview) can create a DAX calculation such as running totals directly in a visual. 

The **Suggestions with Copilot** shows as disabled in Power BI Desktop versions before October 2024.

## Describe a measure

Here you can describe the measure you want to create and hit **Generate** (or enter key) to get DAX measure suggestions:

:::image type="content" source="media/quick-measure-suggestions/dax-measure-suggestion.png" alt-text="Screenshot of an example of a DAX measure suggestion.":::

You should always validate the DAX suggestions to make sure they meet your needs. If you’re satisfied with a suggested measure, you can click the **Add** button to automatically add the measure to your model.  

## Natural language examples
To help demonstrate the feature here are some natural language examples for each of the supported measure scenarios.

### Aggregated columns
Apply aggregations to a column to return a single value. Our supported aggregations include sum, count, distinct count, distinct count no blanks, average, min, max, median, variance, and standard deviation.

Examples:
-	Show me sum of sales
-	Get total sales
-	Count products
-	How many products are there
-	Unique users
-	Distinct count of users no blanks
-	Get the number of unique users and exclude blanks
-	What is the max price
-	Median age

#### Optional filters
For aggregated columns, you can also specify one or more filter conditions. If there are multiple filter conditions, you can specify if you want an intersection (&&/AND) or union (||/OR) of the filters.

Examples:
-	How many customers in London
-	Total sold units in 2022
-	Calculate sales where Product is Word and Region is North
-	Sales where Product is Word or Region is North
-	Sales filtered to Product is Word && Region is North
-	Sales for Product is Word || Region is North

### Count of rows
Count the number of records in the specified table. You don’t need to specify the table if there is only one table.

Examples:
- Count records of sales table
-	Count sales table
-	Sales table row count
-	Count rows of sales table

#### Optional filters
For row counts, you can also specify one or more filter conditions. If there are multiple filter conditions, you can specify if you want an intersection (&&/AND) or union (||/OR) of the filters.

Examples:
-	Count rows of sales table where Product is Word and Region is North
-	Count of sales table where Product is Word or Region is North
- Count record of sales table filtered to Product is Word && Region is North
- Get the row count of sales table for Product is Word || Region is North

### Aggregate per category
Compute a measure for each distinct value in a category and then aggregate the results to return a single value. Our supported aggregates include average, weighted average, min, max, variance.

Examples: 
-	Average sales per store
-	Average score per category weighted by priority
-	Min score per product
-	Max units per store

### Mathematical operations
Perform mathematical operations with numeric columns, measures, or aggregated columns. For scenarios across columns within a table, you can either average (AVERAGEX) or sum up (SUMX) the result in order to return a single value.

Examples: 
-	Sales - Cogs
-	Sales minus Cogs
-	Sales divided by target revenue times 100
-	Sales / target revenue * 100
-	EU Sales + JP Sales + NA Sales
-	For each row in Sales table calculate Price * Units and sum up the result
-	For each row in Sales table sum up Price * Units
-	For each row in Sales table calculate Price * Discount and then get the average
-	For the Sales table get the average of Price * Discount

### Selected value
Get the selected value of a column. This is typically used when paired with a single-select slicer or filter so that the measure returns a non-blank value.

Examples:
-	What is the selected product
-	Which product is selected
-	Selected value for product

### If condition
Return values based on conditions. If you are returning string values, you need to use double quotes. Conditions can use the following comparison operators: =, ==, <>, <, >, <=, >=

Examples:
-	If sales > 10,000 return "high sales" else "low sales"
-	If sales are greater than 10,000 display "high sales" otherwise display "low sales"
-	If selected value for product is blank, display "no product selected" else show selected product
-	If selected product = Power BI, show "PBI" else "other"

### Text operations
Perform text operations with columns, measures, or aggregated columns. For scenarios across columns within a table, we’ll merge (CONCATENATEX) the result in order to return a single value.

Examples:
-	"The selected product is " & selected product 
-	Display "The selected product is " concatenated with the selected product 
-	Header_measure & " - " & Subheader_measure
-	For each row in Geography Dim table concatenate State & ", " & City and combine the result
-	For each row in Geography Dim table get State & ", " & City and merge

### Time intelligence
These time intelligence scenarios require using a properly marked date table or auto date/time hierarchy. For YTD scenarios you can specify "fiscal" or "fiscal calendar" to base the calculation on the fiscal calendar (ends on June 30th).

Examples:
-	YTD sales
-	Sales fiscal YTD 
-	Get the sales year to date
-	Sales MTD
-	Quarter to date sales
-	YTD sales for US and Canada
-	Change of sales from the previous year
-	Sales YoY change
-	Month over month change for sales
-	Sales QoQ Percent change 
-	Sales for the same period last year
-	Sales for the same period last month
-	28 day rolling average sales
-	28 – day rolling avg sales

### Relative time filtered value
Apply a relative time filter that filters your measure or aggregated column to the last N hours / days / months / years.

Examples:
-	Unique users in the last 4 hours
-	Unique users in the last 5 days
-	Total sales for the last 6 months
-	Total sales for the last 2 years

### Most / least common value
Return the value with the most or least number of occurrences in a specified column.

Examples:
-	Most common value in Product
-	Which value in Product is most common
-	What is the most common value in Product
-	Which value in Product is least common
-	What is the least common value in Product

### Top N filtered value
Compute a measure or aggregated column that is filtered to the top N categorical values based on that same measure or aggregated column.

Examples:
-	Total sales for the top 3 products 
-	Sum of sales filtered to the top 3 products
-	Average score for the top 5 students
-	Avg score filtered to the top 5 students

### Top N values for a category
Get a concatenated list of the top N values within a column based on a measure or aggregated column.

Examples:
-	Top 3 products with the most total sales
-	Top 3 products by sales
-	What are the top 3 products in sales

### Information functions
Return system or user information such as the current date/time or the current user's email, domain, or username.

Examples:
- Today's date
-	Now 
-	Return the current user email
-	Return the current domain name and username
-	Return the current user’s domain login

## Limitations and considerations
- Quick measure suggestions are NOT a replacement for learning DAX. The suggestions provided by the feature are meant to help fast track measure creation; however, you still need to validate the DAX suggestions because they can be wrong or not match your intent.
- The feature isn't supported for LiveConnect data models.
-	The feature is powered by a machine learning model that is currently only deployed to US datacenters (East US and West US). If your data is outside the US, the feature is disabled by default unless your tenant admin enables **Allow user data to leave their geography tenant setting**:
 
:::image type="content" source="media/quick-measure-suggestions/quick-measure-suggestions-admin-setting.png" alt-text="Screenshot of the admin setting for measure suggestions.":::

## Related content
- [Use Data Analysis Expressions (DAX) documentation](/dax/)
- [Use quick measures for common calculations](desktop-quick-measures.md)
- [Create calculated columns in Power BI Desktop](desktop-calculated-columns.md)
- [Create calculated tables in Power BI Desktop](desktop-calculated-tables.md)

