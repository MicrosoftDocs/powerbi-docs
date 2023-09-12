---
title: Embedded analytics accelerator solutions from Microsoft partners
description: Learn about different accelerators our partners offer to facilitate embedded analytics for ISVs.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ofer
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 09/03/2023
---

# Embedded analytics accelerator solutions from Microsoft partner

To expedite embedded analytics for ISVs, Microsoft partners offer accelerator tools designed to help quickly embed Power BI analytics into your application. Embedded analytics accelerators are a cost-effective way to speed up time-to-market or advance a PoC or pilot for your multi-tenant, customer facing Power BI embedded analytics solution​. They simplify the implementation process and can also help you manage your Power BI capacity and billing.

* Accelerators provide enhanced personalized user experience and added functionality for embedding Power BI for customers (App Owns Data) embedding scenario with flexible end user authentication and authorization options​.

* Accelerators don't require coding. Some need minimal code development for the client front-end, while hiding the implementation details of a Power BI embedded solution that supports multi-tenancy and end user permissions management.​

* Once installed, you can white-label the solution, configure its capabilities, and customize the user experience.​

* Accelerators are developed and owned by our partners. They're available for self-deployment from Azure Marketplace into your Azure environment using your existing Power BI/Fabric tenant. ​

* An accelerator can coexist or be fully integrated with your original application​.

There are several partner accelerators that vary in their deployment, acquisition/billing options and their capabilities. ​

