---
title: Dynamic row-level security embedding with SSO
description: Dynamic RLS embedding with single sign-on services 
author: mberdugo
ms.author: monaberdugo
ms.reviewer: mberdugo
editor: mberdugo
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 05/10/2022
#Customer intent: As an ISV with an on-prem dataset model, I want embed reports for my customers using RLS to maintain privacy and security.
---
# Embed a report with row-level security on a single sign-on system (SSO)

This article explains how to implement [**RLS** (row-level security)](embedded-row-level-security.md) with an [single sign-on (SSO)](pbi-glossary.md#single-sign-on-sso) dataset, and embed it in a Power BI report.

In this scenario, the Power BI SSO (single sign-on) enabled dataset connects to an [on-prem](pbi-glossary.md#on-premises-on-prem) data source. The dataset then filters the data according to the RLS credentials of the user, and uses the filtered data in the report.

The ISV app needs to connect to the data source using the user's credentials.

To implement RLS with an SSO enabled dataset, do the following steps:

* [Generate an SQL token](#generate-an-sql-token)
Just like in portal and SSAS

* [Generate an embed token](#generate-an-embed-token)

## Prerequisites

Before you start, make sure that you have:

* An Azure SQL DirectQuery dataset with [SSO enabled](/connect-data/service-azure-sql-database-with-direct-connect#single-sign-on).
* A dataset [configured with RLS](/power-bi/admin/service-admin-rls).

## Generate an SQL token

A service principal can't pass any credentials to the data source. A master user can pass its own credentials, but not different credentials for each user. For the data source to know which data to return, create an [access token](/azure/databricks/dev-tools/api/latest/aad/) for the SQL database with the specific user's credentials. When this token is passed to the data source, the data source returns only the data that user can access.

## Generate an embed token

To generate an embed token:

* For a dataset that doesn't have RLS, just pass the SQL token that was created for the user.

  The report rendered will have the `username` as the user that the SQL token was created for and the `effective identity` as the object ID of the service principal or master user that created the SQL token.

* For a dataset with RLS:
  Use the following credentials to create the embed token:

  * SQL token that was created for the user (object ID of the service principal)
  * Username: The role member
  * Role: The RLS security role that the username is a member of

  The report rendered will have the username as the user that the SQL token was created for and the effective identity as the role member (username).

In the following example, `France` is a member of the role `CountryDynamic`. The effective identity in the rendered report would be France, while the username would be the user that the SQL token was created for.

SQL token: XXXXXXXXX
Username: France
Roles: CountryDynamic

## Considerations and limitations

## Next steps
