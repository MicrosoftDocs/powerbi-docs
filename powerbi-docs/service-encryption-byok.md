---
title: BYOK (Preview)
description: BYOK (Preview).
author: mgblythe
ms.author: mblythe
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 04/17/2019

LocalizationGroup: Premium
---

# BYOK (Preview)

Power BI encrypts data *at rest* and *in process*. By default, Power BI uses Microsoft-managed keys to encrypt your data, but in Power BI Premium you can also use your own keys for data at rest. This approach is often described as *bring your own key* (BYOK).

Why use your own key? BYOK gives you more flexibility, so that you can create, rotate, disable, and define access controls. BYOK also enables you to audit the encryption keys used to protect your data.

## Encryption in Power BI

In this section, we provide some basic information so you can understand the BYOK process. For detailed information about encryption in Power BI, see [Power BI data storage and movement](whitepaper-powerbi-security.md#data-storage-and-movement).

The following diagram shows the components of a PBIX file that is hosted in the Power BI service.

![PBIX file components](media/service-encryption-byok/pbix-file-components.png)

- Who can access which reports? Who is the owner?
- Which visuals? Which tiles? How many tabs?
- How many tables? What are the column formats? Is incremental refresh enabled? And so on.
- Connection strings and credentials
- Aggregate data model
- Stored images
- Caches of queries for faster processing

TODO: Decide on image style, use of numbers, etc. Clean up the list above. What are "stored images"?

Data and metadata for the components are stored in two places: Azure SQL Database and Azure Blob storage. The following diagram shows the storage and encryption used for each component.

![PBIX file component encryption](media/service-encryption-byok/encryption-approaches.png)

1. Azure SQL database, using [Transparent Data Encryption](/azure/sql-database/transparent-data-encryption-azure-sql).
2. Azure SQL database, using [Always Encrypted](/azure/sql-database/sql-database-always-encrypted-azure-key-vault). For on-premises data sources, Power BI also uses the on-premises data gateway key.
3. Azure storage blobs, using [client side encryption](/azure/storage/common/storage-client-side-encryption). 

TODO: Where is the key specified for gateway? What is the right content link for client side + is client side only for BYOK or does PBI use that by default?

In this preview release, we support BYOK for the components in Azure Blob storage: datasets, PBIX and XLSX artifacts, and query result caches. In the next section you learn how to enable BYOK on your tenant.

## Enable BYOK on your tenant

Azure key vault
Tenant-level (define tenant)

## Rotate and revoke keys

## Next steps

[Power BI data storage and movement](whitepaper-powerbi-security.md#data-storage-and-movement)
[Azure Storage Service Encryption for data at rest](/azure/storage/common/storage-service-encryption?toc=%2fazure%2fstorage%2fblobs%2ftoc.json)
[Storage Service Encryption using customer-managed keys in Azure Key Vault](/azure/storage/common/storage-service-encryption-customer-managed-keys)

TODO: Links OK, or swap out first Azure storage one with .NET link from above?