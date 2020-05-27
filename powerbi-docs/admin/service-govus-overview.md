---
title: Power BI for US government customers - Overview
description: US government customers can add a Power BI Pro subscription to their Microsoft 365 government plan. Learn how to sign up and review feature availability in this service description. 
author: kfollis
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 04/07/2020
ms.author: kfollis

LocalizationGroup: Get started
---

# Power BI for US government customers
This article is for US government customers who are deploying Power BI as part of a Microsoft 365 Government plan. Government plans are designed for the unique needs of organizations that must meet US compliance and security standards. The Power BI service that's designed for US government customers differs from the commercial version of the Power BI service. These feature differences and capabilities are described in the following sections.

## Add Power BI to your Microsoft 365 Government plan

Before you can get a Power BI US government subscription and assign licenses to users, you have to enroll in a Microsoft 365 Government plan. If your organization already has a Microsoft 365 Government plan, skip ahead to [Buy a Power BI Pro subscription for government customers](#buy-a-power-bi-pro-subscription-for-government-customers).

### Enroll in a Microsoft 365 Government plan

If you're a new customer, you have to validate your organization's eligibility before you can sign up for a Microsoft 365 Government plan.  Get started by completing the [Microsoft 365 for Government eligibility validation form](https://www.microsoft.com/microsoft-365/government/eligibility-validation). To ensure that you're selecting the right plan for your organization, consult the [Microsoft 365 US Government service descriptions](https://docs.microsoft.com/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/office-365-us-government).

> [!NOTE]
> If you've already deployed Power BI to a commercial environment and want to migrate to the US government cloud, you'll need to add a new Power BI Pro subscription to your Microsoft 365 Government plan. Next, replicate the commercial data to the Power BI service for US government, remove commercial license assignments from user accounts, and then assign a Power BI Pro government license to the user accounts.
>
>
## Government cloud instances
Microsoft 365 provides different environments for government agencies to meet varying compliance requirements. For more information about each environment, see:

* [Microsoft 365 Government Community Cloud (GCC)](https://docs.microsoft.com/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc) is designed for federal, state, and local government.

* [Microsoft 365 Government Community Cloud High (GCC High)](https://docs.microsoft.com/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod) is designed for federal agencies, defense industry, aerospace industry, and other organizations that hold controlled unclassified information. This environment is suited for national security organizations and companies that have International Traffic in Arms Regulations (ITAR) data or Defense Federal Acquisition Regulations Supplement (DFARS) requirements.

* The [Microsoft 365 DoD environment](https://docs.microsoft.com/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod) is designed exclusively for the US Department of Defense. 

## Connect to Power BI for US government

The URL for connecting to Power BI differs for government users and commercial users. To sign in to Power BI, use the following URLs:

| Commercial version  | GCC  | GCC High | DoD |
| --- | --- | --- | --- |
| [https://app.powerbi.com/](https://app.powerbi.com) |[https://app.powerbigov.us](https://app.powerbigov.us) | [https://app.high.powerbigov.us](https://app.high.powerbigov.us) | [https://app.mil.powerbigov.us](https://app.mil.powerbigov.us) |

Your account might be set up in more than one cloud. If your account is set up that way, when you sign in to Power BI Desktop, you can choose which cloud to connect to.

## Buy a Power BI Pro subscription for government customers

After you've deployed Microsoft 365, you can add a Power BI Pro subscription. Follow the step-by-step guidance in [Enroll your US government organization](service-govus-signup.md) to buy the Power BI Pro government service. Buy enough licenses for all the users who need to use Power BI, and then assign the licenses to individual user accounts.

> [!IMPORTANT]
> Power BI US Government isn't available as a *Free* license. To access the government community cloud, each user must be assigned a *Pro* license. If a user account has been assigned a Free license, the user is authorized to access only the commercial cloud and will encounter authentication and access issues. If you've purchased Power BI Premium, you don't have to assign Pro licenses to enable user access.  Users in the organization can access reports that are shared with them as long as the reports are published to a Premium capacity. To review the differences between license types, see [Power BI service features by license type](../fundamentals/service-features-license-type.md).
>

## Connect government and global Azure cloud services

Azure is distributed across multiple clouds. By default, you can enable firewall rules to open a connection to a cloud-specific instance, but cross-cloud networking is different.  To communicate between services in the public cloud and services in the Government Community Cloud, you have to configure specific firewall rules. For example, if you want to access public cloud instances of a SQL database from your government cloud deployment of Power BI, you need a firewall rule in the SQL database. Configure specific firewall rules for SQL databases to allow connections to the Azure Government Cloud for the following datacenters:

* USGov Iowa
* USGov Virginia
* USGov Texas
* USGov Arizona

In the public cloud, the IP ranges are available. To get the US government cloud IP ranges, download the [Azure IP Ranges and Service Tags – US Government Cloud](https://www.microsoft.com/download/details.aspx?id=57063) file. 

To set up firewalls for SQL databases, see [Create and manage IP firewall rules](https://docs.microsoft.com/azure/sql-database/sql-database-firewall-configure#create-and-manage-ip-firewall-rules).

## Power BI feature availability

To accommodate the requirements of government cloud customers, there are some differences between government plans and commercial plans. To see which features are available in each government environment, refer to the following table:

|Feature |   |GCC |GCC High |DoD|
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
|  |Paginated reports|Available|On the roadmap|On the roadmap|
|  |Template apps|Not available|Not available|Not available|
|Connect to data|Import data and reports from Excel|Available|Available|Available|
|  |Import data from CSV files|Available|Available|Available|
|  |Import data from Power BI desktop files|Available|Available|Available|
|  |Connectivity to CDS|Available|Not available|Not available|
|  |Azure Data Lake Storage Gen2 connector|Available|Not available|Not available|
|Data management|Data management gateway|Available|Available|Available|
|  |Data encryption in Azure SQL Database|Available|Available|Available|
|  |Data encryption in Blob Storage for Power BI|Available|Available|Available|
|Cross-product integration|Embed in SharePoint Online using the Power BI web part|Not available|Not available|Not available|
|  |Embed in SharePoint Online using Embed web part|Available|Available|Available|
|  |Dataflows and AI functions|Not available|Not available|Not available|
|  |Power Automate connectivity for data-driven alerts|Not available|Not available|Not available|
|  |Power BI tab in Teams|Available|Not available|Not available|
|  |Automated Machine Learning|Not available|Not available|Not available|
|  |Azure Cognitive Services|Not available|Not available|Not available|
|  |Azure Machine Learning|Not available|Not available|Not available|

## Next steps

* [Sign up for Power BI for US government](service-govus-signup.md)
* [Microsoft Power Apps US Government](https://docs.microsoft.com/power-platform/admin/powerapps-us-government)
* [Power Automate US Government](https://docs.microsoft.com/power-automate/us-govt)
* <a href="https://channel9.msdn.com/Blogs/Azure/Cognitive-Services-HDInsight-and-Power-BI-on-Azure-Government">Power BI US Government Demo</a>
