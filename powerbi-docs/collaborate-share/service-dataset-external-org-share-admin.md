---
title: Share B2B datasets with external guest users (Preview)
description: See information about the in-place dataset sharing with external users that Power BI administrators need to be aware of.
author: ajburnle
ms.author: ajburnle
manager: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 09/19/2022
LocalizationGroup: Administration
---

# Use in-place dataset sharing to enable external users to view and share datasets in their own tenants (Preview) - Admin info


## Requirements

To use the Power BI in-place dataset sharing, you'll need to enable access for external guest users with Azure AD B2B. For a full list of requirements necessary to use in-place datset sharing, see the requirements section of [About Power BI in-place dataset sharing with guest users in external organizations](./service-dataset-external-org-share-about.md#requirements).

## Licensing

Users must have an active Power BI account and a Power BI Pro or Premium license.

## Allow guest users to work with shared datasets in their own tenants 

Azure AD B2B guest users can access datasets shared with them in their own tenants. Use the following steps to enable access by external users of datasets shared with them by users within your organization: 

1. In the admin portal, go to **tenant settings**.

1. Click on **allow guest users to work with shared datasets in their own tenants**.
 
1. Click the toggle to **enable**.

> [!NOTE]
> If this setting is disabled, the guest user can still access the dataset in the provider tenant but not in their own tenant.

## Allow specific users to turn on external data sharing 

As a Power BI admin, you can specify which users or user groups can share datasets externally with guests from a different tenant through in-place mechanism. Disabling this setting prevents any user from sharing datasets externally by restricting the ability for users to turn on external sharing for datasets they own or manage.  

1. In the admin portal, go to **tenant settings**.

1. Click on **Allow specific users to turn on external data sharing**.

1. Click the toggle to **enable**.

1. Specify if you want this setting to apply to **The entire organization**, **Specific security groups**, or exclude specific security groups. Click the check box next **Except specific security groups** to add any groups you want to exclude.
 
1. Click **Apply**.

## Next steps