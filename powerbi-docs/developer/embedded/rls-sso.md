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

[!INCLUDE[Customers yes Org no](../../includes/applies-embedded-app-yes-user-no.md)]

The **token-based identity** allows an ISV to use an [Azure Active Directory (Azure AD) access token](/azure/databricks/dev-tools/api/latest/aad/app-aad-token) to pass the identity of a customer to an **Azure SQL database** managed in the customer tenant.

ISV customers that keep and manage their data in **Azure SQL Database** can keep their data secure in their tenant when integrating with **Power BI Embedded** in the ISV app.

When generating the embed token, specify the identity of the user in Azure SQL by passing that user's Azure AD access token for the Azure SQL server. The access token is used to pull only the relevant data for that user from Azure SQL, for that specific session.

:::image type="content" source="media/rls-sso/pass-identity-using-token.png" alt-text="Schematic drawing showing ISV passing the effective identity to the SQL tenant and the customer passing an embed token back.":::

## Set up token-based identity

The token-based identity only works for DirectQuery models on a capacity - connected to an Azure SQL Database, which is configured to allow Azure AD authentication ([learn more about Azure AD authentication for Azure SQL Database](/azure/sql-database/sql-database-manage-logins)). The dataset's data source must be configured to use end users' OAuth2 credentials, to use a token-based identity.

### [Set up in portal](#tab/portal)

1. From the Power BI portal,select **Dataset > Settings > Data source credentials > More Options**.

   :::image type="content" source="media/rls-sso/dataset-settings.png" alt-text="Screenshot dataset settings option in Power BI portal.":::

1. Check the **OAuth2 option** box.

   :::image type="content" source="media/rls-sso/token-based-configure-azure-sql-db.png" alt-text="Screenshot of configure Azure SQL server.":::

### [Set up with API](#tab/API)

Send a [Gateways - Update Datasource API](/rest/api/power-bi/gateways/update-datasource) call with `useEndUserOAuth2Credentials = True` for the desired dataset. The request body should look as follows:


---

## Token-based identity SDK additions

```json
{
  "credentialDetails": {
    "credentials": "{\"credentialData\":[{\"name\":\"accessToken\",\"value\":\"eyJ…"}]}",
    "credentialType": "OAuth2",
    "encryptedConnection": "Encrypted",
    "encryptionAlgorithm": "None",
    "privacyLevel": "Organizational",
    "useEndUserOAuth2Credentials": true
  }
}
```

---
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
