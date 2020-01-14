---
title: Power BI for US Government customers - Overview
description: US Government customers can add a Power BI Pro subscription to their Office 365 government plan. Learn how to sign up and review feature availability in this service description. 
author: kfollis
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 01/13/2020
ms.author: kfollis


LocalizationGroup: Get started
---

# Power BI for US Government customers
This article is for US government customers who are deploying Power BI as part of an Office 365 Government plan. Government plans are designed for the unique needs of organizations that must meet US compliance and security standards. The Power BI service designed for US Government customers differs from the commercial version of the Power BI service. These feature differences and capabilities are described in the following sections.

## Add Power BI to your Office 365 Government plan

Before you can get a Power BI US Government subscription and assign licenses to users, you have to enroll in an Office 365 Government plan. If your organization already has an Office 365 Government plan, skip ahead to [Purchase a Power BI Pro Government subscription](#purchase-a-power-bi-pro-government-subscription).

### Enroll in Office 365 Government plan

If you're a new customer, you have to validate your organization’s eligibility before you can sign up for a government plan.  Get started by completing the [Office 365 for Government eligibility validation form](https://www.microsoft.com/microsoft-365/government/eligibility-validation). To ensure that you select the right plan for your organization, consult the [Office 365 US Government service descriptions](https://docs.microsoft.com/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/office-365-us-government).

> [!NOTE]
> If you’ve already deployed Power BI to a commercial environment and want to migrate to the US Government cloud, you’ll need to add a new Power BI Pro subscription to your Office 365 Government plan. Next, replicate the commercial data to the Power BI service for US Government, remove commercial license assignments from user accounts, and then assign a Power BI Pro Government license to the user accounts.
>
>

### Government cloud instances
Office 365 provides different environments for government agencies to meet varying compliance requirements. Consult the linked service descriptions for specific details about what each environment provides.

* [Office 365 Government Community Cloud (GCC)](https://docs.microsoft.com/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc) is designed for federal, state, and local government.

* [Office 365 Government Community Cloud High (GCC-High)](https://docs.microsoft.com/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod) is designed for federal agencies, defense industry, aerospace industry, and other organizations holding controlled unclassified information. This environment is suited for national security organizations and companies with International Traffic in Arms Regulations (ITAR) data or Defense Federal Acquisition Regulations Supplement (DFARS) requirements.

* The [Office 365 DoD environment](https://docs.microsoft.com/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod) is designed exclusively for the US Department of Defense. 

### Purchase a Power BI Pro Government subscription

After you have deployed Office 365, you can add a Power BI subscription. Follow the step-by-step guidance in [Enroll your US Government organization](service-govus-signup.md#existing-office-government-cloud-customers) to purchase the Power BI Pro Government service. Buy enough licenses for all the users who need to use Power BI, then assign those licenses to individual user accounts.

> [!IMPORTANT]
> Power BI US Government is not available as a Free license. Each user must be assigned a Pro license in order to access the government community cloud. If a user account has a Free license assigned, they’re authorized to access only the commercial cloud and will encounter authentication and access issues. To review differences between license types, see [Power BI service features by license type](service-features-license-type.md).
>
>

## Connect to Power BI for US Government

You use a different URL to connect to Power BI for US government than commercial users. To sign in to Power BI, use the following URLs:

| Commercial version URL | US Government version URL | US Government URL for GCC High |
| --- | --- | --- |
| https://app.powerbi.com/ |[https://app.powerbigov.us](https://app.powerbigov.us) | [https://app.high.powerbigov.us](https://app.high.powerbigov.us) |

Your account may be provisioned to more than one cloud. In that case, when using Power BI Desktop, you can choose which cloud to connect to when you sign in.

## Connectivity between Government and global Azure Cloud services

Azure is distributed across multiple clouds. By default, you can enable firewall rules to open a connection to a cloud-specific instance, but cross-cloud networking is different.  To communicate between services in the public cloud and services in the Government Community Cloud, you have to configure specific firewall rules. For example, if you want to access public cloud instances of SQL from your government cloud deployment of Power BI, you need a firewall rule in SQL. Configure specific firewall rules in SQL to allow connections to the Azure Government Cloud for the following datacenters:

* USGov Iowa
* USGov Virginia
* USGov Texas
* USGov Arizona

In the public cloud, the IP ranges are available. To get the US Government cloud IP ranges, download the [Azure IP Ranges and Service Tags – US Government Cloud](https://www.microsoft.com/download/details.aspx?id=57063) file. 

To set up firewalls in SQL, follow the steps to [Create and manage IP firewall rules](https://docs.microsoft.com/azure/sql-database/sql-database-firewall-configure#create-and-manage-ip-firewall-rules).

## Power BI feature availability

To accommodate the requirements of government cloud customers, there are some differences between government plans and commercial plans. Refer to the following table to see which features are available in each government environment.

|Feature |   |GCC |GCC-High |DoD|
|------|------|------|------|------|
|Administration|Free licenses|Not available|Not available|Not available|
|  |Set data storage limits|Available|Available|Available|
|  |Use Active Directory groups for sharing and access control|Available|Available|Available|
|  |Auditing through Office 365 Security and Compliance admin center|Available|Available|Available|
|  |External user sharing|Available|Available|Available|
|  |Usage metrics for reports and dashboards|Not available|Not available|Not available|
|  |Azure B2B between GCC and commercial cloud|Not available|Not available|Not available|
|Report creation|Create and view dashboards and reports|Available|Available|Available|
|  |Scheduled data refresh|Available|Available|Available|
|  |Refreshable team dashboards|Available|Available|Available|
|  |Paginated reports|Available (not available in USGov Texas)|Available|On the roadmap|
|  |Template apps|Not available|Not available|Not available|
|Connect to data|Import data and reports from Excel|Available|Available|Available|
|  |Import data from CSV files|Available|Available|Available|
|  |Import data from Power BI desktop files|Available|Available|Available|
|  |Connectivity to CDS|Not available|Not available|Not available|
|  |Azure Data Lake Storage Gen2 connector|Not available|Not available|Not available|
|Data management|Data management gateway|Available|Available|Available|
|  |Data encryption in Azure SQL|Available|Available|Available|
|  |Data encryption in Blob Storage for Power BI|Available|Available|Available|
|Cross-product integration|Embed in SharePoint Online using the Power BI web part|Not available|Not available|Not available|
|  |Embed in SharePoint Online using Embed web part|Available|Available|Available|
|  |Dataflows and AI functions|Not available|Not available|Not available|
|  |Power Automate connectivity for data-driven alerts||Not available|Not available|Not available|
|  |Power BI tab in Teams|Not available|Not available|Not available|

## Next steps

* [Sign up for Power BI for US Government](service-govus-signup.md)
* <a href="https://channel9.msdn.com/Blogs/Azure/Cognitive-Services-HDInsight-and-Power-BI-on-Azure-Government">Power BI US Government Demo</a>
* [Get started with the Power BI service](service-get-started.md)
* [What is Power BI Desktop?](desktop-what-is-desktop.md)

