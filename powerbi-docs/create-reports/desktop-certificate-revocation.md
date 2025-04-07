---
title: Certificate revocation check, Power BI Desktop
description: Learn how to check to see if you're using revoked certificates in Power BI Desktop in the UI and in the registry.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 03/06/2023
LocalizationGroup: Create reports
---
# Certificate revocation check, Power BI Desktop

Certificates ensure the security of your connections to online data sources. You can check to see if a certificate is revoked before you connect. Power BI offers two ways to enable or disable a certificate check:

- In Options in Power BI Desktop.
- By editing the registry.

## Revocation check options

Both methods offer three possible settings:

- **Comprehensive check**: Reject certificates that are revoked and certificates without revocation information.
- **Basic check**: Only reject certificates that are revoked. Certificates without revocation information are allowed through. This is important for some organizations with corporate proxy services.
- **None** or **Disabled**: Power BI doesn't check revocation information. All valid certificates are allowed through.

|Certificate revocation information status | Comprehensive check | Basic check | None / Disabled |
|---------|---------|---------|---------|
|Revoked     |  :::image type="icon" source="../includes/media/no-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/no-icon.svg" border="false":::  | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::   |
|Unknown  |  :::image type="icon" source="../includes/media/no-icon.svg" border="false":::    |  :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::   |    :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  |
|Not revoked  | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  |    :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |    :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  |

## In Power BI Desktop

You can enable or disable the check in the user interface in Power BI Desktop. On the **File** menu > **Options and settings** > **Options**, select **Security**, then select one of the three options:

- **Comprehensive check**
- **Basic check**
- **None**

**Basic check** is the default selection.

:::image type="content" source="media/desktop-certificate-revocation/desktop-check-certificate-revocation-2.png" alt-text="Screenshot of the check certification revocation dialog box.":::

## In registry settings

You can also control the certificate revocation check by setting the DWORD registry value `DisableCertificateRevocationCheck`. Admins can also use this method to control the setting for their whole organization.

- **Basic**
- **Disabled** is the same as **None** in Power BI Desktop.
- **Comprehensive**

Set the DWORD registry value `DisableCertificateRevocationCheck` in the Power BI Desktop registry key. The key is in one of these folders, depending on your operating system:

```
HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Microsoft Power BI Desktop
```

Or:

```
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Power BI Desktop
```

Set the registry value to one of the following values:

|Value  |Mode  |Configuration  |
|---------|---------|---------|
|0     | Basic   | Certificates with an unknown revocation status are accepted. Equivalent to Basic in Power BI Desktop. |
|1     | Disabled  | Ignores all revocation checks. Equivalent to None in Power BI Desktop.  |
|2     | Comprehensive  |  Requires not revoking certificates. Doesn't accept certificates with unknown revocation status. Equivalent to Comprehensive in Power BI Desktop. |
