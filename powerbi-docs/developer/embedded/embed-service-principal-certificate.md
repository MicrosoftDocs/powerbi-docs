---
title: Embedding Power BI content with service principal and a certificate
description: Learn how to authenticate for embedded analytics using an Azure Active Directory application service principal and a certificate.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: nishalit
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.custom: ""
ms.date: 03/26/2020
---

# Embedding Power BI content with service principal and a certificate

## What is certificate-based authentication in Azure?

Certificate-based authentication enables you to be authenticated by Azure Active Directory (Azure AD) with a client certificate on a Windows, Android or iOS device, or in [Azure Key Vault](https://docs.microsoft.com/azure/key-vault/basic-concepts). It offers stronger security by mutually authenticating against a trusted Certification Authority (CA), both the client and the server, during the TLS handshake. Because the certificate is signed, it is only possible to connect to the real server, and centrally manage the certificates using the CA for rotation or revocation. For more information go to GitHub.

## Creating a certificate

## Using the certificate

## Next steps

* [Register an app](register-app.md)
* [Power BI Embedded for your customers](embed-sample-for-customers.md)
* [Application and service principal objects in Azure Active Directory](https://docs.microsoft.com/azure/active-directory/develop/app-objects-and-service-principals)
* [Row-level security using on-premises data gateway with service principal](embedded-row-level-security.md#on-premises-data-gateway-with-service-principal)
