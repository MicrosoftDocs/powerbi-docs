---
title: Report server support for AlwaysEncrypted
description: To refresh data in your Power BI report, a scheduled refresh plan must be created.
author: maggiesMSFT
ms.reviewer: kayu

ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 01/02/2020
ms.author: maggies

---
# Part I: Always Encrypted User Isolation

At this time, PBIRS does not restrict access to always encrypted columns in reports if a user has access to the report.  This means that If the server has been given access to the Column Encryption Keys via the Column Master Key, then users have access to all of the columns for the reports they can access.

Part II: Always Encrypted Column Usage

1. Key Storage Strategies

1.
  1. Windows Certificate Store -Supported
  2. Azure Key Vault - Not Directly Supported
  3. CNG - Not Directly Supported
2. Column Encryption Strategy

1.
  1. Deterministic –

1.
  1.
    1.  Can be read as-is in the results of a query. E.g. SELECT statements
    2.  Can be used as a Group by Entity within the query.
    3. Cannot be used as an aggregate field, except for Count and distinct.
    4.  Can be used as a report parameter
  2. Randomized –

1.
  1.
    1. Can be read as-is in the results of a query. E.g. SELECT statements
    2. Cannot be used as a Group By entity within the query.
    3. Cannot be used as an aggregate field.
    4. Cannot be used as a report parameter
2. Parameter Usage (Deterministic encryption only)

1.
  1. Single Value Parameter.  A single-value parameter can be used against an Always Encrypted column
  2. Multi-Value Parameter. A multi-value parameter with more than one value cannot be used against an Always Encrypted column.
  3. Cascading Parameters.

1.
  1.
    1.  Cascading Parameters can be used with AE in the following situations:

1.
  1.
    1.
      1. All AE Columns must be AE encrypted with Deterministic strategy
      2. All parameters used against AE Columns are single-value parameters
      3. All SQL comparisons are used with the equals operator
2. Datatype Support

| Sql Data type | Supports Reading Field | Supports Use as Group By Element | Supported Aggregations (count, distinct, max, min, sum, etc) | Supports filtering via equality using parameters | Notes |
| --- | --- | --- | --- | --- | --- |
| int | Yes | Yes | Count,distinct | Yes – as Integer |   |
| float | Yes | Yes | Count,distinct | Yes – as Float |   |
| nvarchar | Yes | Yes | Count,distinct | Yes – As Text |   |
| varchar | Yes | Yes | Count,distinct | No |   |
| decimal | Yes | Yes | Count,distinct | No |   |
| numeric | Yes | Yes | Count,distinct | No |   |
| datetime | Yes | Yes | Count,distinct | No |   |
| datetime2 | Yes | Yes | Count,distinct | Yes\* - As Date/Time | Supported if column has  no millisecond precision. I.e. datetime2(0) |

1. Aggregation alternatives

1.
  1. Currently the only supported aggregations against Deterministic AE Columns are those that directly use the equals operator. This is a SQL limitation due to the nature of Always Encrypted columns.  To aggregate, users must perform the aggregation within the report instead of in the database.

## Next steps
To learn more about creating and modifying schedules, see [Create, modify, and delete schedules](https://docs.microsoft.com/sql/reporting-services/subscriptions/create-modify-and-delete-schedules).

For information on how to troubleshoot scheduled refresh, see [Troubleshoot scheduled refresh in Power BI Report Server](scheduled-refresh-troubleshoot.md).

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

