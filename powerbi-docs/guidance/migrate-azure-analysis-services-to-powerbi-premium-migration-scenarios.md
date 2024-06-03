---
title: "Migrate from Azure Analysis Services to Power BI Premium: Migration scenarios"
description: Scenario-based guidance to help you determine the right type and number of Power BI Premium licenses when migrating from Azure Analysis Services.
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat, intro-migration
ms.date: 12/08/2022
---

# Migrate from Azure Analysis Services to Power BI Premium: Migration scenarios

This article compares six hypothetical scenarios when migrating from Azure Analysis Services (AAS) to Power BI Premium. These scenarios can help you to determine the right type and number of licenses for your business requirements and circumstances.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

> [!NOTE]
> An attempt has been made to ensure these scenarios are representative of real customer migrations, however individual customer scenarios will of course differ. Also, this article doesn't include pricing details. You can find current pricing here:
>
> - [Power BI pricing](https://powerbi.microsoft.com/pricing/)
> - [Azure Analysis Services pricing](https://azure.microsoft.com/pricing/details/analysis-services/)

When comparing Power BI Premium to AAS costs, be sure to consider factors beyond price per core. Power BI provides reduced cost of ownership and business value, and with [many features](migrate-azure-analysis-services-to-powerbi-premium.md#feature-comparison) that are only available to Power BI data models.

Also, assuming you already use Power BI in your organization, calculate costs based on the existing profile that *combines* AAS and Power BI. Compare the existing profile with the target profile on Power BI Premium. To determine the target profile, be sure to consider the following points:

- Region requirements.
- The largest AAS data model size in each region.
- The number of users in each region.
- The number of users required to develop and manage content.
- CPU consumption across AAS and Power BI Premium.

> [!IMPORTANT]
> CPU consumption across AAS and Power BI Premium may vary significantly due to numerous factors. Factors can include the use of other workloads on the same capacities, refresh patterns, and query patterns. We recommended that you perform in-depth analysis to quantify comparative CPU consumption across AAS and Power BI Premium for migrated models.

## Migration scenario 1

In the first migration scenario, the customer uses Power BI Premium for the frontend and AAS for the backend. There are 20 developers who are each responsible for the development and test environments, and for deployment to production.

Here are their current AAS licenses:

| **Environment** | **Largest model** | **AAS SKU** |
|:-|:-:|:-:|
| Production | 60 GB | S4 |
| Production | 30 GB | S2 |
| Production | 15 GB | S1 |
| Test | 5 GB | B1 |
| Development | 1 GB | D1 |

Here are their current Power BI licenses:

| **Environment** | **Power BI license** | **Users** |
|:-|:-|-:|
| Production | Premium P2 | 5,000 |
| Test/development | Premium P1 | 20 |
| Production/test/development | Pro | 20 |

Once migrated to Power BI Premium:

- The three existing production AAS models can be consolidated to run in a Premium P3 capacity.
- The 20 developers will need Premium Per User (PPU) licenses to access test models above 1 GB in size.

Here are the proposed Power BI licenses:

| **Environment** | **Power BI license** | **Users** | **Largest model** |
|:-|:-|-:|:-:|
| Production | Premium P3 | 5,000 | 60 GB |
| Production/test/development | PPU | 20 | 5 GB |

## Migration scenario 2

In this migration scenario, the customer uses Power BI Premium for the frontend and AAS for the backend. Production environments are running *in different regions*. There are 20 developers who are each responsible for the development and test environments, and for deployment to production.

Here are their current AAS licenses:

| **Region** | **Environment** | **Largest model** | **AAS SKU** |
|:-|:-|:-:|:-:|
| West Europe | Production | 60 GB | S4 |
| Brazil South | Production | 30 GB | S2 |
| West US | Production | 15 GB | S1 |
| West US | Test | 5 GB | B1 |
| West US | Development | 1 GB | D1 |

Here are their current Power BI licenses:

| **Region** | **Environment** | **Power BI license** | **Users** |
|:-|:-|:-|-:|
| West Europe | Production | Premium P1 | 2,000 |
| Brazil South | Production | Premium P1 | 2,000 |
| West US | Production | Premium P1 | 2,000 |
| West US | Test/development | Premium P1 | 20 |
| West US | Production/test/development | Pro | 20 |

Once migrated to Power BI Premium:

- The customer needs a Premium capacity in each of the three regions (because the three existing production AAS models run in different regions). Each capacity size is based on the largest model.
- The 20 developers will need PPU licenses to access test models above 1 GB in size.

Here are the proposed Power BI licenses:

| **Region** | **Environment** | **Power BI license** | **Users** | **Largest model** |
|:-|:-|:-|-:|:-:|
| West Europe | Production | Premium P3 | 2,000 | 60 GB |
| Brazil South | Production | Premium P2 | 2,000 | 30 GB |
| West US | Production | Premium P1 | 2,000 | 15 GB |
| West US | Production/test/development | PPU | 20 | 5 GB |

## Migration scenario 3

In this migration scenario, the customer has Power BI Pro licenses for all users available with their Office 365 E5 subscription, and they use AAS for the backend. There are 15 developers who are each responsible for the development and test environments, and for deployment to production.

Here are their current AAS licenses:

| **Environment** | **Largest model** | **AAS SKU** |
|:-|:-:|:-:|
| Production | 35 GB | S2 |
| Production | 30 GB | S2 |
| Test | 5 GB | B1 |
| Development | 1 GB | D1 |

Here are their current Power BI licenses:

| **Environment** | **Power BI license** | **Users** |
|:-|:-|-:|
| Production | Pro (as part of E5) | 4,000 |
| Production/test/development | Pro (as part of E5) | 15 |

Once migrated to Power BI Premium:

- The two existing production AAS models can be consolidated to run in a Premium P2 capacity.
- The 15 developers will need PPU licenses to access test models above 1 GB in size. (An add-on is available to step up from Pro to PPU.)

Here are the proposed Power BI licenses:

| **Environment** | **Power BI license** | **Users** | **Largest model** |
|:-|:-|-:|:-:|
| Production | Premium P2 | 4,000 | 35 GB |
| Production/test/development | PPU | 15 | 5 GB |

## Migration scenario 4

In this migration scenario, the customer has Power BI Pro licenses for all users, and they use AAS for the backend. There are five developers who are each responsible for the development and test environments, and for deployment to production.

Here are their current AAS licenses:

| **Environment** | **Largest model** | **AAS SKU** |
|:-|:-:|:-:|
| Production | 35 GB | S2 |
| Production | 10 GB | S1 |
| Test | 5 GB | B1 |
| Development | 1 GB | D1 |

Here are their current Power BI licenses:

| **Environment** | **Power BI license** | **Users** |
|:-|:-|-:|
| Production | Pro | 350 |
| Production/test/development | Pro | 5 |

Once migrated to Power BI Premium:

- The two existing production AAS models can run in PPU workspaces.
- All end users and developers will need PPU licenses.

Here are the proposed Power BI licenses:

| **Environment** | **Power BI license** | **Users** | **Largest model** |
|:-|:-|-:|:-:|
| Production | PPU | 350 | 35 GB |
| Production/test/development | PPU | 5 | 5 GB |

## Migration scenario 5

In this migration scenario, the customer uses Power BI Premium for the frontend and AAS for the backend. There are 25 developers who are each responsible for the development and test environments, and for deployment to production.

Here are their current AAS licenses:

| **Environment** | **Largest model** | **AAS SKU** |
|:-|:-:|:-:|
| Production | 220 GB | S9 |
| Production | 150 GB | S8 |
| Production | 60 GB | S4 |
| Test | 5 GB | B1 |
| Development | 1 GB | D1 |

Here are their current Power BI licenses:

| **Environment** | **Power BI license** | **Users** |
|:-|:-|-:|
| Production | Premium P3 | 7,500 |
| Production | Premium P2 | 4,500 |
| Test/development | Premium P1 | 25 |
| Production/test/development | Pro | 25 |

Once migrated to Power BI Premium:

- The three existing production AAS models can be consolidated to run in a Premium P5 capacity.
- The 20 developers will need PPU licenses to access test models above 1 GB in size.

Here are the proposed Power BI licenses:

| **Environment** | **Power BI license** | **Users** | **Largest model** |
|:-|:-|-:|:-:|
| Production | Premium P5 | 12,000 | 220 GB |
| Production/test/development | PPU | 25 | 5 GB |

## Migration scenario 6

In this migration scenario, an ISV company has 400 customers. Each customer has its own SQL Server Analysis Services (SSAS) multidimensional model (also known as a *cube*). The analysis below compares Azure Analysis Services with the Power BI Embedded alternative.

- The 400 tenants are mainly accessed by 50 analysts from the ISV company as well as two users (on average) from each customer.
- The total size of the models is about 100 GB.

Here are their estimated AAS licenses:

| **Environment** | **Largest model** | **AAS SKU** |
|:-|:-:|:-:|
| Production | 8 GB | S4 |
| Test | 8 GB | B1 |
| Development | 1 GB | D1 |

Here are their current Power BI licenses:

| **Users** | **Power BI license** | **Users** |
|:-|:-:|:-:|
| Customers | Pro | 800 |
| Analysts | Pro | 50 |
| Developers | Pro | 20 |

Once migrated to Power BI Premium:

- The A1/P4 SKU was chosen to allow for future model size growth (EM3/A3 SKU can work also).
- The 50 analysts will need PPU licenses to access test models above 1 GB in size.
- The total size of the 400 models isn't relevant for pricing; only the largest model size is important.

Here are their proposed Power BI licenses:

| **Environment** | **Power BI license** | **Users** | **Largest model** |
|:-|:-|-:|:-:|
| Production | Premium P1 / Power BI Embedded A4 | Not applicable | 25 GB |
| Test/development | Premium EM3 / Power BI Embedded A3 | Not applicable | 10 GB |
| Developers | Pro | 20 | Not applicable |
| Production/test/development | PPU | 50 | Not applicable |

## Premium migration benefits

Customers can realize many benefits when they migrate from AAS to Power BI Premium.

- Customers can consolidate to a single platform that reduces cost duplication of paying for both AAS and Power BI Premium.
- By using Premium for their entire BI stack, customers can unlock increased performance and features. They only need Pro licenses for developers and admins, but not for end users.
- Customers can use Power BI Premium scalability to reduce their capacity requirements, since memory is limited per semantic model ([previously known as a dataset](../connect-data/service-datasets-rename.md)) and isn't compared to total over the server as it is in AAS. For more information, see [Memory allocation](../enterprise/service-premium-what-is.md#semantic-model-sku-limitation).
- For development and test environments, customers can take advantage of PPU licensing instead of having Premium capacities. PPU licenses provide users access to Premium features like [the XMLA endpoint](../enterprise/service-premium-connect-tools.md), [deployment pipelines](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines), and [Premium dataflow features](../transform-model/dataflows/dataflows-premium-features.md). Furthermore, they can work with models that above 1 GB in size.

## Related content

For more information about this article, check out the following resources:

- [Migrate from Azure Analysis Services to Power BI Premium](migrate-azure-analysis-services-to-powerbi-premium.md)
- [What is Power BI Premium?](../enterprise/service-premium-what-is.md)
- [Power BI pricing](https://powerbi.microsoft.com/pricing/)
- [Azure Analysis Services pricing](https://azure.microsoft.com/pricing/details/analysis-services/)
- Questions? [Try asking the Power BI community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com)

Power BI partners are available to help your organization succeed with the migration process. To engage a Power BI partner, visit the [Power BI partner portal](https://powerbi.microsoft.com/partners/).
