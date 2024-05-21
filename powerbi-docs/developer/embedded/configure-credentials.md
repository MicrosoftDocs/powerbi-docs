---
title: Configure credentials programmatically for Power BI embedded analytics
description: Learn how to configure credentials programmatically and encrypt credentials for Power BI embedded analytics.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 05/21/2024
---

# Configure credentials programmatically for Power BI

**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::&nbsp;App&nbsp;owns&nbsp;data :::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::&nbsp;User&nbsp;owns&nbsp;data

To configure credentials programmatically for Power BI, follow the steps in this article. Configuring credentials programmatically also allows you to encrypt credentials.

>[!NOTE]
>
>* The calling user must be a semantic model owner or a gateway admin. You can also use a [service principal](../embedded/embed-service-principal.md). For example, the service principal can be the semantic model owner.
>* Cloud data sources and their corresponding credentials are managed at the user level.

## Update the credentials flow for data sources

1. Discover the data sources of the semantic model by calling [Get Datasources](/rest/api/power-bi/datasets/getdatasourcesingroup). The response body for each data source contains the type, connection details, gateway, and data source ID.

    ```csharp
    // Select a datasource
    var datasources = pbiClient.Datasets.GetDatasources(datasetId).Value;
    var datasource = datasources.First();
    ```

2. Build the credentials string according to the [Update Datasource Examples](/rest/api/power-bi/gateways/updatedatasource#examples). The contents of the credentials string depends on the type of credentials.

    # [.NET SDK v3](#tab/sdk3)

    ```csharp
    var credentials =  new BasicCredentials(username: "username", password :"*****");
    ```

    # [.NET SDK v2](#tab/sdk2)

     ```csharp
    var credentials = "{\"credentialData\":[{\"name\":\"username\", \"value\":\"john\"},{\"name\":\"password\", \"value\":\"*****\"}]}";
    ```

    ---

    >[!NOTE]
    >If you're using cloud data sources, don't follow the next steps in this section. Call [Update Datasource](/rest/api/power-bi/gateways/updatedatasource) to set the credentials by using the gateway ID and data source ID that you obtained in step 1.

3. Retrieve the gateway public key by calling [Get Gateway](/rest/api/power-bi/gateways/getgateways).

    ```csharp
    var gateway = pbiClient.Gateways.GetGatewayById(datasource.GatewayId);
    ```

4. Encrypt the credentials.

    # [.NET SDK v3](#tab/sdk3)

    ```csharp
    var credentialsEncryptor = new AsymmetricKeyEncryptor(gateway.publicKey);
    ```

    # [.NET SDK v2](#tab/sdk2)

    Encrypt the credentials string with the Gateway public key that you obtained from step 2. Different gateway versions might have different public key sizes. Refer to the following examples in the SDK code that are available from the [`PowerBI-CSharp` GitHub repository](https://github.com/microsoft/PowerBI-CSharp/tree/master/sdk/PowerBI.Api/Extensions):
    * [AsymmetricKeyEncryptor.cs](https://github.com/microsoft/PowerBI-CSharp/blob/master/sdk/PowerBI.Api/Extensions/AsymmetricKeyEncryptor.cs)
    * [Asymmetric1024KeyEncryptionHelper.cs](https://github.com/microsoft/PowerBI-CSharp/blob/master/sdk/PowerBI.Api/Extensions/Asymmetric1024KeyEncryptionHelper.cs)
    * [AsymmetricHigherKeyEncryptionHelper.cs](https://github.com/microsoft/PowerBI-CSharp/blob/master/sdk/PowerBI.Api/Extensions/AsymmetricHigherKeyEncryptionHelper.cs)
    * [AuthenticatedEncryption.cs](https://github.com/microsoft/PowerBI-CSharp/blob/master/sdk/PowerBI.Api/Extensions/AuthenticatedEncryption.cs)

    ---  

5. Build the credential details with encrypted credentials.

    # [.NET SDK v3](#tab/sdk3)

    Use the **AsymetricKeyEncryptor** class with the public key retrieved in **Step 3**.

    ```csharp
    var credentialDetails = new CredentialDetails(
            credentials,
            PrivacyLevel.Private,
            EncryptedConnection.Encrypted,
            credentialsEncryptor);
    ```


    # [.NET SDK v2](#tab/sdk2)

    ```csharp
    var credentialDetails = new CredentialDetails(
            credentials,
            CredentialTypeEnum.Basic,
            EncryptedConnectionEnum.Encrypted,
            EncryptionAlgorithmEnum.None,
            PrivacyLevelEnum.Private);
    ```

    ---

6. Set credentials by calling [Update Datasource](/rest/api/power-bi/gateways/updatedatasource).
    ```csharp
    pbiClient.Gateways.UpdateDatasource(datasource.GatewayId.Value, datasource.DatasourceId.Value, new UpdateDatasourceRequest(credentialDetails));
    ```

## Configure a new data source for a data gateway

1. Install the [On-premises data gateway](https://powerbi.microsoft.com/gateway/) on your machine.

2. Retrieve the gateway ID and public key by calling [Get Gateways](/rest/api/power-bi/gateways/getgateways).

    ```csharp
    // Select a gateway
    var gateways = pbiClient.Gateways.GetGateways().Value;
    var gateway = gateways.First();
    ```

3. Build credential details by following the procedure that is described in the [update credentials flow for data sources](#update-the-credentials-flow-for-data-sources) section by using the gateway public key that you retrieved in **step 2**.

4. Build the request body.

    ```csharp
    var request = new PublishDatasourceToGatewayRequest(
            dataSourceType: "SQL",
            connectionDetails: "{\"server\":\"myServer\",\"database\":\"myDatabase\"}",
            credentialDetails: credentialDetails,
            dataSourceName: "my sql datasource");
    ```

5. Call the [Create Datasource](/rest/api/power-bi/gateways/createdatasource) API.

    ```csharp
    pbiClient.Gateways.CreateDatasource(gateway.Id, request);
    ```

## Credential types

When you call [Create Datasource](/rest/api/power-bi/gateways/createdatasource) or [Update Datasource](/rest/api/power-bi/gateways/updatedatasource) from the Power BI REST API on an enterprise on-premises gateway, encrypt the credentials value by using the gateway public key.

>[!NOTE]
>.NET SDK v3 can also run the following .NET SDK v2 examples.

### Windows and basic credentials

# [.NET SDK v3](#tab/sdk3)

```csharp
// Windows credentials
var credentials = new WindowsCredentials(username: "john", password: "*****");

// Or

// Basic credentials
var credentials = new BasicCredentials(username: "john", password: "*****");

var credentialsEncryptor = new AsymmetricKeyEncryptor(publicKey);
var credentialDetails = new CredentialDetails(credentials, PrivacyLevel.Private, EncryptedConnection.Encrypted, credentialsEncryptor);
```

# [.NET SDK v2](#tab/sdk2)

```csharp
var credentials = "{\"credentialData\":[{\"name\":\"username\", \"value\":\"john\"},{\"name\":\"password\", \"value\":\"*****\"}]}";
```

---

### Key credentials

# [.NET SDK v3](#tab/sdk3)

```csharp
var credentials = new KeyCredentials("TestKey");
var credentialsEncryptor = new AsymmetricKeyEncryptor(publicKey);
var credentialDetails = new CredentialDetails(credentials, PrivacyLevel.Private, EncryptedConnection.Encrypted, credentialsEncryptor);
```

# [.NET SDK v2](#tab/sdk2)

```csharp
var credentials = "{\"credentialData\":[{\"name\":\"key\", \"value\":\"ec....LA=\"}]}";
```

---

**OAuth2 credentials**

# [.NET SDK v3](#tab/sdk3)

```csharp
var credentials = new OAuth2Credentials("TestToken");
var credentialsEncryptor = new AsymmetricKeyEncryptor(publicKey);
var credentialDetails = new CredentialDetails(credentials, PrivacyLevel.Private, EncryptedConnection.Encrypted, credentialsEncryptor);
```

# [.NET SDK v2](#tab/sdk2)

```csharp
var credentials = "{\"credentialData\":[{\"name\":\"accessToken\", \"value\":\"eyJ0....fwtQ\"}]}";
```

---

**Anonymous credentials**

# [.NET SDK v3](#tab/sdk3)

```csharp
var credentials = new AnonymousCredentials();
var credentialDetails = new CredentialDetails(credentials, PrivacyLevel.Private, EncryptedConnection.NotEncrypted);
```

# [.NET SDK v2](#tab/sdk2)

```csharp
var credentials = "{\"credentialData\":\"\"}";
```

---

## Troubleshooting

### No gateway and data source ID are found when calling get data sources

This issue means that the semantic model isn't bound to a gateway. When you create a new semantic model, a data source with no credentials is created automatically on the user's cloud gateway for each cloud connection. The cloud gateway is used to store the credentials for cloud connections.

After you create the semantic model, an automatic binding is created between the semantic model and a suitable gateway, which contains matching data sources for all connections. The automatic binding fails if there's no suitable gateway or gateways.

If you're using on-premises semantic models, create the missing on-premises data sources, and bind the semantic model to a gateway manually by using [Bind To Gateway](/rest/api/power-bi/datasets/bindtogateway).

To discover gateways that are bindable, use [Discover Gateways](/rest/api/power-bi/datasets/discovergateways).

## Related content

>[!div class="nextstepaction"]
>[Power BI REST APIs](/rest/api/power-bi/)
