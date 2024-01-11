---
title: "Power BI implementation planning: Security"
description: "An introduction to the Power BI security planning articles."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 12/12/2022
---

# Power BI implementation planning: Security

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article introduces a series of articles about Power BI security. The series of articles is targeted at:

- **Power BI administrators:** The administrators who are responsible for overseeing Power BI in the organization.
- **Center of Excellence, IT, and BI team:** The teams that are also responsible for overseeing Power BI. They also support self-service users throughout the organization.
- **Content creators:** Self-service BI creators who set up permissions for the content they create and publish.

The series of articles is intended to expand upon the content in the [Power BI security white paper](whitepaper-powerbi-security.md). While the Power BI security white paper focuses on key technical topics such as authentication, data residency, and network isolation, the primary goal of the series is to provide you with considerations and decisions to help you plan for security and privacy.

It's important to plan to address challenges related to security, which include:

- Identifying and appropriately managing the volume and variety of data that's stored in many locations.
- Ensuring that sensitive data is appropriately stored and shared.
- Keeping pace with the regulatory landscape, which is ever-changing.
- Educating Power BI content creators on appropriate practices in relation to security and privacy.

> [!TIP]
> Also see the [information protection and data loss prevention](powerbi-implementation-planning-info-protection-data-loss-prevention-overview.md) articles. They contain information that's complementary to this series of articles.

The focus for this series of articles is on security and privacy. It's organized into the following articles:

- **[Tenant-level security planning](powerbi-implementation-planning-security-tenant-level-planning.md):** Strategic decisions and actions you should consider that affect securing the content in your Power BI tenant. The focus is on strategic decisions that will impact consumers and content creators. It also includes strategies for file locations, external users, and using groups.
- **[Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md):** Tactical decisions and actions you should consider when planning how to deliver secure content to read-only consumers. The focus is primarily on report viewers and app viewers. It also describes techniques for how to enforce data security and the *Request access* workflow for consumers.
- **[Content creator security planning](powerbi-implementation-planning-security-content-creator-planning.md):** Tactical decisions and actions you should consider when planning for enterprise and self-service creators, who create, manage, secure, and publish content. It also describes the data discovery experience and the *Request access* workflow for content creators.

> [!NOTE]
> There are additional security planning topics not covered by these articles. We recommend that you also see [Premium capacity permissions](/power-bi/enterprise/service-admin-premium-manage#manage-user-permissions) and [Manage security roles of an on-premises data gateway](/data-integration/gateway/manage-security-roles).

## Related content

In the [next article in this series](powerbi-implementation-planning-security-tenant-level-planning.md), learn about tenant-level security planning.