| **Partner** <br> (accelerator)                  | **Description** | Website/Product link |
|-------------------------------------------------|--------------------------------|---------|
| :::image type="content" source="./media/embedded-analytics-accelerators/reporting-hub-logo.png" alt-text="The logo of the Reporting Hub.":::    | The Reporting Hub is a web-based business intelligence platform that seamlessly integrates with Power BI using Embedded technology. It's a plug 'n' play white label application that deploys to your Azure environment and allows you to instantly deliver Power BI in a more efficient and simplified manner. | [(The Reporting Hub)](https://thereportinghub.com/) |
| :::image type="content" source="./media/embedded-analytics-accelerators/maq-logo.png" alt-text="The logo of Maq Software.":::               | The EmbedFAST is designed for Independent Software Vendors (ISVs) and enterprise customers. However, any organization can benefit from EmbedFAST to unleash the power of Power BI. Save time, effort, costs, and resources by embedding Power BI using our ready-to-use API. Seamlessly embed with comprehensive features, without having to build from scratch. | [(Embed Fast)](https://maqsoftware.com/embedfast) |
| :::image type="content" source="./media/embedded-analytics-accelerators/ilink-digital-logo.png" alt-text="The logo of Count.":::                           | The BiHub presents a seamless, no-code reporting gateway designed for Power BI, using cutting-edge Embedded technology. The BiHub is a cloud-based application that is installed and deployed within your Azure environment. It integrates with existing Microsoft tenants and communicates with Power BI Embedded via Microsoft APIs. | [(BiHub)](https://www.ilink-digital.com/bihub/) |

## Accelerator deployment options

Different accelerators provide different frontend and backend capabilities including the following options:

### Frontend capabilities

* Navigation menu for categories and items of Power BI​

* Action bar above the Power BI iFrame to control the UX and invoke functionality  ​

  * End user bookmark management & visual personalization​

  * Export report to file printouts (PDF, PPTX, PNG, and more for Paginated reports)​

  * UX pane control and report edit/view toggle​

  * Report subscriptions and scheduling of printouts​

* Seamless multi-tenancy and user permissions support​

  * Show each tenant user only their own data even when using the same report across the tenant

  * Show the user only the items and data they have access to

  * Allow switching to edit mode based on user permissions (access level on report) ​

* Multi language support for web frontend

To see which partner's solution contains which options, see the [comparison tables](#comparison-of-accelerators-from-our-partners).

### Backend capabilities

The following features and capabilities are available in the backend and admin modules of the accelerators:

#### Backend module​

* Support multiple end user authentication providers, potentially different one per tenant​

* Generate and refresh access and embed tokens per tenant workspace isolation and user permissions​

* Support frontend features: asynchronous print to file and report subscriptions, scheduling & distribution​

* Expose backend SDK for your custom frontend embedded as iFrame in existing ISV app​

#### Admin module (including UI and config database)​

* Multi-tenancy solution management within the same Power BI tenant

  * Auto provision workspace when on-boarding a new tenant​

  * Isolate tenants’ data and reports in their respective workspaces ​

  * Isolate tenant PBI access with dedicated service principal profile identity to create/access tenant’s workspace​

  * Optionally sync & reuse existing information on app’s tenants their end users​

  * Manage tenant's end user access of PBI items and data (with RLS/dynamic binding for dataset) ​

  * Collect and visualize usage analytics of tenants and their users​

* Capacity management​

  * Assign workspace to capacity to support global multi-geo deployment and to scale out with multiple capacities​

  * Manage capacities operation pause resume and scale up/scale down​

* Publishing & management of tenant’s PBI content​

* Tenant use monetization and streamlined licensing billing & payment processing

To see which partner's solution contains which options, see the [comparison tables](#comparison-of-accelerators-from-our-partners) in the next section.

## Comparison of accelerators from our partners

The following tables compare features of the different accelerators from our partners. The tables are divided into the following sections:

* [Deployment options](#deployment-options)
* [Acquisition and billing options](#acquisition-and-billing-options)
* [Added capabilities](#added-capabilities)

### Deployment options

| Partner <br> **(accelerator)**                                                                             | Stand alone        | URL redirect      | Embedded in App’s iFrame | Backend + SDK only |
|-------------------------------------------------                                                           |--------------------|-------------------|--------------------------|--------------------|
| [**Shift Analytics**](https://shiftanalytics.ca/)​ <br> [The Reporting Hub](https://thereportinghub.com/) | ✔️​                | ✔️​                | ✔️​                      | ​                   |
| [**MAQ Software**](https://maqsoftware.com/)​ <br>[Embed Fast](https://maqsoftware.com/embedfast)                                              | under development  | under development​ | ​                         | ✔️​                |
| [**iLink Digital​**](https://www.ilink-digital.com/) <br>[BiHub](https://www.ilink-digital.com/bihub/)                                            | ✔️​                | ​                  | ​                         | ​                   |

### Acquisition and billing options

| Partner <br> **(accelerator)**               |  Monthly subscriptions: <br> **Direct billing**     |  Monthly subscriptions: <br> **Azure Marketplace** | Free trial | One time purchase ​ | As part of consulting engagement​ |
|----------------------------------------------|-----------------------------------------------------|----------------------------------------------------|----------------|------------------------|--------------------------------------|
| **Shift Analytics**​ <br> [The Reporting Hub](https://thereportinghub.com/) | ✔️​                                                 | under development​                                  | ✔️​             | ​                       | ​                                     |
| **MAQ Software**​ <br>[Embed Fast](https://maqsoftware.com/embedfast)            |  under development                                  | under development                                  | ​               | ✔️​                    | ✔️​                                   |
| **iLink​** <br>[BiHub](https://www.ilink-digital.com/bihub/)                        |  ​                                                   | under development ​                                | ✔️​              | ​                      | ✔️​                                   |

### Added capabilities

| Partner                                  | Personal​<br>bookmarks | Report​<br>Printout | Control​<br> UX options | Navigation​<br>Menu | Multi-tenancy​ | Tenant specific​<br>authN &​<br>white-labeling​ | Power BI item​<br>publishing | Report subs.​<br>scheduling & ​<br>distribution​ | Tenant billing​<br>& payment​<br>processing​ | Multi-language​<br>portal support​ |
|----------------------------------------------|--------------------------------------------|-----------------------------------------|---------------------------------------------|---------------------|-------------------|--------------------------------------------|------------------------------|--------------------------------------------|-----------------------------------------|-----------------------------------|
| **Shift Analytics**​ <br> [The Reporting Hub](https://thereportinghub.com/)​ | ✔️                                         | ✔️                                     | ✔️                                          | ✔️                 | ✔️                | ✔️                                        | ​                             | ✔️​                                         | ✔️​                                     | ✔️                               |
| **MAQ Software**​ <br>[Embed Fast](https://maqsoftware.com/embedfast)​            | ✔️​                                         | ✔️​                                     | ✔️                                          | ✔️​                 |✔️​                 | ​                                          |✔️​                            | ✔️​                                         | ​                                       | ​                                   |
| **iLink Digital​** <br> [BiHub](https://www.ilink-digital.com/bihub/)                                   | ✔️​                                         | ✔️​                                     | ✔️                                          | ✔️​                 | ✔️                 | ​                                         | ✔️                           | ​                                           | ​                                        | ​                                  |

## Next steps

* [Embed Power BI analytics into an application for your customers](./embed-sample-for-customers.md)
