---
title: Configure credentials programmatically for Power BI
description: How to configure credentials programmatically for when automating Power BI
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 02/23/2020
---

# Configure credentials programmatically for Power BI

Follow these steps to configure credentials programmatically for Power BI.

## Update credentials flow for data sources

1. Call [Get Datasources](https://docs.microsoft.com/rest/api/power-bi/datasets/getdatasourcesingroup) to discover the data sources of the dataset. In the response body for each data source, are the type, connection details, gateway, and data source ID.

    ```csharp
    // Select a datasource
    var datasources = pbiClient.Datasets.GetDatasources(datasetId).Value;
    var datasource = datasources.First();
    ```

2. Build credentials string according to [Update Datasource Examples](https://docs.microsoft.com/rest/api/power-bi/gateways/updatedatasource) depending on the credentials type.

    # [.NET SDK v3](#tab/sdk3)

    ```csharp
    var credentials =  new BasicCredentials(username: "username", password :"*****");
    ```

    # [.NET SDK v2](#tab/sdk2)

     ```csharp
    var credentials = "{\"credentialData\":[{\"name\":\"username\", \"value\":\"john\"},{\"name\":\"password\", \"value\":\"*****\"}]}";
    ```

    ---

2. Call [Get Gateway](https://docs.microsoft.com/rest/api/power-bi/gateways/getgateways) to retrieve the gateway public key.

    ```csharp
    var gateway = pbiClient.Gateways.GetGatewayById(datasource.GatewayId);
    ```

3. Encrypt the credentials.

    # [.NET SDK v3](#tab/sdk3)

    ```charp
    var credentialsEncryptor = new AsymmetricKeyEncryptor(gateway.publicKey);
    ```

    # [.NET SDK v2](#tab/sdk2)

    Encrypt the credentials string with the Gateway public key from step 2. Different gateway versions may have different public key sizes. Refer to the following examples in the SDK code, available from the [PowerBI-CSharp GitHub repository](https://github.com/microsoft/PowerBI-CSharp/tree/master/sdk/PowerBI.Api/Extensions):
    * [AsymmetricKeyEncryptor.cs](https://github.com/microsoft/PowerBI-CSharp/blob/master/sdk/PowerBI.Api/Extensions/AsymmetricKeyEncryptor.cs)
    * [Asymmetric1024KeyEncryptionHelper.cs](https://github.com/microsoft/PowerBI-CSharp/blob/master/sdk/PowerBI.Api/Extensions/Asymmetric1024KeyEncryptionHelper.cs)
    * [AsymmetricHigherKeyEncryptionHelper.cs](https://github.com/microsoft/PowerBI-CSharp/blob/master/sdk/PowerBI.Api/Extensions/AsymmetricHigherKeyEncryptionHelper.cs)
    * [AuthenticatedEncryption.cs](https://github.com/microsoft/PowerBI-CSharp/blob/master/sdk/PowerBI.Api/Extensions/AuthenticatedEncryption.cs) 

    ---  

4. Build credential details with encrypted credentials.

    # [.NET SDK v3](#tab/sdk3)

    Use the AssymetricKeyEncriptor class with the public key retrieved in **Step 2**.

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

5. Call [Update Datasource](https://docs.microsoft.com/rest/api/power-bi/gateways/updatedatasource) to set credentials.

    ```csharp
    pbiClient.Gateways.UpdateDatasource(gatewayId, datasourceId, credentialDetails);
    ```

## Configure a new data source for a data gateway

1. Install the [On-premises data gateway](https://powerbi.microsoft.com/gateway/) on your machine.

2. Call [Get Gateways](https://docs.microsoft.com/rest/api/power-bi/gateways/getgateways) to retrieve the gateway ID and public key.

    ```csharp
    // Select a gateway
    var gateways = pbiClient.Gateways.GetGateways().Value;
    var gateway = gateways.First();
    ```

3. Build credential details in the same way as described in [update credentials flow for data sources](#update-credentials-flow-for-data-sources), using the gateway public key retrieved in **step 2**.

4. build the request body.

    ```csharp
    var request = new PublishDatasourceToGatewayRequest(
            dataSourceType: "SQL",
            connectionDetails: "{\"server\":\"myServer\",\"database\":\"myDatabase\"}",
            credentialDetails: credentialDetails,
            dataSourceName: "my sql datasource");
    ```

5. Call the [Create Datasource](https://docs.microsoft.com/rest/api/power-bi/gateways/createdatasource) API.

    ```csharp
    pbiClient.Gateways.CreateDatasource(gateway.Id, request);
    ```

## Credential types

When you call [Create Datasource](https://docs.microsoft.com/rest/api/power-bi/gateways/createdatasource) or [Update Datasource](https://docs.microsoft.com/rest/api/power-bi/gateways/updatedatasource) under an **enterprise on-prem gateway** using [Power BI Rest API](https://docs.microsoft.com/rest/api/power-bi/), the credentials value needs to be encrypted using the gateway's public key.

>[!NOTE]
>.NET SDK v3 can also run the .NET SDK v2 examples listed below.

### Windows and basic credentials

# [.NET SDK v3](#tab/sdk3)

```csharp
// Windows Credentials
var credentials = new WindowsCredentials(username: "john", password: "*****");

// Or Basic Credentials
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

### No gateway and data source ID found when calling get data sources

This issue means the dataset isn't bound to a gateway. When creating a new dataset, for each cloud connection a data source with no credentials is created automatically on the user's cloud gateway. This gateway is used to store the credentials for cloud connections.

After you create the dataset, an automatic binding is created between the dataset and a suitable gateway, which contains matching data sources for all connections. If there's no such gateway or multiple suitable gateways, the automatic binding fails.

If you're using on-premises datasets, create the missing on-premises data sources, and bind the dataset to a gateway manually by using [Bind To Gateway](https://docs.microsoft.com/rest/api/power-bi/datasets/bindtogateway).

To discover gateways that could be bound, use [Discover Gateways](https://docs.microsoft.com/rest/api/power-bi/datasets/discovergateways).