---
title: Bring your own encryption keys for Power BI
description: Learn how to use your own encryption keys (BYOK) in Power BI Premium to gain more control and help meet compliance requirements.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 12/15/2024

LocalizationGroup: Premium
---

# Bring your own encryption keys for Power BI

By default, Power BI uses Microsoft-managed keys to encrypt your data. In Power BI Premium, you can also use your own keys for data at-rest that's imported into a semantic model. This approach is often described as *bring your own key* (BYOK). For more information, see [Data source and storage considerations](#data-source-and-storage-considerations). 

## Why use BYOK?

BYOK makes it easier to meet compliance requirements that specify key arrangements with the cloud service provider, in this case Microsoft. With BYOK, you provide and control the encryption keys for your Power BI data at-rest at the application level. As a result, you can exercise control and revoke your organization's keys, should you decide to exit the service. By revoking the keys, the data becomes unreadable to the service within 30 minutes.

## Data source and storage considerations

To use BYOK, you must upload data to the Power BI service from a Power BI Desktop (PBIX) file. You can't use BYOK in the following scenarios:

- Analysis Services Live Connection
- Excel workbooks, unless data is first imported into Power BI Desktop
- [Push semantic models](/rest/api/power-bi/pushdatasets)
- [Streaming semantic models](../connect-data/service-real-time-streaming.md#set-up-your-real-time-streaming-semantic-model-in-power-bi)
- [Power BI metrics](../create-reports/service-goals-introduction.md) don't currently support BYOK


BYOK applies only to semantic models. Push semantic models, Excel files, and CSV files that users can upload to the service aren't encrypted using your own key. PowerBI users can use [Customer Key](/purview/customer-key-set-up) for Excel workbooks stored in SharePoint and OneDrive. To identify which items are stored in your workspaces, use the following PowerShell command:

`PS C:\> Get-PowerBIWorkspace -Scope Organization -Include All`

> [!NOTE]
> This cmdlet requires Power BI management module v1.0.840. You can see which version you have by running `Get-InstalledModule -Name MicrosoftPowerBIMgmt`. Install the latest version by running `Install-Module -Name MicrosoftPowerBIMgmt`. You can get more information about the Power BI cmdlet and its parameters in [Power BI PowerShell cmdlet module](/powershell/power-bi/overview).

## Configure Azure Key Vault

This section explains how to configure Azure Key Vault, a tool for securely storing and accessing secrets, like encryption keys. You can use an existing key vault to store encryption keys, or you can create a new one specifically for use with Power BI.

The following instructions assume basic knowledge of Azure Key Vault. For more information, see [What is Azure Key Vault?](/azure/key-vault/key-vault-whatis)

Configure your key vault in the following way:

1. [Add the Power BI service as a service principal](#add-the-service-principal) for the key vault, with wrap and unwrap permissions.

2. [Create an RSA key](#create-an-rsa-key) with a 4096-bit length, or use an existing key of this type, with wrap and unwrap permissions.

    > [!IMPORTANT]
    > Power BI BYOK supports only RSA keys with a 4096-bit length.

3. Recommended: Check that the key vault has the [*soft delete* option enabled](#soft-delete-option).

### Add the service principal

1. Log into the [Azure portal](https://portal.azure.com) and search for **Key Vaults**.

2. In your key vault, select **Access policies**, and then choose **Create**.

    :::image type="content" source="media/service-encryption-byok/add-access-policy.png" alt-text="Screenshot of the Create button for access policies in the Azure portal.":::

3. On the **Permissions** screen, under **Key permissions**, select **Unwrap Key** and **Wrap Key**, then choose **Next**.

    :::image type="content" source="media/service-encryption-byok/key-permissions.png" alt-text="Screenshot of the permission screen to create a new access policy.":::

4. On the **Principal** screen, search for and select *Microsoft.Azure.AnalysisServices*.

    > [!NOTE]
    > If you can't find *Microsoft.Azure.AnalysisServices*, it's likely that the Azure subscription associated with your Azure Key Vault never had a Power BI resource associated with it. Try searching for the following string instead: 00000009-0000-0000-c000-000000000000.

    :::image type="content" source="media/service-encryption-byok/select-principal.png" alt-text="Screenshot of the Principal screen to select a new principal for the access policy.":::

5. Select **Next**, then **Review + create** > **Create**.

> [!NOTE]
> To revoke Power BI access to your data, remove access rights to this service principal from your Azure Key Vault.

### Create an RSA key

1. In your key vault, under **Keys**, select **Generate/Import**.

2. Select a **Key type** of *RSA* and an **RSA key size** of *4096*.

    :::image type="content" source="media/service-encryption-byok/create-rsa-key.png" alt-text="Screenshot of the RSA key type and size selections.":::

3. Select **Create**.

4. Under **Keys**, select the key you created.

5. Select the GUID for the **Current Version** of the key.

6. Check that **Wrap Key** and **Unwrap Key** are both selected. Copy the **Key Identifier** to use when you enable BYOK in Power BI.

    :::image type="content" source="media/service-encryption-byok/key-properties.png" alt-text="Screenshot of the key properties with the identifier and permitted operations.":::

### Soft delete option

You should you enable [soft-delete](/azure/key-vault/key-vault-ovw-soft-delete) on your key vault to protect from data loss in case of accidental key, or key vault, deletion. To enable the *soft-delete* property, you must use [PowerShell](/azure/key-vault/key-vault-soft-delete-powershell) because this option isn't available yet in the Azure portal.

With Azure Key Vault properly configured, you're ready to enable BYOK on your tenant.

## Configure the Azure Key Vault firewall

This section describes using the trusted Microsoft service firewall bypass, to configure a firewall around your Azure Key Vault.

> [!NOTE]
> You can choose to enable firewall rules on your key vault. You can also choose to leave the firewall disabled on your key vault as per the default setting.

Power BI is a trusted Microsoft service. You can instruct the key vault firewall to allow access to all trusted Microsoft services, a setting that allows Power BI to access your key vault without specifying endpoint connections.

To configure Azure Key Vault to allow access to trusted Microsoft services, follow these steps:

1. Search for **Key Vaults** in the Azure portal, then select the key vault you want to allow access from Power BI and all other trusted Microsoft services.

2. Select **Networking** from the left-side navigation panel.

3. Under **Firewalls and virtual networks**, select **Allow public access from specific virtual networks and IP addresses**.

    :::image type="content" source="media/service-encryption-byok/key-vault-firewall.png" alt-text="Screenshot of the Azure Key Vault networking option, with the firewalls and virtual networks option selected.":::

4. Scroll down to the **Firewall** section. Select **Allow trusted Microsoft services to bypass this firewall**.

    :::image type="content" source="media/service-encryption-byok/trusted-service.png" alt-text="Screenshot of the option to allow trusted Microsoft services to bypass this firewall.":::

5. Select **Apply**.

## Enable BYOK on your tenant

You enable BYOK at the tenant level by using PowerShell. First, install the [Power BI administration package for PowerShell](https://www.powershellgallery.com/packages/MicrosoftPowerBIMgmt.Admin) and introduce the encryption keys you created and stored in Azure Key Vault to your Power BI tenant. You then assign these encryption keys per Premium capacity for encrypting content in the capacity.

### Important considerations

Before you enable BYOK, keep the following considerations in mind:

- At this time, you can't disable BYOK after you enable it. Depending on how you specify parameters for `Add-PowerBIEncryptionKey`, you can control how you use BYOK for one or more of your capacities. However, you can't undo the introduction of keys to your tenant. For more information, see [Enable BYOK](#enable-byok).

- You can't *directly* move a workspace that uses BYOK from a capacity in Power BI Premium to a shared capacity. You must first move the workspace to a capacity that doesn't have BYOK enabled.

- If you move a workspace that uses BYOK from a capacity in Power BI Premium to a shared capacity, reports and semantic models become inaccessible since they're encrypted with the Key. To avoid this situation, you must first move the workspace to a capacity that doesn’t have BYOK enabled.

### Enable BYOK

To enable BYOK, you must be a Power BI admin, signed in using the `Connect-PowerBIServiceAccount` cmdlet. Then use [Add-PowerBIEncryptionKey](/powershell/module/microsoftpowerbimgmt.admin/Add-PowerBIEncryptionKey) to enable BYOK, as shown in the following example:

```powershell
Add-PowerBIEncryptionKey -Name'Contoso Sales' -KeyVaultKeyUri'https://contoso-vault2.vault.azure.net/keys/ContosoKeyVault/b2ab4ba1c7b341eea5ecaaa2wb54c4d2'
```

To add multiple keys, run `Add-PowerBIEncryptionKey` with different values for `-Name` and `-KeyVaultKeyUri`. 

The cmdlet accepts two switch parameters that affect encryption for current and future capacities. By default, neither of the switches are set:

- `-Activate`: Indicates that this key is used for all existing capacities in the tenant that aren't already encrypted.

- `-Default`: Indicates that this key is now the default for the entire tenant. When you create a new capacity, the capacity inherits this key.

> [!IMPORTANT]
> If you specify `-Default`, all of the capacities created on your tenant from this point are encrypted using the key you specify, or an updated default key. You can't undo the default operation, so you lose the ability to create a premium capacity in your tenant that doesn't use BYOK.

After you enable BYOK on your tenant, set the encryption key for one or more Power BI capacities:

1. Use [Get-PowerBICapacity](/powershell/module/microsoftpowerbimgmt.capacities/get-powerbicapacity) to get the capacity ID that's required for the next step.

    ```powershell
    Get-PowerBICapacity -Scope Individual
    ```

    The cmdlet returns output similar to the following output:

    ```
    Id              : xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
    DisplayName     : Test Capacity
    Admins          : adam@sometestdomain.com
    Sku             : P1
    State           : Active
    UserAccessRight : Admin
    Region          : North Central US
    ```

1. Use [Set-PowerBICapacityEncryptionKey](/powershell/module/microsoftpowerbimgmt.admin/set-powerbicapacityencryptionkey) to set the encryption key:

    ```powershell
    Set-PowerBICapacityEncryptionKey -CapacityId xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx -KeyName 'Contoso Sales'
    ```

You have control over how you use BYOK across your tenant. For example, to encrypt a single capacity, call `Add-PowerBIEncryptionKey` without `-Activate` or `-Default`. Then call `Set-PowerBICapacityEncryptionKey` for the capacity where you want to enable BYOK.

## Manage BYOK

Power BI provides additional cmdlets to help manage BYOK in your tenant:

- Use [Get-PowerBICapacity](/powershell/module/microsoftpowerbimgmt.capacities/get-powerbicapacity) to get the key that a capacity currently uses:

    ```powershell
    Get-PowerBICapacity -Scope Organization -ShowEncryptionKey
    ```

- Use [Get-PowerBIEncryptionKey](/powershell/module/microsoftpowerbimgmt.admin/get-powerbiencryptionkey) to get the key that your tenant currently uses:

    ```powershell
    Get-PowerBIEncryptionKey
    ```

- Use [Get-PowerBIWorkspaceEncryptionStatus](/powershell/module/microsoftpowerbimgmt.admin/get-powerbiworkspaceencryptionstatus) to see whether the semantic models in a workspace are encrypted and whether their encryption status is in sync with the workspace:

    ```powershell
    Get-PowerBIWorkspaceEncryptionStatus -Name'Contoso Sales'
    ```

    Note that encryption is enabled at the capacity level, but you get encryption status at the semantic model level for the specified workspace.

- Use [Switch-PowerBIEncryptionKey](/powershell/module/microsoftpowerbimgmt.admin/switch-powerbiencryptionkey) to switch (or *rotate*) the version of the key being used for encryption. The cmdlet simply updates the `-KeyVaultKeyUri` for a key `-Name`:

    ```powershell
    Switch-PowerBIEncryptionKey -Name'Contoso Sales' -KeyVaultKeyUri'https://contoso-vault2.vault.azure.net/keys/ContosoKeyVault/b2ab4ba1c7b341eea5ecaaa2wb54c4d2'
    ```

    Note that the current key should be enabled.

## Related content

- [Overview of Power BI PowerShell cmdlet module.](/powershell/power-bi/overview)

- [Ways to share your work in Power BI.](../collaborate-share/service-how-to-collaborate-distribute-dashboards-reports.md)

- [Filter a report using query string parameters in the URL.](../collaborate-share/service-url-filters.md)

- [Embed with report web part in SharePoint Online.](../collaborate-share/service-embed-report-spo.md)

- [Publish to web from Power BI.](../collaborate-share/service-publish-to-web.md)

- [What is Power BI Premium?](service-premium-what-is.md)
