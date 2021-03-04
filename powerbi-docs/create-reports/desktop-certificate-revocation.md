---
title: Certificate revocation check in Power BI Desktop
description: How to revoke certificates in Power BI Desktop in the UI and in the registry
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 03/03/2021
LocalizationGroup: Create reports
---
# Certificate revocation check in Power BI Desktop

Certificates ensure the security of your connections to online data sources. You can check to see if a certificate has been revoked before you connect. Power BI offers two ways to enable or disable a certificate check: 

- In Options in Power BI Desktop.
- By editing the registry.

## Revocation check options

Both methods offer three possible settings:

- **Comprehensive check** Reject certificates that have been revoked and certificates without revocation information.
- **Basic check** Only reject certificates that have been revoked. Certificates without revocation info are allowed through. This is important for some organizations with corporate proxy services.
- **None**  Power BI doesn't check revocation information. All valid certificates are allowed through.

## Power BI Desktop

In the user interface in Power BI Desktop, you can enable or disable the feature.

- On the **File** menu > **Options and settings** > **Options**, select **Security**, then select one of the three options:

    - **Comprehensive check**
    - **Basic check**
    - **None**

## Registry settings

You can also control the certificate revocation check by setting the following DWORD registry value: `DisableCertificateRevocationCheck`.

- **Basic**
- **Disabled** is the same as **None** in Power BI Desktop.
- **Comprehensive**


|Certificate revocation info status | Comprehensive check | Basic check | None |
|---------|---------|---------|---------|
|Revoked     |  ❌  | ❌  | ✔   |
|Unknown  |  ❌    |  ✔   |    ✔  |
|Not revoked  | ✔  |    ✔ |    ✔  |

The simple Enable or Disable checkbox is still in the Power BI Desktop user interface. To use the more fine-grained control, set the following DWORD registry value: `DisableCertificateRevocationCheck`. You set this value in the Power BI Desktop registry key. It's one of these, depending on your operating system:

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
|0     | Basic   | Certificates with an unknown revocation status are accepted. Equivalent to enabling the checkbox in Power BI Desktop. |
|1     | Disabled  | Ignores all revocation checks. Equivalent to disabling the checkbox in Power BI Desktop.  |
|2     | Comprehensive  |  Requires not revoking certificates. Doesn't accept certificates with unknown revocation status |

Configure this registry setting to take advantage of more fine-grained control today.