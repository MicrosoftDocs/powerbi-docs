---
title: Configure credentials programmatically for Power BI
description: How to configure credentials programmatically for Power BI for automation
author: rkarlin
ms.author: rkarlin
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 02/25/2019
---

# Configure credentials programmatically for Power BI

Follow these steps to configure credentials programmatically for Power BI.

## Configure a credential flow for data sources

1. Call [Get Datasources](https://docs.microsoft.com/rest/api/power-bi/datasets/getdatasourcesingroup) to discover the data sources of the dataset. In the response body for each data source, there's the type, connection details, gateway, and data source ID.

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

4. Call [Update Datasource](https://docs.microsoft.com/rest/api/power-bi/gateways/updatedatasource) to set credentials, using the gateway and data source ID from step 1 and using the credential details from step 4.

    ```csharp
    pbiClient.Gateways.UpdateDatasource(gatewayId, datasourceId, credentialDetails);
    ```

### Expired on-premises data source credentials flow

1. [Follow steps 1 and 2 from the previous scenario](#configure-credential-flow-for-data-sources).

2. Call [Get Gateway](https://docs.microsoft.com/rest/api/power-bi/gateways/getgateways) to retrieve the gateway public key.

    ```csharp
    var gateway = pbiClient.Gateways.GetGatewayById(datasource.GatewayId);
    ```

3. Encrypt the credentials string with Gateway public key using the RSA encryption algorithm.

    Use the following helper class for encryption:

    ```csharp
        public static class AsymmetricKeyEncryptionHelper
        {
            private const int SegmentLength = 85;
            private const int EncryptedLength = 128;

            /// <summary>

            /// Encrypts credentials using the RSA algorithm

            /// </summary>

            public static string EncodeCredentials(string credentialData, string publicKeyExponent, string publicKeyModulus)
            {
                using (RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(EncryptedLength * 8))
                {
                    var parameters = rsa.ExportParameters(false);

                    parameters.Exponent = Convert.FromBase64String(publicKeyExponent);

                    parameters.Modulus = Convert.FromBase64String(publicKeyModulus);

                    rsa.ImportParameters(parameters);

                    return Encrypt(credentialData, rsa);
                }
            }

             private static string Encrypt(string plainText, RSACryptoServiceProvider rsa)
            {

                byte[] plainTextArray = Encoding.UTF8.GetBytes(plainText);

                // Split the message into different segments, each segment's length is 85. So, the result may be 85,85,85,20. 

                bool hasIncompleteSegment = plainTextArray.Length % SegmentLength != 0; 

                int segmentNumber = (!hasIncompleteSegment) ? (plainTextArray.Length / SegmentLength) : ((plainTextArray.Length SegmentLength) + 1);

                byte[] encryptedData = new byte[segmentNumber * EncryptedLength];

                int encryptedDataPosition = 0;

                for (var i = 0; i < segmentNumber; i++)
                {
                    int lengthToCopy;

                    if (i == segmentNumber - 1 && hasIncompleteSegment)

                        lengthToCopy = plainTextArray.Length % SegmentLength;

                    else

                        lengthToCopy = SegmentLength;

                    var segment = new byte[lengthToCopy];

                    Array.Copy(plainTextArray, i * SegmentLength, segment, 0, lengthToCopy);

                    var segmentEncryptedResult = rsa.Encrypt(segment, true);

                    Array.Copy(segmentEncryptedResult, 0, encryptedData, encryptedDataPosition, segmentEncryptedResult.Length);

                    encryptedDataPosition += segmentEncryptedResult.Length;

                }

                return Convert.ToBase64String(encryptedData);

            }

        }

        var encryptedCredentials = AsymmetricKeyEncryptionHelper.EncodeCredentials(credentials);
    ```

4. Build credentials details with encrypted credentials.

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

3. Build credential details like in the previous scenario using the gateway public key retrieved in step [expired on-prem data source credentials flow](#expired-on-premises-data source-credentials-flow-on-premises-data-gateway).

4. build the request body

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

## Troubleshooting

### No gateway and data source ID found when calling get data sources

This issue means the dataset isn't bound to a gateway. When creating a new dataset, for each cloud connection a data source with no credentials is created automatically on the cloud gateway of the user. This gateway is used to store the credentials for cloud connections.

After you create the dataset, an automatic binding is done between the dataset and a suitable gateway, which contains matching data sources for all connections. If there's no such gateway or multiple suitable gateways, the automatic binding fails.

Create missing on-premises data sources if any, and bind the dataset to a gateway manually by using [Bind To Gateway](https://docs.microsoft.com/rest/api/power-bi/datasets/bindtogateway).

To discover gateways that could be bound use [Discover Gateways](https://docs.microsoft.com/rest/api/power-bi/datasets/discovergateways).
