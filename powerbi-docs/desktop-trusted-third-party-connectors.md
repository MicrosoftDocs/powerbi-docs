---
title: Trusted Third-Party Connectors in Power BI
description: How to trust a signed third-party connector in Power BI
author: cpopell
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 04/3/2019
ms.author: gepopell

LocalizationGroup: Connect to data
---
# Why do you need Trusted Third-Party Connectors?

In Power BI, we generally recommend keeping your 'Data extension security' level at the higher level, which prevents loading of code not certified by Microsoft. However, there may be many cases in which you want to load specific connectors--ones you've written, or ones provided to you by a consultant or vendor outside the Microsoft certification path.

The developer of a given connector can sign it with a certificate and provide you with the information you need to securely load it without lowering your security settings.

If you want to know more about the security settings, you can read about them [here](https://docs.microsoft.com/en-us/power-bi/desktop-connector-extensibility).

# Trusting Third-Party Connectors

Trusting third-party connectors in Power BI is done by listing the thumbprint of the certificate you want to trust in a specified registry value. If this thumbprint matches the thumbprint of the certificate on the connector you want to load, you will be able to load it in the ‘Recommended’ security level of Power BI. 

The registry path is HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Power BI Desktop. Make sure the path exists, or create it. We chose this location due to it being primarily controlled by IT policy, as well as requiring local machine administration access to edit. 

![Power BI Desktop Registry with no trusted third-party keys set](media/desktop-trusted-third-party-connectors/desktoptrustedthird1.png)

Add a new value under the path specified above. The type should be “Multi-String Value” (REG_MULTI_SZ), and it should be called “TrustedCertificateThumbprints” 

![Power BI Desktop Registry with an entry for trusted third-party connectors but no keys](media/desktop-trusted-third-party-connectors/desktoptrustedthird2.png)

Add the thumbprints of the certificates you want to trust. You can add multiple certificates by using “\0” as a delimiter, or in the registry editor, right click -> modify and put each thumbprint on a new line. Example thumbprint is taken from a self-signed certificate. 

 ![Power BI Desktop Registry with a trusted third-party key set](media/desktop-trusted-third-party-connectors/desktoptrustedthird3.png)

If you’ve followed the instructions properly, and have been given the proper thumbprint by your developer, you should now be able to securely trust connectors signed with the associated certificate. 
