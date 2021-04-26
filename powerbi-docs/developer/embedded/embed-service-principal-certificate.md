---
title: Embed Power BI content in an Power BI embedded analytics application with service principal and a certificate
description: Learn how to authenticate for Power BI embedded analytics using an Azure Active Directory application service principal and a certificate.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.custom: ""
ms.date: 11/23/2020
---

# Embed Power BI content with service principal and a certificate

Certificate-based authentication enables you to be authenticated by Azure Active Directory (Azure AD) with a client certificate on a Windows, Android or iOS device, or kept in an [Azure Key Vault](/azure/key-vault/basic-concepts).

Using this method of authentication allows managing certificates from a central place, using the CA, for rotation or revocation.

You can learn more about certificates in Azure AD in the [Client credential flows](https://github.com/AzureAD/microsoft-authentication-library-for-dotnet/wiki/Client-credential-flows) GitHub page.

## Method

1. [Embed your content with service principal](embed-service-principal.md).

2. [Create a certificate](embed-service-principal-certificate.md#step-2---create-a-certificate).

3. [Set up certificate authentication](embed-service-principal-certificate.md#step-3---set-up-certificate-authentication).

4. [Get the certificate from Azure Key Vault](embed-service-principal-certificate.md#step-4---get-the-certificate-from-azure-key-vault).

5. [Authenticate using service principal and a certificate](embed-service-principal-certificate.md#step-5---authenticate-using-service-principal-and-a-certificate).

## Step 1 - Embed your content with service principal

To embed your content with service principal, follow the instructions in [Embed Power BI content with service principal and an application secret](embed-service-principal.md).

>[!NOTE]
>If you already have content that's embedded using a service principal, skip this step and advance to [step 2](embed-service-principal-certificate.md#step-2---create-a-certificate).

## Step 2 - Create a certificate

You can procure a certificate from a trusted *Certificate Authority*, or generate a certificate yourself.

This section describes creating a certificate using [Azure Key Vault](/azure/key-vault/create-certificate), and downloading the *.cer* file which contains the public key.

1. Log into [Microsoft Azure](https://ms.portal.azure.com/#allservices).

2. Search for **Key Vaults** and click the **Key Vaults** link.

    ![A screenshot that shows a link to the key vault in the Azure portal.](media/embed-service-principal-certificate/key-vault.png)

3. Click the key vault you want to add a certificate to.

    ![A screenshot showing a list of blurred out key vaults in the Azure portal.](media/embed-service-principal-certificate/select-key-vault.png)

4. Click **Certificates**.

    ![A screenshot that shows the Key vaults page with Certificates called out.](media/embed-service-principal-certificate/certificates.png)

5. Click **Generate/Import**.

    ![A screenshot that shows the Certificate pane with Generate / Import called out.](media/embed-service-principal-certificate/generate.png)

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

7. Click **Create**. The newly created certificate is disabled by default. It can take up to five minutes to become enabled.

8. Select the certificate you created.

9. Click **Download in CER format**. The downloaded file contains the public key.

    ![A screenshot that shows the download in cer format button.](media/embed-service-principal-certificate/download-cer.png)

## Step 3 - Set up certificate authentication

1. In your Azure AD application, click the **Certificates & secrets** tab.

     ![A screenshot that shows the certificates and secrets pane for an app in the Azure portal.](media/embed-service-principal/certificates-and-secrets.png)

2. Click **Upload certificate** and upload the *.cer* file you created and downloaded in [step 2](#step-2---create-a-certificate) of this tutorial. The *.cer* file contains the public key.

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
    try
    {
        certificate = keyVaultClient.GetCertificateAsync($"https://{KeyVaultName}.vault.azure.net/", certName).Result;
        secret = keyVaultClient.GetSecretAsync(certificate.SecretIdentifier.Identifier).Result;
    }
    catch (Exception)
    {
        return null;
    }

    return new X509Certificate2(Convert.FromBase64String(secret.Value));
}
```

## Step 5 - Authenticate using service principal and a certificate

You can authenticate your app using service principal and a certificate that's stored in Azure Key Vault, by connecting to Azure Key Vault.

To connect and read the certificate from Azure Key Vault, refer to the code below.

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
    try
    {
        authenticationResult = await clientApp.AcquireTokenForClient(Scope).ExecuteAsync();
    }
    catch (MsalException)
    {
        throw;
    }
    return authenticationResult
}
```

## Configure Visual Studio to use MSI

When creating your embedded solution, it may be useful to configure Visual Studio to use Managed Service Identity (MSI). [MSI](/azure/active-directory/managed-identities-azure-resources/overview) is a feature that enables you to manage your Azure AD identity. Once configured, it will let Visual Studio authenticate against your Azure Key Vault.

1. Open your project in Visual Studio.

2. Click **Tools** > **Options**.

     ![A screenshot showing the options button in the tools menu in Visual Studio.](media/embed-service-principal-certificate/visual-studio-options.png)

3. Search for **Account Selection** and click **Account Selection**.

    ![A screenshot showing the account selection option in the Visual Studio options window.](media/embed-service-principal-certificate/account-selection.png)

4. Add the account that has access to your Azure Key Vault.

## Next steps

>[!div class="nextstepaction"]
>[Register an app](register-app.md)

> [!div class="nextstepaction"]
>[Power BI Embedded for your customers](embed-sample-for-customers.md)

>[!div class="nextstepaction"]
>[Application and service principal objects in Azure Active Directory](/azure/active-directory/develop/app-objects-and-service-principals)

>[!div class="nextstepaction"]
>[Row-level security using on-premises data gateway with service principal](embedded-row-level-security.md#on-premises-data-gateway-with-service-principal)