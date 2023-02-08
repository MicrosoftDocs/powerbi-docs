---
title: Using row-level security with embedded content in Power BI embedded analytics
description: Learn about the steps you need to take to embed Power BI content within your application.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 01/07/2023
---

# Embed a report with token-based identity (SSO)

**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::&nbsp;App&nbsp;owns&nbsp;data :::image type="icon" source="../../includes/media/no-icon.svg" border="false":::&nbsp;User&nbsp;owns&nbsp;data

The **token-based identity** allows you to specify the effective identity for an embed token using an [Azure Active Directory (Azure AD) access token](/azure/databricks/dev-tools/api/latest/aad/app-aad-token) for an **Azure SQL Database**.

Customers that keep their data in **Azure SQL Database** can manage users and their access to data in Azure SQL when integrating with **Power BI Embedded**.

When generating the embed token, specify the effective identity of a user in Azure SQL. You can specify the effective identity of a user by passing the Azure AD access token to the server. The access token is used to pull only the relevant data for that user from Azure SQL, for that specific session.

It can be used to manage each user's view in Azure SQL or to sign in to Azure SQL as a specific customer in a multi-tenant DB. It can also apply row-level security on that session in Azure SQL and retrieve only the relevant data for that session, removing the need to manage RLS in Power BI.

Such effective identity issues apply to RLS rules directly on the Azure SQL Server. Power BI Embedded uses the provided access token when querying data from the Azure SQL Server. The UPN of the user (for which the access token was provided) is accessible as a result of the USER_NAME() SQL function.

The token-based identity only works for DirectQuery models on a capacity - connected to an Azure SQL Database, which is configured to allow Azure AD authentication ([learn more about Azure AD authentication for Azure SQL Database](/azure/sql-database/sql-database-manage-logins)). The dataset's data source must be configured to use end users' OAuth2 credentials, to use a token-based identity.

   :::image type="content" source="media/rls-sso/token-based-configure-azure-sql-db.png" alt-text="Screenshot of configure Azure SQL server.":::

## Token-based identity SDK additions

The identity blob property was added to our effective identity in the token generation scenario.

```JSON
[JsonProperty(PropertyName = "identityBlob")]
public IdentityBlob IdentityBlob { get; set; }
```

The IdentityBlob type is a simple JSON structure holding a value string property

```JSON
[JsonProperty(PropertyName = "value")]
public string value { get; set; }
```

The EffectiveIdentity can be created with identity blob using the following call:

```C#
public EffectiveIdentity(string username, IList<string> datasets, IList<string> roles = null, string customData = null, IdentityBlob identityBlob = null);
```

Identity blob can be created using the following call.

```C#
public IdentityBlob(string value);
```

## Token-based identity REST API usage

If you're calling the [REST API](/rest/api/power-bi/embedtoken/reports_generatetokeningroup#definitions), you can add identity blob inside each identity.

```JSON
{
    "accessLevel": "View",
    "identities": [
        {
            "datasets": ["fe0a1aeb-f6a4-4b27-a2d3-b5df3bb28bdc"],
        "identityBlob": {
            "value": "eyJ0eXAiOiJKV1QiLCJh…."
         }
        }
    ]
}
```

The value provided in the identity blob should be a valid access token to Azure SQL Server.

   > [!Note]
   > To be able to create an access token for Azure SQL, the application must have **Access Azure SQL DB and Data Warehouse** delegated permission to **Azure SQL Database** API on Azure AD app registration configuration in the Azure portal.

  :::image type="content" source="media/rls-sso/token-based-app-reg-azure-portal.png" alt-text="Screenshot of token based app registration." lightbox="media/rls-sso/token-based-app-reg-azure-portal.png":::

## Next steps

* [Generate an embed token](./generate-embed-token.md)
* [Row-Level security (RLS) with Power BI](../../enterprise/service-admin-rls.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
