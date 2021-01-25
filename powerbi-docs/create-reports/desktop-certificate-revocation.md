---
title: Certificate revocation check in Power BI Desktop
description: How to revoke certificates in Power BI Desktop in the UI and in the registry
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 01/25/2021
LocalizationGroup: Create reports
---
# Certificate revocation in Power BI Desktop

Power BI offers two ways to enable or disable a certificate check. 
In November 2020, we introduced a simple on/off certificate revocation check for web connections in Power BI Desktop. Now you can have more fine-grained control over the certificate revocation check.

## Simple certificate revocation

In the user interface in Power BI Desktop, you can enable or disable the feature.

- On the **File** menu > **Options and settings** > **Options**, select **Security**, then select or clear **Enable certificate revocation check**.

## More fine-grained control

You can have more fine-grained control over the certificate revocation check with a third option. 

- **Basic**  The basic check accepts certificates whose revocation status is unknown, for example because the certificate doesn't specify it. This check is important for organizations that use corporate proxy servers. It's the same as selecting the checkbox in Power BI Desktop.
- **Disabled** The same as disabling the checkbox in Power BI Desktop.
- **Comprehensive** You can disable or enable the revocation check in *comprehensive* mode, which doesn't accept certificates with unknown revocation status. 


|Certificate revocation info status | Comprehensive check | Basic check | None |
|---------|---------|---------|---------|
|Revoked     |  ❌  | ❌  | ✔   |
|Unknown  |  ❌    |  ✔   |    ✔  |
|Not revoked  | ✔  |    ✔ |    ✔  |

The simple Enable or Disable checkbox is still in the Power BI Desktop user interface. To use the more fine-grained control, set the following DWORD registry value: `DisableCertificateRevocationCheck`. You set this value in the Power BI Desktop registry key:

- On a 32-bit operating system: 

    ```
    HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Microsoft Power BI Desktop
    ```

- On a 64-bit operation system:

    ```
    HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Power BI Desktop . 
    ```

Set the registry value to one of the following values: 

|Value  |Mode  |Configuration  |
|---------|---------|---------|
|0     | Basic   | Certificates with an unknown revocation status are accepted. Equivalent to enabling the checkbox in Power BI Desktop. |
|1     | Disabled  | Ignores all revocation checks. Equivalent to disabling the checkbox in Power BI Desktop.  |
|2     | Comprehensive  |  Requires not revoking certificates. Doesn't accept certificates with unknown revocation status |

Configure this registry setting to take advantage of more fine-grained control today.