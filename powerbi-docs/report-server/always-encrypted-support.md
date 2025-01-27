---
title: Always Encrypted in Power BI Report Server
description: This article spells out Always Encrypted support in Power BI Report Server when using the data source types Microsoft SQL Server and Microsoft Azure SQL Database.
author: kfollis
ms.author: kfollis
ms.reviewer: cfinlan
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 01/22/2020
---
# Always Encrypted in Power BI Report Server

This article spells out Always Encrypted support in Power BI Report Server when using the data source types Microsoft SQL Server and Microsoft Azure SQL Database. For more information about Always Encrypted capabilities in SQL Server, see the [Always Encrypted](/sql/relational-databases/security/encryption/always-encrypted-database-engine) article.

## Always Encrypted user isolation

At this time, Power BI Report Server doesn't restrict access to Always Encrypted columns in reports if a user has access to the report.  Therefore if the server has been given access to the column encryption keys via the column master key, then users have access to all the columns for the reports they can access.

## Always Encrypted column usage

### Key storage strategies

|Storage  |Supported  |
|---------|---------|
|Windows Certificate Store | Yes |
|Azure Key Vault | No |
| Cryptography Next Generation (CNG) | No |

### Certificate storage and access

The account that requires access to the certificate is the service account. The certificate should be stored in the local computer certificate store. For more information, see:

- [Configure the Report Server Service Account](/sql/reporting-services/install-windows/configure-the-report-server-service-account-ssrs-configuration-manager) (Configuration Manager)
- [Making certificates available to applications and users](/sql/relational-databases/security/encryption/create-and-store-column-master-keys-always-encrypted#making-certificates-available-to-applications-and-users) section in the SQL Server article "Create and store column master keys for Always Encrypted."

### Column encryption strategy

In Power BI Report Server, the column encryption strategy can be *deterministic* or *randomized*. The following table spells out differences, depending on which strategy it uses.

|Use  |Deterministic  |Randomized  |
|---------|---------|---------|
|Can be read as-is in the results of a query, for example, SELECT statements. | Yes  | Yes  |
|Can be used as a Group By entity within the query. | Yes | No |
|Can be used as an aggregate field, except for COUNT and DISTINCT. | No, except for COUNT and DISTINCT | No |
|Can be used as a report parameter | Yes | No |

Read more about [deterministic vs. randomized encryption](/sql/relational-databases/security/encryption/always-encrypted-database-engine#selecting--deterministic-or-randomized-encryption).

### Parameter usage

Parameter usage only applies to deterministic encryption.

**Single-value parameter**.  You can use a single-value parameter against an Always Encrypted column.

**Multi-value parameter**. You can't use a multi-value parameter with more than one value against an Always Encrypted column.

**Cascading parameters**. You can use cascading parameters with Always Encrypted if *all* the following are true:

- All Always Encrypted columns must be Always Encrypted with deterministic strategy.
- All parameters used against Always Encrypted columns are single-value parameters.
- All SQL comparisons use the Equals (=) operator.

## Datatype support

| SQL Data type | Supports reading field | Supports use as Group By element | Supported aggregations (COUNT, DISTINCT, MAX, MIN, SUM, etc.) | Supports filtering via equality using parameters | Notes |
| --- | --- | --- | --- | --- | --- |
| int | Yes | Yes | COUNT, DISTINCT | Yes, as Integer |   |
| float | Yes | Yes | COUNT, DISTINCT | Yes, as Float |   |
| nvarchar | Yes | Yes | COUNT, DISTINCT | Yes, as Text | Deterministic encryption must use a column collation with a binary2 sort order for character columns. See the SQL Server [Always Encrypted](/sql/relational-databases/security/encryption/always-encrypted-database-engine#selecting--deterministic-or-randomized-encryption) article for details.  |
| varchar | Yes | Yes | COUNT, DISTINCT | No |   |
| decimal | Yes | Yes | COUNT, DISTINCT | No |   |
| numeric | Yes | Yes | COUNT, DISTINCT | No |   |
| datetime | Yes | Yes | COUNT, DISTINCT | No |   |
| datetime2 | Yes | Yes | COUNT, DISTINCT | Yes, as Date/Time | Supported if column has no millisecond precision (in other words, no datetime2(0)) |

## Aggregation alternatives

Currently the only supported aggregations against deterministic Always Encrypted columns are those aggregations that directly use the Equals (=) operator. This SQL Server limitation is due to the nature of Always Encrypted columns. Users must aggregate within the report instead of in the database.

## Always Encrypted in connection strings

You need to to enable Always Encrypted in the connection string for a SQL Server data source. Read more about enabling [Always Encrypted in application queries](/sql/relational-databases/security/encryption/develop-using-always-encrypted-with-net-framework-data-provider#enabling-always-encrypted-for-application-queries).

## Related content

- [Always Encrypted](/sql/relational-databases/security/encryption/always-encrypted-database-engine) in SQL Server and Azure SQL Database

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)