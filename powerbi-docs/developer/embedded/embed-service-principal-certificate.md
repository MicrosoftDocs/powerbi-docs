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
ms.date: 03/31/2020
---

# Embedding Power BI content with service principal and a certificate

## What is certificate-based authentication?

Certificate-based authentication enables you to be authenticated by Azure Active Directory (Azure AD) with a client certificate on a Windows, Android or iOS device, or in an [Azure Key Vault](https://docs.microsoft.com/azure/key-vault/basic-concepts).

Certificate-based authentication offers a strong security solution. This is because a signed certificate makes it possible to connect only to an approved server.

The secure connection is achieved by authenticating both the client and the server against a trusted Certification Authority (CA), during the TLS handshake.

Using this method of authentication, allows central management of  certificates using the CA, for rotation or revocation.

You can learn more about certificates in Azure AD in the [Client credential flows](https://github.com/AzureAD/microsoft-authentication-library-for-dotnet/wiki/Client-credential-flows) GitHub page.

## Method

To use service principal and a certificate with embedded analytics, follow these steps:

1. Create a certificate.

2. Set up certificate authentication.

3. Authenticate using the certificate.

## Step 1 - Creating a certificate

You can procure a certificate from a trusted *Certificate Authority*, or generate a certificate yourself.

This section describes creating a certificate using [Azure Key Vault](https://docs.microsoft.com/azure/key-vault/create-certificate).

1. Log into [Microsoft Azure](https://ms.portal.azure.com/#allservices).

2. Search for 

## Step 2 - Set up certificate authentication

## Step 3 - Authenticate using the certificate

## Set up Managed Service Identity in Visual Studio 

## Next steps

* [Register an app](register-app.md)
* [Power BI Embedded for your customers](embed-sample-for-customers.md)
* [Application and service principal objects in Azure Active Directory](https://docs.microsoft.com/azure/active-directory/develop/app-objects-and-service-principals)
* [Row-level security using on-premises data gateway with service principal](embedded-row-level-security.md#on-premises-data-gateway-with-service-principal)
