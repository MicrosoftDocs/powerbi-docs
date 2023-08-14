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

Send a [Gateways - Update Datasource API](/rest/api/power-bi/gateways/update-datasource) call with `useEndUserOAuth2Credentials = True` for the desired dataset. The request body should look something like this:

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

## Generate an identity token

### Set up Azure AD app registration

To create an access token for Azure SQL, the app must have *Access Azure SQL DB and Data Warehouse* delegated permission to **Azure SQL Database API** on the Azure AD app registration configuration in the Azure portal.

:::image type="content" source="media/rls-sso/api-permissions.png" alt-text="Screenshot of Azure AD app registration configuration settings in the Azure portal.":::

### Generate embed token

To Embed a report with token-based identity, we need to generate an embed token which contains the token base identity for the desired ISV user.
See the example below for generating embed token for different scenarios.

Example of generating an embed token for Power BI report with SSO:

```json
{
  "datasets": [
    {
      "id": "66ba5010-xxxx-xxxx-xxxx-f2bf0125abeb",
      "xmlaPermissions": "ReadOnly"
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

Example of generating an embed token for paginated report with SSO:

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

Example of generating an embed token for Power BI report with SSO and RLS on the dataset:

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

Example of generating an embed token for paginated report connected to Power BI dataset with RLS and SSO data source, that is connected with DirectQuery to another Power BI dataset:

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


## Next steps

* [Generate an embed token](./generate-embed-token.md)
* [Row-Level security (RLS) with Power BI](../../enterprise/service-admin-rls.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/).
