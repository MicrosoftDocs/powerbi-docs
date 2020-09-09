---
title: Use customer-managed keys in Power BI
description: Learn how to use customer-managed keys in Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 08/12/2020
LocalizationGroup: Premium
---

# Use customer-managed keys in Power BI

Power BI encrypts data at rest and in process. By default, Power BI uses Microsoft-managed keys to encrypt your data. Organizations can choose to use their own keys for encryption of user content at rest across Power BI, from report images to imported datasets in Premium capacities. 

## Why use customer-managed keys
With Power BI customer-managed keys (CMK), organizations can meet compliance requirements for data encryption at rest with their cloud service provider (in this case, Microsoft). CMK enables organizations to encrypt their Power BI user content with a key they provide and manage. Revoking a customer-managed key makes user content within Power BI unreadable for everyone within an hour, including Microsoft. Compared to the BYOK offering, CMK also covers user content outside of Power BI Premium capacities, it enforces stricter caching policies, and by default enables BYOK on all capacities. 
 
## How to use customer-managed keys
To opt in to Power BI customer-managed keys, your organization must meet size requirements. Your organization’s global administrator must submit a support request to Microsoft, or they can contact your organization’s Microsoft account manager to learn more about the process.  


## Next steps

The following links provide information that can be useful for customer-managed keys:

* [Bring your own encryption keys for Power BI](service-encryption-byok.md)
* [Configure Multi-Geo support for Power BI Premium](service-admin-premium-multi-geo.md)
* [How capacities function](service-premium-what-is.md#how-capacities-function)
* [Incremental refresh](service-premium-incremental-refresh.md).
