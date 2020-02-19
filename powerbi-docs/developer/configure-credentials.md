---
title: Configure credentials programmatically for Power BI
description: How to configure credentials programmatically for Power BI for automation
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 02/19/2020
---

# Configure credentials programmatically for Power BI

Follow these steps to configure credentials programmatically for Power BI.

## Configure a credential flow for data sources

1. Call [Get Datasources](https://docs.microsoft.com/rest/api/power-bi/datasets/getdatasourcesingroup) to discover the data sources of the dataset. In the response body for each data source, are the type, connection details, gateway, and data source ID.

    ```csharp
    var datasources = pbiClient.Datasets.GetDatasources(datasetId).Value;
    var datasource = datasources.First(); // select a datasource
    ```

2. Build credentials string according to [Update Datasource Examples](https://docs.microsoft.com/rest/api/power-bi/gateways/updatedatasource) depending on the credentials type.

    ```csharp
    var credentials = "{\"credentialData\":[{\"name\":\"username\", \"value\":\"john\"},{\"name\":\"password\", \"value\":\"*****\"}]}";
    ```

3. Build the credential details.

    ```csharp
    var credentialDetails = new CredentialDetails(
                    credentials,
                    CredentialTypeEnum.Basic,
                    EncryptedConnectionEnum.Encrypted,
                    EncryptionAlgorithmEnum.None,
                    PrivacyLevelEnum.Private);
    ```

4. Call [Update Datasource](https://docs.microsoft.com/rest/api/power-bi/gateways/updatedatasource) to set credentials, using the gateway and data source ID from step 1, and using the credential details from step 4.

    ```csharp
    pbiClient.Gateways.UpdateDatasource(gatewayId, datasourceId, credentialDetails);
    ```

### Expired on-premises data source credentials flow

1. Follow [steps 1 and 2](#configure-a-credential-flow-for-data-sources) from the previous section.

2. Call [Get Gateway](https://docs.microsoft.com/rest/api/power-bi/gateways/getgateways) to retrieve the gateway public key.

    ```csharp
    var gateway = pbiClient.Gateways.GetGatewayById(datasource.GatewayId);
    ```

3. Encrypt the credentials string with a Gateway public key. Different gateway versions may have different public key sizes.

    Refer to the following examples in the SDK code, available from the [PowerBI-CSharp GitHub repository](https://github.com/microsoft/PowerBI-CSharp/tree/master/sdk/PowerBI.Api/Extensions):
    * [AsymmetricKeyEncryptor.cs](https://github.com/microsoft/PowerBI-CSharp/blob/master/sdk/PowerBI.Api/Extensions/AsymmetricKeyEncryptor.cs)
    * [Asymmetric1024KeyEncryptionHelper.cs](https://github.com/microsoft/PowerBI-CSharp/blob/master/sdk/PowerBI.Api/Extensions/Asymmetric1024KeyEncryptionHelper.cs)
    * [AsymmetricHigherKeyEncryptionHelper.cs](https://github.com/microsoft/PowerBI-CSharp/blob/master/sdk/PowerBI.Api/Extensions/AsymmetricHigherKeyEncryptionHelper.cs)
    * [AuthenticatedEncryption.cs](https://github.com/microsoft/PowerBI-CSharp/blob/master/sdk/PowerBI.Api/Extensions/AuthenticatedEncryption.cs)

4. Build credential details with encrypted credentials.

    ```csharp
    var credentialDetails = new CredentialDetails(
                    encryptedCredentials,
                    CredentialTypeEnum.Basic,
                    EncryptedConnectionEnum.Encrypted,
                    EncryptionAlgorithmEnum.RSA-OAEP,
                    PrivacyLevelEnum.Private);
    ```

5. Call [Update Datasource](https://docs.microsoft.com/rest/api/power-bi/gateways/updatedatasource) to set credentials.

    ```csharp
    pbiClient.Gateways.UpdateDatasource(gatewayId, datasourceId, credentialDetails);
    ```

## Configure a new data source for a data gateway

1. Install the [On-premises data gateway](https://powerbi.microsoft.com/gateway/) on your machine.

2. Call [Get Gateways](https://docs.microsoft.com/rest/api/power-bi/gateways/getgateways) to retrieve the gateway ID and public key.

    ```csharp
    var gateways = pbiClient.Gateways.GetGateways().Value;
    var gateway = gateways.First(); // select a gateway
    ```

3. Build credential details in the same way as described in [expired on-premises data source credentials flow](#expired-on-premises-data-source-credentials-flow), using the gateway public key retrieved in **step 4**.

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

## Building credentials

When you call [Create Datasource](https://docs.microsoft.com/rest/api/power-bi/gateways/createdatasource) or [Update Datasource](https://docs.microsoft.com/rest/api/power-bi/gateways/updatedatasource) under an **enterprise on-prem gateway** using [Power BI Rest API](https://docs.microsoft.com/rest/api/power-bi/), the credentials value needs to be encrypted using the gateway's public key.

Credentials provided to the `EncodeCredentials` method, should be in one of the following formats, depending on the credentials type.

>[!NOTE]
>SDK 3.0.9 can also run the SDK 2.0 examples listed below.

### Windows and basic credentials

# [SDK 3.0.9](#tab/sdk3)

**Windows**

```csharp
var credentialDetails = new CredentialDetails(credentials, PrivacyLevel.Organizational, EncryptedConnection.Encrypted);
```

**Basic**

```csharp
var credentialDetails = new CredentialDetails(credentials, PrivacyLevel.None, EncryptedConnection.Encrypted);
```

# [SDK 2.0](#tab/sdk2)

**Windows and basic**

```csharp
var credentials = "{\"credentialData\":[{\"name\":\"username\", \"value\":\"john\"},{\"name\":\"password\", \"value\":\"*****\"}]}";
```

---

### Key credentials

# [SDK 3.0.9](#tab/sdk3)

```csharp
var credentialDetails = new CredentialDetails(credentials, PrivacyLevel.Private, EncryptedConnection.Encrypted);
```

# [SDK 2.0](#tab/sdk2)

```csharp
var credentials = "{\"credentialData\":[{\"name\":\"key\", \"value\":\"ec....LA=\"}]}";
```

---

**OAuth2 credentials**

# [SDK 3.0.9](#tab/sdk3)

```csharp
var credentialDetails = new CredentialDetails(credentials, PrivacyLevel.Private, EncryptedConnection.Encrypted);
```

# [SDK 2.0](#tab/sdk2)

```csharp
var credentials = "{\"credentialData\":[{\"name\":\"accessToken\", \"value\":\"eyJ0....fwtQ\"}]}";
```

---

**Anonymous credentials**

# [SDK 3.0.9](#tab/sdk3)

```csharp
var credentialDetails = new CredentialDetails(credentials, PrivacyLevel.Public, EncryptedConnection.NotEncrypted);
```

# [SDK 2.0](#tab/sdk2)

```csharp
var credentials = "{\"credentialData\":\"\"}";
```

---

**Encrypt credentials**

Encrypt the credentials value using the gateway's public key. Different gateway versions may have different public key sizes.

Refer to the examples in the SDK code, available from the [PowerBI-CSharp GitHub repository](https://github.com/microsoft/PowerBI-CSharp/tree/master/sdk/PowerBI.Api/Extensions).

- [AsymmetricKeyEncryptor.cs](https://github.com/microsoft/PowerBI-CSharp/blob/master/sdk/PowerBI.Api/ExtensionsAsymmetricKeyEncryptor.cs)
- [Asymmetric1024KeyEncryptionHelper.cs](https://github.com/microsoft/PowerBI-CSharp/blob/master/sdk/PowerBI.Api/Extensions/Asymmetric1024KeyEncryptionHelper.cs)
- [AsymmetricHigherKeyEncryptionHelper.cs](https://github.com/microsoft/PowerBI-CSharp/blob/master/sdk/PowerBI.Api/Extensions/AsymmetricHigherKeyEncryptionHelper.cs)
- [AuthenticatedEncryption.cs](https://github.com/microsoft/PowerBI-CSharp/blob/master/sdk/PowerBI.Api/Extensions/AuthenticatedEncryption.cs)

## Troubleshooting

### No gateway and data source ID found when calling get data sources

This issue means the dataset isn't bound to a gateway. When creating a new dataset, for each cloud connection a data source with no credentials is created automatically on the user's cloud gateway. This gateway is used to store the credentials for cloud connections.

After you create the dataset, an automatic binding is done between the dataset and a suitable gateway, which contains matching data sources for all connections. If there's no such gateway or multiple suitable gateways, the automatic binding fails.

Create missing on-premises data sources if any, and bind the dataset to a gateway manually by using [Bind To Gateway](https://docs.microsoft.com/rest/api/power-bi/datasets/bindtogateway).

To discover gateways that could be bound use [Discover Gateways](https://docs.microsoft.com/rest/api/power-bi/datasets/discovergateways).