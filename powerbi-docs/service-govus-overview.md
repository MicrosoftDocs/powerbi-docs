---
title: Power BI for United States Government customers - Overview
description: For U.S. Government customers, learn about the features and limitations for the Power BI US Government service
services: powerbi
documentationcenter: ''
author: davidiseminger
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 09/06/2017
ms.author: davidi

---
# Power BI for US Government customers
The **Power BI service** has a version available for United States Government customers as part of the **Office 365 US Government Community** subscriptions. The **Power BI service** version discussed in this article is specifically designed for US Government customers, and is separate and different from the commercial version of the **Power BI service**.

![](media/service-govus-overview/service_usgov_overview-1.png)

The following sections describe the *features* available to the US Government version of the **Power BI service**, clarifies some of the *limitations*, lists Frequently Asked Questions (**FAQ**) and answers (including how to sign up), and provides links for more information.

## Features of Power BI US Government
It's important to note that **Power BI US Government** is only available as a **Pro license**, and is not available as a Free license. Certain features of the Power BI service are available in the **Power BI US Government** version of the service.

The following features are available to **Power BI US Government** customers, as they apply to **Pro** license functionality:

* Create and view dashboards and reports
* [Data capacity limits](service-admin-manage-your-data-storage-in-power-bi.md)
* [Scheduled data refresh](refresh-data.md)
* Refreshable team dashboards
* Active Directory groups for sharing and managing access control
* [Import data](service-get-data.md) and reports from Excel, CSV, and Power BI Desktop files
* Data Management Gateway
* All data is encrypted in both Azure SQL and Blob Storage for Power BI
* Connect to services with [content packs](service-connect-to-services.md)

## Limitations of Power BI US Government
Some of the features that are available in the commercial version of the **Power BI service** are *not* available in the **Power BI service** for US Government customers. The Power BI team is actively working on making these features available to US Government customers, and will update this article when these features become available.

* **Power BI US Government** is only available as a **Pro** license. Any references to Power BI (Free) licenses in an admin portal (or as users) are running in a commercial Power BI service cloud.
* **Auditing** - auditing is not available through the Office 365 Security and Compliance portal.

If you have **Power BI** Free licenses assigned to your account, those accounts are running in a commercial version of the **Power BI** service, and are not part of the **Power BI US Government** offering. For those Free accounts, you may encounter the following issues:

* Gateway, Mobile, and Desktop can’t authenticate
* You cannot access Azure commercial data sources
* PBIX files must be manually uploaded from commercial
* Power BI mobile apps are not available

To resolve issues, please contact your account representative.

## Frequently Asked Questions (FAQ) for the US Government version of the Power BI service
The following questions (and answers) are provided to help you quickly get information you need about the service.

**Question:** How do I migrate my commercial **Power BI** data to the **Power BI service** for US Government?

**Answer:** Your admin must create a new instance of **Power BI** under a separate, US Government-specific subscription. You can then replicate your commercial data in the **Power BI service** for US Government, remove your commercial license, and associate your existing domain to the new US Government-specific service.

**Question:** Why can't I connect to a specific content pack?

**Answer:** You need to ensure your subscription is enabled before connecting to that content pack.

**Question:** I'm interested in getting **Power BI** for my US Government organization. How do I get started?

**Answer:** Signing up (often called *onboarding*) might differ based on your existing license and subscription. See the [Sign Up for Power BI US Government](service-govus-signup.md) article for more information.

**Question:** Is the URL for connecting to **Power BI** for US Government different than the commercial **Power BI** URL?

**Answer:** Yes, the URLs are different. The following table shows each URL:

| Commercial version URL | US Government version URL |
| --- | --- |
| https://app.powerbi.com/ |[https://app.powerbigov.us](https://app.powerbigov.us) |

## Next steps
There are all sorts of things you can do with Power BI. For more information and learning, including an article that shows you how to sign up for the service, check out the following resources:

* [Sign up for Power BI for US Government](service-govus-signup.md)
* <a href="https://channel9.msdn.com/Blogs/Azure/Cognitive-Services-HDInsight-and-Power-BI-on-Azure-Government">Power BI US Government Demo</a>
* [Guided Learning for Power BI](guided-learning/gettingstarted.yml#step-1)
* [Get started with the Power BI service](service-get-started.md)
* [Getting started with Power BI Desktop](desktop-getting-started.md)

