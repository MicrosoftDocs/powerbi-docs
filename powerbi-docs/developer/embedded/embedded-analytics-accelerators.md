---
title: Embedded analytics accelerator solutions from Microsoft partners
description: Learn about different accelerators our partners offer to facilitate embedded analytics for ISVs.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ofer
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 01/31/2024
---

# Embedded analytics solution accelerators from Microsoft partners

Microsoft's partners offer accelerators to expedite the integration of embedded analytics solutions with your applications. These accelerators are designed to be cost-effective and efficient, reducing the time-to-market for your Power BI embedded analytics solutions, particularly for multitenant, customer-facing applications. They're particularly useful for quickly advancing proof-of-concept (PoC) or pilot projects. Accelerators simplify the implementation process and assist in managing Power BI capacity and billing.

Key advantages of using accelerators include:

* Enhanced Personalization and Functionality: Accelerators enhance user experience, offering personalized features for [Embed for your customers](./embedded-analytics-power-bi.md#embed-for-your-customers) scenario. This includes flexible options for end-user authentication, authorization, multitenancy, and permissions management.

* Simplified Implementation: The complex details of implementing Power BI embedded solutions are abstracted away. Some accelerators offer backend functionality through an SDK, with the need for additional client front-end code development.

* Customization and White-Labeling: Once installed, you can white-label the solution, tailor its capabilities, and customize the user interface. White-label the solution, configure its capabilities, and customize the user experience once installed.​

* Acquisition and Ownership: Accelerators are developed and owned by Microsoft's partners and need to be purchased directly from them. They're cloud-based solutions deployed in your Azure environment, utilizing Azure and Fabric with Power BI services from Microsoft. Existing Microsoft subscriptions or licenses can be reused, the accelerators are also available for deployment through the Azure Marketplace.

* Integration Flexibility: Accelerators can function as standalone applications or be fully integrated with your existing application, as outlined in the [Deployment and integration options table](#deployment-and-integration-options).

[Watch a video describing an overview of embedded solution accelerator partner programs](https://microsoft.github.io/PartnerResources/skilling/microsoft-partner-showcase/embedded-analytics).

Different partner accelerators vary in their deployment, acquisition/billing methods, and capabilities.
The following table briefly describes each of the current partners’ embedded analytics solution accelerators:"

There are several partner accelerators that vary in their deployment, acquisition/billing options and their capabilities. ​

| **Partner** <br> (accelerator)                  | **Description** | Website/Product link |
|-------------------------------------------------|--------------------------------|---------|
| :::image type="content" source="./media/embedded-analytics-accelerators/power-tuning-logo.png" alt-text="Picture of the Power Tuning logo."::: | **Power Tuning** accelerator: <br> **Power Embedded** is a web-based Software as a Service (SaaS) reporting platform that allows companies to reduce Power BI licensing costs by up to 90% using a Power BI Embedded or Microsoft Fabric capacity and adds some new features to Power BI for security, auditing, management and sharing capabilities for both internal and external users, without having to code or host any resource. <br> [Watch an overview interview video of Power Embedded](https://microsoft.github.io/PartnerResources/skilling/microsoft-partner-showcase/powerembedded). | :::image type="content" source="./media/embedded-analytics-accelerators/power-embedded-logo.png" alt-text="Picture of the Power Embedded logo."::: <br> [Power Embedded](https://powerembedded.com.br/) |
| :::image type="content" source="./media/embedded-analytics-accelerators/shift-logo.png" alt-text="Picture of the Shift Analytics logo.":::    | **Shift Analytics**' accelerator: <br> **The Reporting Hub** is a web-based business intelligence platform that seamlessly integrates with Power BI using Embedded technology. It's a plug 'n' play white label application that deploys to your Azure environment and allows you to instantly deliver Power BI in a more efficient and simplified manner. <br> [Watch an overview interview video of the Reporting Hub](https://microsoft.github.io/PartnerResources/skilling/microsoft-partner-showcase/reportinghub). | :::image type="content" source="./media/embedded-analytics-accelerators/reporting-hub-logo.png" alt-text="Picture of the Reporting Hub logo."::: <br> [The Reporting Hub](https://thereportinghub.com/) |
| :::image type="content" source="./media/embedded-analytics-accelerators/maq-logo.png" alt-text="Picture of the Maq Software logo."::: | **MAQ Software**'s accelerator: <br> **EmbedFAST** is a ready-to-use API that embeds Power BI into your existing apps with ease. Seamlessly embed Power BI with comprehensive features such as role-based access management and no per user licenses—without having to build from scratch. Save time, effort, costs, and resources by using EmbedFAST. <br> [Watch an overview interview video of EmbedFAST](https://microsoft.github.io/PartnerResources/skilling/microsoft-partner-showcase/embedfast). | :::image type="content" source="./media/embedded-analytics-accelerators/embed-fast-logo.png" alt-text="Picture of the EmbedFAST logo."::: <br> [EmbedFAST](https://maqsoftware.com/embedfast) |
| :::image type="content" source="./media/embedded-analytics-accelerators/ilink-digital-logo.png" alt-text="Picture of the iLink Digital logo."::: | **iLink Digital**'s accelerator: <br> **EmbeDash** enables Independent Software Vendors (ISVs) to provide Analytics as a Service (AaaS) using Power BI Embedded. This Accelerator reduces the time to market and allows ISVs to add strong self-service reporting capabilities, without having to code them themselves. <br> [Watch an overview interview video of EmbeDash](https://microsoft.github.io/PartnerResources/skilling/microsoft-partner-showcase/embedash). | :::image type="content" source="./media/embedded-analytics-accelerators/embed-dash-logo.png" alt-text="Picture of the EmbeDash logo."::: <br> [EmbeDash](https://embedash.com/) |

The following diagram illustrates the main modules of an accelerator and how they relate to your existing multitenant web application:

:::image type="content" source="./media/embedded-analytics-accelerators/accelerator-workflow.png" alt-text="Diagram showing how accelerators work.":::

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
| **Power Tuning**​ <br> [Power Embedded](https://powerembedded.com.br/) | ✔​                | ✔​                | ✔​                      | ​                   |
| **Shift Analytics**​ <br> [The Reporting Hub](https://thereportinghub.com/) | ✔​                | ✔​                | ✔​                      | ​                   |
| **MAQ Software**​ <br>[EmbedFAST](https://maqsoftware.com/embedfast)                                              |   | ​ | ​                         | ✔​                |
| **iLink Digital​** <br>[EmbeDash](https://embedash.com/)                                            | ✔​                | ​                  | ​                         | ​                   |

### Acquisition and billing options

| Partner <br> **(accelerator)**               |  Monthly subscriptions: <br> **Direct billing**     |  Monthly subscriptions: <br> **Azure Marketplace** | Free trial | One time purchase ​ | As part of consulting engagement​ |
|:---------------------------------------------|:---------------------------------------------------:|:--------------------------------------------------:|:--------------:|:----------------------:|:------------------------------------:|
| **Power Tuning**​ <br> [Power Embedded](https://azuremarketplace.microsoft.com/pt-br/marketplace/apps/powertuningperformanceemdados1702567987391.powerembedded?tab=Overview) | ✔​                                                 | [:::image type="icon" source="./media/embedded-analytics-accelerators/marketplace-logo.png" border="false":::] | ✔​              | ​                      | ✔​                                   |
| **Shift Analytics**​ <br> [The Reporting Hub](https://azuremarketplace.microsoft.com/marketplace/apps/shiftanalyticsinc1663186612563.reportinghub_prod_003?tab=Overview) | ✔​                                                 | [:::image type="icon" source="./media/embedded-analytics-accelerators/marketplace-logo.png" border="false":::](https://azuremarketplace.microsoft.com/marketplace/apps/shiftanalyticsinc1663186612563.reportinghub_prod_003?tab=Overview)​        | ✔​             | ​                       | ​              |
| **MAQ Software**​ <br>[EmbedFAST](https://azuremarketplace.microsoft.com/marketplace/apps/maqsoftware.embedfastpowerbi?tab=Overview)            |                                    | [:::image type="icon" source="./media/embedded-analytics-accelerators/marketplace-logo.png" border="false":::](https://azuremarketplace.microsoft.com/marketplace/apps/maqsoftware.embedfastpowerbi)                                  | ​               | ✔​                    | ✔​                                   |
| **iLink​** <br>[EmbeDash](https://azuremarketplace.microsoft.com/marketplace/apps/ilinksystems.embedash?tab=Overview)                        |  ​                                                   | [:::image type="icon" source="./media/embedded-analytics-accelerators/marketplace-logo.png" border="false":::](https://azuremarketplace.microsoft.com/marketplace/apps/ilinksystems.embedash?tab=Overview)                               | ✔​              | ​                      | ✔​                                   |

### Added capabilities

| Partner                                  | Personal​<br>bookmarks | Report​<br>Printout | Control​<br> UX options | Navigation​<br>Menu | Multi-tenancy​ | Tenant specific​<br>authN &​<br>white-labeling​ | Power BI item​<br>publishing | Report subs.​<br>scheduling & ​<br>distribution​ | Tenant billing​<br>& payment​<br>processing​ | Multi-language​<br>portal support​ |
|----------------------------------------------|:-------------------------------:|:-----------------------------:|:--------------------------------:|:-----------------:|:----------------:|:----------------------------:|:--------------------:|:-----------------------------:|:--------------------------:|:-------------------------:|
| **Power Tuning**​ <br> [Power Embedded](https://powerembedded.com.br/)​ | ✔                                         | ✔                                     | ✔                                          | ✔                 | ✔                | ✔                                        | ​✔                             | ✔​                                         | ✔​                                     | ✔                               |
| **Shift Analytics**​ <br> [The Reporting Hub](https://thereportinghub.com/)​ | ✔                                         | ✔                                     | ✔                                          | ✔                 | ✔                | ✔                                        | ​                             | ✔​                                         | ✔​                                     | ✔                               |
| **MAQ Software**​ <br>[EmbedFAST](https://maqsoftware.com/embedfast)​            | ✔​                                         | ✔​                                     | ✔                                          | ✔​                 |✔​                 | ​                                          |✔​                            | ✔​                                         | ​                                       | ​                                   |
| **iLink Digital​** <br> [EmbeDash](https://embedash.com/)                                   | ✔​                                         | ✔​                                     | ✔                                          | ✔​                 | ✔                 | ​                                         | ✔                           | ​                                           | ​                                        | ​                                  |

## Related content

* To watch interview video recordings describing the accelerator program and each accelerator visit the [Microsoft Partner Showcase - Embedded Analytics Solution Accelerators page](https://microsoft.github.io/PartnerResources/skilling/microsoft-partner-showcase/embedded-analytics).

* To learn more about each partner’s solution accelerator, visit their corresponding product website:

  * [Power Embedded](https://powerembedded.com.br/)

  * [The Reporting Hub](https://thereportinghub.com/)

  * [EmbedFAST](https://maqsoftware.com/embedfast)

  * [EmbeDash](https://embedash.com/)

* [Find a Microsoft partner](https://partner.microsoft.com/partnership/find-a-partner) for consulting and assistance in building Power BI content.
