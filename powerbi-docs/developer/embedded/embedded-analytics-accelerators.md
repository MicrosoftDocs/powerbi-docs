---
title: Embedded analytics accelerator solutions from Microsoft partners
description: Learn about different accelerators our partners offer to facilitate embedded analytics for ISVs.
author: billmath
ms.author: billmath
ms.reviewer: ofer
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: concept-article
ms.date: 04/09/2025
---

# Embedded analytics solution accelerators from Microsoft partners

Microsoft's partners offer accelerators to expedite the integration of embedded analytics solutions with your applications. These accelerators are cost-effective and efficient, helping reduce the time to market for Power BI embedded analytics solutions, especially for multitenant, customer-facing applications. They're particularly useful for quickly advancing proof-of-concept (PoC) or pilot projects. Accelerators simplify the implementation process and help with managing Power BI capacity and billing.

Key advantages of using accelerators include:

* Enhanced Personalization and Functionality: Accelerators enhance user experience, offering personalized features for [Embed for your customers](./embedded-analytics-power-bi.md#embed-for-your-customers) scenario. This includes flexible options for end-user authentication, authorization, multitenancy, and permissions management.

* Simplified Implementation: The complex details of implementing Power BI embedded solutions are abstracted away. Some accelerators offer backend functionality through an SDK, with the need for other client front-end code development.

* Customization and White-Labeling: Once installed, you can white-label the solution, tailor its capabilities, and customize the user interface. White-label the solution, configure its capabilities, and customize the user experience once installed.​

* Acquisition and Ownership: Accelerators are developed and owned by Microsoft's partners and need to be purchased directly from them. They're cloud-based solutions deployed in your Azure environment, utilizing Azure and Fabric with Power BI services from Microsoft. Existing Microsoft subscriptions or licenses can be reused, the accelerators are also available for deployment through the Azure Marketplace.

* Integration Flexibility: Accelerators can function as standalone applications or be fully integrated with your existing application, as outlined in the [Deployment and integration options table](#deployment-and-integration-options).

[Watch a video that provides an overview of embedded solution accelerator partner programs](https://www.youtube.com/watch?v=djYgaWQoxeA).

Different partner accelerators vary in their deployment, acquisition/billing methods, and capabilities.
The following table briefly describes each of the current partners’ embedded analytics solution accelerators:"

There are several partner accelerators that vary in their deployment, acquisition/billing options and their capabilities. ​

| **Partner** <br> (accelerator)                  | **Description** | Website/Product link |
|-------------------------------------------------|--------------------------------|---------|
| :::image type="content" source="./media/embedded-analytics-accelerators/reporting-hub-logo.png" alt-text="Picture of The Reporting Hub logo.":::    | **The Reporting Hub**' accelerator: <br> **Reporting Hub** is a web-based business intelligence platform that seamlessly integrates with Power BI using Embedded technology. It's a plug 'n' play white label application that deploys to your Azure environment and allows you to instantly deliver Power BI in a more efficient and simplified manner. <br> [Watch an overview interview video of Reporting Hub](https://www.youtube.com/watch?v=33s8S1tfEUs). | :::image type="content" source="./media/embedded-analytics-accelerators/reporting-hub-horizontal.png" alt-text="Picture of the Reporting Hub logo."::: <br> [Reporting Hub](https://thereportinghub.com/) |
| :::image type="content" source="./media/embedded-analytics-accelerators/maq-logo.png" alt-text="Picture of the Maq Software logo."::: | **MAQ Software**'s accelerator: <br> **EmbedFAST** is a ready-to-use API that embeds Power BI into your existing apps with ease. Seamlessly embed Power BI with comprehensive features such as role-based access management and no per user licenses—without having to build from scratch. Save time, effort, costs, and resources by using EmbedFAST. <br> [Watch an overview interview video of EmbedFAST](https://www.youtube.com/watch?v=iwhMYf58SqE). | :::image type="content" source="./media/embedded-analytics-accelerators/embed-fast-logo.png" alt-text="Picture of the EmbedFAST logo."::: <br> [EmbedFAST](https://maqsoftware.com/embedFAST) |
| :::image type="content" source="./media/embedded-analytics-accelerators/carlo-solutions-logo.png" alt-text="Picture of the Carlo Solutions logo."::: | **Entelexos**' accelerator: <br> **Entelexos** is a Power BI Embedded accelerator that serves the needs of the report consumer. From viewing Power BI reports, and Paginated reports, to editing reports and   building custom paginated reports Entelexos simplifies the reporting experience. User experiences across Reports, Paginated Reports, and a custom table building and exportation experience integrates directly with know best practices from Power BI using row level security. Built on a modern data stack Entelexos is a solution to leverage your existing Power BI investments to make a white labeled solution with multitenant support.<br> [Watch an overview interview video of Entelexos](https://www.youtube.com/watch?v=1gepvkN-5SE). | :::image type="content" source="./media/embedded-analytics-accelerators/entelexos-logo.png" alt-text="Picture of the Entelexos logo."::: <br> [Entelexos](https://www.entelexos.com/) |
| :::image type="content" source="./media/embedded-analytics-accelerators/ilink-digital-logo.png" alt-text="Picture of the iLink Digital logo."::: | **iLink Digital**'s accelerator: <br> **EmbeDash** is a solution designed to empower Independent Software Vendors (ISVs) by seamless integration of Power BI reporting to offer advanced data visualization and analytics features, elevating the overall user experience while reducing time and costs. By leveraging Embedded Power BI, EmbeDash enhances the reporting experience for both internal and external users within an organization. <br> [Watch an overview interview video of EmbeDash](https://www.youtube.com/watch?v=TKHXN685XY4). | :::image type="content" source="./media/embedded-analytics-accelerators/embed-dash-logo.png" alt-text="Picture of the EmbeDash logo."::: <br> [EmbeDash](https://embedash.com/) |

The following diagram illustrates the main modules of an accelerator and how they relate to your existing multitenant web application:

:::image type="content" source="./media/embedded-analytics-accelerators/accelerator-workflow.png" alt-text="Diagram showing how accelerators work.":::

## Accelerator capabilities

Different accelerators provide different frontend and backend capabilities including the following options:

### Frontend capabilities

The following capabilities are available with *all* accelerators:

* Seamless data isolation per application tenant and data and item permission per user

* Navigation menu for categories and items of Power BI

* Action bar outside of Power BI iFrame to control the UX and invoke functionality (including to toggle between view and edit modes)

* Personal end user bookmark management & visual personalization

* Export report to file printouts (PDF, PPTX, PNG, and more for Paginated reports)

In addition, the following capabilities are available with *certain* solutions:

* Self-service report subscription to schedule and deliver report printouts

* Multi-language support for web frontend (outside of the iFrame)

* Tenant white-labeling

* Edit option for semantic model

* Unrestricted data download

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

  * Isolate tenant Power BI access with dedicated service principal profile identity to create/access tenant’s workspace​

  * Optionally sync & reuse existing information on the app’s tenants and their end users​

  * Manage tenant's end user access of Power BI items and data (with RLS/dynamic binding for dataset) ​

  * Collect and visualize usage analytics of tenants and their users​

* Capacity management​

  * Assign workspace to capacity to support global multi-geo deployment and to scale out with multiple capacities​

  * Manage capacities operation pause resume and scale up/scale down​

* Publishing & management of tenant’s Power BI content​

* Tenant use monetization and streamlined licensing billing & payment processing

To see which partner's solution contains which options, see the [comparison tables](#comparison-of-accelerators-from-our-partners) in the next section.

## Comparison of accelerators from our partners

The following tables compare features of the different accelerators from our partners. The tables are divided into the following sections:

* [Deployment options](#deployment-and-integration-options)
* [Acquisition and billing options](#acquisition-and-billing-options)
* [Added capabilities](#added-capabilities)

### Deployment and integration options

| Partner <br> **(accelerator)**                                      | Stand alone  | URL redirect  | Embedded in App’s iFrame | Backend + SDK only |
|---------------------------------------------------------------------|:------------:|:-------------:|:------------------------:|:------------------:|
| **The Reporting Hub**​ <br> [Reporting Hub](https://thereportinghub.com/) | ✔​       | ✔​            | ✔​                        | ​                   |
| **MAQ Software**​ <br>[EmbedFAST](https://maqsoftware.com/embedFAST)      |         |              ​ | ​                         | ✔​                  |
| **Carlo Solutions**​ <br>[Entelexos](https://www.entelexos.com/)          | ✔​       | ✔​            | ​                         | ​                   |
| **iLink Digital​** <br>[EmbeDash](https://embedash.com/)                  | ✔​       | ​             | ​ ✔                       | ​                   |

### Acquisition and billing options

| Partner <br> **(accelerator)**               |  Monthly subscriptions: <br> **Direct billing**     |  Monthly subscriptions: <br> **Azure Marketplace** | Free trial | One time purchase ​ | As part of consulting engagement​ |
|:---------------------------------------------|:---------------------------------------------------:|:--------------------------------------------------:|:--------------:|:----------------------:|:------------------------------------:|
| **The Reporting Hub**​ <br> [Reporting Hub](https://azuremarketplace.microsoft.com/marketplace/apps/shiftanalyticsinc1663186612563.reportinghub_prod_003?tab=Overview) | ✔​      | [:::image type="icon" source="./media/embedded-analytics-accelerators/marketplace-logo.png" border="false":::](https://azuremarketplace.microsoft.com/marketplace/apps/shiftanalyticsinc1663186612563.reportinghub_prod_003?tab=Overview)​    | ✔​   | ​     | ​     |
| **MAQ Software**​ <br>[EmbedFAST](https://azuremarketplace.microsoft.com/marketplace/apps/maqsoftware.embedfastpowerbi?tab=Overview)                                   |        | [:::image type="icon" source="./media/embedded-analytics-accelerators/marketplace-logo.png" border="false":::](https://azuremarketplace.microsoft.com/marketplace/apps/maqsoftware.embedfastpowerbi)                                         | ​     | ✔​   | ✔​    |
| **Carlo Solutions**​ <br>[Entelexos](https://azuremarketplace.microsoft.com/marketplace/apps/carloconsultingllc1611096483318.entelexos  )                              | ​  ✔    | [:::image type="icon" source="./media/embedded-analytics-accelerators/marketplace-logo.png" border="false":::](https://azuremarketplace.microsoft.com/marketplace/apps/carloconsultingllc1611096483318.entelexos)                            | ✔   | ​ ✔  |  ✔   |
| **iLink​** <br>[EmbeDash](https://azuremarketplace.microsoft.com/marketplace/apps/ilinksystems.embedash?tab=Overview)                                                  |  ✔     | [:::image type="icon" source="./media/embedded-analytics-accelerators/marketplace-logo.png" border="false":::](https://azuremarketplace.microsoft.com/marketplace/apps/ilinksystems.embedash?tab=Overview)                                  | ​     | ​ ✔   | ✔​   |

### Added capabilities

| Partner                               | Report scheduling​ & distribution | Tenant specific white labeling | Multi-language portal support​ | Edit semantic model​ | Unrestricted data download​ | Paginated table builder | Tenant specific authentication | Tenant billing and payment processing |
|---------------------------------------|:--------------------------------:|:------------------------------:|:-----------------------------:|:-------------------:|:--------------------------:|:-----------------------:|:-----------------------------:|:-------------------------------------:|
| **The Reporting Hub**​ <br> [Reporting Hub](https://thereportinghub.com/)​ | ✔  |​ ✔ | ✔​  | ​   |    |   | ✔ | ✔ |
| **MAQ Software**​ <br>[EmbedFAST](https://maqsoftware.com/embedFAST)​      | ✔  | ✔ |  ​  |​ ✔  | ✔​  |   |   |   |
| **Carlo Solutions**​ <br> [Entelexos](https://www.entelexos.com/)​         | ​   |​ ✔ | ​   | ​    | ✔  | ✔ |   |   |
| **iLink Digital​** <br> [EmbeDash](https://embedash.com/)                 | ​✔  | ✔ |   | ​    |   ​  |   | ✔ |   |

## Related content

* Watch [video interviews](https://www.youtube.com/watch?v=djYgaWQoxeA) describing the accelerator program and each accelerator.

* Visit each partner's product website to learn more about their solution accelerator:

  * [Reporting Hub](https://thereportinghub.com/)
  * [EmbedFAST](https://maqsoftware.com/embedFAST)
  * [Entelexos](https://www.entelexos.com/)
  * [EmbeDash](https://embedash.com/)

* [Find a Microsoft partner](https://partner.microsoft.com/partnership/find-a-partner) for consulting and assistance in building Power BI content.
