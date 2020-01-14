---
title: Use cascading parameters in paginated reports
description: Guidance for designing paginated reports using cascading parameters.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 01/14/2020
ms.author: v-pemyer
---

# Use cascading parameters in paginated reports

This article targets you as a report author designing Power BI [paginated reports](../paginated-reports-report-builder-power-bi.md). It provides scenarios for designing cascading parameters. Cascading parameters are report parameters with dependencies. When a report user selects a parameter value (or values) it's used to set available values for another parameter.

> [!NOTE]
> An introduction to cascading parameters—and how to configure them—isn't covered in this article. If you're not completely familiar with cascading parameters, we recommend you first read [Add Cascading Parameters to a Report (Report Builder and SSRS)](/sql/reporting-services/report-design/add-cascading-parameters-to-a-report-report-builder-and-ssrs).

## Design scenarios

There are two design scenarios for using cascading parameters. They can be used to:

- Limit _large sets_ of available items
- Present _relevant_ available items

### Example database

The examples described in this article are based on an Azure SQL database. The database records sales operations, and contains various tables storing resellers, products, and sales orders.

A table named **Reseller** stores one row for each reseller, and it contains many thousands of rows. The **Reseller** table has these columns:

- ResellerCode (integer)
- ResellerName
- Country-Region
- State-Province
- City
- PostalCode

There's a table named **Sales**, too. It stores sales order records, and it defines a foreign key relationship to the **Reseller** table, using the **ResellerCode** column.

### Example requirement

There's a requirement to develop a Reseller Profile report. The report must be designed to display information for a single reseller. It's not appropriate to have the report user enter the reseller code, as they rarely memorize them.

### Limit large sets of available items

Let's take a look at three example to help you limit large sets of available items. They are:

