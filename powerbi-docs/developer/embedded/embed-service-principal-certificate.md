---
title: Embed Power BI content in a Power BI embedded analytics application with service principal and a certificate
description: Learn how to authenticate for Power BI embedded analytics using a Microsoft Entra application service principal and a certificate.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.custom: ""
ms.date: 04/10/2024
---

# Embed Power BI content with service principal and a certificate

Certificate-based authentication enables you to be authenticated by Microsoft Entra ID with a client certificate. The client certificate can be on a Windows, Android, or iOS device, or the client certificate can be kept in an [Azure Key Vault](/azure/key-vault/basic-concepts).

Using this method of authentication allows managing certificates from a central place using the certificate authority (CA) for rotation or revocation.

You can learn more about certificates in Microsoft Entra ID in the [Client credential flows](https://github.com/AzureAD/microsoft-authentication-library-for-dotnet/wiki/Client-credential-flows) GitHub page.

## Method

1. [Embed your content with service principal](embed-service-principal.md).

2. [Create a certificate](embed-service-principal-certificate.md#step-2---create-a-certificate).

3. [Set up certificate authentication](embed-service-principal-certificate.md#step-3---set-up-certificate-authentication).

4. [Get the certificate from Azure Key Vault](embed-service-principal-certificate.md#step-4---get-the-certificate-from-azure-key-vault).

5. [Authenticate using service principal and a certificate](embed-service-principal-certificate.md#step-5---authenticate-using-service-principal-and-a-certificate).

## Step 1 - Embed your content with service principal

To embed your content with a service principal, follow the instructions in [Embed Power BI content with service principal and an application secret](embed-service-principal.md).

>[!NOTE]
>If you already have content that's embedded using a service principal, skip this step and advance to [step 2](embed-service-principal-certificate.md#step-2---create-a-certificate).

## Step 2 - Create a certificate

You can procure a certificate from a trusted *Certificate Authority*, or generate a certificate yourself.

This section describes creating a certificate using [Azure Key Vault](/azure/key-vault/create-certificate), and downloading the *.cer* file, which contains the public key.

1. Log into [Microsoft Azure](https://ms.portal.azure.com/#allservices).

2. Search for and select the **Key vaults** link.

    :::image type="content" source="media/embed-service-principal-certificate/key-vault.png" alt-text="Screenshot of the Azure portal window, which shows a link to the key vault service in the Services list.":::

3. Select the key vault you want to add a certificate to.

    :::image type="content" source="media/embed-service-principal-certificate/select-key-vault.png" alt-text="Screenshot of the Azure portal window, which shows a list of blurred out key vaults in the Key vaults list.":::

4. Select **Certificates**.

    :::image type="content" source="media/embed-service-principal-certificate/certificates.png" alt-text="Screenshot of the Azure portal window, which shows the Key vaults page with the highlighted Certificates item.":::

5. Select **Generate/Import**.

    :::image type="content" source="media/embed-service-principal-certificate/generate.png" alt-text="Screenshot of the Azure portal window, which shows the Certificate pane with the highlighted Generate / Import item.":::

6. Configure the **Create a certificate** fields as follows:

    * **Method of Certificate Creation** - General

    * **Certificate Name** - Enter a name for your certificate

    * **Type of Certificate Authority (CA)** - Self-signed certificate

    * **Subject** - An [X.500](https://wikipedia.org/wiki/X.500) distinguished name

    * **DNS Names** - 0 DNS names

    * **Validity Period (in months)** - Enter the certificate's validity duration

    * **Content Type** - PKCS #12

    * **Lifetime Action Type** - Automatically renew at a given percentage lifetime

    * **Percentage Lifetime** - 80

    * **Advanced Policy Configuration** - Not configured

7. Select **Create**. The newly created certificate is disabled by default. It can take up to five minutes to become enabled.

8. Select the certificate you created.

9. Select **Download in CER format**. The downloaded file contains the public key.

    :::image type="content" source="media/embed-service-principal-certificate/download-cer.png" alt-text="Screenshot of the Azure portal window, which shows the highlighted Download in CER Format button.":::

## Step 3 - Set up certificate authentication

1. In your Microsoft Entra application, select the **Certificates & secrets** tab.

    :::image type="content" source="media/embed-service-principal/certificates-and-secrets.png" alt-text="Screenshot of the Azure portal window, which shows the certificates and secrets pane for an app.":::

2. Select **Upload certificate** and upload the *.cer* file you created and downloaded in [step 2](#step-2---create-a-certificate) of this tutorial. The *.cer* file contains the public key.

## Step 4 - Get the certificate from Azure Key Vault

Use Managed Service Identity (MSI) to get the certificate from Azure Key Vault. This process involves getting the *.pfx* certificate that contains both the public and private keys.

Refer to the code example for reading the certificate from Azure Key Vault. If you want to use Visual Studio, refer to [Configure Visual Studio to use MSI](#configure-visual-studio-to-use-msi).

```csharp
private X509Certificate2 ReadCertificateFromVault(string certName)
{
    var serviceTokenProvider = new AzureServiceTokenProvider();
    var keyVaultClient = new KeyVaultClient(new KeyVaultClient.AuthenticationCallback(serviceTokenProvider.KeyVaultTokenCallback));
    CertificateBundle certificate = null;
    SecretBundle secret = null;

    certificate = keyVaultClient.GetCertificateAsync($"https://{KeyVaultName}.vault.azure.net/", certName).Result;
    secret = keyVaultClient.GetSecretAsync(certificate.SecretIdentifier.Identifier).Result;
    
    return new X509Certificate2(Convert.FromBase64String(secret.Value));
}
```

## Step 5 - Authenticate using service principal and a certificate

You can authenticate your app that uses a service principal and a certificate that's stored in Azure Key Vault by connecting to Azure Key Vault.

To connect and read the certificate from Azure Key Vault, refer to the following code sample.

>[!NOTE]
>If you already have a certificate created by your organization, upload the *.pfx* file to Azure Key Vault.

```csharp
// Preparing needed variables
var Scope = "https://analysis.windows.net/powerbi/api/.default"
var ApplicationId = "{YourApplicationId}"
var tenantSpecificURL = "https://login.microsoftonline.com/{YourTenantId}/"
X509Certificate2 certificate = ReadCertificateFromVault(CertificateName);

// Authenticating with a SP and a certificate
public async Task<AuthenticationResult> DoAuthentication(){
    IConfidentialClientApplication clientApp = null;
    clientApp = ConfidentialClientApplicationBuilder.Create(ApplicationId)
                                                    .WithCertificate(certificate)
                                                    .WithAuthority(tenantSpecificURL)
                                                    .Build();
    return await clientApp.AcquireTokenForClient(Scope).ExecuteAsync();
}
```

## Configure Visual Studio to use MSI

When you create an embedded solution, it might be useful to configure Visual Studio to use Managed Service Identity (MSI). [MSI](/azure/active-directory/managed-identities-azure-resources/overview) is a feature that enables you to manage your Microsoft Entra identity. Once configured, it will let Visual Studio authenticate against your Azure Key Vault.

>[!NOTE]
>The user that signs into Visual Studio requires Azure Key Vault permissions to get the certificate.

1. Open your project in Visual Studio.

2. Select **Tools** > **Options**.

    :::image type="content" source="media/embed-service-principal-certificate/visual-studio-options.png" alt-text="Screenshot of the Visual Studio window, which shows the highlighted Options button in the Tools menu.":::

3. Search for and select **Account Selection**.

    :::image type="content" source="media/embed-service-principal-certificate/account-selection.png" alt-text="Screenshot of the Visual Studio Options window, which shows the highlighted Account Selection option in the search results.":::

4. Add the account that has access to your Azure Key Vault.

## Related content

* [Set up Power BI Embedded](register-app.md)
* [Tutorial: Embed Power BI content using a sample embed for your customers' application](embed-sample-for-customers.md)
* [Application and service principal objects in Microsoft Entra ID](/azure/active-directory/develop/app-objects-and-service-principals)
* [Embed a report on an on-premises SQL Server Analysis Services (SSAS)](./sql-server-analysis-services-embed.md)
