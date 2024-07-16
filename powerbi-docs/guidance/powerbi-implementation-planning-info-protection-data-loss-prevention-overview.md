---
title: "Power BI implementation planning: Information protection and data loss prevention"
description: "An introduction to the information protection and data loss prevention for Power BI articles."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 09/29/2023
---

# Power BI implementation planning: Information protection and data loss prevention

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article introduces the Power BI information protection and data loss prevention (DLP) articles. These articles are targeted at multiple audiences:

- **Power BI administrators:** The administrators who are responsible for overseeing Power BI in the organization. Power BI administrators need to collaborate with information security teams and other relevant teams.
- **Center of Excellence, IT, and BI teams:** The teams that are responsible for overseeing Power BI in the organization. They might need to collaborate with Power BI administrators, information security teams, and other relevant teams.

> [!IMPORTANT]
> Information protection and DLP is a significant organization-wide undertaking. Its scope and impact are far greater than Power BI alone. This type of initiative requires funding, prioritization, and planning. Expect to involve several cross-functional teams in your planning, usage, and oversight efforts.

As someone who manages Power BI for your organization, you won't usually be directly responsible for most aspects of information protection and DLP. It's likely those responsibilities will fall to the information security team and other system administrators.

The focus for this set of articles includes:

- **Why:** Why these capabilities are important for compliance and auditing.
- **What:** An overview of what the end-to-end process involves.
- **Who:** Which teams participate in the end-to-end process.
- **Prerequisites:** The things that need to be in place before the information protection and DLP capabilities can be enabled for Power BI.


> [!IMPORTANT]
> The **Power BI administrator** role has been renamed. The new name of the role is **Fabric administrator**.

## Protect organizational data

Data exists in many applications and services. It's stored in source databases and files. It's published to the Power BI service. It also exists outside the Power BI service as original files, downloaded files, and exported data. When data becomes more accessible and across more resources, the way you go about [protecting data](/power-bi/enterprise/service-security-data-protection-overview) becomes increasingly important.

In short, protecting data is about:

- Safeguarding organizational data.
- Reducing the risk of unauthorized or unintentional sharing of sensitive information.
- Strengthening compliance status for regulatory requirements.

Protecting data is a complex subject. At a high level, topics relevant to Power BI include:

