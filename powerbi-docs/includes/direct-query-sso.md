---
title: include file
description: include file
services: powerbi
author: davidiseminger
 
ms.service: powerbi
ms.topic: include
ms.date: 11/10/2023
ms.author: davidi
---

## Single sign-on

After you publish an Azure SQL DirectQuery semantic model to the service, you can enable single sign-on (SSO) using Microsoft Entra ID OAuth2 for your end users.

To enable SSO, go to settings for the semantic model, open the **Data Sources** tab, and check the SSO box.

![Configure Azure SQL DQ dialog box](media/direct-query-sso/sso-dialog.png)

When the SSO option is enabled and your users access reports built atop the data source, Power BI sends their authenticated Microsoft Entra credentials in the queries to the Azure SQL database or data warehouse. This option enables Power BI to respect the security settings that are configured at the data source level.

The SSO option takes affect across all semantic models that use this data source. It does not affect the authentication method used for import scenarios.

> [!NOTE]
> For SSO to work properly, the semantic model must be on the same tenant as the Azure SQL resource.
