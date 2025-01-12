---
title: Use row-level security with token based identities
description: Learn about embedding single Power BI content within your application using token based, single sign-on (SSO) identities.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 11/09/2024
# customer intent: As an ISV, I want to learn how to embed Power BI content with token-based, single sign-on (SSO) identities so I can provide secure access to my customers' data.
---

# Embed a report with token-based identity (SSO)

[!INCLUDE[Customers yes Org no](../../includes/applies-embedded-app-yes-user-no.md)]

The **token-based identity** allows an ISV to use an [Microsoft Entra access token](/azure/databricks/dev-tools/api/latest/aad/app-aad-token) to pass the identity of a customer to an **Azure SQL database** managed in the customer's tenant.

ISV customers that keep and manage their data in **Azure SQL Database** can keep their data secure in their tenant when integrating with **Power BI Embedded** in the ISV app.

When generating the embed token, specify the identity of the user in Azure SQL by passing that user's Microsoft Entra access token for the Azure SQL server. The access token is then used to pull only the relevant data for that user from Azure SQL, for that specific session.

:::image type="content" source="media/rls-sso/pass-identity-using-token.png" alt-text="Schematic drawing showing ISV passing the effective identity to the SQL tenant and the customer passing an embed token back.":::

## Set up token-based identity

The token-based identity only works for DirectQuery models on a capacity connected to an Azure SQL Database that's configured to allow Microsoft Entra authentication. The semantic model's data source must be configured to use end users' OAuth2 credentials, to use a token-based identity. [Learn more about Microsoft Entra authentication for Azure SQL Database](/azure/sql-database/sql-database-manage-logins).

### [Set up in portal](#tab/portal)

1. From the Power BI portal, select **Semantic model > More Options (three dots) > Settings > Data source credentials > Edit credentials**.

   :::image type="content" source="media/rls-sso/dataset-settings.png" alt-text="Screenshot dataset settings option in Power BI portal.":::

1. Check the **OAuth2** option box.

   :::image type="content" source="media/rls-sso/token-based-configure-azure-sql-db.png" alt-text="Screenshot of configure Azure SQL server.":::

### [Set up with API](#tab/API)

Send a [Gateways - Update Datasource](/rest/api/power-bi/gateways/update-datasource) API call with `"useEndUserOAuth2Credentials" = True` and `"credentialType": "OAuth2"` for the desired semantic model. The request body should look something like this:

```json
{
  "credentialDetails": {
    "credentials": "{\"credentialData\":[{\"name\":\"accessToken\",\"value\":\"eyJ…\"}]}",
    "credentialType": "OAuth2",
    "encryptedConnection": "Encrypted",
    "encryptionAlgorithm": "None",
    "privacyLevel": "Organizational",
    "useEndUserOAuth2Credentials": true
  }
}
```

---

## Generate an identity token

To create an access token for Azure SQL, the app must have *Access Azure SQL DB and Data Warehouse* delegated permission to **Azure SQL Database** API on the Microsoft Entra app registration configuration in the Azure portal.