- **Responsible actions taken by users:** Users who have received guidance and training, and clearly understand what's expected of them, can act ethically. They can enact a culture that values security, privacy, and compliance during the normal course of their work.
- **Right-sized user security permissions:** In Power BI, securing data and reports is separate and distinct from the information protection and DLP activities described in these articles. [Security](whitepaper-powerbi-security.md) methods in Power BI include techniques such as workspace roles, sharing, app permissions, and row-level security (RLS). Security techniques, such as workspace roles, app permissions, per-item sharing, and RLS, are covered in the [security planning](powerbi-implementation-planning-security-overview.md) articles.
- **Data lifecycle management:** Processes such as backups and version control are important for protecting data. The setup of [encryption keys](/power-bi/enterprise/service-encryption-byok) and geographic locations for [data storage](powerbi-implementation-planning-tenant-setup.md#location-for-data-storage) also are considerations.
- **Information protection:** Labeling and classifying content by using sensitivity labels is the first step towards being able to protect it. Information protection is covered in this series of articles.
- **Data loss prevention policies:** DLP refers to controls and policies that reduce the risk of data leakage. Data loss prevention is covered in this series of articles.

The information protection and DLP series of articles focus on the final two bullet points: information protection and DLP, and specifically how they relate to Power BI.

We recommend that you also become familiar with the full [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) framework: know your data, protect your data, prevent data loss, and govern your data.

> [!TIP]
> Your organization's IT department will have existing processes in place that are considered information protection, but they're out of scope for this series of articles. Processes could include high availability and disaster recovery efforts related to source database systems. They could also include protecting mobile devices. Be sure to identify and involve relevant technology and governance teams in all your planning efforts.

## Common use cases

Power BI compliance challenges and regulatory reporting requirements are frequently a driving factor for getting started with information protection and DLP.

> [!TIP]
> Data leakage refers to the risk of data being viewed by unauthorized users. The term is often used when referring to external users. However, it can apply to internal users too. Reducing the risk of data leakage is usually a top priority for information protection and DLP efforts. All the use cases listed in this section can help reduce data leakage.

This section includes common use cases that would compel an organization to implement information protection and DLP. The use cases focus primarily on Power BI, although the advantages to the organization are much broader.

### Classify and label data

Organizations commonly have external or internal requirements for classifying and labeling content. The use of sensitivity labels in Power BI (and in other organizational applications and services as well) is a key factor in meeting compliance requirements.

Once you assign a sensitivity label to content in Power BI, you're able to gain knowledge and insight about:

- Whether sensitive data is contained in a Power BI workspace.
- Whether a particular Power BI item, like a semantic model—[previously known as a dataset](../connect-data/service-datasets-rename.md), is considered confidential.
- Who can access Power BI items that are considered sensitive.
- Who has accessed sensitive data in the Power BI service.

With end-to-end protection, sensitivity labels can (optionally) be automatically inherited from data sources. Label inheritance reduces the risk of users accessing and sharing sensitive data with unauthorized users because it wasn't labeled.

When exported from the Power BI service, sensitivity labels are retained when content is exported to supported file types. The retention of the label when content is exported is another key factor in reducing data leakage.

For more information about labeling and classifying Power BI content, see [Information protection for Power BI](powerbi-implementation-planning-info-protection.md).

### Educate users

As stated previously, one aspect of protecting data involves responsible actions taken by users.

Because sensitivity labels are clearly displayed in plain text, they serve as helpful reminders to users. During the normal course of their work, labels raise awareness about how users should interact with data according to organizational guidelines and policies.

For example, when a user sees a _Highly Confidential_ sensitivity label, it should prompt them to take extra care with their decisions about downloading, saving, or sharing the content with others. In this way, sensitivity labels help users responsibly handle sensitive data and reduce risk that it's shared by mistake with unauthorized users.

For more information, see [Information protection for Power BI](powerbi-implementation-planning-info-protection.md).

### Detect sensitive data

The ability to detect where sensitive data is stored is another important aspect of data leakage.

When a dataset has been published to the Power BI service and it's in a Premium workspace, you can use DLP for Power BI to detect the existence of certain sensitive information types within it. This capability is helpful to find sensitive data (such as financial data or personal data) that are stored in Power BI semantic models.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

This type of DLP policy for Power BI allows security administrators to monitor and detect when unauthorized sensitive data is uploaded to the Power BI service. They can depend on alerts to act quickly. Policy tips are also used to guide content creators and owners on how to properly handle sensitive data. For more information about DLP for Power BI, see [Data loss prevention for Power BI](powerbi-implementation-planning-data-loss-prevention.md).

> [!TIP]
> Having properly classified data allows you to correlate, analyze, and report on it. In most cases, you'll need to correlate data from multiple sources to form a complete understanding. You can capture data by using tools like the [Power BI scanner APIs](/fabric/governance/metadata-scanning-overview) and the [Power BI activity log](/power-bi/enterprise/service-admin-auditing). For more information about these topics, as well as audit logs in the Microsoft Purview compliance portal, see [Auditing of information protection and data loss prevention for Power BI](powerbi-implementation-planning-auditing-info-protection-data-loss-prevention.md).

### Use data encryption

Files that are classified with a sensitivity label can (optionally) include protection. When a file is protected with encryption, it reduces the risk of data leakage and oversharing. The encryption setting follows the file, regardless of device or user. Unauthorized users (internal and external to the organization) are unable to open, decrypt, or view the file contents.

> [!IMPORTANT]
> There are trade-offs you should understand when implementing encryption. For more information, including encryption considerations, see [Information protection for Power BI](powerbi-implementation-planning-info-protection.md).

For more information about the types of controls you can implement to reduce data leakage, see [Defender for Cloud Apps for Power BI](powerbi-implementation-planning-defender-for-cloud-apps.md).

### Control activity in real time

To augment existing [security settings in Power BI](whitepaper-powerbi-security.md), you can implement real-time controls to reduce the risk of data leakage.

For example, you can restrict users from downloading highly sensitive data and reports from the Power BI service. This type of real-time control is helpful when someone is allowed to view content themselves, but they should be prevented from downloading and distributing it to others.

For more information about the types of controls you can implement, see [Defender for Cloud Apps for Power BI](powerbi-implementation-planning-defender-for-cloud-apps.md).

> [!TIP]
> For additional considerations related to strengthening Power BI compliance, see the [security planning](powerbi-implementation-planning-security-overview.md) articles.

## Information protection and DLP services

Many features and services related to information protection and DLP have been rebranded and now form part of Microsoft Purview. The Microsoft 365 security and compliance functionality has also become part of Microsoft Purview.

The features and services that are most pertinent for this series of articles include:

- **Microsoft Purview Information Protection** (formerly known as Microsoft Information Protection): [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) includes capabilities for discovering, classifying, and protecting data. A key principle is that data can be better protected once it's classified. The key building blocks for classifying data are sensitivity labels, which are described in the [Information protection for Power BI](powerbi-implementation-planning-info-protection.md) article.
- **Microsoft Purview compliance portal** (formerly known as the Microsoft 365 compliance center): The [portal](/microsoft-365/compliance/microsoft-365-compliance-center?) is where you set up sensitivity labels. It's also where you set up Power BI for DLP, which is described in the [Data loss prevention for Power BI](powerbi-implementation-planning-data-loss-prevention.md) article.
- **Microsoft Purview Data Loss Prevention** (formerly known as Office 365 Data Loss Prevention): DLP activities focus primarily on reducing data leakage. By using sensitivity labels or sensitive information types, Microsoft Purview Data Loss Prevention policies help an organization locate sensitive data and protect it. Capabilities relevant to Power BI are described in the [Data loss prevention for Power BI](powerbi-implementation-planning-data-loss-prevention.md) article.
- **Microsoft Defender for Cloud Apps** (formerly known as Microsoft Cloud App Security): Policies in Microsoft Defender for Cloud Apps (which are defined in a separate application) also help protect data, including real-time controls. Capabilities relevant to Power BI are described in the [Defender for Cloud Apps for Power BI](powerbi-implementation-planning-defender-for-cloud-apps.md) article.

The above list isn't exhaustive. Microsoft Purview includes a broad set of capabilities that far exceeds the scope of this series of articles. For example, the Microsoft Purview data cataloging and governance features are important; however, they're not directly in scope for this series of articles.

> [!TIP]
> If you have questions about services, features, or licensing, contact your Microsoft account team. They're in the best position to clarify what's available for your organization.

The remainder of the information protection and DLP content is organized into the following articles:

- [Organization-level information protection](powerbi-implementation-planning-organization-level-info-protection.md)
- [Information protection for Power BI](powerbi-implementation-planning-info-protection.md)
- [Data loss prevention for Power BI](powerbi-implementation-planning-data-loss-prevention.md)
- [Defender for Cloud Apps for Power BI](powerbi-implementation-planning-defender-for-cloud-apps.md)
- [Auditing of information protection and data loss prevention for Power BI](powerbi-implementation-planning-auditing-info-protection-data-loss-prevention.md)

## Related content

In the [next article in this series](powerbi-implementation-planning-organization-level-info-protection.md), learn about getting started with information protection with organization-level planning activities for Power BI.
