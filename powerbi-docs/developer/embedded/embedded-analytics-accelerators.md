---
title: Embedded analytics accelerator solutions from Microsoft partners
description: Learn about different accelerators our partners offer to facilitate embedded analytics for ISVs.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ofer
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 09/26/2023
---

# Embedded analytics solution accelerators from Microsoft partners

Microsoft partners offer accelerators to expedite the implementation of embedded analytics solutions integrated with your application. Embedded analytics accelerators are a cost-effective way to speed up time-to-market or advance a PoC or pilot for your multitenant, customer-facing Power BI embedded analytics solution​. They simplify the implementation process and can also help you manage your Power BI capacity and billing.  

The following diagram illustrates the main modules of an accelerator and how they relate to your Azure and Power BI subscriptions and interact with to your existing multitenant web application.

:::image type="content" source="./media/embedded-analytics-accelerators/accelerator-workflow.png" alt-text="Diagram showing how accelerators work.":::

Here are some advantages of using an accelerator:

* Accelerators provide an enhanced personalized user experience and added functionality for [Embed for your customers](./embedded-analytics-power-bi.md#embed-for-your-customers) scenario with flexible end-user authentication and authorization options and support for multitenancy and end-user permissions management.

* Implementation details of the sophisticated Power BI embedded solution they provide are hidden.
Some accelerators provide backend only functionality via an SDK and require code development for the client front-end.​

* White-label the solution, configure its capabilities, and customize the user experience once installed.​

* Accelerators are developed, owned, and need to be purchased directly from the corresponding partner. The accelerators implement cloud based solutions that are deployed into your Azure environment and use Azure and Power BI/Fabric services that need to be acquired from Microsoft. You can reuse an existing subscription or license if you already have one. Some accelerators may offer a deployment option via the Azure Marketplace. ​

* An accelerator can exist as stand-alone applications or be fully integrated with your original application, as described in the [Deployment and integration options table](#deployment-and-integration-options).

There are several partner accelerators that vary in their deployment, acquisition/billing options and their capabilities. ​

| **Partner** <br> (accelerator)                  | **Description** | Website/Product link |
|-------------------------------------------------|--------------------------------|---------|
| :::image type="content" source="./media/embedded-analytics-accelerators/reporting-hub-logo.png" alt-text="The logo of the Reporting Hub.":::    | The Reporting Hub is a web-based business intelligence platform that seamlessly integrates with Power BI using Embedded technology. It's a plug 'n' play white label application that deploys to your Azure environment and allows you to instantly deliver Power BI in a more efficient and simplified manner. | [The Reporting Hub](https://thereportinghub.com/) |
| :::image type="content" source="./media/embedded-analytics-accelerators/maq-logo.png" alt-text="The logo of Maq Software.":::               | The EmbedFAST is a ready-to-use API that embeds Power BI into your existing apps with ease. Seamlessly embed Power BI with comprehensive features such as role-based access management and no per user licenses—without having to build from scratch. Save time, effort, costs, and resources by using the EmbedFAST. | [EmbedFAST](https://maqsoftware.com/embedfast) |
| :::image type="content" source="./media/embedded-analytics-accelerators/ilink-digital-logo.png" alt-text="The logo of Count.":::                           | The BiHub presents a seamless, no-code reporting gateway designed for Power BI, using cutting-edge Embedded technology. The BiHub is a cloud-based application that is installed and deployed within your Azure environment. It integrates with existing Microsoft tenants and communicates with Power BI Embedded via Microsoft APIs. | [BiHub](https://www.ilink-digital.com/bihub/) |

## Accelerator capabilities

Different accelerators provide different frontend and backend capabilities including the following options:

### Frontend capabilities

* Navigation menu for categories and items of Power BI​

* Action bar above the Power BI iFrame to control the UX and invoke functionality  ​

  * End user bookmark management & visual personalization​

  * Export report to file printouts (PDF, PPTX, PNG, and more for Paginated reports)​

  * UX pane control and report edit/view toggle​

  * Report subscriptions and scheduling of printouts​

* Seamless multitenancy and user permissions support​

  * Show each tenant user only their own data even when using the same report across the tenant

  * Show the user only the items and data they have access to

  * Allow switching to edit mode based on user permissions (access level on report) ​

* Multi-language support for web frontend

To see which partner's solution contains which options, see the [comparison tables](#comparison-of-accelerators-from-our-partners).

### Backend capabilities

The following features and capabilities are available in the backend and admin modules of the accelerators:

#### Backend module​

* Support multiple end user authentication providers, potentially a different one per tenant​

* Generate and refresh access and embed tokens per tenant workspace isolation and user permissions​

* Support frontend features: asynchronous print to file and report subscriptions, scheduling & distribution​

* Expose backend SDK for your custom frontend embedded as iFrame in the existing ISV app​

#### Admin module (including UI and config database)​

* Multitenancy solution management within the same Power BI tenant

  * Auto provision workspace when on-boarding a new tenant​

  * Isolate tenants’ data and reports in their respective workspaces ​

  * Isolate tenant PBI access with dedicated service principal profile identity to create/access tenant’s workspace​

  * Optionally sync & reuse existing information on the app’s tenants and their end users​

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

* [Deployment options](#deployment-and-integration-options)
* [Acquisition and billing options](#acquisition-and-billing-options)
* [Added capabilities](#added-capabilities)

### Deployment and integration options

| Partner <br> **(accelerator)**                                                                             | Stand alone        | URL redirect      | Embedded in App’s iFrame | Backend + SDK only |
|-------------------------------------------------|:-----------------:|:--------------:|:---------------------:|:----------------:|
| [**Shift Analytics**](https://shiftanalytics.ca/)​ <br> [The Reporting Hub](https://thereportinghub.com/) | ✔​                | ✔​                | ✔​                      | ​                   |
| [**MAQ Software**](https://maqsoftware.com/)​ <br>[EmbedFAST](https://maqsoftware.com/embedfast)                                              |   | ​ | ​                         | ✔​                |
| [**iLink Digital​**](https://www.ilink-digital.com/) <br>[BiHub](https://www.ilink-digital.com/bihub/)                                            | ✔​                | ​                  | ​                         | ​                   |

### Acquisition and billing options

| Partner <br> **(accelerator)**               |  Monthly subscriptions: <br> **Direct billing**     |  Monthly subscriptions: <br> **Azure Marketplace** | Free trial | One time purchase ​ | As part of consulting engagement​ |
|:---------------------------------------------|:---------------------------------------------------:|:--------------------------------------------------:|:--------------:|:----------------------:|:------------------------------------:|
| **Shift Analytics**​ <br> [The Reporting Hub](https://thereportinghub.com/) | ✔​                                                 | [:::image type="icon" source="./media/embedded-analytics-accelerators/marketplace-logo.png" border="false":::](https://azuremarketplace.microsoft.com/marketplace/apps/maqsoftware.embedfastpowerbi)​                                  | ✔​             | ​                       | ​                                     |
| **MAQ Software**​ <br>[EmbedFAST](https://maqsoftware.com/embedfast)            |                                    | [:::image type="icon" source="./media/embedded-analytics-accelerators/marketplace-logo.png" border="false":::](https://azuremarketplace.microsoft.com/marketplace/apps/shiftanalyticsinc1663186612563.reportinghub_2)                                  | ​               | ✔​                    | ✔​                                   |
| **iLink​** <br>[BiHub](https://www.ilink-digital.com/bihub/)                        |  ​                                                   | ​                                | ✔​              | ​                      | ✔​                                   |

### Added capabilities

| Partner                                  | Personal​<br>bookmarks | Report​<br>Printout | Control​<br> UX options | Navigation​<br>Menu | Multi-tenancy​ | Tenant specific​<br>authN &​<br>white-labeling​ | Power BI item​<br>publishing | Report subs.​<br>scheduling & ​<br>distribution​ | Tenant billing​<br>& payment​<br>processing​ | Multi-language​<br>portal support​ |
|----------------------------------------------|:-------------------------------:|:-----------------------------:|:--------------------------------:|:-----------------:|:----------------:|:----------------------------:|:--------------------:|:-----------------------------:|:--------------------------:|:-------------------------:|
| **Shift Analytics**​ <br> [The Reporting Hub](https://thereportinghub.com/)​ | ✔                                         | ✔                                     | ✔                                          | ✔                 | ✔                | ✔                                        | ​                             | ✔​                                         | ✔​                                     | ✔                               |
| **MAQ Software**​ <br>[EmbedFAST](https://maqsoftware.com/embedfast)​            | ✔​                                         | ✔​                                     | ✔                                          | ✔​                 |✔​                 | ​                                          |✔​                            | ✔​                                         | ​                                       | ​                                   |
| **iLink Digital​** <br> [BiHub](https://www.ilink-digital.com/bihub/)                                   | ✔​                                         | ✔​                                     | ✔                                          | ✔​                 | ✔                 | ​                                         | ✔                           | ​                                           | ​                                        | ​                                  |

## Next steps

* To learn more about each partner’s solution accelerator, visit their corresponding product website:

  * [The Reporting Hub](https://thereportinghub.com/)

  * [EmbedFAST](https://maqsoftware.com/embedfast)

  * [BiHub](https://www.ilink-digital.com/bihub/)

[Find a Microsoft partner](https://partner.microsoft.com/partnership/find-a-partner)