:::image type="content" source="media/rls-sso/api-permissions.png" alt-text="Screenshot of Microsoft Entra app registration configuration settings in the Azure portal.":::
Authenticate and acquire a token for the user from the [Azure AD v2 endpoint](https://login.microsoftonline.com/organizations/oauth2/v2.0/token) for the following scope: `https://database.windows.net/.default`

See the following MSAL code samples for help:

- [Code samples for Microsoft identity platform authentication and authorization](/azure/active-directory/develop/sample-v2-code?tabs=apptype) - Microsoft Entra | Microsoft Learn
- [Microsoft identity platform and OAuth 2.0 authorization code flow](/azure/active-directory/develop/v2-oauth2-auth-code-flow)

### Generate embed token

To Embed a report with token-based identity, generate an embed token that contains the token base identity of the desired ISV user.
See the following examples for generating embed tokens for different scenarios.

#### [Power BI report with SSO](#tab/Power-BI-report-with-SSO)

```json
{
  "datasets": [
    {
      "id": "66ba5010-xxxx-xxxx-xxxx-f2bf0125abeb",
    }
  ],
  "reports": [
    {
      "allowEdit": false,
      "id": "9e6da541-xxxx-xxxx-xxxx-7d9442827cce"
    }
  ],
  "datasourceIdentities": [
    {
      "identityBlob": "eyJ…",
      "datasources": [
        {
          "datasourceType": "Sql",
          "connectionDetails": {
            "server": "YourServerName.database.windows.net",
            "database": "YourDataBaseName"
          }
        }
      ]
    }
  ]
}
```

#### [Paginated report with SSO](#tab/Paginated-report-with-SSO)

```json
{
  "reports": [
    {
      "allowEdit": false,
      "id": "2b0a27c7-xxxx-xxxx-xxxx-4d2036b42f90"
    }
  ],
  "datasourceIdentities": [
    {
      "identityBlob": "eyJ…",
      "datasources": [
        {
          "datasourceType": "Sql",
          "connectionDetails": {
            "server": "YourServerName.database.windows.net",
            "database": "YourDataBaseName"
          }
        }
      ]
    }
  ]
}
```

#### [Power BI report with SSO and RLS on the semantic model](#tab/report-with-sso-and-rls)

<!--
```json
{
  "datasets": [
    {
      "id": "fff1a505-xxxx-xxxx-xxxx-e69f81e5b974",
      "xmlaPermissions": "ReadOnly"
    }
  ],
  "reports": [
    {
      "allowEdit": false,
      "id": "10ce71df-xxxx-xxxx-xxxx-814a916b700d"
    }
  ],
  "identities": [
    {
      "username": "YourUsername",
      "datasets": [
        "fff1a505-xxxx-xxxx-xxxx-e69f81e5b974"
      ],
      "roles": [
        "YourRole"
      ]
    }
  ],
  "datasourceIdentities": [
    {
      "identityBlob": "eyJ…",
      "datasources": [
        {
          "datasourceType": "Sql",
          "connectionDetails": {
            "server": "YourServerName.database.windows.net",
            "database": "YourDataBaseName"
          }
        }
      ]
    }
  ]
}
```
-->

```json
{
  "datasets": [
    {
      "id": "fff1a505-xxxx-xxxx-xxxx-e69f81e5b974",
    }
  ],
  "reports": [
    {
      "allowEdit": false,
      "id": "10ce71df-xxxx-xxxx-xxxx-814a916b700d"
    }
  ],
  "identities": [
    {
      "username": "YourUsername",
      "datasets": [
        "fff1a505-xxxx-xxxx-xxxx-e69f81e5b974"
      ],
      "roles": [
        "YourRole"
      ]
    }
  ],
  "datasourceIdentities": [
    {
      "identityBlob": "eyJ…",
      "datasources": [
        {
          "datasourceType": "Sql",
          "connectionDetails": {
            "server": "YourServerName.database.windows.net",
            "database": "YourDataBaseName"
          }
        }
      ]
    }
  ]
}
```

#### [Paginated report connected to Power BI semantic model with RLS, and SSO data source that is connected with DirectQuery to another Power BI dataset](#tab/paginated-report-rls-directquery)

```json
{
  "datasets": [
    {
      "id": "35a4a948-xxxx-xxxx-xxxx-2e6ad7a02dc7",
      "xmlaPermissions": "ReadOnly"
    },
    {
      "id": "064ef46d-xxxx-xxxx-xxxx-fd6dda7a467b",
      "xmlaPermissions": "ReadOnly"
    }
  ],
  "reports": [
    {
      "allowEdit": false,
      "id": "9e81ebf7-xxxx-xxxx-xxxx-5a6294b43d55"
    }
  ],
  "identities": [
    {
      "username": "YourUsename",
      "datasets": [
        "35a4a948-xxxx-xxxx-xxxx-2e6ad7a02dc7"
      ],
      "roles": [
        "YourRole"
      ]
    }
  ],
  "datasourceIdentities": [
    {
      "identityBlob": "eyJ…",
      "datasources": [
        {
          "datasourceType": "Sql",
          "connectionDetails": {
            "server": " YourServerName.database.windows.net",
            "database": " YourDatabaseName "
          }
        }
      ]
    }
  ]
}
```

---

The following example shows an embedded Power BI report with SSO and RLS applied to the dataset:

:::image type="content" source="media/rls-sso/report-example.png" alt-text="Screenshot of an embedded Power BI report with SSO and RLS applied to the dataset.":::
