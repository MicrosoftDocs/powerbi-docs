---
title: Embed Power BI content with service principal and an application secret
description: Learn how to authenticate for embedded analytics using an Azure Active Directory application service principal and an application secret.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.custom: ""
ms.date: 11/05/2020
---

# Embed Power BI content with service principal and an application secret

Service principal is an authentication method that can be used to let an Azure AD application access Power BI service content and APIs.

When you create an Azure Active Directory (Azure AD) app, a [service principal object](/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object) is created. The service principal object, also known simply as *service principal*, allows Azure AD to authenticate your app. Once authenticated, the app can access Azure AD tenant resources.

To authenticate, the service principal uses the Azure AD app's *Application ID*, and one of the following:

* Certificate
* Application secret

>[!NOTE]
>We recommend that you secure your backend services using certificates, rather than secret keys. [Learn more about getting access tokens from Azure AD using secret keys or certificates](/azure/architecture/multitenant-identity/client-assertion).

## Method

|#  |Step  |Application secret  |Certificate  |
|---------|---------|---------|---------|
|1.     |[Create an Azure AD Application](embed-service-principal-v2.md#step-1---create-an-azure-ad-app)         |![yes](../../media/yes.png)         |![yes](../../media/yes.png)         |
|2.     |[Get the app's *Application secret*](embed-service-principal-v2.md#step-2---get-the-apps-application-secret)         |![yes](../../media/yes.png)         |![no](../../media/no.png)         |
|3.     |[Create an Azure AD security group](embed-service-principal-v2.md#step-3---create-an-azure-ad-security-group)         |![yes](../../media/yes.png)         |![yes](../../media/yes.png)         |
|4.     |[Enable the Power BI service admin settings](embed-service-principal-v2.md#step-4---enable-the-power-bi-service-admin-settings)         |![yes](../../media/yes.png)         |![yes](../../media/yes.png)         |
|5.     |[Add the service principal to your workspace](embed-service-principal-v2.md#step-5---add-the-service-principal-to-your-workspace)         |![yes](../../media/yes.png)         |![yes](../../media/yes.png)         |
|6.     |[Create a certificate](embed-service-principal-v2.md#step-6---create-a-certificate)         |![no](../../media/no.png)         |![yes](../../media/yes.png)         |
|7.     |[Set up certificate authentication](embed-service-principal-v2.md#step-7---set-up-certificate-authentication)          |![no](../../media/no.png)         |![yes](../../media/yes.png)         |
|8.     |[Get the certificate from Azure Key Vault](embed-service-principal-v2.md#step-8---get-the-certificate-from-azure-key-vault)         |![no](../../media/no.png)         |![yes](../../media/yes.png)         |
|9.     |[Authenticate using service principal and a certificate](embed-service-principal-v2.md#step-9---authenticate-using-service-principal-and-a-certificate)         |![no](../../media/no.png)         |![yes](../../media/yes.png)         |
|10.     |[Embed your content](embed-service-principal-v2.md#step-10---embed-your-content)         |![yes](../../media/yes.png)         |![yes](../../media/yes.png)         |

> [!IMPORTANT]
> Once you enable service principal to be used with Power BI, the application's AD permissions don't take effect anymore. The application's permissions are then managed through the Power BI admin portal.

## Step 1 - Create an Azure AD app

|  |
|---------|
|**Required for:**<Token>![yes](../../media/yes.png)Application secret ![yes](../../media/yes.png)Certificate</Token>     |
|  |

Create an Azure AD app using one of these methods:

* Create the app in the [Microsoft Azure portal](https://portal.azure.com/#allservices)

* Create the app using [PowerShell](/powershell/azure/create-azure-service-principal-azureps).

### Creating an Azure AD app in the Microsoft Azure portal

1. Log into [Microsoft Azure](https://ms.portal.azure.com/#allservices).

2. Search for **App registrations** and click the **App registrations** link.

    ![azure app registration](../../includes/media/embedded-service-principal/azure-app-registration.png)

3. Click **New registration**.

    ![new registration](../../includes/media/embedded-service-principal/new-registration.png)

4. Fill in the required information:
    * **Name** - Enter a name for your application
    * **Supported account types** - Select supported account types
    * (Optional) **Redirect URI** - Enter a URI if needed

5. Click **Register**.

6. After registering, the *Application ID* is available from the **Overview** tab. Copy and save the *Application ID* for later use.

    ![Screenshot shows where to obtain an Application I D in the Overview tab.](../../includes/media/embedded-service-principal/application-id.png)

### Creating an Azure AD app using PowerShell

This section includes a sample script to create a new Azure AD app using [PowerShell](/powershell/azure/create-azure-service-principal-azureps).

```powershell
# The app ID - $app.appid
# The service principal object ID - $sp.objectId
# The app key - $key.value

# Sign in as a user that's allowed to create an app
Connect-AzureAD

# Create a new Azure AD web application
$app = New-AzureADApplication -DisplayName "testApp1" -Homepage "https://localhost:44322" -ReplyUrls "https://localhost:44322"

# Creates a service principal
$sp = New-AzureADServicePrincipal -AppId $app.AppId

# Get the service principal key
# (Required for service principal with application secret)
$key = New-AzureADServicePrincipalPasswordCredential -ObjectId $sp.ObjectId
```

## Step 2 - Get the app's *Application secret*

|  |
|---------|
|**Required for:**<Token>![yes](../../media/yes.png)Application secret ![no](../../media/no.png)Certificate</Token>     |
|  |

>[!TIP]
>This step is only required if you're planning to use service principal with application secret. If you're planning to use service principal with a certificate, skip this step and continue with [setp 3](embed-service-principal-v2.md#step-3---create-an-azure-ad-security-group).

1. Click the **Certificates & secrets** tab.

     ![A screenshot that shows the certificates and secrets pane for an app in the Azure portal.](media/embed-service-principal/certificates-and-secrets.png)


2. Click **New client secret**

    ![A screenshot that shows the new client secret button in the certificates and secrets pane.](media/embed-service-principal/new-client-secret.png)

3. In the *Add a client secret* window, enter a description, specify when you want the client secret to expire, and click **Add**.

4. Copy and save the *Client secret* value.

    ![A screenshots that shows a blurred out secret value in the certificates and secrets pane.](media/embed-service-principal/client-secret-value.png)

    >[!NOTE]
    >After you leave this window, the client secret value will be hidden, and you'll not be able to view or copy it again.

## Step 3 - Create an Azure AD security group

|  |
|---------|
|**Required for:**<Token>![yes](../../media/yes.png)Application secret ![yes](../../media/yes.png)Certificate</Token>     |
|  |

Your service principal doesn't have access to any of your Power BI content and APIs. To give the service principal access, create a security group in Azure AD, and add the service principal you created to that security group.

There are two ways to create an Azure AD security group:
* Manually (in Azure)
* Using PowerShell

### Create a security group manually

To create an Azure security group manually, follow the instructions in the [Create a basic group and add members using Azure Active Directory](/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal) article. 

### Create a security group using PowerShell

Below is a sample script for creating a new security group, and adding an app to that security group.

>[!NOTE]
>If you want to enable service principal access for the entire organization, skip this step.

```powershell
# Required to sign in as admin
Connect-AzureAD

# Create an Azure AD security group
$group = New-AzureADGroup -DisplayName <Group display name> -SecurityEnabled $true -MailEnabled $false -MailNickName notSet

# Add the service principal to the group
Add-AzureADGroupMember -ObjectId $($group.ObjectId) -RefObjectId $($sp.ObjectId)
```

## Step 4 - Enable the Power BI service admin settings

|  |
|---------|
|**Required for:**<Token>![yes](../../media/yes.png)Application secret ![yes](../../media/yes.png)Certificate</Token>     |
|  |

For an Azure AD app to be able to access the Power BI content and APIs, a Power BI admin needs to enable service principal access in the Power BI admin portal.

Add the security group you created in Azure AD, to the specific security group section in the **Developer settings**.

>[!IMPORTANT]
>Service principals have access to any tenant settings they're enabled for. Depending on your admin settings, this includes specific security groups or the entire organization.
>
>To restrict service principal access to specific tenant settings, allow access only to specific security groups. Alternatively, you can create a dedicated security group for service principals, and exclude it from the desired tenant settings.

>[!div class="mx-imgBorder"]
>:::image type="content" source="media/embed-service-principal/admin-portal.png" alt-text="Screenshot showing the developer settings in the admin options in the Power BI portal.":::

## Step 5 - Add the service principal to your workspace

|  |
|---------|
|**Required for:**<Token>![yes](../../media/yes.png)Application secret ![yes](../../media/yes.png)Certificate</Token>     |
|  |

To enable your Azure AD app access artifacts such as reports, dashboards and datasets in the Power BI service, add the service principal entity as a member or admin to your workspace.

>[!NOTE]
>This section provides UI instructions. You can also add a service principal to a workspace using the [Groups - add group user API](/rest/api/power-bi/groups/addgroupuser).

1. Scroll to the workspace you want to enable access for, and from the **More** menu, select **Workspace access**.

    :::image type="content" source="media/embed-service-principal/workspace-access.png" alt-text="Screenshot showing the workspace access button in the more menu of a Power BI workspace.":::

2. Add the service principal as an **Admin** or **Member** to the workspace.

    :::image type="content" source="media/embed-service-principal/add-service-principal-in-the-UI.png" alt-text="Screenshot showing adding a member or an admin to the access pane in the Power BI portal.":::

## Step 6 - Create a certificate

|  |
|---------|
|**Required for:**<Token>![no](../../media/no.png)Application secret ![yes](../../media/yes.png)Certificate</Token>     |
|  |

>[!TIP]
>Steps 6-9 are only relevant if you're using service principal with a certificate. If you're using service principal with an application secret, skip to [step 10](embed-service-principal-v2.md#step-10---embed-your-content).

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

## Step 7 - Set up certificate authentication

|  |
|---------|
|**Required for:**<Token>![no](../../media/no.png)Application secret ![yes](../../media/yes.png)Certificate</Token>     |
|  |

1. In your Azure AD application, click the **Certificates & secrets** tab.

     ![A screenshot that shows the certificates and secrets pane for an app in the Azure portal.](media/embed-service-principal/certificates-and-secrets.png)

2. Click **Upload certificate** and upload the *.cer* file you created and downloaded in the [first step](#step-5---create-a-certificate) of this tutorial. The *.cer* file contains the public key.

## Step 8 - Get the certificate from Azure Key Vault

|  |
|---------|
|**Required for:**<Token>![no](../../media/no.png)Application secret ![yes](../../media/yes.png)Certificate</Token>     |
|  |

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

## Step 9 - Authenticate using service principal and a certificate

|  |
|---------|
|**Required for:**<Token>![no](../../media/no.png)Application secret ![yes](../../media/yes.png)Certificate</Token>     |
|  |

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

## Step 10 - Embed your content

|  |
|---------|
|**Required for:**<Token>![yes](../../media/yes.png)Application secret ![yes](../../media/yes.png)Certificate</Token>     |
|  |

You can embed your content within a sample application, or within your own application.

* [Embed content using the sample application](embed-sample-for-customers.md#embed-content-using-the-sample-application)
* [Embed content within your application](embed-sample-for-customers.md#embed-content-within-your-application)

Once your content is embedded, you're ready to [move to production](embed-sample-for-customers.md#move-to-production).

## Considerations and limitations

* Service principal only works with [new workspaces](../collaborate-share/service-create-the-new-workspaces.md).
* **My Workspace** isn't supported when using service principal.
* A capacity is required when moving to production.
* You can't sign into the Power BI portal using service principal.
* Power BI admin rights are required to enable service principal in developer settings within the Power BI admin portal.
* [Embed for your organization](../developer/embedded/embed-sample-for-your-organization.md) applications can't use service principal.
* [Dataflows](../transform-model/service-dataflows-overview.md) management is not supported.
* Service principal currently does not support any admin APIs.
* When using service principal with an [Azure Analysis Services](/azure/analysis-services/analysis-services-overview) data source, the service principal itself must have an Azure Analysis Services instance permissions. Using a security group that contains the service principal for this purpose, doesn't work.

## Next steps

>[!div class="nextstepaction"]
>[Register an app](register-app.md)

> [!div class="nextstepaction"]
>[Power BI Embedded for your customers](embed-sample-for-customers.md)

>[!div class="nextstepaction"]
>[Application and service principal objects in Azure Active Directory](/azure/active-directory/develop/app-objects-and-service-principals)

>[!div class="nextstepaction"]
>[Row-level security using on-premises data gateway with service principal](embedded-row-level-security.md#on-premises-data-gateway-with-service-principal)