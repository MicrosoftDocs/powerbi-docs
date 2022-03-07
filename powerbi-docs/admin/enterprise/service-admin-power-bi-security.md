---
title: Power BI Security
description: Power BI Security. How Power BI relates to Azure Active Directory and other Azure services. This topic also includes a link to a white paper which goes more in-depth.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 09/09/2019
LocalizationGroup: Administration
---

# Power BI Security

For a detailed explanation of Power BI security, [read the Power BI Security whitepaper](../../guidance/whitepaper-powerbi-security.md).

The Power BI service is built on **Azure**, which is Microsoft’s cloud computing infrastructure and platform. The Power BI service architecture is based on two clusters – the Web Front End (**WFE**) cluster and the **Back-End** cluster. The WFE cluster manages the initial connection and authentication to the Power BI service, and once authenticated, the Back-End handles all subsequent user interactions. Power BI uses Azure Active Directory (AAD) to store and manage user identities, and manages the storage of data and metadata using Azure BLOB and Azure SQL Database, respectively.

## Power BI Architecture

Each Power BI deployment consists of two clusters – a Web Front End (**WFE**) cluster, and a **Back-End** cluster.

The **WFE** cluster manages the initial connection and authentication process for Power BI, using AAD to authenticate clients and provide tokens for subsequent client connections to the Power BI service. Power BI also uses the **Azure Traffic Manager** (ATM) to direct user traffic to the nearest datacenter, determined by the DNS record of the client attempting to connect, for the authentication process and to download static content and files. Power BI uses the **Azure Content Delivery Network** (CDN) to efficiently distribute the necessary static content and files to users based on geographical locale.

![Diagram showing Power B I Architecture for Web Front End cluster.](media/service-admin-power-bi-security/pbi_security_v2_wfe.png)

The **Back-End** cluster is how authenticated clients interact with the Power BI service. The **Back-End** cluster manages visualizations, user dashboards, datasets, reports, data storage, data connections, data refresh, and other aspects of interacting with the Power BI service. The **Gateway Role** acts as a gateway between user requests and the Power BI service. Users do not interact directly with any roles other than the **Gateway Role**. **Azure API Management** will eventually handle the **Gateway Role**.

![Diagram showing Power B I Architecture for Web Back End cluster.](media/service-admin-power-bi-security/pbi_security_v2_backend_updated.png)

> [!IMPORTANT]
> It is imperative to note that only **Azure API Management** (APIM) and **Gateway** (GW) roles are accessible through the public Internet. They provide authentication, authorization, DDoS protection, Throttling, Load Balancing, Routing, and other capabilities.

## Data Storage Security

Power BI uses two primary repositories for storing and managing data: data that is uploaded from users is typically sent to **Azure Blob Storage**, and all metadata as well as artifacts for the system itself are stored in **Azure SQL Database**.

The dotted line in the **Back-End** cluster image, above, clarifies the boundary between the only two components that are accessible by users (left of the dotted line), and roles that are only accessible by the system. When an authenticated user connects to the Power BI Service, the connection and any request by the client is accepted and managed by the **Gateway Role** (eventually to be handled by **Azure API Management**), which then interacts on the user’s behalf with the rest of the Power BI Service. For example, when a client attempts to view a dashboard, the **Gateway Role** accepts that request then separately sends a request to the **Presentation Role** to retrieve the data needed by the browser to render the dashboard.

## User Authentication

Power BI uses Azure Active Directory ([AAD](https://azure.microsoft.com/services/active-directory/)) to authenticate users who sign in to the Power BI service, and in turn, uses the Power BI login credentials whenever a user attempts to access resources that require authentication. Users sign in to the Power BI service using the email address used to establish their Power BI account; Power BI uses that login email as the *effective username*, which is passed to resources whenever a user attempts to connect to data. The *effective username* is then mapped to a [*User Principal Name* (UPN)](/windows/win32/secauthn/user-name-formats) and resolved to the associated Windows domain account, against which authentication is applied.

For organizations that used work emails for Power BI login (such as <em>david@contoso.com</em>), the *effective username* to UPN mapping is straightforward. For organizations that did not use work emails for Power BI login (such as <em>david@contoso.onmicrosoft.com</em>), mapping between AAD and on-premises credentials will require [directory synchronization](/azure/active-directory-domain-services/synchronization) to work properly.

Platform security for Power BI also includes multi-tenant environment security, networking security, and the ability to add additional AAD-based security measures.

## Data and Service Security

For more information, please visit the [Microsoft Trust Center](https://www.microsoft.com/trust-center/product-overview).

As described earlier in this article, a user’s Power BI login is used by on-premises Active Directory servers to map to a UPN for credentials. However, it’s **important** to note that users are responsible for the data they share: if a user connects to data sources using their credentials, then shares a report (or dashboard, or dataset) based on that data, users with whom the dashboard is shared are not authenticated against the original data source, and will be granted access to the report.

An exception is connections to **SQL Server Analysis Services** using the **On-premises data gateway**; dashboards are cached in Power BI, but access to underlying reports or datasets initiates authentication for the user attempting to access the report (or dataset), and access will only be granted if the user has sufficient credentials to access the data. For more information, see [On-premises data gateway deep dive](../../connect-data/service-gateway-onprem-indepth.md).

## Enforcing TLS version usage

Network and IT administrators can enforce the requirement to use current TLS (Transport Layer Security) for any secured communication on their network. Windows provides support for TLS versions over the Microsoft Schannel Provider, as [described in the TLS Schannel SSP article](/windows/desktop/SecAuthN/protocols-in-tls-ssl--schannel-ssp-).

This enforcement can be done by administratively setting registry keys. Enforcement is described in the [Managing SSL Protocols in AD FS article](/windows-server/identity/ad-fs/operations/manage-ssl-protocols-in-ad-fs). 

**Power BI Desktop** respects the registry key settings described in those articles, and only created connections using the version of TLS allowed based on those registry settings, when present.

For more information about setting these registry keys, see the [TLS Registry Settings](/windows-server/security/tls/tls-registry-settings) article.
