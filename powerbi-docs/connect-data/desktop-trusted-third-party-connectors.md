---
title: Trusted Third-Party Connectors in Power BI Desktop
description: Learn how to trust a signed third-party connector in Power BI Desktop by editing values in the Registry Editor.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 01/23/2023
LocalizationGroup: Connect to data
---
# Trusted third-party connectors

In Power BI Desktop, we generally recommend keeping your *Data extension security* level at the higher level, which prevents loading of code not certified by Microsoft. However, there might be many cases in which you want to load specific connectors. These connectors include ones you've written and ones provided to you by a consultant or vendor outside the Microsoft certification path.

The developer of a given connector can sign it with a certificate and provide you with the information you need to securely load it without lowering your security settings.

For more information about the security settings, see [Connector extensibility in Power BI](./desktop-connector-extensibility.md).

## Using the registry to trust third-party connectors

Trusting third-party connectors in Power BI Desktop is done by listing the thumbprint of the certificate you want to trust in a specified registry value. If this thumbprint matches the thumbprint of the certificate on the connector you want to load, you can load it in the *Recommended* security level of Power BI Desktop.

The registry path is `HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Power BI Desktop`. Make sure the path exists, or create it. This location is chosen due to it being primarily controlled by IT policy and requiring local machine administration access to edit.

:::image type="content" source="media/desktop-trusted-third-party-connectors/desktoptrustedthird1.png" alt-text="Screenshot shows the Power BI Desktop Registry with no trusted third-party keys set." lightbox="media/desktop-trusted-third-party-connectors/desktoptrustedthird1.png":::

Add a new value under the path specified in the previous image. The type should be Multi-String Value: `REG_MULTI_SZ`. It should be called `TrustedCertificateThumbprints`.

:::image type="content" source="media/desktop-trusted-third-party-connectors/desktoptrustedthird2.png" alt-text="Screenshot shows the Power BI Desktop Registry with an entry for trusted third-party connectors but no keys." lightbox="media/desktop-trusted-third-party-connectors/desktoptrustedthird2.png":::

Add the thumbprints of the certificates you want to trust. You can add multiple certificates by using `\0` as a delimiter, or in the Registry Editor, right-click key, then select **Modify** to put each thumbprint on a new line. This example thumbprint is taken from a self-signed certificate.

:::image type="content" source="media/desktop-trusted-third-party-connectors/desktoptrustedthird3.png" alt-text="Screenshot shows the Power BI Desktop Registry with a trusted third-party key set." lightbox="media/desktop-trusted-third-party-connectors/desktoptrustedthird3.png":::

If you have the proper thumbprint from your developer, you should now be able to securely trust connectors signed with the associated certificate.

## How to sign connectors

If you have a connector you or a developer need to sign, see [Handling Power Query Connector Signing](/power-query/handlingconnectorsigning).
