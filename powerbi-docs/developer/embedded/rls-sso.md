---
title: Dynamic row-level security embedding with SSO
description: Dynamic RLS embedding with single sign-on services 
author: mberdugo
ms.author: monaberdugo
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 06/30/2022
#Customer intent: As an ISV with an on-prem dataset model, I want embed reports for my customers using RLS to maintain privacy and security.
---
# Embed a report on a single sign-on system (SSO)

This article explains how to implement a [single sign-on (SSO)](pbi-glossary.md#single-sign-on-sso) dataset, with or without [**RLS** (row-level security)](embedded-row-level-security.md), and embed it in a Power BI report.

> [!NOTE]
> This article is only relevant for app owns data customers.

In this scenario, the Power BI SSO (single sign-on) enabled dataset connects to an [on-premises](pbi-glossary.md#on-premises-on-prem) data source. The dataset then filters the data according to the RLS credentials of the user, and uses the filtered data in the report.

The ISV app needs to connect to the data source using the user's credentials.

To implement RLS with an SSO enabled dataset, do the following steps:

* [Generate an SQL token](#generate-an-sql-access-token)
* [Generate an embed token](#generate-an-embed-token)

## Setup and supported datasources

Before you start, make sure that you have:

* An Azure SQL DirectQuery dataset with [SSO enabled](/connect-data/service-azure-sql-database-with-direct-connect#single-sign-on).
* A datasource [configured with RLS](/power-bi/admin/service-admin-rls).

## Generate an SQL access token

A service principal can't pass any credentials to the data source. A master user can pass its own credentials, but not different credentials for each user. For the data source to know which data to return, create an [access token](/azure/databricks/dev-tools/api/latest/aad/) for the SQL database with the specific user's credentials. When this token is passed to the data source, the data source returns only the data that user can access.

/azure/databricks/dev-tools/api/latest/aad/app-aad-token
/azure/databricks/dev-tools/api/latest/aad/app-aad-token#get-an-azure-ad-access-token

## Generate an embed token

### [Embed a multi-resource token](#tab/embed-new)

To generate and embed token for gen2:

* For a dataset *without* RLS
* For a dataset *with* RLS

### [Embed token old way](#tab/embed-old)

To generate an embed token:

* For a dataset *without* RLS:
  Pass the SQL token that was created for the user.

  The report rendered will have the `username` as the user that the SQL token was created for and the `effective identity` as the object ID of the service principal or master user that created the SQL token.

* For a dataset *with* RLS:
  Use the following credentials to create the embed token:

  * SQL token that was created for the user (object ID of the service principal)
  * Username: The role member (effective identity)
  * Role: The RLS security role that the username is a member of

  The report rendered will have the username as the user that the SQL token was created for and the effective identity as the role member (username).

In the following example, `France` is a member of the role `Country`. The effective identity in the rendered report would be France, while the username would be the user that the SQL token was created for.

SQL token: XXXXXXXXX

Username: France

Roles: Country

---

## Considerations and limitations

A service principal must provide an effective RLS identity with the username property defined.

## Next steps

> [!div class="nextstepaction"]
> [RLS guidance](../../guidance/rls-guidance.md)

> [!div class="nextstepaction"]
> [Generate an embed token](generate-embed-token.md#row-level-security)