- [Filter by related columns](#filter-by-related-columns)
- [Filter by a grouping column](#filter-by-a-grouping-column)
- [Filter by service value](#filter-by-search-value)

#### Filter by related columns

In this example, the report user interacts with several report parameters, selecting country-region, state-province, city, and then postal code. A final parameter lists resellers that reside in that geographic location.

![Image shows five report parameters: Country-region, State-province, City, Postal Code, and Reseller. The first four have values set, and the Reseller list is filtered to only four items.](media/paginated-report-cascading-parameter/filter-by-related-columns-example.png)

Here's how you can develop the cascading parameters:

1. Create a dataset that retrieves distinct country-region values, using the following query statement:

  ```sql
  SELECT DISTINCT
    [Country-Region]
  FROM
    [Reseller]
  ORDER BY
    [Country-Region]
  ```

2. Create a dataset that retrieves distinct state-province values for the selected country-region, using the following query statement:

  ```sql
  SELECT DISTINCT
    [State-Province]
  FROM
    [Reseller]
  WHERE
    [Country-Region] = @CountryRegion
  ORDER BY
    [State-Province]
  ```

3. Create a dataset that retrieves distinct city values for the selected country-region, and the state-province, using the following query statement:

  ```sql
  SELECT DISTINCT
    [City]
  FROM
    [Reseller]
  WHERE
    [Country-Region] = @CountryRegion
    AND [State-Province] = @StateProvince
  ORDER BY
    [City]
  ```

4. Continue this pattern to create the postal code dataset.
5. Create a dataset to retrieve all resellers for the selected geographic values, using the following query statement:

  ```sql
  SELECT
    [ResellerCode],
    [ResellerName]
  FROM
    [Reseller]
  WHERE
    [Country-Region] = @CountryRegion
    AND [State-Province] = @StateProvince
    AND [City] = @City
    AND [PostalCode] = @PostalCode
  ORDER BY
    [ResellerName]
  ```

6. Create report parameters in the correct sequence, setting the available values to use their corresponding datasets
7. Ensure each dataset, except the first, map their query parameters to the report parameters.

> [!NOTE]
> The query parameters (prefixed with the @ symbol) shown in these examples could be embedded within SELECT statements, or passed to stored procedures.
>
> Generally, stored procedures are a better design approach. It's because their query plans are cached for quicker execution, and they allow you develop more sophisticated logic, when needed.
>
> Lastly, you should always ensure suitable indexes exist to support efficient data retrieval. Otherwise, your report parameters could be slow to populate, and the database could become overburdened. For more information about SQL Server indexing, see [SQL Server Index Architecture and Design Guide](/sql/relational-databases/sql-server-index-design-guide?view=sql-server-2017).

#### Filter by a grouping column

In this example, the report user interacts with a report parameter to select the first letter of the reseller. A second parameter lists resellers where the name commences with that letter.

![Image shows two report parameters: Group, and Reseller. The first parameter value is set to the letter A, and the Reseller list is filtered to many items that commence with that letter.](media/paginated-report-cascading-parameter/filter-by-grouping-column-example.png)

Here's how you can develop the cascading parameters:

1. Create a dataset to retrieve the first letters used by all resellers, using the following query statement:

  ```sql
  SELECT DISTINCT
    LEFT([ResellerName], 1) AS [ReportGroup]
  FROM
    [Reseller]
  ORDER BY
    [ReportGroup]
  ```

2. Create a dataset to retrieve all resellers that commence with the selected letter, using the following query statement:

  ```sql
  SELECT
    [ResellerCode],
    [ResellerName]
  FROM
    [Reseller]
  WHERE
    LEFT([ResellerName], 1) = @ReportGroup
  ORDER BY
    [ResellerName]
  ```

3. Create report parameters in the correct sequence, setting the available values to use their corresponding datasets
4. Ensure each dataset, except the first, map their query parameters to the report parameters.

Consider adding the grouping column in the **Reseller** table. When persisted and indexed, it would would deliver the most efficient result. You can do this by adding a persisted computed column. For more information, see [Specify Computed Columns in a Table](/sql/relational-databases/tables/specify-computed-columns-in-a-table).

```sql
ALTER TABLE [Reseller]
ADD [ReportGroup] AS LEFT([ResellerName], 1) PERSISTED
```

Using this technique opens up even greater potential. Consider the following script that adds a new grouping column to filter resellers by pre-defined bands of letters. It also creates an index to efficiently retrieve the data required by the report parameters.

```sql
ALTER TABLE [Reseller]
ADD [ReportGroup2] AS CASE
  WHEN [ResellerName] LIKE '[A-C]%' THEN 'A-C'
  WHEN [ResellerName] LIKE '[D-H]%' THEN 'D-H'
  WHEN [ResellerName] LIKE '[I-M]%' THEN 'I-M'
  WHEN [ResellerName] LIKE '[N-S]%' THEN 'N-S'
  WHEN [ResellerName] LIKE '[T-Z]%' THEN 'T-Z'
  ELSE '[Other]'
END PERSISTED
GO

CREATE NONCLUSTERED INDEX [Reseller_ReportGroup2]
ON [Reseller] ([ReportGroup2]) INCLUDE ([ResellerCode], [ResellerName])
GO
```

#### Filter by search value

In this example, the report user interacts with a report parameter to enter a search value. A second parameter lists resellers where the name contains the value.

![Image shows two report parameters: Search, and Reseller. The first parameter value is set to the text "red", and the Reseller list is filtered to many items that contain that text.](media/paginated-report-cascading-parameter/filter-by-search-value-example.png)

Here's how you can develop the cascading parameters:

1. Create **Search** and **Reseller** report parameters, in that order.
1. Create a dataset to retrieve all resellers that contain the search text, using the following query statement:

  ```sql
  SELECT
    [ResellerCode],
    [ResellerName]
  FROM
    [Reseller]
  WHERE
    [ResellerName] LIKE '%' + @Search + '%'
  ORDER BY
    [ResellerName]
  ```

3. Configure the **Reseller** report parameter to use the dataset, mapping the **@Search** query parameter to the **Search** report parameter.

> [!TIP]
> You could modify this design to one that provides more options for your report users. If you let them know they can use wildcard characters, they can enter their own pattern matching value. For example, the search value "red%" would filter to resellers with names that _commence_ with "red".
>
> For more information, see [LIKE (Transact-SQL)](/sql/t-sql/language-elements/like-transact-sql?view=sql-server-ver15#using-the--wildcard-character).

```sql
WHERE
  [ResellerName] LIKE @Search
```

### Present relevant available items

TODO

## Recommendations

Whenever possible, we recommend you design your reports with cascading parameters. It's because they can:

- Provide intuitive and helpful experiences for your report users
- Deliver efficiencies, by retrieving smaller sets of available values

When possible, be sure to optimize your data sources by:

- Using stored procedures, whenever possible
- Adding appropriate indexes for efficient data retrieval
- Materializing data rows, or column values, to avoid expensive query-time evaluations

## Next steps

For more information related to this article, check out the following resources:

- [Report parameters in Power BI Report Builder](../report-builder-parameters.md)
- [Add Cascading Parameters to a Report (Report Builder and SSRS)](/sql/reporting-services/report-design/add-cascading-parameters-to-a-report-report-builder-and-ssrs)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com)
